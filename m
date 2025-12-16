Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E8D5E13D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQRZUmfcmj8++GDqdfVsYF2/gcknHbeN49uCm+Yftqw=; b=Zq8CmWRPrmnl5gU+lBUAxZfMWo
	zAhqrP0F7sYL7kyJHqEWe7+JdtGHR6FVOXF/oiBSInSpcyHyChkoxNjTRgvq/ViBtIOF4UeS6JdPM
	H7E+eovQPmHL3N42zgi3RRsF7+a5N+mclx8hZBrz0SoeuZEZj5RTtoaReEiaH4CoU1qgm2nEAGf3e
	YVH1mK2/FhfBw+XYzgNfETXOlQMosVFq0sAtwecPfAxsRSt8aZy5A1yib99oYjZ5DYGIzLVEHkZVT
	RvYyT1M5kgEU5ov6tdg+MAdxYOEtHP7CSsxyTQhhh0VKdUr4t/Ly6jF8ykPcWPQNk1yn8cXPL8rI7
	42vrCecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMu-00000005g6r-4AOY;
	Tue, 16 Dec 2025 18:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMp-00000005g2i-3vhN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zQRZUmfcmj8++GDqdfVsYF2/gcknHbeN49uCm+Yftqw=; b=o15uOL00w+ZJAmNYZgOJ7UJdIL
	I0312t+BpCCynnB/G61Dz+RqXuk0a3lStwfAj0xLYRY2ClxXuE2aIhEeKsPfBXizsNiDXHprlHGGD
	KOvx8mH0XFGhzC3TJgj4Etnd7w/FrkPZ3/7c+/gbGE/GFAVD7QYXn9gKyFUsEtNhq0OsfNxwrEohw
	1upWJdWVHCBuZqD01XE6ZvOiVK69mgZa1F9SNkDQr4aFVyZgtxlgQcqrD8jp+D1ewTvuqgfmCJd1k
	QQQbA2AatyKxDfMdqArK4SLWeorGFNX+Evu1vOSeh162mWPF2J8tshs80r5kw1uHEXfz8RffLGE7m
	OSJW5wUQ==;
Received: from sinmsgout03.his.huawei.com ([119.8.177.38])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYVI-00000005KBP-1Or6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:06:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zQRZUmfcmj8++GDqdfVsYF2/gcknHbeN49uCm+Yftqw=;
	b=NtUWa42Y7L5xQ4fkNRYLeLUyn2w/O7cHHrnJ3f8SG/RCIyePDUEOtosoC7N7XpVZDHUW3FV1a
	XeLJ8c7pfeJqgFo/CGvb7rk4nrW08ygjS0IOY+06uN9YzHhKCRvG6INMawkw4FcFHch0AMzPVa/
	is3kt4g4DQYqPRB2bXs0L/A=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dW4Sr1pCszN0yd;
	Wed, 17 Dec 2025 01:59:40 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dW4VD4VSZzJ46DQ;
	Wed, 17 Dec 2025 02:00:52 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id AE73040539;
	Wed, 17 Dec 2025 02:01:20 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 16 Dec
 2025 18:01:19 +0000
Date: Tue, 16 Dec 2025 18:01:18 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Dev Jain
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 03/13] arm64: mm: Implicitly invalidate user ASID
 based on TLBI operation
Message-ID: <20251216180118.00005085@huawei.com>
In-Reply-To: <20251216144601.2106412-4-ryan.roberts@arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
	<20251216144601.2106412-4-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170629_694739_33862CC9 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, 16 Dec 2025 14:45:48 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> When kpti is enabled, separate ASIDs are used for userspace and
> kernelspace, requiring ASID-qualified TLB invalidation by virtual
> address to invalidate both of them.
> 
> Push the logic for invalidating the two ASIDs down into the low-level
> tlbi-op-specific functions and remove the burden from the caller to
> handle the kpti-specific behaviour.
> 
> Co-developed-by: Will Deacon <will@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index c5111d2afc66..31f43d953ce2 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h

> +#undef __tlbi_user
>  #endif
> -
Hi Ryan,

It's trivial Tuesday so... Unrelated white space change.

>  #endif


