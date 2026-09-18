Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CBDC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=; b=gjetFzH7k4KF8aM2QH6pWVz2OQ
	j6EE823TGxqtw+ucRpLMpk/IbzPESUE3wp1fCfkP3ewBln55mpMDUDwU8m6N0lZ0CsEQQ59wySSNK
	YJbUArahwhvGkT3iV5U9GlzLT8kBOhoUm2VkCqcCuwdKp5SEIDQka9+b0Njw1xwNgVCFnXSqmWYmL
	rRI4ju7z8fMkXvPr0TIrY9Rm3F8kAG9USMF6myGnmcPxGV+jvjf4JZ9iUJ0Qy4fMI98br81mYjqvf
	pn2uZ9OKWNPpZ/N37LnucSfto3gt29jqYrNRfgpR7jMs4PYpdSI9KFDxTY1hQQyUgPKzM7e8/SkK3
	EPQfYY5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrT-0000000DM8f-2Qpj;
	Fri, 18 Sep 2026 03:02:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrI-0000000DM4Z-0jL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:01:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2dd68a16955so13779935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700511; x=1790305311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=rF86RTV14mixnF7EZFl89/335uQuv8IbboAvp/QWwsOPkH0SnDCjnwKmyxuWfepLnQ
         lq55vsMaWd5PYBlD9GcM7ZffX68uJF5UC8WTChIMrVyCrtJ1DDB6GEXyvJoIHywigq0u
         tTLA32Pgwxe07tcSZ8S9dv0P9BNyt/sW6wEPXM/JvbfRZ0dQtHecob2ojmBJ//2tp/GF
         UubLWFPZGWy4KoL4I7gdXXIemfnYwYSqZx3Cp2cM1RA+l9itC3Qr0VpXwqdX+N6Qnyoi
         iviV+COenGH2cZtKSARnVaAeniv0Uk7Tv2EGDDNHAkFycCcblPdPGdTrlxn6uELYhGMa
         9KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700511; x=1790305311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=Jof/AVgsd4CnyHGOxHFQVntLoEcxtCsPG5vHqtR9jH1koDkwIN0Vwr3laOZX2Sk20J
         lTINUo4TcbPTIRtPMmwIwCU2o6RGRSeqNiTU8+yEdpnHHm12WVGxhm0/fK+4kA5/19Q4
         R9AxmhZM7EFKlNWPoQKo2Q2Xmp6RMEzZLzHNg/oDvg3HSjhbH5doeVPHFNCTfSuHmQf8
         zCKpO4Hr/edp8YNVX0wHZRhBRkTUZkKUShYa1nUR/VVKeBV2VodanqEsIBkGX09GXO0Z
         7fMnr4ElDYime28ZzCT/O0K15RgkP7HSaepxweiZoA/dv/5tCRHTL6B802e4tMZmswdf
         3Fbg==
X-Forwarded-Encrypted: i=1; AKwUvBzhCpuTA+/A5NSSWW2qK/1Kosi4ZqlMhjp8J6TQbdQbtIWC32eA7durwbwLIuCFB4jSBZPagNV8M/Jlq6RIu8/f@lists.infradead.org
X-Gm-Message-State: AFuF++nQzs0kTg3+N357/SQNcTfkgDSV6LpCnw6BLCR78DZRasw8VsPr
	3MzbgLOR95xXTmNhBCaMaEVfabi2VGIagosmrXG5XriWrJOkgIw6RvlI
X-Gm-Gg: AYBFou3AEP6YE8BrXmzE0tM1Y7EFdyXkDrG4vhb0PvqDQXOqUQatoHEESX+UTCuOKuB
	A2KDfG2HL9cZZJiVMpIYlFLlQ4mdeqT0eyJtuZIgWpM6PfBdYntI45wJxBky6AoqnDK/jU4xfR8
	dyjgCTTF4AIMLKzmgqDt4wgadEHkHwKExXBRUHSFQe2X3Gjozg6bq8+S9G7blf39kwJnugKQ7DK
	ZuRpliKOEhUuMDbV3cgj4gq29XLUXlaa1EqcesGnZsTJaG+KNP8hLFPCEZEdd//wywV1J5W7qop
	6mrSnsyUlHbMb7vScvPjJSR8YKUXijgN0eBqleeIV36iuKvzMp/aRPEmc9RkwUU3866ePtungbk
	9eBlhTeoBdyH3CofMpqyjBkWWg2I4or8uaqWGeOMTAx9CbbQ9/POH4r9Jopa+9AQBQpuvLBxktM
	FD7mcU3xhRWgWGtHsS3yaS8WWTKbUzs3BRZBDwQLMN9xk5eXsN9aQrdJxgVZz6OuRHP71AUuoOH
	vVuS578ymZe8NPLt6OEymORIMyzXdQxbdFj5Us7ggVOu/wGdGjFNQJX1Z2O6XEKcanY2eLbFQ==
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr7741778a91.30.1789700511242;
        Thu, 17 Sep 2026 20:01:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:50 -0700 (PDT)
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
Subject: [PATCH v7 5/7] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Fri, 18 Sep 2026 11:01:23 +0800
Message-ID: <20260918030125.315978-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200152_329625_1FB64781 
X-CRM114-Status: GOOD (  11.30  )
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
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f7785..7d630a667a3f0 100644
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


