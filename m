Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F37C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqYlCGQkHEH3g3g+Yv+VRcbCkPcS5wAw8lfoSbkViQQ=; b=SHp8XWAGAFfKz1NyWybVH6yFth
	RHHkdkabQsJWpT/5LkkR4DGmbwyW1TAKP57CVdHfItbyLuS8lDIrTVd0DNFxrVUw16Qk2R9iLwjDN
	0LPVuG7Qf7rZ15Xe2IBq8ZmNK+DXKtmwpFGagtXCmlRLtAiCDCz3ra4bJzMlpL7NoGOjx8zj68FEd
	FcoMFsWPMADDkfXgIlGl8Gsq3O8xP8GHT3TGzIQdnqxHKcbzf5YRNJCYiQEaMNuSMMr6Mltny6/yJ
	47I1X7ykX5mWiF3+fNElsovrJUDR4klTo/G5cCfoEc1bpAzknGjCmXUr26cCHgQPejoD24+/QESpw
	YSDf/JCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whstl-00000003A8Y-1ZvT;
	Thu, 09 Jul 2026 17:50:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whstk-00000003A8Q-1OQW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:50:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4541600C3;
	Thu,  9 Jul 2026 17:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D091F000E9;
	Thu,  9 Jul 2026 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619455;
	bh=XqYlCGQkHEH3g3g+Yv+VRcbCkPcS5wAw8lfoSbkViQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D9UXRzOOuSKjLeYFVxX2GeI5ylc2TsiTyOXPRBgJXJuv8A9Tbwzisch6coRAUfJ8W
	 kRfP5MDyLjJuQ3az4i4UIeE/Id/UB8ND121AVROQhj+xAHZHavrL9BW+JcZHFtBf61
	 k4ypfR/a83/57WQu6BDt0zYOX37eWRD5pKd6lpzMqz+WtiUigvfpvlt0UeTZqJaJPT
	 RxRU2x3dfGtqdhUSP5EGpjNHz+dCme8gXJWu9XsBeNY3QQzg8AE/2vWmr9rEFAVDhU
	 ST8VbkydH5lPe9Iz4cBhpqrICh5Ut9SyA/HgTr++BQvBCbJhEaL7MzGDI3hNW+Kox+
	 uJdaZQDqW92dA==
Date: Thu, 9 Jul 2026 18:50:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: arm: apple: apple,pmgr: Add t6030 and
 t6031 compatibles
Message-ID: <20260709-shorthand-omission-b374f81f9795@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-4-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6gwO7udBqS0Uu2zF"
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-4-55b305833123@jannau.net>
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

--6gwO7udBqS0Uu2zF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6gwO7udBqS0Uu2zF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/feQAKCRB4tDGHoIJi
0kyrAQDRJDX99fZIQTLV7Jo768Tdt9D6PgOT+gurSEO5Mve4KgD/SM0QvuuFDN5d
zgQdXXFDO3auhZDAfIUpYd8oSpOB3wQ=
=hiSY
-----END PGP SIGNATURE-----

--6gwO7udBqS0Uu2zF--

