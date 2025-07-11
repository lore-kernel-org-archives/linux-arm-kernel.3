Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9809DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zEL+d6XlXqEpa9OVBskMukB3A3gQTghEOyqrGTQsvC8=; b=Pp15bWliCEomcg
	jpBiX2sC1xZTUjSDo1UQm80SACf4gd1TwnG7YHQrIFW5HrCza8YSmoGlMCsFO5vt8qSu1DnNMFCQG
	bzBFesG/Oy0Y7l9tSnU8Gy9HT/BX5NrnW61MvndwmDilGtB1pS2tmJSoIk7aCrCik47jUp5ttANfE
	VxWpjM1sPniET3GvQw2ekBulXrmu6JnCTN7uBv8rln3nhMjwtMGyrt3Ox9bWo2qKHWj5SRj4f8EiV
	bd2IuQXJlOvesQ2NZzHVu/L3cTX6dw22DKFkI66TeFEdouWuX09zALFExpkbkzSHWvUmZ5/8yq//D
	YmDzM0nsMwunJ9fW4Jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMfr-0000000FynY-0abr;
	Fri, 11 Jul 2025 22:56:59 +0000
Received: from phubs.tethera.net ([192.99.9.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMdV-0000000FycT-2VNo;
	Fri, 11 Jul 2025 22:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tethera.net;
 i=@tethera.net; q=dns/txt; s=2024; t=1752274112; h=from : to : cc :
 subject : in-reply-to : date : message-id : mime-version :
 content-type : from; bh=zEL+d6XlXqEpa9OVBskMukB3A3gQTghEOyqrGTQsvC8=;
 b=FDH6Y9OhJ/oMZ74hq3OD/Q2WnQ6E+FFQrNVmbRncYQtSVN08ThXiP4TnGgfLl8YlWCqAI
 csO+/ITQ7aaRoYFlwx++63/H5SnVVglEh4t2im+WxDyWbvX3VOTApD2lEVyt344JlL5I11P
 SlwDrTsFMZaqY8c8IpBS8i8Idi8/eLOWM5WpTC+FMfU+gkkA3zAMXxINgfKR2xGEGNZUCzR
 TQZ5Mq71NXKwNy4wFXIx8I2dbedeRv2/N3UFoapIh3WZ9KdmALfKvZDHw1ZjVj+/Arc/39D
 FTt1Lt4LKDItiUoGAKYSIHM/W94u+S41PugrZgis8+kUuL+4ArmqgyHbS4jQ==
Received: from tethera.net (fctnnbsc51w-159-2-211-58.dhcp-dynamic.fibreop.nb.bellaliant.net [159.2.211.58])
	by phubs.tethera.net (Postfix) with ESMTPS id 820DD18006D;
	Fri, 11 Jul 2025 19:48:32 -0300 (ADT)
Received: (nullmailer pid 155084 invoked by uid 1000);
	Fri, 11 Jul 2025 22:48:32 -0000
From: David Bremner <david@tethera.net>
To: wilfred.opensource@gmail.com
Cc: alistair@alistair23.me, bhelgaas@google.com, cassel@kernel.org, dlemoal@kernel.org, heiko@sntech.de, kw@linux.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, p.zabel@pengutronix.de, robh@kernel.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3] PCI: dw-rockchip: Add support for slot reset on link
 down event
In-Reply-To: <20250509-b4-pci_dwc_reset_support-v3-1-37e96b4692e7@wdc.com>
Date: Fri, 11 Jul 2025 19:48:31 -0300
Message-ID: <87cya6wdhc.fsf@tethera.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_155433_822902_9CE4420B 
X-CRM114-Status: UNSURE (   9.27  )
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


What is the current status of this patch (and the pre-requisites) with
respect to mainline linux?

I'm wondering if it might be relevent to the problems [1] I've been
having with rk3588 resume, but it isn't clear to me what I need to apply
to e.g. v6.16~rc1 to test it.

[1]: https://www.cs.unb.ca/~bremner/blog/posts/hibernate-pocket-4/

