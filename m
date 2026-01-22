Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AABC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=; b=nelc9VD5ATWU0xl35ug6qth8XC
	ICtd6EY/aqlbkqwMZ3Y9lKCc7iifXXYgpE/BIX1Mq+C+h8pkaVLMQRYHj+K2bDWsZgCR2jF7gs95J
	RLxYQXRI5wzMFWTokrkPwwji1Y00XSAObnwAbeDEZo9aZcZb2JMX7y1RHodTfPy3xPEk58jjFcbSb
	AA5xlbKyDq7Lr0UQ7XzdxzgJMlh+0OZo5lcJETIhRf8OeZ5oB609SX6j/Ln4LOU6GNADai82hWyQ3
	cjosPJ/N4KY28GaajL5EgB9vD5+LgqDopgBs/0clwcGaovEqeibgjxWQLbjpuLxRtPSQkSWWZ9YKc
	Wr4TSh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqYH-00000006hHs-1p2O;
	Thu, 22 Jan 2026 09:00:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqYG-00000006hHK-1F0Z
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 09:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=; b=aKShq+yI88IHQqyb5VTiMC6jUm
	iQvwnhoUahi5dorh2HRuR57beYPoWVnI7xJ2tJXUMd4TWCxvdw25ywkI1aef7pAb99NQMAtLRvsX2
	p4ykUpqVsWriNqNQyGpXjDOMdqaeQFSh6j1M+crgwAUolMLVPWzfNb4DLTjTEORpzshDdyHfnuqKf
	uzT3PYI3SsyBeBWsE/HsXX2HZYCvhZH1REK2iNNg/mVfc8R1NbnSBuX3dPmJqXUlkfmDF0gxlx1aB
	MqKUQkOnK2RpJLwtn8E2Yjcjn+1a+TCgL2+iKK8UrcJjfWUYmYGx81GBFzmnamzc5/+WfYtgH9QlB
	36K6Urvg==;
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqY0-000000000AO-41Dz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:00:15 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1233b172f02so1099460c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 01:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769072408; cv=none;
        d=google.com; s=arc-20240605;
        b=QRmEsGs3yE+cVL/64+pySxOPdBQ58iaHlPeKm5Qq6W+52h3c/i1ypqpE3mnETRXWo8
         MMTyBa89f3CIyTTDLhXWfMVoYmK1GrkjvMiiOIdfvT3vdOZ+yO7oGwQqNJKer9Ddv2Oz
         OZlqxRbxjDB79yZd9l729bCAw7V0nFw+94T0ZmlkFNhFjnAt7Fw9OYDKsA7Tt8TjbV7s
         uBjN+ZgnPoF7LJ/PPpoEz/qCztw42R2M9LZYGcGFwVWA7K+vBuaH9uHNvkGJWg9l9cep
         LwqYHKmSEnkMMicNtFKyHvwn/p9UTXGMsez2r/yeNgV0LqYC8y+JFjKMhsjRQC1pbZkU
         NcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        fh=StJ60Kt62lV6DdbJaH2tub923ZOACotDA740ax94pgw=;
        b=I5Qs2wlMywH6a+mWjfLVGOTlC195vYNKZ1ZoeWemmV76DcvsXkEx4slaFEX8Ue4dMj
         0IuWlVY3vyIBnhO0phI4wNIAd9szWxplcO1cq/ET/4ULdqTcLmFmmMe3DrAzHqLe9XTt
         8iI76UHrnYFA2h5aj6yetp/uh45b7q4bcLyOBW82k8yv4oIZR0ZcUx2goAabVtimvPq7
         sOqeUk9GUdh+3x6wOtGN7/K7HPLsBLv+eVeTxOkUc74jFr8E0u68UvP3159wVFA/OJzh
         3mw5XYJLdaimkVmks/yp6PqpEwrO4D/25D4DwuUddmzD5cWT5Bw58IWGXUwB9BXVdsN+
         5xOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769072408; x=1769677208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        b=UYkKkncwS/s2KKs50AM9uUF72y+kAfy39LMaI2c8Mw6F5YD3VOQrdynvkH02HaFhzD
         AGXK0gL0SdcjcXZKOM34k4cq/cT0XymntVpqaSS2RGP/+JMlfOZkTFWWPEljn6/UfUVR
         BypT+5eRLqm5jGdItrI6yGnFda1JcbaKGAglte3seCAGflmWH2kSn6Z2opGlOafmIFxE
         PouoEfxK8j8sGEGmkb2ylalfZSCK7l8o9g5vsXSdXsYgUrm47qO83E2khwUJToB1Nv7t
         DRxik+S0QBFg0X4v4l2NcR8EOGeZVKK3prJAMp2eCcLcgF/Yn204d4QbMa1lbzp7Yz5+
         Y+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072408; x=1769677208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcmmVLPN0Sojb3EmvyKfGFDHgv86UBzfVWtV3XhNOEg=;
        b=mG6fHwvqFQaHob0RPpAUJ8tzdShseM6o0MYUL5n2ryhLRnM6LrQ0XbEUDMDJexKl9K
         vGV0eLA5z13D9EHtBsf0akD8FlIK/Jh9vLRwR0XbKFCvUSB608ieyun0rAEkCLo83ia+
         BHm1rU4WgMMem6t2QTiR+/axQwx+aiJiYV/SRbGSMRfKU49GfLmNo8GN6RsgFaIo5k1e
         dD7sWXk5BhNNTrdr0Cpjx0XL3dSeFM6ZfvExkoNXdDBU2kMHdAfK9QAXsiowvZTF7FXz
         kDAtbszEzR5nHxNRapsIRgizHlDnI16uYjW/3HXuLDqI4421Kwa2GWfPcxcOq9twcw7c
         5lag==
