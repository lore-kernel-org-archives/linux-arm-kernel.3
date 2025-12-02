Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F270CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4MYqn7PCKd9tNf2P3p4f1Uhidh+TUxYe1LwNSbY2PG4=; b=K2NqnNrKgwN+msx0wlkRkxDTaq
	eMuPk6JLsnHlhWo0DFhGmcBDfhp1INctygiaTq1w7FYKDtbe5X9pwJAl1NYuy/h/uyWy1YYzCgQcU
	C1meiz0zfwxsY3pRarFiHKmdHkC02XNrlvtdjE0IjSeREc6/2e+k/kP3moehftncrgf1S4vjGsCGI
	TarqybtT170+llSrhAKrplWU1hV62QoYdMif7Yp39b7Rk8a0QymNQLXBc3d0GlTlGCVCceJlaH496
	3xagFcNhzH/uHIrXSEEAvIx7H2DMuh5gMvCi+s8lp9Zow+BLXZDplQiV6+Tzrc8lI+RLblWJu9az7
	MChbDMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLiS-000000052vK-2Bde;
	Tue, 02 Dec 2025 08:26:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLiP-000000052uw-2x2V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:26:31 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so5088697b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663989; x=1765268789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4MYqn7PCKd9tNf2P3p4f1Uhidh+TUxYe1LwNSbY2PG4=;
        b=VcjhHIsdrT1f/uwzj57lpw8rzK6rrHKQ2ptH94/Ag+iCDsDczh9U63JobrL/CA1Pfj
         p99Wi68a+kC1GFOU2QZ7mMPqSiQVt72XfQ0izmBEFgZ4A7+9w15hF3SoMl9txFwSr/ks
         pBFZEeKHLk5M4BPwVIo1TFBPsIaWmcLhWDpQEibmwEXEe1e1BdmthWym3fh6HfXx/U3q
         3oej97JI6llZ7mx36DvVBYHGLPASMdxbbthwP+rD6NEpzkpfR6i6i0wd0DOdusd2OL+C
         OzO5wpPhMQlK/DdX0WU+T71Bpm9LCU3vUGiAchkTUCpUcfoCQz6Dvm6d1/TKSC4ixIii
         hehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663989; x=1765268789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MYqn7PCKd9tNf2P3p4f1Uhidh+TUxYe1LwNSbY2PG4=;
        b=AxaAbeF/jiXIMrUIDMWftwuUTT5EBn36y9yA8I036wGW1czumN0Vu+5HU7xswp1mjP
         rMuDeQ89dh3l5Xsk/WsowTlpPBQH7qWr2sKJBefg11AHbYrxTe1tOUlH1e9+hvWlpEsk
         XwRSyYYbvXI9QONn8btq0T4PQr7JSVy6gKPupLDXaCYmg1Gl+AQcuanqsZvQQAVrw6br
         tlGg+s7SZ2s4uOGwcCuKoYcYJcx7Mi61sJwIXCkz624sNdvpXOKE5b++IGjljSgshtWC
         QySeEzB7j4AnjBjAQI+OlzDe2GMEZkevlJ2AaG+Ksrc6tUEVzSmuNpVX38rZq2EHMi+e
         QrCA==
X-Forwarded-Encrypted: i=1; AJvYcCVnrJbOhT3q4Fl15ONQNjUIT5NQ+4sWw2bRSr07eKIY/gw4hXUfUm+jfePz/8mXgaCype9f9q5n/0h2M5apjcSA@lists.infradead.org
X-Gm-Message-State: AOJu0YxsSK93QJsBmB9wdYaTogYmuozjIG5FsxsbKYKSXvTXARz+Rnhb
	WXq8U/GEGmGDwKEzJoaGstRnaiQSRok1L4Asa07P3onxGsN1+dZbMeAT
