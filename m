Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5232AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=; b=tR1L6HZ6WW8dHSoJ+LjF2mMg0A
	1kZeb/EjQK+wQy9iIoTgtkVmSj8yVm5VQzHl64gaawM7uq9CcOQeMSzVlyjy49ynKnGFmMOJWfrRE
	UdMpgzKyrLWYyZbplB52slYygS8z4AzrHw56ZmqI741ze9FSyBQ9ekgm822CKy3PE1NzYKOSz7DrV
	NrZW1xWxbLkeK5AgAkzV4KQ3N4JhgdkIn8HjFI8WvyHYXJrEQu3gZous3z2c5fpSjz2zwfypnTVhV
	xQ42FSjVN0+9yEUPmro0R8qQ2trr9hQS8iOotjf8rcgU+P11iM6EbVtyXhRFW8KSboLd5/UEnNMgq
	b1/C8twQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qyU-0000000AUST-42mI;
	Thu, 10 Apr 2025 12:25:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qwh-0000000AUBi-0pBk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 12:23:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so4099705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287829; x=1744892629; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=;
        b=PTxNK55xxl1A9zknpHVLN0WAWs13ssl2SXnUI5Zw4XOlUda2M77rjLGjtj438xSY63
         QW4nhtLxpiSynPLJRYRRXLRVZ/oLbI/YXyk+4m6qWewKau5oxcWWoJV96ZOiCW7QjB29
         GvQSNQYXXAEbb+NBgu9uGC/EkGFK0XPViVCPH6pCpW1HCHRkuPmsnYDedtD0o23pFMMK
         tN6PHHpneC+nzBOlgXFWwzppMBMkMsTyY0/J/DkaQede/xJeBSS2fQIffpnWlyjbBbWt
         onQJt5AXy/cEfdk8eUU+4O+TOrOo14LtdB6fMiQ3JPrB11cSXzkEOg+ZRoWCfFEPCZNL
         bmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287829; x=1744892629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpGCun6OnLyj/iO45IrhWhjo8NHmRNo/yGae+dtnKsQ=;
        b=W4qHM4JRrG/kEYPSuVmR/nCtI1tAgOU2GjayZbBJcgtOIe2RLr4bgfrxNqtsSU0Jbd
         atQcqxmFCa+DZFHMw7YqDGxim45GjOHwWK/pCWkPoi70TTb8wYr6AaqbcQlG+GTy7jYM
         S7I2qDn/EvBNmOOTZXa3JaihDHMhbmaLDnKWZsLVsZj8ULilEqiSguL8HEcCwNUG0rE+
         Rear665hHNS202pBNqBiAphw4cfIeIeauaBcQXB3sKx+S1KYJrlrDLGAADpkOnvqZIZd
         l67CGimtynG+FK/7dilL6fSmH2lrOSMdYQ+x/X3yEmpz9UiN/Oelz7sW7gC1kYQp0tr9
         hwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV60Pxr8EeMRg7VsZiq/HEW/N5iYuM2CdIAoWsunxFq50ppOH8yfD9rDLnEjSqPhwe2+wgjWTMoZhNZ/Q1mT6Wp@lists.infradead.org
X-Gm-Message-State: AOJu0YynHvNwDK/EEGqZi6X/MI3/grxemuyKiqWmGqrl7opYPW09UxD6
	6whqOYnY5D4yiyGfgENU/z6XGvsivStTMSgYYtQuIyfGKhKvMKkb
X-Gm-Gg: ASbGncvK47XVhtgmVj8G6PeclbDSv9z/dtpLQJ2pyoeRphk+WMx1ALpGciSN3LTqQ/0
	uErzG0UsPxlAUi2wF7ZxEBxkcjlWHmmuuL8/cMI5PFGurui5sqkC3sXsP8RExhM+JHCK7sun23N
	D9mxqtVU1VyS9x1NiQ1VoBLlgmPFrcnmqMmUszgNbDLl8Yijfr7pUiSUV/5uhg5LOlDo6ZPY6El
	tlwSGnjjFDELm5sCANkTwV5Ev9zkuvBC34NfwcP/EnMHuigt23JPpFFiobEMmWjMbuAyKYAZW06
	xhn/F0kqpeTQ88e/3C7YsbK3OMFLivz5SwRnNUkOBEqn6gLk1R2ETg0OXB/RYNUDCAYZug==
X-Google-Smtp-Source: AGHT+IHJYqLm2bNlTIV0OaPKSdoxtU3W2Hk6krFGdZj7Augauu5oSQ67P5k0PX48vM11HcU7mHRvqw==
X-Received: by 2002:a05:600c:3c91:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43f2d7e932emr33093865e9.16.1744287828716;
        Thu, 10 Apr 2025 05:23:48 -0700 (PDT)
Received: from [192.168.1.132] ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm54736005e9.9.2025.04.10.05.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:23:48 -0700 (PDT)
Message-ID: <fb40d405-9f76-4117-88f9-423ea5fac3f0@gmail.com>
Date: Thu, 10 Apr 2025 15:23:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org,
 robh@kernel.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com,
 daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
 iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_052351_231713_2FFD8C97 
X-CRM114-Status: GOOD (  18.43  )
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



On 3/20/2025 2:09 PM, Daniel Baluta wrote:
> DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
> enable various applications:                                                                                                                                                            
>         - rproc/rpmsg framework, used to load for example Zephyr samples
>         - Sound Open Firmware, used to enable various audio processing
>           pipelines.
>
> Current dsp node was configured with SOF in mind but it doesn't work
> well with imx8mp-evk dts. SOF controls audio IPs from firmware side
> while imx8mp-evk.dts preffers to control audio IPs from Linux side.
>
> So, configure 'dsp' node to be used with rproc scenario and later will
> add a separate dts or an overlay to configure the node for SOF.
>
> This patch series configures and enables dsp node to be used with rproc.
>
> Changes since v6:
> 	- addressed Alexander Stein comments
> 	- enable mu2 separately in patch 5/5
> 	- put "status" always as the last in node definition
>
> Changes since v5:
>        - do not enable mu2 node by default
>        - fix dt_bindings errors
>
> Changes since v4:
> (https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)·······························································································
>        - after comments received on v4, we implemented the run/stall
>          bits using reset controller API (changes merged ->
> https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
>         - drop patches related to DSP run/stall/reset via syscon
>        - picked up patch related to using run_stall via reset
>          controller API.
>
>
> Daniel Baluta (5):
>   arm64: dts: imx8mp: Use resets property
>   arm64: dts: imx8mp: Add mu2 root clock
>   arm64: dts: imx8mp: Configure dsp node for rproc usage
>   arm64: dts: imx8mp: Add DSP clocks
>   arm64: dts: Enable DSP node for remoteproc usage
>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
>  2 files changed, 29 insertions(+), 7 deletions(-)
>

For the whole series:

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

