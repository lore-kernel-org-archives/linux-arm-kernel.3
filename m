Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8A9D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txJRuHrrwV2ADW2a0LZ396P8T6DrwxOBcVmxIdFH5mY=; b=EMrd5xh2MZwezSakyHY5n9aAHL
	ZhRzyxlyaRK5cjQMLYlivjyJs3R9+B2nWciMyF5e2do9sGiu0qMzhdvjtdg5bj6D6mETs25hfqbR2
	A9l43ZTboLQWcRARuR2SuarsN0Ht/YGG343Ll0ZesnUx161+edU/nGe7ol2soSoZK955elIiPDImi
	9MnG57UP9iGudko0UO8k26i7kkAj6JQn70362yio4PJu6/AMUr3UzEXUxZWAgdBlCRsfb/DP62oG0
	duaje7L2wEwSfy2a2q6GJGQbB7rb3XbDkYXcHrBD7PK+ckBTMbMyE8XNeufVtoLc5DhUKycmu9RO/
	NHnExZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjQ3-0000000DZXP-1sra;
	Mon, 08 Dec 2025 22:09:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjQ0-0000000DZWv-2Xbt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 22:09:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3C89C180D1;
	Mon,  8 Dec 2025 22:08:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78604606DD;
	Mon,  8 Dec 2025 22:09:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D07103C8D5C;
	Mon,  8 Dec 2025 23:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=txJRuHrrwV2ADW2a0LZ396P8T6DrwxOBcVmxIdFH5mY=;
	b=ZIFFayhWWluy/Qms43QysyKzVEzgYbV0fvLPjTvuqBXZkXZsh477ayBau29XgKXhEO/9jp
	nEVCYk0l9aNSPfiD9uDM7jbB3+NJ2uoMpn0IvxIpRa64dDpRe/CdYLNVVPA01tiZio5rjn
	Hqv5AqlwlWViU+/fM4A9kiylenR3TeEpf3HZUayLznN/o0vtEr8D0wSDnxwgfmBBlrLYzd
	6n5F7gVHJkqmvik2uMYPuY/rgnIESqxELcep1iZYvDMXwDUIssjWka7VQJLwbX4xMN2iIZ
	eBpGAyA2siQARTp01ckbQm41jtJfqCuYSopaHjdIvT3sbRk2BVzHp2duiPTBog==
Date: Mon, 8 Dec 2025 23:09:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: (subset) [PATCH v5 00/11] mfd: macsmc: add rtc, hwmon and hid
 subdevices
Message-ID: <176523152354.342815.17888940507252789645.b4-ty@bootlin.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_140920_808870_868A7FC9 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, 12 Nov 2025 21:16:46 +1000, James Calligeros wrote:
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: rtc: Add Apple SMC RTC
        https://git.kernel.org/abelloni/c/07049187e830
[03/11] rtc: Add new rtc-macsmc driver for Apple Silicon Macs
        https://git.kernel.org/abelloni/c/49a51df427db

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

