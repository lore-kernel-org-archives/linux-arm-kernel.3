Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC27C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VaDhpruGzyBKIl+96KmB7UZrakWcIwfKbPxghFfeQnw=; b=N3XGh49jF9IDB1
	yCUTV1KvdoHpq0xBEe8/5wD7U8DcUbS1ttRxpvthZjPUPXv4JIqUd0AQRIMVR6TNYVP42qq7HDTt8
	VNZ5s/WF5eD1EIgc2rs4yaW/HUK3MoPhN/VoEgOjeJchrsGcQdvGXIzNzIRlAuEbBPB13/FJO1mO+
	cr1FPXgSJmVttj6k5Q1+XYSsK9nYWmr3tSiJ4gnCkBmF6WfERw+WWd9Z6fTOPhwxqDTaFm94mm7rR
	/n+3OP5QD90Je/DMb9yF0LIc5dXr2b20N2QXD41fxf+3kRti6kOY3yU7gdcXuhewh/A726ttGR4Xf
	tcSRdDZRBvntXgp1MeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawn4-00000000C28-0VtV;
	Sun, 13 Jul 2025 13:30:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawke-00000000Bnt-3UDw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 13:28:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so1817968f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752413299; x=1753018099; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaDhpruGzyBKIl+96KmB7UZrakWcIwfKbPxghFfeQnw=;
        b=K6f/SWLYM9lPYIexAhOJwCkmRuR4OOJROf4hodOZxJU+UBL9plzZzaWc8LLrtteNcN
         I6wr9iSaf8kYIf2djyrkVfdMUSOA9yQtGpppz4EK7rQ6BQH19+7lzvQ3cXPWKQrLniwS
         v1Ej4DsDdO9LBFlse3ypcj0NMI7SmIJ7lwzIU55u21aT2cBDv01E5mtFYczLUFJs7w7E
         DJRVEx9kCQ2KoVKK+MmhQI3KF3PA/hzDPhKysUzTjldIFlvUYe2WlzTPTfYivjTZ3ZgU
         UlEni6BI4tVnGde8ueLzr7BFpOnk4A2Fz6qzRdWCP7WsKUc18QUEuGQcY2ok8xf1j8OT
         Ua7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752413299; x=1753018099;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VaDhpruGzyBKIl+96KmB7UZrakWcIwfKbPxghFfeQnw=;
        b=sIQrJP1ylQwWfeUWa1VRl2hvk+ur6E7AMnbQqUMmvKc9ne4/AGzoHvnO/KNzc5U7Yq
         5J6AoHtp1xI0aBCkg1VOI5D5Y51jiinhRUVWZ9w1uQYvQItnEvqhGz38qRhTE6T/iHSh
         s75IFhUuRwlvTS2fQ7B+Ii7sseoTYMyF0iU/+MbtvgT4xRftZo9PbeEJ1AcpJACRJcq3
         OY6ZZ7WkAR3d20NHP1rVfIFLtgM5KlGtJ7C8GdIbqF1GIuhjyN8xVY3rowbewuvpqwG1
         +smQJfHlVoQ0HjQmojcIW/1wWulBrHGV8Qm+OQTXs/FA5hXrkKGsezcqvmM3YndYIO6Z
         C7fw==
X-Forwarded-Encrypted: i=1; AJvYcCWU6DegmN/2i9rTgRLc28vWjsrXVmfjlY2G4HYVWGn4Gap48Se+TGTKd1d9XS9H3osjsuzZth4KxY+xQGuf0Ock@lists.infradead.org
X-Gm-Message-State: AOJu0YyET++suVABJrMOE6d5fpx3v/tcv41/knBC8MjOrqhYrQCYT1s8
	GMtIV94rNcuaf4XuJp+CtzGCzqAj+WrGgiSo/Y3NWoCGOHIlPc5sCo/xCCBx7A==
X-Gm-Gg: ASbGncuyRsqgoQCRok4TkxUu0AlZeRqjzcDmfXPilvXzaChcPdrE05FM0cc9XGQd5Ku
	hqmoNee6fNPW0Kb0tfSCwTzDECfZFBK/QPcqwEoG4kIt9RllWHHBBGHOwMoN2VMKsjAQsIZsbl8
	FXNaFqwqrkZnXTzq/adNVWI4D8vnBuqYTMjQ3SDYqoDtraiwEjLi9IRbgSUDn/jKaTtfS3LphRZ
	bJavjwocy6OYLgEy4GJGWMpU7WdOhDsp53fsun7J6mH1hYWE8Qt7G4bBzMOsJVPN8WDAhoQNFyg
	eOb68Thmh11DCvdDU14Qctrpk6DIw5U+mRw/Zu00sui1Oi4xGj8JurhyOu8NfQVsZK7RvH7ntnG
	d9thzBlsNJd9AnUgFpHCkiiFDrUWXElxb
