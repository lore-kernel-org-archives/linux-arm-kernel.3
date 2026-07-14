Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=; b=gVkk//qmcUkZGT0jXF6ROST7Rl
	XllohU9vsGjZ7Lb4HtPx7FxyrIJSg80pUKLIbcCL56/q82f0B5iovd4t5YwJGH0pkUJ4xvQaO34Rd
	sY0Ab5AtX/36N1Gs1nRvPLKDMpc/JfE7R4DP+xyGV3IstXjtkJFQmTx5DusHig1VKnRg2oY5YAl0t
	uqa04to0VeEbkVisE4eXJwVHmIiRgJZWmpHOruOY4RSOQjM1qpzHaXIeGWZlkTlScijiO+ryrJTlX
	5lzBci32TiISFdOJhGHuRcT56NK1+hy+UzrqeZ8QUKX0ZrnmdxhOQ06B+tr9W75Yl2x6LBgjY7rUV
	KrPjUVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWdA-0000000B2EJ-1Kg3;
	Tue, 14 Jul 2026 06:28:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWd5-0000000B2CC-2ebn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:28:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so549464a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010511; x=1784615311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=mVCc02ht/gAugaQzqnNW+qtb4+zJkpGmtrSqWEmUIHuzzlTm4yDslZaitbQhoe8F+S
         Mq2ca2RPlYcoEgbO6GQEjpVGZiWLYnFDM7mx+62p2lq3Ec3z4WmAuX4o48vzOgDn2Kw9
         CGkig9h3UDNlMAHM64veLRdCh3rV030ZeZwlNr2dXUSjgxNDtu8JJtsKS0jk5R1MmMjT
         +HmrgR1zm5wqfO1H9KmDOiwIk39grdnoGhfkSGbPo4N3vg2ZJJ+MUS0J6SEy3DGYA/n2
         FVBwaWaB0LFcFIqn5OQHJzjlh6tVFhvnZqDrFVjz+8von7uSqV/IFgwwqLnqxxem5xES
         xzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010511; x=1784615311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=Ygnz401CCsn4/yipjVOwE9eUKr5uiuZxIjPC+t6ohH7FNUdha4qncUel0T0ztrSBxA
         7bmz62HXUPNdUli4nvKpRjf6OhY5uyqb7xpPNwMIGw9KVNH+hijRgbPyil0xcba3OLq+
         QErIVtA41LrYPIjOLvzIsqEg4Lper28m5ktZDeof098O726hpzyPHgpzSJhu9IzDWMIJ
         XpkaaEEd8TWcfv8+EhoDjsX2t+wQ95x+EWlKy1uK9PYcjziNAPEre6KkHmqSuibTHIGd
         tW09+BJqwFZqG8XRVuB8hcNsVWiWXfBupzN38OKmZeBW1X3KDhg1+GAtJZGuXc0ELOAL
         38UQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTth4p6/jmuTrdqV1/YpMKTjO07AGf99cYCLviZxJWprNmUl0B80oFITiUz0FqVAbOWjPf9bA+6oOF8vtlJQ78@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8T98IpsiFKOl9A/wWNPI8fO/g5cNUWNO41n9+yQgzyiVDGNjC
	8+PaZ6xMQBMkwpw0vQiNrMKrRQLCP1P4TaTcHX5hwkZPcbTtS9crsKjN
X-Gm-Gg: AfdE7clDQH9XOU3OlDIZPyOEhV7Bpl44pBP06TYfaevlQ6k0GlKpEpbOQbJ6u0IEM0e
	tDiR/Exr6E3a9YX4RAyEq9QadKnIx3QToHni0b3rt+vO2a9m5RaZoLK8v4ISxn1cxkUG+FaN+U3
	8a8cR3n5gWnSBWOIdy32UCONmWf9DZ13llob4aIIhVktjid9mtqWk+6My2CuvHCIgcihXHbdFgW
	Aid+eY0CGgZE+m5iUjM/Z2uG0AEIMYkWWOYAO25pT0JhyRFtt6bZh6oPs7Xmt7c/PQ7uPJGTv3F
	os/t6Mq6gSm0IvaBcbwt74X+jKyTa+Fmsghmoc115iulEgRgEWssU2NKErpdZ+bevHEfBxeBEWQ
	E4MWA40GcnVO3exL93u3LeHZjSwolUrcFzZbKr1DsjoF+eBzNTwiJoJK6lYxm95mblkwzzwFrX+
	Qb1ZebfxAAZM8mpL3x3n3ImUGKj5vJnQ7bEb7WdtWirjj0cXR5rS2YHQya3brM9fhZH/9aNuDKG
	jmAejlp/D8QrfgPp1J+hbKfNCSLAShGOoryVVgqWaVd9TioTdhK5JEC+IwUQQz2
X-Received: by 2002:a17:90b:3844:b0:38e:2a4:cffc with SMTP id 98e67ed59e1d1-38e02a4d094mr5277080a91.25.1784010510680;
        Mon, 13 Jul 2026 23:28:30 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:09 +1000
Subject: [PATCH v2 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-2-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xl2bVizuPrUwqnm5vVTFz1aO2fPghT+RyF3tqxT9
 jXY+EH1aMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqHboY/ln4Tlm4uKTh/L6Hy0+I3/ldbmWm/1n550GhuILXrmsdqvIY/kq1HT3
 LK7bntejzROGrPOWv1mXFLUuV0bhwbO030d/vRXkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_232831_672831_2BE760E1 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..4d6a0411f086 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -918,6 +918,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0


