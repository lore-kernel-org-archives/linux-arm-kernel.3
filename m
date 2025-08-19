Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412C1CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kWRqOLRQkvoLDZ1zWkcwdvAPz+bsgT6+giTyag4mGM=; b=F7ANiCHfhOO19IbkjVNuJ5d+R7
	yr/jCqTefJct2ImEEC8wudTXzqb1gOBT2kME40ULr3pGnNqI/smPuFjlHsQ0OiGlipaOyVIR53PNc
	zRx4oPhkEEmeVviG1cC4pVpmIXST7MCj/HWtAIhvB7qhVXLBNwh1ZmAoVviHav9PwpPsu430OP58M
	TyXDXfeU3dFurkdPAw6POBVd132g4Bv3RRdEEtvZ+KcXabrye08/OfUd4R8ALtYSpoxzcydJWiAiE
	ekV8knDSgqNIlzlbSTGExHMDD9YQJgINpuElzvgyEdFlfcI/0f6Mi8O/EZTPyHBxxN2BQOCR3VXQW
	F5H0aq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV22-0000000Bkxh-2Qkw;
	Tue, 19 Aug 2025 22:42:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSlx-0000000BWUR-18hO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 20:17:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D18C60209;
	Tue, 19 Aug 2025 20:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE99C4CEF1;
	Tue, 19 Aug 2025 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755634652;
	bh=U3q6ToLedU70bZtEW12+5dJwu9UAwqYJ/UGCU6LWzSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRp7A+/wRv7ggXzPyAsPMR83RBwwR2BGDqN+WXMkAITJvfTJ3lku62QcIAgoib+/N
	 PeylRYfP1DU2pi5hCGbkzN4M101W6GHSVsNWX5MXUIySBw0Yjeeb9PpUE6Q7YRwaXb
	 5/wgn6b9aBFaYNiqXrQCVqtyI7291RqbqEwKYPMffM0kBSHsvE2enA+VIrTHv5CbzX
	 /sX5xEZHMM9znosbNs6s8uw/AJ0IH3syrY1v9xM2dmCUY3oDplXgtCNn8GOcXhX+gm
	 e+XaOPjPLBiuzPwG84m8tt5beyZxjiN+tJV/j9ZaFXUSD85xIikBHV8iH0sVDLzBSx
	 r5T2UwPckIltw==
Date: Tue, 19 Aug 2025 15:17:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>, Janne Grunau <j@jannau.net>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 1/8] dt-bindings: rtc: Add Apple SMC RTC
Message-ID: <175563462607.1254097.12905994195694572424.robh@kernel.org>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>
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


On Tue, 19 Aug 2025 21:47:53 +1000, James Calligeros wrote:
> From: Sven Peter <sven@kernel.org>
> 
> Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
> but most of the PMU functionality is abstracted out by the SMC.
> An additional RTC offset stored inside NVMEM is required to compute
> the current date/time.
> 
> Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/mfd/apple,smc.yaml          |  9 +++++++
>  .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 45 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


