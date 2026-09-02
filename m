Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C08C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7mJPnrxHWOyEZZGuMJyGGgp/l15wF2SNz6afr8E6tg=; b=SExasgfBbXTljX78ILSjnj7OtX
	j5pvpDFJipe4sxtevOryxWvfhYdmR8WSAAZef5esc9sjkoAk3CMsgt+PwoSi8DLN14LOWeS3JNJuO
	EJP/KscjrE95ydzI2cugU5ZoxlxXto4xNYSblBzCRD6g7dfIwfOqQ9DyWSbQajmPaiMauXEdoubZv
	X2Fpm04XOPOIjZY86qBvc+M4D/luAecnZc2Otmr3bw2ebi0ATxoAT+/ODvMWeyIEv43DR3H3QS0tQ
	myvB8gmrs8R7OfGg6iCM6R9QpqE8WgF5n/DIraEPLCB602JOIhU4AvIlhzwf5P7pEfKTl2pRoV7Zc
	Wjct+Mmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hSu-0000000EFEm-2f0g;
	Wed, 02 Sep 2026 09:41:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hSq-0000000EFEL-32R3;
	Wed, 02 Sep 2026 09:41:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 342BB4E414CE;
	Wed,  2 Sep 2026 09:41:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 049BA6053C;
	Wed,  2 Sep 2026 09:41:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C243511C79300;
	Wed,  2 Sep 2026 11:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788342056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=m7mJPnrxHWOyEZZGuMJyGGgp/l15wF2SNz6afr8E6tg=;
	b=qZXcziPri/qyXRlJMCEfoWrjGc5w9g+hB+AwwFPIU/WkUwKG1WKlt1YcKvvOZPXE/A1+ke
	S4OI9PB3yMMSuVk+NGjiCSN1AUArS34abkJVf1vvjrKNVmpfci2zpAsOtFtKM91IBoM652
	OQkQErdlp6JhP5LNXyS8f5eKYELa/eJxHCX594cHgP+RoAjMm1NFlyZpwobHgB0oH1N0hF
	p4LhuReLSiJlxJQff66Y9MFBXQdKn/1Z3FpZCv/lMwfOrGBRrwjqXjlFcQb0koe00C1mq9
	5/b2C6mAZjG697ZlTMUJKeiVuGiXvOwNQsq8Z78foUHu6RZ7HEVBb5uIUE0ecQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Michael Walle
 <michael@walle.cc>,  Finley Xiao <finley.xiao@rock-chips.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] nvmem: layouts: Add Rockchip OTP CPUID layout driver
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
	(Alexey Charkov's message of "Tue, 01 Sep 2026 19:33:13 +0400")
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
	<20260901-rk3576-otp-cpuid-mac-v1-3-ea9135270fc2@flipper.net>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 11:40:52 +0200
Message-ID: <878q5k7zyz.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_024104_895579_C9EA4613 
X-CRM114-Status: GOOD (  13.68  )
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

On 01/09/2026 at 19:33:13 +04, Alexey Charkov <alchark@flipper.net> wrote:

> Rockchip SoCs customarily use the CPU ID programmed into their on-chip OTP
> memory to derive stable Ethernet MAC addresses even when a board doesn't
> otherwise have dedicated storage for those. The derivation depends on the
> particular bootloader implementation (e.g. it is done by upstream U-Boot,
> which patches the derived MAC addresses at runtime into the device tree it
> hands to the kernel). Using less featureful bootloaders, such as direct
> boot to Linux from SPL, leaves the kernel with only a random MAC address
> instead, even though everything required for the derivation is equally
> available to Linux as it is to U-Boot.
>
> Reproduce the same derivation in the kernel and expose the result as an
> nvmem cell named "mac-address", so that of_get_mac_address() picks it up
> through its standard nvmem fallback. The address index comes from the DT
> phandle argument, which lets both interfaces of a dual Ethernet board
> share a single cell.
>
> Enable the layout by default on Rockchip, as consumers of its cells would
> otherwise defer their probe indefinitely.
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Quick review on my side, looks good to me.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

