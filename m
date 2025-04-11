Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A3DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7axsakK9/G4BguKMgY9rTMxm8Hyf4vANR2yj4cYy2E=; b=sxMsv7E/e7+AT16vItDT1+xX05
	DS8tEZNz0mPYKSPrAN6LqcKZuLcrJqS6tShoMAOcMr1nTotQT6JB0PzzOgWpdfxC1Uq6ChHzUG2PY
	Uy3JTajVawQL539R9qKiDWj17c4MXpAmDMFsDpf8EBLfSFtPCn2BrVe965EqJdsskDcn0suDif6oY
	6B7UPlvnPUip0NxTfMLoJmKFb38xz/zjrapbyMUGTbgIOBF6a7wyh701GTDwFxndQ6K7zG4g5Ti1z
	xuWvN0eKT5Z/toG35X4uh+JRlRp1b2tp505V5jheJv8aSGa5qeuG4B1z8BHY33ST2nTL8vViZDGW9
	Tp9E2iFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Csb-0000000DdEY-3fr5;
	Fri, 11 Apr 2025 11:49:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CiD-0000000DbFj-0FDp;
	Fri, 11 Apr 2025 11:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F5B268457;
	Fri, 11 Apr 2025 11:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F5F2C4CEE2;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371500;
	bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P6CMxnS8BDuRFaYErU8Qa+JN/4kOhPtCI1flRn/uOT1MMdQ/9atG8JeXgIQVOC/5q
	 WV0H7IbLa/8qpQKX/Ivm3YpPsCqw8BVtokUAAon5N/cUIntM3n9RPYwgfBmyLhjaQ0
	 np5JIpLxATph7ivI5ifC5eRztqGrFs9fI9RnLHSEMK/byGfi1ZJcr3Nt4WrcZ9kg94
	 RhqJ7EHtKIvmFMrrkTjYA4N13R1QXp/RqC6IgzXi8Bf91xkJexFC5A44aVlwLl3c9c
	 Py4WJMUNdO6JYEFcuURU0f1Rm5w2JV6ctzcZu/3hnllm7/9vAqUXqO1zKbNpjD1g7T
	 C2Wnw0W9rnQOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096BFC36010;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
Date: Fri, 11 Apr 2025 19:38:14 +0800
Message-Id: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACb/+GcC/23OQQqDMBCF4atI1h1JNI5pV71HcZHGiQbUlESkr
 Xj3RqGLQjcD/2I+3soiBUeRXbKVBVpcdH5KgaeMmV5PHYFrU7OCFxUvRQlagq4gUKQZEM9I1V0
 oEpylj0cg656HdmtS2+BHmPtA+mtIfhaK17IQIlccaxDwpsFPXd6mc9Xj4DtncuPH3etdnH14H
 eMWuav/dywSOCQWLSrZorE/ULNt2wfGzFWx6AAAAA==
X-Change-ID: 20250313-a4-a5-reset-6696e5b18e10
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744371498; l=1852;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
 b=PALP2scUtWnW+Qtp1sVaMJtTsv5qeOy3hkGeox/qrj4xg4vrZcvPaP3qvh042yeZALpns1XvE
 2F219edsTEPBnEK4V2DrF9EU7uu/SLOP/T9PwIdGDJQV0Ck0lMRL9jv
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
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
Reply-To: kelvin.zhang@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.

Imported from f20240918074211.8067-1-zelong.dong@amlogic.com

Changes in v6:
- Rebased onto the latest v6.16/arm64-dt.
- Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com

Changes in v5:
- Rebasing on top of the latest upstream changes.
- Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com

Changes in v4:
- Remove the superfluous 'items' in the dt-binding.
- Rebasing due to recent upstream changes.
- Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/

Changes in v3:
- rebase on 'amlogic,t7-reset' patchset
- Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/

Changes in v2:
- remove 'amlogic,t7-reset'
- move 'amlogic,c3-reset' to the other enum list
- move reset node from amlogic-a4-common.dtsi to
  amlogic-a4.dtsi/amlogic-a5.dtsi
- Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/

---
Zelong Dong (3):
      dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      arm64: dts: amlogic: Add A4 Reset Controller
      arm64: dts: amlogic: Add A5 Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
 5 files changed, 218 insertions(+), 8 deletions(-)
---
base-commit: 4bc28af2da876531e5183d25ae807e608c816d18
change-id: 20250313-a4-a5-reset-6696e5b18e10

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



