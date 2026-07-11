Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE647C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12wpZl1AXXNIx4mO1A7JN/Th+0erz6iENBmhe4EqJP0=; b=X7TQNiwPGZFvZq62KPPUp/wO71
	Xmm9DQPd6O4iHfM6eFYrIQq9olsYbUV5C3v//g3NX+ah1GrJmiJVZNNNvFv/TNL3EDHDcUF9y5Zf0
	0mZ9EZ7KbPr+lxnwOgZEpVBaWfsKmAQLb3bUbuTGBJ/xkdpVu88TCZT4GU75vJzHFSKZuIWh99A4R
	OQbWnYzR9fGYdLIxojqyReSMq5jtAduFCASxfrPnIwNouKhDpXSTE9+mEiXzHtqAIKgpBArMfuEsk
	VtXAVaxxH0Ca7XnUBJXgmfFSzJuOuN+sBwGQ+2Ox/Wyipqn9tRu8XfG7+iN2aXdPQzG595iwXXDOd
	pQ16Ul6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNi-00000006o1K-2oOA;
	Sat, 11 Jul 2026 19:28:58 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widNd-00000006nyM-1eA1;
	Sat, 11 Jul 2026 19:28:55 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B1AED7A007B;
	Sat, 11 Jul 2026 15:28:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 11 Jul 2026 15:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783798131; x=
	1783884531; bh=12wpZl1AXXNIx4mO1A7JN/Th+0erz6iENBmhe4EqJP0=; b=a
	steMCwk3RVu2mvkfeYa22H2irY7KRdx8lcFLiz5/1iydVl1wFnbhAPr+jUbdonty
	Bu7YPx1emxa7OyqjG94vAJh59saHUue+3neB98gNhUPFzUkTZHYI6fWGNsaQOIHu
	uu7FxH5B+X198b0jBCs08GQfYkt/PrseriCBycWUf048CZLUeqgDcWmEZ00me1zi
	h3Y6jg7FQUOGgD9aJh6dp++qM+5nuxJn0lADZgeTbWArXolJKSJSx8llNMvIlVau
	PNT1Y92YvqLWRnZ6gYeFxwQFPsK8XPxtcymsqC9RpjkY5IxV/6QlPIJk4GvTgigP
	FXqqtmjAY1pkuQ6sWxJ1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783798131; x=1783884531; bh=1
	2wpZl1AXXNIx4mO1A7JN/Th+0erz6iENBmhe4EqJP0=; b=RqvAlEds1RdmoVAym
	IpyON/zEzLm97IlMAOL7i5YE4Q+uQ4eeMeO+zIT3EsXhCByB9av3T3KmxwbQFl3/
	XPoq9a8oMESBfFZW1BmiO/PizpieYe5dC9ZrAaSeNHMJH+PIBnOdAvaJEeWkd6//
	J4mxrIubWVAXUb5myPVlDf3+s2Q/gnIu9OARcKJDEHNRq+zQbadT46JqUumXQCxU
	NKJZbFWecEPibVZjZ2Oxk/QTq0OlXwluw42WuPKn/mliVT5dfSvW1CCW/NrSq1yM
	kzwfv7wjDM9q/4UmOSC1yPDsJr2N1OVtx4VIUVmOKz1ZAXyVVgg4faelpJLghghD
	XXHSA==
X-ME-Sender: <xms:c5lSaivfet8VYgEYo0jVA3LopcKvdyxf0NlXY7lvrFnlpaiTRDmm3w>
    <xme:c5lSat9G4_YOfBXm8mcIF740iRDNLV1EVVGECeiexkcUrjDc2DorjELwj5qfe8eTk
    h2DoGC3IV6gVWUChjzk_KG0S8UKl_RSTzOQ-3wj0GJkNJ94HvsHk10>
X-ME-Received: <xmr:c5lSaryR76BF93Y_TDaWtlQArMAVeulzwMR8ikZpwvSU3xxifIdJWh0v0wZXUJHI7H06s3A8_Eo5y6x2M2aOxmWkFgnF90KZ1eYOHIwqZygVQer_BPo>
X-ME-Proxy-Cause: dmFkZTGNC6QRiLt7NIXGg/qRZFC50QRTSBR3yiaGReXgL5tZ2XlJTNiWr3BlX+yWFvtiEh
    Ggej3m67BiHZnymEek9+m7eb7JhFvSNDZOw2VpzbZP+y2ihrRLZktQ7TFj1OiYwlII60o3
    nMm0gEXKwTtMkDkq80F6u7EgSH1gePGOjT088S6G0+wT1AB9J2YyC1i3z/MvO9areKVgqL
    9u9cbFjUkl+VWHTB81UWMX49asMiBkqlCXH0uuBkxGnZLjhFj/OKygDD9fHX3diD+j3nQR
    zQb8q3Yn8gOSXWwYzJANkCGoIHYRI/L+gcLFFMBmmuntf87Ebfbtm82YBPpiUvbYcM8mJN
    3wwqQDpzFLn+OVXxPZy/NV4rl6zQIt4718N2CODdFML3QkgkPafpOV9lZU+CCogC34oM0R
    0IrhyhBFWPZo4H5WKBPtp04SVo2BGR4xDhzIsIuB/mpQIG/zxbVe9c+j8kVv/F8DUuxUM5
    5jyM39HNupkaA0If6WhKtdtemSP+VNer5gZFS/88ViyxKIlVgYCoX2ksLylP9mHM39xEAI
    YXHJJowSJKwXH4M0c1wS7gfis5cw+gifEkVFlVsnn29DQKgPc/ffGK/w7NOp+To/yWvVpA
    sMX7FL5f/Ss2xbRaRq2Rkt3RJ/OeS0scmK9ruaiGOzW55wxv540yYS+5TuSA
X-ME-Proxy: <xmx:c5lSav9A6jEWpOTr718d-6bDaJcOJT3VaMDffL0i4rK1KWlPVin-Zw>
    <xmx:c5lSapOpJD4G330GxNNtbg_uW5mrg4swZBNKyWJLJXJwaHf6cQiR-A>
    <xmx:c5lSavo4QNE95LV72yqrMDC8n2DP-CBl_KhnEGlhxS58BWZsRudMEA>
    <xmx:c5lSag4seOVAp4PTQ82cE--QkswmeK67AM-iSg1TGvkrR3u0lnyAiQ>
    <xmx:c5lSaqvabtEQmrssTanLTS8KWwB4fBh70xKmGjpYGgpW19RBX20eCLlL>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Date: Sat, 11 Jul 2026 14:28:26 -0500
Message-ID: <20260711192842.845048-3-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_122853_484759_6C47B075 
X-CRM114-Status: UNSURE (   7.64  )
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

Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
computers.

Link: https://cn.techvision.com.cn/ [1]
Link: https://www.techvision.com.cn/ [2]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..2355505013a0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1662,6 +1662,8 @@ patternProperties:
     description: Technologic Systems
   "^techstar,.*":
     description: Shenzhen Techstar Electronics Co., Ltd.
+  "^techvision,.*":
+    description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
   "^teejet,.*":
-- 
2.54.0


