Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89496CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCbw5c5RH08/3iWhVXYJBwj4/n0wTQaKln6EJVz/2Xs=; b=mMqgPT4OBYO00p/2gdoeE/yJA9
	95J5J/RTDNov4/7IkH51Bwvit3q9rfkFk0vKmsswWXwtvu7nXZkkM1+c9xstwMSlkcm0EOfh9Ehmw
	2gHYTwAO1sBEjYak3XqDPbajUeHFrTyB6KsBjX5n0SggsYXduXYteRZ1Zp2majt+TMUeYd4ycK3yf
	1ntd9g3Ravq/QBVZldNvzUHA/Tigqe/7jpS4gI9umS+79AyPDnd8ttdfodxioyy/a9W6IQhQR2t51
	bq4IOdFPTzqGpBN+0MNsCyY3rkM7hHvzTeKUnq5TxXQGCH1eWcIXhUa1/fyIy5zsA8xuKyKwXc9nu
	1Vk+dL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5R-0000000GR1w-13a1;
	Fri, 05 Sep 2025 03:26:06 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGWp-0000000EEpI-3agk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:25:57 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHrb52fZVz9tVR;
	Thu,  4 Sep 2025 22:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCbw5c5RH08/3iWhVXYJBwj4/n0wTQaKln6EJVz/2Xs=;
	b=vFGyPpdsxilX+Hl+eye+5z2VObsfBJ2jo44J/mDVj7aAEi4JN/rKflE2/krTSlcuTkjS44
	FCZSIjj3QKs/G2DeKLN5CYpQYpIOi5WWQvNUhTrVIheP/ULewPlBBAwe3ZrForrorPMSgB
	h8//xpotWa2VRev9NCTvhNt1A+hisKyGmSAMXk4CB6l2To4KESNKVy/OF7fHGXTEVA5eSs
	4XEcSIY6ByZA5qO3gvNnKtRonUJnxyLp3ysr3Ex4MAMpgJOTcV+rNsLGT0SqmVsLue1kev
	KMKTWfe2e0TC/emsjJkkpFuY3Wqt6jdscbfXMPsbCpnPWOJ5WYmxZgseATxI9Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CMw4HwYf;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <94870c77-aeb1-432d-a951-27a0ff793eeb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCbw5c5RH08/3iWhVXYJBwj4/n0wTQaKln6EJVz/2Xs=;
	b=CMw4HwYfz4h5joU6L4tPmsmztaBJ/GKqo7d4kb3TlSitgpiOcBLcAHnzanutJkUWqB+XVT
	/oWjDuo4qQSi6UdpbZgM7vupEFaNqgxvAuYLjpZF14VtTecCfEUyGFlQU6OGKpEfFBZDl/
	Z/YjqLObhQFfOryWKOg30gjQEb6p1ypThOKsRjQQ8+dsuUZFKW1txA3u1mSr7Deba5fCgK
	JU6ajKqX+bS1IGBmW4tTmq3Q7GUW+52PLNEnvzQraKK3zQbGCDvzwoEuY8fvkB0h2Tym9i
	mj9BXf07B+1hmBnVxidnsFkDN5EZhrtAUbioDBgXEFawS8ZnT1GlXk1Lv4p9Nw==
Date: Thu, 4 Sep 2025 22:25:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO to
 Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200936.169536-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904200936.169536-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9rxpaercojqkobmp3jbnbb65osqtqkhi
X-MBO-RS-ID: c3086cc37f5c9633d31
X-Rspamd-Queue-Id: 4cHrb52fZVz9tVR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_132556_044584_90E18798 
X-CRM114-Status: UNSURE (   8.66  )
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

On 9/4/25 10:08 PM, Marek Vasut wrote:

> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index d8c9237624664..b14e593208758 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -99,6 +99,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
>   dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
>   r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
>   dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
> +r8a779g3-sparrow-hawk-rpi-display-2-5in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-5in.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
> +r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
Make sure you also build the plain DTBOs , not just the DTBs here.

I'll send a V2.

