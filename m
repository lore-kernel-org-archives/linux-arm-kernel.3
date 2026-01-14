Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A510D29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HNbLddeBEBUdXpksdIsPFFwZJryhBBxKZgik+02I/4=; b=tc8ojq1zrkf8MRBmY/71xYAz8x
	ubZyF2udzRi3rPMHCGR3yUHHHrxHPAF8wJQtTL4RBGabNjmXY0EbztixpvjWF+CcFdlauhbBKeJ4k
	+sJ2CVIlkjfRVPIfZa71CE1k6igStAiYg9LfOmI55fOQvqvfhjB7W8xtKPR8L7SpZuk7ZIaYKsa66
	LB4UhEaCuVLwsa8KW/Yp9L7pbnWjC53X2KrT68sOuZbYkqVAHkHfwrbWkvRDT9cViRto//1viTZx9
	Oq6a7FP+0FfBop9qiZWkbImk5hdYNGCNI4eWMkmt10gCnmNBIOON3lk+Yenbdyilwt1gqgjnkdpuy
	v8mYywfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyS9-00000008rcF-1BpF;
	Wed, 14 Jan 2026 10:50:17 +0000
Received: from smtpcmd04131.aruba.it ([62.149.158.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyS4-00000008rap-3m3y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:50:15 +0000
Received: from localhost.localdomain ([84.33.84.190])
	by Aruba SMTP with ESMTPSA
	id fyRxvVvSoJWrEfyRyvxLhb; Wed, 14 Jan 2026 11:50:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1768387806; bh=Tp2kTM1nxK1MZ7N8X25iMhek22ei30z6blhLbVoJ9p4=;
	h=From:To:Subject:Date:MIME-Version;
	b=Xs6xUh0RrdSJyo+G8o5b2vtX1OcLRD1+QhzAIQ6176YPw+zQf8MT4CioREd4tuv1v
	 0QglRP7/hIYwFATE4NIyD1/5tmYjKQ80Gc2QVR+s+bF+3NQy5AFTSnSFmZYuIYu5eL
	 /OfrsQV2a5ZQDvSSWPpKVYQKIJetcXBIRQo0XuIPDZPNBbtV3H14GfGpu3LXEhknFM
	 jN0KqH0T2K/OfGAz67U1f01PM3WpfOBTj+iwGcfuoX4IfhY9O6i3mP7Wl1zIQHDT0N
	 7K5Lp951vdkoyhlGAwOkezbTp8aX9U7/rwwuC/Od7kGKcv9wHZ9fPDgkJfi+QzMr3k
	 HQKLhk1HgdsfA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
Date: Wed, 14 Jan 2026 11:50:04 +0100
Message-ID: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfESnHajzFz7aJT3NO8d/z09DRG2jmMYGX1I58cMzmU7yUx/zgykc9ZdBoY89l1BkPw0j2FChfi53eh4NypBoCtXTKnqx/4X1MNj97uvX+Kt0pQDMCAX8
 HzBOS+uqyzfn/fLu8XC6fhsDgR6WhHF5n9hkvgontu1qHehsX8hS/3VMqdPutTNB1YtaI79qtUJ/M7PfDrlva3GUtkocKUAS8Oekp1trdfhkW/mnb/e+wEWs
 w/w8erngrlu7IChPFMxmxWXagFTze3e4rQURHQ6KaeSjA2iHErEH2jrOl0X93Q8hy4lLn+cMp6/WwGSX5M/UemK7sELa6WX9+pofD3OJJZmpDyIqb3lDCvmz
 mVR93LxRCh9PaGo8WCYbDHW4hpe+E1AzrfareecmS5Q7hoZjWDajk1uy8mcjgJlwdecUf0qhXqJvbFIFNvVeWtHxKjCdxtNld1NFDeWSNdc9jzJZ5c3h3tPp
 +pKZJ+kXu4QBkeEJ/Ng/8S2v3ZCMkhRRBsHGClH3lt7fHaSNCDmXIeFsPCXtD2c2I5xu0fHb5PjOeqmkyNZO8tH+TZmi97cSz/2qx6P6Vhk8fij6x1iKkNkA
 DQl5utJFvdDXMbj6eBbcyocM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_025013_393577_8E4103F9 
X-CRM114-Status: UNSURE (   8.24  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
enumeration during boot. When both an SDIO WiFi module (MMC1) and
an SD card (MMC0) are present, the kernel may swap their indices.

Explicitly define mmc* aliases to ensure consistent device naming
and prevent mapping conflicts.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
index 5f44f09c5545..a958400bcd7c 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
@@ -55,6 +55,10 @@ / {
 	#size-cells = <1>;
 
 	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		mmc2 = &mmc2;
+		mmc3 = &mmc3;
 		ethernet0 = &gmac;
 	};
 
-- 
2.47.3


