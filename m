Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DBAC79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=; b=t6mIpDWcjDXM+TrNHxWhbgDvlk
	Ny3LA7fkqZqQrk+66+mmsarHPTTEl1aoQy9CdbWzc/3g9n8PmSN362VR1IcSjf3jKY7bmKAtHGawO
	C0nuXUxDMZ+UiGJynjDMWWTh/1M8qdWyySpvxTcth2dB/KMISEqnPhP1MdVk5+qMg8sJFaPL/+du+
	A4YyRggtQykixARYJxVLPaCcDDJuZr/cNp2h1ssJDvC1YFs+Ie0EeA1QxO/9NMXZAVsLWbhNF+fob
	4zA1tEQzuFdJcQdhArfISloMCcppcHw0pXAkPMJ8QKczKqAgRQNBox+qFBAkofcbz3/VdUrka4LQ4
	kMD8hH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M4e-0000000CUFw-2ZC3;
	Wed, 09 Sep 2026 17:27:04 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M4c-0000000CUEm-25xd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:27:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so411007b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974821; x=1789579621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=OrNG6AKTL28hjShyf/BXCWLbbKmGRVvv5O0s+ZlVcgNvXS7cstsUDnGEvztaguoDy/
         WMYMUtcS12aWZP+FyqgT1e1gq2PQFtBTX6rXgmcq4kgdZu7LgJ3WtRMNDm/yXp2xMf6o
         gTHuobXf14om7ZCmSC8BO8T6VQtQz+Z81vEQbsq2PYpun7O7cr6iBLBZvMhQmEiBPAzr
         27I4jF8Su+eOtpLQ5QUW5kjvt0v34iPrY1HXz/xieeauTlZ7bK10MwY1T9fidVHtJuiV
         SaMXcEWRESozAHxDzagGbMIPMexwtAmDmaIuKp/ws9SapZ/Ij/5aGkp0SwwUelbhbMFh
         UeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974821; x=1789579621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=PUHXHZoaSDg/04hV3KPoflEdJDpiqWoWrGoHu61vOcph8GCmNl6VkAsjG89IXu15WP
         qbG6R5AvP40GPmX7iw6qRfxldFQlaZIpfqVNuylgDt8JDYKmZ7/BF4LzEITB0dQ09x92
         5katcCtfnaut/vsZuSzMV1h5cqOePrdrezi+jxJiXlM1VyWQ+6Wn9ghRWF4xWR8fwx/A
         yWlKf85WU+GisWhy2lAc5SbVpqoTRadmSCRdE3MMenyZ72kBT7yRl4Uqdjy9IfNGG7S2
         XylvUolcx4xCIJtF3Q6tqe6h8jMIzAEG9gF/LLECzlDhYo5cKzfQbwFq2yyvLEIiVwiy
         /LDA==
X-Forwarded-Encrypted: i=1; AKwUvByC12M11Rbl+L3/a2pNH6vK1vmYgwbjby97LagGQ6KFOpmjlHqx39qxw5lerWrW5sGlz2KeQV4O4ntYptVl2TvZ@lists.infradead.org
X-Gm-Message-State: AFuF++kWumpIg/e5PsqlF1KRQ/SRyp7gk0r3M2nsRg35b/meJQm9JhGP
	ugaJ5DmMA2X/4bzTQXSTliH6IptPZ9VxsKRIoyruZyddX0/Xu0aJDizd
X-Gm-Gg: AYBFou38xBpOviLbrSCQIGCaoUvpj7eZE2vlwrb42k7uL7LZm3fdLAJZDHqUvZ309LP
	5q4KUEBKQdKUdclwD2u0J5XJjdzZKEI/cE4bXoXjv9Rj7yxTISSRg683jDmA9mdWJ1IzaoxPT5C
	9TtIhxcyrJNMixphTOEO5piN5SvvXJtCvNEvnB9s1rWUBy462msHxRL0MaXPRhphhGwBGp0oP8j
	oJcifcCmXx/FRdr7OIwCadzsEaa7rYlzsKQScB4WtGTS3WmG+SB+AFbIIzo1YdOlrJ6XPxV3LC+
	9+3PfNxGCpD6I7vUiItx9HosnL4imfbF6hJKPCv3iUUWf7ZTUwQq41bkoZFFLrABsmiHfhH1xE2
	iWZkmvrKSxj4PEZHkf1VRZOqepOrLiJVWz9UjsqRUm2YuHVmJI4a2kpuNsnwSAewWkAOosrKYo0
	hWtC4PEAAB+hJ07oInwlaETPOF7aD6OBS0Ttcw9WGZ09BS06moxH44z2yTVAAr+O/0BPW3tP5jz
	7Ip9L6xaXkczZA11uwl2CruuMPhkvHUVkIlMC3MyRMwr5g7ulgH
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr57975715637.26.1788974820346;
        Wed, 09 Sep 2026 10:27:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm52422943eec.7.2026.09.09.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:26:59 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:26:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 00/14] mfd: unused driver purge
Message-ID: <aqGWjAuGXq_JHvxk@google.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102702_538232_49A8097A 
X-CRM114-Status: GOOD (  23.10  )
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

On Wed, Sep 09, 2026 at 03:21:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
> 
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
> 
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
> 
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.

Sounds good to me, especially if Lee makes an immutable branch from this
pull so we can all pull it in...

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry

