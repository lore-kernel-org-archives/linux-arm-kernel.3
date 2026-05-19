Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC9FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtwtBFwadYy1vJSe0JaB/O9Syh60kHZInyPQwvy3ZmA=; b=lLxfMMma+9NjTH1i7iBKmJes3/
	Bt21Gi0Ox6CP3LHIThasRS0wX3eIODchEzfTnfe23nJNE4XtfYM008p4uLS/PWhynpvXgZ+xOewEJ
	JfVUJk+LW9BaBXY8rZ+MHhGzAVfzhQIhckGpVRiZdulv6VnZiaUgk8k0eBf3u98G6f2mmTEkiBjzp
	HfBOchrUV8M42Eooii/xg87Usr6qZcuzK2puwTnYPpFGj/YWSVmE0eMzqrj4kSm22ytF+enfAU6Dl
	Cb2freRvrKnVjHEuliyfVy9V0Z3sk4TIFkZ246kEUiR9b73Vunozo15lTW5fqzkiusm3I7zRmNyQK
	kZQ8DJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGYW-00000000sgO-1X1K;
	Tue, 19 May 2026 09:16:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGYU-00000000sei-0PeM;
	Tue, 19 May 2026 09:16:03 +0000
Date: Tue, 19 May 2026 11:15:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779182160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtwtBFwadYy1vJSe0JaB/O9Syh60kHZInyPQwvy3ZmA=;
	b=xp1/BReSXshfgEJKm5kPlcSVJkDtgtETCP+0c3Kmn4bIGZnwIg9r1hsCQNc6QVtYcoXi2j
	bIgllsCksIxNgYbT2+vmCsF835FYaSo48KztWaMrNdFxLZP7gE5RFiFHRSbyv6hpRb3lc/
	+6P1FbnfcYm/fP4p91ZBieEF8cLtNmn0WW4j+pcGa4IHy3w2D24ml77JVEYY3Ehn3wtqEH
	+L1dqiKA1Q40+tqnA3U5M8jdcjyVKW7gj588aeYxYNtsksBOFNPM3aalqjxu7l9eMuz2J+
	7GKN+rxFAvxAee8N1NW7JRxm5m/W2/9/XVAhnlI6LON5TAixIdsrw4tvNiDG3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779182160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtwtBFwadYy1vJSe0JaB/O9Syh60kHZInyPQwvy3ZmA=;
	b=yIp11LYZiIbEZAcbUGs9WcfFD5GkhFJCvOQRO6X4R3go545uvAhqfRJHe0Kwg0PEe1lUnE
	0GaYAD3ikOxKlgAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 3/5] firmware: raspberrypi: register nvmem driver
Message-ID: <20260519111442-f1e6d418-9a92-4934-8a9c-c5f7827f853e@linutronix.de>
References: <20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de>
 <20260508-rpi-otp-driver-v4-3-cf8d725d8821@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-rpi-otp-driver-v4-3-cf8d725d8821@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_021602_273085_1EB3216F 
X-CRM114-Status: GOOD (  10.16  )
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

On Fri, May 08, 2026 at 04:42:46PM +0200, Gregor Herburger wrote:
> The Raspberry Pi firmware exposes two regions with otp registers. The
> first region called "customer otp" is available on all Raspberry Pi
> models. The second is only available on the Raspberry Pi 5 (bcm2712).

(...)

> @@ -327,12 +371,25 @@ static void rpi_firmware_remove(struct platform_device *pdev)
>  	rpi_hwmon = NULL;
>  	platform_device_unregister(rpi_clk);
>  	rpi_clk = NULL;
> +	platform_device_unregister(rpi_otp_customer);
> +	rpi_otp_customer = NULL;
> +	if (rpi_otp_private)

This check looks unnecessary.

> +		platform_device_unregister(rpi_otp_private);
> +
> +	rpi_otp_private = NULL;
>  
>  	rpi_firmware_put(fw);
>  }

