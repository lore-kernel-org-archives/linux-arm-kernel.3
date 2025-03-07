Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35667C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4pj4MqqlMK2cpfIYYxzWZwYk1+fSYyjsb5/f2RCqtH0=; b=yQ1lYPWRfJURB8wjmew8lBcX+3
	4HuXvXaZk/KyNtL89pbJ51Ml0ZywqGgH3ZqAabIWO/M1EbegHDWZrZt3ZRKITw2RrqrPZLbB6C0IT
	w9LqlcKEgm7HIjSC3XQ1Nezs+JBh1uxS/ghbL9Pi+eDhNeiwYDuf4B4qWLDL37DuehNaEdl8gbb4o
	HOEoSzu/xNwJouEDCHpT0lZ3i9CO4/hYO4xGUrECwA5h2ov0b8KMPtyqVbv2cImWX6hIQhv6JMxFz
	oihEEcYrLB16mZr5IySsHs5XWoShkhCM6yQkiW89e0tIcyJcYE7iZz1R9KdeemXchFdUveJh7cBmD
	gOkedg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqe5X-0000000FSs9-2McP;
	Fri, 07 Mar 2025 20:14:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqe0E-0000000FRkX-2Ljl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27ABDA451F8;
	Fri,  7 Mar 2025 20:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47474C4CED1;
	Fri,  7 Mar 2025 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741378141;
	bh=DSewne/+knY+TMcgAfoQ8NfYE734FckrFWzIFoRfRT8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oaZfOA1saAwNtpvwrriZDOItHNIelASijxAaEKGCW4c8ztl5dA4I1LzCIgRGpK+Pw
	 VYeQkIktaZyHhEcZ/DZZh3MNQVzaUJ7nUtncX23TjTDrF7GVvLpEsidqboYXQnAUTw
	 v2OHxw8QQ90Wwcnnb2dyJQR7voC81quz7iFi3RARai7CepO6BYDqU/LSYaKY+JQRSm
	 X/TIsT3kIXimWeEq4ueEmOIjlGyu15ce6y9weMofKTNtrikn7JKKX8bCJJq5TPPzMH
	 xV4ZS8cqS5qDVvUq6fkn/ok/m/j6K61KAZwIWx5h9ndR2xFuXMN7Nqq8MLiVjOuemC
	 1V5xNu27MA0gQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7A1C28B23;
	Fri,  7 Mar 2025 20:09:01 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Driver for the Apple SPMI controller
Date: Fri, 07 Mar 2025 21:08:58 +0100
Message-Id: <20250307-spmi-v2-0-eccdb06afb99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpSy2cC/zXMQQ7CIBCF4as0sxYz0FLFlfcwXSCFdhIpDRiia
 bi7WOPyf3n5Nkg2kk1waTaINlOisNQQhwbMrJfJMhprg0AhscWOpdUT68fWiO6uUJw01OsaraP
 XztyG2jOlZ4jvXc38u/4B+QMyZ8iMOjvZc6eVctfJa3ocTfAwlFI+MGHpcpgAAAA=
X-Change-ID: 20250304-spmi-6d3c24b9027a
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Jean-Francois Bortolotti <jeff@borto.fr>, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741378140; l=1309;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=DSewne/+knY+TMcgAfoQ8NfYE734FckrFWzIFoRfRT8=;
 b=ZuJIMgk3Tp5NZsN5L8gVH2bMl8CdDnA3XDCtr9+Lez5tfbuwwKqRP9YqQVjOubumjPPttNy5I
 rsrw5smJggjA3cF4u9rrGXG2MXyD4UHIxRQQyB6mtGVDFvR4uBfDjtS
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_120902_771480_23D0AE8D 
X-CRM114-Status: UNSURE (   9.74  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds support for the SPMI controller persent in most
Apple SoCs. The drivers for the attached PMU and subdevices will be in
further patch series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- Removed redundant error prints
- Various style fixes
- Better explanation of why the driver is needed
- Link to v1: https://lore.kernel.org/r/20250305-spmi-v1-0-c98f561fa99f@gmail.com

---
Jean-Francois Bortolotti (1):
      spmi: add a spmi driver for Apple SoC

Sasha Finkelstein (2):
      dt-bindings: spmi: Add Apple SPMI controller
      arm64: dts: apple: Add SPMI controller nodes

 .../devicetree/bindings/spmi/apple,spmi.yaml       |  49 ++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   7 +
 drivers/spmi/Kconfig                               |   8 +
 drivers/spmi/Makefile                              |   1 +
 drivers/spmi/spmi-apple-controller.c               | 178 +++++++++++++++++++++
 8 files changed, 260 insertions(+)
---
base-commit: 48a5eed9ad584315c30ed35204510536235ce402
change-id: 20250304-spmi-6d3c24b9027a



