Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD10DD41C1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=quTAJEdlmLiz3O8wMhr6p5bbf6+58IEExsR/WOQUwf0=; b=r7yj5OrzUQAzpGW80bs43zklMq
	74JfpVzD7L8FCoxsKUGXndthZFZtoR9xkTGY55H3NboATTYO5jx4WOgi4NjPI6ZVVBTR6DQZn0gFw
	VAbgPtJAJyUc8nb6zUL1wbFeP4KMEBoB2FiS9bsWQRt3xx+W1BpEzqzgaZdy7aVAjj4elDM40qm+p
	bJSSVxxTuq3BzUhN593E11HWD5jacnaAZ2jKX2i9qCc3O3xECd9rXmgL8M1x0BUy5R4yEBg/AYBoC
	si+1wphl46ggQr4K5ZxZwTTUWKNT9hNeBlCcUbkv/rvSHifP8Q3BeXvBhpEVuB/hziPr2t+gdF5/C
	d+DNJffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9VS-00000006DY5-1Uxa;
	Wed, 13 Nov 2024 09:17:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Td-00000006DGJ-2Jax
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 09:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731489352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=quTAJEdlmLiz3O8wMhr6p5bbf6+58IEExsR/WOQUwf0=;
	b=LZFSvwpO07ggnjydWC7U91iVQTdEpCBSkDPiYWCzZIYwrxevA6QW9e1P5VLXfJdRtNs5pD
	MUzzLJT31ShX1dA6f8UH4b3hlyB98jCAcVc87riMFoSF+2ZBzSc9uNzVAtoSNROw3ILZei
	xccdq9KeWSVYUT02UoRwXY2IyeQXx4w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-tjPnW_sIPema0LVokrZ5ag-1; Wed, 13 Nov 2024 04:15:51 -0500
X-MC-Unique: tjPnW_sIPema0LVokrZ5ag-1
X-Mimecast-MFC-AGG-ID: tjPnW_sIPema0LVokrZ5ag
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe6e6bcf2so4155006d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 01:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731489351; x=1732094151;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quTAJEdlmLiz3O8wMhr6p5bbf6+58IEExsR/WOQUwf0=;
        b=oHa8nWseHkEeU1sd0CO5pk28GyPGJ24swQ50fLBSbznCH43YfKqgwwBp7YgAGIVRnM
         /xukSboNCa3BYizKB1Pj3P3fogQxu4DnDniY/W3jDqMwKyEfLmQRSjrS49qCYMz8djYS
         kag4VCprsmM8uG6lgg4ySWoL+g2ZDihsUn78mlTTYee/8kyMaqpOflj0g+RTUucMbGrm
         HDcpAOXiMaqyxKvwbs5RcB0S508aZ/3rZr/baDqFt8rpWiEUg7C4MrH/PhMyLsTFy9UQ
         Jkw0KhUtAsxttBJmiTHoSa6UIOYicXiDKhgRfjKTrVC7x81le3G+QXISEAk+QcGsDSv9
         3xYw==
X-Gm-Message-State: AOJu0Yx84xdNpgC/ilSV+KPKB1T0LdMDYcRPT/4y8OmSP1R3S1ZLoTiw
	GQN8LpSh8n5x6WCMZjj74YdWCr1FF3C6h7me6YfN6nQJnu5lJ/Qo7nrTcP3QIPYDF2m8uMND439
	t8QwNxZVVFfRH11H4llI0OMgucOgEG3SZGco8N4OOReurbPo+hCCy0UpYR4b2xvvA6LVcrn8P
X-Received: by 2002:a05:6214:5081:b0:6cb:1fad:82b2 with SMTP id 6a1803df08f44-6d39e1125bdmr116776296d6.3.1731489350611;
        Wed, 13 Nov 2024 01:15:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDwDRfyzmSF24P4AFU+yndsPh2v9vVvenuKF0R+CHcbHTyMz4BPrKKIgvxXN3lhC47OZ8I4A==
X-Received: by 2002:a05:6214:5081:b0:6cb:1fad:82b2 with SMTP id 6a1803df08f44-6d39e1125bdmr116776076d6.3.1731489350269;
        Wed, 13 Nov 2024 01:15:50 -0800 (PST)
