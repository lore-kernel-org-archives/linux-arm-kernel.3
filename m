Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0472F10F9969
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cmyw3L2KYXdzr+jogDgj5rGoc2/z7twVgoCe6cChdNE=; b=TzE+p1EzrCapLT
	ZrsTIxhfCN2jrwDFouEWgPOZbQ6714JA+ERo8aM4DEfTSxpYPvYDl5YcGtxvw7KleMiyxllMBGIEC
	SqRRJH2BYHUXoDVLEY1IFSTCg3FjOAqbw4i1tzF3cdamzKc3PkkQaNbGoDOXDgsJYqxsxEkJvJXwJ
	f+rSXgkYwNWwtB/sU/MmQeXBLfqJKpzxcX51mTgZYI8xl8ilUL56i/CsjdkmQ6taIOwUcuFksMeC0
	L5AfeC/uz3VqIozJaOVOMSKluNVJ94ft+GkJK1sG4C1udsom2CvOKCOVGOUYnIIZTOeIaAwd64lX8
	q+zM8yT/rku6f9LO3mPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAX2i-00000009DXD-1CCJ;
	Wed, 08 Apr 2026 17:50:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAX2g-00000009DWa-1W3Q;
	Wed, 08 Apr 2026 17:50:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775670606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nRPEwbUfly7GclJSBXCJEpAiusMDl1drCpiWPGDDzS/uRWHmnDIuGue7rx2IhSalr4a+z1h5IG7t7iBc2lgwNtm6lDwQGrpE7zdw2O5NVWEXnqgEHNHQQnhKOUA7khMhXTgfPfZV3ffUXHG1GRPJjvNkiOq6VbJdg5jebohDULc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775670606; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cmyw3L2KYXdzr+jogDgj5rGoc2/z7twVgoCe6cChdNE=; 
	b=PshHClPN58Dyl8s9q15ZYNa11Rqc9JJ8aypQGaPR2Sadft5CKVyfXnMuxzDJZf9iS2uIel95BGF51ozyAkTV9QH/S4j2uJD03LwPKFg+Hx85xI/uab9ODzGa07FTORy3izV4FZB0FiJHX9MVNV+eUnVSobJZ5yYOczN83rgwgqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775670606;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=cmyw3L2KYXdzr+jogDgj5rGoc2/z7twVgoCe6cChdNE=;
	b=HTqRWYCqIA1kW6b+mu0cQOVdoDQmi9oLvoZjYuPzW//Zmrf9VFiRYw8eigQVg84h
	oqdf3s/diGJxqKjmn8SptOJBnZMlA8Sd881F2Vjl7BUKDc9kLo6uR+L7RRuwQ9GDYpA
	ZTq+CxKZD//94QwX8zHJl0mbTuuBVtMdGIXxTHZs=
Received: by mx.zohomail.com with SMTPS id 1775670603925675.5553467581713;
	Wed, 8 Apr 2026 10:50:03 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 0/4] ROCK 4D audio enablement
Date: Wed, 08 Apr 2026 19:49:38 +0200
Message-Id: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOyw6CMBAF0F8hXVvTB4/Cyv8wLko7SCNQbaHBE
 P7dComJuryT3HNnQR6cAY+qZEEOgvHGDjHwQ4JUK4crYKNjRoywjOSswM6qW6qxnLSxWDWKFA3
 NhSQCxcrdQWPmjTtf9uzgMUV13I+olh6wsn1vxioZYB5xlHOSxv670Bo/Wvfc3gl0a+zLnHwvB
 4oJJjVXAkSjZalOynadrK2Tx8hvWGAfgDKa/QAsAoLJnGrgZZ3+Aeu6vgD1fvQqHgEAAA==
X-Change-ID: 20250627-rock4d-audio-cfc07f168a08
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_105018_467898_59960848 
X-CRM114-Status: GOOD (  14.98  )
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

The ROCK 4D uses an ADC input to distinguish between a headphone (i.e.,
no mic) and a headset (i.e., with mic). After some searching, it appears
that the closest we can get to modelling this is by sending a particular
switch input event.

So this series modifies the adc-keys bindings, extends the adc-keys
driver to allow sending other input types as well, and then adds the
analog audio nodes to ROCK 4D's device tree.

It should be noted that analog capture from the TRRS jack currently
results in completely digitally silent audio for me, i.e. no data other
than 0xFF. There's a few reasons why this could happen, chief among them
that my SAI driver is broken or that the ES8328 codec driver is once
again broken. The DAPM routes when graphed out look fine though. So the
DTS part is correct, and I can fix the broken capture in a separate
follow-up patch that doesn't have to include DT people.

Another possibility is that my phone headset, despite being 4 rings and
having a little pin hole at the back of the volume doodad, does not
actually have a microphone, but in that case I'd still expect some noise
in the PCM. Maybe it's just shy.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v3:
- bindings: use unevaluatedProperties instead of explicitly mentioning
  linux,input-type.
- Link to v2: https://lore.kernel.org/r/20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com

Changes in v2:
- Drop HDMI audio patch, as it was already merged.
- adc-keys: rename "keycode" to "code".
- adc-keys: make the keycode (now "code") local a u32 instead of an int
- adc-keys: only allow EV_KEY and EV_SW for now. Rename patch
  accordingly.
- adc-keys: Add another patch to rework probe function error logging.
- Link to v1: https://lore.kernel.org/r/20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com

---
Nicolas Frattaroli (4):
      dt-bindings: input: adc-keys: allow all input properties
      Input: adc-keys - support EV_SW as well, not just EV_KEY.
      Input: adc-keys - Use dev_err_probe in probe function
      arm64: dts: rockchip: add analog audio to ROCK 4D

 .../devicetree/bindings/input/adc-keys.yaml        | 17 ++--
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 90 ++++++++++++++++++++++
 drivers/input/keyboard/adc-keys.c                  | 88 ++++++++++-----------
 3 files changed, 147 insertions(+), 48 deletions(-)
---
base-commit: 8de395f35e79d9168a78504fed495578ec7bac52
change-id: 20250627-rock4d-audio-cfc07f168a08

Best regards,
--  
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


