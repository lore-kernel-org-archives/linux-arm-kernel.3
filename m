Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C8DC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 00:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZUXMNcRaFccOHGXJAtzvOhY3KPfU9h03JHKSiT1W12E=; b=A81HODeKhZX8WY
	SU+w9LtFmbHikay84Q7m0lY+PB12qw5124FTEVkmpQPaiDnnARouY1n5Ym96j6UX1Bze64SpwPWFC
	bw+bxVjpD7XiSCOl9RyvuZ9WQpqUBYOy+jWmZGTgMIctlXeZr3xH8LeOztbxBz6THO083Bamm6yto
	2v5udBtQZSO78JDbSvthSIIQqYgUZEIowHT/vE9PU7hZvpu72FOR5Df/HEpnP36bHKQzR1ZOqUilV
	MiBGF46SZ4jEtW4AcZiz04AZR7M3l/Tzl0l8yq5cRdL5zOjxL24rTd5nEu25X6J2gN6+05LtWJ64n
	7qPLMs9hiw+BaH1bxEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugBPz-0000000DMzW-2mW7;
	Mon, 28 Jul 2025 00:08:39 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugBKx-0000000DMbk-2TZg;
	Mon, 28 Jul 2025 00:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753661002;
	bh=6vrdKbRCJyD0LWK2qqYSjBdh3A5KmFbKK1liI2Tilsg=;
	h=From:Subject:Date:To:Cc:From;
	b=nF/faPlYmOW9P4rXXebpd4UiERUFYUKTcuMP20DkSADBd1mygtip0xkInPMNaEeee
	 1k+RHG5LWt4AjSfA5GC7UFwBaM6sREQcmxLRT6HDrFWMadlc29A8/QqcA5K60QMmQH
	 D8slGaMTDNg+K98EEshxgXaq8AmuEvgsoL56FKG+EdbdhbaDnkgQnqPda5ECXhHpqp
	 9aJqRiZfpFSHV34B7PwcVyFQpWibx1egtsvdnCFMqBu0XroZAfPfxPpuDKCUPizeji
	 6l7+UUiHINCv5/11YuCULFv69MjQgNH8rB9eTLqgji2sOQXsFBUSpcNPxRtkFqLqVi
	 VO9EMh2Kqp+Dw==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:6c1:3a28:af02:372c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 4D05827E434;
	Mon, 28 Jul 2025 00:03:22 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Subject: [PATCH v4 0/2] Add Support for LinkStar H68K board: ARM64 and
 RK3568: dts and dt-bindings.
Date: Sun, 27 Jul 2025 20:03:18 -0400
Message-Id: <20250727-linkstarpatch_v4_6-16-rc1-v4-0-0dfa7aa06ec9@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEa+hmgC/x3MQQqEMAxA0atI1hOIpVacq8ggtUYNDlVSEUG8u
 8XlW/x/QWIVTvAtLlA+JMkaM+yngDD7ODHKkA2GTEW1cfiXuKTd6+b3MHeH7RyWDjWUyLYnCr5
 vBjKQ+015lPN9t7/7fgDAEerjawAAAA==
X-Change-ID: 20250726-linkstarpatch_v4_6-16-rc1-e4b00cab9d02
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753661001; l=3848;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=6vrdKbRCJyD0LWK2qqYSjBdh3A5KmFbKK1liI2Tilsg=;
 b=K9rdSoH2lM/WDBF63+iwo/GNOV02v80drHgJXnKwGNTfndU8uB0Zx5Pb/uIPc222liiTcqwaN
 04bt8KnLApyCKWSSpa1IQKaF0wFWrnAoiHERkggzUT4fBtahoRYTO7o
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_170327_852593_EDA34F1E 
X-CRM114-Status: GOOD (  13.48  )
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

Provide support for the Seeed LinkStar H68K-1432v1, previously
unsupported in mainline Linux kernel. It is a compact single board
travel router with the following features:

  - Rockchip rk3568 SoC;
  - Four Gib RAM;
  - Four ethernet ports:
    -  Two 1 GigE ports;
    -  Two 2.5 GigE ports (RTL8125);
    
  - Ethernet ports support Precision Time Protocol (PTP IEEE 1588);
  
  - Four USB ports:
    - Three USB 3.0 ports;
    - Two USB 2.0 ports;
    
  - Integrated WiFi:
    - MediaTek MT7921e
    
  - Audio and video outputs:
    - HDMI;
    - Headphone;
    
  - eMMC (32 Gib) and microSD storage;
  - Real-time clock (rk809)
  - Powered by:
    - USB Type-C;
    - Barrel connector (DC 12-24v);
    
These patches:
  - Create a devicetree for the board;
  - Add a (dtb) Makefile entry for the board;
  - Add the board to dt-bindings;

v4:
  - Responsive to comments received from  Krzysztof Kozlowski <krzk+dt@kernel.org>
    - https://lore.kernel.org/all/20250725-muskox-of-authentic-gaiety-b8eda4@kuoka/
    - https://lore.kernel.org/all/20250725-nocturnal-messy-cicada-dbcc10@kuoka/
    - /* (Thank you Krzysztof!) */
    
  - Changes made are:
    - Clarified the base commit working from;
    - Base patched against:
      - Commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 (tag: v6.16-rc1);
	
    - Revised commit message for devicetree to be clearer, contain
      more details about the hardware, and be more succinct;

    - Revised commit message for devicetree binding to be clearer, contain
      more details about the hardware, and be more succinct;
  
v3:
  Responsive to comments received from:
  - Chukun Pan <amadeus@jmu.edu.cn>
  - Krzysztof Kozlowski <krzk+dt@kernel.org>
  - Rob Herring <robh@kernel.org>
  - Heiko Stuebner <heiko@sntech.de>

   /* (Thank you all!) */

  Those changes are:
     - Removed copyright line of <amadeus@jmu.edu.cn> per their request;
     - Fixed indentations;
     - Replaced space indentations with tabs;
     - Packaging this patch set together properly using b4, fixing the threading;
     - Clarifying versioning and Changelog;

v2: (https://lore.kernel.org/all/20250721201137.233166-1-xunil@tahomasoft.com/)
  Responding to comments received from Heiko Stuebner <heiko@sntech.de> 

  Those changes are:

     - Splits the single commit into two, one for the yaml binding,
       and the other for the board devicetree plus Makefile addition;

     - Adds other recipients needed from get_maintainer.pl --nol and --nom;
     
     - Uses git send-email to send the patches, to avoid adding line
       breaks from the MUA;

     - Changes comment style to conform with style guide;
     - Removes several unneeded comments from the devicetree;
     - Changes LED naming scheme with more standard nomenclature;
     - Changes naming of regulators, prepending 'regulator', such as:
        ~ from: vcc12v_dcin: vcc12v-dcin {}
        ~ to:   vcc12v_dcin: regulator-vcc12v-dcin {}

     - Removes unneeded tx_delay/rx_delay from rgmii-id
        
v1: (https://lore.kernel.org/all/20250718075058.243a5619.xunil@tahomasoft.com/)
  - Initial patch to provide support for Seeed LinkStar H68K

Signed-off-by: Erik Beck <xunil@tahomasoft.com>

---
Erik Beck (2):
      dt-bindings: arm: rockchip: add LinkStar-H68k-1432v1
      arm64: dts: rockchip: add LinkStar-H68k-1432v1

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/rk3568-linkstar-h68k-1432v1.dts   | 740 +++++++++++++++++++++
 3 files changed, 746 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250726-linkstarpatch_v4_6-16-rc1-e4b00cab9d02

Best regards,
-- 
Erik Beck <xunil@tahomasoft.com>


