Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67093CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=; b=H0Z4Hg6njfRe0hgziloV9vSjal
	p/4uaBtlkyny/F7aG1bs+zjZgwtq/kuuWGXeirFngOfyxlvqGr/hBzm/Po+RBlChoNKDFgsTdv+Iu
	CKGiUNONMU9lioNwP/e5GRpV1R+PGmjljvwkyctTmYtcr/Dj0JX29eW3rYS4l7YoWy59n2OJ0Jo6S
	7+ThiKKIG1FrctJtK2JLKWHAECjUI36Q1twe903mk8741YeDjI3vYNRk3mA+NiVUX5r0FBXSskOFS
	UtjQ72b8W80IigW+X/P7dkOfxEtlpl31TUct7suk3f6OXl3KJR+jERForbrZTkqYay7BcNMeNyNgH
	cbq37eZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149Y-0000000DpMD-1YBW;
	Tue, 23 Sep 2025 14:38:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149R-0000000DpEg-1c3u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b2ac72dbf48so424352966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638271; x=1759243071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=WuK6fcxo9zViYOlAR40Gkf4aXJekJygKODMCVE3QblHyJEw44yLBD/u15ycS0HYcNl
         HLDx/TLb8gag2Nl2cC0FbgBKOBE5qfOyL2Rdg8BI59NK5JQvgrNfoM/HAmEF81R26GBP
         HzhIzG9dEgSxystTj7oUhwohw3/D9yVNT+c+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638271; x=1759243071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAYdvSVQgA1h0haeD8J+mH93pNUjVxDxBFzkQXHtMmU=;
        b=pHvH8cxn3ts5abeEYqfXE19UHRI8kLonEyLMOT56artT65zFCdNBrbvClUF9g9qh4C
         zpCPKn2VaQwyiNoZlqf54dOAwK9vtUutldKOD+xfJmTWCNqmWqAqYCNYNc3yl84Rm1OM
         RT/EFLK/ufjGbXhoIEFgu37jay4geHh12W7Y2yvQWdTjaBvqUEbN/Tt6Dq1MqaKBz92Z
         cc8kogLDUW2gRRj/35FZEsbMo4MCp6TKQvURuiZ7iV6dDMsVKVT8v1g2d7Z1EmhjL+kt
         RhsAkhRl47kBdxkV4dqv+cAT0KQPAFQwf1Ih78gqUvJ5Ki4riNDrdast9r/9L3348aw8
         d9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCX39DFpJNpdmw0QhloD5kYO118Sb5TzyBC62enbqxem3LKG789WGxGP/sl5XbJJjKy4TiBs/MJynR2JpSPSddU/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5x6Nu77i3v5Si/AmyZO1yqHHXk1VZFOuW+XVG8onhToPzfhtQ
	Q3e8T0GCdBgjDreBmBHXAnUvldU/T1III4s7g2IP3uOfh528F4gwsVPMmSGLZMSl1RBh5niZELW
	CL1m3
X-Gm-Gg: ASbGncu81QyzrpT5ONmrnYvxXbIkqP6aiv/cTL3brO5Uwv57L2m4ilS0aa0DHpFQ8rf
	mOQZgSRiNBsVKT70mcnuUxZ5psTMQE8UXyRar0rd2non0edGC2qi7dOhOfofTQNrXHTJh4bVQrC
	ONUIFsz+8OoriKscSSp2ywN/cfv5zjo5SHqAJy+/UJM9J5XXDR/23GDovMb+7ctz3x+7KrxKuh+
	7eGzMXKEAWHHvZ9xE23LBJ9LVGhS9uWGiAmo4eRguSBNligNzjBnkKOAEVa05qcUyURpbqkTBV2
	5m7LR5DkpqEJtdQv9p9GzZHhWbRTmEdQADOR3cXL/qlmICLZkMwVILWHjlYs5rVGACZ3zkQrI9D
	PVbVOtxbV5F9aC/pEgB9tq3gJ5pGE8GjvEcaLh2Ls4TydJJbz+9Qebrfh5QptS53aPRGSfDEOKd
	LpjkUtzKhgxzVLFTuBK3AEP4PjaBpkW2BgfevxvRvqylVaaJU9R5+l5opRGxeZW4yB
X-Google-Smtp-Source: AGHT+IHaqS5GNeMUhn9N2QSUvjss8/1xeAtf3qXgVO60HOyrcSqyn/pZRNK3lgknrBEjEWoU4iqXeg==
X-Received: by 2002:a17:907:6d22:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-b302af24e64mr265873166b.46.1758638271431;
        Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v6 1/6] Input: imx6ul_tsc - fix typo in register name
Date: Tue, 23 Sep 2025 16:37:32 +0200
Message-ID: <20250923143746.2857292-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073753_441286_842DADB0 
X-CRM114-Status: GOOD (  13.06  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v2)

Changes in v2:
- Add Reviewed-by tag of Frank Li.

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0


