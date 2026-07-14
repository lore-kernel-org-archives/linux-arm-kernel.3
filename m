Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9710CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=; b=4PwbZ3veFRD2Aej0dmESfVMGJm
	P+WiiSXBZPwKuL75vE3zc+QugzBjNQ0QwEzhNAgjo8qS1pb+tXum3G6DoERzReO2pjvusU29nhJDy
	lEBPPDhMxjvEJN40KUYsNk+y2hp0tR5oAXRX763Xfo34+tHNpp6h8Z1hPWvhJJqYZjsf8DVsiAfeh
	pMes0KGjH7TrvkZZVvXlmGEisbqcLaDAqKX+EdaupW5/fbTUQ7jxCTV4/r+VPn9yqWfG8dJS6PvWM
	D3bSFYNQKbCwoto8ogmVza6hpgeEKV+voFEn0m7vUYhYoN5H5x6anpnGm6RUAgBU8G8749PhibHT4
	rylQN3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfgu-0000000CdDA-3Ph1;
	Tue, 14 Jul 2026 16:09:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfgr-0000000CdBw-3qTz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:09:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so38141255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 09:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784045339; x=1784650139; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
        b=TfKhHR0L4NOJDFzh+M54Ggug3sUaLF9u9Io1sNTkgre4z6NDCPiZkvb6hw7CLFDY6O
         yo733jXhgk2pX72lYYZk01k0v4y1lZt/R8yCoWg3/nkXU1nCktzXR+rDZImz0rRJz79u
         EyLE618fVHU18okpq/DvbLRFvVXjZOKo/nyvKyyog921+XUqd+pS+cKTtupJZ3nOO5fa
         HxMhOeNMUS2PMdJ+2uJ7ynze9/vePKY6pdihlnOga3rHDXvEf7n57T3+0HXnM+X84OHS
         wQ//7FMQcXrk3m4P6ssVM4QxhacUf2UKHpdyhpWjDM1pHmwm+38wW/6JOFEV0yjS+Cx7
         Sayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784045339; x=1784650139;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WChOIXCXpcq0quURVEjiQP6ReSE7dcYzMBe/VviNclk=;
        b=g6LyskfutPpWAragiUxLUp3MMY82/W0+PC5sEqnM9Jk4IdYfJKYK9C50AqcQCjxLBy
         IcFWNd01Rgq2VLrVstORmXb8Cx1P9nAM0ycNADtSNVc5hjfcWMvy5RHQCvQN/ogO6XGm
         SF40NVqyrrDQB0QHAg1p0q6ZfpaLxrJWZvJ9T6yKPbV/U4KFR9W35wfEb0T/Ist7xD1Y
         j+/nRO84vTIJZ361ZMnTWPj8nvKhWuzVQS51r7HL561if+AkNkYz9R1b8uMTQG/nQ7Ci
         i3ICrHh74dLzgmGQBSZiWtyyu9lxjy3jWkXEBWHhA4bJTg54vtahDGoII93uwF0sjBRH
         +P3w==
X-Forwarded-Encrypted: i=1; AHgh+RrDWRQazZRkfc+ooWETqRkYv66t6ueBCiSxgRh9BUaIKg0gTZMsxS7vHicnoOBas+mhoJNYaJkrJJCxPj3N3/a4@lists.infradead.org
X-Gm-Message-State: AOJu0YyCvAqjqHKaGPDEoT5iPQANKyoLkAwW/8hny89fAf/mmBjAGcqE
	RdkAqo3zDrSf+TwMO9mfGNcN+6I3Whscyj933+gelG1CQUbUbdbIFL2N
X-Gm-Gg: AfdE7cmOkHL+0Ixn6XA/vA1CpPO9SdyCsv7P/lK1DpiY0Zu9yTuRkHEVSvTBe0xG03Y
	Zbi+5JOLnMqWPNyUti2r3X7cP0fTIsGisdfw5fX+57U7Gsx9aB2kw8dw1dt2QR043SICoN1ZLsT
	1wyo+yzzXL3rxMNcYBVFEy+TCwMZW8jvjPWnHFJ1pZGI5DDC+v4ZCsjkcKhg4JQ3i2TtmcvjI6+
	rBZvsl54cEoC5Q3OhSIN5rcu/SFgT4PLxqgMt1IOQHVfJUL5vGLQfZ6mI5xzl+my6ptluJW6xVi
	cYNYHIW7DV9rcUDzs0FsoO6TKI9DUh9LyQfpn4HYrypO55oiIDua67dn6clzZfeFNcKGLfShBJ3
	MgVaFKUI4DEnbHsAYwOYNzalJKn2ZsyePFw0C+Tn9cnQVRf+tD0wGagc72Fsb/IbLBBoyp0QhhI
	kx5tGt1doheoTmmBisIk1zGg9k2gJGJR4rKtXAGD9BGPVc8ppY7v/AOaju4h2r0qH9WCB83Sxh1
	W4qsgH9HMU8kVaL4ngg7fosKTh5kibJ8t2827QKF0zSCtpLM5xGXcQOmFzU16LDhbcFSuz4NlEU
	41g9fjqjNE248mfAQT61GNWxOSY19QXVFDNBtvrr1Xw65cnDKz3M4xd9FTfWlke3Y+Ul4dLHUj3
	gl/yg3xo9poOsu9oOHPOQQCT2icDXsou1Pnrjvw9vfCw=
X-Received: by 2002:a05:600c:6303:b0:493:e4ce:acd0 with SMTP id 5b1f17b1804b1-49538992918mr33564445e9.1.1784045339225;
        Tue, 14 Jul 2026 09:08:59 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-4-244.dynamic.telemach.net. [213.161.4.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f9402sm88923595e9.13.2026.07.14.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:08:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
Date: Tue, 14 Jul 2026 18:08:57 +0200
Message-ID: <rIZ28csxRO67EN6Ja__8tQ@gmail.com>
In-Reply-To: <20260714113304.270224-1-wens@kernel.org>
References: <20260714113304.270224-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_090901_967849_64CCF125 
X-CRM114-Status: UNSURE (   9.92  )
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

Dne torek, 14. julij 2026 ob 13:33:03 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> The H616 codec does not have capture capabilities. Set the
> .playback_only quirks flag to denote this.
>=20
> This was somehow missing from the original driver patch, even though
> the patch prior to it in the series added this quirk.
>=20
> Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



