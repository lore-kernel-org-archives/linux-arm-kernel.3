Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090E4CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eRsfa2WSVOeZdp9XJycZlUSijfgD6aDUQXrC6J6R3o=; b=4nKPF2r5W0BNLbd2wNhaSPAXXC
	VzEX52NIoxhd7TV6IIxdSQygiafqNJ8T9QPngUPTPyXDnsQGTqH0W1iIr8lTzkItLier/4ZOLjL26
	EAJA0ZIEy/TS3D1Grfucti6vKNSMlvoCFFbvwlIgYtMg/Tt/QwFQZtueeoWEKutkiVno2TkQmZHTI
	grxzvhQZwrzQyHByA5JEMV3pUgbMFxa8MN6bueh5csFJgWYdyTNk1hW9Ju60UacGpL4p6e0e8Ntlp
	5a2qW7PHLO97DywkgBulMcVojohwrx59sAKtvmVBks+ZdDJWbrICqbl+K7hL2070WgkWFjyBln/JA
	lvXoxYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyP0-0000000AQEK-3eHV;
	Mon, 03 Nov 2025 17:31:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyOy-0000000AQDf-2Qzv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:31:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 237A61D14;
	Mon,  3 Nov 2025 09:31:24 -0800 (PST)
Received: from arm.com (unknown [10.1.25.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2244C3F66E;
	Mon,  3 Nov 2025 09:31:30 -0800 (PST)
Date: Mon, 3 Nov 2025 17:31:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH V6 1/3] tools: header: arm64: Replace TCR_NFD[0|1] with
 TCR_EL1_NFD[0|1]
Message-ID: <aQjm7wmvHa79hkyi@arm.com>
References: <20251013052945.2197190-1-anshuman.khandual@arm.com>
 <20251013052945.2197190-2-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013052945.2197190-2-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_093132_679466_604B3C4E 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, Oct 13, 2025 at 10:59:43AM +0530, Anshuman Khandual wrote:
> Replace TCR_NFD[0|1] (used in TCR_CLEAR_FUJITSU_ERRATUM_010001) with field
> definitions which are available in tool sysreg format. Helps in completely
> dropping off the adhoc TCR_NFD[0|1] macros later.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  tools/arch/arm64/include/asm/cputype.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> index 139d5e87dc95..dfa12df5e290 100644
> --- a/tools/arch/arm64/include/asm/cputype.h
> +++ b/tools/arch/arm64/include/asm/cputype.h
> @@ -243,7 +243,7 @@
>  /* Fujitsu Erratum 010001 affects A64FX 1.0 and 1.1, (v0r0 and v1r0) */
>  #define MIDR_FUJITSU_ERRATUM_010001		MIDR_FUJITSU_A64FX
>  #define MIDR_FUJITSU_ERRATUM_010001_MASK	(~MIDR_CPU_VAR_REV(1, 0))
> -#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_NFD1 | TCR_NFD0)
> +#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_EL1_NFD1 | TCR_EL1_NFD0)

Isn't this file usually updated automatically (well, someone running a
script to sync) from the corresponding arch/arm64/ one?

-- 
Catalin

