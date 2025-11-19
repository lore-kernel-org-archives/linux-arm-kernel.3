Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B3CCF256B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/XRIn0H1AG4nuUhyTwht3z9K/FpoOLrpMMRmMzDin1I=; b=fPPzYUGQ6TbsF5KCGCgmSEBIjJ
	aW0e+WUIymfRbM2iSORtFXequ1tcV4ZZ/KXWD0+fK2f3+MLpGPnnjXw6tTf9pKtvZxt+zFJuMiqOA
	piEQABElhzl4HURGsa4fhCnvbkKzjiYTodrSnihmyo35oaw/+25I2LEZFakvTYHrKaZ6qodYnK2//
	GQhvonUN99LvyaiiJDB73Kh/jxGIenFTEaL0V31SE9lAIg6vFrxvUaJuFHchFyo2LMzyQMK/bc6v8
	OCOsZxKqNWwK8tIW+6kr4nxLHxmWvRHWrKobppVvwyvSDy2tRaFX4MyXsshu8gI9B6nV6Wna00FAX
	ZxKWjfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeOl-00000002rKr-2MWT;
	Wed, 19 Nov 2025 09:22:47 +0000
Received: from buffalo.birch.relay.mailchannels.net ([23.83.209.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLeOj-00000002rKG-1KsK;
	Wed, 19 Nov 2025 09:22:46 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1BCAA822C12;
	Wed, 19 Nov 2025 09:22:43 +0000 (UTC)
Received: from fr-int-smtpout11.hostinger.io (100-96-202-146.trex-nlb.outbound.svc.cluster.local [100.96.202.146])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 37E1C822ACA;
	Wed, 19 Nov 2025 09:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763544162;
	b=J3XQZKS8ojSeJrb4xnBPhHETz4n14fbsQAQcphsJtN3ZUd36jdQUmdi2mQUk4Zhai+paGH
	X1p0gpqSoxDHHo59KO7iLGOjNKnb95L269vWQRp9iLMf7eu3vJvuB8m96hmb94ZDJ5QRrQ
	fiU9QDi2kjQTPZbg3/ve5jHYy4HhVzlCozd9QZiwwL+g9GAGb0z8xMsHsJaKG0/bmRgsMW
	QN0ZlCrmyVjcn3uvJLONlOwiQ8fX84FFeNHIZRsxedq/4r8IIZoRvj8Iwg577DlG6Abo8n
	RNO5nJ0sGJO2fruRr3f9aWkTirPuPxUfSWopt/6lHhRgIB+NmXBPft1XxKeBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763544162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=/XRIn0H1AG4nuUhyTwht3z9K/FpoOLrpMMRmMzDin1I=;
	b=6IvWQnzz8oPDiJelyyvy3SIm9t6eJ8x//GezT3Hvn/+ENpUWB4z7dnzvaBImziR9DpRLQM
	qTMWlOiEA1p74tYAtMraiUHflAofXNsZKcDWhDdlckb5yAJHC31guhrVHM1TfBABcshkOP
	sVzvXUGi86BIXLa4d44TT7FPHoH3J5T0Nm1GNU2omtejjB+Y/+BNMh9jYU9g6IseyevDg/
	Z2ujCWLUd57M/J8c9nIWvyenXxTldct5tLp4NKkMCEAnL/IC/76I48MivdcqpQarxBRLZ9
	dHJRfTraQuyKUgx8t9YuE1r8QP/wXcxDqX+l9dA/iGoypNGu9Zfnp0ilbAdPGQ==
ARC-Authentication-Results: i=1;
	rspamd-55b59744f-wcs4q;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Madly-Scare: 4d0057c4265dbeaa_1763544162929_2054756046
X-MC-Loop-Signature: 1763544162929:4277995882
X-MC-Ingress-Time: 1763544162928
Received: from fr-int-smtpout11.hostinger.io (fr-int-smtpout11.hostinger.io
 [148.222.54.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.202.146 (trex/7.1.3);
	Wed, 19 Nov 2025 09:22:42 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:b1d7:54a0:7227:532f])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dBGGk6FBJz13PR;
	Wed, 19 Nov 2025 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763544159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/XRIn0H1AG4nuUhyTwht3z9K/FpoOLrpMMRmMzDin1I=;
	b=Zyic3By8uTIiypEDvyl5z+3KuZRWv91cjx9MI+So9IUx389W51PzhM+U73Y8GdkfpEFs3w
	ELKVcZRAsMXYuL1e8j5YVGaojgluUfgioPntVM+oAmhs6B8V4KcYaUpFETVINc/bwjTcFg
	tQqlA33F0HAkqqfGE4hYWPcX9UDRcUJT/5QqQnYLbkzsV7EvlK7ZpHdokkbzaBevo/G3n4
	7p5qwlSS2mMhR1YcrRw8s1Nv1PuS9YKiHNNGffQAdPPMrXHJ+O6qtpNvvnthOm7ANs1ecM
	QYCdpqKHnrSXsqWQh7ob91R8ntOpVmK2+h2S5d3Uymd+zcPEKVQjYn5OUY76AQ==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] dt-bindings: arm: rockchip: merge Asus Tinker and Tinker S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-merge-tinker-bindings-v1-1-4072b55750c1@rootcommit.com>
X-B4-Tracking: v=1; b=H4sIAFKMHWkC/x2MQQqAMAzAviI9O7AykfkV8aCum0Ws0okI4t8dH
 hNIHkikTAm64gGlixPvkgHLAuZllEiGfWaoq7pBRGc20ixPlpXUTCyeJSYTrJuqxrcYyEJuD6X
 A9//th/f9AIrpDwhnAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Wed, 19 Nov 2025 09:22:38 +0000 (UTC)
X-CM-Envelope: MS4xfOepRoEoSwH0tzVB+fQnJfXqumpnchZw7lejyHH785m0GvmpEsgenW78oaoQrooB4wC82wj2Pc04rse61YdUplgEIi0yz8pzFwCwvnfUEM9J5UtqPM1k cw3yQBB88/mIBf8Dukja5QlwqBBzd7SI/RmP4qmXfyYc853V3UJmJqrpotKKjVx3gFkWtRLI5aUPwcsm83vE3lGcGACXwPE/rVrYbLUcLIOhyVY29gt1LY+G YQR+aff7ME7DNiGIeBwrdT3XIk70+YNMIFdxUh4AI+FTE6wJ7+TzrIuTSMwN3CPThvIKX2eUk7TLG1eb92P3xJWFk3e00Psr52EdbzijRfpXv3Y7DuAb8RlM yXOd5HRSDLw7vTZchMqcPDRWF1TVebqNwetSRLhukx63gpd/YO3yYyzgCeQkdbrYE3wPE2kMPG3ReTNR2uEA97N3hbtAEwtcKttFi9kj4QAkFSB4BJIEpWmg RJ38fD1nZcOXPufJhBNSB1koU0k20QeSHHN6ifPL5sx1KwS/mmRe01faDTKCjIGErg3SLfhIHw+gj8Rpawf81+GWkFApo36vE9x/XTzXBMaTaj+tHnYj/oDN RE8=
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=691d8c5f a=XDzs+g99WxkrRRq8F21x+A==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=Ewf7oWgYWxBXnD_q6CkA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_012245_587464_196F11BE 
X-CRM114-Status: UNSURE (   7.83  )
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

Merge sections for Asus Tinker Board and Asus Tinker Board S.

Asus Tinker Board S (Storage) is just a variant of Tinker Board
with an added eMMC chip.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..784089f1e245 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -78,12 +78,9 @@ properties:
 
       - description: Asus Tinker board
         items:
-          - const: asus,rk3288-tinker
-          - const: rockchip,rk3288
-
-      - description: Asus Tinker board S
-        items:
-          - const: asus,rk3288-tinker-s
+          - enum:
+              - asus,rk3288-tinker
+              - asus,rk3288-tinker-s
           - const: rockchip,rk3288
 
       - description: Beelink A1

---
base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb
change-id: 20251119-merge-tinker-bindings-f49b05d71fe4

Best regards,
-- 
Michael Opdenacker <michael.opdenacker@rootcommit.com>


