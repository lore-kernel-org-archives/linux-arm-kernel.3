Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D9BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=; b=36GI6jV61INEI2NLcWKuVBIkKt
	v3HEqJGwiZq0z8sriW5RJuRW8puwDg8SnSdTv5lwg7tj5IGvuW9FJdGHuOELVw/hl+Q/hMq4n+4N2
	WM5Cqqe/YCSA5dSeQmOtH4Je8pJZMjLMutGcXJHczm5axxKeECXkHWgrXS5op4Wl/Dv8v5jE4uxr8
	9V3O40RfzaQLup5ViqOVsKvlqOplgdqhkNQ1DtAe4wwYzbnsL5TJGcWpqkWWi7Dmps+TRX48QBeaF
	jE5uL3dxzP1U94JyjGFHNn850s1Dsk4iGShoVPwRFaoRg67L0BAFo9GAb/K6IRGYW1N0wD2JslEhJ
	yrkV+3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CXp-000000074Xd-2rk1;
	Tue, 22 Apr 2025 12:16:09 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrO-00000006x3q-0y7L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:19 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3535171f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321536; x=1745926336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=;
        b=SZxYzJOitWlnY2F+e1Kc/6gPT5PExZaW3Y/mPUY/zv8Hce3X1372+xgsUwFMIz5pCo
         kd/IxXASGI25s+A/rLrDlrIOTnGEu+12IyrbPX3nzzDKvOTVFtJaWcEVDOQ4MHR/+ubb
         LZb/l0yS5dyWCnLcilV5ofa5ocwyuO2z9MWMNG57xohRMumY1wlNs/nAEXi2Wq8SKHBP
         zEGgGVlanQvF7LwTsvi+ugroJSSruRz0H2llsqRIgjtbZacXAOnB6ifpSmbG/LJG+jBy
         ZwfyDEK0bt7KQni8SwSHAxLjqf+W2mWgIl6R7HfW6UNFEMuCxjlTaWCfTDrlRQcIT4us
         knPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321536; x=1745926336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdGiljQFkRF0Dbr2acCgX0s9x3K0UlpkYw5viR3VBTU=;
        b=IBl8qVdlUHYqFvEaFbayNjANWgOoUC3h712DzdqUK93/D6We84c+kf8cnxkTjXMNjY
         VvPHsqdYHeA2LA/cl+qOVCI3kRT6P8r7T0vMIb+vP6cO0kEcKa5IbD71MelqOGImhpGg
         Klo70Eg547ogfeS5kiDZCudAs5rHoKrEoSdk/DZLg6kGrqYlcg0v3Ir14oPmnGCNw/iZ
         29iXwVlMXHgw6ZqSQelgbERFhfa2PfhLYLCrUR1WdX/83hfs9QABT8HHoTAI8jgPFcgL
         oE97hAXezZwv/u4F9C+vofXxrqQWYz21sr0D7NLi6yO4hQv8LsgFMnJ6jdaywqkyD3dx
         lllg==
X-Forwarded-Encrypted: i=1; AJvYcCX9fA/QLNUcv1llfXyJgbvDzDLpjn6ag2J8SSEKeJwUGpgloJ/pOWrqtwnj2Q/S1ZMhjsL3tSF2VeShwwW2JlyD@lists.infradead.org
X-Gm-Message-State: AOJu0YztzxyxN8nzhPdoKQPnSG8pWCYDCU1VgwHfQmEX5+hPRqZOHwsR
	BokqjOoptXTAazD7gIo3LcaSpwE3ALa54eQ7s8taYiAmBfRjE7vyC15+2tLMZo4=
X-Gm-Gg: ASbGncvvjE2bFLT7aSv0L6/lutDZ3xeiMuzfqSuH+nQsvW/loVDEtWRFDpOg451X8/0
	PcyGSZPoApJGDWkf+40o8SjEO2AB0HwDd6dFYxsbT3qvoQgQh+NNQvlMKyGXONzXDsNxjLjb4cX
	J7HBxPwt1QH097/QYrK2Zmjr1PtuYQVdvX6IsJzwe1QrUSBPnKguj4p+YZWbUO6DCW+eCOcFC0M
	Judrm/LBFdVILISwN8mubSKy0qb87vHArF41p1qzHz4989QKazRoNYL3ejdvwnwLpnSxIMbaTqn
	MMAHZx2zTwVsROrUGrC8oGEVyDQr/At4GNYa9N+vHT0OLvk/Cm/w
X-Google-Smtp-Source: AGHT+IG0T8nDsUkbBz1LgLUHc4nOz1k/hW6xtvig54WUQh6HRN014aiXPO5h8JbbZcarpvLjXHIJ/g==
X-Received: by 2002:a05:6000:4012:b0:390:f9d0:5e3 with SMTP id ffacd0b85a97d-39efba37dbfmr12326916f8f.1.1745321535721;
        Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 04/14] soc: qcom: smem: add minidump device
Date: Tue, 22 Apr 2025 14:31:46 +0300
Message-ID: <20250422113156.575971-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_043218_267836_1CD5E5F0 
X-CRM114-Status: GOOD (  13.13  )
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

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 592819701809..985147b563f8 100644
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
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-md",
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