X-Forwarded-Encrypted: i=1; AJvYcCVVi5ZMMIDtKoBdHrQMYj3Mf2oDdA1vhN5dvh/Q063b0ddJZUBUSRyth8dVaPW05+wBatq/pZ2IGQ7RT2NGQzkc@lists.infradead.org
X-Gm-Message-State: AOJu0YyVhocSpjMoNYna5shm9gpOgJHx6aJxhe7jg5BjzN752njjmnc3
	bvDB26vYFsXQ01iE/nSJQzu5UsbSBcPyzDNieIleAVoZCvIscjg3qPAkI71e64xaVcJnhZRmRBb
	8DsbkHEFgdYPY9AioISC5eFXy+QQN8LE=
X-Gm-Gg: AZuq6aISXFdJLLpENnd5X4+c9/yl32g4lmn1u2swBA/NX4Y5ez7HRrG3VLws+sBnVqT
	RrqXpelfF3QwnIsUym2P4iWlO91rZtDb/fF5ITKQZ9/qQzZTc+tO4FZZouXdqy7yUq/mGw97+8F
	rNCrSBTx0/IueQbzYhAovEFldjxGp4lovq21l4AvYQ2cw3nzaL1WBPvkA5xT3WnNvrx4XZXwXb2
	ihlz/1aG3Hjk00vRoKRDKVRzkt1+ANpedvvcFZ39kxDw+92BFyoJyCjnNR2T/01UN+QTsrzc6UK
	wTCsTqNy/6qAJ+IKN7brTYXPEm/yEQcbRDVoWtNX7/xvBnvwHXiqsu0Rawx8L+lUp1kNpoVxgeA
	Y0Fk/7uPyFuHMu7mXXgzc
X-Received: by 2002:a05:7022:eb47:10b0:11b:a892:80a5 with SMTP id
 a92af1059eb24-1246a9683ddmr4799166c88.13.1769072408307; Thu, 22 Jan 2026
 01:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 11:02:47 +0200
X-Gm-Features: AZwV_QhQ7Di6OY00AIHWXVDVc4TW2QFRAihJ3KdJEN07TYFMxvmJku0VPJz7aJ0
Message-ID: <CAEnQRZD1Hzs=+4piUr9rUga7RqV9PSuB9ZFiMY+qLoRz_2-W=w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_090013_571736_9A932F3D 
X-CRM114-Status: GOOD (  13.38  )
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

On Wed, Jan 21, 2026 at 4:33=E2=80=AFPM Shawn Guo <shawnguo@kernel.org> wro=
te:
>
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thank you Shawn for all your help and guidance!
Good luck Frank with your new role!


Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

