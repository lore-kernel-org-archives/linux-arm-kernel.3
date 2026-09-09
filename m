Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0599FC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVuSuDkbcLo2nrL7c49vzKSJxK5juVwpJ9vjvZLXfyA=; b=jhksDmYgRz17P8XLUbjCV6qswY
	sNJ+JshS7e4Rdu+Yc60t/n2xVmNWIA/pJC7KAJEfgccBTL/H7xhqyC9Ma1H6QW32IATWmp+tDvjw/
	AMI7Q60TveO0FcjPFoZ8G6FMwKH/DtMOVY8WDepjdfznoNovZQ1fXxub4hmsij2TmdkJLSTd9vfbG
	p8DDah9zK5MUUMP+bzaBsv/TNfW7vd4ja0L/2KrIy+0fzVn7zrNhxZfCVuHOo2YC50cdXxRgW21Xr
	tjTf9XFFc5zenKudkUEAPzD5DQcYX+XF0ho8rA/HByqcN7iVGeRG98a2MADYDNJOcs7+bfXv6G2MT
	GVhLs4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FX0-0000000BQ9P-0K3z;
	Wed, 09 Sep 2026 10:27:54 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWk-0000000BPwK-3KRY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:39 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 096F41D00081;
	Wed,  9 Sep 2026 06:27:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 06:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949657;
	 x=1789036057; bh=FVuSuDkbcLo2nrL7c49vzKSJxK5juVwpJ9vjvZLXfyA=; b=
	HHHtG6b0tgBzYWbizNpgD4ao7lbS2z4NxR4emVazjm9tP0lorj251H6bD2Zj9tax
	tdPVNX+cNgnKd5r2zp/mxBCC/PJ86HetxLyucpQKSO0e9Y/Vwd4Briuhn2Ohe8qZ
	HaYr7xrtKaMbsJgbAn4pqCxiQPtLeF8sQ6wWHc013+mhJ/2ijWUqAtkn7c+0ZxNR
	CMCisOmt7YV8Cp0Rr3clWOV+PHwaVddlmPQLgmYfhaVglgUWfNnOCZ+e1twdFM2d
	uktEtnCW2NTcHUkPTTCZG5tn662wsSMtoKvxhZ6uQwBYuIR+vd2mvV55Cg0r6ZV9
	cTpHW6yfyykQH2EUEUGz5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949657; x=
	1789036057; bh=FVuSuDkbcLo2nrL7c49vzKSJxK5juVwpJ9vjvZLXfyA=; b=I
	1Ml7Jn80AZFHh/XYSnriIlhP1e/vXZsA8cocM76ygFpt/xdRmgWZv3vELQcEKSSf
	zIDQ5bgyEh15crEIlLqVwnaah5GHLjCqW2bNlJ4UCqyy4i1HDWeVOrw9FAL3pSIZ
	mecgPzw7HFD+alZWluKsCK0fSiGU01a19ozE4pM0CkO2bjHmgLKfe5rmeJD+XLjO
	jHM2igAG3RUie4l6fn4LIHUOLgxwTid88MthCH2mYdrIqySIAK5EDBU92Uwr25EF
	+7Eej7URnHn0j1jsvpWD+d0XjMCfmzgu6mWggtvlJiqZTh0xRKdIKYhZLPvOKZEm
	1ivKuyr41Bt1lxYeMx2zg==
X-ME-Sender: <xms:mTShauCNHAUCevMixBrbmldpgW8lPDzejRyGAtbuEXPqKwjHiYDiSQ>
    <xme:mTShagu5kaHzQz2rdlrct2c0hG-4pmEHzn-fEcvEovpROeNq5AFiHpEhHsNXR2-qL
    y4GACTBA_gIj1PEvidxBlTy9OWXl53BgNxXoOWZeMyhESrviDYtPuU4>
