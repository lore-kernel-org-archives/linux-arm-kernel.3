Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAE0CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdKVlCj4REX0NWkQYtOCVGuCUyIjtnl9DbGH17gD2u8=; b=5D4MSCrPLUKIyXhRp+Z8TlY4Qz
	UhB+c+daFcX91POM4HYfLOQC+1F+unvJvo4Z/1qyl2EnwJVhgcVke+yu05P5Ysz680XDy1hR/H0hX
	nCLa6PCXywf25kcPYVMCRZArVhgERKmDOl3DqBezph8ZQ2veGC/EF7cNg3HjBkirt+/MTDzitOk6I
	GrM9wihzcJkXjQy6jgFwNaSUjAvL5XaOmJ00Y/ELmEYL8K+OGSKofLzpsQ8jfPenuilQMEC3BJYFM
	1UBz/4f6FHAPKRSyQFAPB0gI2WYfIeyW8SEnIkZPaIfLp5e1dVpSe4/+gOYZuvHUubWJUmzlgY4Hu
	d+n2mv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnc-00000007sXx-0peF;
	Sat, 10 Oct 2026 10:59:36 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnK-00000007s79-0xQC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:16 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b03f23305so424144f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629952; x=1792234752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdKVlCj4REX0NWkQYtOCVGuCUyIjtnl9DbGH17gD2u8=;
        b=N+XTq8e5wCQCnBVrL1AtbU/LVq99iPpQyQZB0tYuzrEwpLIDkRfcOUbQ7ml+IuZ7qB
         P8Tf+1qitKZnDqVEpEnF7bFUi2fLLEkHTzXBUQIvLwNxwFNcTz5voiHD4v5Oz0g0u0YY
         Bt2TLciU+8bR7ZwFGephC6GFuiuNWLnbEpMh/BdK47hGxEYJ01kO+WwoFbaLP6KuvgIw
         kX7MRAg9PDJc9P+4kuWWSTc5zGOpzcU5JV0ievO3hl8Ngc4oF3ERwQV9k3nI44N+NA9R
         RnrMH6TgKSYSkGfe6i2KaCq3zuxmCEEynEbQObPA/nfvkK9hTmbYlsyM7F2WajUPInB2
         Yqng==
X-Forwarded-Encrypted: i=1; AKwUvBz2th4RM8xAL41EfkhmX3EwHaNDdAuMsTrOOgSytzgrisO9Jq7ctXuIY7kK8l87dWbRxb28Q4RF0AuYrLCV9Vph@lists.infradead.org
X-Gm-Message-State: AFq9FYIsxhkY4na3nZSBTuysZfasOjwueviIlD3bX+Zsj4bt2xoaaAS+
	ey6pG17iZUVvWpQZL68u9d1bN/xS2eyPOQ3wefmSGt3314znd7R/RPlU
X-Gm-Gg: AYBFou3nSp1KhPp1FxkRlt2nms0PHD0TPxt7trld4BKnL7IgxoAP8CpuZ9VN4yKz6UN
	6Hk/1FW3KTQbuC/gXJNBQbX1qi7iVOtPQvYwyI3DpFBZkclNMdF3e161nJ68cmX+G0IIcUKzMDt
	yjHdAjPTd84EKr0USnc4vybIpp4tcTajMsTpBfGJUNAYJcpVBDMk20906zLqSso57J8pRze2He2
	nd/KmGonUuSdPTa0B2W8VyucTCPCy8X8U26VEw7BTp8p3I0jT68ZZaQbIwbwyB/GNZDixOO64Mu
	QfDMnr9GPfjl1lC3MV8rPXmK1nfk/KUVdOibkwkRJl6C37G654lJGEpy4YmemQKQsNzhlTdPJNC
	1Lpm681I3nStuk5GOEOv9kPiwmdpbQx8zgkyDqgu9HOh+pJqEKX+dLOBsf0FHCWg2wKeaiqXVc1
	DnE9/Y/B0hGc9WM+ZJKVdwl+YzoPgIqaiTqQ2sw5Ff2rZvYmW5oBCfGBat2yPGWUsHyuzKmJiXu
	T06v4rVZwsBJmndojIig2NRPQOtUV7n8W0=
X-Received: by 2002:a05:6000:2dc5:b0:48b:2a1:dfe3 with SMTP id ffacd0b85a97d-48dbace3b32mr6883381f8f.41.1791629952539;
        Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate who adds the RGMII delays
Date: Sat, 10 Oct 2026 11:59:00 +0100
Message-ID: <20261010105900.247342-9-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035914_343165_26E001B4 
X-CRM114-Status: GOOD (  11.05  )
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

The informative section explains in prose how phy-mode, the delay
properties in the MAC node and the mode handed to the PHY fit together,
and says itself that developers often get this wrong. A reader has to
work through several paragraphs before answering the one question they
usually have: for this phy-mode and these properties, which part adds
which delay.

Add a table that answers it at a glance, with one row for every
combination the properties allow.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..bba27a9feb61 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -339,6 +339,24 @@ additionalProperties: true
 # has added. Failure to remove the delay will result in a
 # non-functioning link.
 #
+# Put together, with the two properties in the MAC node, this is who
+# adds each delay:
+#
+#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
+#   rgmii       -                     -                     PCB trace   PCB trace
+#   rgmii-id    -                     -                     PHY         PHY
+#   rgmii-id    present               -                     MAC         PHY
+#   rgmii-id    -                     present               PHY         MAC
+#   rgmii-id    present               present               MAC         MAC
+#   rgmii-txid  -                     -                     PHY         PCB trace
+#   rgmii-txid  present               -                     MAC         PCB trace
+#   rgmii-rxid  -                     -                     PCB trace   PHY
+#   rgmii-rxid  -                     present               PCB trace   MAC
+#
+# A property for a clock the PCB already delays is not in this table.
+# It is either the fine tuning described next, or a mistake the MAC
+# should report as a fatal error.
+#
 # Sometimes there is a need to fine tune the delays. Often the MAC or
 # PHY can perform this fine tuning. In the MAC node, the Device Tree
 # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
-- 
2.56.0