Received: from [192.168.1.51] (207.red-83-46-1.dynamicip.rima-tde.net. [83.46.1.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396630ec5sm81599036d6.101.2024.11.13.01.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 01:15:50 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Subject: [PATCH v4 0/2] arm64: dts: ti: k3-j784s4: Mark tps659413
Date: Wed, 13 Nov 2024 10:15:15 +0100
Message-Id: <20241113-b4-j784s4-tps6594-bootph-v4-0-102ddaa1bdc6@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACNuNGcC/x3MMQ6DMAxA0asgz1gi4NKEq1QdEjDFHUgUR1Ulx
 N2JGN/w/wHKWVhhag7I/BOVuFdQ28C8+f3DKEs19F1PxpgBA+H3aUkJS9Lx4QhDjCVtOJDl1dn
 Ojt5BzVPmVf73+vU+zwvgTedNagAAAA==
X-Change-ID: 20241113-b4-j784s4-tps6594-bootph-348ef98086a9
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andrew Halaney <ajhalaney@gmail.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Enric Balletbo i Serra <eballetb@redhat.com>, Udit Kumar <u-kumar1@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731489348; l=2452;
 i=eballetb@redhat.com; s=20241113; h=from:subject:message-id;
 bh=SB7Bfgqn58f7pGUarYoQdJJz2+RISn4Ut5lwKQbEXC8=;
 b=HIPKdQzzrXuLuysgHfF7ppw9TUp59s2Aq+m8hqdoYVFBygJxdrz0L3t+09pfJVK5VzLhnkrxS
 O0rrpwWx/6qDpMWqjAaulpOfII1MTHgoVLOOBPrIk7aXUlZAlB80Xev
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=xAM6APjLnjm98JkE7JdP1GytrxFUrcDLr+fvzW1Dlyw=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CF_5uyhEtPGEXR3OoRo601UkmS5Q2J4IrV9Ye_QrajY_1731489351
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011553_705930_409D7D9C 
X-CRM114-Status: GOOD (  13.15  )
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

This series marks tps659413's regulators as bootph-all in order for
the nodes (and parent nodes) to be accessible during MCU's u-boot SPL.

This in turn is desired since the tps659413 needs its MCU ESM
state machine setup in order for the watchdog to reset the board.

This took me a little while to track down, as enabling the ESM, TPS6594,
etc in u-boot would result in the below boot failure:

    U-Boot SPL 2024.10-rc4-00007-g44b12cbcd1b3-dirty (Sep 06 2024 - 14:25:52 -0500)
    SYSFW ABI: 3.1 (firmware rev 0x0009 '9.2.4--v09.02.04 (Kool Koala)')
    Initialized 4 DRAM controllers
    SPL initial stack usage: 13408 bytes
    ### ERROR ### Please RESET the board ###

Which turns out to actually have failed far earlier in spl_early_init(),
due to these nodes not being accessible in u-boot. That's hard to tell
though since console isn't setup until later (and for that reason I
think spl_early_init()'s return value in j784s4_init.c isn't
evaluated since a panic() at that point would leave a user with *no*
information at all).

I've tested this in conjunction with a u-boot series which I'll link in
a follow-up response on the k3-j784s4-evm. I'd appreciate someone testing
on the k3-am69-sk at a minimum, as it should suffer the same fate if things
aren't setup appropriately.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
Changes in v4:
- Rebased on top of ti-k3-dts-next branch

Changes in v3:
- Added Udit's Tested-by tags
- Reordered bootph-all to align with dts-coding-style (Beleswar)
- Link to v2: https://lore.kernel.org/r/20240911-j784s4-tps6594-bootph-v2-0-a83526264ab1@redhat.com

Changes in v2:
- Only mark the regulator nodes as bootph-all since parents are implied
- Link to v1: https://lore.kernel.org/r/20240906-j784s4-tps6594-bootph-v1-0-c5b58d43bf04@redhat.com

---
Andrew Halaney (2):
      arm64: dts: ti: k3-j784s4-evm: Mark tps659413 regulators as bootph-all
      arm64: dts: ti: k3-am69-sk: Mark tps659413 regulators as bootph-all

 arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 767b6a0d0900c951e8b42306bd636268481a97ae
change-id: 20241113-b4-j784s4-tps6594-bootph-348ef98086a9

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


