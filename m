Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B02C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=; b=DdElwmx6oKorv4V2iNt0GDiuuF
	bp4fUZ0ttkqbo6BEvX8XNU8s+ATE76i5zBhnebun6N4X4UU11eKb2fInLGgqUla1BYT1Y4WNDOVbH
	E3OxOkRcfO7xHwdTvAQfZN/WEbHEXEcOx/2JT3oO9dYGFJXqdtClTNortbiK8TLoc6VxDTyDZr35+
	0ppSy+l6VhJJg7S1Mczq2O1+OOsOHC72MPIKMwZXp4XFy+JLbeHq/xSvX4rRslFeRoslezmpx3LP+
	kDHHtcx/rBtMUw97RMnLmkCEtUJKr9skalpJZArHgbUgjKSIZykqS2FSEjVOvKUuod5xcvvufoedH
	/jNEcLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mMy-00000009Yy4-1nPR;
	Thu, 10 Apr 2025 07:30:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lcu-00000009POi-2xlD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:43:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2859015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267383; x=1744872183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
        b=OJeRk7H1GSBT2XmgneTTCZtsAR7U1Y1X6KeNWCzE2vVqdsSx9YpKTZKkaktN631CAV
         0u9q8hExW/wFUEB+NBdg0b07QQo9dl6Q8ZLWZcPovOOeW6+iSo12aWTn0ZEODERMxufN
         gyoD7fUA+pQdhCcPErpWWbA8QPFTJULNKSCxU0T11LDMRzDsTNU15788A/fo/Q6PxSLf
         Oyl3dhFvYTCyMt7DsdoGGcSe8BmPN+GT1hQCVxLlBdqayPemJKcSW1a0bubtMNiSBrEe
         MZM3LQ/pp2AskURnYGh+mAXslupfWLHgU0gSmANe8UNHrJk+wcCjvRqG7N26tq3mHkuz
         AQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267383; x=1744872183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTO6UhYzw0IJ0LAt7kC1M5FyfmyVXCWONfGYVQ5KXmY=;
        b=deDDpPpjjmmJTJlxrynwiQKA5xt2sw2HASRZ4mqRCKC8AOiHwu5yNWB4ScP30JNbuj
         E09IHYHaFrCiF7VPLvRAZnQzr9jjuZ8BetsiM/eg9lvOXYOhCfbG0dFgc2FHo17hvxD+
         sj+yZII2f2hUXfJdTLv9T1CJu/qv8k21QF9tmPsOqj/RCU7YJjfNwitKSxuMxDQEN0sZ
         1smyUGtpeyvpKNPJiNtaqONx5ky6Z9h0IDC9WuDzLySmMXCpT7PI1GqkfX5KIXHyUjdC
         0RhdxXLnuNTmeW5ZwE42rBoOd/GIcvgiqI58XV41Hy4N6UGRIQE9XCiirSQgSiatqCAo
         3umw==
X-Forwarded-Encrypted: i=1; AJvYcCX7p6BsrpbsdnvJ9OlZiOd/YpqHvmfct6p/agtD2U8P4DyqLQzSXne0qm++I9lsei8Zhvdn1aFH7TDjG9BKqwFW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlc6e+BInWYwX8I9zTCB6TE9Y9CYp2xhDqFL4GEDm3sAP+oMpG
	QT4bFD8IEOaxNZDSd4ndmlDunpnr6/r2twmcsvSstGF2mhvyIfHvmSYckQ==
X-Gm-Gg: ASbGnct+7r3mqefcLPxyXSjQzTxkrYYK45mPFThj9Uw9bd/k3VDGI3+zfln5QpKHuQQ
	vXIcnLW71sYEC6Lm5Gi9EPkIZAQYWvjJaVT3c4xIb3Lv33YpL9gYsX/Y87e5Tki8vYD98Kii+EJ
	n+4ja07CDMLjZ9Udw6b5bSd4VW9zDyOBonGwsZfM0uGC+Tn6rr62Hqz1voEMUS0H8IzB58VLBu1
	IGZMQQENHZFgkcOtBQukfb6oAeb/76kuXV4l2/08tiPhDseekdiL9yX+v3D4Oxdk9UstR0PSHok
	8mmCUxt9itaXB9XSOgX6nBeguyqFZTmCm/8yFGvjHmV5V7zKULEdIz3BUIuuadG1Ml9Q3u9m5xf
	BHTYsSpM5bDFWJOMK
X-Google-Smtp-Source: AGHT+IGD3pEoyOISIn1Zfw6v9W1npm1S6qIsP7cYoTCH8BploIFWDI5dRtvNA2LJBx5ej5GOm8Sf4A==
X-Received: by 2002:a05:600c:1e1e:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-43f2d9a3c76mr13488945e9.32.1744267382701;
        Wed, 09 Apr 2025 23:43:02 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm43670385e9.35.2025.04.09.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:43:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: allwinner: Use preferred node names for cooling
 maps
Date: Thu, 10 Apr 2025 08:43:00 +0200
Message-ID: <5874556.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250409203613.1506047-1-robh@kernel.org>
References: <20250409203613.1506047-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234304_741891_CFAF735C 
X-CRM114-Status: UNSURE (   6.95  )
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

Dne sreda, 9. april 2025 ob 22:36:12 Srednjeevropski poletni =C4=8Das je Ro=
b Herring (Arm) napisal(a):
> The preferred node name for cooling map nodes is a 'map' prefix. Use
> 'map0' like most other platforms.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



