Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78BFCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARtZiLqVFG10odSxs0F1UZcvVPwzPtzgTFQsIovJ7x8=; b=shhbl9m1LMukVk/sdCvoiEBuM0
	b1rvgSvG/R/HHZmVRuPLPkAilAvVyumHSUdRRfvGGTT/uzXs0SPVDLLmi97N22+qn/3ulVy3jcIJf
	MTRKvstAEjemaE9sH1+VIpqDLWBjIguEn0N7SRY4JP4Xk9szYBUMwSoe0eWjtH//b9V2yP18tG6rf
	cv4/qQQBCakE03VxMbdZJDSRdEuuRNeEEJkFN4U+KZVBgAl998o6S1A0KWz+C+JdlHJORXWp7Uesk
	o2NxqxD+lfGJhH8xqeKqGzmgnlfkIUKw6xsNg0fzs28Cf18cTcuXuhofQ/hwC3/hyKP5KD9NKiTaK
	I7LI6IUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESzz-00000004DoK-01aN;
	Thu, 30 Oct 2025 13:47:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESzw-00000004Dny-1XMi;
	Thu, 30 Oct 2025 13:47:29 +0000
X-UUID: f793692cb59611f0a52f393f94899d25-20251030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ARtZiLqVFG10odSxs0F1UZcvVPwzPtzgTFQsIovJ7x8=;
	b=N9GaLf1caimCT9Ac77hwyktoHn6vjuLR7Kf9Wqo3v1s6i7y1j2vuLcRoXVzb2wLpHWoyu1VezfGLwTexcyN7oFq8Q/nXlP86Uvb0sIpEZemq7eZaYXoz9HvgoeF8SKiqJFeoGMdd0Ul0W2P76vBEYugx1SzOWovToryJIHvK73k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:699d0819-f3ea-42a2-85d6-0c0134bff892,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:4ac8db6a-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f793692cb59611f0a52f393f94899d25-20251030
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1446463326; Thu, 30 Oct 2025 06:47:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 30 Oct 2025 21:47:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 30 Oct 2025 21:47:21 +0800
From: Jack Hsu <jh.hsu@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srini@kernel.org>,
	<ukleinek@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<chunfeng.yun@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<sean.wang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<andrew-ct.chen@mediatek.com>, <lala.lin@mediatek.com>,
	<jitao.shi@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jack Hsu
	<jh.hsu@mediatek.com>
Subject: [PATCH v6 01/11] dt-bindings: arm: Add compatible for MediaTek MT8189
Date: Thu, 30 Oct 2025 21:44:33 +0800
Message-ID: <20251030134541.784011-2-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251030134541.784011-1-jh.hsu@mediatek.com>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_064728_426107_5BFE8115 
X-CRM114-Status: UNSURE (   8.93  )
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

This commit adds dt-binding documentation for the MediaTek MT8189
reference board.

Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 7401c7cfd3ca..5fb30da8762e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -383,6 +383,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8189-evb
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.45.2


