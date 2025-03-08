Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=; b=gQ4UthpqM+73Jfrn4HS2MKROVE
	V/4RxHP/e6JNkqbfro8Tq32xgfOnn7C6JzkeGsbYk/Ect9Ycd4z+33jor2mrfXZtoF7LmcUyxH+90
	TREqnClvGX9JZQnfEA3f0FEtwsm8HUCXkBtyRwlWZ9PgI3ZDA1vOjzNMrR5TWoePX0MSUgG1SQxiW
	UXvMwFzh00akV2MltbcHKXZ2Aqtd7HvDlKD/CrDtdVQWkf0fMJE0T96h1/hgMWPP0XjI2OOkl+akp
	xh1BcZKkukuoBG/53PAVSDvWx9z5xPOD1HCW89mOVVzJ1DMKdSBJG8gEDeGDXcQbBvGvG+bHokJaT
	j+/GnhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqw4s-0000000Gn2Y-3Dqx;
	Sat, 08 Mar 2025 15:27:02 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqw3F-0000000Gmw1-0Klq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:25:22 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30795988ebeso29195931fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741447519; x=1742052319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=;
        b=dakNTSbtbcQS+J88gSg4jQ0BdDWsOudorvPYI8J0ZOvsTvZbSW3fIyletzXenX2xWA
         q1HHg3CJh7rBDK9hLGBEMqHjd80UFmToaNpnWqiOu/7b7CR8JvqH7Yj1OZVDhEfjxB9g
         poZ/uk8XMlS13TKrlzqNvMs0cLnwz1UEALgYPY+SbBQfFXsTfuHvSX4aHbJld0/OpXJW
         ZvvG06zl3NAJV8wkRze8jw31KVmJtyk0eDG8vWmb2TASDB0o/U4pIS0418PcLkVE7Z63
         FG/qfH8WiV1/OSQX31KOSnyI8rbSSCO55AmonLsJxDwKn9NZhFFbMGvMRgsc5Cwd7CLD
         Pbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741447519; x=1742052319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKBg6m2ZBD+SRolEbJmxTaEbWBs0aYZ+E9F5kWCXB5g=;
        b=Br1nuZZVqozHd64NCYqIPuN76eoKzH210gnMDGijo5ahGCo01H9AufITnktdpvgxNI
         pHS4+qtmzZXndfMkCa5L0pI/WDjO63a7Pv4pkuaGXii/ccoegqagUXjTSy0GE+K50ga9
         L4OZ8yAEWZv7glb9zexUepg/ogy47efbHWTgHKQVaH0zRFXg2ITn3zokaXAQJc5BH324
         DxZIMePQRakMtSqOv2MUsdRrqH/sEndb/lthqDN1OzpTIMw0mPwIzv2wqCobC6fjjTFk
         LvTIG5GvlA+AmDVHfHnmFkcv0z9K2D489jzRF4d+MIWlVum9hQW5bw6zyz2j/4TAawSb
         /VTg==
X-Forwarded-Encrypted: i=1; AJvYcCUWpszURHkelaMpm9/LNlHasfesxFtGzkKOq2kgUuiXPeDO25bhOI3TFHmvYym4kmVw4EN4T/Yqgc4zfHVygJt8@lists.infradead.org
X-Gm-Message-State: AOJu0YzZDXhLmZqg7EASkRhpuMDxbJeZbTSHqz/V+EQE7A47B/OrJJLd
	+lRQjAK0XgJHK8rxvsyyt1f/52U/IBq/WEcKpEOD+WhJ4ia8ue4LVkLaye3ej0Y=
X-Gm-Gg: ASbGnctKeN+A9c4ILjeCX9GfK19yY66qDTUwMAZ1MPi/88cWShd/a+0NhKV6n8+3Iil
	KyChODcbbPLLEQ9OXXxWCUo3/NW0v6IsRCC2AoXrXFUP9RAAKVI2mFvzxUMreZHYCJy/x4xi5MU
	bzE6Adl82xrmUJXjdUe1RKglX2MFhpcuZkwDp99WEyusTxe9D9WnJcktkwPCBxicii8X2cnuIhm
	7cCw3NlxKwIOSBQdjYriCkzU6yDxj6H2jul3dw7i5/76TQUyHWwBCDrc1SVNYE+/gV6H3aEnNA8
	bxuZdFtQXhMQblZKH+qJCVFrljjXVPa5yua8fsvZIQG2hCCSCtIzB6fwakm7HLjLpvIShag5fBe
	eF8+QdZ5Fl97aZG1hWt0oLlDP
X-Google-Smtp-Source: AGHT+IGa+Ul+zGmtbtHzOv+NiUo+h+jc38TvQkxrCnLVKsfBxUNjbh9YNgRAJWxI0GRtuRncaHMZ6w==
X-Received: by 2002:a05:651c:19a1:b0:30b:ec4d:e5df with SMTP id 38308e7fff4ca-30bf466dbcfmr32754081fa.34.1741447518937;
        Sat, 08 Mar 2025 07:25:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c85c0sm9452071fa.87.2025.03.08.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 07:25:17 -0800 (PST)
Date: Sat, 8 Mar 2025 17:25:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
Message-ID: <qextyfjeniihulyilehcldd5x5pdpaxo3etstlcq4a43cka3a4@4n3mqkjjysqt>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
 <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_072521_140524_CEBEEC64 
X-CRM114-Status: GOOD (  21.17  )
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

On Sat, Mar 08, 2025 at 03:17:23PM +0100, Konrad Dybcio wrote:
> On 8.03.2025 2:42 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
> > is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
> > the configuration is the same as SM8550 DSI PHY.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
> >  3 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >  	  .data = &dsi_phy_7nm_cfgs },
> >  	{ .compatible = "qcom,dsi-phy-7nm-8150",
> >  	  .data = &dsi_phy_7nm_8150_cfgs },
> > +	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
> > +	  .data = &dsi_phy_5nm_sar2130p_cfgs },
> >  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
> >  	  .data = &dsi_phy_7nm_7280_cfgs },
> >  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
> >  
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> >  	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
> >  };
> >  
> > +const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
> > +	.has_phy_lane = true,
> > +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> > +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> > +	.ops = {
> > +		.enable = dsi_7nm_phy_enable,
> > +		.disable = dsi_7nm_phy_disable,
> > +		.pll_init = dsi_pll_7nm_init,
> > +		.save_pll_state = dsi_7nm_pll_save_state,
> > +		.restore_pll_state = dsi_7nm_pll_restore_state,
> > +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> > +	},
> > +	.min_pll_rate = 600000000UL,
> > +#ifdef CONFIG_64BIT
> > +	.max_pll_rate = 5000000000UL,
> > +#else
> > +	.max_pll_rate = ULONG_MAX,
> > +#endif
> > +	.io_start = { 0xae95000, 0xae97000 },
> > +	.num_dsi_phy = 2,
> > +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> > +};
> 
> I'm squinting very very hard and can't tell how this is different from
> dsi_phy_4nm_8550_cfgs

97800 uA vs 98400 uA is the only difference AFAIK.

-- 
With best wishes
Dmitry

