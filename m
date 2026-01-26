Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C92BD19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nr6ZY9QUfU1ONCnN3zu+tZf3955xHGY/dQF3/cqaDvg=; b=ZbboP3SZAruFWdfL76KABTsbH0
	2k6/0Mb+8nvLyD4MQ6p3xBMKIdppo9VoWyJ8Jxb9mOX7ICo6ZYSjxHSXO58Hzu0jF3skfjinmp2Fn
	ctpbwq/NHH0jTYWLviXbsYRss6mFDoe528VM7reEEgGyMXaNwnqu0KBVRRsr3T2928QjQONOHv26Z
	sFkwEz3wMEDmkoMlTCV1nQOFkIHxA5tTDIhRemDGH2srJq+W/JLQCmHIz1AxCXe0jgtdBh9oZ9MHD
	1Rs3mYEf2B4j2n1BEAJMXjiTBtw0vu6Hbn+578yIYc5lkyWywJycjHDe0Z48+fn9jWhBfVpcVfDk/
	1y/L6FLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRSF-0000000D5pK-3SmW;
	Mon, 26 Jan 2026 18:36:51 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRSD-0000000D5oo-1Zdf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 18:36:50 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5014b5d8551so42641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769452608; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8DhxsH/EVG+Ec0m7X3dJdIKeJuTF6X0txEeXTCD4bxr11CfBkfcsxkbdXBDZos5d6
         QQxwcW5bDit12WqjWh86LJGKZNhrbA/cn03kOiRPfgvrdSunrfhrHdFZgHmpNHx4z9S4
         FFKsdp4aeRGTtIUhi/rghwvvhCV21RFg6GolaldwzEyvgrYR9XLKx7CfBwwperrSflSM
         Ztqk3d0QSmBmbN+5fVUUfYCc0DxLVoDMAgy/rZXNWgnVzzfbPW5iwClcAA/GN7sswRmi
         uR/8s0sukWU85Yw4T78USUV4ZHXpm1rF1p7cd66AJ7mjxSvqyQ2wIrkZanCEElgwtlJl
         kalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Nr6ZY9QUfU1ONCnN3zu+tZf3955xHGY/dQF3/cqaDvg=;
        fh=47/doH99r6meybr0UnpBPD1kfNLYD/mDigpxOrGEmsg=;
        b=M6GjEB+DDV9bAu13M94qtAONMzfWW7dkY3U8hH/eCtxavYPZ83PJ47oR/otjEQmxEK
         6DLQBfd9fH2TohKwG9IQFpIafYPK4ForTKM8WuPqDEI1Os+Wdv3jqJRy2jO0q+RAAjfe
         3dceEf0FysB9PBubz4zffrEsvJcDLX/7wCPFWMatgrN7EABhnCx/d2xa6xXWCuILlIUZ
         zRoUqXhgJtb2AA4nfdiHoVMhKLtp7OjWhIziF9WH3bxSWEALGo+0mhc4qarUloBwWiyQ
         Ktzmlv8wxoCmUWPV+EutsG0ToGJ0Nsr4xPsTLtf6CoF4fo0Sn/BaihBBU3H5w7bv4+nn
         EVzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769452608; x=1770057408; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nr6ZY9QUfU1ONCnN3zu+tZf3955xHGY/dQF3/cqaDvg=;
        b=emJT/IG78i15B+dxVILRx4PMOCnAODLcQJX+iS1QBaed+uFKOrm5uoxa1OTFz95NDP
         fZ0goF8cier9NZQVXPVytkXwwsEOL1+5Kl8P/OLtgBGzvHzUu62r0KrPb1U/F33j6wdX
         Vbn9zOnYsRiDg0UScZ9C09ZKpdMjJ1FPUWP7ojn/3FHdUMy01doYV9sWD3xgKwdM43hx
         7yA5XDpT+hIqJBnZzAUsJkVdTYJ5KmUyc5shcGSYvSwbw9tpW/UPWIu56xaK7NGUmMg1
         BKl9ZXZpXw1lDLRDs5lTwemBB5K0HKwdHaquMQ+IZJTAu/1TIgnSzAwu/RjatGuyQGqG
         veFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769452608; x=1770057408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nr6ZY9QUfU1ONCnN3zu+tZf3955xHGY/dQF3/cqaDvg=;
        b=MXGqiiYn6UoEWCA1DqHZ2rhKkvWb9NvEBnWbm0EApNfJNra4hHJ6lwrF+333MQ4FJI
         kl14G+AwIGl7N6CpQ8Sseb+ECaJuutOBHL7p25kaJsA+9/3ip6j6fqFSB3U5tSsbv/ZW
         NI5iapnomWqRpQ+mEEqbmdDwRdV7dZp6K0CcHWQD/Chaxyt1n3wYOjVANXLmZFzQBbIT
         n9f1Fympq82qT51vu2wEl/PeozXqWz8iPWh1YEv9UzHdWvFtSdAm1HWJi1hHqtHgLg51
         ej1cgK6lyvHX9aBKBVH60WhVTgI8CRFDqallv7Z9j17I57enBQ/NhU/9IE+WyQGrLoLi
         qGfg==
X-Forwarded-Encrypted: i=1; AJvYcCUgNpifcVRb3f8mP0PHkaBN5QvFrjS3vAu0CPxI5YXLCAfk2MwvHqU+pYz5ZZW6RIg0MSo8KrZYRiayNiF/m+gr@lists.infradead.org
X-Gm-Message-State: AOJu0YyM8hRSadg5T17aLmARZbGeIQ3miyJg30C1FCW3+lqvgIgL49hl
	rCioLSQOmV762oTqppWY1iXQxnVbobJdcqBwLZE70puHZPc8Z7oAsiqiS3QGfWcLHAGI4MQg78g
	6/m3Fudt55QQTOxHJ6OY1g2D3CfL7WTLK3SB6VNTt
