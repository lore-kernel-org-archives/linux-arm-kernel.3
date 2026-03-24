Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012F9E9A75A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNCimm8lH9Nrd7S3bDMk3xh5Mpeyo9AVVd49TpvZ0+U=; b=w8qaIqLiYQoVynM6auoMNkdyqF
	29JuJUKx/mVJm4vB9tXU8TpudBHrNatTM1Zp3i7frMnPmd1e6MA5alUHYnd4NPYhjMiJto3GyTqjI
	BKt6jTYn4g6YO9k1licN0xqOoIVSY4ayH9NgJiJ7Moc2qK2ugHnvHHKbw+FrVFY1LR9gGl/zQoTmy
	580ZvDSYTXHp7PninYtu96PmoSXA08UyPYwsVzVu130y+3SSQvW/zxot4aGbBvVNVS1KzCtep0HO3
	+X/mi6ED2/QGZzL8YmcwuWQiP3XP0AnziCOH53wrhSc7wywSQWESunwU4KGGjD8H9wUdiU58ZQHE0
	Z9A9ROqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yeD-00000001Axf-0qiP;
	Tue, 24 Mar 2026 10:06:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ye6-00000001AuF-2Ktj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tNCimm8lH9Nrd7S3bDMk3xh5Mpeyo9AVVd49TpvZ0+U=; b=eqYYP+b/qK4tA94P9WJPWHW9tP
	j6cFfPGVoVTPfzTJP9T6B5f5x207aeF1LWNdobuh0k4rf9v2LVyB0LPV/f5dEoR5j9yzGSOt+FQWX
	uxqou2VWkTHtUdXBHX/DUd3FG8WJuoJr515XfareNkQ+MUDtn0CFaTbBWRsk2F+kqZRXCpbebcEGS
	TQ+sAKL/deq7lPhVemu7Ji3YR8eoP8/z3Eq2xYKbggmUjz4c3foCo8qf4o6Pmwy+5UBxaU3aN2/tp
	BHRLTcQn66EDvy2v2MfyjPKENP1XckCo4btANKkgseF2zEWmdXnJUxpuwn6h/NFHrJU0Sx+ISHvAb
	EVFVrPuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58192 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w4ydu-000000001lY-3fSG;
	Tue, 24 Mar 2026 10:05:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w4ydt-0000000Dlph-3WvI;
	Tue, 24 Mar 2026 10:05:45 +0000
In-Reply-To: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
References: <acJh4z3pRKkeaFbR@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next 2/2] dt-bindings: remove unimplemented AXI snps,kbbe
 snps,mb and snps,rb
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w4ydt-0000000Dlph-3WvI@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 10:05:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_030558_597255_D9A69809 
X-CRM114-Status: UNSURE (   9.18  )
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

Remove the AXI snps,kbbe snps,mb and snps,rb properties as they have
not been used, and although the driver parses these, the code hasn't
ever used the parsed result. This parsing has now been removed.

These were introduced by commit afea03656add ("stmmac: rework DMA bus
setting and introduce new platform AXI structure").

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../devicetree/bindings/net/snps,dwmac.yaml    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 98ebb6276bc6..6d4afd824418 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -203,11 +203,8 @@ title: Synopsys DesignWare MAC
         * snps,xit_frm, unlock on WoL
         * snps,wr_osr_lmt, max write outstanding req. limit
         * snps,rd_osr_lmt, max read outstanding req. limit
-        * snps,kbbe, do not cross 1KiB boundary.
         * snps,blen, this is a vector of supported burst length.
         * snps,fb, fixed-burst
-        * snps,mb, mixed-burst
-        * snps,rb, rebuild INCRx Burst
 
   snps,mtl-rx-config:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -587,11 +584,6 @@ title: Synopsys DesignWare MAC
         description:
           max read outstanding req. limit
 
-      snps,kbbe:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          do not cross 1KiB boundary.
-
       snps,blen:
         $ref: /schemas/types.yaml#/definitions/uint32-array
         description:
@@ -604,16 +596,6 @@ title: Synopsys DesignWare MAC
         description:
           fixed-burst
 
-      snps,mb:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          mixed-burst
-
-      snps,rb:
-        $ref: /schemas/types.yaml#/definitions/flag
-        description:
-          rebuild INCRx Burst
-
 required:
   - compatible
   - reg
-- 
2.47.3


