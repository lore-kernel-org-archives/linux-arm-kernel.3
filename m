Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2558FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=; b=xE2hLKAI7TZKPTpblG8+XIOJiK
	fSUBhAD72Zt9gTl0LnfJpZ2IpREhpxZXdhm9CjqKPW7xb3jijSQuwTX7ChRldB8jYKwyxr3DdKaR+
	gth51dVRQZ4AK89DUSwDSiZYBExoA5ThjO1UNEveGgLK7WrpW3QK+IcJW8QB6pWl03u+tjiKSuaCZ
	JvXYCiAwc5cC5LQKUcG6QvcWOqUKKFgq7as6sr9Y6VWo7Fsefl51ghSWCh2HhbK70DWaIHLNo+JTj
	WCDkzHH0qUzF8Hmf43SdwzghGxCG2+YPv45M+KT5qBS3hL5U2pYt+J/KvHiaZzkWGahKTqU9gRW7I
	Ot424+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Zk-0000000CKYi-38Hc;
	Wed, 30 Apr 2025 09:17:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3Xm-0000000CK8f-2cKB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:15:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c266c1389so5216883f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746004552; x=1746609352; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=;
        b=xK5TrQHv02e2Y1fLChgviW46XYbhgV6n625+P+cV2wBKSp4QAqgedYad7AwMV+GUAC
         iThYlzXd7LS4NL+PfNntI+S7sPIlCjDdjvUqsVdjiMUDgx0X8RpWwe9VGLJb5tgFPJCS
         N5uNp3zjYaU9yjTlJ8TzsLXG88D4aYOxEjSrUHiJsMUsgZCXPKHN+qNLSM26IlFLTwfi
         I8Hnr7BLZo+ZX6erBs5cwTlWtqhvTdzeXE03Q42j1VQHKqECWdlDt5vjiumCCmbZG0LG
         7WOuhC5IKfsW2WwbAV+ERN5qMKzB+/3XJIeDXc9Je+qpelGLe/5IebNEGNsiNgCSOXMO
         75qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004552; x=1746609352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=;
        b=YwRmi3HdSUfU/Mc97zr1nhevPJAF7JW08hiI572EtwkjKqOSSkaO31bbNdGZMrPskm
         kZFSEIXSAFjQvV1CBdgkvyB1LquMFzUmEKYPDtSCMF7NDEkx699UFWNUQCa9U9qPO82n
         DL3LdBvGxkFDRslqsVpKUHax8oih8L9GX0wLiPvEKKZTQwcrdQUWDxKMNa/EPNppkRyC
         7OIHJd9cIH+H52aQ3rYND0aZspXzNPnAJ2KtjST/+w7L+NiJtMGFbYcgwrCFLYHFfBEr
         o3YI2lG4fN5BklBuAqZ4XFhu+KqBL3KDujaEuxxqLh3nstIH9zPNjI2K+riy8F0ewlD/
         y6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX1wU7SbNG/NJdwpCmFDDOHLbk9ANrtAPXZSnnoJfNJvOih7HTqX90teBXrZO/nvuug5ApxC5W8trqeex3w3N2l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4AJ4x3WoTNGyN5MyFlPGhs2So4o4BwfbiSqoXsderOHgSh5eL
	bvht3D8CRPZ+4YQudlP28oMITaiouPR+2NdL8eYld95y9qTeRSG9BtcRotGvazo=
X-Gm-Gg: ASbGnctUnMf1qiv9tQLG3CZmHCpsOUVRtnGrJAjY1ZTx+75zt6wtpRG5VLzNtw1Grwl
	S+X5zzcAxm+wGJOUxKugaA7Gwb6h8FRjqfO6iD27mwyKm7ca2QDVBevqHz2+NRtXMDgUYeTzm+N
	blwnEmSCSoplTNqZ59lfnlfNQvJquGTXuCDjhawAWVvR0sM2F3pnmaSFebt+DOsfiou/cX8BSuh
	kAtiK2XhCNrWhVttCDLHecjpUjZhUBvgHZpDEq0aOyOJ+MDKShcIo/b/rWFTTSFiKD4ZsvvurfG
	mbRQIa9gL0WgrugdSf38oXyB7VYOTzmqZg4z9IZa74DZOjCtaNaN6lT63FYZXIwgu63MojKRAV2
	iL+I=
