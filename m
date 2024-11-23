Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D471E6ADE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0WfkyrJ5M5c1EHCbXJo+QBQ/tcQlz91DYWkGNQsi0k=; b=UGd7K0RPPog6Q/puz7Gs8yA6Bm
	0IxI7AFKtqh1cp5/EA8wYA0QXpt98ouNyZAjK35mZcuGVNAp4bnZWfOcO7HxeuhM/hkJnKNhhe1Ri
	Yle3aWNDOwqbnUpKWCG8hJJwgZYd2ytvkAwiRZ8SRo6Hb/zuFf7Ul+xp9h4nKfgf5awJFq7ymbVRj
	4nJIevF6nCAqrks2xOg8BAPWfs2MUZuftsoAXG3sIELxtwszze7PyAY5CKkdG+DxVnhOVNIk7KTU0
	odUgSfvlQU9RMDwxGE4H9Dc1mhWQPKWi4ca3ke6Rtc5jtx+BtwMN/cOZN4h8RnfHuHAumk2+Agpgp
	pPZUTQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsy1-00000004bDO-022n;
	Sat, 23 Nov 2024 16:26:41 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsx3-00000004b52-3LIx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 16:25:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so276484e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Nov 2024 08:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732379139; x=1732983939; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0WfkyrJ5M5c1EHCbXJo+QBQ/tcQlz91DYWkGNQsi0k=;
        b=jilEcuoVxa4P6/ktl1qIXwRtoJB4BaLbwAkIxQIMHiswW7WUkzrH0zbXcy1e40YrdT
         l7kdR0U+k8rSKrka1CxmBBW4nnwjrPvPrFgRL3pTJNVAX78G9PBQHhzcUj1UoKIzOrsP
         SRLapfzEge0HR1e8H3YZP3cUO4y3TWUXYvNoNMcExIpTVi/F0U/3ZLC7cxCAd7VE4s/g
         e9rB5O8xQ3XnWcyN4JsRzpNlLVU4gYB1vdHAZGiptwnDO3EL1MfFiq/JQhGjEJgjZ9J9
         048mrnJ5kY7tsHKEzW1hoTMq9/4yKDEP01l999OEj4jnV9XVgSlVAievbrpNt4roUGap
         T9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732379139; x=1732983939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0WfkyrJ5M5c1EHCbXJo+QBQ/tcQlz91DYWkGNQsi0k=;
        b=id/dIOwxdApbKZ1DIHqGyfQ/jZ34VZg0391P6J9ZBJ2EZEAKLzLv8sxlyP4FXvncEj
         u4MDQZGzYrFQ5cKk/iLsUAu3waVG9o/KuB8SrbX5IpzPu0ZgSKU7K+498xwD8UxZE794
         zTZ5a0GQnoTn4qxzGI2zS0Z6sTkEUWIm8z9lVX8h7hGQWFCnodVKqiPFK7Xxx6dswT0x
         bJ0fNWFtek+/8JqlYHRJiXhG1953aItkbU8/HvdewkMHpnIbi2D3vgCBwd3gX2vcqSah
         iJ0TCQmJUP33V1YUfmNYbaig66LeFFlTZWwaXvbr1fxYmUPDiMJxngTvmkafMj7j3O0j
         M5EA==
X-Forwarded-Encrypted: i=1; AJvYcCWqQxL7zuYphigfRKuERSID0YqgNvPo+1H4esSs3iWEAAAhqR4ZZTDWITPVTEjhG28Dzs8POjmcp72vu+Z3poly@lists.infradead.org
X-Gm-Message-State: AOJu0Yydo0UY9oewqEquE4+obJnfz7eNpXY+EoTbQBNKzsHTRKEhV8+Y
	T0o6rBLPcn8B8sYNg11KBDW1ujwy0/GWntrHc6fK+il2BTOdXJJ6PPj5n4KL64o=
