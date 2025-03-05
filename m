Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE41FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=269eB92Zh628MNJCM52kh3rm3jqKab65WtkMi4ciLr8=; b=dvoLaGXSGCpdceft6TY0xY1MQC
	ep8kymFL2AwYAgUjIibcvXsJLzXewz/ObaxJRrQ6fg24aIQcAWJ1oWAf1rer06ORMAhEz2fKE625j
	SNq56fHeMJGy9HbeY9W5wz/mn+NqV2TzQzIy2PguMDk8uTgQCYohKgjPfcV8/X7UkdGTtZSIEkG02
	Dkc5tvJ0j6ot7ay8lK085rebUZHlMBJHq9uMkHODlZQkz3E6th+wlrqI8tB+IdTK+qXa2vjV7NUan
	a7/Mt5jOfFnBRw9quNSzP1IgOW569ixX7lclicZbuIqTAt62oYrVnjZxFr2yWm/AYrGjEgmaILAwo
	HQKEScgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvrQ-00000009I4B-1TEF;
	Wed, 05 Mar 2025 21:01:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKO-00000009D3U-1e8l
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=269eB92Zh628MNJCM52kh3rm3jqKab65WtkMi4ciLr8=; b=EzAXITFpgx+/6Wmcsa1npGbNVV
	k/QGd8WujhU4C+3UpY5qzzkkOrFlnnptj+QhOdYrK/dogPb3F6s7EkTtDiT3cvXB5MUDd60PBM25k
	6vthISwVN9ng/rfLVzrPobqdzmpCs/LlFcSc7hHfC2AiuPEh11e2kvybcw5j4iU1e7GH76XyGYNnG
	tSnKuAclqsmM2htBGCFLgpbhf/gm2+riKzE9Gelxtiy5pRALJqlw6thg1A9yvBmeVks54P609TnuM
	kw/Mr9YsDQNZVJR2RC7bx6crWpbI9kCaxrAPwX0iptmQoo5yFFa1iaZ9EqmsBr812M9uQDMA8+KtA
	Q2rPoRRw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKL-00000006AOm-1uqz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F050A5C6C82;
	Wed,  5 Mar 2025 20:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D6E3C4CED1;
	Wed,  5 Mar 2025 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741206405;
	bh=8E+3xH59dDROB5c3GU/aubd3iREoSWnjGigCSx4ihgE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VKfLCn6L35d6obE04hcyNUYD1d0aHnyfGf1dD8AGlfrjr3H2KtjPJW+GqJc4Y92HP
	 abGidKCSR0VbLg92GWvcEGsRj82iQ0f06yv3WTZPkTke8rkgP1ZBWR9yJ2iKUlB79u
	 RJ0HUWkF17Bb7V/d+fArlIv8BuSLRr8ZpZb2R5FpvZXizK/6y2LJVJ06hL9B45wWFV
	 fzh4NjqmewJHm113rnjfRkq1DmjN5Elx9YDBn5Ss4J3nCjk7ijjvXqbvhFpYQVH/Ga
	 MtTC+KjgfjkLZC8B6DSXz8vzu+VgtD+/e0KY5CbxgeahgIyXGAwdzXMEwUVlw1ImrD
	 fDdkYLlKMlO2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BAAC19F32;
	Wed,  5 Mar 2025 20:26:45 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/3] Driver for Apple SPMI controller
Date: Wed, 05 Mar 2025 21:26:38 +0100
Message-Id: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6zyGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMT3eKC3ExdsxTjZCOTJEsDI/NEJaDSgqLUtMwKsDHRsbW1ALrV2CV
 WAAAA
X-Change-ID: 20250304-spmi-6d3c24b9027a
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Jean-Francois Bortolotti <jeff@borto.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741206403; l=1097;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=8E+3xH59dDROB5c3GU/aubd3iREoSWnjGigCSx4ihgE=;
 b=PmX2ocAv2/wmZWwOa7PoAda03TXHEAuwalZF0jKdkBwLtysNdwYu6vpAOeJoqo6qSgKCsiyFu
 dL5biE8Eb4kDz8D6c/YaFIvRRJxlrmw76vbnrwiBSysdEqu9kqEX0k2
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202649_625913_86BB9E87 
X-CRM114-Status: UNSURE (   8.36  )
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
Jean-Francois Bortolotti (1):
      spmi: add a spmi driver for Apple SoC

Sasha Finkelstein (2):
      dt-bindings: spmi: Add Apple SPMI controller
      arm64: dts: apple: Add SPMI controller nodes

 .../devicetree/bindings/spmi/apple,spmi.yaml       |  56 +++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   8 +
 drivers/spmi/Kconfig                               |   8 +
 drivers/spmi/Makefile                              |   1 +
 drivers/spmi/spmi-apple-controller.c               | 176 +++++++++++++++++++++
 8 files changed, 266 insertions(+)
---
base-commit: 48a5eed9ad584315c30ed35204510536235ce402
change-id: 20250304-spmi-6d3c24b9027a