X-Google-Smtp-Source: AGHT+IFkPR//rOgO0Nj6VP0et5o5R5weTdk43Q9O48THz0Bb0Mc82kvtuhKb+SHshn3v5YQdadMBLQ==
X-Received: by 2002:a05:6000:2284:b0:3a0:8c68:19b7 with SMTP id ffacd0b85a97d-3a08f7985d0mr2116855f8f.3.1746004552519;
        Wed, 30 Apr 2025 02:15:52 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc4025sm16666218f8f.56.2025.04.30.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:15:52 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:15:50 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RESEND v6 2/2] thermal: imx91: Add support for i.MX91
 thermal monitoring unit
Message-ID: <aBHqRu7qmDlXyFeR@mai.linaro.org>
References: <20250407-imx91tmu-v6-0-e48c2aa3ae44@nxp.com>
 <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>
 <aAIkAF_AHta8_vuS@mai.linaro.org>
 <aAJtwxBtBX4ofy/o@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAJtwxBtBX4ofy/o@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_021554_670884_E664828B 
X-CRM114-Status: GOOD (  28.83  )
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

On Fri, Apr 18, 2025 at 11:20:35AM -0400, Frank Li wrote:

[ ... ]

> > > +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> > > +{
> > > +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> > > +	s16 data;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(tmu->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> >
> > Why using pm_runtime* all over the place ?
> >
> > It would make sense to have in the probe/remove functions (or in the set_mode -
> > enabled / disabled), suspend / resume but the other place it does not make
> > sense IMO. If the sensor is enabled by the set_mode function and then
> > pm_runtime_get() is called, then the ref is taken during all the time the
> > sensor is in use, so others pm_runtime_get / pm_runtime_put will be helpless,
> > no ?
> >
> >
> > > +	/* DATA0 is 16bit signed number */
> > > +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);
> > > +	*temp = imx91_tmu_to_mcelsius(data);
> > > +	if (*temp < IMX91_TMU_TEMP_LOW_LIMIT || *temp > IMX91_TMU_TEMP_HIGH_LIMIT)
> > > +		ret = -EAGAIN;
> >
> > When the measured temperature can be out of limits ?
> 
> It is safety check. It may be caused by incorrect calibration data or some
> glitch at ref voltage.

In which circumstances do that can happen ? At boot time or any time at runtime ?

> > > +	if (*temp <= tmu->high && tmu->enable) {
> >
> > I suggest to provide a change in the thermal core to return -EAGAIN if the
> > thermal zone is not enabled when calling thermal_zone_get_temp() and get rid of the tmu->enable
> >
> > > +		writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> > > +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> > > +	}
> >
> > For my understanding what are for these REG_CLR and REG_SET in this function?
> 
> REG_CLR\REG_SET is offset 8\4 for each register, which used clear\set only
> some bits without touch other value
> 
> 	SET register work as
> 
> 	val = readl(reg);
> 	val |= mask;
>         writel (val, reg);
> 
> the benenfit of use CLR/SET register make code simple and it is atomic change
> one bit.

Actually, I meant what are they for and why are they in the get_temp() function ?

> > > +	pm_runtime_put(tmu->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx91_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
> > > +{
> > > +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> > > +	int val;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(tmu->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (high >= IMX91_TMU_TEMP_HIGH_LIMIT)
> > > +		return -EINVAL;
> > > +
> > > +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> > > +
> > > +	/* Comparator1 for temperature threshold */
> > > +	writel_relaxed(IMX91_TMU_THR_CTRL01_THR1_MASK, tmu->base + IMX91_TMU_THR_CTRL01 + REG_CLR);
> > > +	val = FIELD_PREP(IMX91_TMU_THR_CTRL01_THR1_MASK, imx91_tmu_from_mcelsius(high));
> > > +	writel_relaxed(val, tmu->base + IMX91_TMU_THR_CTRL01 + REG_SET);
> > > +
> > > +	writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> > > +
> > > +	tmu->high = high;
> >
> > Why is 'high' needed?
> 
> Need re-enable irq when tempture below high.

You should not need that. There may be something wrong with the
temperature threshold interrupt routine.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

