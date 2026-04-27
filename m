Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF06FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q8RFZdoNcvjckQIC2L/uAHEUvkW3bgyntp44C+NCys=; b=e0sLfJhz76Lr2Vuej7aT1/EgL9
	jQKVG8qhL1dg+G0FoWVEFrW4fC4248ENCRMzAPCcU6wLkSBNPn5bBZvvLwXfTAfB+T3CCL4LBZRTz
	dspXcA+Owp1WwnmPK1mVfjDeavYiMuS4kHYnA/pY/yPx3lVnCviYoBlsJzm1MhErTXgtWcsqjoX/s
	XfV7Vv51QuK2r9M2E844LiFvlR2alO1ZNltrUC+WDtTDjFGE1aVh3ZTOqPcGGiuugBX+hc2XMSOHV
	4TgosKUwHSIMZu0ZczfO4cKBY5BR9tKQNNttDdZCZkbj2rc/K/3CWt4tI6oWRBBKOChKFW07HFNMx
	ZbXMPE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJZX-0000000GjR2-0OLC;
	Mon, 27 Apr 2026 10:52:15 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJZU-0000000GjQS-0Q2S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:52:13 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 143071D000F0;
	Mon, 27 Apr 2026 06:52:07 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 06:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777287127;
	 x=1777373527; bh=4Q8RFZdoNcvjckQIC2L/uAHEUvkW3bgyntp44C+NCys=; b=
	FfxgZOqt0HsjJNzo+JunHXzEHqRA7pPzyOcmEyOYh90P/StS0FXWQYEvRv7BYQnz
	yk/r0+9nlFhfnYnG4bQkKmMqawcZGR52gcmV6JNPQ1QVBoWQs3tvjwdjXi1wsVOL
	cqPnRvKxjYrkO1GAA6ZNWdzJtPcJ7drk/9NRKAVG131Cx6kCZe263/DH8MNWDzal
	KqFWkHyJuprbniGbS0RPfsI5Gcot8nKGxSYz2R0AmALs3Crq88uhVGmHYhBVebzM
	zlPmC23A1eEmIBUsfgsH1RGeVkFMjMO3NeAIhPHgvs2WP8SF2+Bdh3mgpO//SS9j
	Rrt1xK3bFN59BocdCTdKSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777287127; x=
	1777373527; bh=4Q8RFZdoNcvjckQIC2L/uAHEUvkW3bgyntp44C+NCys=; b=j
	0vJanpDpiGgsZQjn9xyBOKo0bTBwdr/95fPdkw2e9NifUdVOboF+AwiYhBwSzAMy
	q71HGl6A3UgueBQZQH8qKpm4Vc1mSUN5IDvwzrylz3SdB+LF4f6p5zfSd7kaqudJ
	jSi8RSwrEMqjnomS9rTZBLQhRQHJyN9fCaZGWpcuutHS7b8CKN0i8pQysL1AYUXj
	9WSTjmnro3x+yUgvR8KXrDaK/4LsLWv8dKoIIpV5f0U4QyR5dlP8Q+GtvOlcGbw1
	8yqZARZeLCxFQdAm0YCZT+SPnU/lNK9I64V01W5Z1iTmJ6VJQLLIIOiLv/cK/gvw
	S4saNsdM7bhsIhxCk/6fw==
X-ME-Sender: <xms:1j_vadm9Zu6S55StWER-9bJtpTiVnskxOD6gPD8kSdUIxo5VEH0E8w>
    <xme:1j_vaTqf6t2BJasIXIEETOK1FxTOiDoP5LQ2CcPt4dkueguCOTozf8B-bZqlXW-cz
    HQkCOsPo_zalZ5bzoHlQNjxq1hvV2VbU9nGEVqQ4xRHK8VpxkW3XcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegs
    rgihlhhisghrvgdrtghomhdprhgtphhtthhopegujhhrshgtrghllhihsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehjmhhkrhiihihsiihtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohepsghrghhlsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1j_vaZ1WkpDZ1t2_8yc0PWrsmun432d_6BkzTZgGorggRhSwbZLY9w>
    <xmx:1j_vadRFFB280YI8YQJ5Efsr0_50NyfFMzuM9GsF9rq_RDdZrANoNQ>
    <xmx:1j_vaearhcehiiA4p6ZWS1mAXQOLj-FgKuVrCq1ar0qndn1-tGQbrw>
    <xmx:1j_vaTDcKw5MER7CmioDf5riajU40HSQLsvxYG8WHhukFqoThl2MKA>
    <xmx:1z_vaVax4mtKhdz5qnV-Zlnjuw-kGX1r05gOx_oJbZLu7Yr_KywLrwxs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AB86C70006A; Mon, 27 Apr 2026 06:52:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ah9Y8yUapS6-
Date: Mon, 27 Apr 2026 12:50:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Kevin Hilman" <khilman@baylibre.com>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>
Message-Id: <61df85c4-d5c1-4109-bbcf-fbb6b681eefe@app.fastmail.com>
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
 <20260427-nokia770-gpio-swnodes-v6-2-b693296c1985@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/3] ARM: omap1: use platform_device_register_full() for GPIO
 devices on OMAP 16xx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_035212_500469_E508D111 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 27, 2026, at 12:46, Bartosz Golaszewski wrote:
> Ahead of changes attaching GPIO controller's software nodes referenced
> from the Nokia 770 board files to their target devices, switch the
> method for registering the platform devices to the
> platform_device_register_full() variant. This is done to leverage the
> new swnode field of struct platform_device_info which automate the
> software node's registration and assignment.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