X-Gm-Gg: ASbGncuUDD0LnNrJkgtyubLu68xr6I4RqjE5t7xslv4CHK3GnYNGzTbfGEg3K+ec4/r
	EiDfAhnC7/f2pdBLc/TUks8aXeN+M+3XVnI4YxWyGwkipLMHmO4VABC5eL1htkesPZxOzNDd3xO
	V/cAWrTZdPIDTNW9BIcarVtMwm0TNjaqxhTFTns0VAqc8cuee4gHYtGY++3Bg/h/ybzFE0d2vsE
	Ix1AdgP38yaoGU2q/kxPr8zxboc70L8V9sBJySXrxQ73jzRrcGbKAsyVWYJGEuL8/E2IBGGv5wI
	TD59jQC9BuB2uTH8CyXQmKq1eNv6lQ==
X-Google-Smtp-Source: AGHT+IH0FijO2SCRMC1LCQPu6j8HOzuiL5/TLdkFvdxMRGvQXC0A8eetmKI0u9hXwy/W2dw3JJlAsQ==
X-Received: by 2002:a05:6512:10d5:b0:53d:dbc4:3b8f with SMTP id 2adb3069b0e04-53ddbc43c2amr1006674e87.13.1732379138690;
        Sat, 23 Nov 2024 08:25:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24455e6sm966524e87.3.2024.11.23.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 08:25:38 -0800 (PST)
Date: Sat, 23 Nov 2024 18:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/9] Add display support for QCS615 platform
Message-ID: <du7cgpijmpcgyktruvjotclluil7eldw7s5bdv2dkg45iii52c@3ulju66s3yic>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_082541_866659_8B740BE8 
X-CRM114-Status: GOOD (  24.58  )
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

On Fri, Nov 22, 2024 at 05:56:43PM +0800, Fange Zhang wrote:
> This series aims to enable display on the QCS615 platform
> 
> 1.Add MDSS & DPU support for QCS615
> 2.Add DSI support for QCS615     
> 
> QCS615 platform supports DisplayPort, and this feature will be added in a future patch
> 
> This patch series depends on below patch series:
> - rpmhcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com/
> - gcc
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com/
> - base
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> - Apps SMMU
> https://lore.kernel.org/all/20241105032107.9552-4-quic_qqzhou@quicinc.com/
> - I2C
> https://lore.kernel.org/all/20241111084331.2564643-1-quic_vdadhani@quicinc.com/
> - dispcc
> https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
> - dispcc dts
> https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> Changes in v3:
> - Add reg_bus_bw for sm6150_data [Dmitry]
> - Remove patch for SX150X defconfig [Dmitry]
> - Remove dsi0_hpd_cfg_pins from ioexp [Dmitry]
> - Remove dsi0_cdet_cfg_pins from ioexpa [Dmitry]
> - Remove tlmm node for ioexp_intr_active and ioAexp_reset_active [Dmitry]
> - Remove qcs615_dsi_regulators and reuse sdm845_dsi_cfg [Dmitry, Konrad]
> - Rename qcs615/QCS615 to sm6150/SM6150 for whole patch [Dmitry]
> - Rename qcom,dsi-phy-14nm-615 to qcom,sm6150-dsi-phy-14nm [Dmitry]
> - Rename qcom,qcs615-dsi-ctrl to qcom,sm6150-dsi-ctrl [Dmitry]
> - Rename qcom,qcs615-dpu to qcom,sm6150-dpu [Dmitry]
> - Rename qcom,qcs615-mdss to qcom,sm6150-mdss [Dmitry]
> - Split drm dsi patch to dsi and dsi phy [Dmitry]
> - Update yaml clocks node with ephemeral nodes and remove unsed include [Dmitry, Rob]

So, it seems it was not a complete truth.

Fange, please make sure that dt-bindings and driver patches can be
applied on top of the msm/msm-next, otherwise I can not pick them.
The tree must build w/o warnigns with W=1 and pass dt_binding_check with
no additional errors / warnings.

