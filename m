Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B337EC44508
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HT0w/putCrcF9fgjTiKM9hbHJ8TA4TV5raMT1otrA20=; b=KBVs829mqj/7favzUjHd6DnqX7
	HNQ/1FnEUu8Meupo+lI8W31Q24BpuU79BKnxHlGeE20cbBl6trn2+gze7udETpwka1J0DXUy5p6tP
	+H8vIJ9vGYPBlpEPyhLD8jzN9rmYx5ChcEBQQXZR92WWmca03FnkKrejGc3iA5VXAV56rbqltXrNI
	sMTrz4LzKkh6mV0r4hSb/R/jt/RA8h8krnuaWdI6AV6CiWviA2vv8TKqCrp+DQzn1lMPmVkPwDosA
	BrjxNJgYI3ZEC/PMS9yi7JJ5tsjLZ5/bZpD0r3E7xQaThJ+n+GDkefTfvleyo+MClQJmSlvBL4HgI
	VGSeAz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfTW-00000000uCD-1ppS;
	Thu, 09 Jul 2026 03:30:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfTU-00000000uBJ-45By;
	Thu, 09 Jul 2026 03:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E82E43591;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 068E4C2BCB7;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783567855;
	bh=DE7C/zNl5gEB4hBwdkFVQx0tCjdrOH14tJ548l6Whgs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=q1+obGiEnuN7wUSOpMX2tudk8SMFsltTcqukKI6HTlelOf39NQ5kdpQ5fXos78SnH
	 DHfRxymQYPlaQmEXi3jzKPouqxfikLdaU1spfthIMErtkjMOObV9+hcE8ywqEUafm9
	 001L+UNGjMPZVRSnAjhs4IwOwbqGNNUW2xSptqApHSC0KZ+eiBudd6L+BMHPLLWHZg
	 fs2JzGFN49eoc8v10lPM6ADPyBr5/dLVXZPd7uAKwxWbl/bI8C5LuNoGq7Bg1YxKMF
	 HO848IK5P+D4T9PXoQw5wXGNBKxzOzjcx/I0PNoJD3FrpyZ/GjahN8t9CYlnVP+Z1N
	 Q9dP0XyCCpAAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9358C43458;
	Thu,  9 Jul 2026 03:30:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] ir: support IR for Amlogic A9 SoC
Date: Thu, 09 Jul 2026 03:30:50 +0000
Message-Id: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsVT2oC/13MQQ7CIBCF4as0s3YMYIXWlfcwXSAO7SS2NGCIp
 uHuYpcu/5eXb4NEkSnBpdkgUubEYamhDg24yS4jIT9qgxJKCyM02h454unc+rvqDRmpoX7XSJ7
 fu3Mbak+cXiF+djbL3/ovZIkCWy865WxnrZdXOz/DyO7owgxDKeUL4w6ssZwAAAA=
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783567853; l=950;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=DE7C/zNl5gEB4hBwdkFVQx0tCjdrOH14tJ548l6Whgs=;
 b=HLP9Sp5lnUznfoFvgIElGMxBs7e0paxwl3xkQp+ZKBqWNjbybe2egF5mwLYtHyuZANSu7nv47
 MFN+vto0MWRCzuHuNqUrzP5ln3Bb88vslsNThxYKfbrzg6mSYrbcyeL
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
Changes in v2:
- Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
- Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com

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



