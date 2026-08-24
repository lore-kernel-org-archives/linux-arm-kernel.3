Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A370C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEqNGNEN3QI8hqb6DA/beDgL/pDDkQRhTHMi91Qgs5M=; b=AFwSM8zaDoDAF3rpU1zzIoqCjE
	Uw5TthOLpDlZ/7ZEj3df+nq6pQxDo9E5pSCHzI/OMbf7sve3OZ2+i3TV39UUzbDHtyM356cJzDO96
	yh+0WsWsmq/9gIxrMebMzu7cNnq0jB51W5AyXfHPFeBmpM3kdmadlH/wMzCHL+9WAQ0fae9ew/7Bi
	h+cf3pQueghzkACqeDIai5qe5yQGwePIClvrAO3/7DyODLk6UjK4SrvclRMjHNlHgtI+WEzZW19EQ
	tu/DcSSd/Z3v746wdaYraTigM0fKTtBB640Pfgy9bawMMQMiL+bmCr4S+Nse+6CKfYKvQDZtKFcC1
	0UgfM9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySU9-0000000GRxY-3YVj;
	Mon, 24 Aug 2026 11:05:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySTz-0000000GRt2-0Zoo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:04:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so6349335a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1787569489; x=1788174289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEqNGNEN3QI8hqb6DA/beDgL/pDDkQRhTHMi91Qgs5M=;
        b=G1zk8aO3F1JY5Ni9yPM1GdkLL7LqVLbvubLjmHUg4DbnVrFqUgT7kBTSwnlPCMG2DW
         axHhokSaZGtYK5SPvrRdsX1ott7TMY7yDE1T7u6l/y/p+W5t0SXdGKjW0ymxHjy6sRIt
         fY21qtr+SHjBfxFQ7DzQnRjVm//va0YdUO8QTvtw0JvfTE/Obe2kwFa3s+CqZnQeN0ar
         A1LZ+txAQ4fO6x16ZnhQdTvIgLaXesDFKpUiStFWorOAS+YRQT2qjty9Hk6uQYEND/LV
         aEVGr4XtZ6bOQXt/qa4HCOJu2dwTSwDYRThxJ5PfVqZDL59tUXasXcLo9AFg93s/DcW5
         4seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787569489; x=1788174289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEqNGNEN3QI8hqb6DA/beDgL/pDDkQRhTHMi91Qgs5M=;
        b=mDZZd7AL6Th8novlRvFdT6qlj1kvITo6jgCmY4L0C0S8EErms3jlgYfilczRqmXYzh
         i4Lom67FoY2bd79/r4djZ0S2RvLAj+kU1phkkaH3fvOADXlbcjvMs+3BkpCyfSID0Ttx
         33lfturbahBbNdqYfPLlXokNHKnU9kLpYQFTJpp+8Kh22ytgTnrUdRi53i3d4qsBhHtB
         CRFanPV2/M3CyPhA5oPJPa633OAF5maiw4702kNp4uonJUynGqevYFhUJ+ydx5SMXrXS
         XbvOGry0/+oh3tAAS0gGbLcO2bG2fLREyNM0x/EGjkZQT6PtxncHv08ZZj54fnpx7Ekk
         FwmA==
X-Forwarded-Encrypted: i=1; AHgh+RrEirVvTxpf17CrLIddXJUMrutndxYBKGj3Y8Riw2dKDOP1j5gDbsutwmJJNThtNtc7TxCa0S7zk+IzT+52HIV0@lists.infradead.org
X-Gm-Message-State: AFuF++kK/W/qWnE+t9LdPtFrSlZOlpC6bI38cJ3j1yL8mQKfBXUu1vXq
	ihphtOP8adfBDm5OCK3N4EAxLfd51Q6XH1FFg8T3sG6J7y30zp3RBsTJoLS110sfffs=
X-Gm-Gg: AR+sD133rvs8Pg5gPy2WH7BtR+84S52ihxyU6b5qXEbEpRK4WqwhkO7Oe8u6sQF515U
	XxmNTBq9yCd0Ok9ZkqqvA9r6S6YaQLN/a2c5+oJsyi7rt5+J0AcEuoAIi/ZjCQxr1g4uUPTknTg
	W8kbgGSx9vIX7tlG0+Y2B3rPGAhgW07r/UKHSwzh9CdB3M2lCnk7Kre+Ja6PYfR0ewDjzp5yLMz
	H+l4yGC5PXgr8n90DbwaJOztHHPL9qDmeaFEQfsdvc2nnTsXtPmor9t6rbG0Ok46I6At7xSrLp2
	V0RHqf+YiPiPp6X3+O4mnKFmsHj9fsUt6aJv935mJf11sPzJul5EHbqZNoIQ8NvsAKwqEHKHXNY
	cujAGfnLByncC6ePeyNMPBDFN6bCmEQQ8v7NrT8V5Y4XPT3J3PpvAq9nej3pVGkvlHv1qtRgLM9
	wD4BjRD5T9inB5yZlm3rTWlyQgJn+YZ9q4OWwjYCiVbVSF96fI2KGwohvU06tJLqbr4WwZoyEE6
	RwBGojfH16kooZearVPxT4+Djh9Bkk4q6SdyEu6anoAAM96A0y/vC93gP+c+1dBZeYdbB44wtH0
	7t9j5G3tdLThRMdBQByyyY6MAWMZpTjoHeAfvQ==
X-Received: by 2002:a17:906:f246:b0:c21:61a6:8821 with SMTP id a640c23a62f3a-c246a6cd384mr2330091566b.23.1787569489516;
        Mon, 24 Aug 2026 04:04:49 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-109-60-82-103.zg3.cable.xnet.hr. [109.60.82.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e7esm1331954166b.46.2026.08.24.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:04:48 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	aubin.constans@microchip.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/4] arm64: dts: microchip: ev23x71a: enable eMMC
Date: Mon, 24 Aug 2026 12:56:52 +0200
Message-ID: <20260824110432.1074136-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824110432.1074136-1-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_040451_209183_99555816 
X-CRM114-Status: UNSURE (   9.65  )
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

Enable the eMMC connected to SDMMC0 in 8-bit DDR mode.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index 985ca31e74e7..89a161b87d6f 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -478,6 +478,16 @@ flash@0 {
 	};
 };
 
+&sdmmc0 {
+	pinctrl-0 = <&emmc_sd_pins>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	non-removable;
+	disable-wp;
+	status = "okay";
+};
+
 &serdes {
 	status = "okay";
 };
-- 
2.55.0


