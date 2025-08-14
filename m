Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9E8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8NIrhvWA3XT+D6ry67eQSgPW4LGM+PP71oE6xphaZ8=; b=zWqsyU+h738trCe7SgxB6kF11W
	+EJfjXyQmCzb+sSIC/d9UPJ5QJ9LqbR7uVTPXJMD8CflOOInP/e/Bs8R1AAAQQMbzRGx+rwDPUcp0
	7PfCVxUshOXG8rKB7ToOb0yhlhXeiWq6T0Hb2iqdX9R93lTQTH9ggOSqRVM+Jsc7WfKYl8qii3vyN
	QCqa8qqcLDSupBud6i519Xc8Kz+HZcATitT/WaOrH3dLrax+Tux/t8dbMOA1GRbY2tXOY+qIJ82uB
	GefN5v8ZR5znbQ2w60QhK50QacR4cs8VPHyOiaqoKByg+yTl0Ke+MDqPnXNEp6sGXhHI+zJB2SvVZ
	F3s6mQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umY4p-0000000H443-2unm;
	Thu, 14 Aug 2025 13:33:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXD7-0000000GrZn-2P3F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 12:37:38 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso704438a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755175056; x=1755779856; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l8NIrhvWA3XT+D6ry67eQSgPW4LGM+PP71oE6xphaZ8=;
        b=mTFoELsGuY22DWLvpxMdjTSJzLMk8P84JwgslZ014PqkqytqNyvkw2+9Ja4kzXGGA4
         vv89OFZh+QT1NtQdX5aYZR52KxPNljcjfHCNetX6u5LI41IwhUiV131TeimaKQyREkUi
         mVjcv0syW/FpuNOjQbdgeMeerErZ3Obad5TjMHSTwxJZaai5rtRk8kWjuMGl27m5CewD
         9AOpYAmwxj8pdZ2xYkC80ScFsNQHBYy9cj65peFmRPT3hWeIblHF9XftR9byi+t5qhLX
         pCXnXNCRMYrM45QHPDwyCVva7qtr6d9hFvmfpgpLOwZKmufgQiAirzGq9A+y2xEr0/bK
         1GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175056; x=1755779856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8NIrhvWA3XT+D6ry67eQSgPW4LGM+PP71oE6xphaZ8=;
        b=GzvuNvUp5IpAL6wVHAVzZvDonpMMkze54u0lMuhtUCPdp3ABjTr++NSed3s9qcza/u
         cTpGHAzdaMOcY1vNSYTNueYDryZTJqPlloSSBzZYpI/qgrkpIBS39O+FqxntG407itnD
         6nsGbydjVW7wzP3tX6zL0Il8LIfimPC0pfZVHL7lYNthhIo/gGdSv+v7sm928uV4oUbW
         Lfd8Ek5uJB63mDiI5c+G1oPUjQUs72ZAeWvFbM7J5eVAdJkeX1ivo/YsM4/I1xN6qG4X
         u1CEeZu/3DfmbJDBi7ogLQYv2jkldSBV+kDRPVCh6rQ+v+UeCeo+c/T6Q0NTZY17u7FB
         Xu8g==
X-Forwarded-Encrypted: i=1; AJvYcCXI4031D7idkic9edzhK9ZdZZQS9fq7HIQO/08ADNm8tFNyg0Y19uy22wAXY6L3+HoVg0Rws1WM2iMj6U+7YppE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2YqorwGmVQ21VuT9mKoMCPvqRBD0GVcR7X1S9utegTlmaiC48
	bvoK5Mqwo7RzBeCHodgxpaYU/OzhyewA63e3Iqh+uPQW1GTHMjcA/ijtm4UeXSnULWUCQyxPQbJ
	ExlDBCj4Be+w5prX11RWDfU7A/YD3pmEcnCCnZUmBBw==
