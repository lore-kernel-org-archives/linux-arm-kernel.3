Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC4DD2FED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxlVnf19hj6wgXG/633VtKF1hJb/wU2Bd3Aj6hrMbwA=; b=p7vnzOHp0V9wfKF5QajgnFKOjs
	YTF56bxBWo86RypHE+a9ObB2T6dl4wNRzYK3FoaYSmQ6G30cKrhjzAoXVNuDAeydG5ZrcGjblaa1c
	IJ18GYBxND9ET6yqFnXXvsIuZXtgnaagf6wsM3MDfxq5D22ljSWfJpcbFSyzMfcNwTIpNK75HdpoK
	ege6ZGdcBzao1o+rW9wNS9bsihoNj7zJFtvKCV0+ZzIEPgn6riDHA/tAv7FIJ0ZtB2S7muUZV/Tu5
	lCNWOjCQQS98qbS9SR0n1swvTRlpKNIMiLbf66/OHEz2LHjqyCn3HWvTSsHTwXeQQmE1E2xBVPBnW
	Eui/y8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknSr-0000000EmQe-1a5l;
	Tue, 27 Jan 2026 18:06:57 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknSp-0000000EmQJ-2m4F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:06:56 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5014b5d8551so22931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537214; cv=none;
        d=google.com; s=arc-20240605;
        b=EU9jmTaRFfi/eynDDpdsE8YX5k09BjUzlNzONQ7kGkjgw4OifAbbryx/wtGSElZoVY
         8FxXRvkDJVst6EdR1hcRjv3WLD8/NBi21riu8R8iO00Nf+Vbc05gxLX1i8vHdA1tOXke
         Hvt1XZeDM4jCAjAZd5HcxxjMeBlH6LtWFEoSzy2jAvR5nkpUTd1guoG/TdfivcpwgnaY
         s9QFJmvAAYTUv/KodkvNbaeWmKbbR/B8MX/dHK0lET7lPBd+Z7pVhsKD8m3L6wrDh64R
         BM9udZ23FwFbd9WE5ghodWwmGmZKnCb0P7kQzI5/qWgRCT3pja/N8d5lAUP8Mzh8ok3J
         kpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fxlVnf19hj6wgXG/633VtKF1hJb/wU2Bd3Aj6hrMbwA=;
        fh=Y208WzI0JDKJLCeAo2aV8OFQqq4cbZGv4dtXeWs1PWU=;
        b=lr8GeuosDwwrH/MLouHQgSNJCgIQXlkPwBQz2CyRSaiT8hemxYQmI20M0E3QKty2+t
         SDcNMBus90Nyps25pIE3aWogLcKhDnr4TNBSaoYYKgvMFGuAgcbeuOGppuL0+qPs+N1f
         IFN6+BMgdLjHcBEsy4PHaIiy9Mpyg3opj6HZSpHmCT1kBbrsk2VcyEANYY3rdpcJh16x
         eXvkHUWxDGkjHLDwClGLYlWt/Rw5hdZ0m/Dtp3G2Tv1O1Tt//Xv1llpwE8yyo5WAbVyB
         0HMnfhAryHPNoTZVYMuist/yuJoalZ4s53XfRLlWQP3JIfwt4xjrz+kVdE3/tq5ITRSG
         Epkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769537214; x=1770142014; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fxlVnf19hj6wgXG/633VtKF1hJb/wU2Bd3Aj6hrMbwA=;
        b=gcjG9Tsk3c0Z594cYZcMst/BRxpHMMZ7B7fuU4wNS3+FuaYFNZ1XYrmYtpjJyqAP2/
         0JJ3SKsOyK9w4sLOVKT22ByJx8he9nk9dTZaOp4iPsqwVB9Fz7hqhsxrAtmRuexbBcx+
         gJs25SnJE8D+Q18fUAgPC/o0JB9cGHcBJBVWMXvkEWp24AJxcrpGcuOKFWyV781eMBFT
         xV0Q5+t2FCvrdS1TJj2xdw1fpkBp+82QgSAyhmGMiCjzRIET9ehXNRBigRJLpy5bC/Iz
         Mi0i2Vv9orX4cxr39FnUgVKqycazaRSa6aDWgoZ9eg0VdsaiPJSzvaBZDqhv8fOIIuS9
         RbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537214; x=1770142014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxlVnf19hj6wgXG/633VtKF1hJb/wU2Bd3Aj6hrMbwA=;
        b=p9xSsybx/Wq03+57OsEWsw3i/ZkgRSqBz1nNXvyBgo+/9aeSZ3jAo3b/7op3NhAwiH
         jmlL8UDdgtRb2me34/HIJMFsTzN5/OjJqvSaDIjH01GLPexiOuc12WbLzUMxDsMEV2do
         cuRa3MkyvZ1kz7TPBOY2IRjKQBwLjOadsDlT+xlH53ki8dxgYFwSQqRQmAy7FMW7Dxwq
         vDQUxuLKZ9HAQVg3E/bHQJs9WNiHCmZMXwySuLAcUXuylCJXB4Ql/zj8H1Wnj6QynLQy
         i1mnfGCgQmUH+O8QoowcyRTh7bKcUvu5A8dZ5nZCCGKl1uS2/L6bazxiLtMbUkVgtwnF
         MQpA==
X-Forwarded-Encrypted: i=1; AJvYcCW8GwFy5hU0cgbeBRYXhDCIwkFcPK5MYKIky7jFW0eCO2skwil1SM1P18ju3WZRb97hSicKEdGu70dU7TDBt9M/@lists.infradead.org
X-Gm-Message-State: AOJu0YyVIEp8qf1KgIxnAbzdTuNQsFhZ+RtVZvQtT1kSxO3awrM8pDBj
	ghQCU3t7iLLxH/f4UE0P6fPVRSbQjyDYa5t7XHPjyFdvXIq2BJPit5qSAer2fBdQYTyXBZbMuek
	/S4pqlp/QFKawkDHt1JdKRltL6V32q2aZLfjHf3QF
