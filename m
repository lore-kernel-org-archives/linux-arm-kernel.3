Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53230C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WTEXeWFLxJONZ5/F7cyDKF2AxkZLThGq3o1qGGNRXwQ=; b=bXImIHFF3TeraC5n36eMJAZt5J
	DxZ+HkcsHMtwAlFlL1qB0sLqRzrZvdH5AQBzwt40jx1Cmo2ljoO52LJCO8hCPtN0acdLfVFJhSjU3
	yApxHLdmXU7N/sCRVDUd82PIqUgX66/lbfStRK7aLuccmzZPYuwlTJz7Frkq+CTP2oLNeLTLV4ct0
	6JPOwoSpiBJPPh5UZlxo5sj3IQQ0xXtqJqloLg948L5dcACU/putlF6dzajOgBunCuXcrtDV7CXzy
	Knti2AMlG8QmJ5s38P0b6NBU3vH7i03KKa9WxzUfTCq2/476idYy2eWFYviiyN8ngWG7HHThj/vgY
	ywEfPxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLFH-00000009mLz-1OzB;
	Thu, 17 Jul 2025 09:49:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4d-00000009kWZ-2CIy;
	Thu, 17 Jul 2025 09:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF9FA5C63E4;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80E5EC4CEE3;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752745122;
	bh=SSrptMa19AA/XTd/MCF/BLG2gYrgYjh0sTQ0u3DDHqU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UwPkftbrO7iMGO5OaH1JvZV0nI6Hq3UFTYB6bCrA5HJMoJhq9yiSWIbMxsvMNvKN+
	 foJ/V+IDZiy51TF0vN0fMk7pDuSSYEjcRLlmchjfApOGG83UEk3mt3mHCRHWJl10t5
	 hCFZAuK6UPv9mtsso20Gi1dryQC7qW2mW7kNOVYFp0RReZEksOUgloT3fDU3tnzEQ8
	 C25n+ZsO/IGz3AZvI15+jAeea/iAW9oCJk/G+N/DQEJJyi76LIDDA0M1icnx8fbRqm
	 7yMzL1Go89NN/AE1Y7CbWj7nB1+acnG8lUpZcfqVHffc0DstEEZwVmc2KY2igFGJyh
	 QFOgTE636FgEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7B4C83F22;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] rtc: add amlogic C3 RTC node
Date: Thu, 17 Jul 2025 17:38:36 +0800
Message-Id: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJzEeGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3aKSZN1kY928/JRU3aQkcwtTS4sUS8MkYyWgjoKi1LTMCrBp0bG
 1tQD5coUqXQAAAA==
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745121; l=635;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SSrptMa19AA/XTd/MCF/BLG2gYrgYjh0sTQ0u3DDHqU=;
 b=1Jqgf8NPSE7AO66ZMlpxMqW+iQaU9ydrgRT4qpUFi1Uv4UGyEUcAN6agdhwHQqm9FqRSysslV
 k2tboqtelnLAnleh9ywMSUYZjh+K/q1JBXMPnZy73WrgbjpraPQhO18
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_023843_617611_9870F050 
X-CRM114-Status: UNSURE (   5.59  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add C3 rtc compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: rtc: amlogic,a4-rtc: Add compatible string for C3
      arm64: dts: amlogic: C3: Add RTC controller node

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml          | 11 ++++++++---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi              | 16 ++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
change-id: 20250717-rtc-c3-node-bb78598d91b3

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



