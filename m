Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C129E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZg1Qv/4mtP2MMB22o2pEVgK6OLFDKWOSAkJVQZ+VCc=; b=niPRnkDKNRT6+sFbm7NWQTzhCM
	T/8JPjyKqri4JjWL8eY6Qvp3ThV+208VTBMqrmbJH36HCh1Sd/650wsfeiL8D5Z8Lyf5lF4m2bk2I
	abjP6aSVwrRHZJ8NUWo1m+WqvRljzYVKIP4Td9zqmDwPqni2v/ziZM6Oe3sVDz+avpWCmkpqYiuSh
	/HCzZ9WKLMoJw4j+tZ5vFrLR2P2TMcAQDQ1AqBnnsLIbG/A7/pN09YlI740pjZXTHAXhX6JT98ZzE
	m29baUZwstiz2rM79t+n8YQXHpm5ikkGO3RE+9pXvv6yj5dkPWdirRye5AZEFHnmgI/5N+oux5prT
	gOmvp/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLij-0000000EoGd-2DlV;
	Wed, 11 Dec 2024 12:21:37 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLhf-0000000Eo8c-2SwA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:20:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso1281843466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733919629; x=1734524429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZg1Qv/4mtP2MMB22o2pEVgK6OLFDKWOSAkJVQZ+VCc=;
        b=fpOSW/UAlp4kk7VIEZVU2+nVUWhRc5wX5VanE1NM2JFqnQLOrwUvzZgLxPS1RLQ4bo
         oAjR5Odl/jo70zzyeXPdabNfMTC3kfjE8eL5IstVagJAyGkPVIZr+JaYpZsweFtKQZ9G
         1zC9jDfdDkJAq6yC9hG9rmztXdbmutTb7MALoqx03pq/1oolkNyKfMjvMyGkIB7LwxbZ
         uKvJjFen2Nad0ZTgofvgqlRKaLLgl4vFW7ZLsWafkxibCAmofG3cj19WL0f8FPjtrspg
         HQ4zvVgvykZfughB3Um2wdJK17Wl2ddtru0bCF1JBBPrl1/IR1h0MbF35K+MTmRD+pO6
         Fa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733919629; x=1734524429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZg1Qv/4mtP2MMB22o2pEVgK6OLFDKWOSAkJVQZ+VCc=;
        b=gOjy/Aea49A7xXdiAHS+V2xaBy8CqhCBGnx6nysOKFB/SfGd/8iZWSVi2DMODyPPoR
         djbeNtsN0xibb3etuYdWfFigXdsleXzTC7ZM5UKb2CXZCnWT3Siq1XZ1mSjYDG5hYS/w
         lbZFFUcHyXZi2McSqY9HEaUMryQFgf2Ui/CyF+s0kfwA5Ak6PUOIt3NPwlAQxsBja7bS
         0L00OFKvJTJqxUmCHtoj2PUeoUhgLMNiLOMYckGXWvgxaiGq6Ni7HDvnLzr36S5dReou
         dxoqChY07wmFC1OABf8eGWud3eQayaq+zQGVLbC0GnCBBfcsPAV54XsYcgD7GgKWjz10
         3bfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8uX/4cgjwZ2HOTDrWxrjluCoVZNreR+3vDCfTlWIy4L4HQ+CTB4+Bt5n8H4eEFONJC6kjeUcP/Cehc6Lt5VTm@lists.infradead.org
X-Gm-Message-State: AOJu0YwECaCNFYd6xu5hJFeLg+uj0MKTZ1hnUEmXI40qIhcaumfjs2QB
	IKoEciKKz0V44XBLr8hFEBw6z+C8MTMJq8wNaTleEjtZEYAdQ6Mv
X-Gm-Gg: ASbGnct2NyD2BWWp2UN8+xiLxTE7KGj1vq++pzgPdnBUSwBzfQdDqlLovs9ZASt7Se1
	ujvcJa6STIzLqWLUw9WZ4sqXvpedwoMNFcGj0gaJ1y6GS3e5Oq6ilx/4/Pveh0b6d1RboI/BElF
	tgLi56FJmWakJHazK2b5Aj9x3WfVJ7osdMaBozK7dkcQYCtw40bw+vxJpQJMmSQ66ECAuKd5r5K
	NEYRKIcdbDxVzBpTDdT2vgpCZfEgSh4MLvH+2Adnk8/3syyAhAmNfOSTNquTFwTnA==
X-Google-Smtp-Source: AGHT+IEcp829lZqDsm7lXw0MRlclUKlA4nHlWQBjQ5jFpBUMws73Uc9UVaybAO+Oqfzvd+n0cqJv2g==
X-Received: by 2002:a17:907:944c:b0:aa6:6ece:8eb1 with SMTP id a640c23a62f3a-aa6b13f7d49mr232417966b.54.1733919629132;
        Wed, 11 Dec 2024 04:20:29 -0800 (PST)
Received: from C-KP-LP15v.consult.red ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa658614e26sm672713366b.100.2024.12.11.04.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:20:28 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	michal.simek@amd.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Date: Wed, 11 Dec 2024 13:20:26 +0100
Message-Id: <20241211122026.797511-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_042031_628523_5ACE9FD2 
X-CRM114-Status: GOOD (  11.99  )
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

This patch fixes a potential integer overflow in the zynqmp_dp_rate_get() function.

The issue comes up when the expression drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit arithmetic.

Now the constant is casted to compatible u64 type.

Resolves CID 1636340 and CID 1635811

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61e..55e92344b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 	struct zynqmp_dp *dp = data;
 
 	mutex_lock(&dp->lock);
-	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * (u64)10000;
 	mutex_unlock(&dp->lock);
 	return 0;
 }
-- 
2.34.1


