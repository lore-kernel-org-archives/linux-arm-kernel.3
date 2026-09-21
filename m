Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0320C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=; b=WExvWkqW72t3PmC2VTUhFEeTiv
	llyhmVpxGuwme5c/PyszGUO+N/GOy/tjZ1euV7m34zyv3oeYmztip/4fCjXuZR1EPZz4q4u0JEi6b
	asPgCwttjeeK9up75iJ535B+6ujUDOYuBfuIPATOla9QLuOf63lbldq6CQmqLTV5wq09hvXa/1gJr
	hOYvJGOlBUcAC6O/9pHXk/rc16ai1YyQv8sQqTYq4SlSKkgLCZ2dAOPWjYVhe1nerIJ8Ofta8LqJN
	vodsHTBl2IQBZ1lsOcjV2/T7GVhMi9X8A6IX4GMleBrUZWq7x3A+Pld7nioeuTe1d9HXDlLrdzYUs
	YupUFI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iod-0000000387Z-0yN9;
	Mon, 21 Sep 2026 18:32:35 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ioZ-0000000385w-3FmV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:32:33 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso1157764e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015547; cv=none;
        d=google.com; s=arc-20260327;
        b=FhoTDdkkLeCDBthxjUIftUef4lnPxVLXQncpnaXXb+KxE0NuCzX+W0ROLS0aPNSwT4
         qCx3GR84I/WCmJhyF5RxbbY7P3TEwp3nHpv0gXd3uyiSkEqpCl414WjzeRYP6SBJ44SU
         gmn/T0GqI8LRo1eiSyaADsi7M7qPy/UDWHeM3jMD3CIZeV80KVJsihX/ru9jiZIrO3d/
         1ANb56aa2f/yCQZQilsTy7N0vtOSWOTNDktjE/2NVG1tEvplqjoA+INozPSZOLK+Njbc
         15CXNvo/O54xWjK/XdrXJL20asH4SJNUqCx/KYBzZnvEQGMPvTHdvYv6+fmlzysN4Qib
         W/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        fh=TcUg0N3gfkEra9t/yU/cUfM5jUymN+PhOBofinbRD14=;
        b=DeUS2BSJJjmKA2h8UqolMz/v7ge+PU4RxYnCb1EdsuiFvJn7wfvXXGiS52+ugFwMM9
         PAhJMxFE+opmVK0nUMWkgQLpDK4po/t0Was9CwDuhtf6vYPEqjquihunQ5QzLE8IDhfR
         +PGnV24b7zR5kh4O3Xq38K3DLhXgBzpX+D1BqGnObajU0qMJZJuMxunU+4yri2pW6i2d
         04G/jXO3jNHulxiQwA5kVTTuzXtGDBSf8chYmu0NhGNzHHOIouhXL0VYiSpKLolePBLU
         HvJ3Js2/LsN+c+O+I+K8MTSVf/j8zQHmxbNAIe62NL8+Ey67E5BU133O4PRY/Gp3ez1f
         yxOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015547; x=1790620347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=V113PS8M03TCEeQx1Gn0G1wZxSPq57IZR8KjE5ZT3z4iadfxj8f5TkxnOyI0UDcfHM
         /b3Jxr2KqCOdvbWZrQO3JHFonA1p6WSa7E8BZrgy0u4QBvXsLC04jSM+d1inFd6ybvoX
         5gPCGtS6yZli9YXcLcrmSsdo4mbkc63hGMcn3VPORr1SizUXCHus+S+w/tDdjurtSlry
         fGFZrADXQNXmehNBB4bcjxJj+beCETIcCt0bgl39GbntuIidVfsnNIyxFwixei1dB3oM
         qnUtR07ct7fropfAasjNdkdzB2daNnVUzUQ0Z6dLhwvVycaboFmOSFNcVErRudbaP/HZ
         adOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015547; x=1790620347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIwSMIYKqd/HyMR94ewi8crt6BwQsBujCc6Lw+X9iRE=;
        b=JmvpSKN9ifYBTqkjIfoCs80aukuee2ZLq1a4S12Tv2OcZlgaU9iV+N225FKK3oen1c
         Irhn1x8V+t9xS9O6s34JbOkXC62AbuHtvoSV4Wvk1yuemVUsab9V+7vZoCYnEkAKiWmm
         4/qrKcqxcP5OUs1uGRIdp6bdaYlHA/MVaW+6+Rh78tZgB4AXMWu55prOkOXfH3RRvYCp
         5otObTXmp9BPHd5QeO1YzQCFluHkzPlEvmd9cAvdDDXUlBhX4x0H5JsevjkyJJH4lo6S
         EU4dh36Jb5ZtggKI476Xu9EG7EseqMgzuKfnnf0nHPynQ8FZrr/Mz19ittNUh7M9uqkE
         kxaA==
