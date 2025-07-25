Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9018EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpMv/YidPhET2ZnB4avevT5/yZnoFF98t+d9v4dctnU=; b=kqQUI4isB/2oLdRFEdE3Xdx9g+
	xd3iaOzsldKLB11DwgR08FI1SuPXXVCqnf50vVTvU/mVDXf4a1FV8SdPI6OR04qBPyNtdDUzJ0AUh
	NIZqy2055KXd8OSmdmWzfvTFoMHN6sW6KjAUShVyQXW1/te+rK9K5tkdTLG8gnj2z8gb9Mr5L9WhW
	mZxqLe2TsqV75p1W/BQd1CWpcQRDIDUv7N6vojoxuwc4wzyJ9PZr3ISyQ2ulMsmt0RrVXy7qje6/s
	l0kYu2RbSkdcuIi6ZWxfRRVVkus1KlNc6H1+5MDF2Ah1sBlh+blmnt4LgrijDFPJDRge4FDoipOQL
	rMnEHspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKp8-0000000AAE2-2GER;
	Fri, 25 Jul 2025 15:59:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKcE-0000000A8Vt-2a3O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:45:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1535207f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753458345; x=1754063145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpMv/YidPhET2ZnB4avevT5/yZnoFF98t+d9v4dctnU=;
        b=izckWfKibwAv0DKXtTKSnNj08JEZzSr4PyzhjluPA1sg0lOm+8KUpyer1Hjy+5RTtj
         7aD+5byujOaPgpv9hb7MNOlNmBkKK2ZNfKw6EM5WubkYwzpTqqVbVAt9h1wVpzMiBbCn
         /JFEknkf54tURw7Zg1Aeu1Rd5k9N2WAc+5xFgw3Y4/PeEzt3jocFsMIAQu1vrSomp/4R
         JdYW6kw7CMMvN9ZbwaUi4hnznU1ZXexzM7E5QL/6JSgF3ICXGWEHOzrGnTJTKHVAeIdx
         7SL6PePkVmO4CMbztrvGWurzz3IEtEM1O6+BgjGac5aVfv3jKalM7oxpKPycUbFqhviH
         HL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753458345; x=1754063145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpMv/YidPhET2ZnB4avevT5/yZnoFF98t+d9v4dctnU=;
        b=gEq9NsaiL8Y2vG+p1uv/JuE6gG7g4OFU+xkkGlMi8tP3ZF5aOyjFJflrt84VlPQLJu
         DgFVar/KRr3MtytQWgjW4CkuDwmYd7JrK9DO3RdGY2SwyAnOP+GZEPIt6Gfb2ZNtocNZ
         ap0BAPSv91z6mdikg4kBXIQbf0evtWIeZ1eil5+J1NPgi5HDCofaq5Awbr1M/7Za0aG0
         r/U01hxf5rNiWaoDjsyS9Sxu/llvCLa7LUFOgBV2x3TYjbOrm5pEB7hv0xiV+b/hRQXx
         8ov9Lqr4sUNxoXrULMeeVftlG4Wavt4A9QeniBmOn7LhM/crGLxYqIE70UT2RKH8AQ+M
         PcGw==
X-Forwarded-Encrypted: i=1; AJvYcCUDR2aVBGiXAA2iGNUBLWmurEw5EIBXo+VoBiLhsa+C5npyc0+fkjxuu+9iTwvuGpk4dBb9bAHMdW3IhX7yHwgX@lists.infradead.org
X-Gm-Message-State: AOJu0YxRlyOAGz1CN3GA45nVwth9gqA2pLGJEXwmUiD/vVIkqX0eH3jb
	pzoWiSVF0XLdj63e6YFEKVXxqWRdQ33FOX1xgNECYI6e0Xh5Fd+DUG9JIIhzSG8vqVc=
X-Gm-Gg: ASbGnctZTixyL9oNbtxN00zGFIbtzN5Vf92EbxFhZmih/D+7g9iHnGGCagC2KBcAOje
	3YJlzeGR2jMFCbH/t2RtK/HPKOxZyFaIcnW6YgB4gmDamiEcuYHtDcyN8rRaDH2W0IBQJX6bpXv
	emkyDnwnAwlyvGRwXYbdPsQjM0N79JlsJ0cj7LACCIDVv5Z1Z1rHI1zahW55ZyDVYm1otkrwbY9
	c7O1hCE6Z/mD937GdeJBB4rBnW3wWZEEVAO0ZwKVB9Gphksmw/aG0BCdGPHS4jKt/VxMzvKRNpz
	PtCMf2y3PJ+f1TrF9d2PkeQJ1Bt3nZLb6O9Ejw+7GmkCPKFtoBarJlR4rkvale/RymjE4/8k5ng
	c94DQiJuCd6Z9faZizy6HffpOcOF850/KQER14sRJYRdu/va7kzO3N+z4PTIhYAP/