X-Google-Smtp-Source: AGHT+IEb82Sb0pRwWgTx1F6OqGVNlsLz2nBGkO/sgHqx0xurUJK84Sk0nksT2BL2PzLKJl3uGHhARA==
X-Received: by 2002:a5d:648c:0:b0:3a6:d604:a017 with SMTP id ffacd0b85a97d-3b5f1890d17mr7238434f8f.24.1752413298673;
        Sun, 13 Jul 2025 06:28:18 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1741sm9917933f8f.18.2025.07.13.06.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 06:28:18 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH 0/3] STi device-tree cleanup
Date: Sun, 13 Jul 2025 15:27:27 +0200
Message-Id: <20250713-sti-rework-v1-0-6716a09e538d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+0c2gC/03M0QrCIBTG8VcZ5zrjaNNYV71H7EKd2w61OXRYM
 Xz3bBB0+f/g+20QXSAX4VJtEFyiSH4uwQ8V2FHPg2PUlQaBQmKNnMWVWHBPH+7MIDZScn1SwkI
 5LMH19NqxW1t6pLj68N7tJL7rj1H/TBIMWceN4r3Bc1Or6zBpehytn6DNOX8A7qr4j6QAAAA=
X-Change-ID: 20250401-sti-rework-b009551a362c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1a3LShyOJLFrkGYDCOQ3bEAtoIgGE8npT434+VJo3l8=;
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoc7RppZRgvTFRUNu14QfN57tb2+/jkTn1NBfeI
 D62xzH5O7eJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaHO0aQAKCRDnIYpo1BLC
 tQdGD/9OC8WwhZlQhRcLN5Y1LTH/7AWEc5MdVm9P7PJH3xyrDcVde/8o4suEfngdigri3XKekIc
 OGBAlASxOdk8JiLDfqsHsIhxFBsu9q5XfUV8J+QdC7ukQi9sYxcx6ar721/gC4c0HcE1zL5iT/J
 3uAnXa0jQldxPK1Ql5iy4GoSKQXc0lOPOUf02QT+ceC9wcjzs5FnLGfC3cxs1S1kXFEl0rRzFDO
 dC8U/LAx8EnRC5zZGcpROfAr+/acadbLEVPX2X+YuZPQATZtBFQ+C9Wp8CyVAe+EKehjJzlh2c8
 PmrlZ7JM8Rn55UaXh+M+5bH2K/PXg7RQ4P5bJQnFae5vKNGQcb5eyuhyZhMfR+5wkBL1hvoRT9g
 iDgZitJEUs0JyO/M2KeZkTUv5GnfxUhuROrWVEyk1HIFnmSMrct8Z5k6xcALLKTlg3CoswuU4Xn
 RXK3XwbWapL+JdDazouB5AOdpGfYfMSmX7bkqvTd0zMRZ6ORD7mTAziyzRz4lIeKhiA09Ft0HN7
 KOwrhi/JzDtFMxaq1bcnJAE3s7tjNdOPzSDK4bkVSfYGdxXzorO+WK3GS1AvXuyDg0gRqSlq5kA
 lbGkrfrG8HkIA2+qRHduE0cEN7axcjSaKRvuT+UeRC0+c5BpxiSsiGQn+bjdYOoPBDHrVZAXzph
 GpVC4Leg49e983Q==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_062820_874729_782333C8 
X-CRM114-Status: UNSURE (   9.02  )
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

This serie aims to cleanup and rework the STi device-tree.

STiH415/STIh416 SoCs are not supported anymore and B2120 boards are
internal boards.  Update the documentation and drop the related DT
files.

Patch [4/6] has already been sent by Alain several months ago, but got
no response [1].

[1] https://lore.kernel.org/all/20230416185939.18497-1-avolmat@me.com

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Alain Volmat (1):
      ARM: sti: removal of stih415/stih416 related entries

Raphael Gallais-Pou (2):
      dt-bindings: arm: sti: drop B2120 board support
      ARM: sti: drop B2120 board support

 Documentation/devicetree/bindings/arm/sti.yaml |   4 -
 arch/arm/boot/dts/st/Makefile                  |   2 -
 arch/arm/boot/dts/st/stih407-b2120.dts         |  27 ----
 arch/arm/boot/dts/st/stih407.dtsi              | 145 -----------------
 arch/arm/boot/dts/st/stih410-b2120.dts         |  66 --------
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi        | 206 -------------------------
 arch/arm/mach-sti/Kconfig                      |  20 +--
 arch/arm/mach-sti/board-dt.c                   |   2 -
 8 files changed, 1 insertion(+), 471 deletions(-)
---
base-commit: a6cfa4c8833944f8912c1fa7f95795753f6376ea
change-id: 20250401-sti-rework-b009551a362c

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