X-Forwarded-Encrypted: i=1; AKwUvByJBHx/gPGivGZvdAXoc3cEXOiVEp4Axhhs17tThN+8OH6D6yybXhSr+FEnDl8RPflkALa8dLcADFuTc8giErAR@lists.infradead.org
X-Gm-Message-State: AFuF++n9V8dzH7bC4iiG1C5LqTMdZSPqSTqMgSe+HqxAkeTx8G65cJA7
	JQIpcoYcOR7U8jyufF5hNIBvzOd1Ef0qGJjz/N2tjFregSMxQbwlqeUI6hrfNwiutNTKZ8LIApq
	Qe2LdJCrlfk1kpkg6lqgV+W2lpol1rS4=
X-Gm-Gg: AYBFou1AwcVhs7nilUzhMGhpeyqv6FkIXvnL4fXk3IrfbgDrOyUPxpZN5EcCsDNy6y2
	25cFXjaABXGr2lTgpo2gb6imWpXye/68q/U6Dyfh8XWPmgNsemcSylpYyiCSVf9xrTSwkCwLIMe
	SeMWWi30FrsVdmpAj/BUSNYalycEUd/QHkqMW12C4+/mpL3twHybwh9y8Dc+OGtvAa07+5Z4F/A
	MbyF9Afk4ZJvYf/zECvCntgYTj3bn1AQIlvfSxfe8vS6Fm1eEFKj1HmUjBHWxtBTuGn3AeEvgvw
	8zc1GwKwJXdrUi5DZAgHBVGOvXyPIrVytj0IsFgyCXNijVsoF58JZFqMnG2BgRMrdhN8ZL3mFzW
	HQJex7AUr+g==
X-Received: by 2002:a05:6512:159c:b0:5b2:9f7a:29aa with SMTP id
 2adb3069b0e04-5b8c179de22mr3976341e87.0.1790015546739; Mon, 21 Sep 2026
 11:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260920211356.186967-1-rosenp@gmail.com> <20260920211356.186967-2-rosenp@gmail.com>
In-Reply-To: <20260920211356.186967-2-rosenp@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 21 Sep 2026 20:32:14 +0200
X-Gm-Features: AcwNN1VdL-Fqcu_uP6CBPAY_SNwPGWfl7hrsVO4b8Qj22YVrcCYQZRsojkFfRw4
Message-ID: <CACna6ryP-ZySxcK_b+BH-5ckDJxAOXE3tVtLYWP6SYA_Re3HOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of a GPIO
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_113232_373560_695960BD 
X-CRM114-Status: GOOD (  14.34  )
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

niedz., 20 wrz 2026 o 23:14 Rosen Penev <rosenp@gmail.com> napisa=C5=82(a):
> bcma-hcd drives the USB power line by grabbing the undocumented
> "vcc-gpio" from the controller node and poking it through gpiolib.
> Besides relying on a non-standard binding, this cannot work on boards
> such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
> both the USB2 and USB3 cores: the two controllers each request that
> GPIO exclusively, so the second one fails with -EBUSY and its port
> stays dead.
>
> Use the standard regulator interface instead. Each core obtains its
> (shared) VBUS supply through devm_regulator_get_optional() and the
> regulator core reference-counts the enable/disable requests, allowing
> both controllers to drive one GPIO without conflicts.

You should add support for VBUS without dropping "vcc-gpio" for now.
Deprecate it. Give it some time and then submit a patch to drop it.

This patch as it stands also breaks bisectability (because it drops
"vcc-gpio" before switching to VBUS.

--=20
Rafa=C5=82