X-Google-Smtp-Source: AGHT+IGCVEfrJiPwphHDH1kVjEgnoFgj+gabfrl3qoD7SE6yk6VjRY5CANy9aiWHLYWruZAR8hkG9g==
X-Received: by 2002:a05:6000:1448:b0:3b3:9c56:49bf with SMTP id ffacd0b85a97d-3b77668f23emr2158022f8f.56.1753458345142;
        Fri, 25 Jul 2025 08:45:45 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4587abc273asm1440555e9.4.2025.07.25.08.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:45:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/8] pwm: mediatek: Initialize clks when the hardware is enabled at probe time
Date: Fri, 25 Jul 2025 17:45:08 +0200
Message-ID: <20250725154506.2610172-14-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=h4C6mJ+6piC2VWvbn8TbcJZ1IdLRPgjUr4EY1wWAjGg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBog6aOq0zddg0lRZ8kq4jJ4TGS7WGa6Vop+MNSf zuzJ7uKUSeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaIOmjgAKCRCPgPtYfRL+ Tk02B/9cdR2DsEiX1JpyqyVLI+PAHhGbf1/6BAPibHuJh7ncfqBV5Fy3KKtoV1ToHfCAKPZ8p95 uFZ8f60PEMgdNCQTvao4q5Pt5FQQtM6bnVdew5sgp3ywAa/FGTWtFIKNd4Fo1ECx8PMNeiSSbdC tt3KjRdJK71C9ZD4exwVBR1ZxkfFYpkN+to+QytRWrhVQkkeJpHNuYrijK7yWGAPkLsu+taI8IH laxCH0Nsa3N/zioCxU/EL5mNyFZMbW8Co9I7VQjQTd6Mvw8vLGKimQZzONDC+YCBtE1p+1lRZ4J Z5zs9y27kMvoVA19HLBRnVgij8VYHokLHjrblLXNH+1uz/3t
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_084546_654132_A04ECC3C 
X-CRM114-Status: GOOD (  15.34  )
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

When a PWM is already configured by the bootloader (e.g. to power a
backlight), the clk enable count must be increased to keep clock usage
balanced. So check which PWMs are enabled during probe and enable the
respective clocks.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 47 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 16ea42be4c18..7d0a6f41d671 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -235,6 +235,49 @@ static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
 };
 
+static int pwm_mediatek_init_used_clks(struct pwm_mediatek_chip *pc)
+{
+	const struct pwm_mediatek_of_data *soc = pc->soc;
+	unsigned int hwpwm;
+	u32 enabled, handled = 0;
+	int ret;
+
+	ret = clk_prepare_enable(pc->clk_top);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(pc->clk_main);
+	if (ret)
+		goto err_enable_main;
+
+	enabled = readl(pc->regs) & GENMASK(soc->num_pwms - 1, 0);
+
+	while (enabled & ~handled) {
+		hwpwm = ilog2(enabled & ~handled);
+
+		ret = pwm_mediatek_clk_enable(pc, hwpwm);
+		if (ret) {
+			while (handled) {
+				hwpwm = ilog2(handled);
+
+				pwm_mediatek_clk_disable(pc, hwpwm);
+				handled &= ~BIT(hwpwm);
+			}
+
+			break;
+		}
+
+		handled |= BIT(hwpwm);
+	}
+
+	clk_disable_unprepare(pc->clk_main);
+err_enable_main:
+
+	clk_disable_unprepare(pc->clk_top);
+
+	return ret;
+}
+
 static int pwm_mediatek_probe(struct platform_device *pdev)
 {
 	struct pwm_chip *chip;
@@ -282,6 +325,10 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 					     "Failed to get %s clock\n", name);
 	}
 
+	ret = pwm_mediatek_init_used_clks(pc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to initialize used clocks\n");
+
 	chip->ops = &pwm_mediatek_ops;
 
 	ret = devm_pwmchip_add(&pdev->dev, chip);
-- 
2.50.0


