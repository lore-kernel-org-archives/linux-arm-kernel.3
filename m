Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396C5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4llYgtc09L9A5EYyW7VZ9K8LmFJt/10Sl5wTfADcVo=; b=D7yYZv1mCar0vEMj08La15wt/o
	MAp5Eb7yJRdWAMszYeJhtouxbTFcMb7pElVeVrpiXoV4LQpr4Bai5bN+93C3iMOctlAO0wBKabx5M
	9WtHMMrb2DzesXaiIXPKJ3zkWsoDE2+DprTHRhwWYc0a2+u53I0MaaQySjkppT3q5RlJcXChb/172
	CoSdcYjPSewP+W9tYGOBL8h/RHb5m67AE7JAxGVEXeJnNSXw5dMmClQUg6y7Ca00ckLn9UEo+iHrh
	MKpqHYv3svhFldXVucpRc2xDXX7kyiR1YCzC9pfFzmabwkzzAXn0DqsQxTywZhwqqC6T0rfDznTqT
	5TyeT6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Py-0000000A8ED-0XDa;
	Fri, 12 Sep 2025 15:10:30 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Pw-0000000A8BP-0r5H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:29 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71d60157747so14575397b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689827; x=1758294627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4llYgtc09L9A5EYyW7VZ9K8LmFJt/10Sl5wTfADcVo=;
        b=oqU2IXMNiS7PGD9RdfbMzxSFTgqV4RHswpRNxsZdWPt5HqxTuvBbQLXpc/omla+tMm
         MA9cZCYPhOOQ23cb13MCVmaQzfNXSltN0rmiK+Bcfw0E0wbw1S7xjUUinNu3SrGHhki6
         tbcQk9yJYc1qpKY+vgnYMwf3bXyOvHXSu+rr9TjKa8U7Ow+KA7jIWIEQgGKRJfSTWaSn
         V5QKG24jxV6gd4I0AaqlgUsH4v1czICe5VmbIRQAokXoEeNB1cE925/bnpMXWbtgmHRM
         728yZo2xC9UumCwtXMjb6DwjIhL8O4OXRnMg3K/PlpjsRbz5KrqzJIXUD2GXxWBfaS4b
         3AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689827; x=1758294627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4llYgtc09L9A5EYyW7VZ9K8LmFJt/10Sl5wTfADcVo=;
        b=Vk3ztFPVe5BDEhghLRcdSMOYSESj9YrlmQ1WgAbT1R1GoDfjn1OwQDwX3MhgKhm5os
         +2svpBF7ElikpodRM4yKTJEaVXHjBdVlUOJ61Y/7HvsgAwA6KXC4Dnq24bns5bKG73+L
         DwX5GFoqMB2ayMFrk+uXgHrHtTYnThuU2JaaGl4MEzlRAAiVuzdK1M4iXsVvq+thqrub
         BGAB8yLvbR8ZV9eq1l+j5QwvENRJSZN6bJEuvbjnPrbPU5xtwgmSlJSZ0Ufxb1sj3EG0
         qZpfe2PGSfoi2lHyD6LozSbsux2wjP5Mvek+cH+iGULPMXJxvnqEd6eqwk9QLjRtPif6
         tbeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDIzWErKuPlDpYIkqNgRU9tHcZKBOErcLwpL6LidJFxS9c4XJZZuC2givhkLoE+ElzvmfQtIRutN07zzmw32pF@lists.infradead.org
X-Gm-Message-State: AOJu0YyW8T4BbeNDKdSuDv80kNk9EZDywIfg2afvamwN/cSRamEQi8e1
	zHt5zQXIPDCtMfi37hC83NFo6g/UEBXeC9u8mjm4AhnNlok6rwHAGcNg5xMo27wfEO8=
X-Gm-Gg: ASbGnctNbguUmBRI/pK5zjThtXCpmaVASEmJ0rBiGC9aETmh6ydDZAhgMHH342QI2pg
	c2ilwaF5UOUAm8yRgSguwurmAYpj1jhKnj4tE+ihnSMTJa5qEJvS0oTtNUsobptOOXjmIfRT2sp
	qvisbQI6z2t2F+q3x2vwm3g6s/woQTtUfSNNu1WqSJpgufWYfH48hRdIICnmj5RD1Sb+/gObXw/
	mCPgf7l8N/H5F2HHoTs2MSw9cUK/q8Yh05ozBxAwyeBg55aBMGAIRYq5e9Ar9O6u7/m4YWpEtAc
	/PFPWslJvsn+RVYhnyC0HGJxWG60npN2IF/juwydIPxWHwV1rb0rtwE2aJ1JXljPR/YJUydfF/H
	/IwwjCTkDQHGZLsMl63tDHedpkWcIOZvLqg==
X-Google-Smtp-Source: AGHT+IELEo3IIrw2/QnWmoSL7oBay1esdy/6RcSnsiIQj9jdk3byMst9Z0k97wU9qaWUWBvFOqWfkQ==
X-Received: by 2002:a05:690c:6406:b0:727:c325:c5dc with SMTP id 00721157ae682-73064a12b20mr30549157b3.29.1757689826814;
        Fri, 12 Sep 2025 08:10:26 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:26 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 07/16] soc: qcom: smem: Add minidump device
Date: Fri, 12 Sep 2025 18:08:46 +0300
Message-ID: <20250912150855.2901211-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081028_251669_58593C0C 
X-CRM114-Status: GOOD (  15.25  )
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

Add a minidump platform device.
Minidump can collect various memory snippets using dedicated firmware.
To know which snippets to collect, each snippet must be registered
by the kernel into a specific shared memory table which is controlled
by the qcom smem driver.
To instantiate the minidump platform driver, register its data using
platform_device_register_data.
Later on, the minidump driver will probe and register itself into
kmemdump as a backend.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index c4c45f15dca4..03315722d71a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	hwspin_lock_free(__smem->hwlock);
 	__smem = NULL;
-- 
2.43.0


