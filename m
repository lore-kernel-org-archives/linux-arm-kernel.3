Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AF5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=; b=t4APOaMR3AOEycXp+CijNky80/
	0ZYm8L5q+qr1uGViLlR05fCEVwyi9/jNw6LFtS9x3pT94vNKlDxIbkjNA6yCqp/dz6SynMMaCw8tQ
	yTo+xkhp2OklKRS//mR9XTGskGpOE7khgZw/LKhFODsE5PilW1UjXaUeeNcyXQ1lvXJtBCErp6E3V
	8fWVSQuw8ZXFCB7lFIk/JPWn5g6gIkdbZPXLhMqPk7W5xlYVtCxNRHyQwrPKq9qoxPjYfCPtpyRT0
	AL9HJElVptJHhpobsNzSQVduDQOvAEojgN4awM05MXdN/zvFZdA4SW2QuLOKwd8Cypio0UanWdo79
	TvblRuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gKs-00000005uYe-00A6;
	Tue, 15 Apr 2025 13:28:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g3m-00000005rX8-1Vnc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:10:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso27776455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744722640; x=1745327440; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=aMLmdqIdfnd6nx5FuiFJ0BZVXHf1CO7exna9eCpGv2tTHWIptuMdv2bCilyKE5fmUB
         as8PIS/LfncKZmaXgRZX4Hft9SU78HMW8uZyFgKX1OvwqU2VSE5znUtZzFn4nAc7vOht
         uBbmp60pcoIqsusq16i5te8KyfhinBvVNfpdzmVH/lkGo99czicskWg8YChYEIaus1cZ
         majZaXPg2CiwxaYJKZtuJ1X/Ub1i3zodQh0QllfZegYU+EtkiPtQMkfzxfEi2a2C4zDB
         GHB9wS/0V4VKP4qMx1kF8DSYRq/yoCnF98/9gm0bFM2RW3bRRN682UBBI+uziZEXfeyg
         LtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722640; x=1745327440;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=eFuN3QSOqaFkiYK4Uc7uiavZwCOLjf8P2aSqObxLebXUHQxPZZGkKW9kEoPcRP2n4T
         gyLqYX6BTnjBCQ+U6VDxALL9NdQh8cvrJ+2buY7bAIt2qHbnymEVTtxiHC+WtgFb+BsG
         AzUjxkRG8dF3NZFfSPr29rOL0p8nMmVp3gRAAxWbrLZA2glsuXFsYZm6H1AQqvY6C3qo
         MgT6d0U5w6rR04w7aTF+hG/DZiXQmtOG9KzDAEpI3dD2fKYVM5ME4NNwCMU1s7XaZvIF
         H3thO1ydrZthUVMeeLqr5GPoIwz9Y88s9NT0LwiJnUwM/fi19tCp+6lYNDQfwIQoqHun
         1y3w==
X-Forwarded-Encrypted: i=1; AJvYcCWUUmPT2HfAc8Yv77oMDJvqFuN2Z+WO8/FNkenhLVSLC+cgNkXJ2LwnLwoL6jVsjkCkf52M17qYvitV+V2u++dy@lists.infradead.org
X-Gm-Message-State: AOJu0YzoEq+ZtOWf5YOeSlEnNWWRv6OFIgmRNQ0mPxriuZTWtVH/H+bc
	nu3ArHy0IoAZS+L3fPbHBI8V4WR2E4onH700O1mSd52j7Oyfh76RjicOkZqhKeM=
X-Gm-Gg: ASbGncux/WANlke35rJxRwL6FBGzkZJnBN5sYCoDZg+fGz/ojXWRN9tDoVRcqlFYN/t
	LGjSOo1agEeAlpQm9A+NvdcXRz3hO+AFgnqC5cZukyiRRUAXBp4ZemqHobXyFHSJe1rP0o8pj3i
	1lPDKrJDO/RQdOmoaHD0vSEZHptbIw13h/Z3DhfAebW93v4F15OhaFhZWB8rs6UXFbB9Uy39UYx
	/HofLIsavlc/5q7VpXr4K9XkCLC8rlrfzPIvutLe7/lt20XdBj+TrDC8wipedYEdrfDD1Gz26Tu
	BIKJG19yZR7TYnU0deogDGYSs2hEwWq4dtvpnH0=
X-Google-Smtp-Source: AGHT+IGLzdEuk1QDPXYsF98Ye9BX9xDuqaq1bbiDW34OCl+7dp6Go4ivXszBVPBh1MuXNgGiw13DfA==
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-43f4aafa80dmr77256645e9.17.1744722640535;
        Tue, 15 Apr 2025 06:10:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2c46sm208119145e9.13.2025.04.15.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:10:39 -0700 (PDT)
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
In-Reply-To: <2025041508-remix-plasma-cd47@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 15 Apr 2025 14:59:30 +0200")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
	<1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
	<2025041508-remix-plasma-cd47@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 15:10:38 +0200
Message-ID: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_061042_390188_6BD43720 
X-CRM114-Status: GOOD (  19.80  )
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

On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
>> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> 
>> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> >> Add helper functions to create a device on the auxiliary bus.
>> >> 
>> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> >> the same code repeated in the different drivers.
>> >> 
>> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> >> Cc: Arnd Bergmann <arnd@arndb.de>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Hey Greg,
>> 
>> Do you need me to do something else on this topic ?
>
> I don't know what tree it is going through, do you?  If you want me to
> take in the driver-core tree, just let me know.

For patch #1, I think driver-core would be appropriate, unless there is
something more specific for the auxiliary device support ?

I'll wait for this sink into an rc1, then resubmit the different driver
changes to the appropriate tree, no rush.

>
> thanks,
>
> greg k-h

-- 
Jerome

