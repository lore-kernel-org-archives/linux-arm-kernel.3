Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6D1CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97AWU0M7d8gQpSwlhcAT1m8L/c8BayOz7rqc48tFI0o=; b=2Biii+XC3tYN1btPSEbEXI8+F2
	2MWpgk1ON7E1Ke4ehNrrx3N7nE9kcXnvCGtUm6EHcFc87aCYQYcTXee9MldDZF8XfgulytqocwEG7
	ag68V0dR2hVY+i+EsysXBO8qZfj3fOFdRrXiZnEg4Dd0OuKSAgpSF5nrB+m4ES59c05GvOcL9kwy9
	p4m3Dj3cWTw0ahud7f7aWM1Hbonqt8wn1fM34q4PBdigqsJfTT/dOB5Vn6wz6kxJixLkruhLtkxAr
	gXDSsPEvM+Mr3/dlakGrKKCPCuS1MgmSXlQ/Pk1TgInNGZMrEO50IdHMSr0kcLEgO4b+Q7p3VJiId
	66iB4vmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgeB-00000008vvf-2iGC;
	Thu, 25 Jun 2026 09:45:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcge7-00000008vsN-2D0V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:45:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c7ecaadddfso8520825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380718; x=1782985518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97AWU0M7d8gQpSwlhcAT1m8L/c8BayOz7rqc48tFI0o=;
        b=KWbFLNCyHjnXCeynGk7eTEveASLgGFt5Qg/0gJIDDpYBofoqSJwcOVibgtKfCJNb6R
         mDizuWGgaMOH9a3tVK3zm9e+pjTNiYFLHQf0bEBrDBFVtYSdxMCJXAKW8XztdcK160lV
         2MGe/aoLqEPMKWuV8TMRWjgoYLielOlvjCJ3ToPCFMKwkR+DHP3VtuvehjQIsvS7tvNB
         S/DE3DTjfdjAnim9gKznu9Z4uGSLh6RYoZV0f4UhwkVzsYQg+aHL8nYjNEPvLzcIqovG
         fBcu19egsCopFdW9M4TPVfjP23jGfpzVVhk8Wj7A1LVa1LIGAEIKKGEynKtvyIA/zE6L
         do7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380718; x=1782985518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97AWU0M7d8gQpSwlhcAT1m8L/c8BayOz7rqc48tFI0o=;
        b=kfcaEpgS0hqFqvvgsKiyZOwkPLtZdd9zobV8NAMD8/gNYMaZRMXTY4Urzv6V0FYipv
         dGPALqoB7lfmlDezW+jl5AbGTIvGXfqSEGamhLODiKq2Zf1Xi5g2TtpkOHq7cuV9nAll
         WlBgth/CtssWjd282VAHPeCMqZK5rfb1FDcepaJbGkNAMJlD0TBSlOd62vYLPcDjAF9S
         SES6zCIKNN441pLwvFedjcmtZPsuLibgHS2Mv5EtZXbB+LVM98TJLVDiH/k9jgliBqio
         2Rzn2qreje8RrAYWMWcOQcZzgpVrn1BbkQSpsM3qTulCxo0qortdlZaQKw3BHFu2u2Ll
         erCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjYPP+dQcepxefUxreO6MtaQR2/oHcTbCqdLzzkaSxDx/1ZEQg7us3HP9PmU8LmQuRRS8r5Z6miNdbiVdyGJ8y@lists.infradead.org
X-Gm-Message-State: AOJu0YxFVyoStOaopTFRO2crsi/ZoJtzTNNmfpMxnkvTcWWZyUXQTS54
	s3a5VUKfOLxsc3DAzTGsSwMHg4LwpGQpxu4Jq4WLQlWIR4gGjmHm2NBO
X-Gm-Gg: AfdE7ckc1HyYHKDGHqSdjJ2N9C8VisJXfUXspO0g0L9cW+o4OSJLAJ/jrQE13mr/4QA
	8Q0xmioc4iAQpomFsVkXRlhmkYXwAsXb/7wWSGbBoH0QyBh4Q2rE7jhoSALi6lmdFabglX8nJTx
	t7cHERYr8S1VjiCUStgAy8HKAX6UUxshg2fNUO7R8NQ0M1vRX9430D2rmQwaHwf3cqcgFMjJZFD
	cJHrpE2PNFfCV2SFHUR57lU33KEcV7lstyYz8lACWI3A6CiTFFmFnOQxBguRwxPvgqY/nxjmrNG
	Q0uQhcFOgC/Ck9nboHi6ga2x7yJ3oAkPtXeq1imYZBO+cINb2j6bzYBmTHDNjRjtqBq+X346Vnl
	pmA5vnnMTzrM/3SmORnZEvv3xgmH3hw1K19T16Vk4svec74Ez33Sn9M2Fp6R2vMQY41YDltmQia
	QrSMNkuMtTKPL3Pwkn2Hw73ACiVpfX5vr77+KO73SMfva8PM8xfu6WlqR/uRgawhefYUUSZOS4/
	1kW66BY5AmE
X-Received: by 2002:a17:902:dac7:b0:2c7:f520:45d7 with SMTP id d9443c01a7336-2c7fc759236mr19628235ad.31.1782380718561;
        Thu, 25 Jun 2026 02:45:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:18 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 6/7] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Thu, 25 Jun 2026 17:44:48 +0800
Message-ID: <20260625094449.708386-7-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024519_570283_2BF7DE11 
X-CRM114-Status: GOOD (  11.37  )
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

The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f778..7d630a667a3f 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0


