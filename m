Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D002C369A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7axsakK9/G4BguKMgY9rTMxm8Hyf4vANR2yj4cYy2E=; b=n+BnWgDpXwZt5l7s39f2m5JDBj
	pqvPj/g53xLuMolQrvnBLGuozDBtbmVnUKb3yf7UyynZ0z2O8Ea2807C77HEybWjCVylAF4+NUoku
	PZ/SPExC50Di2lcWjsz8lXCndWn39uoS/fvJ2nVk6EdeifWA7meiMZwTSFuKffK//WM8sNUuZvpJF
	953fptqpSQ7gNcsPdRiPJb5Aeb5gTJSypZzu051GGYiavz9SQ+4u8STJUQLZ3ASHujM5NGh0y16yk
	vkWxAOUH2+1Eq4leZXmy2tkApAiAWmZHZV/O+D3VwpRdEQBZWK88qPk/B0iZjDYxojjgWF5+jB143
	V59JIC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ChA-0000000DavJ-3UIJ;
	Fri, 11 Apr 2025 11:37:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CY6-0000000DYfs-0yRw;
	Fri, 11 Apr 2025 11:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 448755C6860;
	Fri, 11 Apr 2025 11:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E23D1C4CEE2;
	Fri, 11 Apr 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744370873;
	bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WNr6ltNw2BY0sHq1MEXbDfpkcJB3ZsZwpNZqpAXkzQ1hMqvtakeRDWArF8GGunoxy
	 MKwuWNl02Zas86K7WMmLU6Y6bQFjqGX+Yd3/Ks6WR2v89drDiUkdG8jHG7LxJTPkSr
	 LECl4UU1yJwMPlGIxpQZSjY/DT52AWZpyWhjAGZxmfXM/1cAZOA9kj/QWWecUVlxOD
	 tHH5hskMv4wP6mCuXA37HEZi+rN5GgYc4VayZKtckPqfiWbpz+JDuBZ+1lQKkDESTA
	 GC5lYXkxI7Zik202kACGBz9FfJF01PX64b0KZvBMIWAjD055sV1kLfAOlbABkKe3N1
	 FHFMwqGvSDNBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FDFC36010;
	Fri, 11 Apr 2025 11:27:52 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] Add support for Amlogic A4/A5 Reset
Date: Fri, 11 Apr 2025 19:27:49 +0800
Message-Id: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALX8+GcC/23OQQqDMBCF4atI1h1JNImxq96juEjjRANqJBFpK
 969Ueii0M3Av5iPt5GIwWEk12wjAVcXnZ9SiEtGTK+nDsG1qUlBC0FLVoLmoAUEjLiAlLVE8WA
 KGSXpYw5o3fPU7k1qG/wISx9Qfw1Oa6ZoxQvGckVlBQzeOPipy9t0bnocfOdMbvx4eL2Liw+vc
 9zKD/X/jpUDhcRKKxVvpbE/ULPv+wcXqykJ6AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744370870; l=1852;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
 b=UvsI2+X25bb9TkdbcgOwYDAT2PxYzxtjSaJ6ceqVvvAPGEV/A456/DtsUkl6/nhN7WZkykTRj
 rw5v0oVybmkDGGb3vxSf+ayfi8FBK3c45YiqTr7ouM+jZG5HCf/gata
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_042754_361502_A8B3F0B0 
X-CRM114-Status: UNSURE (   9.04  )
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



