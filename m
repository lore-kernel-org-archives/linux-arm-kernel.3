Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5356AEA4E20
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLhMi12c9hilSx0fJ9MNNmOkG5ZaJ8A8J3vzxrBi+l8=; b=wr5YZSLiywmDcECtrWjyeiOmUy
	r2vYZKO1aIgc7DKaijbRWUYQrolyJK4xxN/mvT9prU//WkYJroPYMBWuMksBaWscSTFHCJPwtkpsg
	+iOAs6a2DwOPE4TsN2702izrT88TM3AK9U2lbGba47l7mcm1Tp5gS5YIdXrZappXm/7trTWmm0IqP
	/5tSez+WmD4Pcnpz8Z3ss/3pvbYwQTHTXw7/gNDZMs5O4lTsVQSIP5obu9L6XwNddeXKZXtxSIjBA
	Dvj/JRX98GY6uJfLLmEZYPmXbzt3M2+Q4ILjOC+9avOHpCXWFrGy2v3RCvbNyVU6L7W+UTexDOmzv
	l/f2347A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4zW-0000000DKx5-0DzU;
	Mon, 02 Mar 2026 15:15:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4zU-0000000DKwH-3MFo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XLhMi12c9hilSx0fJ9MNNmOkG5ZaJ8A8J3vzxrBi+l8=; b=O1p4VlTq9qHJjiTu6pBw+LfKhC
	lcP6A/9Yv7sb44KAQ2TPzTMt/dchHQsohsIea3uVjYO/FVyK+Zb9fSTVEzue/YGhsIWTUZ/QtBDQq
	MxtESjhbSWXxeI/xfuRf6SMJhAHvqMcvz6+K7psiZ2iuQNPc71QFN56I8sBp3es33rcISkok1ruls
	UyHefJQ13EbJNkwrcOKUfxtuatRoAidypwf9D/EtT6ALP1NxoMbjJoe/zUFip+vol0t3z/tXag7RS
	YP59ytoFbrOpYozvsI0zsXG5C7AJfstYbWXZQeLyzzTokqkyjADAGS2V1DkUWWhHNjAU6aZ97G8A0
	0CiFxxKA==;
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4zS-00000000PeO-0IlP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:15:23 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-505d3baf1a7so993821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772464519; cv=none;
        d=google.com; s=arc-20240605;
        b=VaLldtnM9h3bFjqdx9QTdL2XjdEDsXnz9ooNMbRO7z/VsbFgYFvGdjCGdRsq0vs5OO
         YVwbJk/80omtzxlUZ0J/Fewd7leGsxCm1viWJwKb0zWyvnHQThJ2vH/+79g8neYMBq+M
         VWrRRLnbW5HglalnuFuZkTgmodQzexC1d2ZtVip6yBTbiWEnLpj+npGsDqNMTYpYCBT7
         ili+tKAtBhUILTz51OxmjSNP21n9a09lKmTuIlxAJVCqFgEB59QtaRvTEK8MeNi61KKa
         sPHwuMn2N/2mZ43zYIrDNqKQ15+s2uJFT963lhO3mYi5j3Etz/OHKfELdUMUW3fyrnkw
         ywOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XLhMi12c9hilSx0fJ9MNNmOkG5ZaJ8A8J3vzxrBi+l8=;
        fh=VFXcUrr3kGurp0SuF0YJGl5pPwUAd9HYetUbgSB3cYw=;
        b=k3pzVoEB7x8Zta22utD/p+1XtoYmBjl1aML68tZVSnYFPCu+n9Qh3zaJ9dYe0UVZPT
         O35gRfNFlwng4sGynf1k6UtvfgvogubU6Fys2QtxGtnZ7eT3GooGIGL1y8MgQ6j/6ZIt
         aGzyhA/zQAgja6XxPct54ZW/dHsle3JPJX0sLPpVv5V1XArDy9NuaViTqpkdB3jhyIfS
         UNCh9aeD0APWg9yoIcdT6nqcsFHzzU9dGAp/sr6neqVk22I22oVQzCuMhGc7q7P7QcmE
         hR25fFrqSDsVvx88PtOH0QO9K2D7j33FtS724LUrEeA21DY1xUXwmL5Is5I4b0MKjnE6
         a3tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772464519; x=1773069319; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XLhMi12c9hilSx0fJ9MNNmOkG5ZaJ8A8J3vzxrBi+l8=;
        b=CxgS4u5IIBP1RqYl0SH/wQRJc+3N7NNk4GNa1ER3UToWyJucvX2YE63yA9VGXSAFvt
         uEtaY5s5g1JVDaPgOJOSDQoMyCNYWW2MS3O00xmfbsB0eQjWzUMTb18vucvPpZeA5TEc
         iXBugPz/8NqJ2G8Jd9Emd1pc+dF//3wX0+7z5lH5GQfhEgUom7mppoJMRXuy11QofVdh
         Xb/hH39neF/dKbwbBxffyqvVsoOyGJuM5sryTkLqhwltPcxn3tIBuntUqFuPOmqS5cdy
         4ITyPIFCmIR7XC7m1rxfK4yvHc46Dk9Z+81O9VzceaFrcATI4qt81iscJblAG7Sk1Myp
         KYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464519; x=1773069319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLhMi12c9hilSx0fJ9MNNmOkG5ZaJ8A8J3vzxrBi+l8=;
        b=nVMF1GnVnQUSi/IeItYYYrvydQ2fseo4iqsEz1E1oH1cyt8y6ZMMQ6T7SP/95hqY2N
         mf3ctzJnls4kNdq6La73jM+uc6j0ugKZCQbK3g1sBqv41zzqsIq2uTq3lktQg6jAP4T4
         46q6B60IQZa8i1u2GAfl83k7R7GErrbOszNXyfnKTvNLBoZT7h9crIQrBTTryD9nOUGg
         9+9b/aFv13/T/jVnJYUkb54gxvFlbbqItJS+6TqI8y2kegLbUjiGwqeBvUPagIJUfabc
         2Rni+mcf9oya2IseUif+UaGs3pCFryQbJdruaXSorSdkObULVw9tcDEpnRYYHvGwq0Pc
         y+GQ==
