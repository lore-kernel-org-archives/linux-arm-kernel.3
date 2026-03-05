Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3000F47CD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uMUvcEj/jfsJXhZHMSm5BagEwceXMMjDcklR+tqh0YI=; b=epR/9eCvaNgkyi
	KGVwUnSoJHuN/RLC8oMQE2+Q/Jc2AWlk2aMzb+qDmWKaZnPAPDwWhpAxq4FXHPdQbi8P14Dt6d5O0
	I+AH7IS5irjSKs+b+6qSItcra0xBGZXWac4sL/7P2t+AXXpWUsjdhL1n0BJeWkeFSyQpwH7bXWIu0
	iL3vWIgyn12zGtfQJyNJYJ3I6at8Lm1S9rkeLk+jl6sRigSrxFGwFxXjTO/8m3+AhOCL5w4ubeVZ1
	QmQew/yFZk1VFzX3kStXrsjx10pnmyA+4FTtHO44K7TCAEttEQcw+qC2X7EIkvKAWuMovwZWJioD9
	TXiZ141+puPG4C8csVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrL-00000002YLK-0hqJ;
	Thu, 05 Mar 2026 21:03:51 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrI-00000002YJr-38BS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:03:50 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4648447e29bso3438520b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772744627; x=1773349427; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMUvcEj/jfsJXhZHMSm5BagEwceXMMjDcklR+tqh0YI=;
        b=IVrSwSjl8ECg2Zb9+1qSOZUXz3HSNSR8BSLiEGAhUBHuJrIBBZ5hXo3OzkkEK32M6E
         DRY2Do8KwjDWzAPxKzpd4D4oqOzySLswqwuDT/X/27osAiTlUy6Pal9tu+dTNuEpMOTm
         YK8BXdCjtXxvpITYRwrWUk0sxX/I5r88TftkeITvgMS/7gUL0wn+OZxUR0MYNjrWD4xO
         lEwaQ8mmSEI/bCHJS6JbMFvAAlTzUXmsY6Sbzb+Oqm88p4qPjQpajPUcXfTiCAGIxWlW
         GdqSNJPQwzo0T2KAM3Sn3gkjGgWshC2To9+EFmiOkS953JYIcwA/CBin2xDNyRQ9SQwX
         AFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744627; x=1773349427;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMUvcEj/jfsJXhZHMSm5BagEwceXMMjDcklR+tqh0YI=;
        b=iJ/TpAYnaPmAIzwUHGA2E8yS6plydn+aEd0OaS/EswFxCtmzVMSF24w1Oj1wA9A1RW
         865LM/jqR8K0sLOjLOS1jvBMoYg5lh9BV8CaU76ML75/FvtF5eWGsB0q69Z27nEon3U4
         q/p6Q32+i76Mtbkm8N2r5fon9bRqhYW4vPYr04tReGq7A6z3eJUBDg59O/G2EWyhuoB+
         iaLL7ZEXRB+n9eAcCFY1t0m6vaAOkGIx1dR1mXDObRLijtqqVUjjTULmXfFuAiRzQ8F5
         qOLsJceR8ePe0GAotvovXpjKxExfqtFZRJLFNb2/mVnvaachbRc82gl2q/i75dskVz6j
         8C9w==
X-Forwarded-Encrypted: i=1; AJvYcCUHttWXfVRZih5vKaJSMPy6vp/8S+nUZXs+NGlI2b3eHw/0S1HyuRjUlnhV5HPIp2Zy8+GJcDGVt89MZbpdSLbn@lists.infradead.org
X-Gm-Message-State: AOJu0YwxhrbYbRtZZkBTDQWRt90IEhy58wSAVNVamRUkdf+W5vSbsS6h
	+o/AsI7tHvo87J0qFV/voLIxNdExRD0hdQO4VRnwzrSE2dxSZykpPzoj7Mlsce/2j3I=