X-Gm-Gg: ASbGncuW/5JR+Flxw6YbpY9dEBEas19OZ+J/42Kwvpw6+uYHD31Z1fl8NGZ3Vx7trr6
	lLnXX1HrhcEdsmVE/bi0o+pdaXU1PilocwFZ56RctdhT1+acKbFx8mZzJ+72q8xRvLwPKjLloiH
	1Au3CPR1gO10IKgqDMBwRQvjVD2rDBTImiLlM0qfbdPQ8yvPbQmx3prr2T0BvYatcWI4WoLKxrg
	nJI03VT+IEwEvY6NdHPFhUX3OEAc0jXNlctRDfHzZtFhf7PYrjlvfdzvJOzxC2ns0beg+Q03QoG
	peU+KJAWn/hIvr8eeNm1bhu8Sg/RhPdfpyVO8zCUKPHufH6mtyVpIW6kEKVUQJvkYfcMaQxHnJ8
	E0+712YtLDNDJgjFoWn7n+jntJ4grGpY00BP2QayhWHITSWBknHYhqfEItHIzKFUOvkxCdvf0FR
	OGCRP4Z/PCvkLEFKUfNE4Qd6ew0aOKQJMR8CP9DzE0ubzIDCOYQu1Ljoass+rXv+rqZt/ROQeir
	5lQzIJBXlWnd7h5OwnQ4znO
X-Google-Smtp-Source: AGHT+IGkl5Lg3iWuR3s4QGJ/QIlgUH+jr7X7bepUoNA8wSggnBvRTX3k73OZCErR8tKPjfarQAd4fw==
X-Received: by 2002:a05:6a20:3d83:b0:347:6c59:c728 with SMTP id adf61e73a8af0-36150e2c726mr45457791637.8.1764663988785;
        Tue, 02 Dec 2025 00:26:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (14.250.194.35.bc.googleusercontent.com. [35.194.250.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68367sm16268272b3a.12.2025.12.02.00.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:26:28 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	gregkh@linuxfoundation.org,
	mathieu.poirier@linaro.org,
	leo.yan@arm.com,
	Al.Grant@arm.com,
	jserv@ccns.ncku.edu.tw,
	marscheng@google.com,
	ericchancf@google.com,
	milesjiang@google.com,
	nickpan@google.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] coresight: etm3x: Fix cntr_val_show() to match cntr_val_store() behavior
Date: Tue,  2 Dec 2025 08:26:13 +0000
Message-ID: <20251202082613.3265761-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002629_754748_41AA2755 
X-CRM114-Status: GOOD (  13.81  )
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

The cntr_val_show() function was intended to print the values of all
counters using a loop. However, due to a buffer overwrite issue with
sprintf(), it effectively only displayed the value of the last counter.

The companion function, cntr_val_store(), allows users to modify a
specific counter selected by 'cntr_idx'. To maintain consistency
between read and write operations and to align with the ETM4x driver
behavior, modify cntr_val_show() to report only the value of the
currently selected counter.

This change removes the loop and the "counter %d:" prefix, printing
only the hexadecimal value. It also adopts sysfs_emit() for standard
sysfs output formatting.

Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only.

Changes in v3:
- Switch format specifier to %#x to include the 0x prefix.
- Add Cc stable

v2: https://lore.kernel.org/lkml/20251201095228.1905489-1-visitorckw@gmail.com/

 .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 762109307b86..b3c67e96a82a 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -717,26 +717,19 @@ static DEVICE_ATTR_RW(cntr_rld_event);
 static ssize_t cntr_val_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
-	int i, ret = 0;
 	u32 val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
 		spin_lock(&drvdata->spinlock);
-		for (i = 0; i < drvdata->nr_cntr; i++)
-			ret += sprintf(buf, "counter %d: %x\n",
-				       i, config->cntr_val[i]);
+		val = config->cntr_val[config->cntr_idx];
 		spin_unlock(&drvdata->spinlock);
-		return ret;
-	}
-
-	for (i = 0; i < drvdata->nr_cntr; i++) {
-		val = etm_readl(drvdata, ETMCNTVRn(i));
-		ret += sprintf(buf, "counter %d: %x\n", i, val);
+	} else {
+		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
 	}
 
-	return ret;
+	return sysfs_emit(buf, "%#x\n", val);
 }
 
 static ssize_t cntr_val_store(struct device *dev,
-- 
2.52.0.158.g65b55ccf14-goog


