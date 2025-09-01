Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC76BCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR5U0GiIoCstEf0PCG7w65hy/kq+C+pU3vbHd97JlMw=; b=ngUZX73KCKs9bYW1JLz9IMAgoU
	QqU8i7NolFSUyVj9I1hrtHJWYq5aCRa0WOZq7SqSk7LoAUzEj39atvm8cOl12nlppSJ8a2NL4draQ
	Yffvb04pHQR/9sdSSdlKCBKOmm6vqcivdsFXq3Rz9jPdAA05dEzJjGL9izXrUlM7HhAG3zCerSIkc
	NDAAW+OrOkNBO+Km8a0suSwnmL+nz+ODH6EB4hIucQeCkHpJkVKSw2uqBq6e7eY0uA09HiT+pBNNY
	AzQdyxHrp3bZ7bhE/ousYwAWnRJOyeehxCezUlC71+bZWyQlqPmqiK18TYyxgi/rvV96QihpKntOb
	7tGmmGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFh-0000000EXlJ-2Zem;
	Tue, 02 Sep 2025 00:52:01 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut78f-0000000DEUb-1A71
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:12:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so2132287e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756743131; x=1757347931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR5U0GiIoCstEf0PCG7w65hy/kq+C+pU3vbHd97JlMw=;
        b=m1hOX6g9juxUkOpcCLyZRFpnLF2P3kh/aTKmvKBOrbwIcwrMl2u35CM3B8PxIrx511
         Xha9LLxgfAt5a3YKJIk9UHrrH6GuIKSqvoYUfMj4vlqYnPjAE0E9QCa2BaEAzRPORfio
         iiRNAnjLEFldb4i0931TP9iV31dQZigmpHE+4KmSsJGgtg7KF3+Di5pwK/LzpusIewCN
         v8lqg4u6ROFxMqsc2M3QBRHbFw8MIE0cP8Xva1NVmyO31Y1cqa3QrHUQUW/TpIKQEK5v
         lPBD6caNKNVhfjcibxDiZXGbM3b+ViRieVGnw/6Yc0zuuncQOzqIYN8PXn8FvMdjC0Ov
         68fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756743131; x=1757347931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR5U0GiIoCstEf0PCG7w65hy/kq+C+pU3vbHd97JlMw=;
        b=oLj55ANSdEC6WtEjZODrB3KXPYg4IKovygzda+qru2BGMx6vm9FEERU6NORp0SkLAm
         JRGlRSOSbPlsfmK8/z8D3JrdNlTnuSz8wpcPDNduZXhTmDQdp7jY1WMS1KxzHvGK5QNP
         kOo72B/0Xl9t1NwTVf5S+/zAsbzqvRyWFGenMhuWbox8dsJcgcGjjH1kIfXjpEgLUiLF
         mcueCrxKiwFieITtKRSOtXarB6z6qeNEPqCuJ+UnFpyXk+1jWsVyLqmkPEX+6zO4TBXH
         BmBriUDhWKZA88ymYUBDcrv/50VwP2/t9EeFpNttUy7DrgNDCh18hKQpNJIp63FXEYoZ
         8N7g==
X-Forwarded-Encrypted: i=1; AJvYcCWSy4h2G7qgiSPU4ZGeQybvAY+GAt7CmbWlNnUAeL7OBJu+Xw0P8FFL65zMfFEgr13CudjU1PX/iWxdyNHohrJa@lists.infradead.org
X-Gm-Message-State: AOJu0YyZA678taXYD2g+biEKhze+SfGTNFZxK98/5Z+ehk5P5gyTiZBH
	nZ8YWHFj0Wn2Zk42HWKx3vmFailnzFOzd9H3HMLTOG9bEV7EyVlbxiF6
X-Gm-Gg: ASbGncsnOF9H0sNQdmi0+WtSynpUXrzpuZO0EPrLZqG7HKvD6OJc1jkXDc/rVlIn9bM
	1AX2MBP6/V7PC2Ul2TnxboYSPCcTub5dRxp+ETK8iERyWqXHtfOA6doViVc0iiBSnwJZXKGRfxT
	BtZXg2kZn/Sa5c2X0H5oLm40xyXgWdfdETVydymGzFSos24K3vhTGLNliVdViKjHI/dbs3hDLv4
	j8I89uGqp+YDO+4PNr3eRBcfjvO2LaQRZ5W1VuhN7d313wUeBD4a7AIezEqUTd6G8kjqb125q6l
	HV0URHHa5yyaBlo425p3DUxRdoiDr9wjYiI7RqYbYltG8a8HBktitVfdC8lbCagozO4r7K0fmKq
	6fV3slAyoIc6m3CERosA2JP9xK/R16kb7yuLatbooHmCOhfR5yuiQLhFuTUG67Wc=
X-Google-Smtp-Source: AGHT+IFaXqH9CADxycoDgqI+b75bAc2xtq7NLNY7LkOnLxNd2myOg+LoH8eqmbYeCDb6MhFjgIF5fg==
X-Received: by 2002:a05:6512:a90:b0:55f:6902:c9f0 with SMTP id 2adb3069b0e04-55f7094841emr2964984e87.43.1756743131319;
        Mon, 01 Sep 2025 09:12:11 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6771b237sm3028827e87.54.2025.09.01.09.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:12:11 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware: arm_scmi: fix alignment in protocol_id_show and debugfs calls
Date: Mon,  1 Sep 2025 19:12:03 +0300
Message-ID: <20250901161207.2501078-2-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901161207.2501078-1-artyom.shimko@gmail.com>
References: <y>
 <20250901161207.2501078-1-artyom.shimko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_091213_313995_056D404C 
X-CRM114-Status: GOOD (  13.11  )
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

This patch fixes minor alignment/indentation issues in the SCMI driver:
Adjusts indentation in protocol_id_show function to maintain consistency
Fixes alignment in debugfs_create_file_aux_num calls in raw_mode.c

Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
---
 drivers/firmware/arm_scmi/bus.c      | 2 +-
 drivers/firmware/arm_scmi/raw_mode.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 24e59ddf85e7..e1e82139997c 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -298,7 +298,7 @@ static ssize_t modalias_show(struct device *dev,
 static DEVICE_ATTR_RO(modalias);
 
 static ssize_t protocol_id_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+				struct device_attribute *attr, char *buf)
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 73db5492ab44..c85647562ba3 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -1280,8 +1280,8 @@ void *scmi_raw_mode_init(const struct scmi_handle *handle,
 			chd = debugfs_create_dir(cdir, top_chans);
 
 			debugfs_create_file_aux_num("message", 0600, chd,
-					    raw, channels[i],
-					    &scmi_dbg_raw_mode_message_fops);
+						    raw, channels[i],
+						    &scmi_dbg_raw_mode_message_fops);
 
 			debugfs_create_file_aux_num("message_async", 0600, chd,
 					    raw, channels[i],
-- 
2.43.0


