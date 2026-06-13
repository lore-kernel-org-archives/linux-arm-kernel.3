Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=; b=BGoLCIdIlGuoAZEgZ5Sz0/xJWE
	EF/ig323/KB8Hzy/xq/1WsJXqa8eoCfEBCOKMWsTfERCfflbmaxcHGXmWtx0x2mHOY+GVvLaaJEHc
	mVmQCmFqmEz/DjmmNpfCWG1hBQYkACycgEqYTJW/D5xOZTQqtuF9egnE8J7L56XcoubdZch8ucaIw
	9z39Hpdocbz9AplrXPq2hF5C/gVHmzad774GHDV1K2cP22B8UFuHkoiFUx4MSqALCa4SOAdyff7Dt
	PY6Iv9L4lvkCw75O/JGZ0dSQygMUtOMarDF5lTVbOYnGyDiQMvxLG6qIIWPL34Wpv0WmmaqBzB+ka
	uNsAkqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJUC-0000000C4oM-3SDA;
	Sat, 13 Jun 2026 08:13:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJUA-0000000C4ny-1zGS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 08:12:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490ac357c55so15564595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 01:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338376; x=1781943176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
        b=Ges29eJbMlPW7O+2Fn9Ey3D8u7pReanbzG0r8ahIHF+m7Wo4FfPx2qNoauOrmuHmFL
         SCyhTKzLsBPX+juPl7w3qstBuUIrpGMwEjMeZtgy7AQnc5VXO4DNdQwYSNYhRWaiYNWX
         pv7Ovz/2SKOzKpMMV9KoRVrS7WTJIAYYELAvVCihuIqH0CNRaF8pjGS0QITNXwlsXvmY
         apCnC9CgNAVs9OyHox3/7PtEWdyCq937czQW+bJx9cJ8LcUFk55nhuq3lg+txdE4b8xn
         yv4la564hGeAOmhUzjlUkmM0wl2E0YsHfowAQEpBuhwPUj1aB3eWIwgVow/s0TG6oCGQ
         nYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338376; x=1781943176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+DHXyBduh8nW5mH/RwXPnUoFvsJilmF8kF51mFs5s0=;
        b=VKr4Y/tVzboT55nVzK5jUtKFlsAmG/2YNZKg6W5oPV9L0NBUsB1737FcjWz81uT1K+
         l/07bDmkG9JbP9BRhgZ1WFeyOKPAe40k7swQL3v31175jBoQ/B4edlfRnx9r6WqL4ze/
         pit+/11qwwv5DGiF+hNG1qMpZ+u731Z6iAy4zmcFNiJ4pTc1KRUFMON0WAN6sSEAqWVi
         c7u5Gt0MMdaN8YrHhBUn6A2kxYqq2uh58oH2lFTSP/2fcAiyYjICTo62A6OXIjqTB4no
         5kSyurMtJmAtTIeBGPsvEZK4MVfxdANdQ9FOJ/BmpUZvuWuZXXdHWvc0On61zJkex/zV
         eM9A==
X-Gm-Message-State: AOJu0YxZ0J24AsT5+lnpCGQfpC5/Yi89KBI+GoO/9d557gXfJaRpHE1x
	RRY2jN/8Z2HLvufNeTOZMpVFMka1FpUIiYjJzlWc6Msi4vchliwu2cBkLe4TgtyY
X-Gm-Gg: Acq92OHl5Q5WqfmXbXuWxCoYXAlgmCEh7F6ht4CGAzowEYvhhAaa7xpfcepMi4kQ4+y
	8Q4PwzEfftUfkCBoOib9qeLHDq80yJYx4hv2kAhDMjs61CP7fsp310Ba/Lg/ZukkTRmY+hF0L+t
	TgG0SECA0FtD4v2doFIl74G2fV5tI/BKildeESVEvH+YxAbqnZk/WfWolgtmzCr7hSnYa6UMNEK
	s17X4AAQ5pZ1sDsH3eyilgDUpRoFfTgqUhzUPq7S+tVpDr6Xa2m1CjLJlDaHMhTt4hTDqplnxvw
	qXg5Yjpn2QOlj6ptWoPBi/Ioy0s2oWlpI3A5hEPlaltN0e7Lty+WRcqsLxNeZgjpSobft00o/I2
	GgbriFjbeYLngCLdWQ1QCNupw15hYeEDC8ZanDb0vkB63+Gid0pTJOkX2wkF9GgacyCiqlehW/y
	9ZUDErXw5ijrXQXRCKUBgrWyURjHMzpI+ENMAmf1PQRQDj
X-Received: by 2002:a05:600c:8b31:b0:490:e5c1:b8c6 with SMTP id 5b1f17b1804b1-490ec4b58ffmr75929755e9.8.1781338376446;
        Sat, 13 Jun 2026 01:12:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b39e9sm88333215e9.0.2026.06.13.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:12:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/7] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Sat, 13 Jun 2026 10:12:54 +0200
Message-ID: <sIT7xrHETBux3nDrv9ggVw@gmail.com>
In-Reply-To: <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_011258_517629_BF3E343B 
X-CRM114-Status: UNSURE (   7.14  )
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

Dne petek, 5. junij 2026 ob 09:09:15 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Enable Allwinner LRADC input driver as module to support buttons on Baijie
> HelperBoard A133.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej Skrabec