X-Gm-Gg: AZuq6aIX09FB8U1NPBaTddSYj5/Q/CgHWQSAjU85lr8ovRK0JpFXKH+tebdgxVZoW5x
	mnqjVuGOUVy/yjZGkUY0HeU48Xv7wr3aJvCeOiVZzoW3CynO3Ckm/7Mls34XuS9TvtoEYfUd9mv
	TKO7jDtYTi0bV/1zh9+Vkd33iTdKMgURNW3vwHxSQGG8+JJ8BhQ/C0Kfgd2KwCP4Z8Xjswka6l0
	P8F3ua8+KJdiE+ef7IGzpU5T3ipLJj8Ozueztw0XWcR2sM4L3VYKpYwHrzOV8Nf0A+03usy
X-Received: by 2002:a05:622a:14c7:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-503143735c5mr1861661cf.14.1769452607562; Mon, 26 Jan 2026
 10:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-4-maz@kernel.org>
In-Reply-To: <20260126121655.1641736-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 26 Jan 2026 18:35:00 +0000
X-Gm-Features: AZwV_QgxoPZSd-obyO74bD1D2orgbXY4GVKiKLrcaTbXWiYTi356mxofCsFsPUg
Message-ID: <CA+EHjTx3C60LaoMtCRH5eYNBmNGPEX+0XHtPgTk7OWjc8MTByQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] KVM: arm64: Introduce standalone FGU computing primitive
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_103649_457464_1A658B44 
X-CRM114-Status: GOOD (  21.20  )
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

On Mon, 26 Jan 2026 at 12:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Computing the FGU bits is made oddly complicated, as we use the RES0
> helper instead of using a specific abstraction.
>
> Introduce such an abstraction, which is going to make things significantly
> simpler in the future.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

The old way was mixing "bits that don't exist" with "bits we need to
trap". Here the distinction is clear.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad





> ---
>  arch/arm64/kvm/config.c | 57 ++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 0bcdb39885734..2122599f7cbbd 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1335,26 +1335,30 @@ static u64 compute_res0_bits(struct kvm *kvm,
>  static u64 compute_reg_res0_bits(struct kvm *kvm,
>                                  const struct reg_feat_map_desc *r,
>                                  unsigned long require, unsigned long exclude)
> -
>  {
>         u64 res0;
>
>         res0 = compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
>                                  require, exclude);
>
> -       /*
> -        * If computing FGUs, don't take RES0 or register existence
> -        * into account -- we're not computing bits for the register
> -        * itself.
> -        */
> -       if (!(exclude & NEVER_FGU)) {
> -               res0 |= compute_res0_bits(kvm, &r->feat_map, 1, require, exclude);
> -               res0 |= ~reg_feat_map_bits(&r->feat_map);
> -       }
> +       res0 |= compute_res0_bits(kvm, &r->feat_map, 1, require, exclude);
> +       res0 |= ~reg_feat_map_bits(&r->feat_map);
>
>         return res0;
>  }
>
> +static u64 compute_fgu_bits(struct kvm *kvm, const struct reg_feat_map_desc *r)
> +{
> +       /*
> +        * If computing FGUs, we collect the unsupported feature bits as
> +        * RES0 bits, but don't take the actual RES0 bits or register
> +        * existence into account -- we're not computing bits for the
> +        * register itself.
> +        */
> +       return compute_res0_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
> +                                0, NEVER_FGU);
> +}
> +
>  static u64 compute_reg_fixed_bits(struct kvm *kvm,
>                                   const struct reg_feat_map_desc *r,
>                                   u64 *fixed_bits, unsigned long require,
> @@ -1370,40 +1374,29 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id fgt)
>
>         switch (fgt) {
>         case HFGRTR_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hfgrtr_desc,
> -                                            0, NEVER_FGU);
> -               val |= compute_reg_res0_bits(kvm, &hfgwtr_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hfgrtr_desc);
> +               val |= compute_fgu_bits(kvm, &hfgwtr_desc);
>                 break;
>         case HFGITR_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hfgitr_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hfgitr_desc);
>                 break;
>         case HDFGRTR_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hdfgrtr_desc,
> -                                            0, NEVER_FGU);
> -               val |= compute_reg_res0_bits(kvm, &hdfgwtr_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hdfgrtr_desc);
> +               val |= compute_fgu_bits(kvm, &hdfgwtr_desc);
>                 break;
>         case HAFGRTR_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hafgrtr_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hafgrtr_desc);
>                 break;
>         case HFGRTR2_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hfgrtr2_desc,
> -                                            0, NEVER_FGU);
> -               val |= compute_reg_res0_bits(kvm, &hfgwtr2_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hfgrtr2_desc);
> +               val |= compute_fgu_bits(kvm, &hfgwtr2_desc);
>                 break;
>         case HFGITR2_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hfgitr2_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hfgitr2_desc);
>                 break;
>         case HDFGRTR2_GROUP:
> -               val |= compute_reg_res0_bits(kvm, &hdfgrtr2_desc,
> -                                            0, NEVER_FGU);
> -               val |= compute_reg_res0_bits(kvm, &hdfgwtr2_desc,
> -                                            0, NEVER_FGU);
> +               val |= compute_fgu_bits(kvm, &hdfgrtr2_desc);
> +               val |= compute_fgu_bits(kvm, &hdfgwtr2_desc);
>                 break;
>         default:
>                 BUG();
> --
> 2.47.3
>

