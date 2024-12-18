Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A39E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cysivQMCAup5VX6VRdjk63p3UWGwFhZcVxFfx15JYQQ=; b=bZy5G3qswlDK4nP/ALe2So19iJ
	QiR2w3HsSuPlLxBo0In3C8BYmHyiJcwQmc/Ocwk5KON7yuPa0qjvObSKA97ETckQRrLd/EGu3TO5w
	3dliDhS42/sNGw7v6HT4Pd0Dk3iWs4sbhqJ6C6tFadqssD11BXy3tg4q6Au2G7XB4Q+5seLg1V5xc
	P2KzcPoLg9FyqNDy1VraGTKlfYdb8n24/WUXb6wI3wfTXGa6Q8gMX+yHhRuxAtYbABFcg1tyKWkoz
	FxA7pMgyKi2qcJTHH+qSqy3OcDTFvO99+YJc20Cdx4gQ3m11bPcDvx9GnyeXoq/qD36+t0VCbyWSD
	TPaw6QOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrzd-0000000GPeB-42lp;
	Wed, 18 Dec 2024 11:13:29 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrw9-0000000GOkG-2iSx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:09:54 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7fd2ff40782so5608610a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520192; x=1735124992; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cysivQMCAup5VX6VRdjk63p3UWGwFhZcVxFfx15JYQQ=;
        b=om/Kc+/jYEE9Oz3ULiLMYKcfOL6GFmYlSwoTTVIJH4q/hmDWvHx4DbK85xnLJnxIXb
         Ait9Iwtp0JaJzorgZrbQlt/BTIp9HIpK5jh9ACpwOzBii8R/FomtSquLNb2U+yzPT8Dn
         GlDNm+IrAMde//LnuL9CxHBnfVXTQtdJV8dlvnZ8kg7YNEf99A+C+S5T/Kbi0rzckFIz
         4ReitLomqbPcaWMi7SJZnvenCp9rmJJd+FSm5WeLUKLuiLW+1DTpbLtV7NVo8Ho5XZNO
         ipd0btJdvCBxEoF/F9gbRN5GqVGlYYSF/2UMYdHjTZoniKOaUQRjH20ewkVA5cKBtsBn
         mdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520192; x=1735124992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cysivQMCAup5VX6VRdjk63p3UWGwFhZcVxFfx15JYQQ=;
        b=mv/xBzmclpI9kbsrZNIF0UU//eNkLOOiOFvMTlatqmMvDTfxqG4S3ctkumWKBsARFb
         1IeT5epaUF020AJBi7merw1SeOlcQO223HwQQTqvESL99+0KWnRhzn52SsOlNiHQ3fEr
         YCdnc0zXSRpbEAk5AeFgjsGog6lGEOIJBcN9DBAxqGXCEPoFFHoC4atUKNnuF4UfUANe
         s3uCnnk5GDwJW55qEdseFYBhQonz0p5IxrGKHIDjPPO4j+3eHBoJ5yaRDI3kf3MwrIvx
         DjbA/qIvpBHfy7UGcgqFA8lYYBLuy2mRrg1xk5GjFIMAcQNYZkXzSfp/ZZ6RU5mf1DpQ
         VkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYK82EmC2s7XbOrh/7B0jaVqp5bIpYwQt6u0Z2K7cNsc1B9xnNHa9LnnoJEhf8J2DVLrR88AghmFBWbjJjFjms@lists.infradead.org
X-Gm-Message-State: AOJu0YxSdCp8U8g4s4e8siBKU+S0/xfEtWV0staR9mT8qjjjfi0riLtl
	rqM02ZxnxJUTP8x8PTCKoygnQ3gqCL+llhwug7hSHpCcFH/MkLm0Y+dk+tG4QzJEG4gVi8HUTv7
	agS/dLLgLCZBtOrq8do8ecOvs9NVDUNe9JDAN7ISGLqgymcoa
X-Gm-Gg: ASbGncv8NpMTZlwT1/JVrlrepD9pOnsnlREKM2O3/4EWfdANhjPxzyAbGRFqyLYGUZA
	t78YgOjz+tGo4xffh0DdoNk9TE6xAnr2HU3L0WMA=
X-Google-Smtp-Source: AGHT+IEz+SwthpfmpijWHlgsc9by0AenGHkniwWORMm8lFz8mYBsn+oM1BmwW233q1MPW5LUjOnDSoaOOI/dEW+oQtw=
X-Received: by 2002:a17:90b:2642:b0:2ee:b26c:10a0 with SMTP id
 98e67ed59e1d1-2f2e9339c2amr3609913a91.24.1734520192464; Wed, 18 Dec 2024
 03:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-2-quic_jinlmao@quicinc.com> <tida22chffj2znikeotmo52aqnzvmedn3aa7a2coarz2dwjc7w@duw5fby4hexk>
In-Reply-To: <tida22chffj2znikeotmo52aqnzvmedn3aa7a2coarz2dwjc7w@duw5fby4hexk>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 18 Dec 2024 11:09:41 +0000
Message-ID: <CAJ9a7VhR5AX9QD3fHiT_aU5yHShcZFaHLEDDcBJbu2xcRbWGVA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: Add label in the coresight components
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mao Jinlong <quic_jinlmao@quicinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_030953_683489_105368F4 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, 18 Dec 2024 at 09:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Dec 17, 2024 at 02:33:23PM +0800, Mao Jinlong wrote:
> > Current name of coresight component's folder consists of prefix of
> > the device and the id in the device list. When run 'ls' command,
> > we can get the register address of the device. Take CTI for example,
> > if we want to set the config for modem CTI, but we can't know which
> > CTI is modem CTI from all current information.
> >
> > cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> > cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> >
> > Add label to show hardware context information of each coresight
> > device. There will be a sysfs node label in each device folder.
> >
> > cat /sys/bus/coresight/devices/cti_sys0/label
> >
> > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