X-Gm-Message-State: AOJu0YwJrx0JoYDxLXZxB8SrJnepqaivDW5Y65gs3uPZ6YPvQKymcncT
	ovshGxHMilzcFpDk/zz+2LhThDLuEACfwk3Dk39dSqqQdL8G2LE8DycI+tUqGhHUoY4wUIjHsgk
	t0UnMIakOGBn3OM8laKymamkVklyAvAZoZoW2uJSd
X-Gm-Gg: ATEYQzwIb505JcfS1xDV/2DuoV5lkmHv1zxHZW03bIO4gSa4go0rYnENZUO5ilYia1r
	3h5lLkXVuEZUHIdRWySKTzcWYwKPaFQhh+PBI0L9NnWDjlCOBU9ap2EnrQPsL+C1sxO7/uo4C5k
	NrlEaZQx2gnlRXhm7WptLejn1jQs1Szcrt9P1m5jkmk5FEveHYbe+tbjH/H2GAAWG9x0fXSCjVy
	V7DgRQKXpcg+huQSAzWWDr/nQMP8vEp3LuiDzDU53K0yRUCCDIqr2s97dbjz2hJ+Y2zJlCNyW1A
	ts5LnzCV
X-Received: by 2002:ac8:5995:0:b0:4ff:cb72:7c03 with SMTP id
 d75a77b69052e-507617532dcmr21739891cf.3.1772464518402; Mon, 02 Mar 2026
 07:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20260302115653.1517326-1-maz@kernel.org> <20260302115653.1517326-9-maz@kernel.org>
In-Reply-To: <20260302115653.1517326-9-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Mar 2026 15:14:41 +0000
X-Gm-Features: AaiRm53AeNzBUqCcvwVmtTfW3IVhaSW812eJdmucfptOpXaPRrJTjtj_9ytMZMk
Message-ID: <CA+EHjTzhciLDu145E+iCLr+ej9Xi9etkk2uigpBgpHH5NBE6rQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] arm64: Convert CONFIG_ARM64_MTE to FTR_CONFIG()
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_151522_201288_D92F690D 
X-CRM114-Status: GOOD (  20.32  )
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

Hi Marc,

On Mon, 2 Mar 2026 at 11:57, Marc Zyngier <maz@kernel.org> wrote:
>
> While CONFIG_ARM64_MTE=n prevents userspace from using MTE,
> the sanitised ID registers still advertise the feature.
>
> Make it clear that nothing in the kernel should rely on this by
> marking the feature as hidden for all when CONFIG_ARM64_MTE=n.
>
> This is functionnaly equivalent to using arm64.nomte on the kernel
> command-line.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index ab0a7d72608d4..a56d242fe1489 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -315,7 +315,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
>                        FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
>         ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_RAS_frac_SHIFT, 4, 0),
> -       ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_MTE),
> +       ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_MTE, VISIBLE, ALL_HIDDEN),
>                        FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_SHIFT, 4, ID_AA64PFR1_EL1_MTE_NI),
>         ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SSBS_SHIFT, 4, ID_AA64PFR1_EL1_SSBS_NI),
>         ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_BTI),

Although it wouldn't really be for the scope of this patch, but what
about gating the other MTE fields? e.g., MTE_frac here,
ID_AA64PFR2_EL1.MTEFAR and MTESTOREONLY?

Cheers,
/fuad

> --
> 2.47.3
>
>

