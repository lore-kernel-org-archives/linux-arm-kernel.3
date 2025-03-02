Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EE9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qtblm0i8462d3luljoT5Tnt+0dpoW1Tx169HXsD42sU=; b=rvQlzV+AN8+R0accNzd6E3Pn2b
	GKppOoxSQuA5SR4nLJANDy36r9hd1Pmgay5R/jtdtB4qwiO88Olhg3SZsi0KvgwO1pC4Cxs0jVH0F
	sY4Ec5oyjC8H72h5UW4F4tWRIXCIKhJFZm5kqNXbnYeUBUz0TsI2pkZ0Gttkh+sVEI/SkejJTksoj
	CmSifbArH2S+SEy3NA1uBoP/er5pEx8EqVpQanpwpNe3gAMJh5oePs2MUSUtl/Uu4A1to3iS+pNpe
	O5gbW7bqOiFVpI7Nh+jbCx9fGPukKWmqEiOOy+H637h6RmR5WFzAvrQt9gAb2VatR4sRuTrQ9FPNm
	8CAJ/kYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toiLV-0000000FzJP-0IjR;
	Sun, 02 Mar 2025 12:23:01 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toiJy-0000000FzC0-22fD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 12:21:27 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54954fa61c8so2046277e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 04:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740918084; x=1741522884; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qtblm0i8462d3luljoT5Tnt+0dpoW1Tx169HXsD42sU=;
        b=dNPUmOrZZf+TeA5kfHicQSHi+uCvL3walWKFNm7qy4cXsj5DCIbsKSOeJ+hVg63hHM
         cqiHueN3orWHsaYqaNIGOWGxGsy7sgPon4oW2qDYsu3WkjCRlZFiWuebk21FYfjdpCwe
         En7KeLLqF9lrTRko3PdmSQsn4LAMrJzuhNHRXsGF5bSzsknDlY/+Yik4EznrG8nx7fhJ
         u8G1Nx+4XusKtdSiKmaap8fa5F4vp4cqiSlcX8U80EBPJqbmCAuJ3MHVUpEGAtLDI3FI
         Xll8cR4bwOA9DU6VQ89Y6lgWM+yUs5qffXlzznvpKN3pyn7YreAcNaald2j3JxAZlMGU
         xq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918084; x=1741522884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtblm0i8462d3luljoT5Tnt+0dpoW1Tx169HXsD42sU=;
        b=TWPBCrd6c6/2x5Hf70CtQJS/dSKVOUr5hBTxIbI9F+22v3oBkWPVBgLTo3Ffxhj14q
         gum3sMxBcNLEO/UscxdkBHLA9q+kI6QLIMNdP0dB0w/Lq6nUtXQMdZILWg4tRptBdoDC
         1xEvAZqMwIVm51snvFgttEBUHfTc9VRv3vLvpFbitUbPE32C6tuhq0ZvjxIly7BEwbSc
         EXMGP7XVG8I677QN8HhdDqjfGn7QczinUaETe83lohoXFMFb3p4QfyqdhpU5ZA0KCOF/
         GJIMEswsHD1O73p6tookHRmNxWjkifIwrEk1YwvgHqeQkAdnx6mJ5x7v89F0oJS1sqE+
         /Dzw==
X-Forwarded-Encrypted: i=1; AJvYcCWmp6tSeDFxAgSwaEQs8mpMRWA0bwa6EjwjTLMttVLmCUS229dE3g6IulQ6gwbFlsC2Xb0EUWw3rxxlYlJAE5qZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxfvBpq/OZYRF21S5bLE4I2m6kvjBk+KkUN4CSVT90+Seow3++1
	t0Ia2tu+2XVIRu4UFVsIfk440RaWLAXbX5PFc/zEOG05UetoJlB/
X-Gm-Gg: ASbGncskoUU+TrtW2s9NAaX5SZ/wNWlHsZIQUBTKWUutENkl/UtTQTStZfrt3+LeKaT
	Y10j3ygrFaVXbygj35q31uewd9rbOL5lOzzIJ5UEpgHlnhcUnEjDK/eEElJr5cXA5cOhA6+GkUq
	ZpWUA4JMNfG/f9DXMueD8UKwP/Qq5lAnjXkPC70vlirIPSxxZ6tJ8kZfRm/nNe7EQkz2HzFblYl
	4k/Gwm7LMPyktTOrl00QixlBu/SAJ1a3ExX2Zm1mVnYMT2eG8j2wRbCEhjNnm2FQaYaKWa55Va9
	ee8Bm0RGL04RBVRaE/ptPLyRIOhshNZjHFMjzS1C4y+THRtgfzF0OdDcblcW+uDf16BVpGAUSyK
	+CsbjKZVX09GBvqnuSuTRhQ+FyQ==
X-Google-Smtp-Source: AGHT+IFo9Y9R+GJf/hvtgnPwl3vpc/B4svOJilmVq9Mn0xTVT2iqrfrmQOieXp0GoaVbPJJmjudwkw==
X-Received: by 2002:a05:6512:3042:b0:545:fad:a757 with SMTP id 2adb3069b0e04-5494c335f2emr3260926e87.29.1740918083926;
        Sun, 02 Mar 2025 04:21:23 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495dcba076sm272177e87.119.2025.03.02.04.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 04:21:23 -0800 (PST)
Message-ID: <863ce320-c5cd-47f6-a66b-c43fac98a4b0@gmail.com>
Date: Sun, 2 Mar 2025 14:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <Z72QAOA9xXbP16K-@kuha.fi.intel.com> <Z72Zp8tpnvlFGdQ_@smile.fi.intel.com>
 <ad39b453-7e5b-49bd-a4fd-6a4988636130@gmail.com>
 <Z72d7TzZ21WITW3f@smile.fi.intel.com>
 <893a3c45-537e-47ad-afbd-1e5d3b9abe2c@gmail.com>
 <Z73M3Ua6u1FpgBEK@smile.fi.intel.com>
 <720f9c69-ca1f-45cb-9f6e-c8e4703c9aad@gmail.com>
 <Z78g_uiXumn4mvET@smile.fi.intel.com>
 <d7982b76-3da7-47ff-b2b2-f964610af1f7@gmail.com>
 <Z8B7h4_IWz43gFhO@smile.fi.intel.com>
 <c9424f3e-1ff0-4c01-823a-19801cc3e7a7@gmail.com>
 <CAL_Jsq+tkXAAVK2D_AtENuXJZOF2eK=sUnjv3=7PM8nAyAB7Xw@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAL_Jsq+tkXAAVK2D_AtENuXJZOF2eK=sUnjv3=7PM8nAyAB7Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_042126_565551_07B03071 
X-CRM114-Status: GOOD (  10.86  )
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

On 28/02/2025 18:59, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 9:06 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>>>
> Sigh. This is not that hard.
> 
> - unsigned int num_grps = gfar_of_group_count(np);
> + unsigned int num_grps =
> device_get_child_node_count_named(&ofdev->dev, "queue-groups");
> 
> And remove gfar_of_group_count() of course.

Thanks Rob. That's what I (already twice) wrote I'll do:

 >>>> alter the gianfar code by dropping the gfar_of_group_count(),

and

 >>  I prefer killing whole
 >> gfar_of_group_count().

I just wanted to understand what Andy suggested.

Yours,
	-- Matti

