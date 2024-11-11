Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767FBD3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQw70jFvuXYdTZwcdyKe95m4F0F8qYfh17sqc59kXHQ=; b=0mlTCaF+X3Pp1V4hpG5P+Os/qm
	mhexOvqdR/wCnWIpgon/lyCsvJweEIAf6Y2lr9o6kqgllDPwu301WlFFCxpW8lcAx2an+Fc4NXHuZ
	X6LixCgD885H8UAarPIpC2OU+vMiukplN6Yfd2KSL4GawjvCfgoU2dya+7TTJdTUzgcyUc7bVy6rY
	VK3L29I3LOVFRnTz6Tazt93p6CkOAmojJqRFGDLTKLPXwO7d3bVXcAuwb8TXmd39SUcYFGZBgxT8O
	vea0rM9P8jXbB+R0GyXHkoPz5FS9O2ZKXc60ujnO4Ci5U8+19JHtSt86Y/1K75/v4er4ZP1EpR34G
	Onbt5QEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaLI-000000015im-3Aqm;
	Mon, 11 Nov 2024 19:44:56 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaJV-000000015ZM-0m7z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:43:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731354179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQw70jFvuXYdTZwcdyKe95m4F0F8qYfh17sqc59kXHQ=;
	b=mwkyHDJQviuWAcb80iDB3X9aBED1OBejINpKT9VbC03LzYC9O93CXrzIyDsv4a18kw+ZEW
	kbNHQ+LMHAS4uHmqIQcrSI+AQrBIrVArwIVUpU35VvqfrqDBfA9LokFqNAIPfAYS7K2nqB
	9aXqo/LRL85pqyrVUGv6E/psTucrhbg=
From: Oliver Upton <oliver.upton@linux.dev>
To: maz@kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	kvmarm@lists.linux.dev
Cc: Oliver Upton <oliver.upton@linux.dev>,
	wangzhou1@hisilicon.com,
	joey.gouly@arm.com,
	james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linuxarm@huawei.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	sebott@redhat.com
Subject: Re: [PATCH v2] KVM: arm64: Make L1Ip feature in CTR_EL0 writable from userspace
Date: Mon, 11 Nov 2024 19:41:56 +0000
Message-ID: <173135408547.2760967.16338422848283490083.b4-ty@linux.dev>
In-Reply-To: <20241022073943.35764-1-shameerali.kolothum.thodi@huawei.com>
References: <20241022073943.35764-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_114305_540214_584D8581 
X-CRM114-Status: UNSURE (   7.72  )
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

On Tue, 22 Oct 2024 08:39:43 +0100, Shameer Kolothum wrote:
> Only allow userspace to set VIPT(0b10) or PIPT(0b11) for L1Ip based on
> what hardware reports as both AIVIVT (0b01) and VPIPT (0b00) are
> documented as reserved.
> 
> Using a VIPT for Guest where hardware reports PIPT may lead to over
> invalidation, but is still correct. Hence, we can allow downgrading
> PIPT to VIPT, but not the other way around.
> 
> [...]

Sorry I didn't grab this earlier, for some reason I'm not getting your mail
at my linux.dev address.

Applied to kvmarm/next, thanks!

[1/1] KVM: arm64: Make L1Ip feature in CTR_EL0 writable from userspace
      https://git.kernel.org/kvmarm/kvmarm/c/e9b57d7f9740

--
Best,
Oliver