X-Gm-Gg: AZuq6aI1GSf/FgX7jftOVqbNp8nm7/2F3AkqkNfVef4Y/XWGAq+FvXRosea2MpcF1ZJ
	5IxJ8iVDwyDeNLDu7A8j9IiB+I+ClmQAN2zaQ0XvFlrZ3J2FWNcsOLLYHBmbpQUOKImVaaVrZqn
	MHOhv/GKM/jKFOb8ANIsOnSPwJVQ63IEI+lmcIpIFE2VRM3/KjbGxpVkLBkRmeqde6ygfKMB0mI
	XYbJvYjJvxnOy8siktrSiY/LFG4dTjDg+EtrXNOqJgprs4qIAikIgs4pI2DLr409T9OwOfN
X-Received: by 2002:ac8:5702:0:b0:4ed:70d6:6618 with SMTP id
 d75a77b69052e-503340e2460mr5795521cf.10.1769537213238; Tue, 27 Jan 2026
 10:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-9-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-9-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 27 Jan 2026 18:06:16 +0000
X-Gm-Features: AZwV_QjgCatYzl0uSF32P0svXsC6cgFGj2o9l3SKTnzzzCjPpV9QVQWXrqlbFrM
Message-ID: <CA+EHjTzCpT4VYQkcmmn7AOAyROA9e=ohKfj53kSvf804DWWODg@mail.gmail.com>
Subject: Re: [PATCH 08/20] KVM: arm64: Correctly handle SCTLR_EL1 RES1 bits
 for unsupported features
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_100655_715139_54C6FB7B 
X-CRM114-Status: GOOD (  15.26  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> A bunch of SCTLR_EL1 bits must be set to RES1 when the controlling

nit: controlling

> feature is not present. Add the AS_RES1 qualifier where needed.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Otherwise, it matches the Arm Arm.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/kvm/config.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 6a4674fabf865..68ed5af2b4d53 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1085,27 +1085,28 @@ static const DECLARE_FEAT_MAP(tcr2_el2_desc, TCR2_EL2,
>                               tcr2_el2_feat_map, FEAT_TCR2);
>
>  static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
> -       NEEDS_FEAT(SCTLR_EL1_CP15BEN    |
> -                  SCTLR_EL1_ITD        |
> -                  SCTLR_EL1_SED,
> -                  FEAT_AA32EL0),
> +       NEEDS_FEAT(SCTLR_EL1_CP15BEN, FEAT_AA32EL0),
> +       NEEDS_FEAT_FLAG(SCTLR_EL1_ITD   |
> +                       SCTLR_EL1_SED,
> +                       AS_RES1, FEAT_AA32EL0),
>         NEEDS_FEAT(SCTLR_EL1_BT0        |
>                    SCTLR_EL1_BT1,
>                    FEAT_BTI),
>         NEEDS_FEAT(SCTLR_EL1_CMOW, FEAT_CMOW),
> -       NEEDS_FEAT(SCTLR_EL1_TSCXT, feat_csv2_2_csv2_1p2),
> -       NEEDS_FEAT(SCTLR_EL1_EIS        |
> -                  SCTLR_EL1_EOS,
> -                  FEAT_ExS),
> +       NEEDS_FEAT_FLAG(SCTLR_EL1_TSCXT,
> +                       AS_RES1, feat_csv2_2_csv2_1p2),
> +       NEEDS_FEAT_FLAG(SCTLR_EL1_EIS   |
> +                       SCTLR_EL1_EOS,
> +                       AS_RES1, FEAT_ExS),
>         NEEDS_FEAT(SCTLR_EL1_EnFPM, FEAT_FPMR),
>         NEEDS_FEAT(SCTLR_EL1_IESB, FEAT_IESB),
>         NEEDS_FEAT(SCTLR_EL1_EnALS, FEAT_LS64),
>         NEEDS_FEAT(SCTLR_EL1_EnAS0, FEAT_LS64_ACCDATA),
>         NEEDS_FEAT(SCTLR_EL1_EnASR, FEAT_LS64_V),
>         NEEDS_FEAT(SCTLR_EL1_nAA, FEAT_LSE2),
> -       NEEDS_FEAT(SCTLR_EL1_LSMAOE     |
> -                  SCTLR_EL1_nTLSMD,
> -                  FEAT_LSMAOC),
> +       NEEDS_FEAT_FLAG(SCTLR_EL1_LSMAOE        |
> +                       SCTLR_EL1_nTLSMD,
> +                       AS_RES1, FEAT_LSMAOC),
>         NEEDS_FEAT(SCTLR_EL1_EE, FEAT_MixedEnd),
>         NEEDS_FEAT(SCTLR_EL1_E0E, feat_mixedendel0),
>         NEEDS_FEAT(SCTLR_EL1_MSCEn, FEAT_MOPS),
> @@ -1121,7 +1122,8 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
>         NEEDS_FEAT(SCTLR_EL1_NMI        |
>                    SCTLR_EL1_SPINTMASK,
>                    FEAT_NMI),
> -       NEEDS_FEAT(SCTLR_EL1_SPAN, FEAT_PAN),
> +       NEEDS_FEAT_FLAG(SCTLR_EL1_SPAN,
> +                       AS_RES1, FEAT_PAN),
>         NEEDS_FEAT(SCTLR_EL1_EPAN, FEAT_PAN3),
>         NEEDS_FEAT(SCTLR_EL1_EnDA       |
>                    SCTLR_EL1_EnDB       |
> --
> 2.47.3
>

