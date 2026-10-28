Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EBA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MzUnhm2V;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzZZqJ47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q08GKnMLIclDg6PTr8i2voxZm8I33mhrixHE5JuaMUs=; b=MzUnhm2VHrqBAeBSaqFMFjqgID
	Xi3ff9tMmyq/xIbiKbHf3AVXjM07cubfV2ZdreW313uetEooO8OoLzYlM3EMJnBsAQz4MqSpteIu/
	AaZ3h0ESTlLYf8OTC1KuW+qrH918P4f79Ei0MTfvsRClUso4SwG+WQSdVjOQvbLGpDk1jckTHKG6V
	tqxtBItQsMDfO5ik+o6SYpJ6pI8PFB2dG2LzTvGhJPbSaRY1+DXJ0mmGlKPrDUi+nWa8RULMkwypc
	tFWbTOLC8laWlph2x8di2I1q1kp74BfWMvuKGdfbwRPAqGSouBaizdl9ZDSspbzhwX9xZm78uPFEQ
	okdkKj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxgN-00000006RpV-3PMX;
	Wed, 28 Oct 2026 07:02:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxgM-00000006RpM-1w5i;
	Wed, 28 Oct 2026 07:02:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id B9829601F6;
	Wed, 28 Oct 2026 07:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E64751F01825;
	Wed, 28 Oct 2026 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793170965;
	bh=q08GKnMLIclDg6PTr8i2voxZm8I33mhrixHE5JuaMUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EzZZqJ47lMCCR7dVk2hu9KwHo/iAZMjZKBzMs+gjAQnA5TfLoAuE/lrZCIOrYBw2T
	 3NJ37YKg2C+FPc+wr4HddAc2Lcwd0PrM7GrlUrbLfa7uiEGHEYphF62rWWWE3Og/BM
	 HivWTNw80Wc5XdUqU6TW9QuFPSLpnsKPaOGmd8esPDUZuLF0SmumPlvE1s2anqINIS
	 ONgZOScwSvGLCwtxsKgrXFKCNBzzddx1VZLNH1PRoP4ELfkSqvk4UHzCK2PzbFwsgV
	 Nax0KXyAkaA9c1MumOTuxrQZkxVYCOzpNvPkB8F//DjxCWnBgE/SjUIDQdlFSSUqCB
	 aMpRoEtnAt17g==
Date: Wed, 28 Oct 2026 08:02:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Gregor Herburger <gregor.herburger@linutronix.de>, 
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org, 
	Gary Guo <gary@garyguo.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auGdsv0OVG4iLjZV@monoceros>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7352vh2aneherser"
Content-Disposition: inline
In-Reply-To: <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--7352vh2aneherser
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
MIME-Version: 1.0

On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> +#include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>

Irrespective of how this patch set evolves: Please don't add new
includes for <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id without introducing a batch of unneeded
dependencies.

Best regards
Uwe

--7352vh2aneherser
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhng8ACgkQj4D7WH0S
/k4mXQf/f5hiHhqUiclt+2CPju6hq8FCsfStkH+EZvSc7NslDu75MRe7OC+1yY7u
nWSyOG6WZJOrBiFEFih2KF5vWvNqRT1lW3XPYx336dt5u3QSAtO/PXVnzZHIxW4U
L8YmwRx/roF86xyaKZ5W1zffnXUSBd/kl0vx9EPzXtxk7QUYcxp7aRf17fkQFr5t
RfO+cCPHdi5EYs2bx1/YpQMw3dxHTNv7Bk9+muv9DArcBaZxXI/dluDw1eKhcshP
z8k28tn35as60d4zbj2J06gpwzuLCyHgyfOoR8ztRK5z46PqHhSNVzecRZFLDeZZ
fMrS+8lBuPXYYKbmDD7Yt/AbS9cvCA==
=+FkA
-----END PGP SIGNATURE-----

--7352vh2aneherser--

