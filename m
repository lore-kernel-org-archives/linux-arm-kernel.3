Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879CEC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 11:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=; b=odT+zImxuGAeP3
	ccO7AXd+rYRhplZ6UFsVFBPbwZinLCUB5oHWzgzTOvKGPSkh9LdN0IVLYMm4SDAsibd+gsmAykyyJ
	ESeEHNYc8TsgkPn/aQUz37HDbVLef+iKb0ASZjxF16diGyP4Cyh/78G4RIHUuQKtVBjA7CukuJkRt
	/FWgnEspSrocLvDpbO2lITtFXVZ/VPHcMYs4xN+3KqbyBy1dirHMh9RrUQMMwUXnlmrVQOaaXQNXL
	DrESjFY2eZnmSphuDcxXq1RoCmtdx5WlPKhtYyKwRGNWjNSiSbVRynRAp0NnHU2hGJxd0XXxQfjfI
	7s4WBOWYVwzo+Hdn2uwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQRW-0000000FJaU-3XBS;
	Sat, 26 Sep 2026 11:19:46 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQRU-0000000FJaB-34N9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 11:19:45 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1111803a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 04:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421584; x=1791026384; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=;
        b=mzV5H6ihdsfq7lKthLCpNiopHVS4zdUDbOO8BrvhnHCuNp3RL/YAexhEzyTJhOoVvY
         8ji98JdvNlIpjV4WA5xOtdq6jPXyLURR2KugoP2N41vLoQTEkq6y2h72CP/5rpvnJWLX
         x8I4sgVIdd9U4jp9882TdCVbBjgzeYJondSasipzqHK/xA7eSl1x46Gd9MJk9D1bDHQ2
         1U52m+nLOPN+lFs36zfBpQUxD6VDEUtJivh0Cr+r7LH2MihFBT3bQcq9N9A6D8HlgHD+
         kLhJDxGfNNiqrwXyqRI7Trtw8xGCnkUnxRYAcXJ79KIPqw+vWu58RqxmNbgF9LqPvDro
         I7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421584; x=1791026384;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=;
        b=SRvnjYhHkUayH715o22ElHv7YsdudLUnx35FPlmOGiwzYELmngs9E2p6iB6UYqPJ0I
         lTtvB2kVkHDRzcrva7pZ81FSrLXkFRO1KeraoXEYTKR1wMCRE7FMZsLFGDQV8Rb+KNrV
         mB3rzW8f1HQamFnocZJmy9eZ9drIsn5/7lX7Tmad4i+7OaIr2mNCvdoDEf0aDWOZZ5vx
         VzcRp3OViNaA/gJdZocOnF9sZstOvd4oR3H+uAAripzRDasjqiRTbg6U9Iudl2QYVr+e
         qqlLxjzZGfQZw9vqURpzGFpxlvP8KSuKZdChy4xsdpfq5hUIZnGvc1U7G/Q+ukCXc4J/
         HJtA==
X-Forwarded-Encrypted: i=1; AKwUvBzYSYUaJenaSwT30KCJ79ARMYPeFa3B7sHT7zgowR+8qliKEIS2Snol3M6YLEG4URM8OO5FnBi5XCBYsfT+SZOy@lists.infradead.org
X-Gm-Message-State: AFq9FYKQpehvLRTQQqUuPiGne3/HM9YXw5dY9NCdldtOB9Nm0QbuWa+l
	VAtHDiGyBCiDDL06oJEGC+FM2DSMKVLtk0p8x9/vhifp0Pl3yRdfrKA4WCz9Br+M
X-Gm-Gg: AYBFou35zTyUr7kr/OJ8ytOAFpBMYC6jsfpNvJW9lqUiuFdI3k/kVv5LXxmSO0E9CPF
	nu9dNRa/2xncaan/t5CEIOSJy/fxxS11jZe2nr4W1th1In710rOwLCcIjmHh1S503+mTlCXjKvP
	QISICb+CLL4XPswkE9ycs9Dq7KUn68k3DvAoHkJj6/tll1ULQ8tuXrsQzDUy4EYMs5vUE8P1EM6
	90SmnTNlDL12qBxlxc/2OuHNjiZDoQMujMfkuuLkl7LZ72d6llR+3BD8eMeLbnN6Ewd4vsCtvj4
	xsYDyrYkKMhXSNprJmEcQFjmbaTKRAcjF3JW1UxJlzzwj5XBWB+UmipU84Yp1nZQnJ14BcNusKn
	kx7BcNefBkeIx8oxXZp3TGM5vSj87ZMniFyBN4dQACkB+Mi0tN/F6mGhhl2Hq7kavVCvaQ3DnM3
	STohVXEIDWwOKRzd4wDj7UxqZNjHmthrGWnMmvsNEOHMUQndr7LrrlaVQZmJPt6KKt9AhWasPhq
	EKN3cEdfdRFwaOmW5oEoN8=
X-Received: by 2002:a17:902:d582:b0:2df:98b4:c294 with SMTP id d9443c01a7336-2df98b4cb7fmr28618195ad.61.1790421251744;
        Sat, 26 Sep 2026 04:14:11 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:10 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/3] Add MT7629 TOPRGU reset support
Date: Sat, 26 Sep 2026 19:13:58 +0800
Message-Id: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTsRq7bBqxgXbRlgEilkppgmh
 LtbXb7F/zsoCZPCo9lB6MPKS6q4nBqIk08jIffVYFpj285YDDecs7Omw7ysMm54jWEwzrsY7z3
 UbBUauPyXz1d18EoYxKc4/UZvTlvBRCWfZ6+ZBI7jC/yFE+yGAAAA
X-Change-ID: 20260926-b4-mt7629-toprgu-3cbf27a7cc5d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_041944_771761_C443B1BA 
X-CRM114-Status: UNSURE (   7.97  )
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

Define all seven subsystem reset IDs documented in the MT7629 TOPRGU
SWSYSRST register and expose the reset controller in mt7629.dtsi.

Add MT7629 watchdog match data to cover reset IDs through bit 12. The
MT6589 fallback only allows IDs 0 through 11, leaving the CONN_MCU
reset inaccessible.

---
Chuanhong Guo (3):
      dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
      watchdog: mediatek: add MT7629 reset controller support
      ARM: dts: mediatek: expose the MT7629 TOPRGU reset controller

 arch/arm/boot/dts/mediatek/mt7629.dtsi    | 1 +
 drivers/watchdog/mtk_wdt.c                | 6 ++++++
 include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
 3 files changed, 16 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-toprgu-3cbf27a7cc5d

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


