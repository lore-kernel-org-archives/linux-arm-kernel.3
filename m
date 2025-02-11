Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626EDC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=; b=Bnu2a3lFfNCxHxqslF3wt1kD+t
	aEKeHfb/IsY6OOt1SWS9ACThZoFy5tDX5JZXwr4VG108WSvwO9aM6G3diTdTufEDf5d8D7XVme3y4
	M1A/b3xkfmIYE1SykpiKtAcluQesxsicdQZCqFEqYF8D6c7COQxFe3EhPdY/enFGeD4jYMeetFAxE
	wnDT8oKTnCY+ePAlojlHV0ri6o6Kbx7+dzChK0nM0z8Jlayn0fMmZAYbmrEXbnCdaSXP8K0uk1NTV
	cN3tPt2mhmNBJZ+lBIq2KSrfG9SmWSBwfpUWNXkfLL8XYzrRhDWAKPp+j7AbRWcodFB9tsGVjoc6a
	AmEYaBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnoo-00000003Prp-2FgX;
	Tue, 11 Feb 2025 10:48:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thngz-00000003Ntw-2PEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43948021a45so16334795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270436; x=1739875236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=;
        b=NwRocIJ4pkNO2H0ljn74StA94nPSMkSW5Pu9Pfpc4msAKjvLQ3ANLHJQl9LEFyucyL
         ewdnvKkJT9SMELqodR8iqHhzJAFZv5lkFZT6O/Jn6UWFGs+TFUryNwu/TWM2hRtx4cDJ
         yr/Iq+ZUAyB4zrOd99Y72urYWIm0TNNp+RGt83cgKyPatMfT7suoIKaGJ8GkoXNHJGel
         BU9uElTaSOhpy18dDOxwmHlqKjQKsS9EFloxGppK79+KEpwVSiNjmvCU4QAjr5KTd5iY
         g6EcSSweb+vONiquuWV+5SBowHliMKWVin3smCFrV17/BhUw8+rj3kzafjGuNKvAqrHH
         6qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270436; x=1739875236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuiN1rfKfscB8sMfW2+d+Ei1aGExcejRdUcNsTvpxwA=;
        b=LvGJhGeXBTKIazPvEiAmYwEffHqFAkUFNQelSsHwUT4R1bzyTHK0etbESg6YNmphsw
         odsP37FPpXosXvC6TL9r1xVLZ/0ZdLGghzCch4m7K6DjBlsm0y16Q4vXgfSqtHzsjEwh
         TNzRnEujCd87twZPYNjy8hegHd9f0A5/8KwihghbAtNr5wZNwf3Ch7WQryyb5Md3J/Q0
         PheDNp+K3i/oaxOZB7dKWNFmgZ70hvFHPZzZqQ1/G9kfuoiomNFAeg10QahDwOwDgBIV
         b0OGtVjL4/FRlf/xrbsp2sPmI3t0zZ+aW4I9Dxkx+Wmd/yjPH9nLHAX0Idl4pm4LBP8u
         M3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWph+d1jYrormCOOh65WhIKC7wXos/tKBn4jP/aE2AGSufM7/9lVZao2bz/oG9M8Yfeioz1q4VOZhioFFt//yct@lists.infradead.org
X-Gm-Message-State: AOJu0YwXiUJIwv5ATROuhMsRqyI23pls8MmLsnLIAfFYIrEFKItxAtCs
	dPawjEIDDvtR+Wz4l7xCB4K3o0lfcGgeGs8BglQCQ5dv+3goCHX9EbZNxT2zrTg=
X-Gm-Gg: ASbGnctGfUSgvYNDrCx3boUvDvGhlh4KrkENm0l2ly40F7LeVSsMxJSKIjT8bvrt7HW
	XMjPW7LxSgeDIV6pwcH5QSlb7VMF6PWopmjfPDTdgwzQHMwe/tpg2SC2PVfVbhB9IZpCZ7Zvj8P
	VpE8ntGoYikscu2Rc7+vYtOsx0aK3h6rLSfmTTleSIKuOXLdivOJBUVz1aoF56L8w8vc8lw4DCH
	wCZFInp7wNum0mfeq+Tpt7+4N2JOHY//NnEu/cQcAmOY5tDoGNRV9V7cLsdHDj8jDRtdCdbcXBy
	GvloUvgWQwxm
X-Google-Smtp-Source: AGHT+IE1hxIA+zty0IDfgAoUxOjIOrc1e6B7eBLp0wuK/35clgp+dxoPGKaDdwuWgNf5QUZVkobIVA==
X-Received: by 2002:a05:600c:4e43:b0:439:33c5:386c with SMTP id 5b1f17b1804b1-43933c538ffmr110046565e9.5.1739270436244;
        Tue, 11 Feb 2025 02:40:36 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/7] coresight: Only check bottom two claim bits
Date: Tue, 11 Feb 2025 10:39:39 +0000
Message-Id: <20250211103945.967495-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024037_614034_EE3B7B58 
X-CRM114-Status: GOOD (  13.76  )
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

The use of the whole register and == could break the claim mechanism if
any of the other bits are used in the future. The referenced doc "PSCI -
ARM DEN 0022D" also says to only read and clear the bottom two bits.

Use FIELD_GET() to extract only the relevant part.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 3 ++-
 drivers/hwtracing/coresight/coresight-priv.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a669872b4118..7b53165c93af 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -129,7 +129,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
 
 static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 {
-	return csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR);
+	return FIELD_GET(CORESIGHT_CLAIM_MASK,
+			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
 }
 
 static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 05f891ca6b5c..cc7ff1e36ef4 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
+#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
 #define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
 
 #define TIMEOUT_US		100
-- 
2.34.1


