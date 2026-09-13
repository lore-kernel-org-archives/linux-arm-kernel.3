Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4137CC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=; b=G3ecHsckoJwcUn25SZAkDg2zb9
	P8TMlfX9TAIIdpVYi8xsqWyicRIzRTbtGbQINGvZc8oA9PU6ZjsrEM9UhPvVmB2P8vFmTzgq71uei
	NdbN8bg0gWA9BY7ce67UExOD3HBqzVdGD+257EI6ylC3ec04dhZ6lWBkzgJqoax0oJPxKRRizGZoh
	ePfWKAgAjwxXapWdCVYjmNjCApqYc/OXSmv55GIvp71VZaU7LNNg6zNAORnAMu2iNXU4+owXQ7WXV
	ZXUtZH+r7Zfa9E3cX4PdT2Ttc1Gw6O2bf45Qe5p0/6TDTwMINLryrrxTJ2BM1rWXTN8raRBf6OmLS
	hXvi5VVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgw-00000001l0P-2hA2;
	Sun, 13 Sep 2026 15:00:26 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgm-00000001knW-1prU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:00:18 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc4d64bcea5so1163872a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311615; x=1789916415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=;
        b=D9FJ2YvhapvXVtkhNO7clQUAxs2jPmzK7TYBRLzdFsUUUAPW0fPbV2QSJXTYDdar9R
         TtdmU4W/zdWzYj0kOZWST30uYIBOD+wTClkeSOO+oc+Bs4IWVGWvzWN+sUepjaliiezO
         fxAkoA0Avabwy+qeP6viqJ0LwzX+zMevoV8cNCJLNZYqJ/hKc+UsPQLQtznMbQEwbTZm
         7PHfjR1mJEjbDPl+lk+oKbD9djGa7+zF8s9CjgoljpD/EVU5fphtP+HcIgAT+1Vvt2rZ
         +LDUvHZaYKkfqOZDo8ITqkyvq6RuJMNHAIa5PAQKa5GOt/I28oap5+8TFIHnOYetulJS
         xjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311615; x=1789916415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbLN5q31GQxj4DJ6F6WcgB1JNfvwxcLXSAMVbVPmGVE=;
        b=Ximbn6pfLtzcQX6gxsHt1MBprpPPjtWjifGv7NSTqmuLSJm2qD5vCCMI9PHKcoqP5s
         Rutev29qhaOi/1urBrWKiRRsFFBr5D9Pyo7npEM9FjHv9tinBuOPi979vO46AXyW03cC
         9fQTqg1Efp1NDzXNBjKx9yxFp4JjQ3eI8eSOe1pyjhMtDmccXyGNZnulMOKS8wTwtLn+
         lYqOmdPx7jVQSUlKusPDVe0vJgkvMWG2M5R1cQ2e5q6Gvp6OIpoqxK294rbYKm6ournc
         H6J5N7dwG5ZAY4HKtsFbT/PayOnhQ9/FylL2VSvmhLOgNcZjIAbb52HaelqBdMhx4BCx
         skGA==
X-Forwarded-Encrypted: i=1; AKwUvBxRV0Qbpvo7aEZ+X+l5y3ZKuk9LHMpJW/TKugR+hRoOZSDH/NOHN2bu3hnu4n6swUu13G4oUS6PTHAWtzu8dUhj@lists.infradead.org
X-Gm-Message-State: AFuF++m7yEtH4ajAjQue/kMEni0xy0RRxe7/OwfQugq8Bee2g0hYehoY
	nyfSg5TcOR1JwJZ5mQWXkiBr+bDTtf9Nj3+yXknGErapeorGlX/uC+Ze
X-Gm-Gg: AYBFou0IB2hNBoAOFFiokeE7Wf/p72rREVibZqQVYqU/InZtY/S6zlsgIvifo5fqBkL
	9uIicODl2vbe+jkADX61PjUW5V5dToTcsb2wlHIcRFi9pq7gW/HCPl1pL08YAOq8u+6DVfROnRT
	CXLSKXxjXKAJ0th/M247dopZ8NmzK1dp/TVeAV2IcXpqfbDEnZYic19EZ3Kylr7gKS877/8JX/C
	/t+IWojHeHeKnI48cdVvXpzLNhBuXENyqM1YDd+jpV1Nxh13V5g/qAK8ht6/AVyNesTqqbR2U7V
	rdmD0Vr2Zj7tKJgUrPe/7/xWp76OghxUbQKvBFngNzD4uGAG9KYSzox/3xwjRYIppmjqrslryXJ
	nu6xerUG/GV04F9X8lRn9BR8zU9b1TxnQsUw9BpSqHIXo516zQGEyKw1mQaLtvDzW6/R9EgWGNZ
	JQhUkilqoScuIs8zk4SAIHB/TPUddLfkjJVUp7MpZcck7Q1RNniz36UL90ZfvVDe6/0ygyrw4KI
	dru4q+43DI=
X-Received: by 2002:a05:6a21:140a:b0:3d1:66cb:d49 with SMTP id adf61e73a8af0-3daed46b0e3mr24749980637.4.1789311615337;
        Sun, 13 Sep 2026 08:00:15 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 8/9] thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU probe
Date: Sun, 13 Sep 2026 20:28:36 +0530
Message-ID: <20260913145905.9404-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_080016_519882_E3334A7F 
X-CRM114-Status: GOOD (  13.12  )
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

Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
ensuring that the driver data is properly registered and accessible
throughout the lifecycle of the device.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0e7b92035850..fe56a48be5fe 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1125,6 +1125,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_set_drvdata(&pdev->dev, data);
+
 	data->clk = devm_clk_get_prepared(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk),
-- 
2.55.0


