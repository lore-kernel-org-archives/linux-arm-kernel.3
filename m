Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DB0D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1vSgRP+Bs5qbIakzCpHlzr7o7ydag8RKKrO3j8O608=; b=LI86yN772kdtOl
	N7Bb3UBPPKUVtMo+SOxL2kETAelNnqO5i2IrdfnMd8UFLDtTHddgNmAARpsGCQuZXc/lgkO+bv/Ik
	1gaPdFqCI+e6UyXG9tI7MKoVV7OFK4BzFj9CKUbFOdIiK775PIH7ziYXOhfLy4IZkvuhYXnBBh3b6
	IJX3kU+WHJhWxLrh39ddAbLPrxHupYB0XA8ZEmaeAirq4xIeOHz8g4R40VSdOQXDCIa0ngR7ojnbq
	20ZehQuKqtpPAOCLYgBHkhsHQzt7s/iiAPprKCYSN2sx1aSspugOkY7jVJPtLoumcZAD+Vb0WfgwI
	p3YFvET3/RnCF1rw5PLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEj-00000003Xp2-3VUX;
	Mon, 29 Dec 2025 10:12:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEh-00000003Xnj-03tk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so10149815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003141; x=1767607941; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1vSgRP+Bs5qbIakzCpHlzr7o7ydag8RKKrO3j8O608=;
        b=VKZwTJY4bvcd3LRhsc4K0656//hJPVZBhBpvHEPVpo9Z+J3HJeW0WPj/F/yw7dn23a
         oGQUgAAN4WQljHS7Pe2qVcK4QakEU03r8Ec/i49WyIrrTbBq44CAhbs/qAzYqU/q7/hG
         x3KCJ12IDo82EBXsTHbI5PorJXF/+U73GjfCJvvhBcgjQAV5sc/iB85QkIdJyK8ZTvXe
         Qml+32SdHnBSO523Fw4HDdFiNs6kpn0yc7idSPOUDmeU4fOYuqlLhZnWPNK7FvVBgQvl
         U1mHWnR+ZRyuJ5dkzv2QMR4e7GtDHrZC3r+vKXe3RX9QeSsOXakjT+CNC4Q8eG8pdf7E
         Gd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003141; x=1767607941;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1vSgRP+Bs5qbIakzCpHlzr7o7ydag8RKKrO3j8O608=;
        b=G2QSLMG44tevPRxESMaCezcBOoulrzvknz/tkqFy2sLFb61n/MXliyj1DEKfAT96uu
         +CFNnxKbWfyUHmNK7Abrkd8nvSKU/xLnAnqWj1byWqY85rRvlbmp7kSZlcVgeneis78P
         MFuXmwAVzz0Ck0BHu7SiR5DmhKMHZYxCqEzo10IBqHuBcvAi9p45/BHg1PCtT1FNL9Hp
         Y17lHWAVpPKErgyR82RNTzAU87whYdBedNTaq/msnEEJwK7xJJqPqADusslf5BtU7MLy
         d+3DFfFBPsnIDCTvkKk4Ko6NNTeTyXkQgW37PDUCN+z8ecIeUGd8jdrIXafmdLl64NTj
         Dn1A==
X-Forwarded-Encrypted: i=1; AJvYcCXtMLJB9VxQXq5TosXM4LhDbA4/SIwiCEIzDYjb7AdIoTlO6shojWe5KkkOprgCtTrCrYBRy3RBlEeHDUN1MOaL@lists.infradead.org
X-Gm-Message-State: AOJu0YxQhlJb9eN/x38fWiSzTMS5EYlJ+5c9p0wI1JA8FxL0bHDVnJkb
	Guuz6bngIzU94KYHe55hPSChaYVkbT3s9hRa9Xooopllx7byMn4M/CRT
X-Gm-Gg: AY/fxX4DtdLYV3/fsrCwdV1PXlqNdcgFJcem9C3bf5NiPCPMXp9lyCXSa1+jAhWPbiS
	a7YcOIjoA8tLPonQGtzBYp0GhQqNPm5EuJfjfCA6Ypd1Ov/3i+SNK00PEeUbEy16zSiahrmCg0B
	rcsRfGUfvpWGI6nq4HsEv2foUY8xUmmJK1Xz74uVKIy6hNLdV/GDKVxsV+MX3oBErPSAQ7byECT
	pDtv2nFZPns2c/PUIVbxsGZXgk5drfNE+Mb4mRvv1t0xo8cwJ5WqqT0kA4cuwMB1aU1BlwAVO0R
	5cat+0ch+alduKuygQ/lArWT/f00mpbkAgO9lIBVhYx88x3jSkSKuMcN7EhGzSfDKNKqwuZNJ6d
	1e8mMv7HKDDJzwTjufydELS4MdWTivdZhkqnwKoWxVzXHuEsSHrI1nzo5TzHXcGDW4irdF/hOhE
	eaS084ymYvuvCxMkPyp+sHOmQwnZfqRGRRN60aK9pTah5wqLpU+uq7qZP8qK6p
X-Google-Smtp-Source: AGHT+IHlR0aXhu72J2TtWwVekmyRrRkDyvgOTcwGHqcoRX7TNY17EGN/wNGjrSuW2cqNhsN3lSNTHw==
X-Received: by 2002:a05:600c:444b:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-47d195468a6mr302386315e9.14.1767003140541;
        Mon, 29 Dec 2025 02:12:20 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:19 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/7] arm64: dts: rockchip: Sound fixes and additions on
 RK3576 boards
Date: Mon, 29 Dec 2025 14:11:57 +0400
Message-Id: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO1TUmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3aJsY1NzM93i/NK8FF2DZCOzVOMkQzNLIxMloJaCotS0zAqwcdG
 xtbUAxT+MhV4AAAA=
X-Change-ID: 20251222-rk3576-sound-0c26e3b16924
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436; i=alchark@gmail.com;
 h=from:subject:message-id; bh=LCiGByx44aPo6I9zaG1ReBsxglHofWHA8KNEqBtCywk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTCec14dG1Mwy2Gm4d01F2qTdhQ7tHWq/Y+L73eZK
 Rwj/YCxYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKn2rWf4p5r7KSIt89RE3i/cnJ6Kggsvrjovefym0jzN6p+BblfftzD8Yi76xBR
 nNfHq4VjPX09OdLDs4fW4Oq3/zsbqY7575T/PYAAA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021223_062030_671FE223 
X-CRM114-Status: GOOD (  11.46  )
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

Here are some device tree updates to improve sound output on RK3576
boards.

The first two patches fix analog audio output on FriendlyElec NanoPi M5,
as it doesn't work with the current device tree.

The third one is purely cosmetic, to present a more user-friendly sound
card name to the userspace on NanoPi M5.

The rest add new functionality: HDMI sound output on three boards that
didn't enable it, and analog sound on RK3576 EVB1.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (7):
      arm64: dts: rockchip: Fix headphones widget name on NanoPi M5
      arm64: dts: rockchip: Configure MCLK for analog sound on NanoPi M5
      arm64: dts: rockchip: Use a readable audio card name on NanoPi M5
      arm64: dts: rockchip: Enable HDMI sound on FriendlyElec NanoPi M5
      arm64: dts: rockchip: Enable HDMI sound on Luckfox Core3576
      arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
      arm64: dts: rockchip: Enable analog sound on RK3576 EVB1

 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 107 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi |   8 ++
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |  22 ++++-
 3 files changed, 132 insertions(+), 5 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-rk3576-sound-0c26e3b16924

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


