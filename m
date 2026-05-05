Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B78FCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhzpA8NsTz/+V0K0dsPsaOESAJ4FZBxYUWkuaahgCkI=; b=qpt25KtaNjPG58GI17dHR66L0T
	nxTBn8SuNcnhDUDRU4MWyvMntIOPRfUsgXReSrpUqDgiK7qcL8WNqlpaEdEb+LGtNUP/qIDc0WOGY
	y7oT2r3fHwzlut0JcTVeuXdH5pcQctIh7tFvSqBLzoJmQpwFCmmUXZjwoytdXE7ydpX31WJYjR0dg
	imqYAMJ9h1M6loWyKT/a4926v8nYgEaGefSNGfoykMiGI6OqKwTeVxyRhSPtPYPvJr/dtGbq7pFDf
	gtbGoMv/x2Yld4zwqgX0Wt+qVmgad/W3uHWgeVPnJraYfQYvZNwVpS+wdfGGAkK5CV+uD15bt0Lyl
	Pn2KJJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYX-0000000FyXi-3bZ7;
	Tue, 05 May 2026 11:03:13 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYU-0000000FyVn-3LQU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:03:11 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 333B61D00022;
	Tue,  5 May 2026 07:03:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 05 May 2026 07:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1777978989;
	 x=1778065389; bh=DhzpA8NsTz/+V0K0dsPsaOESAJ4FZBxYUWkuaahgCkI=; b=
	lW+u5u4TeF5ZhTQaxueWiedehr1vi1V3vRq10SebhhwinomEqswq9G1yuxGPZ6Z7
	B+Okjo9sNEDBei+2Me2WSyATiNL1rdbqJDQtwObl1fUPx+Y50tFtMbXNxbElAH4z
	3+Sih3gY363ee5SgN7ud/J8Sq5EGBwOj+3lt/lIEVslDX82BsW+Nvk/5ljn2SnmL
	WBEQJfBsW+3Z2p+wfJ1lKFg8i9FU7Tn9hM4bz+9U3uwdjcBvp8ASrQ3y+/P0aWKA
	Q4lIUpOmQmn/bTyIVG0BSgNkJc4kyeeE1q4IVT30mS436XuR2I6PyFW1/AoUtwRN
	QpXZp/PiObVNVRprAAAQZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777978989; x=
	1778065389; bh=DhzpA8NsTz/+V0K0dsPsaOESAJ4FZBxYUWkuaahgCkI=; b=i
	4mAUx7okU7dp0HDFw0KPqnesE7oWVs6JXNeIFoBjR3x/WhLnaf5+4PyJKZffyCkI
	sUQc6SvuNqj5KnlCAfjQi+hCof78USQxK4j2XSJioBAXOTcGgthp+0tOYERMcy3C
	jXNiJx2FEWODWKK3OO5jQkel1PtiaImVHZOBJ+qXIXDXZoXgBGKtooBcDSg+lKNb
	wPQfn/Yw9sBQO4mOK6I0msk3iErTtpSGCCG2WoneZ05DdeqZFc8DON0ZufMuRUbR
	6MetVqaGN+pQsa3C3mu1cr3ebDsDy3VrMdmmVXDzIq9RcgU6xVIsXB+ToDQJyKuP
	KTtQIV64yhYpFFNPQUb5w==
X-ME-Sender: <xms:bM75aeNx___wO381oahd9yN_J2-2ab1rL1rZSkVpDPeHaozC86ftzA>
    <xme:bM75aR1HK9QcPJsgQkldeY4WXR87DbwPNNA1E7CPgpvv35FJTxO39LhvX8ddxj3ky
    E6pZupiW6lfz1a6vSzJAP7r70VfSHzjyRXxAXROeLsjTypMBdywMA>
X-ME-Received: <xmr:bM75ad2dWSBKq2_4fMdqie0dNPyzSh9jgx3roUYPVj45qgJNAF_o3efv-kw3Ekv3BLlblyvtqlLEJf6vaKcQvF3Kda3Btau8fhBEpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeif
    ihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehukhhlvghinh
    gvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhg
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhpvghishgrtghhsehusg
    hunhhtuhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepkh
    hriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bM75af8TvFN1fbrKA31_gmji2eTDSzlToIyzEcm448Q73YGLWFo-HQ>
    <xmx:bc75aZaEMzuE9mwQ0_cd6LUjH1pxoNmPT47mbpEiH8q9tgx3MsAezg>
    <xmx:bc75aewhyR_7XlhG9FU5U3x__jvYd2X7jKiXXao0ZFf9tf7wWGgixg>
    <xmx:bc75aX8yGaYxY4QnS-YqrSYmSOslQWqL2gcjvrCicwI8KoNA_mS-Pg>
    <xmx:bc75ae_GUxUZubNy6763FllROpJ46WMls8W6lFEDMeq3GH_UzKbIZkGI>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 07:03:08 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Tue, 05 May 2026 13:02:41 +0200
Subject: [PATCH v2 3/6] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=tqRDD38M1lfDTOrUhWfFbq/m1TiGBjjHF1HjCcLG/DA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyf5+KNNssk5tqdm+bXf909ZJX/P6NnHM/CH64KvPX2x
 I+JkUzuHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACby+wkjw+ybXLN9/At+fxZw
 sBWKnCS7Vcnt0x6XL/Y/f8zp/SVbxsHI8J5lxv1rd82d8hqad4lLHdkVq7Fpbcd/70WyVXocc2w
 t+AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040310_889287_B83795DD 
X-CRM114-Status: UNSURE (   9.40  )
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

The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
"apple,t8103-wdt" used by the driver.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 05602678c070..845b5e8b5abc 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,7 +16,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-wdt
+          - enum:
+              - apple,t6020-wdt
+              - apple,t8122-wdt
           - const: apple,t8103-wdt
       - items:
           - enum:

-- 
2.54.0


