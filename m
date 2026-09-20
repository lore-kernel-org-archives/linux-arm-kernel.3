Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB2C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joyGqbMiuuq16rFgvngJlIfsaDrMSMqeAz5BlG2YOnA=; b=DarleedYHhp7tZQL2TpfCwENUA
	Nb8Wooate3XME8pMO1R+brD8WZZY0pUGJ6phJPfKZTnUgEztsMe6GCWiYwvDaLaHCvnZ47uU96ChR
	e2/l8Jv/B9Tz8WRxuF2Z9Yto5JPDau/GY+/6wfpPdFrZpStcM0Xv4e+IwFxjUlL168Ze9c0O9THFL
	ObT3i29Ms3r8tcBDM25fNDRUSS+vz0H4cNWDp5ryo3jAcoPMRqWrDEsEjADOIvn5o5PgPYmDm8TNu
	KkjC01VObjPFB5QajnvXWTELN+BUrSQZ2TEUplYb3Nr0hgy0JDjoyEUhuNG972sf1McV+rfaPDID4
	oNZtEmKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ilb-0000000Hau2-381Q;
	Sun, 20 Sep 2026 14:43:43 +0000
Received: from out-89.mta1.migadu.com ([95.215.58.89] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IlY-0000000Hasa-2xl0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 14:43:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MTh/Rh8efZWBx15ABw7iMVCiV0cUUTDH8XrvmFa84wg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789915418; v=1; x=1790520218;
 b=ZmOdyG+beMSYVhRZDCQJ8aqcOFSYEqYUfnBDM60/fPGPvcpjJKv0LX249MEHrEz36ukzZrjp
 6AJs0fodXH0Tdvwtgv9iP5iVzW9lv431O0lYLiFyC//G/H6Xaq0P2zH3hcjAqTqRXVoRPdlThXx
 ganjcroCtOAOVkf9E7UbNTXU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7a11a51624b9ceae;
	Sun, 20 Sep 2026 14:43:38 +0000
X-Mizu-Trace-ID: 7a11a51624b9ceae
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so4118e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 07:43:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgNyu5IT7LzSG2KMoHlJrXk7EXKfMFKKldFFoc7VcxFb53Gzsq/2uL8P8PigQPLBvgTg3Px71+4IlSSWAofcsQ@lists.infradead.org
X-Gm-Message-State: AFuF++kShu8nDwxrVdhdskk0RbbCNXWc0xHYieAM0z/Ashermh9EEojg
	c4Sbk2a5o8d9NczOKWWVfa0533TuLLR7sUu/MUp0QSDtB1yalAETmmRkPX7cTYZ4BPLaGsurjEE
	OPTpTg0XiPFkQNlS5vyXf7+7T/PBvpI5RwSdCpfwh
X-Received: by 2002:a05:6512:ba8:b0:5b6:4ae:3ff0 with SMTP id
 2adb3069b0e04-5b8c7eae35bmr74990e87.15.1789915417530; Sun, 20 Sep 2026
 07:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260919123150.3283606-1-maz@kernel.org> <20260919123150.3283606-2-maz@kernel.org>
In-Reply-To: <20260919123150.3283606-2-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 20 Sep 2026 15:43:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzYhaG+J+JQNA=oU6230_AfNQnPnbg0jysjsU-F_ZrKWQ@mail.gmail.com>
X-Gm-Features: AcwNN1WjAy57Oih6nCrLbvUS6fVUqyWByy2r3gykJEx1FzTGQZWbKmo2YjjSows
Message-ID: <CA+EHjTzYhaG+J+JQNA=oU6230_AfNQnPnbg0jysjsU-F_ZrKWQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] KVM: arm64: vgic-v5: Drop __iomem attribute from {vmd,vpet}_base
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sascha Bischoff <sascha.bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_074340_895645_7E03B812 
X-CRM114-Status: GOOD (  14.72  )
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

On Sat, 19 Sept 2026 at 13:31, Marc Zyngier <maz@kernel.org> wrote:
>
> Both vmd_base and vpet_base are pointers to kmalloc'd memory, and
> therefore cannot carry the __iomem attribute, which designates pointers
> to MMIO.
>
> Drop the abusive qualifier.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609190650.liMAzwjF-lkp@intel.com/
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/vgic/vgic-v5-tables.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> index b2ffbe68c05b4..89096926563f7 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> @@ -23,8 +23,8 @@ struct vmtl2_entry {
>  typedef __le64 vpe_entry;
>
>  struct vgic_v5_vm_info {
> -       void __iomem            *vmd_base;
> -       vpe_entry __iomem       *vpet_base;
> +       void                    *vmd_base;
> +       vpe_entry               *vpet_base;
>         void                    *vped_base;
>         u8                      vpe_id_bits;
>
> --
> 2.47.3
>

