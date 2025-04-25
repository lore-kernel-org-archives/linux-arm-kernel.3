Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782C4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E4iq3ZV1gZ2A7C5pUxV0xluU9k930DxcjxwJQQWmeeo=; b=S0FS7uhq0haUx0
	QBgDQT8WYA5TmOnQ+b0XX2bKqwAyPOuSjskdY5Ro7m3HH8W/MGANraajYkDuZnWvlilYYPl2EXJHz
	jZuko3xfKvqesvNlIXMGsJOXcG+jF4RL22xUOgk2BSPWTAfSos8K7W6I/4c3fDs+ZBa/VTlqrwDbo
	gZjozZtpwqP/vSYtYCF1SJhoWPuiyRa1QH3sSbWSWV37rkD3W83v84WqfCzgnlMSWcvUWIeyySZmQ
	WyGWiXUCNS+Xy5VkJUBL1hfHeOnA2iuES90YYq68besq1TkUwR5wf/OjPmLN78OL1dlhunvat6dcS
	EFjuo4DtiLDRFKS8VhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MqL-00000000ODc-0DQZ;
	Fri, 25 Apr 2025 17:28:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KZN-0000000HXfZ-297L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:02:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b061a775ac3so2315500a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593344; x=1746198144; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4iq3ZV1gZ2A7C5pUxV0xluU9k930DxcjxwJQQWmeeo=;
        b=MPuyK9NWBBAFY8CGEX5ue8bF5cskFkUSxVxEOrjJwT87aQQxXqXUX2AguSvRgpz6B4
         TzfGIZDSNE1cAlN2sj/KTlRV6yKeaGT2tU1kE35C4mbZLhJHK0xaxhjztNlYb0lYxehU
         DaZsJtbNzNAhCMf13pJXra2vb6OFx6B1GLGe14g/e5tfK+Nb4vKQ1sWbhFRN2EH2j+Ys
         gMqMMG5iF1K+FBaJ8CVCiHp+IlPejWkwDaLD0v/uIGguxNSS23V5VV84fHj8/AqTZxri
         TFG28zjSz2yjBzgaE8N0PI3ILBM/IbWw43m+POQt9pGtN3dCa2ckRfOaMgqFYaD7x5Fw
         JICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593344; x=1746198144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4iq3ZV1gZ2A7C5pUxV0xluU9k930DxcjxwJQQWmeeo=;
        b=HR9sL0YsaP0F2xzZAjBQHYW+aUd/dzeLVdeWJp0R/CvgYQZaAY6zHzrOJ3JlBiLE05
         ZEn40abR3dTBhZ3XHUcHw3qdnNeSCet4kQ7zyQsmEJywgt08cI3CQm9qSf8GY6xKkoZS
         R8/S9+Fm227qgDgffaqxOPO3XDbBpe7gd+PuQGPI4nYbYZwunTE+cZHFoLBgrTj7thkP
         rpeIZBjTCKvc9ez/dNnOAWXzaC3K80IywZ8Sz0nIf7b7SX6XNv5dcpCPIfi/4qGKrhtj
         /fV/fv0ZCsfBaHESRYdWuxHxXpg2Z9G4cQXHJY0KBLEWU2M3SdSpJY/oGy2MRRvEems9
         h5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNtGGcjUG6cIwUbvsRLyLzd1GD8r3KF2T8leMaE5VPFdzlgAUtKoP3HtKUojv5N0vkrZR6xc5M1ajkI62ZlFUB@lists.infradead.org
X-Gm-Message-State: AOJu0YxM2RgvW+z+xx9U2gQkA3RMKNlbeE7QpDtzG/OwZefj0HyuVi5L
	eUoCnHa025x/vqBAD3XPHKMhp6ySDVOUxw9W05NYDaRkqT6pP+EkrMuIkFNrSZE=
