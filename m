Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B79CF3942
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=; b=N91aFX6NsXAplnrLdkb/jeA3td
	/lLVhBGTP3quRIoNNYig7Rewqu3XAepGGi45c6q3L+BaABcCR/EwM7kXcOASSE/3ajW9sn/2rjUM3
	TG/yp14f62XMZ1jm1BArGopOwF9oN0flpmMtRvYf6OyWgAjWVYCMn0wZsZC6hNQRz11JjKvrYYZjL
	ku9AbGt6RT21Uy125JGFVVOnVKPLfhKfPrJl5nIp1DKuol93aEH541NdQKAZ43uKB1S8mMuVVIY1Q
	TEcqTdMNgrzAmrD9YSik7vJqMSIFdBbFBA53knZSu7onl6AU0qaX4VGiWHEbikh6VNQm4MX04iops
	cIAocvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOG-00000003XRx-3ZY9;
	Wed, 19 Nov 2025 15:46:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNd-00000003WeL-2DGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:46:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so68788065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567159; x=1764171959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=;
        b=l8YuBTPcTWp8zXZP5zBse7Lmlhkvh2rZaauJmM/IQRbyjSLm4NObG9JtSYU03rD8BW
         ITkQ03R6wvH10N/tKNgkbyiflgZrJC59IpvA1vBNSNPts5WZtUWHEWsIpimvCH9C4C7Z
         54YQile3zK6/AgxQmy0eQaYMt2p6pw2vhQ1kiSldM/cOcR+fJVAk8H9Z0/009w5xKJMV
         SBCAi2Kk39Sp0vVJQEVcps1e/ATIekJefWRvGja0H8Nv0PWrJeKrToZblWJt0J2yfXog
         iyS9+FMlWf5EPgsjbx6EXOtksxrCXmTKwSbisSAFJd5dnYilJluwhJ17Wezs2r4z/MMT
         hi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567159; x=1764171959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqVd/I23ujzds6aG+1Lfyj/OLmPD/Ehk8Zy8jv9bGeE=;
        b=RAH54lfVsG2vDZyUAzeK0yw5mPWiaLrGQeLKTwTey3P7xeTgM6y/Fe7lvSnJlouVgN
         ZgsZBwom/R/QD2uVD51Xz+eLdK7CyE8z6hyM2x5hJZkyPTd6t5l7W5RF8MflYx4W+n65
         xqpkQ46/9hXzBdZPbYQxOWccb56xl6MaQtUDzMH55nrMP/++mxlSCnBapHmosPg58kEF
         KcrFodwSQQir6yJ3z2rNUh+UqgH0IZfUof1Z6NjSnamhuFvIjnARw/+M0eqfIP945rUm
         M/TYdrVgTYTu6+w25G06XfimIc6khwTxZggw6YMFaUE/ubpK6+gYQtEGCpfTxrFgKVsN
         3WjA==
X-Forwarded-Encrypted: i=1; AJvYcCWcn6TLoj79vBfbBQfFmbHXPlC+8XSdNarEDKszI8pmVAlYhqhRveGjoHnbLplBg20E2XyYBdmAHMbhjYADXbLO@lists.infradead.org
X-Gm-Message-State: AOJu0YxmVEsqzaOPU42IGlPprBq+qYXXnUlcFKyFg5MctdX8biiRT1uY
	SkmzBKEtKTbGU0jaWRonxFQDX/dI8A8nX1HM2hudAnniWvXVJv35r1tEyl3fPT40/+k=
X-Gm-Gg: ASbGncsrLR1+UR+jlTEL+bgsBjMqHomasMNUppWkuy1QRGgalQXzagsuwdL/O7AxPTd
	IB3fcKLC0OhVjKDX9hAbLZ/Fj9MPC14jqCrv8pZgbUdW4TdcWN9Xh2Iw2z4hmZiGUGS1bMKlIZv
	PWPrrnvu1jv76PHH+v85pHE866AwqXS/OB+qUCddjSU9OFjBH/8y5tWURdohO9aG4HrFZ6Uqp0U
	cu8G/nde57W1eIjcTFB1ibhFJ7EECeVjM95XCTOw8MQExKB0i4hc9wp4trQyFqNrPICYe0fHPuk
	xlFSlddl1l0wEBfIISdkFxLvmZA8zJZ4zNHx73rOWzcoLd+MGJEXU8YPncLyAjbFzbG0hF/Xftn
	hJO8kPKT1h/nKc8eUxtfkYcVWJHD9+EgMLxD1u2M+Zj+pwi9VJMN8XSx34H/i12ufu/f5324r5u
	i4QpI8UT//5Dju2DpXbcOEYJeNSV7d+Q==
X-Google-Smtp-Source: AGHT+IETZCFytuhcxmwyAYMbvVQ+k0LcHrDBKuExYdhaEVzislepliPqczS5k/WGmFJtVck24Vggmg==
X-Received: by 2002:a05:6000:2405:b0:42b:3a84:1ec3 with SMTP id ffacd0b85a97d-42b5937ff2emr21375859f8f.29.1763567158737;
        Wed, 19 Nov 2025 07:45:58 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:58 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 24/26] soc: qcom: smem: Add minidump device
Date: Wed, 19 Nov 2025 17:44:25 +0200
Message-ID: <20251119154427.1033475-25-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074601_695683_8F48C0D1 
X-CRM114-Status: GOOD (  15.68  )
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
Later on, the minidump driver will probe and obtain the required memory
snippets from the memory inspection table (meminspect)

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


