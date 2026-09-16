Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4F4C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=; b=NzschK8z6vdh+SPPURig3PAloT
	m1OGyaEV3EORDaFANPaWvzE/ahYWR9BgeX/20Tj5mFayiS17NWGFYw79ZZI/GO8LwuRr2/vrpm+DW
	Skv66aOVYz8GfKFpSseVBOFXFt6owQQEUXqogXdQfiwQX69ZCC+VrKtIPwYrBK1s3MGk49vzUcq+4
	9Ig+5qruaeSq+LR9Yk/5rh4CeBGDly8ZvZxHRPNcgdfJJ4ypo/Zeegh/LjPBC5i45uxnZ6ZPXjz9r
	pNTtygshaGkTt1Waq8UNLWhf1Oq5f5rQRqg5h8iZaDCVub2Z/BjqQveaWrf3qPx0yjSnho9KG7aox
	hRmoDrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uIC-00000009wyJ-2NBE;
	Wed, 16 Sep 2026 18:23:36 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uI9-00000009wxm-3qYR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 18:23:34 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b74d0133e0so1213685e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 11:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583011; cv=none;
        d=google.com; s=arc-20260327;
        b=NwhVKkjyXIuaPbZhL4sttnOJ/MjAJwwjGcll6R4BMl5oGhIQlFvxbEetmZMWZBwctl
         DFZ6P+BEonw+NVWK3ZouOOIShoTY6BATUWEk2W5BgHsziMKLQF1pNKenOFQnsF3DloA5
         3v3pJcLCaOhiUCTT5ZutLT5UEuFChr+d+Mv+da2ObJro8YZocxgxbt8IvzC2nMcCplCq
         DNr2m66byVmBKHNhH6Z5845nRvv1VUr2uY2EPpn9G+r96IImvrSSe3cio3IxF6waLg2d
         sQrf40rlWLyx5S/RwPEKgq9yO2CsVDIwJWRP46tGskPalni016SGaqNZGJ74x/xEVbGE
         16MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        fh=lixgqp50E831aE/xTVrr8tbcVaFYgx8WShjjObiqxIQ=;
        b=hDmJXdW0OKpK9TYIsyUFqinHVueXVrvEMgnA/F2Dl3H4ddaQFh8T+VlM6RO+n1PClz
         I+cEHSgkUKEP1tkyRrT1Eqsu93+Kw3UdLLKD55FRKRXD2MzYWa2eLzCWUpEiLOXO2ctu
         rlUWYCnyX332Ex6sZfl04COL76HiR8fgDkd0cqup6aMpMyMM0qReP08pQSPl4Q4W7eJB
         6YIQQDbFEw077v/GeAfZAv37qnIDXHYpo4gwElwUjGmkVJUvc5acsBQoyFqS+p5KfxEn
         I+/W5gwKl83WpB2KtCljPC7NbMgnuTJROJR36XGi/Ofav/VjcjG18kdg/hYWZAi1eIlg
         Nxjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789583011; x=1790187811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        b=DRtoQLAptDPkUt7tvVJge+7FKLImO27OGH1VMVNSaO59/nKx+sQsHuqdaRdhZbPErv
         aPULPM+qxMxa+HWMEiUEXstqQuwksbsYbRpTtEjzPXclLvoYXQT0ATVKyOgc+aZ688dU
         pz5/wFaYuq8MMLsR8QQFJzFVlSdgmjp6+7QKgvHHYeDnRuF6QvhlEZwzJRRx69swl4ZS
         CW6aH59Yz9HoiSWVtMvgpRpQEIfuDIxIxPoedzFxfNYVQvwF7K8LlwKSZpQB1uPkHSHZ
         QN19FOfZLgVTT91WlzIxKbIZ2nNBEwKXNgPpJK5DypjcYDVUg23YU2Ma3KiREojgV3BD
         zR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583011; x=1790187811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        b=XqCFDRTRzhHzoQT+xwN4ESPwRRrSkpIc9sj0m5qrWRio8ZQ048xPtvYVw8I71CmAmJ
         HERYOLr798DpcFQOJWWfqduWHJ5g8h5ioWv8gMyng3Ai56rTaHPfdbGXeV2mKQV+yDB/
         iWy9jITcQyBdku/cluDVbkVxy0Devz3wJ6W8unPl5dd0j2K4e86Mw+L6h3t/V41mXdRY
         FeAiTX9m5MyI99EXTDtlOaReA+ZtJCt5dLExvTI5JBXSiRNmtcmB+3s8QNQ+E7kxeF2M
         55S1XXS25llZ4V1bgLfswzIkUmWAaetOAehSKlZXNgKIrFOwaCYqph0THrVA292IWEhu
         ej7Q==
