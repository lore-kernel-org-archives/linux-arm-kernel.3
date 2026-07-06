Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C035C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 02:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3aEXJzDmUsZjafjY+OSFuirzUogA2Bfx5n8zLIJ45Yc=; b=XWdA4jo4MMxb0bJJ3HOt/IPNpA
	ZrTlnjb7zGrgiVKjShxtOr90VvsDSRGxAC2CPJL4rqak+mCDMBdh0g8oLLRU9sLTjSPPlBjgJAtkg
	KyliFJib6w3Jo/KhyqYwWEwy6F+ci3EKiBZ8+Z4kHFG75Pgek8IQzXLvnbveKJabCDAlH/o8c6klQ
	LYsNrCdTU5dlv6Ket7IdcdQFRH4+LBb1oa9oliBJ0eQ4gMpbRK+s8CffznlvIP7FFEljWHyhkjXaX
	S67O0L8A/Nxj3FJ1bpV3oCWmVC/lvQcvX0Ec3CzkDi8Rz0/XuY7L/0WxziC3QGv1dWMpn4WvLdQEr
	TMr3tBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIy-0000000BPmr-2CDc;
	Mon, 06 Jul 2026 02:43:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIx-0000000BPm4-2xUw;
	Mon, 06 Jul 2026 02:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADDA14189B;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8622EC2BCC7;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=LtQLw07yy0in1Im8yRhxFupk2NhIl4F9cJLeOuofyZ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oaxrPozY/bg9tf7g006BIGPFzAKYPf3Ty5Wh0dJMcqtp5SPRXLElX9hWRuAllMq94
	 TWvhuqMw4DYUomNXFhRJziOv+2E4RSoV921/iilbLdR5+M+7/ICqttBq+PnXuLlGDL
	 uQV8jRaGFAFxUtP7eoDbtfBMPRd195AOmJXuKj15anbJzFoFqr07ZJb55kPKSf9gSZ
	 QLVjKb0aLQLq9CPVnipXiuItSG1KtRNYgWPaixVSOhZTyRDPym6IYoextWPCdv9RBd
	 /QjNuFOHMIz2DfHnbnF664V9q92nvDcBeVPyVnNJ+2D8/3BGHEeEesCUcWRp5NGwQ4
	 WIBKVZOuJxk4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629DDC43458;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] ir: support IR for Amlogic A9 SoC
Date: Mon, 06 Jul 2026 02:43:26 +0000
Message-Id: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4WS2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMz3URL3cwiXWNTk7QkI0vzVHNDMyWg2oKi1LTMCrA50bG1tQDQVlp
 rVwAAAA==
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=746;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=LtQLw07yy0in1Im8yRhxFupk2NhIl4F9cJLeOuofyZ0=;
 b=/Jv1oOddNTK/zrH56+nUIuuDihi15maEHeBdgt4LMwTr1GpYa5kLysCF5rmAtJxSt1qxXaLr0
 jxJDyt1+VwgBDYY8iAbRPrrR+FfB14jRVm5q+9ZGsrc2XPmaOwzJ9ck
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the Amlogic A9 IR controller compatible string and
add the IR controller node for the Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
      arm64: dts: amlogic: a9: Add IR controller support

 .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-ir-354fb297e716

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



