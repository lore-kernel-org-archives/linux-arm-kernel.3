Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E65C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHYbpwLHuvljn8dVbt/fXb3LbUKc7Sc+NNW5fjMzCUU=; b=ul8neW/YYBTE50AOiXZQwDBXKl
	rJFbZD+c3p3yvxxMnFmf3Izj6M2+Mj/l+gzc78TI1HYOBvCzIQ2pU1l0iQqrUzdm8HJKWjWiivaw+
	uXlGAmxTGC0/bbAjCqDCcw3kWDeYgpRLyBg/3HopzOElaSQzzO7IgEuK0oC6XRLEI69NiezHGPjBN
	RfOIKR6w1Z+b+Wayen/x+3JQThF6zNwMS2PDxr0qiclRVd1DQUrphOXXbV3VHkk1YxVpgbPbXD+N9
	C0dWXW8lehz9mSiFa193SyV65ceWoh8TPyBEDCqiEAoHj8GU7ZBz6wE+5EYmHYIdq9w7lIFUkXfTp
	DV+h9wkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TxW-0000000E2Qs-1pU9;
	Thu, 17 Apr 2025 18:27:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tjy-0000000Dyov-2Wj8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 18:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VHYbpwLHuvljn8dVbt/fXb3LbUKc7Sc+NNW5fjMzCUU=; b=aInTtjNqwlrROOwNVA9D6/KOgb
	tdljBolfEjvm5NfCpi86ZldFZoGJKfxFdNAWfSPV12YVSfK09E53mETYDb8yeJt35iNS4GKQ8YOBn
	Lf76bylRCZiVU2F7O9DTElD+j2Z+yjB1zzBufle0HD92rcof6bd8zBhVqq9WAui1CgoRT14He4hTE
	2psFzmGVL3CD4xG+2TMEmxat4si0N+Tl2jEWNzPZnYd4ho7pdp7eoOQVFrcPbazJDYG78qH77dVTm
	eAYwTGT3BpdmHV/sudXjyVmeWr5caNNum07ficSULUB8L3u0tm1/R6Eq9z+nYS0KFN5EryidJ/Ten
	VSUmjoBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57866)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u5Thg-0007nk-0W;
	Thu, 17 Apr 2025 19:11:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u5Tha-0002fW-1R;
	Thu, 17 Apr 2025 19:11:06 +0100
Date: Thu, 17 Apr 2025 19:11:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 3/6] arm64: tlb: Convert the opencoded field modify
Message-ID: <aAFEOr_PnZRH2ocR@shell.armlinux.org.uk>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-3-6f7992aafcb7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-field_modify-v3-3-6f7992aafcb7@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_111334_636595_46E5E313 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, Apr 17, 2025 at 06:47:10PM +0800, Luo Jie wrote:
> Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> - reg &= ~MASK;
> - reg |= FIELD_PREP(MASK, val);
> The semantic patch that makes this change is available
> in scripts/coccinelle/misc/field_modify.cocci.
> 
> More information about semantic patching is available at
> https://coccinelle.gitlabpages.inria.fr/website
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..0d250ef4161c 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -112,8 +112,7 @@ static inline unsigned long get_trans_granule(void)
>  	    level >= 0 && level <= 3) {					\
>  		u64 ttl = level & 3;					\
>  		ttl |= get_trans_granule() << 2;			\
> -		arg &= ~TLBI_TTL_MASK;					\
> -		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
> +		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);			\

This could equally be:
		arg = u64_replace_bits(arg, ttl, TLBI_TTL_MASK);

which already exists, so doesn't require a new macro to be introduced.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

