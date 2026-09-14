Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2952C88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=; b=SD3votfGOYg1ysfLfURvoMTDgZ
	7of1u2p5M+1qJtXHfIaeKVtPIMnUo6ukzrwslw9NOIkjuMYvEXmlRBF3LuAHT/BhM8gsec8Np4KMj
	JZ6vdCeL3iBR+cgcsvLjHdAC6mc4OHWosKDjP+JIu/Lx5wb+aB/q0gkkdGVQ/NOjmK2524mph1ceO
	+TWlqb6ftSxqUc4dI6H8Bi8bM968sewfWLbhYhv8by2ARZyutoegxi3qpkoEKKtrPGZU4hdN/pRm7
	WPeVn4JbAQClCDkOXVqKM9bQDeae8aHMFSlK/AVWIW7lNuTOoDRq8Ltoakzs2dKgx3ALdVNqD0Cfv
	QW8eMnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69c4-00000004IQ4-0iqm;
	Mon, 14 Sep 2026 16:33:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69c2-00000004IPD-159H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:32:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so20365395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789403576; x=1790008376; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=LVsc2WjEBhrzZRXbKQxjWuMDMxm3Nzr4IWkWsM7vi+0pYydZlZw6W8gqkXb03cK99X
         OfQqehATr2RkS8C9Sd/v5J59ahlH40Bhc1l1aeq1HshwlMde+DfGolqjiguhWpyIZVnt
         HWEMp6mLyxPPLmdBxR2eXabVrqRFwA2FlDKQ1RafR+Sg+TFV+Q8LD9DokuRIKL2vArry
         YSXxA5JphndRtIa8zhgGkkvFuDgzVeISRVqhULXkhUja4OvhCN3EIIP1BGbtfVGlKXQx
         Xd+lN7Sykou8HKfcyFCOg4XEO/pLx8ry0HsftJZn/jyLvY6DIrQN2I0rKGSji/1uHl4H
         pIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403576; x=1790008376;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=Vw7V6HwSFCQQ5e6+OEzcQSJLIlDNVC49rDlDijOT08QEHjCkqQXepekUOs5mR5qzNb
         uzh0b3XtPHjSrcisH7+pE6vE2GVHr5EIAHo/cqjcC/sGAGwCPa5lkIEhMjfZZdRpKMhh
         8On+ZhrRNvAXwHjlzQLbbZAHzGoBFC7ZZ7I9xYcgPa9dSv7a5asNVbv+MUn0+1PoKzks
         7jSeN0AiignI3whWlMuIsB66M49cXQ2NazB2ihQWlT4mtsrXnC1RjBvcq97C5N2sQ0yK
         8jBcuQwNcPLV/r6xWlJrtKgmu4PwxEghyK7C9yF7whe1a2PKQ4KGAC3Ysu8NdNsc/bMG
         UdAA==
X-Forwarded-Encrypted: i=1; AKwUvBz7t3PB01eEfX3khlrYCfX3kqfFNeFByRygsRPyM0jFK7IoM7hGrBG4ngcJMGRIdm4dlOnN9oEa9/+xU3i/iRg5@lists.infradead.org
X-Gm-Message-State: AFuF++lhsYiAR8yoDtDsOsG0O8qaLWOVthFgKNNzIMDBjS14jPHaa56D
	AU7k+GTICkOumK+e1teMFIpC43WC12sqpIlgZg1Wa6p5wkqnDL79DjJ0qdN+rAKUb5o=
X-Gm-Gg: AYBFou2LX0UL31jKPY11lQvK+DaW/TM8lCG3bDkeO1y3vTlLaiGjApKLRIYkuHMHALt
	LvMCR9VeJCSihjwy4zuZkcwgsmv1FPbAdR2lYvIbAJhZb+SgbiQR+q/HIxbtjXl9NWt2xW14iH+
	6XN6Yy7lvrjPREOAgGhdOAn9lX8xACulEMp+S0qdc2Rfo5lhm8hCt91nMB13A3UZ8d96mEjXJmt
	627GS6FZQwr8Kl9xCvBwqSvf8G5o2WGmNUrVCUPhXqRGQMQXlJTF4k6jvJTzb+I6gO9oKj9/wXv
	OztjKvWjISLsY/+s9b7o4fODXOdSribto+0+7cbJCPAI3kmXJgBkxA8Tq7+/Cihav0Fz8E/zP5k
	pvaJAHAUegYysXXkOFJK3jgMMEg/mYkiLYdAYI+JDKU5XnZHVUhKI9RDkDPRh5ePhz4DQfqjkbj
	NLpytrQdi7DuetiXdHKcMMGJuYOLivNhEzlA9cg3r+rh4xpvTous3FyMHXOBBGm8owib7MWLvu4
	eJKkNP4QJ/m9j710mmOk2148dp7pNl8yQBDgve/ZYJ+nSHvzMeYJPN6wfFAevQ=
X-Received: by 2002:a05:600c:6383:b0:49e:74c6:d973 with SMTP id 5b1f17b1804b1-49e7a67e2d4mr40537305e9.31.1789403575710;
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm25431815e9.3.2026.09.14.09.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:32:45 +0100
Subject: [PATCH RESEND v2] arm64: dts: exynos850: Add ap2apm mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK0hqGoC/32OMQ+CMBSE/4p5s8+0pYI4OcjqoKNhAPqAJtpqi
 wRC+O9W2B3vLt/dTeDJafJw3EzgqNdeWxOE2G6gagvTEGoVNAgmYiZFijSMxvrDnuGztAOqzmO
 VliklURRzySCAL0e1HpbSO1yzW3Y5Q776jt6fsNGt4c9ste+sG5cDPV+Qf1s9R45JHRVKJKRkL
 U8PbQpnd9Y1kM/z/AVG1q3P0gAAAA==
X-Change-ID: 20260429-exynos850-mbox-dts-c9b9e7336140
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_093258_321538_D8842938 
X-CRM114-Status: UNSURE (   9.39  )
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

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- basically no updates, dependencies were merged so just re-sending;
- Link to v1: https://lore.kernel.org/r/20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..bdf177d08ea2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -319,6 +319,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260429-exynos850-mbox-dts-c9b9e7336140

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


