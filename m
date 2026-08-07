Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6612BC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=; b=0K9f6+kQRSqlTmXEJHvQxnB6vF
	ilvB3yJkDJecXU/ynUmoGYyfgHv0BtCf+enwNtD8a7R8oTvKzT4fmrfoGYYQEJJn7Pr1ekIzbgbiU
	klLeY+OcSKHqEGLeGzOQZvKjXqsEReoj4fAGWq4YCCJnFsuSHuWUDSoSjQOorgWthXDCV6hYAwQvW
	at9OzrloEmjTn+rsRLId9WVoGb7HL10D9q8CkxH6//dUEW33A2TgKvGREl265/JgEF/JpQ3Ogj8pt
	pv5d+cr2VXNbIWH/xHnz+A3dUnbccz5yWr5mf2durL6mIIjeaEh6sriwrjLSKgdiqZqAerm9UTl2v
	1UeujlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLhq-00000008HUz-1xUZ;
	Fri, 07 Aug 2026 14:37:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLho-00000008HUS-1dri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:37:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so4052779a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 07:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786113470; cv=none;
        d=google.com; s=arc-20260327;
        b=ndOAaw3AYsi3Zjzzwo4ziK7Xao8azh/It1id0GNfkRb4f4F5jcCR+bjJYWuVuIVG5M
         Bxha+msUVwzRW02jJrsOyBwyUkmXibvdR4v33f1ryD05Ve4IyT2QbOYdLDLvwGvpy4wY
         noYqtEm5xVa5i+HdFeZqQr1YXLptrKYOujCMu3e6dSgPglJ8pBv8gL9FBjq3fsezmuWC
         dn4gC5uZQhNpPErgBsKX2bhBCjBvjEqiQOpGogPNoxysXKS0omPp6qTWodJI7Ky/88oR
         W7cc48Ac6dgxAcHTk5JyoXLr0DonOE1m/E4F92mhmJ+0Wxb5OBk1idLVOEVziWQvDl+k
         +Y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=;
        fh=habB3ctrJQlwWp/yt8/FDuWvsq3o43h5KfkRnNH0XKU=;
        b=RM1LLDDW5aa/B8pp9Jla0o2d2W8RvrExaX0SfmSTnw/bfjt6MBWdKoS0eYixEBjqvR
         PPBGuX9uC3nHmHOYRXpHm37N4yTj6ObLQFQ7eE+mNH1HgH2HGdeO8RsF8IaD8KofK9Fm
         ROATXQWc/cUPhqC8oIwMy44Vhwd8bT0w4skZSbDVApU9aEDYOBCIFB+PEWb9+roOXTEY
         NMDNy1p05WykyC8JSodn3U8HQuRTjqxN9DhOde3Y/uHwdGIRnFP0O2gIHJZ85PsS+LO3
         Qp9MLpiUDbMrqAj4jGA9t+sXn8LZ21TaKaLohQ9HU+o7Mh6Xy/k7WrQzZJDwzST77t7S
         ZWJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786113470; x=1786718270; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=;
        b=y1tufxhJlFdwXgKvNDNqlBnVEfI1hbZh8vpE9HMkOe+ZjCGkNWvz9+U6Yz9xIaPnHU
         GeDKteeDzfpC+qxbksVzxUgsWtADih3816hrjamdjzOJ8sZHtBhwhqnaQ6VYbNMJOh/a
         4AslQ6sHV+VDEOLFrpurKULfT85JU5kr6u8OAVguL4NMtbBSDMJT6Iwp2/xpicFIk/OY
         5gp6mxeBuQz8VqTvXt/D/gl6yjfaeqaYs36pnfwgb1PlzUJHyE4owacE1nXp2KhLbdSj
         YPkofQHYfyvkPQUzrGGgDbhgi1vNmEThYkNlQ6Trlugg+pVdReH76W/vgSSuHAJruEh5
         cr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113470; x=1786718270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6m06+tQ3UmcgbeeK1HTCPK9otwtvhbVRYnkmzJl8qA=;
        b=rOhddVGUGzZTcST2ogVgTgbxNLTUPCqIATgkcmWWc8rkf+bczn+y4k1eq9A+svJ5j5
         ZxU3ELSEUAPML6bh4NxVHeZT6FC+oJqKlFJnIin1M8YGF8SCcOi4iE78Ye+tyAH+B0yy
         44SIGJOzJf5dX4hbNh55xJYPWCyg4FRltGIb9LQTsQAWasCXppKAfjH8zAVQkHBA1d7d
         ySxU27YLAoojgfssWq93WAJMSqcYBd3ujjuOVcGxFnVvnGG9XmJm1lXBzOXM77+hosvq
         NsZ1AbQA4ttGoXojeprCTShjtfkVB2pm5YmQQiIKqry11CdgdAnswfqos+0Ss91pvQjr
         r5Qw==
X-Forwarded-Encrypted: i=1; AHgh+RoxZETUphXEAlrdl1eiNQrnpgwSXhjyu4rsrcAPAvhDk0BqUNtQeAhMCtz/WgaYuyjUrJhCQWu6if2pt+8Qd71c@lists.infradead.org
X-Gm-Message-State: AOJu0YyqXABPbb3HP4TwFAecW4zUEzT0ENFsWXeYJzMa1klMHIzkSiKA
	BYlbNylgoX9ifxBC3L3hWVUS2gyP95EXUaIUcNnzYaa055I1bJazw8ZRUIvbpbaePMe/yMUTOuP
	yf8dICKI+CZkxPdD/mLhj8TS47VUY7L11zjcmsYE7dA==
