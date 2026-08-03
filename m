Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD51C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7ptxlbVknmNW7F+K3VHZoTIu+6logC+Y1ggbSuL5ms=; b=aNuWfBrUlyQOb8dPAnKd4tEJyF
	TKT0V/LY1KDVOoMa92ZEZe2C5O6NLbmzajkj1pdm9PN7cQzDbv1x5pChoTQ+OR2EhaT5ATnUZtksq
	ZJLUkd3huWw51l1aEgIFS0SBFdpieVhcASfO51O5DZQSWBlMYTW4YYIQZxdyWxXM8KB92yKzGqWJs
	FNzOmQQFf2y0BJ/4uEkGHSqrnO00tHLyc6Uk4ge5sTfMG7all9jbXD/wLieDd1p4LovY/iJ5vosIf
	Hd4HFtOiahtKVGUIXGRhMmaDci2GULZn66wJICq5vlO+Mh5R4chx/NiuD5oK7TWDSjllXcUQ5ak0X
	4ebcwLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrsA-0000000H2LP-3QcT;
	Mon, 03 Aug 2026 12:34:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrs8-0000000H2Kp-1PSx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:34:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A4F8143D;
	Mon,  3 Aug 2026 05:34:19 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383213F66F;
	Mon,  3 Aug 2026 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785760463; bh=2+8flskoFARB8nuzjiAmo0VgI43p+eHd0pHgYF0ugNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fsggf3sjTOd8QEtip5kjwavOj0QrCSJEGFJMvQXKZdTybThEGhr9qiHvDmKkSOUCA
	 uBH9oQfKHcD4KrdQxmVfE0Mx9B0fXlLLkLsU4WrW01zEECYsvwH0SJ9YCUCdzZsmRb
	 B/l+XNqy/jL8PKxD91xkdk8fsSTg66FzI44j4YcE=
Message-ID: <560521d0-7ae5-465e-9a3f-8178804c93ee@arm.com>
Date: Mon, 3 Aug 2026 13:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 41/45] irqchip/gic-v3: Prepare for FEAT_GICv3_NMI
 support
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-42-vladimir.murzin@arm.com>
 <a61ab3b2-eacb-4988-9f35-4ade98fa9489@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <a61ab3b2-eacb-4988-9f35-4ade98fa9489@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_053424_415142_05EF42A7 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/28/26 13:29, Jinjie Ruan wrote:
> The title "irqchip/gic-v3: Rename *nmi* to *pseudo_nmi*" will be more clear
> 

Fair enough. I'll update in the next version.

> otherwise LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks
Vladimir

