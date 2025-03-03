Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27889C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw6/8c80oXJe6NH1bCDHhdB7//uqsyHdcvO1rFYowNk=; b=rWAGKAxTKDgFs4NuY+3E52XLj8
	qfwnAYBWlaOJi956i1bFn1i0wGCtjR663fj44S7r9/q85hayfyGkG0W6z5bHhDjRkCfjqKeO2No89
	RheD5g/9qT1k2TcLZkWHaf95rggAxwbLhICNE/vaCZtdBabA3wZH6p1mESdO2Oq+OY7htdKudIxxL
	4SdG04pgAyjrJh4qSYtCKxh4D9deljmkdfw6yWL+jlwcZEBRg+AMvKBOBYLZOQAA9gaf4AORz8JY7
	ftBjvbIR1MrpUOvColjnjLxZ73NJ4X8dH8KlNKsS8VHl4tH3YGm7PDeQL1jUtCWX/efC/gsXmoG/y
	c+JTYWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5On-00000000pl4-0iHo;
	Mon, 03 Mar 2025 12:59:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5Mh-00000000pKB-096P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 12:57:48 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54943bb8006so4799248e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741006665; x=1741611465; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rw6/8c80oXJe6NH1bCDHhdB7//uqsyHdcvO1rFYowNk=;
        b=j5z9+qnlUvMJqF/z/M1MZZxzWNKZtXLrQPB9xhlCYR1J1YJ/RTUvwKVOSICKfKYSGH
         a1hpuHdRBHlOZ+4XlCDnuXT+7L0gr1/hMxlMmGb3CnAjvJ/vnz3U5OKinlp42DwJeN8o
         kQl9k0Sv2cHlfHZwXKUgmvn3ggcH0kFCM7hLpVrKWoYUakqdeXEMIpS/+r4VVdWBZadG
         YOG7wDowJxZLDourMjjh44vVo/wmAfbobi3DuaJz06cHQaNGLPjpZOC4NpXSx9r6W7np
         oOrJUM4i+6WrCIVno0uqOSgBjrqkkuhp2x0XFvy6GY6E/SW+REEqb3OHx96zGko07OJg
         BLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741006665; x=1741611465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rw6/8c80oXJe6NH1bCDHhdB7//uqsyHdcvO1rFYowNk=;
        b=xSgCaeeZoqpjINz6WOxv5WsDjixaaGxWIYaRsJ1wvUBNxaR40do1e0yTApIXQiDx3e
         9pgxqHqS48ZE3JVtGHgXs+qI2HSzMYk+pmhjPjJxgjH0P4VyAO1kXCifascvkdJ2aPZI
         q2IC+dwP76f2uvphx2k08P7QbvbjkZmYEPDKRSijX/+Ff6BwrIp5Nowh6wI6IDiQx7h+
         IYPnTBZkAyE7ywtjg/7mnkOSu1jGrclo7BibSCNsyhLiiXcOwHYGm8ZOfhfjXA+u7WA1
         L270aDhd0VCKO9zcR/I2XXVaMni6PzIEihSrQ7Eww4KOU500wYTTUwyDRSADh6PYTYnz
         gHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlKIGXt5B7Jihly9S4BquRY/b0XvCVmrmw/EQI8zQK2VNLg5oYS1Cm0gpQKP7960qfQ/rJJvS7UEGPbXeJIQ87@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqu+u8ljWxvL0LjOz75SVQeoXWIkHcNczVWkZ+3FnswOOOT/vH
	YjbFP+a9l1uCEW/5JTv75b+JEpuTTLFKyvw5crPaKE/JPsJDV+EAMNMnan8GVAE=
X-Gm-Gg: ASbGncsHA3sLLE4dPCz/cs8LsuDEPKxPsLPdIYEzrwEvUbFACd+j1Djjs9xCoosJiuf
	WaMpQH5IPlogyi9shj1CfqvZp+Tjzl1YOhespwj3XO7pVEtYZ0ks7hgOqMQMZXGAtt2EOoKWQ9E
	Tr2tsXnBvm2jH/kuyISnAq4xkJJu/IWQqqr9TuaRnF8tNcjsoW/iLweJyjJoqgewHoMT4z8FqQZ
	lKipxNl7/zj+ac0dAjOb7Y1IlBsL0oFxXoyiL85DMlEkzLFsFRzt0268XitqeF6mxAr+mOJ3KRI
	k+k6kyB4XP5Qwk/zRIf4ZrfTSmXEo6ZrDoI8q7JtdkK6VchKNLrgXVFpWWLKs5WjtqiwEFhLX9A
	/b7arUq2x9sOC27mzMJMk9OzA
