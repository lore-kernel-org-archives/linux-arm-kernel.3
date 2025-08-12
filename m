Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E6CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5nnZKtUiilDivRmsxMYOh+vKL6+puQDJ6xyxH4ExM8=; b=QjolCSzL8KemcGr+Xw1rxLDNIx
	MMHzN+auv0RQvQ4Wo/qaz90GjhfnBejy1imy5bYpvn7ADw7akz8WOCM5Pf8+RYfqNG7zwP71Z56Oa
	C5yFn4m4uULRGhrz4BnChXTwtIOFyGHzwoq3goW9CnfSRQz1SbFxb4LGBGzqppO8PUc+hzRzf95ZB
	lDN7Vcbnq7Wic7u/270Mws1hIcBGKMu/9WNFYNeTKl1xP37JzB3c6HxSqMyhi1zSfGKUdkf9LmIeT
	dQiy4u1yNYujxtiqpjsN8G6iQIUieRpQcKlxk+ln/QYrmUyybxjGdTI3pN2536gCtXAqRyP9Il2gd
	aMLOv8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult3H-0000000BdKJ-44rU;
	Tue, 12 Aug 2025 17:44:47 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulpne-0000000B1hA-0x1H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 14:16:27 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b85413019so6521690e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755008184; x=1755612984; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5nnZKtUiilDivRmsxMYOh+vKL6+puQDJ6xyxH4ExM8=;
        b=Gz6XT+k3DoWjnb5roqcgSxmCLNTJWVrD9j69wZHWQFGN93av94wGPeG1dDm3tiIFH/
         yNT3b3Hofadx6UXtLjZ64HTFnWHbDMmGqkLmeWDoTaA5w4uKHsHjWpaY4lp90rvcuhhC
         /VsdeQ2f3rgTjfQtc2ja1Nk4Ze553rPueliUpSLmWCffexa6WZo3LWlLbJv5Y5B/z925
         va91wkJVZTYeVAyFu2qW8tCJ+YkBKVg/Q19U27DwMP3qwpix0w/V/pRDYn1RVNfBzT2I
         PrgYjhmDwA/ULHUOU+D876w2ECqRRhDqg2xkq4jTu60BtTae0td8R+SYIbcj+lAiWkdR
         mdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008184; x=1755612984;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5nnZKtUiilDivRmsxMYOh+vKL6+puQDJ6xyxH4ExM8=;
        b=lT86aLw9mexQ3Kh1ym9HhUrhrA1bR9EtIKA8tWZDrW+/+WYZMEjWfLpk1ED5cziXdX
         VDK4D87nzm6vD+KqtE3zmtEuDM9r0trRoFyHEhl9J2iEi84dDdKy8MFF9oGSavKfXMac
         J9qLNz2lMVz0QTlJr6d8jpHUxaUiX8qqlgqQXMZvSLyf2X+xiRhQvQ2ZIN7uzM7tuCIa
         uMP/PCUWftAjjZFHdS+ZUCdAD9H/BExr+jhmdUkSNTEzkzc+HMjYr5OSFk0xS9xbKbih
         QcGfa+mzc+w2atGsUAweRkhTcdn0ZNAuHqGz5PRkZST2XV6V+83yS3atZper4BBSFZJx
         sT2A==
X-Forwarded-Encrypted: i=1; AJvYcCXI1c2pgg/A4AVPSOU6IjYGO/jZgnZrz7T6z8y+vCjpeoqs9UR95X9KCtnjxcWGHMwDSSTyHvuDgo3+U2hWTTKB@lists.infradead.org
X-Gm-Message-State: AOJu0YxdsLKoXR0oIktCebScU2Pou0xY3WdDsgSDEi4uIadyaXyHo5Ue
	e5J3rexOn9OVA1VdPVvyqfTLiKWj0IVLXeQHbkp8ShO3cJsfyQjsnK3dNpfqL16ofoHuk1fZoiR
	TAzho2YqagsbUeSECNGTNM81Mt4lRAWYrr7tLLIBaNQ==
X-Gm-Gg: ASbGnctLiePePObNHSWqsvjAdnVVD8Cq8lhSxcliw/oWG8+woS/hvYNc3W/JvZE3207
	i5PI6QcJCfXS8o1dDA7Ht7xeXUDqLJw2CXGJs1sfGGsqw32MbDxNHVrVR/gXmQKVzCw3pN6ghvo
	1VpIz6NMkx+hwVYwHD2exxJht0vNMxOYbd4V+oZY4AyvTF5ZajfYMbArAvlR2PxXVrw2iklZPNY
	ADiMAqHkmHkPvXhrMKU44zzxUCeuyOuvLgY
X-Google-Smtp-Source: AGHT+IFSWGaG+YAxuC5QAHmmbcboQlauIZZLZgo0OwDLSkIV0ywA07Ks+Bfh+bGhzN53ifgDGqSDL8YW+yRt/PdEog4=
X-Received: by 2002:a05:6512:1329:b0:553:2480:2309 with SMTP id
 2adb3069b0e04-55cd7581e05mr1175047e87.3.1755008183964; Tue, 12 Aug 2025
 07:16:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:16:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:16:23 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
References: <cover.1754996033.git.christophe.leroy@csgroup.eu> <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Aug 2025 10:16:23 -0400
X-Gm-Features: Ac12FXwr1ZykknKcViL5DSBC6TTWTpzY9rOvoc9OKAJoev5KLP9n85B_Vyoqws8
Message-ID: <CAMRc=Mc_MMwsiGybyMdY0T+QiRuZWFGEifxV4Kz7oqZaY_-kzg@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: fsl: qe: Change GPIO driver to a proper platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_071626_270678_58180EE1 
X-CRM114-Status: GOOD (  10.63  )
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

On Tue, 12 Aug 2025 13:02:52 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> In order to be able to add interrupts to the GPIOs, first change the
> QE GPIO driver to the proper platform driver in order to allow
> initialisation to be done in the right order, otherwise the GPIOs
> get added before the interrupts are registered.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

