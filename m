Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105BA1125823
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wsNfVZt6GLcKlOBtv1buOE4N+3eK5BD7iSdzAmdz13w=; b=ijLt1s5j0ryvh6toVb12SnNELr
	ezpqPygtp8fdX/yCQRhxp8++wS7t3llfS7GFLCaWxiKSjnYyS7GvOz0eo+lL+JH5CmM/S6gjc7mUJ
	48+/9ABFOuBcLYYJm5wgGdBzBi3QHYPttoaye1vu4H8qkEo2wEN58QY9VRxtXPq/82SexCB3n5Q16
	iB0uOft9AEcBq3AX6BCfWnLd1hNpKLKMdBxLHZ6A7dyiMizWmQSNOoYjdd05z8K9U/4BRw5R6Q1UF
	PsHcw9hc3XgJOEelQp/RBy6nhFN14cOzTDcd36kfoDIMndZ2KDHwGBeqo9BTVw+l0R13SEXBq2pbD
	x2ULX4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0K2s-0000000BfUw-1dLV;
	Wed, 11 Mar 2026 13:56:18 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0K2p-0000000BfUD-069B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 13:56:16 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2ba895adfeaso12185505eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773237374; x=1773842174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsNfVZt6GLcKlOBtv1buOE4N+3eK5BD7iSdzAmdz13w=;
        b=g0BUqBXaxaR2pTV08L8WIr5r4boKgopY0cmcblrryAO/jXMJd3muAwd2VTIIdMCOfC
         6pGb20y9uKW0hLM19kZSMNRRbrluJnKznXgOXFrULmgkO+IJeQBWc4DZPsjUrHdEn/eu
         AL+9iNF1Z5co+IBfyK6dGmCByrCGxQVUsh8CCxzK7x6Wn3HEeL6pxv7Ntv8xV+TK99dR
         o3cOQJEO0R6eFTTK2vMpNb+wVEmybfEN+aMm/AxBEdN5qiIWg6bKiJ/UH4/WQ95me6Ri
         PWPzwRySe6pVtFNUXlAc5sOWQvmEjsY/fIp1alrx3DvoEwuw7MVic2xvPVWC84xhjuOX
         hd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237374; x=1773842174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsNfVZt6GLcKlOBtv1buOE4N+3eK5BD7iSdzAmdz13w=;
        b=MjX8esPdhlJgiKDjSLutRxkYShJRG0qSmLIdGjJ92mcUOy/MbYUkfIvEwrSh+nzO+i
         KnynTmgqMQXFnG9Bf+n7Pm82kvWyukCkFBwtVezLTySP85hylmFju6/TigcdHz2dWEKA
         h5Le1DlqGquw+VoYytu4fUTp814QN4ONB3nUtPwY3eRIQddj+AWKnONNrdKJadFD/qNo
         5T0psr6zAUH7ZQq5Nth/aN2MOIcYC3POi0xwLvBe1F3qU8pakZpvE2whvbjVS8WaNi10
         agJNo6AbayC2dUAy0ENaXhVy6rAcWuotSW754Q4Tz1Lp1nQzBlouEf7VKeLwCd1Smpha
         4ldQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPJQSQvkQD+oGFO3MemZ9ozMYwyg07Z0G3V9dvlFA6IbDlrB4WR38IMvhiQlH7sDFToem9hTMtfMYDZBzc9q7m@lists.infradead.org
X-Gm-Message-State: AOJu0Yy703k5s/Bimnpj240Jy09G+UHf3wGJGGjWoRfTc1Q/y5MDAw+G
	MEAwoV0cou6TZ4CPZd84t7u4enKsPu79FtEtCCPahe32zsoyJXAwfROKqEFe7Q==
X-Gm-Gg: ATEYQzy1kLLwp6SXOozJybMkf/FdkC6ALoZ5JttvAIkj/qgTFTQRddXmdbOp0nz6788
	jo+ZSz99VG25h4B/Phfj7VBczbN5EJ5HeSWz2WcFhwrTkmp6TyhbfnMMD+zjZc0S85EYwayxUDP
	UjqCC/R2NVKV6VdY1ns1GCkC9e4I/KJvj3+hYAGktdEMYQtS91g9WbHEwwHdn7+lPwTNgmBqGSe
	QI61ch5CU4BQPHUMGhr123z1NP5hPs0simvFleaPqqw6x646uP2fyPgtqmI0xiZhKSnVVxkRIyQ
	9yi7QHF5J2SH2kM+q5OoGGR+eqAjiypg0WAMyGhskUp9beLjDclhrr31Y1dEt8xKoTL6kbfUqmg
	odR04IKjjz+qeOnVSg9t/2ahz9VezxR3ABF2/3KmDr63stv0mnbrtWNyiiiLzAC6Bg1p+3tsg23
	NCQztaaVXqUjfnB5wdVj9hWHrlpkZydIDLXOH3+1D9MsVRnrO3L9ZPKADr0om7qGQ37BYNyA==
X-Received: by 2002:a05:7301:1002:b0:2b0:2e5:228b with SMTP id 5a478bee46e88-2be8a5a87e9mr904558eec.33.1773237374035;
        Wed, 11 Mar 2026 06:56:14 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a803:148f:866b:f519:b5db:1242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a8338dasm2608352eec.6.2026.03.11.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:56:13 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk
Date: Wed, 11 Mar 2026 10:56:04 -0300
Message-ID: <20260311135604.21634-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_065615_087825_AC08814B 
X-CRM114-Status: GOOD (  11.79  )
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

From: Fabio Estevam <festevam@nabladev.com>

According to nxp,pca953x.yaml, the pattern for the led names should be:
 "^led-[0-9a-z]+$".

Change it accordingly to fix the following dt-schema warning"

leddimmer@62 (nxp,pca9533): 'led1', 'led2', 'led3', 'led4' do not match any
of the regexes: '^led-[0-9a-z]+$', '^pinctrl-[0-9]+$'

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
index d411fd9811fd..46362e804daf 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
@@ -125,25 +125,25 @@ leddim: leddimmer@62 {
 		compatible = "nxp,pca9533";
 		reg = <0x62>;
 
-		led1 {
+		led-1 {
 			label = "red:user1";
 			linux,default-trigger = "none";
 			type = <PCA9532_TYPE_LED>;
 		};
 
-		led2 {
+		led-2 {
 			label = "green:user2";
 			linux,default-trigger = "none";
 			type = <PCA9532_TYPE_LED>;
 		};
 
-		led3 {
+		led-3 {
 			label = "blue:user3";
 			linux,default-trigger = "none";
 			type = <PCA9532_TYPE_LED>;
 		};
 
-		led4 {
+		led-4 {
 			label = "red:user4";
 			linux,default-trigger = "none";
 			type = <PCA9532_TYPE_LED>;
-- 
2.43.0


