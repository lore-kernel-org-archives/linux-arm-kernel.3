Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA0CCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMEyrnTZMfezx6Qzd8H4nHlvTgUCaj9Fp8iF5f9liUo=; b=TMLTinl9MxsKG7GKWB79qZaR6r
	V+/FUrf4mdNTdtcpNkJveWDJxCyvgw0DkEJAm6FsH+1xvzb9U10y7rxR/0GcqpGAq/q7ha3w/Svhq
	rBiQ4j9HlO9PB5X6cpsfSyiew/iSGaPBEbK/Gv0Eb7MRzCG1V4luDnijksIeiR3yiLQpAU5zZtlVf
	pu8RXN05Pq1EBs9T34QCBXSKnbovRSUOvV96GFjkW7lr8HKA3CT/oj8KFy53/cAD0Z2oPX5pmHjzr
	QzjiyA4ZoUJddblT9YbbFXTrrOklgICUzhQHG4fc6NGp6Rmf8mvzro1V1pc/UtU9SpnQG0K3VvPjr
	m5E3td0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELWk-00000001oYT-3eGF;
	Wed, 07 Oct 2026 06:53:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELWi-00000001oY6-0bTN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:53:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5218A152B;
	Tue,  6 Oct 2026 23:53:15 -0700 (PDT)
Received: from [192.168.11.117] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D4C73F86F;
	Tue,  6 Oct 2026 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791355998; bh=BeZyRv5V+EawynYY/vTt+PSDdo/4ZnBflwZeO/+9/qU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qkGdW+M3xHFPeuX/sxx88Ud/nuOCPPoXGAFLhsD4SUj7XeXlCSaOO+dPHq73FDPI+
	 WIPY4/67LH/lhDwn6zzvVC3+MLuKnx+PNFBBlNiwrtJLZxjFLNCYtdf11Thow7fiyC
	 CzHGgv+yinka9pBnoLZvPt0LLxKPttV/CSQHsToE=
Message-ID: <f0acf203-2cb4-4cda-8e12-c45d02d7499e@arm.com>
Date: Wed, 7 Oct 2026 07:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: insn: operate on MSR/MRS sysreg field via
 defines
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi
 <vsethi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Lucas Wei <lucaswei@google.com>, Barry Song <baohua@kernel.org>,
 Oliver Upton <oupton@kernel.org>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
 <20260928133034.243541-6-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260928133034.243541-6-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_235320_318565_66859D2F 
X-CRM114-Status: GOOD (  17.17  )
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

Hi Ada,

On 9/28/26 14:30, Ada Couprie Diaz wrote:
> Replace the few instances of hard-coded system register offset and masks
> used to operate on MSR/MRS instructions with defines.
> This will allow re-use in future commits while making the connection
> between those values more explicit.
> 
> While we are here, mark `aarch64_insn_extract_system_reg()` `noinstr`
> so it can be safe to use in alternative pacthing callbacks.
> 
> Changing the mask used in `aarch64_insn_gen_mrs()` to exclude
> the lower bits does not change behaviour,
> as `aarch64_insn_encode_register()` already clears the bits
> used to encode the target register.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/insn.h | 3 +++
>  arch/arm64/lib/insn.c         | 8 ++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 40f13d28a5fd7..03620f67a3e47 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -753,6 +753,9 @@ static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
>  	return insn;
>  }
>  
> +#define AARCH64_INSN_SYSREG_OFFSET	5
> +#define AARCH64_INSN_SYSREG_MASK	GENMASK(19, 5)
> +

Sashiko has raised comment [1]

| Does this mask unintentionally exclude bit 20?
| The previous hardcoded mask was 0x1FFFE0, which is equivalent to
| GENMASK(20, 5) and includes 16 bits. Defining it as GENMASK(19, 5) yields
| a 15-bit mask.

[1] https://sashiko.dev/#/patchset/20260928133034.243541-1-ada.coupriediaz%40arm.com

Cheers
Vladimir