X-Google-Smtp-Source: AGHT+IEjjiVkoNRYdat4T0qxmeBYEe6kE8gmB95rUVf9r8bSvejeCAHmMqYFebm9jSnJR4afSnK9VA==
X-Received: by 2002:a05:6512:318e:b0:549:38d5:8858 with SMTP id 2adb3069b0e04-5494c124ab1mr4483210e87.20.1741006664977;
        Mon, 03 Mar 2025 04:57:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494ad419acsm1117002e87.127.2025.03.03.04.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 04:57:44 -0800 (PST)
Date: Mon, 3 Mar 2025 14:57:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yubing Zhang <yubing.zhang@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>, neil.armstrong@linaro.org, 
	sebastian.reichel@collabora.com, heiko@sntech.de, devicetree@vger.kernel.org, hjc@rock-chips.com, 
	mripard@kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, 
	robh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller support
 library
Message-ID: <udunb6r3yvjc5i5cfk5xeaz6ezvyzbnor3gujjhcfoavdwtrsl@26yxnjan6yqb>
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
 <563i7xcbbsxfezkgs4txsa6lar5tb5folp7zk7dc7sbvf54n6y@vqbtuwvj3fcw>
 <65706d63-18aa-41e0-81c4-4eab3d186250@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65706d63-18aa-41e0-81c4-4eab3d186250@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_045747_079461_A32ED027 
X-CRM114-Status: GOOD (  36.45  )
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

