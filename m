Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AF4C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 23:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwibh2h2bB1yjw6hFTbyUB8lLKDahh9+8Z7RroZm4MI=; b=ky0A8zPltF059mWshUYXP9uWBu
	Z3N8oihXMA3Wzo9bHyOmcU7lDSVx8GAzwcjRyzKEcxrNUhcJmQuwu/uEhv9nvr8fdpx74QZqIbiPI
	we1ZpFiM529H3wBYxZXOy3JdeUbKJJY1qT7PunOUbTqHDgjgVhP8L1ZrzUdPkbeM4fI0k3sGJiHpm
	284SC3Hwk/NWgfGydog3idGGvYQl6NfQ7drSe/+2e/3rf63RAki4QNGi0IDhXx9z2cUKH8L+dRHAO
	lS8CvIP75+cs+7LdqQsWyYiyrvinp+Bs1PKflBFZDb3RyOYSGpQSFDNqVmYjVNKceCT6hpe12Dina
	ERquRwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O6w-0000000F7mR-2tq8;
	Fri, 11 Apr 2025 23:48:38 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O0y-0000000F6uL-0YA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:42:29 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3468DC0000E7;
	Fri, 11 Apr 2025 16:42:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3468DC0000E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1744414947;
	bh=KE7xx5fV3DHlKulz2UWAtTlLl8KAKyE2y/a01nvcr8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxGl8ei7TG0FMdq8oJTJ1FLRjiUokkxHXRTnAveVbeoc1GT7VVIdqoKVrwCzOApwp
	 Btsja+ZySFOReaIPBkbIPngIiCOnAusNTp+ZB2oR86suP2Wpf1jBIfjA64U9RqYkhw
	 mBv86qa+/9Bf0qh5gjF+r/XNEQMZ5NYb+sT1U6RY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id EC41D18000530;
	Fri, 11 Apr 2025 16:42:26 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Olivia Mackall <olivia@selenic.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 03/12] ARM: dts: bcm6846: Add interrupt to RNG
Date: Fri, 11 Apr 2025 16:42:26 -0700
Message-ID: <20250411234226.1022410-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-3-22130836c2ed@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <20250406-bcmbca-peripherals-arm-v2-3-22130836c2ed@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164228_188837_6F3CADDC 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 06 Apr 2025 17:32:43 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> The r200 RNG has an interrupt so let's add it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