> - Link to v2: https://lore.kernel.org/r/20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com
> 
> Changes in v2:
> - Add QCS615 DP controller comment in commit message [Dmitry]
> - Add comments for dsi_dp_hpd_cfg_pins and dsi_dp_cdet_cfg_pins [Dmitry]
> - Add missing port@1 for connector for anx7625 [Dmitry]
> - Change 0 to QCOM_ICC_TAG_ALWAYS for mdss interconnects [Dmitry]
> - Change 0 to GPIO_ACTIVE_HIGH for GPIO flags [Dmitry]
> - Move anx_7625 to same node [Dmitry]
> - Move status to last in mdss_dsi0 [Dmitry]
> - Rename dsi0_hpd_cfg_pins to dsi_dp_hpd_cfg_pins in ioexp [Dmitry]
> - Rename dsi0_cdet_cfg_pins to dsi_dp_cdet_cfg_pins in ioexp [Dmitry]
> - Rename anx_7625_1 to dsi_anx_7625 in ioexp [Dmitry]
> - Remove absent block in qcs615_lm [Dmitry]
> - Remove merge_3d value in qcs615_pp [Dmitry]
> - Remove redundant annotation in qcs615_sspp [Dmitry]
> - Remove unsupported dsi clk from dsi0_opp_table [Dmitry]
> - Remove dp_hpd_cfg_pins node from ioexp [Dmitry]
> - Splite drm driver patches to mdss, dpu and dsi [Dmitry]
> - Link to v2: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com
> 
> ---
> Li Liu (9):
>       dt-bindings: display/msm: Add SM6150 DSI phy
>       dt-bindings: display/msm: dsi-controller-main: Document SM6150
>       dt-bindings: display/msm: Add SM6150 MDSS & DPU
>       drm/msm: mdss: Add SM6150 support
>       drm/msm/dpu: Add SM6150 support
>       drm/msm/dsi: Add dsi phy support for SM6150
>       drm/msm/dsi: Add support for SM6150
>       arm64: dts: qcom: Add display support for QCS615
>       arm64: dts: qcom: Add display support for QCS615 RIDE board
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  |   1 +
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 113 +++++++++
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 250 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  76 ++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 186 ++++++++++++++-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   4 +-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
>  16 files changed, 928 insertions(+), 2 deletions(-)
> ---
> base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
> change-id: 20241112-add-display-support-for-qcs615-platform-674ed6c8e150
> prerequisite-message-id: <20241022-qcs615-clock-driver-v4-2-3d716ad0d987@quicinc.com>
> prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
> prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
> prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
> prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
> prerequisite-message-id: <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>
> prerequisite-patch-id: cd9fc0a399ab430e293764d0911a38109664ca91
> prerequisite-patch-id: 07f2c7378c7bbd560f26b61785b6814270647f1b
> prerequisite-patch-id: a57054b890d767b45cca87e71b4a0f6bf6914c2f
> prerequisite-patch-id: 5a8e9ea15a2c3d60b4dbdf11b4e2695742d6333c
> prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
> prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
> prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
> prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
> prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
> prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
> prerequisite-message-id: <20241105032107.9552-4-quic_qqzhou@quicinc.com>
> prerequisite-patch-id: aaa7214fe86fade46ae5c245e0a44625fae1bad3
> prerequisite-patch-id: 4db9f55207af45c6b64fff4f8929648a7fb44669
> prerequisite-patch-id: 89ce719a863bf5e909989877f15f82b51552e449
> prerequisite-message-id: <20241111084331.2564643-1-quic_vdadhani@quicinc.com>
> prerequisite-patch-id: 3f9489c89f3e632abfc5c3ca2e8eca2ce23093b0
> prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
> prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
> prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
> prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
> prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
> prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
> prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
> prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
> prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
> prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
> prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
> prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
> prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
> prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
> prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
> 
> Best regards,
> -- 
> fangez <quic_fangez@quicinc.com>
> 

-- 
With best wishes
Dmitry

