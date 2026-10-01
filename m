Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3457CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=; b=RUFBpq389GIKol
	LX9xSVqIBHJ/tsurCCSA90ucDbEk+riOoeIwqu4s5ywVq/r+ADkVPNbd12x0WlpPrqcYD4kSCFUel
	jGq7ZwNBnBXJRSqtsf8v2hw0SIM+dtZAeSW5AVFklQ32rnKaPPjzIcnP6NQHvbIsoGId8EV+H7mNO
	QqeHFpHPxq6J6bB+qYqchPDCEuLzbS8/3YV8R9Hn4fe115HXn3IWhjWggmGxNhK2LKd88xne9b6zh
	lFaYt8Mx7uIztWy5O4Qcof8XIKVdXorJuJgOXxrQ+MPivUyb5ejduxHD/B2xQIbPhfetQZ4/WHuMh
	gNRCQ3Ca0EZlxGSnminA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNt-00000008E62-1ZCd;
	Thu, 01 Oct 2026 08:43:21 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNp-00000008Dyx-1FUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:43:19 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488811c9ebaso3217696f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844195; x=1791448995; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=;
        b=Kl+rQUXsNwG6tkBJOXk6Xn3vDA9kUOKXY6NET9juSpfKn9aX3122362wNokdIv129s
         wRzL0QHHQr8jffXO09h5C2dpzgXGJ41GOz89IRFg5w0rbww+yK1gWUp46Vb8+7UppIW/
         ZcMpxhAlR6HcG+A0dXzADU/LnKrTncRvVKilKaPlAY8BTPxDgtBWi1ZZu1IVlq9rsdcc
         FuIzHDEaHqWgch/wn0fDIGangtUgekc0Ic3oykYkXDkEzW15lb4JvOxyoxG9nOGZEpOW
         rVLVyz0xuMe+QOl5JbKs0GutYGzAuqZsD4BoiX4HUMrlsE/fEeZeW6BMkZhGsFGj+cAR
         GYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844195; x=1791448995;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=;
        b=fZJYs6U/L5jzYlnWyec/fScbUKsM5NLpmi5qr2/D1if57BxS9ZEprN4wfac2gtvbfA
         Xsld6RyLLNiLj8ENE7ECfs0UaYav1f9j6vWz5RVFbrmFnuUIVcYiYmdkdokB8vyyfjrb
         khwFHazOdAQefelZrovukRjyKenF1hSpMESREQl0jrIJ3BbNMl75HrJbI5sUw8aGcUD8
         s8c/FqPDDdYgmNr1FvUn9z/UtJfpXKugwcfrDR7Z+UOmWTY0adZtXycyHRFLg6CxqwtC
         Kfz5eNLoaffI01pc6i1lS+BXwnHq/yH15m6+WZY4xKQIbvfO9TExtIcPzTqpJuCTv2Ma
         O/pg==
X-Forwarded-Encrypted: i=1; AKwUvBzEHlwPkHaZXQwsjX0Qnmi3YghFt1T5EP+9tRMYApmhJXRnl6Qzls+V9JjR/EzJd5tNkKVpqIqQVZQGjwALmAuL@lists.infradead.org
X-Gm-Message-State: AFuF++lmuIQP3P7881k2wQRaE0u/T/Npael7zAgCvnshn3x3SxS3XSBv
	JyHZ9HRGHdR5mVA76XREIuapX1eG4ntlvZrr0mv7DWIZt+kSlvLrZgdI
X-Gm-Gg: AYBFou2UssXXzNU9WFDOK43aAqEBTYAfC9yCOYw056lkZ6+hwe0clK8NUdfpMVmh2Eu
	aKc1W38kk5bhgPbth0tjYVXWeR+ZuBEASV0LhIq22gqrbMhdVuAXfFzbDz3g8CaOYUSWoI/xcNS
	HrKLRRf/v+oSOmnrSiQA/BeGMMUIapEt7UOvc88wAMp4etuqm688hvCtrE9/k56OL7AS32/+5xN
	kOQBZVqlIHWttOEzt1QzuDU+w/bH5pgvTcGoBioRDr2iGmcN/H/8nM9/tl1YxVHiWNXPkGoxtL7
	1lQyn57Hkz1x29O8197s/mDWeEVyJVYx5Gp4OPrHU+I6bpbyMBAPNb4NvRRjW8SiRkEhXOdZ0wm
	yPSuNkjpW74NlM5k6O4syQ2YzTJR07NGYSjy/CH3aGpnfhGc7bUClQIHfq5vOeqjL3TPFLgcOsq
	gOzgBBD5USO7Sv3csZi8nvJyiQb07ceHexiZNPSUMQNMb9HSLkyD5kUFJ72+hYoTIW0tnFzm3+m
	2RmM+si6wKexWTn5/XNqZYkgf9CWngWr2ZqpWlu8Um45dgWqkNnHInJoI1O8JdgOAl31MhqLbS6
	B0vaB1zX
X-Received: by 2002:a05:600d:8499:10b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a01b11e692mr49639065e9.22.1790844195067;
        Thu, 01 Oct 2026 01:43:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:14 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: Add Apalis iMX8 and Colibri
 iMX8X overlays
Date: Thu, 01 Oct 2026 10:43:09 +0200
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4dvmoC/x3MQQqDMBBG4avIrDsQE4y2VyldpGZsf1AjGRFBv
 LvB5QePd5BKhii9qoOybFCkuaB+VNT/w/wTRiwma6w3T2d4qzksYYRyn0Z8MxjT3nFcNSl7V6o
 2ets2kcpiyTJgv/fvz3lebxgdnG4AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014317_372408_30AC06CE 
X-CRM114-Status: GOOD (  11.17  )
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

This series adds device tree overlays for the Toradex Apalis iMX8 and
Colibri iMX8X SoMs, and describes the Cortex-M4 remote processor on
Colibri iMX8X.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation
  Board V1.2
- Cortex-M4 remote processor on Colibri iMX8X
- Reserving the Colibri iMX8X Cortex-M4 UART for firmware

The remote processor is described in the SoM device tree, following
the Verdin iMX8M Mini support. It uses the same entry address, mailbox
and RPMsg memory layout as the iMX8QXP MEK.

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 and the Colibri iMX8QXP on Evaluation Board V3.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8x-colibri: Add Cortex-M4 remoteproc support
      arm64: dts: freescale: imx8x-colibri: Add Cortex-M4 UART overlay

 arch/arm64/boot/dts/freescale/Makefile             | 11 +++++
 .../imx8-apalis-eval-v1.2-nau8822-btl.dtso         | 15 +++++++
 .../boot/dts/freescale/imx8x-colibri-uart-m4.dtso  | 18 +++++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   | 47 ++++++++++++++++++++++
 4 files changed, 91 insertions(+)
---
base-commit: 39be5a7e3ecc08098c039561237499aa595700da
change-id: 20260930-v1-apalis-colibri-imx8-dtsos-632607d6275d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


