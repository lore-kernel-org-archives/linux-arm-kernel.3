Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3C4C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=; b=tB4LckBbn8hlmngdF/Di7w26Nw
	tokacPwElM2Avz8Bge2DVEbCwW2c4pMVh1AuiAxfAx+xGj4HrWFOkfkwnpCkvIDJ4hXG+espzaR9C
	sSrlz4RSfvwapw6d/8QSwi0th5CdTFICYzbVcR5prc+snKEJ5d9FTRPtDnV3ddCKeOg0ZOUjkzhWX
	xTgIVlbeMMe3hEW87XJDtFiJQkndOX0nJAvnnQdng3LcpU2Ta1HByY4P2LWLOldmZ5+e7GCagW8eM
	DioYEEb6MEvTGbxTQvsJg8fYp1BLl4wv0YC/hTeEbvXiKgWoziHIpF7i6jlwAeK6Mkl99d6mW6bQg
	j085Vw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KaJ-00000007x1g-2oQP;
	Wed, 23 Sep 2026 10:52:19 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KaG-00000007x0B-3ukW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:52:18 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so614393e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160734; x=1790765534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=;
        b=CkWAMGcd/I3YDmN+GV8uxPx/iydcOHinvhrdwZIHqjQDaoIHuZPqfrW+u9hVr8HM3k
         JZpgedFk3vbItoljTGHc2FSXXHuizDtmOzb41XCyP/xnL3QNTfHFuAeLJD5ibeJT0LbX
         d6ZROo04DByz6L+qMAzy8cjW9PLVAyx8uymYLTmhanKuFB9umgBkzpR06IDgBU7jF28a
         UwJCATbMGK3BndflwOElM8H4902GbbRxBnK1/tB0h6RhLeyMl4Le4Suu2bHFUHVoLCdE
         H07b4wrZvVT8+oI6YF4yg0bzRcXa9SRzvg3xaYTa/fG7NEYoGPjdmvZ2GpI9Ha6Dsf5m
         7l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160734; x=1790765534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jd3pD5snZnHs7zfXJzo2aSY9ZvIn735yOScE5LBtrBM=;
        b=o46ngtJaFO3Lf4Nm1TwT21f4I25U/dcHRsh0p0LoOMMAvSMyCAsBSoxwCWjHqpQPo2
         BcaSkQoRXwOiBVJH8Mr9paEjrojF83VmrO4J61gjRTUQv2UnoSzeNGFifC5ag8vwbUqW
         8UwaFRVA/64iq1EGCz2s2b/MH647ZW+xb+uu9AE9PmqMgXE8f6tIns/W7WD9R5xCI+x/
         UMlHx7oIphEjaFsJG5F05xx+JN3rNwM1KiTmNRm2I12kK1Bvx7HvT0cb2vyaLczyssXO
         EbvZCcthnIZZEhqPqwaaOczFcbxWt1XqFC7Oa3PDcrKZm7B6ae5bRp4822z8EtNF1c1j
         bViQ==
X-Forwarded-Encrypted: i=1; AKwUvByvy8TuMLBoaw4Zd9K606D/2lP8Xu9rJz8t5EbT0OihNg9CPWhUPEfftcyGfX1HdSHfdtKN/bZ7TQ1cHQjSa1wx@lists.infradead.org
X-Gm-Message-State: AFuF++nC/NjMP3bh4SZ36yPkKr8tHPjVKzgRGiIBbO7SAjOE50CD37iC
	TGTXx5A2FvQ2hwle9GS1Wr3P+rbNN5uwrxEmYYt8cH3S9qqvulyIe6hJL43rsMSghrk3Qw==
X-Gm-Gg: AYBFou35uRUcQVWLLSCyQ2IHnRsoWkkCjkZ4Qhc0r+ccIbQwvuuxadfOpf8kPasg2L8
	X4rodgafLD4HpfWA7k/d9QTjjW2wGSqQas2bBPVloFYvZTUeyOSZ8rpvcZ3jmRfc82nr2T3aFIq
	E69+snlUJ8z7ipGkXyY9UuVomiOXMx3YJzdLy3B99kIBKUrQko0kdG8y7PTF9kGehLJSqef/fWC
	t2ROpW1wsS2ZpxFv5IcWyFq8w9I+I5w61HewcibPAAreVHd+VMBYgK9aS9dhrf+R7TZo08RXxx3
	DsCadvgveMMr43lDsmpalfYpMEoVZU/ypqaeJvIPionZkJrd2+1eEGTj89tE3fx9I1s61+EAuMH
	/Q5nHoqbgOECgtyCLjwY64YjIGHaAubt/ANv+uQ7tSRpAf/+lTF8bYahm1M5up70H8Oc+F2LVmm
	6TmtI/YCUT69/JOT95sqD2JeyH55DjnovNEObvxutQAQEbJyiDuj1uOTG+ONeWHFq3XWb4lb0AI
	BRjYEMO0bvgnLByKUCRt9/gtctSddnlY+NFOx4I
X-Received: by 2002:ac2:5696:0:b0:5b8:bc5e:b583 with SMTP id 2adb3069b0e04-5b8d89c6344mr856658e87.59.1790160733833;
        Wed, 23 Sep 2026 03:52:13 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm497428e87.7.2026.09.23.03.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:13 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion buttons and IR
Date: Wed, 23 Sep 2026 15:52:07 +0500
Message-ID: <20260923105208.198-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_035216_979537_4F464C15 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Vladnwx <vladnwx@users.noreply.github.com>

The optional 24-pin expansion board exposes two LRADC buttons and an IR
receiver. KEY1/KEY2 are on LRADC channel 0 (measured ~1.0 V / ~1.6 V) and are
wired to KEY_1 / KEY_ENTER; the IR receiver is on the SoC ir controller (PH10).

Tested on: OrangePi Zero 2W (Allwinner H618).

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 
 / {
@@ -189,3 +190,31 @@
 	usb1_vbus-supply = <&reg_vcc5v>;
 	status = "okay";
 };
+
+/*
+ * Buttons and IR receiver on the optional 24-pin expansion board.
+ * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
+ */
+&lradc {
+	vref-supply = <&reg_vcc3v3>;
+	status = "okay";
+	wakeup-source;
+
+	button-1000 {
+		label = "KEY_1";
+		linux,code = <KEY_1>;
+		channel = <0>;
+		voltage = <1000000>;
+	};
+
+	button-1600 {
+		label = "KEY_ENTER";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1600000>;
+	};
+};
+
+&ir {
+	status = "okay";
+};
-- 
2.45.0