X-Gm-Gg: ASbGnctf8iq5wM0RgLKMnnuMSwEvxxExrj9MMonpa71PCMG9NMRZzi7Qo1MvPrl7Scg
	scmanCGEX1qAY0aHjnABb+PGH9NPKs6CHEaVfv8f2qnVy55Gv0iBDWpIsV6IgD/Ap6RDoVdxeQP
	eszah+HDGxVKGFd1riGWLRdmgCZBWMyVtrgdIIu4+b6CNxpmEfOpKtgmk1+GSu0xjjDyvAmVmPR
	LKk0zN9as43vGB65DsUKDjP34HlFi+d6q7Yqql6Se2MWeBPaa8rvyCmUIPfyB1kYs6G6C7gmA2E
	GkvK2qVgug4JZ5VUiIPiR4/xCTgC2yCYej44V+A5YhcUPzW2qo8mGH9bbEwMjA0=
X-Google-Smtp-Source: AGHT+IGDo0mhcDv+LGOTc0hTgh+mctyyVzduVPzACzshBZ5R/WGcrSfIFLzGkl9D3SR5J4+vsMUBSw==
X-Received: by 2002:a05:6a21:1511:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-2045b6ae0c4mr4060200637.6.1745593344365;
        Fri, 25 Apr 2025 08:02:24 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f45bcsm2996984a12.13.2025.04.25.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:02:24 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v5 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Date: Fri, 25 Apr 2025 19:02:21 +0400
Message-Id: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP2jC2gC/4XNzQrCMAzA8VcZPVtJs3ZWT76HiLRdNgPug06GI
 nt3u52GiJ7CP5BfXmKgyDSIQ/YSkUYeuGtTmE0mwtW1NUkuUwsENKCVla4Pl971FC+e25LbWtq
 KHKEtdgpIpLs+UsWPxTydU195uHfxubwYcd7+0kaUSqpd2APmPg1/rBvHt23oGjFrY74S0HwTc
 gnS6sKDNUYj0Keg/wo6CUABS6jIE6q1ME3TG250fOc2AQAA
X-Change-ID: 20250418-apc_paper_binding-8feae286710e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745593359; l=1922;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=+8Jhr4lXBd37amRhl8DkfhFl3vWfPC/cgjVXW5fibXY=;
 b=LPnroPcrUyM1MHUdpXiqGUMmEbn8FngdwTmdNlPJ5SqHDewfZ7IfuTZtC1jPdjsxiqQ1WKlLF
 7KbbntQrnU3A0p/bEw57r7vSTflMg5cmqkzU7+QoA1Vr1hWNgInR5nK
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_080225_554524_9B297AC4 
X-CRM114-Status: GOOD (  12.05  )
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

Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
is the same board for all intents and purposes, so reflect it only
in the binding description.

Split the series from v1 into several chunks by topic so as not to
spam all the subsystems with unrelated changes, per Rob's suggestion

Changes in v2:
- kept single-valued compatibles in a single enum (thanks Rob)
- dropped the empty overall description node
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com/

Changes in v3:
- submit DTS changes together with the respective binding change
- Link to v2: https://lore.kernel.org/r/20250418-apc_paper_binding-v2-1-17c9023b7c9b@gmail.com

Changes in v4:
- fix typo in the dts Makefile which went unnoticed due to a previously
  built .dtb file lying around there under just the right name
- Link to v3: https://lore.kernel.org/r/20250425-apc_paper_binding-v3-0-846b0855420e@gmail.com

Changes in v5:
- simplified binding changes by putting the enum directly under the
  "compatible:" node instead of nesting it under another "items:"
  (thanks Conor)
- Link to v4: https://lore.kernel.org/r/20250425-apc_paper_binding-v4-0-0ec2d0febe21@gmail.com

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (2):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board

 Documentation/devicetree/bindings/arm/vt8500.yaml | 10 +++++++---
 arch/arm/boot/dts/vt8500/Makefile                 |  3 ++-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts      | 21 +++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950.dtsi              | 11 +++++++++++
 4 files changed, 41 insertions(+), 4 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250418-apc_paper_binding-8feae286710e

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