X-Gm-Gg: ATEYQzyT0g3uZgG0YaLrvuP8dOMLDCdVt12hNl88k9Emd3FoSJNoDM0gl27S4B1bkO2
	MvMkPw1wCa857uMhylje7p7ntTHLx4H4vPoMNzK9oWOw1bkTYSkAKHqjSEQ+Zve4ohIqM4tSthF
	gkRdZhl22DdlBF4ifGHPiLUbfEF57GWRB9gnM1WQflde8GP5aI+rOFBIZAHlVszYk1r07sgXM/C
	cJGi7XaaqgXj9rphVqetn4qb2xzqdzuAM/Fa/TRDwb+FPRDW4RClqjSawVaI1zSFKaGOjYqS8qs
	kSoaj0DrwYIpvJadFxGj6eyzfkGP99MCGCTLIC2tBVCaV2RCJ01siY+nmouejyNF00aM7wj03Wo
	Ao65z1dZNwY8Z9tL+gD7I7XsYMpf8I6eruM+9x8gC+SOFkxWmh7AuF2NuugxNYZlneVtDbKK6Xf
	WM8VTUPCvqDVqtY9f0XlSwAd4CxXJ3uG0U6E+18oc=
X-Received: by 2002:a05:6808:c2ab:b0:455:bf27:e95e with SMTP id 5614622812f47-4651ab1d6b0mr3573703b6e.1.1772744627481;
        Thu, 05 Mar 2026 13:03:47 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm13729227b6e.14.2026.03.05.13.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:03:45 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 0/3] arm: dts: mediatek: fix pinctl node names
Date: Thu, 05 Mar 2026 15:03:15 -0600
Message-Id: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQqDMBCFryKz7pT8oNGuvEdxoXGsQzWRRKQi3
 r2pJ+jq8T0e3zsgUmCK8MgOCLRxZO8SqFsGdmzdi5D7xKCEKoQUBc7rGwf+pDSF0riws+uErp0
 JhzKvdJXrjnoDSbAESstL/mwSjxxXH/bra5O/9i/tJlGg1qU01gymJKq7dp+4C3S3fobmPM8v7
 sTGrMcAAAA=
X-Change-ID: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nCZZHuCOrSues8QVWXqMC3+FI2MpOSDkCrCh9OXFww0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqe+WhDO5SBkuyTXjQeMiDCxhJ+2B7nXDuoYIk
 5tZG2mjU7CJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanvlgAKCRDCzCAB/wGP
 wEg4B/9KENu8eGKx2Ux1CiqezA+SY9HupqER78ey4oFPO7seJ+znvkbjM4suVHJAMQSh+5NQ3U4
 g+49D/Nuf1O5XelRqVdmivXh9lSisE4Ae9a63KYim9Pcz7IvqGYctovpdU3KJ0wfY/DBKwCOetQ
 u8/RI8RLlhEzT+4O6drd63mip9IeCFaEE8eMpGxpDqUQbk6wr15DwI+AdJ/UqrXPal5mJWLx6NK
 RyJ8E2dGk7YDiYsRxm3WsTYkN4EZIqEa3gO18FhkUSLjpGohV/fahZT9qjbwQan1X6I5i4VmdBO
 p/Xc200kZ37fidWvtIbQ6Ed/8obcxanvcm7eCdo1IjBmUKiY
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130348_796050_A32ED46D 
X-CRM114-Status: GOOD (  12.08  )
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

While passing by, I noticed that the pinctrl nodes in a couple of dtsi
files did not match the addresses in their reg properties. Here are some
patches to fix that.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Add a new patch to also fix the pinctrl child node names in the
  mt7623.dtsi file.
- Link to v1: https://lore.kernel.org/r/20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com

---
David Lechner (3):
      arm: dts: mediatek: mt7623: fix pinctrl child node names
      arm: dts: mediatek: mt7623: fix pinctrl controller node name
      arm: dts: mediatek: mt8135: fix pinctrl node name

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 64 +++++++++++++++++-----------------
 arch/arm/boot/dts/mediatek/mt8135.dtsi |  2 +-
 2 files changed, 33 insertions(+), 33 deletions(-)
---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