On Mon, Mar 03, 2025 at 04:59:50PM +0800, Yubing Zhang wrote:
> Hi Dmitry,
> 
> On 2025/3/2 2:14, Dmitry Baryshkov wrote:
> > On Sun, Feb 23, 2025 at 07:30:25PM +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > The DW DP TX Controller is compliant with the DisplayPort Specification
> > > Version 1.4 with the following features:
> > > 
> > > * DisplayPort 1.4a
> > > * Main Link: 1/2/4 lanes
> > > * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> > > * AUX channel 1Mbps
> > > * Single Stream Transport(SST)
> > > * Multistream Transport (MST)
> > > *Type-C support (alternate mode)
> > > * HDCP 2.2, HDCP 1.3
> > > * Supports up to 8/10 bits per color component
> > > * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> > > * Pixel clock up to 594MHz
> > > * I2S, SPDIF audio interface
> > > 
> > > Add library with common helpers to make it can be shared with
> > > other SoC.
> > > 
> > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > drm/bridge: cleanup
> > 
> > Stray line?
> > 
> > > 
> > > ---
> > > 
> > >   drivers/gpu/drm/bridge/synopsys/Kconfig  |    7 +
> > >   drivers/gpu/drm/bridge/synopsys/Makefile |    1 +
> > >   drivers/gpu/drm/bridge/synopsys/dw-dp.c  | 2155 ++++++++++++++++++++++
> > >   include/drm/bridge/dw_dp.h               |   19 +
> > >   4 files changed, 2182 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-dp.c
> 
> ......
> 
> > > +
> > > +static u8 dw_dp_voltage_max(u8 preemph)
> > > +{
> > > +	switch (preemph & DP_TRAIN_PRE_EMPHASIS_MASK) {
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_0:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_3;
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_1:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_2:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_1;
> > > +	case DP_TRAIN_PRE_EMPH_LEVEL_3:
> > > +	default:
> > > +		return DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
> > > +	}
> > > +}
> > > +
> > > +static void dw_dp_link_get_adjustments(struct dw_dp_link *link,
> > > +				       u8 status[DP_LINK_STATUS_SIZE])
> > > +{
> > > +	struct dw_dp_link_train_set *adjust = &link->train.adjust;
> > > +	u8 v = 0;
> > > +	u8 p = 0;
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < link->lanes; i++) {
> > > +		v = drm_dp_get_adjust_request_voltage(status, i);
> > > +		p = drm_dp_get_adjust_request_pre_emphasis(status, i);
> > > +		if (p >=  DP_TRAIN_PRE_EMPH_LEVEL_3) {
> > > +			adjust->pre_emphasis[i] = DP_TRAIN_PRE_EMPH_LEVEL_3 >>
> > > +						  DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > +			adjust->pre_max_reached[i] = true;
> > > +		} else {
> > > +			adjust->pre_emphasis[i] = p >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
> > > +			adjust->pre_max_reached[i] = false;
> > > +		}
> > > +		v = min(v, dw_dp_voltage_max(p));
> > > +		if (v >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3) {
> > > +			adjust->voltage_swing[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_3 >>
> > > +						   DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > > +			adjust->voltage_max_reached[i] = true;
> > > +		} else {
> > > +			adjust->voltage_swing[i] = v >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
> > > +			adjust->voltage_max_reached[i] = false;
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void dw_dp_link_train_adjust(struct dw_dp_link_train *train)
> > > +{
> > > +	struct dw_dp_link_train_set *request = &train->request;
> > > +	struct dw_dp_link_train_set *adjust = &train->adjust;
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < 4; i++) {
> > 
> > Shouldn't it be a loop up to link->lanes?
> > 
> > > +		if (request->voltage_swing[i] != adjust->voltage_swing[i])
> > > +			request->voltage_swing[i] = adjust->voltage_swing[i];
> > > +		if (request->voltage_max_reached[i] != adjust->voltage_max_reached[i])
> > > +			request->voltage_max_reached[i] = adjust->voltage_max_reached[i];
> > > +	}
> > > +
> > > +	for (i = 0; i < 4; i++) {
> > > +		if (request->pre_emphasis[i] != adjust->pre_emphasis[i])
> > > +			request->pre_emphasis[i] = adjust->pre_emphasis[i];
> > > +		if (request->pre_max_reached[i] != adjust->pre_max_reached[i])
> > > +			request->pre_max_reached[i] = adjust->pre_max_reached[i];
> > 
> > Why do you need separate request and adjustment structs?
> During link training cr sequence, if dprx keep the LANEx_CR_DONE bit(s)
> cleared, the request and adjustment structs are used to check the
> old and new valud of ADJUST_REQUEST_LANEx_y register(s) is changed or not.

This can be compared in dw_dp_link_get_adjustments(), before / while
updating the request data.

> 
> > 
> > > +	}
> > > +}
> > > +
> > > +static int dw_dp_link_clock_recovery(struct dw_dp *dp)
> > > +{
> > > +	struct dw_dp_link *link = &dp->link;
> > > +	u8 status[DP_LINK_STATUS_SIZE];
> > > +	unsigned int tries = 0;
> > > +	int ret;
> > > +
> > > +	ret = dw_dp_link_train_set_pattern(dp, DP_TRAINING_PATTERN_1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	for (;;) {
> > > +		ret = dw_dp_link_train_update_vs_emph(dp);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		drm_dp_link_train_clock_recovery_delay(&dp->aux, link->dpcd);
> > > +
> > > +		ret = drm_dp_dpcd_read_link_status(&dp->aux, status);
> > > +		if (ret < 0) {
> > > +			dev_err(dp->dev, "failed to read link status: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +
> > > +		if (drm_dp_clock_recovery_ok(status, link->lanes)) {
> > > +			link->train.clock_recovered = true;
> > > +			break;
> > > +		}
> > > +
> > > +		dw_dp_link_get_adjustments(link, status);
> > > +
> > > +		if (link->train.request.voltage_swing[0] ==
> > > +		    link->train.adjust.voltage_swing[0])
> > 
> > Should this take all lanes to account? I think it might be posssible to
> > drop the adjust / request split and adjust tries in
> > dw_dp_link_get_adjustments() instead.
> Yes, here shall compare both swing and pre-emphasis for all lanes. It's a
> good idea to drop the adjust / request split. The swing and pre-emphasis
> compare just need by cr sequence. But both cr and eq sequences use
> dw_dp_link_get_adjustments(). It will be better to delete
> dw_dp_link_train_adjust() and add a new function to adjust tries for cr
> sequence.

SGTM.

> > 
> > > +			tries++;
> > > +		else
> > > +			tries = 0;
> > > +
> > > +		if (tries == 5)
> > > +			break;
> > > +
> > > +		dw_dp_link_train_adjust(&link->train);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dw_dp_link_channel_equalization(struct dw_dp *dp)
> > > +{
> > > +	struct dw_dp_link *link = &dp->link;
> > > +	u8 status[DP_LINK_STATUS_SIZE], pattern;
> > > +	unsigned int tries;
> > > +	int ret;
> > > +
> > > +	if (link->caps.tps4_supported)
> > > +		pattern = DP_TRAINING_PATTERN_4;
> > > +	else if (link->caps.tps3_supported)
> > > +		pattern = DP_TRAINING_PATTERN_3;
> > > +	else
> > > +		pattern = DP_TRAINING_PATTERN_2;
> > > +	ret = dw_dp_link_train_set_pattern(dp, pattern);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	for (tries = 1; tries < 5; tries++) {
> > > +		ret = dw_dp_link_train_update_vs_emph(dp);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		drm_dp_link_train_channel_eq_delay(&dp->aux, link->dpcd);
> > > +
> > > +		ret = drm_dp_dpcd_read_link_status(&dp->aux, status);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		if (!drm_dp_clock_recovery_ok(status, link->lanes)) {
> > > +			dev_err(dp->dev, "clock recovery lost while equalizing channel\n");
> > > +			link->train.clock_recovered = false;
> > > +			break;
> > > +		}
> > > +
> > > +		if (drm_dp_channel_eq_ok(status, link->lanes)) {
> > > +			link->train.channel_equalized = true;
> > > +			break;
> > > +		}
> > > +
> > > +		dw_dp_link_get_adjustments(link, status);
> > > +		dw_dp_link_train_adjust(&link->train);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> ......
> > > +
> > > +struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> > > +			 const struct dw_dp_plat_data *plat_data);
> > > +#endif /* __DW_DP__ */
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

