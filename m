Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BDCC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=; b=W/e0wDfN8ySJ5bUhakN3mgJrta
	RB6g3QIsMYssx5SONMBJKSL1gjDIujgEBYDUmjaX7YusQNxB5W8j/Ah55CMkq+GD0Hd9hyALZWMBM
	ISazlGhoxzfQ32oEG7r+ohk8/6K6PY2j1pMQwQ5moOw0Zma1dgLMP9VoAqCdjOhxOSBaqiN4rDwLG
	7gx2G3UTb6cYvxdaiHzM/xxDB+nxPDVXm9xADf8wr8j0+s6T4Yr7KsTfoylW68+b7QWGBtWRzpYAC
	z2nLqu1Nf332JAET+MdoDTg9w2rOIIlxQsbRXW66drBXvIlqU1iVpCgQrVlvVeNvLloIWk2rhqFud
	duUH8CXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fs9-00000005q0c-29zi;
	Tue, 15 Apr 2025 12:58:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fmV-00000005oyG-1R7B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:52:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ede096d73so39038355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744721569; x=1745326369; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
        b=DpeaVEWwO/Q+Wvf6jfBtfMhkkwCiVpHD1uj3IWB7qtgkJQqHHkFOPaa9YNaJgW7Ulb
         BGVROOBMpofucKAZuDVp1301Xj/rbjvzsbNHoNnnA+oKQXzwaO4jcuWy3MUJi4ajhhIP
         hkgbJI7Cqw4XC0T6qFDK2ShMDjKFU6U3m+j36U8Upli44XPWaC42wy2kXIHTRyDH6XeK
         KrCYnLVVaISSSWQrlh8tb1vLtUqAmxUuwWQts0ze8CowBQ1yKRJ2gijwwjHSEj1UYI5j
         sJgWPWu3wvf8O/SPNMhS0tYLL/9lGoiaOSw8y5v/uySqRK0ahMjUWcUyVQcq4V78BYRr
         9Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721569; x=1745326369;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
        b=ZyZUof0gFORLwVHbhukqH5IOoOuN6rxP9y97OGkzbWVDE+CbUJLPtak5L4rf/yCA0+
         1y2pYBKsJwTl7kOBIQMWaNzI55nqa+9FW4G8EXvfU/zws8vaqCWcxbWFEo94g5N5vY6w
         vwNByN93hBcH9PDba9QUoUDg4U+NDYa0OKiOZy+86OWfCqlb779w0R+MD5Ohy4LeVgR0
         rr58Cy33MxGi3d62dWnyf8TfEMqNDtboRQlEniSJ2apneppG7CMDcCsSAv8U7jWoaPXb
         mY9HtWv8HDxdlq21Qu0RAX/qAuLQ1CgpuMPK9vsqBsE7vIklLHn3/axVZjNl1EckjKgp
         TANA==
X-Forwarded-Encrypted: i=1; AJvYcCWiZSQRCNcIlbEol0YfiwdGzx61ESJgo/yOQz+EvxAu+Tm6bwF6HngJiMsM3ZggbI7NwQ7fMk3bLKjsaHNVSAgv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx932ABU4t74udTVbOmSfRb++giinMlByH6PA1TgQsgqfX2Cfmj
	UZCEB0Z+TGBt1hmfH7bCw0ywoiTdn1QkjiE1AKGI9cAdoxPG3mOz1bRPq51pTBU=
X-Gm-Gg: ASbGncvMgXpwa+fSafjMX1uHo94qHLlO57qpR6RX8TwwiCeRyofY7suEaTk2Va/Bm/W
	bs0YryBkgQgZuBwBqhSId2P298aqPmxWxChK6NA3lI2ia05jbcTDMsMcnZvyDKuBKSf9djQrlMX
	cEwKftfFsO4bPe8Vg9HgR7Q+uB8jcrMwIW+f3DqQl6A1xSBvM+5+GqUiKUwaZRiGRgGnT4s/0tX
	Mjh7efI4YIIAG3kgKTLMVQZV7NHVJHxXTZ9GyDGr4UrZ4s1mzaFmQFRaY8R/E+XhJfmF1DPIcJP
	I5ic2Btg/BorYLjMg+RvM3R/nPhLDKuHSkciWkg=
X-Google-Smtp-Source: AGHT+IE8ZFye7fKJN/Lmt/JH+cGrKzkQSrAfNM/hv/kW4P8wD6rvRDacsRLWQTapc+dkn5240h+uDg==
X-Received: by 2002:a05:6000:420a:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39ea51f5d65mr12661246f8f.22.1744721569233;
        Tue, 15 Apr 2025 05:52:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96e912sm14384664f8f.31.2025.04.15.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:52:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021938-swan-facedown-e96a@gregkh> (Greg Kroah-Hartman's
	message of "Wed, 19 Feb 2025 15:20:48 +0100")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 14:52:47 +0200
Message-ID: <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055251_645726_60AD7867 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> Add helper functions to create a device on the auxiliary bus.
>> 
>> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> the same code repeated in the different drivers.
>> 
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hey Greg,

Do you need me to do something else on this topic ?

Cheers

-- 
Jerome

