Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E86E108B912
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+XTcZCzwF0TtKfCncbcOIU+nvHlBtT+9st5uGOxtvw=; b=p0eQRcJjpBpcxJnQSyDgEvCOn6
	S1J/3Ke66owSBuOP9bSV/t2xREa8D+1vTrbYoVo8EGWTts/M7lNy1IqWIDE0xSNTzGrx7NOeGG545
	McnByG9c0t5o4bkK5n6V+rXNQmHmPUTk7cOWuxS27EpLh5/PIMcjoyMl1MEr8iTxpN7e0yr0GSw+F
	BuB/71s65aGlg+Leedjcd0u0/bFFz8meE8wAdV19AYbAEiyR7KYW8f0ZXfXj1v3Fut5kpdl7DMBdY
	b3Yep8yl+lfuinwXbSGsepu/dkNfz5D4W+J8XiBh23r0oIJ7h8BkLG6okIksm9WKq98EZUt2LOGQO
	fklYZ3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ytj-0000000ClPV-161S;
	Fri, 20 Mar 2026 12:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtP-0000000ClD0-3Lnn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 12:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0+XTcZCzwF0TtKfCncbcOIU+nvHlBtT+9st5uGOxtvw=; b=YF8tzqVUZh6jBz8D4RbP3gFDMU
	EUXDel9BVMq8RYZxXQSma1TQmWBUbICn0DuU1sZqa9w7R4ZYprogbopmqhXQifwNEs+dzSvmZcBI7
	8+WTLvz6b0q6wQpw82dRV+A2q4ahT9+wTz874ktqEnCwtHtQcswl1T9zvuiumg/rQjSBlYUVo/C2O
	0Bm2+2PJzWAqvtxWVbJzP7L/lI6pm8ha5970oKGK++RAfx2XQe5D4gdUTQiZXVT7iK0QPxVWK1UXH
	BRoVCrU7S0BXO77dnzFBban8KT6hGIHhKkY1oOqQEq/xz1NTT8YQNMqCmMvciUq1vCb66+eoCzzOF
	IyKdW6NQ==;
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtM-0000000FVtw-3JEg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:54 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id B7BA213800D7;
	Fri, 20 Mar 2026 08:23:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 20 Mar 2026 08:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009431;
	 x=1774016631; bh=0+XTcZCzwF0TtKfCncbcOIU+nvHlBtT+9st5uGOxtvw=; b=
	L7YQO+vKUVSvmQG3dUs0DDJIkL4dR9yarwmwGnEEnU/uW1miGOKFCC2bUME169c5
	ZnZ34e1XMQx+fZxLA+lG/JJRZOzde4u55hjNmPgO6gdv3wPiUAnJ/ANLhJPLohdS
	kN1HbZYXFCF5y5Gxu8idXD1Dpaz2xCf/3vxXWauprM72EVwZXBrIDVjMvd8MsCqG
	0sE0TD0d5uUGyero7QIsMgBlMMkkPg9Fdsb3WCSzZHS8kAT8H2qSiLjdkG2euLdq
	zvBJQvWt42m+X693c0vfql4/uad2bmza5PI9HZemMf4HBDa8J+TnQRS8mMz5qyYZ
	qI87Czkxr1El5MV6musvzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009431; x=
	1774016631; bh=0+XTcZCzwF0TtKfCncbcOIU+nvHlBtT+9st5uGOxtvw=; b=Y
	5CjvI31qsEIfJ+H8Ex/BtDDX5DjyD+D1SfgiY+co5tn2Op65U+Lh4GsHrfsMkalb
	CBJe7HcODZ/HcF3Z1sc/gbTY+t6UWixWkLIfAGfioOL16+hCsZmCDpIGwNVxy74g
	/kHWX6VQg5P8JlBigVarLkr/f5VPQg48ZNYNWlMzePu2Oa3rX/nLojJWJc4oje7Y
	W5bw0MBBlnFTFzI6j1AOUKuAnigX9aikbBAqbkvXxb+dTKTh+plNNQndusqf9ozc
	OxGjXDs6KroZJ7fwlWQRLAqt8Dc07MCPNSCbgtxIalMWIQnePvM7Yqdj61dHAGyw
	9k5fpO4pwjjdYPs0zBMhw==
X-ME-Sender: <xms:Vzy9aQ99ndZDSei_aQFxZEuVaH3atn4PDvNwIhtRGQ07kuE-YRpmyg>
    <xme:Vzy9admsji2_OJMfAfR-FVX8IHTwN_f6vSRPK4Ge-i0VvuWb14iB1ZzEWoDNytzG5
    zGxpz3yLHGCky5HrHTw75aMwxVNf5gxN2O9Yi8U6MDbgeEhyztBwXw>
X-ME-Received: <xmr:Vzy9aTmfQnOOscMZ602NkixgeYJaGFytol9Mar_KWlLe1wjFqO3BJl0S0VoWyTrh3NIkuy0CEucLf46UZWmPWDwP6PlgkFQ_vnb7wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesgh
    homhhprgdruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-ME-Proxy: <xmx:Vzy9aSjRmTF9LasMcby1b2dnBzLLCSdZ7LZWcv_DIUzx9jxUvsgZAQ>
    <xmx:Vzy9aUVXkG3MqIQUC1l6NowU6qZQyycI5k0rFpcdZ2uEu5e_NVPmOQ>
    <xmx:Vzy9achto2yHTUygd_iaNxF0p7FTFnvxTkNaUHEh4piCNrhivssDEQ>
    <xmx:Vzy9aQ6uVANjYwzYlmC2UGDJQD8mjrJToIuxFlud_35euAMmgSv97w>
    <xmx:Vzy9aWLO_yCy8RP3TSF_BzpA8zTlJ5hHyywJJZn_By3gcPMsTdGL-qqR>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:51 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:25 +0100
Subject: [PATCH 7/9] dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-7-5842e1e393a8@jannau.net>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=zB20SDXo7O420ChiSg6dYfmEMAcZxJETARGKd8sXk3c=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nh4+i283vj+544vVnJsdhZmmczrMM68k7xD4HvQ8d
 5Lrw53CHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbimM/wz2737IqgP8ubtk9o
 WS9/yYq3sH/Bc60nx36vZbW/zKR4cTkjw+ZnLpe7eN/PktyYe/PCUhGFMAeOn84ndFLtn95fP9W
 flQUA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_122353_057613_EA9574D0 
X-CRM114-Status: UNSURE (   8.33  )
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

The PWM controller on the Apple silicon t8122 (M3) SoC is compatible
with the existing driver. Add "apple,t8122-fpwm" as SoC specific
compatible under "apple,s5l-fpwm" used by the driver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index 04519b0c581d0e9fb1ae6aa219a4e850027de6a2..24a71f21c7af0fde4ee6a11e49179b004ba1b9c1 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - apple,t8103-fpwm
           - apple,t8112-fpwm
+          - apple,t8122-fpwm
           - apple,t6000-fpwm
           - apple,t6020-fpwm
       - const: apple,s5l-fpwm

-- 
2.53.0


