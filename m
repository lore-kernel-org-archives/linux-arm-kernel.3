Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E89108B912
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KytEPja3IuZXZELlpY9baRDFVTxYpRDBduUOWw1Wc5Y=; b=R+VHPGZbfTuY1dW6V6NaQsf7sM
	fCnfBcICZeyHCVc6TJsneXionq5/6Pj2n/JJkgWA4+dSvdXTeXf2X/6MpLl41Gc5puFNgV5C81FrQ
	SUt/jJyJoYrpXrdHBU28rsbX/wd2LDmR2X4pvsNAVr99zRMzdlVxl7mDiiE5OvULPJCzZ8YHDlLvb
	bfRY0W0CywnOMZCPAvVeRv4msUVxdA2N11r71gIxTfFKa6OITMnfXXsBmizDx0YN1oSm+HhDDP0kC
	eCq7SEJjA2Sqtn5wKZ5p3b47cQcBCi851Xd+cu8gPbVw2EVlj44zokr7w/vr87WXonceR42dQBbKM
	SEo66bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtO-0000000ClCc-3OoQ;
	Fri, 20 Mar 2026 12:23:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtM-0000000ClA9-0esS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 12:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KytEPja3IuZXZELlpY9baRDFVTxYpRDBduUOWw1Wc5Y=; b=TS1Puktk8IarLMza0FvNUiZCIk
	sCjeKYxoeZhlLbNKGsRIXIDWeHz71WqyET6YokUPwA+NVJr9bTpikRDmLHpdywdQYmDY2VoVPoCbv
	zDypgAaZ13gZU4jZhIuvL7oF1W3oO4DeCRx8+cz+89ntCOZ7c3ksnHkvOg9ecLxlYbtdbsuDDueEz
	a/45BiDZiIJ5SMGYFPkpBSrj2+ImZ11pZgFSQhejfOP+KNAThMxJvxNtmfXjuuogNDj9Z/aiLC4wT
	bDHcu8NYqUWHOXqBZTYU7toFlh0BoTWtg7nixjtI9ntH7Z2K/86oxR6dsnfAPRC+Ga1eyvOyVfgL3
	56hBGUnw==;
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtJ-0000000FVt2-0us3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 3E8BF13800E9;
	Fri, 20 Mar 2026 08:23:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 20 Mar 2026 08:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009428;
	 x=1774016628; bh=KytEPja3IuZXZELlpY9baRDFVTxYpRDBduUOWw1Wc5Y=; b=
	aSNMdqtcQiaGNn9G5WA88m8IXFpCQH/wbfpJKjjS7tyGkLLgKrWfhhSfAe4Ps2jy
	Etsh4eIRdcjNP5UWch1I/1cAq7bgHqNrhlsEZSLMg2TGF7RqgDBdAC7zFhILKyb+
	GRLGfd/1cwDhyXQb+g9942DC4OV+MC/+EOvD2mMIrLyYbqqPWh/383m0SINxPGz1
	5m+LwOBuJPlDE8QGtnoVMZx1ufmvPEXgZ2xpXWqJLMLQAkhRsNxQIMe5uaNghqPa
	iQ0rhPSzU2Fz3/QnVrqnJWUGx/Sq//mvbw62DF7yaZMlo0VeApQFH97VXKgdYm2F
	QPzblOYykpdCzClQ60m3+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009428; x=
	1774016628; bh=KytEPja3IuZXZELlpY9baRDFVTxYpRDBduUOWw1Wc5Y=; b=Y
	OhuGUzdb1bMJmxZWY6VfwVeZ6gFOJXzkvmD8vuAPxISEoidV1bLlsPJgVcLETk9P
	hG3Hc0dBOYo1aFV7DZvZkejb/Mj2C5pQzPM32OJ3Odsm0bRnUY3U2lOpRjd1HXgu
	i9P7S8Y2E2KqG72cYMiBdGJJIkjjFOo8zpgZvlEfQzWCOOEdfvzCkYz07lfMsXSw
	HOnFTnAYWENf1y/MX3DLd827DrE9KDY2ZS4ofDXljPgzuJYt3YiO3t8xc2PgPc9t
	R86RYU7iGiQYSLsBtIH/SY93g9rVb/qhO2ctyA8nNk24tt2uDjmpjzzo3etpeRqM
	KWOtcoKJwDNTcuSiaoQqg==
X-ME-Sender: <xms:VDy9aaCYtmX49AMlbSgWphAuZNy4YqmKZ-WsRBjWVI0qrU412SBWmQ>
    <xme:VDy9aZavr9HHK2h8sVwIwTPdmtDZV8zFF0qpl4ePMhLPOiGtSdRrB_yAV77QRWcWJ
    D-h2cKTkFC7tBVAvs9QGaAT_Fo7XZYBcTlcAzNNcjR-ipJR8_MLn09i>
X-ME-Received: <xmr:VDy9abKXAmrxZnJz2ifo5XdCn62zD6hQ1jgkZbF6qq_AVEe5fP4Ha1MRzrwlQESYmFd_62CwrnK4GDIf2PwDcLYFl4IioaLk5ShO0A>
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
X-ME-Proxy: <xmx:VDy9aa1SH7h5dNgeZ-hM3oYHajBDffNSOklNd7Uop20mRECWCZRRIg>
    <xmx:VDy9aeb6YWPBro_oe5HzReb-pKvTNmvCHN4lFcK6OOQzstmO-kxdvw>
    <xmx:VDy9aVW_VOa6252qc6HxdLRtC8vCzLl9Qjw8Diy5y0HZNlTNv_p6EA>
    <xmx:VDy9aRcVFZdxgBaHXFSZ5dZmOLLt_GrE4-KpJHVqjuQGmv1kVMQU6w>
    <xmx:VDy9aXuz5kzEytXpLKZgi-wdTZTF_Kk4y0RvejRnsQ-i2--NETznm0RA>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:47 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:23 +0100
Subject: [PATCH 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-5-5842e1e393a8@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=CRqwtHlpqFRC4nilq/tn1g3vvR4xjr6yUypxPRc2YY8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nu59ggF+ljVNDQyaLFMmV1eZcfJPnsj9/dDOKAbfU
 tYJxZkdpSwMYlwMsmKKLEnaLzsYVtcoxtQ+CIOZw8oEMoSBi1MAJjK3jpGhNfJrzz6GTdenm15y
 Mcn7GX24cx3PiQ9Twn8evZ0uNLe7leEP97TsS6cm53afmb5lfeG+R1X3a6WyjLoDHyjZ73R71if
 JAQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_122349_517530_1C30288E 
X-CRM114-Status: GOOD (  10.18  )
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

The pin controller on the Apple silicon t8122 (M3) SoC is compatible
with the existing driver. Add "apple,t8122-pinctrl" as SoC specific
compatible under "apple,t8103-pinctrl" used by the driver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 665ec79a69f1db1020668c68ecbb7e215cb7cb28..41073176bc691bb1b284037f9ccfe2d036160e71 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,7 +18,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-pinctrl
+          - enum:
+              - apple,t6020-pinctrl
+              - apple,t8122-pinctrl
           - const: apple,t8103-pinctrl
       - items:
           # Do not add additional SoC to this list.

-- 
2.53.0