X-Forwarded-Encrypted: i=1; AKwUvByD+n3lo90xaoHSN4Bm5gqdXaVoki+k5idkvLqstAJQtTEnfRagSK4uYnhVAjLFYemjBXTjgxGP3jeB+VJtpDBb@lists.infradead.org
X-Gm-Message-State: AFuF++ltwpneWZhKUAamkO9NdpdDiCF2vNPnWW0vtGbDz6VUeYo1NSWD
	fFQTLPPwolG6d2PJnFHpanX/RJpY5cadjdMvlC556/SKY8Rin/CXCE2Q/lEtaHGabbA9mI8L4Lg
	MZE1mb0T8jnC5NSMi6wUMEocIUHKfYvuFv24OHn/X
X-Gm-Gg: AYBFou3KBCm4sQay7u3HVkxVCywYsKcaHDOsD/ZnL9QjTIMxhCSKqPCK98zERlxyMLs
	MNnlKfjp8PCN2YnRWjDzAFzMcj/Bq/HW0rlMXfAgJbIN84vPrnTyFqrWEobitHfGc/RGY/W7RkW
	pfAZ73q9IeXxwCUjQTU49tTBR+OtoR68S9fvPBOP27mB7x7bCa9SlF0OHL3btIFhqtw+v1CEnms
	HhEGxmwHghZp1DEuHQOy1O5mRhsolYMsdaZa7mbwBSn4GeD6pO2WH1TvfNVRryKkGa24H9mkR29
	i1j7cHTMrL//pudMAssALQBvr3sR5WyEiEBwl91zcedamGieptbXdw==
X-Received: by 2002:a05:6512:1293:b0:5b6:1a7c:aa13 with SMTP id
 2adb3069b0e04-5b8b6640be1mr1009695e87.43.1789583011057; Wed, 16 Sep 2026
 11:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260912083611.2513845-1-suzuki.poulose@arm.com> <20260912083611.2513845-7-suzuki.poulose@arm.com>
In-Reply-To: <20260912083611.2513845-7-suzuki.poulose@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 16 Sep 2026 11:23:19 -0700
X-Gm-Features: AcwNN1Xa9rZlSKbZ1HJXqNvz676wwtG0Dzc3HxbzhCyZpg8GXZHTQsxrOGLMh6o
Message-ID: <CABpDEum16ZzLSjd7Yg2Ge6VjwL8S8xxtSs_AsqOeNT9-9FNKKQ@mail.gmail.com>
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_112333_976309_F20EC6A3 
X-CRM114-Status: GOOD (  11.86  )
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

On Sat, Sep 12, 2026 at 1:37=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> +static int rmi_init_metadata(void)
> +{
> +       phys_addr_t start, end;
> +       struct memblock_region *r;
> +
> +       for_each_mem_region(r) {
> +               int ret;
> +
> +               /* Firmware-reserved NOMAP regions are not usable system =
RAM */
> +               if (memblock_is_nomap(r))
> +                       continue;
> +
> +               start =3D memblock_region_memory_base_pfn(r) << PAGE_SHIF=
T;
> +               end =3D memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> +
> +               ret =3D rmi_prepare_memory(start, end);
> +               if (ret)
> +                       return ret;
> +       }

Hi Suzuki,

What happens if a system has memory regions in memblock that are not
tracked by RMM (e.g. CXL memory)?

Currently, rmi_verify_memory_tracking() returns -ENODEV for untracked
regions, causing rmi_init_metadata() to abort and disable CCA
system-wide.

Shouldn't rmi_init_metadata() skip untracked regions (continue) with a
warning/info log instead of aborting? That would allow Realm support
for conventional DRAM while leaving untracked memory for the host.

Thanks,
Alper

