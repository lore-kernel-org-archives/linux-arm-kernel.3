Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA2DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d76oW+hJ02vk47g5jJkDC6wrHjePHlmxkDGSNxOrV/c=; b=zeVli727xrqOaOjWBupmZ0GOBz
	2h4LjqnrtaoSCN05SmdoHHjviBu8jBurrPXHCmeb9AfBlDBW0id0u1gFmsUuFluzHHWL2OjksGh0P
	YTXmYRGlIlDFosplvXZ7m1HSHZlHu9OxPunWrWpQnlczggJNEWCRsspSj/9tDFg3rrYxgTHROV7qs
	AHsARvQnRLC/DnJXXDTAMg4AsEe3nfoPnRyTPT1pp/ZSq/IoZX4kQVhfFqxm2xpPsv+lECcfPQGLq
	+JsOiH6DAI5TV6JV/GTlEo6YR3tohgUdDoy2zgCRgsecmo45Ji3/Sxy9EQkL6q98TdT3M5+HF2wHQ
	jnjTCbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBPH-00000001BLJ-115o;
	Thu, 19 Dec 2024 07:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB8r-000000017Zg-2Qfy;
	Thu, 19 Dec 2024 07:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d76oW+hJ02vk47g5jJkDC6wrHjePHlmxkDGSNxOrV/c=; b=gm7Q2R1EaMgIMwzrHPBoe29h+P
	pJDsPKojsghNjaDWS1F8kqSuYScfM5/31XGuOtV6ODJEU3vdSaY7qchWelcroNX62fDExHsmm14Ks
	hKhjmMdhqUSDlatI32w7sSaYWxphpa9vfaNf6G1sHQYLA2FjdCxs8xZy/2HltshqFoVsgL4HgyI+H
	yUmxuz6abo6CsmkWkrB2R20nJPID1UHzXTH1QFMC6dk+TydKI8UoUZfX75lgEqJdQRUpZHzGdz8Mn
	h0b77q++bwu96JKHveL+dCfzCjNsMCgeKnogtcRLDsltJ+W9iLz1CN9+SXpgS87sKHjEtzCSx1cGB
	azssYoKQ==;
Received: from m16.mail.163.com ([117.135.210.5])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB8m-00000005PFm-3oSZ;
	Thu, 19 Dec 2024 07:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=d76oW
	+hJ02vk47g5jJkDC6wrHjePHlmxkDGSNxOrV/c=; b=NaaPeZxn0KtGGJMzX+gWT
	Se2jX4275vxbBsNbaHyztZywpu+ADDha18LYt1KFdsuwyb7znyg5SAXr/202X+C3
	MKkq2hSR2s5eJQH5ww0gpL0duC3BQFAi5RmC8hlcOc4gyPMdKw0VmNjYPFX8yWab
	OOtzRouTvPzAShkbkVfxlA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wBnUtq0zWNnL5jUAA--.6492S10;
	Thu, 19 Dec 2024 15:39:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	daniel@fooishbar.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 8/9] dt-bindings: display: vop2: Add rk3576 support
Date: Thu, 19 Dec 2024 15:39:16 +0800
Message-ID: <20241219073931.3997788-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219073931.3997788-1-andyshrk@163.com>
References: <20241219073931.3997788-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnUtq0zWNnL5jUAA--.6492S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWrKFW5try7CFWkWw17Wrg_yoW8WF1Dpa
	93CF9rXry8GF17X34DGF1rCrs8XFn7Aa13GF4ktw1xtrsxKrsYgw4agrn8Zr45GFyxZaya
	9F4ak34UJ392vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8pnQUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwa6XmdjydhsxwAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_074013_477277_C9DD6979 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Add vop found on rk3576, the main difference between rk3576 and the
previous vop is that each VP has its own interrupt line.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

---

(no changes since v3)

Changes in v3:
- ordered by soc name
- Add description for newly added interrupt

Changes in v2:
- Add dt bindings

 .../bindings/display/rockchip/rockchip-vop2.yaml    | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..a44964b6c36a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +38,14 @@ properties:
       - const: gamma-lut
 
   interrupts:
-    maxItems: 1
-    description:
-      The VOP interrupt is shared by several interrupt sources, such as
-      frame start (VSYNC), line flag and other status interrupts.
+    minItems: 1
+    items:
+      - description:
+          vop system interrupt, such as bus error, and vsync for vop version under
+          rk3576.
+      - description:
+          independent interrupts for each video port, such as vsync and other video
+          port related error interrupts.
 
   # See compatible-specific constraints below.
   clocks:
-- 
2.34.1