X-Gm-Gg: AR+sD107P+rTzco1zSiLWmsb+eeJj4OB3/YwBsC66xW9YkX7bmpi9FFc2aPK3lGgKIY
	9gzl614OeAnvfbQG7H/qXX/6o9UAHAS4jn3Eh+Krvt0O0LxOOycXV/IaTKPVS5BB7W9Xo1F5HrV
	0tXnK2gkMcBJNUQi2YNXr7cvWRQy9bSeNG5LUofd9Pkb53JWYzvIIU9V/PPphpXY6U6W45RiHGe
	U5/ki3PbDKubGXd7ohri4zB4EQhji93Z7qVTIdYWDfIYx7XrBwCAS2CoJX7sr2y8ID1unatUu9r
	BEaHhoPhXY2V/V3MHw7KBbvsQ8FUd5ophFwjawnXHWq01Wn+tadlVyBfGeGtlF51K5tqx1U845M
	r+4A=
X-Received: by 2002:a05:6402:380a:b0:6a1:1e25:143e with SMTP id
 4fb4d7f45d1cf-6a14f07aa0emr11843889a12.3.1786113469730; Fri, 07 Aug 2026
 07:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org> <amOpSPmc36+YXgCQ@nvidia.com>
In-Reply-To: <amOpSPmc36+YXgCQ@nvidia.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Aug 2026 15:37:37 +0100
X-Gm-Features: AUfX_mycW6Onnp9fcyEmhcQ210POYMAQz3QVnbQpiqAFr05Ok_wIMchvSKnA5X0
Message-ID: <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	jyescas@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_073752_482709_E0002854 
X-CRM114-Status: GOOD (  19.22  )
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

Hi Nicolin,

Thank you for your review feedback.

On Fri, 24 Jul 2026 at 19:05, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> On Fri, Jul 24, 2026 at 01:39:43PM +0100, Peter Griffin wrote:
> > @@ -1206,7 +1207,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >                       cpu_to_le64(STRTAB_STE_1_S1DSS | STRTAB_STE_1_S1CIR |
> >                                   STRTAB_STE_1_S1COR | STRTAB_STE_1_S1CSH |
> >                                   STRTAB_STE_1_S1STALLD | STRTAB_STE_1_STRW |
> > -                                 STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
> > +                                 STRTAB_STE_1_EATS | STRTAB_STE_1_MEV |
> > +                                 STRTAB_STE_1_INSTCFG);
> >               used_bits[2] |= cpu_to_le64(STRTAB_STE_2_S2VMID);
> >
> >               /*
> > @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> >       if (cfg & BIT(1)) {
> >               used_bits[1] |=
> >                       cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> > -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> > +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> > +                                 STRTAB_STE_1_INSTCFG);
> >               used_bits[2] |=
> >                       cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> >                                   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
>
> This adds for "stage-1" and "stage-2", while missing "bypass"?

I need to follow up again on this point, but I don't believe currently
we require the override for Laguna when it's in bypass.

>
> > @@ -1835,7 +1838,11 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
> >                        STRTAB_STE_1_S1STALLD :
> >                        0) |
> >               FIELD_PREP(STRTAB_STE_1_EATS,
> > -                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> > +                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0)) |
> > +             FIELD_PREP(STRTAB_STE_1_INSTCFG,
> > +                        smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> > +                                STRTAB_STE_1_INSTCFG_DATA :
> > +                                STRTAB_STE_1_INSTCFG_INCOMING);
>
> Sashiko pointed out that this prematurely closes the cpu_to_le64()
> macro.

Will fix in v2

>
> > @@ -1887,7 +1894,11 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
> >
> >       target->data[1] = cpu_to_le64(
> >               FIELD_PREP(STRTAB_STE_1_EATS,
> > -                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0));
> > +                        ats_enabled ? STRTAB_STE_1_EATS_TRANS : 0) |
> > +             FIELD_PREP(STRTAB_STE_1_INSTCFG,
> > +                        smmu->options & ARM_SMMU_OPT_OVR_INSTCFG_DATA ?
> > +                                STRTAB_STE_1_INSTCFG_DATA :
> > +                                STRTAB_STE_1_INSTCFG_INCOMING));
>
> You might need to set in arm_smmu_make_bypass_ste() too.
>
> > @@ -5087,6 +5098,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> >       if (smmu->sid_bits <= STRTAB_SPLIT)
> >               smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> >
> > +     if (reg & IDR1_ATTR_PERMS_OVR) {
> > +             smmu->features |= ARM_SMMU_FEAT_PERMS_OVR;
>
> Where does this new feature bit get used?

Good point, the feature flag isn't actually used anywhere else except
here. The intention is to ensure the DT property
"arm,instdata-override" is not specified for a SMMU which doesn't
support the override feature. But we can perform that test without
adding a feature flag that is otherwise unused. Will fix in the next
version.

Thanks,

Peter

