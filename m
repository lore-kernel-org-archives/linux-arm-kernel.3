Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B920EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 02:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wd4rh3c+/URJQakUKeuqVgMvcwLsodqXqcB6M6kTlbQ=; b=n17Y22wtbzxBJuegfWkjyC85E9
	EVqxONQtJSHnYi/b5I1DuUSSeakSuzJFlWyoa1hYMH2MiPJ+qWX/cZxbTxdnsw6SFdu3IXAQVzuiA
	b0rxLQI/a27Oy+eZtz2jpJ1FKdM5rVgjke4g2K1iiYL2cP1qtSrZwEC5QpXlbLTKmlOxTYnkMhIvg
	MxEuk8vNSZcSEe7MyjvWDxy8XhbHhajmG1H3sDGdls+N3E4p0sZJjyCP87/SqtLY2E7CCnHzb5Gdi
	GefzO4lZky68d9fhWRjiyqfxSLeZV8zRW3PKfb+VurP3dvKdLBUbXD3i2dF2S1msOT7QVEauIogYr
	JnznpXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN3-00000005bOJ-3Cr4;
	Wed, 31 Dec 2025 02:55:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vamN1-00000005bNf-1qxE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 02:55:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0bae9aca3so151570365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 18:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767149730; x=1767754530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wd4rh3c+/URJQakUKeuqVgMvcwLsodqXqcB6M6kTlbQ=;
        b=BGu+lWbjIvhUI3rZbZq1Zf9ewHHK9/JrUUkK6tLUeL47JNqBBtHofcOsc4hSvOcJrC
         Z/2KY6bBPux1vjXLK/xKgxT5YTz0jNdK/ZoJ3r2aO8iEsTbAj7ed0S/NeiFzux+voGIk
         /g4jIO4qkbyg7UQ2Q30F2dfyqU/pkg33jZyOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767149730; x=1767754530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd4rh3c+/URJQakUKeuqVgMvcwLsodqXqcB6M6kTlbQ=;
        b=umoIKvNcIZeGmgoT9PgOwkKzQwRwDIqBuqsuRQTOh0ubBjg4ay45b0fMz2YQTFLX34
         7ofiNtngIdYAORtJoKaxoOQIRXQnihvXKtOONAETVVP2fmnZUeYSLLWbs/5yOxkl+Cui
         WY/21zDI9KhWTcTmSX6VmHEaRPsCyt3BIKLv9XZYOBsBNhnH/EKlhkq9GAESj7kfs0kw
         P2ZqWPGyO6ZYUHwJ27XHVU73eER9kjF2bktyKxxMVQuQ1vjSkB3aeFIQlln/zaTS9TCN
         PS5LRnAavWAs04LZIazETfaJrsSEjXr+I3Pyg3ql0kKBgFs8eWf+mqP1Gl70aoPsfXOg
         lchA==
X-Forwarded-Encrypted: i=1; AJvYcCVj5BGnKbcIMU7boMmJE20O1aXZVrAaoGBRNRGSjcYdChp5W7yYHXrS5ZeQHZfe6TmgrZztf7MXBayEc7OAqxV8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywiye1AjTtt9JfrRt6Ef4LQP5T6O7Fy2QVZ6KiNdMlEeZ5CCuP0
	f5n5DOzz+DKwwIUv9+bhm7Y6W5zVK+V+PcrJVvP3s78ZZQSxZfNhdoG/SsPu7my9U2dahvGor92
	Y48zo
X-Gm-Gg: AY/fxX7b4u0kp1GruN8LWmycRo3+XmoCqThDMEzUZt9VMZgwnZXGyZsHsE+ijjzBo5/
	zM8Pr6W54uBO1Z0k7sAaQZCkNa/cbllJfc4eRehiR+/Mg00/x8BpPGzMXVjAhLazSBV7M93/InI
	BT5wHPlj6bePbP5P+nNFZxkpo3pb3RFs3AWYOW3X55xf3ZBaSA7LRDDTjFJ28Sp/m2VHHzCF7fe
	pIp8j+qiWH4VcO4Hd0BSOnbL5XJ+rKa5Gh0GI1Ss4KwjjmEFxKG6f61CINTNcGnlvrvl6vhh8LE
	wKyhx+qDfZ0efwdlA5W79r+9FRHXIzXlljitVTen+/QA14WMcc8crro3xarMuYmOxwqqzo6VWVZ
	yghHwpgWOzuFraoQBUxTLpGERzXNn2kNlhE187QBq13+BOzjM1CO9SlbtLKtnAUf/+zxJNJPM2H
	ZySUi8BEx6YhGHB1kkVwWs0BOmIaT8gclEMjLmTNHRGyz5fYJtSHxs5HPI1G7Ykyo=
X-Google-Smtp-Source: AGHT+IGv6dzbSVpNHqBw+G423BACmAS7OeW8PWWQo4nElFcppe2PVKR/NkxEPPlKfSyiFgkONrjplQ==
X-Received: by 2002:a17:902:e809:b0:297:cf96:45bd with SMTP id d9443c01a7336-2a2f2231b01mr352340145ad.19.1767149729925;
        Tue, 30 Dec 2025 18:55:29 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3e1sm307762945ad.76.2025.12.30.18.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:55:29 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/5] Sigmastar DT warnings fixing part 1.
Date: Wed, 31 Dec 2025 11:54:57 +0900
Message-ID: <20251231025502.1139168-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_185531_710955_467A4D27 
X-CRM114-Status: GOOD (  12.46  )
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

I saw a slide at LPC that had sigmastar in the "hall of shame"
for DT warnings. I finally got some time to look at this so
I have fixed the ones that are obvious and quick to fix.

I'll fix the rest but they might take a bit longer i.e. one
of them is about the register shift for the UART registers,
that'll need the binding to be updated I think?

FWIW this platform isn't dead and I have been rebasing all
of the out of tree stuff that make it useful (Audio support,
display, hardware video decoding etc) but its basically stuck
on rewriting the clock driver so that it is mainline-able.

Some other people have taken the limited support in mainline
and my out of tree stuff and made it run on old MStar MIPS
machines too..

Daniel Palmer (5):
  arm: dts: mstar: breadbee: Correct regulator names
  arm: dts: mstar: breadbee: Correct LED names
  arm: dts: mstar: infinity: Correct opp table name
  arm: dts: mstar: v7: Move the reboot node
  arm: dts: mstar: v7: Add sizes and ranges to sram

 .../mstar-infinity-breadbee-common.dtsi         | 10 +++++-----
 arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi |  2 +-
 arch/arm/boot/dts/sigmastar/mstar-v7.dtsi       | 17 ++++++++++-------
 3 files changed, 16 insertions(+), 13 deletions(-)

-- 
2.51.0


