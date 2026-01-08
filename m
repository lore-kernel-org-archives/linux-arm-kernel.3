Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AD6CF6AB8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLV/N1gRfyoSdsigI63286V9LuEqtSqemwzMJs1gXA0=; b=dHWqfVi1wF3bWUhgOg0PcsjJ/H
	Mc/e1yE3X+eO8XJGkr51/V2scv5u+W59SlRraLjY3g9mQydqjn04JEqWvN37tfdeZT6L0ZKLtwulU
	fJGLA85gM8wyW2ldTnlh6Ltt4h24iV65xRcXLQvVlh2iHyejLuvjV2VUHoDQbKtTkT+S2d/5dvxC1
	uDVqk2vzCC7erarybQ9/gW4IlF+nY2CWolnIMBDStweZiTmBy+I/VrWJ6VCq9lm7MNdH9ypUU8TN7
	RmkEhmNtfDmMDHpX1GpY3fURAOX01ENenUZYhc4HtyjvGt6y1HQRDFU3nZW8RSxl/WNfvO+IT+lmw
	9HcYQ6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmbp-0000000GVt8-0jAn;
	Thu, 08 Jan 2026 09:47:13 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmbm-0000000GVrh-1BlQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 09:47:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zLV/N1gRfyoSdsigI63286V9LuEqtSqemwzMJs1gXA0=;
	b=kXCcqa1aHctqT4euMXdIU0ORE41iPNxE1HNSVDkNSCv/pJpgWKNBxIJ34Md/7DjKifQcmA4XL
	lveQxHh/SeqzLeYynesfQtI8Jb5bGnGU/HTlXbbTzWf6LZWKvHTiUdZiYmB/cMuVEkfE3iTjokf
	UcAGgsZLyiV9AA+YlP8Jrqc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dn0My53wCzLlXJ;
	Thu,  8 Jan 2026 17:43:42 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 135A8402AB;
	Thu,  8 Jan 2026 17:46:58 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 17:46:57 +0800
Subject: Re: [PATCH v6] ACPI: AGDI: Add interrupt signaling mode support
To: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Will Deacon <will@kernel.org>, Sudeep Holla
	<sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Catalin
 Marinas <catalin.marinas@arm.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Koichi Okuno <fj2767dz@aa.jp.fujitsu.com>
References: <20260108075636.524722-1-fj1078ii@aa.jp.fujitsu.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <fc3fec3c-651a-f64e-e62a-3a49c2d22c9d@huawei.com>
Date: Thu, 8 Jan 2026 17:46:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20260108075636.524722-1-fj1078ii@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_014710_843216_9EB33C92 
X-CRM114-Status: GOOD (  13.45  )
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

On 2026/1/8 15:56, Kazuhiro Abe wrote:
> AGDI has two types of signaling modes: SDEI and interrupt.
> Currently, the AGDI driver only supports SDEI.
> Therefore, add support for interrupt signaling mode.
> The interrupt vector is retrieved from the AGDI table, and call panic
> function when an interrupt occurs.
> 
> Acked-by: Hanjun Guo <guohanjun@huawei.com>
> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> 
> ---
> This patch (v6) has been rebased to align with the 6.19-rc4 release.
> There are no functional changes since v4.
> It has been tested and confirmed to work without issues.
> Please let us know if you have any questions or concerns.
> Thank you, Will, for taking care of the mistake in v5.
> 
> v5->v6
>   - Rebase to 6.19-rc4.
>   - Correct the mistake in v5.

Take a review again, and the mistake is gone.

Thanks
Hanjun