X-Gm-Gg: ASbGnctfI5z9O6U0geY859ATH3Zc2oCq/UUSHvqtcWc+B8UqN/wVhSoiN3aYAV50riW
	GqSBOBNOE4otQvgW7FLFZAjBADQXUdkllKMX6VMw3E90mVop/+gxs6oxnDIksR8qAYTi0VOkuwD
	FLohv/2FX3o5/0xGMV+9gxsosiH/KAbUgHFnpD0AUBWQx1VUVi0iMspTwzg4+cvG28FO/a+Si3O
	f3n4KeG
X-Google-Smtp-Source: AGHT+IFp5bAV3mlCwQE02uvVSf6ZahrQODia4B5N0jsqEGKT7zYD/rS2C/DAdPrSOa20N/yIekDRogPj27rDkMSmcHo=
X-Received: by 2002:a17:90b:3d46:b0:321:265a:e0c2 with SMTP id
 98e67ed59e1d1-32327ad25femr3514452a91.32.1755175055180; Thu, 14 Aug 2025
 05:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org> <20250811-james-cs-syncfreq-v1-2-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-2-b001cd6e3404@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 14 Aug 2025 13:37:23 +0100
X-Gm-Features: Ac12FXwNdxfp1DMoW8IPZs7kHmN3duHawTMxGkhLBFv3GFYUtE-A_kMdlr2VOJY
Message-ID: <CAJ9a7Vh44rYWN3mjHPBq8pkBcPuhS2pTBZNaMpWgJECmPZtupg@mail.gmail.com>
Subject: Re: [PATCH 2/6] coresight: Fix holes in struct etmv4_config
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_053737_625071_99411D4B 
X-CRM114-Status: GOOD (  17.05  )
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

Hi James

On Mon, 11 Aug 2025 at 10:32, James Clark <james.clark@linaro.org> wrote:
>
> Lots of u8s are mixed with u64s and u32s so repack it to save a bit
> of space because there's one of these for each ETM.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 746627476bd3..a355a1e9606d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -832,28 +832,33 @@ struct etmv4_config {
>         u32                             vipcssctlr;
>         u8                              seq_idx;
>         u8                              syncfreq;
> +       u8                              cntr_idx;
> +       u8                              res_idx;
> +       u8                              ss_idx;
> +       u8                              addr_idx;
> +       u8                              addr_type[ETM_MAX_SINGLE_ADDR_CMP];
> +       u8                              ctxid_idx;
> +       u8                              vmid_idx;
>         u32                             seq_ctrl[ETM_MAX_SEQ_STATES];
>         u32                             seq_rst;
>         u32                             seq_state;
> -       u8                              cntr_idx;
> +
>         u32                             cntrldvr[ETMv4_MAX_CNTR];
>         u32                             cntr_ctrl[ETMv4_MAX_CNTR];
>         u32                             cntr_val[ETMv4_MAX_CNTR];
> -       u8                              res_idx;
> +
>         u32                             res_ctrl[ETM_MAX_RES_SEL];
> -       u8                              ss_idx;
> +
>         u32                             ss_ctrl[ETM_MAX_SS_CMP];
>         u32                             ss_status[ETM_MAX_SS_CMP];
>         u32                             ss_pe_cmp[ETM_MAX_SS_CMP];
> -       u8                              addr_idx;
> +
>         u64                             addr_val[ETM_MAX_SINGLE_ADDR_CMP];
>         u64                             addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
> -       u8                              addr_type[ETM_MAX_SINGLE_ADDR_CMP];

this is 16 x u8 - could this not just stay here?

> -       u8                              ctxid_idx;
> +
>         u64                             ctxid_pid[ETMv4_MAX_CTXID_CMP];
>         u32                             ctxid_mask0;
>         u32                             ctxid_mask1;
> -       u8                              vmid_idx;
>         u64                             vmid_val[ETM_MAX_VMID_CMP];
>         u32                             vmid_mask0;
>         u32                             vmid_mask1;
>
> --
> 2.34.1
>

These attributes have been functionally grouped for ease of
understanding. If we move the _idx values away from what they are
indexing, we probably need comments cross  referencing from where they
where and where they have gone to.

Mike


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

