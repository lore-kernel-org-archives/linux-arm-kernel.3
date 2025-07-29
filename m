Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96476C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYnbywAQMxSgmkBg9bfzNajHDUz7u130g9a2sd9vZdU=; b=Ln/HPDk+jSYsH2BDTYcc6eFcRf
	X6P8OzS0eAaHUnVgNOCOV0spx0+txIBPPzShprgmYGN2rqqTYDA/JO/AwTWNOi7L/Q/iiXg4qJNeh
	SY18lFbAj5cLC7RceA4p1NKp+ChkV2kkUOj8n3hwFNu7yQwYuRvpE8Ng+WOLwNYY1DsLm9FtOMSkR
	czn8Dv4lwzOD5+9QjZNqYlh8EMl64MPN+uUwxixPII3DfLUBYKR5mvB4567Sc9RLx8rfy+b+lhJfQ
	+uKQ3PTj32pJMN6DlLcZZ4l5LNcWeFnYrcMWldJTIeG3h/JiEnJ10A+O5LivaTWv7jeYC+7CYj5dT
	oaCxE/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiwr-0000000GfJE-3BRR;
	Tue, 29 Jul 2025 11:56:49 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiuO-0000000Gf9f-1Zo8;
	Tue, 29 Jul 2025 11:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yYnbywAQMxSgmkBg9bfzNajHDUz7u130g9a2sd9vZdU=; b=p1v3Xmask9tJwEmYfcxRWyJFFW
	GKU4VDAtVzwsDNhPFLlPx/Z3PYhL02HcepdLmLvK2RCKgVeJ5J+ViPZUr3FniwoA3dLGj1oUpVIjF
	Ju2XKx6otFq1ha5qM++Y3YOlfnSSKMLs3yXjvYeXHT3p80+/39R1+ozHIhva/vjfwGnlIGoG/yWa5
	xTUZUz1EpDzNZoclzxcLDwb7pT/bAjhb1FvBimWEzWC/a7C0tP7ryhvNs5XHsU31M67TLt3Bz4Jy4
	v9MsGJ1YzGLoqZ2GAj6wR3Lni2IlZB5fQkXHcoijgcUSo55R/cpCE8w24NQiWCmFLPyi3fzXmNbJ4
	gT04WqyA==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ugiu8-005Q0t-9h; Tue, 29 Jul 2025 13:54:00 +0200
Message-ID: <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
Date: Tue, 29 Jul 2025 08:53:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250729-tall-fluffy-grouse-f5deec@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_045416_702356_A568D2E9 
X-CRM114-Status: GOOD (  17.18  )
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

Hi Maxime,

On 29/07/25 04:27, Maxime Ripard wrote:
> Hi Maíra,
> 
> On Mon, Jul 28, 2025 at 09:35:38AM -0300, Maíra Canal wrote:
>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>> enable/disable the firmware clock. This means that
>> `clk_disable_unprepare()` doesn't actually change the clock state at
>> all, nor does it lowers the clock rate.
>>
>>  From the Mailbox Property Interface documentation [1], we can see that
>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>> prepare and an unprepare hook for RPi's firmware clock.
>>
>> As now the clocks are actually turned off, some of them are now marked
>> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
>> early boot or are required during reboot.
> 
> What difference is there between the CLK_IGNORE_UNUSED and
> CLK_IS_CRITICAL clocks?

 From my understanding, CLK_IGNORE_UNUSED will prevent the clock to be
gated during boot (on "clk: Disabling unused clocks"), but after it, the
clock can be gated.

With CLK_IS_CRITICAL, the clock will never be disabled.

For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
enabled at boot (I tested; if not enabled, it won't boot). However,
after vc4 is probed, we would like vc4 to have control of it and be able
to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
CLK_IS_CRITICAL, vc4 won't be able to unprepare it.

I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise, the
RPi won't reboot.

Best Regards,
- Maíra

> 
> I'm asking, because CLK_IGNORE_UNUSED is mostly useless, and
> CLK_IS_CRITICAL is probably what you're looking for for all of them.
> 
> Maxime


