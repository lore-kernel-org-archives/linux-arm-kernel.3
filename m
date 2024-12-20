Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E7AE7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 05:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLpODaYRyFEauMGVSyk9T1QhhMdmd8z0vW52xuJIe/8=; b=3eOuRzSy2YOPR/wz1p5rZMT8Ql
	UBaRxYUgNIpU/Z/cKFef8YwXGXUfZ4KydhAEuJrjqk29KR3CTGQn9gJ8oSEag6Z+raVBq8G1oQP23
	zFm4ojwFcUBX0Sgg3NRGVC3iH6SONcO23TwyzfiNFBiikMO/qt5sZFto6cJe9mlpjJjQadXPKTmsF
	o2u4vJO/QqAPB8CGb/gwQfVO08W2ow5TqzB5TPvsIahrSIYRB7vnIue38aghIoeTzu2cIBzjmd0wg
	mI3zc/4eCVmouN0Ua/s2S5Pnn/fGs6UB6nt65PNnQGq2sHtwBDrEMIH+BEmfr+mr0pflaWFqeCnhX
	EdlyzfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVim-00000003zRZ-30Ou;
	Fri, 20 Dec 2024 05:38:44 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVhT-00000003z9o-3LuD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 05:37:25 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e5390ed85a1so141163276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734673042; x=1735277842; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLpODaYRyFEauMGVSyk9T1QhhMdmd8z0vW52xuJIe/8=;
        b=nMRIw+3BPnsDyIpE0WiZRE5GnNX/z7weFeefNZksvEG2JMh90P68MiPP+VafPEL3Xp
         D+8WGCkx/sN757njB0Y5Pnv6cZIIj1+BGX/2Fg4PClyZJqdZ4herPZ55mbs21rGSt/me
         8ypb9V6Ken2J+9VBnRegA4hAMHIG4DXlRQcHfU5Qzw52yVKKOxKvGhDnLaBAWR413AyU
         JST2pHJHtAcw8DNaeCkbxNPt9/MlYLlUUlaDIlr1N+UUFXVYMRO0PZP09iga1IrY6atZ
         EMXkOUpYC9FgSHxVtV8+uHLOEanl4n8qvm7NmBNAndVUmmJTnTWUfJCIj7CKHB2m0EcX
         2skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734673042; x=1735277842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLpODaYRyFEauMGVSyk9T1QhhMdmd8z0vW52xuJIe/8=;
        b=PrZTWPm7EcbBlAiIOdDGjPSrk+k8EIK5TPtmH2sgd9G8e5UX4qUhTWIA6ytq5scoNl
         xNCVBTF4C2Afdg7BufADUzWdDYDrxlEpRjeq3AMbthvqbb496Nq+tqpgbxjVcV5rkvaA
         wwCriB0LFpCwaxRJKRwOYfQ8oa+UOVZldhWp9JSBHpAYEJt51J2CeQ7pSbVi9vwFUWlV
         SC3wo+tSDgeX+fDrquqr4O1yBJAUTL5sIlUNsHGieOIbXMQyCk3SgndUpW3FeB12L7Oh
         yzkWSqytwoc7dCeHjS4wm2RpgrMYCmazUb5Da1LDSMHGahFxpQUTkVvy5wL6aGuKiyY8
         wTZw==
X-Forwarded-Encrypted: i=1; AJvYcCXmROI+Z9jwsTOzaryq9SYt8NWLvGxIpyjmpWsvimiVOsd5dqNkbxlMQqlRJ/9L+aQgdHGE0DyEJ6nw9NgXQYeW@lists.infradead.org
X-Gm-Message-State: AOJu0YwwN8fGKM+eVuzUg5jNiGGLYtiMcUKlKoivSHlRO1anugN+NJ35
	DGPRLZj2cilF8af4SmhK726A6Bwo1xh7IjwRAY/YvBXcOKNdo5v07nvkB1970JYMQNk9rqb8D6z
	bzhQs/UZW3fOuMriO1R6iWj3u8iTrxnKePZRg7A==
X-Gm-Gg: ASbGnctbuakAOV++G0NWa25xIh0orTXjmE6tvUAMmsaOL7hZ/9sdMy+4pf5K3FDhTpY
	fZh0BJaboo9tcZoOtfp2n+EsqXG2eC7yWyKMsy+B+itUz5LrthO2p
X-Google-Smtp-Source: AGHT+IFGtCjCZ+VojYNyMK2Y/K7VXCStGJjA+69HR5EsAR1bloqgbrLQAQ6WEmjrZhxmttZwb8bmMWY+OJBKwRQPbj4=
X-Received: by 2002:a05:690c:f84:b0:6ef:9017:3cc8 with SMTP id
 00721157ae682-6f3f8219d5bmr11574697b3.31.1734673042550; Thu, 19 Dec 2024
 21:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com> <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
 <654c30ec-7d7e-4956-9a48-15bfcea34acc@rock-chips.com>
In-Reply-To: <654c30ec-7d7e-4956-9a48-15bfcea34acc@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 07:37:11 +0200
Message-ID: <CAA8EJpqk-iim668ZTzQaROJmkTr2COBwA5G9Eg73uLE28XHYpg@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy configuration.
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_213723_861559_F708B91E 
X-CRM114-Status: GOOD (  28.58  )
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

On Fri, 20 Dec 2024 at 05:37, Damon Ding <damon.ding@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2024/12/20 8:13, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
> >> Add support to configurate link rate, lane count, voltage swing and
> >> pre-emphasis with phy_configure(). It is helpful in application scenarios
> >> where analogix controller is mixed with the phy of other vendors.
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> - remove needless assignments for phy_configure()
> >> - remove unnecessary changes for phy_power_on()/phy_power_off()
> >> ---
> >>   .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
> >>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 56 +++++++++++++++++++
> >>   2 files changed, 57 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> index 6f10d88a34c5..9429c50cc1bc 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> @@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
> >>      if (dp->plat_data->power_on)
> >>              dp->plat_data->power_on(dp->plat_data);
> >>
> >> +    phy_set_mode(dp->phy, PHY_MODE_DP);
> >>      phy_power_on(dp->phy);
> >>
> >>      analogix_dp_init_dp(dp);
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> >> index 3afc73c858c4..613ce504bea6 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> >> @@ -11,6 +11,7 @@
> >>   #include <linux/gpio/consumer.h>
> >>   #include <linux/io.h>
> >>   #include <linux/iopoll.h>
> >> +#include <linux/phy/phy.h>
> >>
> >>   #include <drm/bridge/analogix_dp.h>
> >>
> >> @@ -513,10 +514,25 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
> >>   void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
> >>   {
> >>      u32 reg;
> >> +    int ret;
> >>
> >>      reg = bwtype;
> >>      if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
> >>              writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
> >> +
> >> +    if (dp->phy) {
> >> +            union phy_configure_opts phy_cfg = {0};
> >> +
> >> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
> >
> > Should not be necessary, you are only setting the .set_rate.
>
> Indeed, this can be dropped.
>
> >
> >> +            phy_cfg.dp.link_rate =
> >> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> >> +            phy_cfg.dp.set_rate = true;
> >> +            ret = phy_configure(dp->phy, &phy_cfg);
> >> +            if (ret && ret != -EOPNOTSUPP) {
> >> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> >> +                    return;
> >> +            }
> >> +    }
> >>   }
> >>
> >>   void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
> >> @@ -530,9 +546,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
> >>   void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
> >>   {
> >>      u32 reg;
> >> +    int ret;
> >>
> >>      reg = count;
> >>      writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
> >> +
> >> +    if (dp->phy) {
> >> +            union phy_configure_opts phy_cfg = {0};
> >> +
> >> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
> >> +            phy_cfg.dp.set_lanes = true;
> >> +            ret = phy_configure(dp->phy, &phy_cfg);
> >> +            if (ret && ret != -EOPNOTSUPP) {
> >> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> >> +                    return;
> >> +            }
> >> +    }
> >>   }
> >>
> >>   void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
> >> @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
> >>   void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
> >>   {
> >>      u8 lane;
> >> +    int ret;
> >>
> >>      for (lane = 0; lane < dp->link_train.lane_count; lane++)
> >>              writel(dp->link_train.training_lane[lane],
> >>                     dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
> >> +
> >> +    if (dp->phy) {
> >> +            union phy_configure_opts phy_cfg = {0};
> >> +
> >> +            for (lane = 0; lane < dp->link_train.lane_count; lane++) {
> >> +                    u8 training_lane = dp->link_train.training_lane[lane];
> >> +                    u8 vs, pe;
> >> +
> >> +                    vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
> >> +                         DP_TRAIN_VOLTAGE_SWING_SHIFT;
> >> +                    pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
> >> +                         DP_TRAIN_PRE_EMPHASIS_SHIFT;
> >> +                    phy_cfg.dp.voltage[lane] = vs;
> >> +                    phy_cfg.dp.pre[lane] = pe;
> >> +            }
> >> +
> >> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
> >> +            phy_cfg.dp.link_rate =
> >> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> >
> > This two should not be necessary, please drop them.
>
> These two are necessary for rk_hdptx_phy_set_voltage(), so they cannot
> be dropped.

Please review the documentation for struct phy_configure_opts_dp and
fix your PHY driver to skip the values for which the .set_foo isn't
set. Then you might have to change this part.
You are setting just .set_voltages. It means that the rate and .lanes
shouldn't be changed and can be used as they were set by the previous
calls to phy_configure().

>
> >
> >> +            phy_cfg.dp.set_voltages = true;
> >> +            ret = phy_configure(dp->phy, &phy_cfg);
> >> +            if (ret && ret != -EOPNOTSUPP) {
> >> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> >> +                    return;
> >> +            }
> >> +    }
> >>   }
> >>
> >>   u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
> >> --
> >> 2.34.1
> >>
> >
>
> Best regards,
> Damon
>


-- 
With best wishes
Dmitry

