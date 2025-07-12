Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ABBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qfLL9MbScUSlOSjyWm24E58Y3rU7LU4fcYrGg0K5EsA=; b=UnhcfkBwI/G105Dhdx6a8wMfwQ
	osVhv7/+G0+0Xk/LeoEVT3+sWxWZR8eYTaEEQn+5GaavuI3BOnt0u2QulDpg4X5uSxskYcWMIUl/d
	rfAo4/i3rTm/XASdAcr93rGgNN1Iayx/8YtGgFxCWzO4iCBFixTi2RYlwdOiks/ej8KxFDUd5Lp8U
	kB8AOYxex+6EXWe5SO1gBdy9g6IIygJCsPqirF/6kazJ+acJQ6m3T60+w6z5IzXfZ5EF6XSvIZkv/
	XW4OMqScX4DwKmPkiKYht3ClgKlGsn9UAy29y/9ncuYxBTtUyezH/bs62ZWMVKbnr5miOOrtDUNDu
	6pz/i24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahRK-0000000H1d8-2bnT;
	Sat, 12 Jul 2025 21:07:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahOt-0000000H1C5-21zE;
	Sat, 12 Jul 2025 21:04:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2613716b3a.0;
        Sat, 12 Jul 2025 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354290; x=1752959090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfLL9MbScUSlOSjyWm24E58Y3rU7LU4fcYrGg0K5EsA=;
        b=HeGTrSwISw2DvqsESIA2gJA4A+4yxuCfpqsNacmZylKTjZ1/DJr2gFUvZ4iajO4zaF
         +tnFJKvHGLn5Knm+AQFIv60V9HvDLTlCQ7OtXyLRmMs6gbmnwwQWlpYYBtlMOZ3t7WDd
         6Zz1+3bNICfHLIFHJt1P2vHdNb2iFXbiO0XF3yNZ5gv7/6Sp0M48dMv9KjHbrtuD60er
         rIAV+7qR5QYuoE7egfGc0dG3e2f1riRLbU9p8M+SwplT0zSMOxZR7VpU0dDKtJ/zvK3u
         2ywoovd4o8T/hDIu0qm9DwI+d+Nh+aYz6qwWLtLttXNt/2Th5iP4FJ3DEGqqxVXL2fI0
         8b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354290; x=1752959090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfLL9MbScUSlOSjyWm24E58Y3rU7LU4fcYrGg0K5EsA=;
        b=ni9JrX1toLmZzcFX6nfsD4qbXoqeeUm+9P0PXtDwzzJcrsLmqJfd5qAQHRxIPzJzFj
         KUAM3xr/EgGShHsfQt0T1B5VFESjpA1wbRalAVX9o/zCMeGpcHmwL+FGjA+xOBZcnjoy
         fGpgvilIFUn2L+hvKW6AgOjiw1LcQhpjLu2bG0HMJIMoAtSXix1ioV1BVX2NJKV9mYdl
         97LJJLQJS9Rl5IuVKjI3scPF6XceSL++jY0G12qfeGsPiI3sikT9vzf+LgWmxo75PM0y
         RhKNwcegLN+jGKaag4gIBUEtJ2noG//eszVbeQpRS7tyr1YO17ZPukQxyfS4sx3zLdqm
         Dong==
X-Forwarded-Encrypted: i=1; AJvYcCUm26wD6e+g6TnY2ktnNu2o5aljHPK/kZcWwWuEKOXlG0SXmmFuCGGUkno4Fd7v43Efhzgji5ga45goNtosjR4=@lists.infradead.org, AJvYcCVFomaQGP8DbbFIzQNHgpzwdYjs0/+1heVnYWCrZ/2LWjrydoSkhpl2MAVYm/oNyPar6X08x9xsivsH849C7ezt@lists.infradead.org
X-Gm-Message-State: AOJu0YxsvVS7/4lXxlWy8YHrlMA4PfsmRkwb3rvF1iTyYDQktz2BULM/
	NWds4V1ETyhtBhr8/NMp6RnS98w2mRrkAmhlTVsIX/jprwlpwSxO1tIw
X-Gm-Gg: ASbGnctGxtoO5+3/DNDdMCMCPHGSE/kCFsEHhazaEs+tYZt4oPenCJVKMM6XenVFoNZ
	G6RupnliTSK91C4GxEZqSyVC2fGMNSwCViKg1zIGLk/vmG6YOGDZ+KbLfesME+B083lLtxH/Exy
	SbsyNlHGHBd1+NjN5N75AhsWQID7zhRzifZ+ZoJEfO1w0trbsxyDRQVfRbokiNB9Z5KVD7Qan3C
	VI+X8+RQ3gey+b0zp4AR3hE3VN6O0g1aiczI8he6f+56EBBbGkf+PRio+ZeXSNCKS9vBFS07BNK
	MgG86kgER7IDA/NbxykU+k6esy78rf55TZb87UVzaTEQLCyZSvLEb+xdSrJj/PJfk+pw+xOdL3t
	X1K8=
X-Google-Smtp-Source: AGHT+IEmaDL+eIW50uO1oQuIKN5GC4YkbvTHfY3hEE3Iole2C/tppuO6g6t8PhNj8q6jTNSWze+VEw==
X-Received: by 2002:a05:6a21:9004:b0:220:2da8:325c with SMTP id adf61e73a8af0-23131b04c94mr15471348637.0.1752354290253;
        Sat, 12 Jul 2025 14:04:50 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm7988645b3a.5.2025.07.12.14.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:04:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv4 wireless-next 0/7] wifi: rt2x00: add OF bindings + cleanup
Date: Sat, 12 Jul 2025 14:04:41 -0700
Message-ID: <20250712210448.429318-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140451_514365_A2852F21 
X-CRM114-Status: UNSURE (   8.98  )
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

It doesn't even compile. Added OF bindings, documentation, and other
stuff to hopefully this doesn't happen again.

v2: move all of 2x00soc to 2800soc. I didn't realize only two functions
remained for no good reason.
Fixed typos.
Slightly changed probe for clarity.

v3: fix wrong compatible in Documentation.

v4: renamed documentation file as there's only a single compatible.

Rosen Penev (7):
  wifi: rt2x00: add COMPILE_TEST
  wifi: rt2x00: remove mod_name from platform_driver
  wifi: rt2800soc: allow loading from OF
  wifi: rt2800: move 2x00soc to 2800soc
  wifi: rt2x00: soc: modernize probe
  MIPS: dts: ralink: mt7620a: add wifi
  dt-bindings: net: wireless: rt2800: add

 .../bindings/net/wireless/ralink,rt2800.yaml  |  47 ++++++
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 ++
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   7 +-
 drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 102 +++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
 7 files changed, 156 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

-- 
2.50.0


