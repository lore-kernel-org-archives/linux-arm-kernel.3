Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBC6CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mbp+XGu08SphaD/VmIY79o/0rYxP0riQ62ZWUCZr/Gs=; b=skXOD7X5zQVlYg2rLPpND6Zx3s
	1+yzuEtfMXW22tn2O95HRBaZxeMKRedcw6CfKDZGb0xZOF/XZq2FIRInyZCBVRtcxE1JH+gBLFdHX
	co9GUcR92asUad8qYUp28SuutxS0/Hd02ByoNDH+m87s1XLtqhDaxVE7OFUo85SB824j7AB1KsbZp
	nWZKvyBOYedITlOaDF6PwX3XDaF68Esi3pYbFg7AEhuFynvBQdHihPs6RpMnOiswFo057yxdRlPhb
	zvze3ZV8A7xy+PecxGLBM3MPmevTRugFlHY0TiQdE1NAvu0Tj8yot0LYnSHK+jLOAh331alTzSJ7P
	Pflxi3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlXz-0000000Gs5m-1buq;
	Wed, 17 Jun 2026 08:22:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlXw-0000000Gs4o-2X73
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:22:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf125989f2so40909655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684572; x=1782289372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbp+XGu08SphaD/VmIY79o/0rYxP0riQ62ZWUCZr/Gs=;
        b=ou2t9Rhr0DELLJ6i5QRMINXGBBdo7ZfrmwIHE6eRxeF0nqEv7f54YF5Pkh1/AEyRFJ
         k6G0J1Fwo6vUhzM5BwRbq/oH8094xi3paZdNdOfu+aAgGIGeM4vX5yFAiqNgduYojfAO
         RUTwJSV3q5ZGKkY1XBH+UMZrAEYMT5mTCzD5qvEni63rjT3noxdW2By6x6SXBS7dFhvF
         5wx/DOmvOgcSLk53PsmsZOmh/3Wf9EKESUynxrfxjwIYt0i6QqfE/zus2BVHuzmfUggt
         +TChz/ROhxp1OTPkwEHkZgGQZemxOfaWlVnkkcOpZemhUkUJbu0AmKbLc1UbX7HnwGMu
         WLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684572; x=1782289372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbp+XGu08SphaD/VmIY79o/0rYxP0riQ62ZWUCZr/Gs=;
        b=eGFhQ87Olet3HslrueYbn1ezinVJqjznFSCY6snrN6k6HiuYVHJTxZ9Ca9uzPxBqZE
         f+Fa8G5p0mWyn8aft6r1dEPm+znipUErpsnxinWhH78AKW8+cxEHAwiONY3iswDH/LBd
         Z4XwSmpxcqVmCfdYJjkvi8Tt6UUuuZUUYWWR9AEG6KJKI7jbdHdB1avwE2e0lyznQSPK
         7TTv2wnTm0OTzac7ILgSEhNfpTzCG+Tpxxtp80V36GochV+SghEZxoTZLP7V8boMVyIk
         nOT8xGhFGcJRcNucYxHy4+dYLHzbL080QtpFjC3bWfsyc6d0pAURnTojJvvl8MDrwRmN
         SODw==
X-Forwarded-Encrypted: i=1; AFNElJ+8j8isQGCTWcJavuzzk4cKif7uq39LF8ejoRkrU5bzyYXfOxQGs6CylaYJo+rGgtOUYt7fBzeZeqMg6h7PaGUt@lists.infradead.org
X-Gm-Message-State: AOJu0YzOe5/1HtdHUQxm3+Omz/QtTvLerClIKI4MR8zn0bW1B3NZhxKv
	lbhaAl8nk2ZtKu2BPuGuVheOJ0wwF/ZlhUUKLtV9k8fweqEYYSLqIkJT
X-Gm-Gg: AfdE7cn55x2swMmhsTingGF7X11QHorOukdOOF64epZtUzzhyqkAqW1tmrX4eTwFJX2
	dAF4894flxH+V1VPplJJNcec/98uZTozAplpJIgVa7uh6zP4bPl4i5+oyd0gsVU3a0lDqXrNRLG
	f5jswyC7CcgDYP955mwfZdVzUgtXeuexzmLyCqZWY1MGst5oAAdB77Z6BrCFt7EmYUxigABfYMV
	8c/eSX0peTzdOww20M0tCJxd0NEMQQ3OGwAiJdtvCRB+vEX17lJwkGiwJ4xx21v4kjYMt0zN7iB
	uLaMrV4A76o7S3YccJJT8r67oBP1vK/zXAaslyWXRo7FeFY9tcWWqtcB7/6KtzRfWUH8TY4UA+/
	h/SJCcZ/DuXvLzSSkXeLJETI5rU0Ad9+xakNwG4l5PYbcMrLB+CZafFFXJYQSSy9nA1fA0St8RW
	J4H6AZ8j3DGQ==
X-Received: by 2002:a17:903:887:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c6bbfa18e8mr18681895ad.6.1781684571658;
        Wed, 17 Jun 2026 01:22:51 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:22:51 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 17 Jun 2026 16:22:31 +0800
Message-ID: <20260617082239.645562-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012252_641398_31D8D633 
X-CRM114-Status: UNSURE (   9.43  )
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

- Disable nfc node by default ahead of nand_rb0 pin addition.
- Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
- Disable pcie_phy by default to suppress probe warning.
- Re-enable pcie_phy on S400 board to preserve PCIe functionality.

Changes in v3:
- squash "disable pcie_phy node by default" and "enable pcie_phy in 
  meson-axg-s400" patches
- Link to v2:
  https://lore.kernel.org/all/20260617071604.635627-1-jerrysteve1101@gmail.com/

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (3):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.54.0