X-ME-Received: <xmr:mTShatJt6mBqGoI6Ob0oqnhHO5A4mWIO26LqRSdJpXYzu9-lm0HCOk7aIBgcMjStpRGR1Z61gpob7DovONu4wxXFuVLJCFPgT6kVvQ>
X-ME-Proxy-Cause: dmFkZTESry9O/DPGKe0VZV6GxKkpthVVgrSgQusifTMlX7/k4FmmR6JoX50yJgJEvkYX2z
    CHfDcHGOklHamKt0x434he/uqWpXBqTGuHAQccODIQsInwl4DARBkTt78fIMraLs1+mpmI
    gK3HK4DF3fMdJIkGYwWoIlL7b0TcU88RezOQk6aH2u2DUkvIm376c4Gcng6HKagr2g/4oy
    o6pMOtYyvZCZxjwOi28nN5RZFIsXR9v+DDcXlt0VuM//1gcusssrXm8JsyhzugG4ZlPwTF
    GO8UZJEkbKavlsZDolduW0Y35QI6ft+zZ538PCvD4tvmP6zy2twexC+T6jns9oe9fFkMan
    LtrMEgppTnS6KijZ6XYpnG5fpqRlFKdtgeoTFUQxUMQ1IDY9rygpxnH6RYxG257yaiiDdy
    8/gLO4GEVw3DLKRMn/ihnIJLmNls0O7WVqSoU5ZB5zCqj0yfG5GolDafSmTh/8m/U7ySJ2
    dxzvGYfCcqDGfnBYRDToy/69kfVDHSN1mYltRZ+nKZbG5pJmIQX2ygqtlOgtK20JARoUmB
    UDt2Xif/gtpMPQXhE28UXfl5RNmR1Vff+8GiR+06eurjqTOa9W4xgfqxt/2Cq4Q2nachyV
    1PjThDUHkkDXRWj/Undhh3SOytzSWNCMFVu47VAuE0KmQjR4IVzYiI3QmICQ
X-ME-Proxy: <xmx:mTShanb0i55VmNLTMJRKRIpibalWX-ahjfnZjJKVksLeq91m7ivIuA>
    <xmx:mTShavBdT-dkRhDOEbU3V_Pm6cge0HooZiYe82mYL4NlMeQqxBYqzg>
    <xmx:mTShahZyVXvd-cA6Yid1MVrRcBF5vtBcoF1q_YiyOQWgmcKOG2Efqg>
    <xmx:mTShanly9FdeF4lj3QfqRsrwPWEi86mAE8H3UeqVnyFxQOIBMW4B7w>
    <xmx:mTShatishXaNdXvgw0OE-tsC__K1v7pM7tPf-RnmJaaXfZzP6i8SzjXq>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:37 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:09 +0200
Subject: [PATCH 13/13] arm64: dts: apple: t8122: Break overly long lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-13-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=MrCR3BmWhzwr+YcFGXbLhtspoY+ApeHuFbWI/IZkWCg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJlXzpFLuez1wOnhzwiyn55OSds5hZ/xyLPjt6SdTb
 kx4+1U+uaOUhUGMi0FWTJElSftlB8PqGsWY2gdhMHNYmUCGMHBxCsBEYswZ/lkpLeGT1nJiWL+4
 Mnzq0rm8M65/2K1/O06w7pe+F59JugEjw0rBV9otJvY8/uaxvf05pk5zZ7y2PnC5+jnntOgDLe6
 6bAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032738_908474_98AF0911 
X-CRM114-Status: UNSURE (   9.16  )
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

Fixes "[line-length] line exceeds 80 columns (N)" dt-style-check issue
with N > 84.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 5e79de6fece8..1b4a67172332 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -341,7 +341,8 @@ i2c4_pins: i2c4-pins {
 		};
 
 		pmgr: power-management@2d0700000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0xd0700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -394,7 +395,8 @@ pinctrl_nub: pinctrl@2e41f0000 {
 		};
 
 		pmgr_mini: power-management@2e4280000 {
-			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			compatible = "apple,t8122-pmgr", "apple,t8103-pmgr",
+				     "syscon", "simple-mfd";
 			reg = <0x2 0xe4280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.55.0


