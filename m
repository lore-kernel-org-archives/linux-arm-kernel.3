Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507B2CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=; b=aUcCyUiSNwtnvkoJt5NTFoNTLf
	rH+Xaz8TCYu4tC/QTBDQwz5JbJm222lLiIqAvWFFyWo9o50S4N5kEHWaR4y/Fazkrd1lo+EvKtqZw
	fANFhXQ2ZT9ZIQOsJwca3wQ7WJiYEFpnxujrC8sh7fnVbUM5Sq9jWlNrqT2Pw9cs7rjJ6/RyFUfBH
	LfUPR12JV4O90FHIGwbR6RdMh8InuJd8yebsH9rqQltx5vCasM/4zRHK9GGbRRL7jDP8UWWMK01ZC
	9UYXlE6Yo2iu+TUzx9WDmPMChfMkNJyiWTk6OroPtfqqktBwGHgOuiyNiDe4/D5JtPEStVWeul8Mg
	644gOvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4r-0000000CsmK-2qeP;
	Tue, 13 Oct 2026 12:57:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4k-0000000Csiu-45wv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:57:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so491002066b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896269; x=1792501069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=;
        b=bBKAyJQ/w+CVqcAxDG3b+b6/mSF3ubP6jWwi2W7ZtbPTzGFCAg8vIpetPA0x0pxr4G
         rkwRS5r5cFLgxHtwXE3PXcqsoQs9aVhthugtANQGNtS2bxqbAdnz/L1eKTx1F6BGThur
         ekUUliegYmfOUu8lf9BsEU7nrCXNO2Ba4W1FjsLcVjTzu7r8yW+ex8FTKuTEhyv6dEUY
         TxALHD8505cB/o7sWtbWA2EhaxLr1I4PczgyExg71zpS4IdwuY7rxKK3KvFeVPYc9Cbg
         2LG6i/reYYU3OG+KLe/HV6+3vKHDMAb6mUCVRkDQ5wYR1uc+cPm9b0VlH/y5Nt5wszQI
         Mk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896269; x=1792501069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=;
        b=XApednljdcbWkMvk4F85Rn9w6SMwG4hZEZ9OsMTcav13UywwFKN5ZzYSrmF43lzbN4
         Cb3n2fiU1zJ+OeY/5P459goGU65FDUHDiqqVTFBMbMtUjBG937oFoK9FEXr90colxmTb
         eRDQclKWvoEDRrVdbc60XS5MLXuSne0aX6Ji5zvhL1Q+AsNj1EP151cTnGEX1lp3tV7J
         tB7vohwaI1rpemfXhbtvAikgolGW+div5vfkdjTmxdNhRtok4PJ0wRk8AOPbzGrc6742
         TtDsGIZXgj+YRIEjeuwJMr9ElFZQwN3auMzHgo1OZPoSj5ZvZ9SfsVUDb11FLiVCFh49
         6RpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+Xx0sZ1Z/b2mOkm3YXqOjqF0EZcJr4/XQnc2wu0hy8HAMgyiZFij0QJJ2yXPTR344dqzYveirh69kCirFtmWi@lists.infradead.org
X-Gm-Message-State: AFq9FYLMnG0JNq6PI2bZJqe2YT0+Iv85wcBmMFC3g84Z10VQ5aRJjyc8
	2nd9n6HZVxy4BOh3uGcvrA8pvgQ+lQAiKNzR4OhjT5psvfq5a0s6DgduUfSxUo8jjJA=
X-Gm-Gg: AYBFou1kAxHrAB1Xwy+2uNojL734/qoppx6RYVNUfELSRCoFlYDujA66E0rZgD5isLz
	ROvz/LKGbldp8sFBAO6FZr2itMPdqoZ/y/wP37krA/kPp/fExN4wT6PdS33betP0y9nUN4XqyqD
	Eq8++I6RvYNXyfaZ6F/qtk6uP3mBJZ9HTGkYoczTron/+fjaBCghT8fRh88WCjstHZ7u86OePI/
	V7J1K52wTjXqcwpIoFJ/K6/+nkal1x4VTxtWvEYJuvRaWnZW8uVAb8JCFdbMglG460DHriJKrQA
	CJaAycqY3DRSF0chJveGKaENp37Qnvo6M/RJaatwj8yKR3nsXKSwKQgjHrrSiJjCJIBIFq0MPIW
	06ToAttkc+q+rKd0vT1xwUECCAKeYOj+9jsFFCeC/2r6H2uUcLgdPS5SMEVZoOJ28ivmJXgH1B3
	oXplIAGaZqZykRPfqIqnDLMJRAiqznk5GhnBJW2kHrKMIAKw2d0uY0dd+7oh/pzEnTqdLs3BVhA
	O+5AZKmKKzmMrO9lMtiT1Jq7Pn7iP9JEUW4yU6DXc2oTqEfdQ24ebMMJ+3FXXNfrk25wvELDkpJ
	NxvX98/1NVIwPWyboCo4JWUmTTba89k=
X-Received: by 2002:a17:907:c317:b0:c2e:62af:b6f3 with SMTP id a640c23a62f3a-c31a9afb29amr1158692166b.15.1791896269434;
        Tue, 13 Oct 2026 05:57:49 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Tue, 13 Oct 2026 14:56:26 +0200
Message-ID: <20261013125735.1542349-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055751_056956_2BB947DA 
X-CRM114-Status: GOOD (  14.42  )
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

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0


