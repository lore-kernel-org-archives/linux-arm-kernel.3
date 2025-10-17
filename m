Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFBFCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 09:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=418kpMdDHnOQzzDnjco0/swD3OeHn+l/8evRSWETxr8=; b=xcTfdvhhm6gMV7EugHGIs0q5GG
	nmxNrUsvnD+yiQ+oHEHRPTZwI4k2DrTotlJJu3Z8Ocd37PJVK7PbDaWsuy/495k9Gn6+Oai75OUyM
	Z8/Lc+pltraq8a9AY6Xujd2lVRcrpdrMfn9N38hVbWWAvodUcRtdvfeKEX9Sq3mz54nruFN8A4RVz
	7YLBwSvsKf3fadgykHqYQZbhGmuPJ4wFBL+uhFDxLBRg8787RZTg4gXxAOBiz++eu1M7fEwNUN3z4
	IYpfWI4EhKr1TnOIFcZC4bX4TXHEaBKOapGB2b2R8t8K9seLUIsM786zajB6n5+s1dum1/0qwEA8m
	Jo5km+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gPv-00000007BhG-3t9n;
	Fri, 17 Oct 2025 09:06:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gPt-00000007BfJ-006m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 09:06:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3d80891c6cso500303566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760691987; x=1761296787; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=418kpMdDHnOQzzDnjco0/swD3OeHn+l/8evRSWETxr8=;
        b=WoDOueHuIK/79EhRETPMJmlMcDqoHnaTLIiIZyUEUVNJ967lcuIUWI6hwdW5rzNkbU
         d1F7HbrTyw4vyBn+P+hzjPB7q/0lY3nEXRjJAZwIWXe1IJrdApOLdROAUaosyoZemiQG
         KB3WIJm0/kqMT0j5oz98uFS32HavnwEWJoECHPnFbURcNNfVgTb+9BdHWScadHeH1Os+
         QHC2WXvgb7RGB63dSsUohooFYY46XNi8Q2oPnv3i1YToqGPuGOtZli8tYTU28IfBqQYv
         Np5yu9lxnJUjDmHpVNaK0IdWru+vl6uJdFCmq4h7AcJWsTWc3U8URcBrOIOFkqaHbMKi
         YWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691987; x=1761296787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=418kpMdDHnOQzzDnjco0/swD3OeHn+l/8evRSWETxr8=;
        b=lvrZ/Tq+KcUlcGPgwMx+WW0dTBSkm2a8jpQqDCG7pi3CU6ypfDZs4boKdkqOOA/ys2
         yyAgtudwnRE5aTg2sZBW0P++0LjddDO+a2Uj/v1iTtzhyRTL4TgkhUqBWKMPwXErhpm+
         RWsE2nDuiAMZr2UF87c3lCqvg0Vr96gTHUOPIIC9SO9SAmnaSjbyckGlx8jFrSD7j6Ad
         tOR2UiBD2LoXzNWeHndx73Wmzi0D24zhldir174+fMjfYsP0V2dw88aNFeaNBEFU09iF
         OhZUyZgoXSMl3VKPy56twqoPrWSleuSTFhU88plfpdmoxme4HUAJFo51YPYHnazSSTg4
         HiuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHKNhrwMQX1qEzOzSckzH9HfUtj/Vwx5yneI36dYDKaIfy8kIpz5x+NWw68/8YynNXWGX7MeSKEhDaL5B6B0dQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/+e9QK+6fsoewV+K2GxUMyhcmAJ1YXANB3YUVnWqtytkShyyT
	V0l00jxmU4ZCbKw1MxdmllFMCMr6O4svcJCJIDBVP6/O1Y90B2dE6Y4cW/1yUpNk2MxYL9TPHb8
	CkbIuATtuuM8UMxXaD0AwMjJyrMYo451pHipszavitw==
X-Gm-Gg: ASbGncuMNkZqV+7ePnlErh1FkpZXaMbVHaG18aTF3QKNiDSfLXzmWXZHQoOCV4Oeyzj
	Pz/JdclzUNmXrdk/gZR/Y48AOj6rG+YYkS6vLb4d787ANrGhlIQeEADPc3aA9uRq8MTXas98Mte
	cRtqU02uEEk7fM5H84nNiCJEhTOeK+nS8yK0oge7styl+RVmFy2ZOI7ojGEM5V/VaMPNa0IhLED
	ddCe6tcw8tXtnHswyvU2T0yipYfxtYDDQH8PBpT76v5vXXfE6AGMymzmxfIl2E/Mn8IVhhfwUA9
	jlN3x4Munb5BKcBSPxliPdVvlFY=
X-Google-Smtp-Source: AGHT+IG+w0UsfxJS4d6pFqa8XviZVfLhRM+rhE1KqiFzit259/+EaKQIY+0egVcn1SrXy9IXtpCbr0Z+t9PVc3PXPa4=
X-Received: by 2002:a17:907:868f:b0:b41:c602:c75d with SMTP id
 a640c23a62f3a-b645f7ef255mr378423666b.31.1760691986910; Fri, 17 Oct 2025
 02:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-2-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSesvTLe28Jz83b=zfHD2rvmf7-i_2+2DoV=dgooVqFEYbA@mail.gmail.com> <fa42adf0-8f15-ad4c-3788-578b1bee1c72@oss.qualcomm.com>
In-Reply-To: <fa42adf0-8f15-ad4c-3788-578b1bee1c72@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 17 Oct 2025 11:06:15 +0200
X-Gm-Features: AS18NWCSgzHU1qRYaMmAnFnfeUajlPBrTb0Y5_GWRI3iwaw1dVFHqq2mvJmjYc8
Message-ID: <CACMJSesxazA7Nf6sAhUT16KfwtiUNjvb5JOEWkEb1B5fJtihMQ@mail.gmail.com>
Subject: Re: [PATCH v16 02/14] power: reset: reboot-mode: Add device tree
 node-based registration
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, John Stultz <john.stultz@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_020629_056386_E848E6A7 
X-CRM114-Status: GOOD (  27.02  )
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

On Thu, 16 Oct 2025 at 19:19, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >> -                       info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> >
> > This change is good - devres should not be used in subsystem library
> > code, only in drivers - but it doesn't seem to belong here, can you
> > please separate it out and make it backportable?
>
> sure. Just to confirm we should separate out the devm_kzalloc part of the
> change and add a fixes tag.
>

And preferably put it first in the series to avoid conflicts.

> >> @@ -123,8 +136,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
> >>                 return 0;
> >>
> >>  error:
> >> -               list_for_each_entry(info, &reboot->head, list)
> >> +               list_for_each_entry_safe(info, next, &reboot->head, list) {
> >> +                       list_del(&info->list);
> >
> > Same here, not deleting the entries currently seems like a bug? Do we
> > depend on the driver detach to clean up the resources on failure?
>
> sure, so this should also go as fixes? and should we remove the other
> dev_err(printk) also as fixes? or that can still got with the change
> where we add fwnode based registration?
>

It doesn't seem to be strictly required by current code as the users
use it "correctly" but if the API becomes used in different ways - for
instance the structure may be reused after failure - it's a good idea
to backport it. In general we should undo everything we did in the
same function if we fail at some point.

Bart

