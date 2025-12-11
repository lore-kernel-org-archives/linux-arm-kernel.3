Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A775D4335D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=09llb/bSY0mgbOt0WKaxBGw/YRUrWWHAQNbkHm/vJI0=; b=nkyjlASDK0k9qvEYQDRJJK8xNS
	79uYBv2kZaA6gvvTRGUL2I/FWCwBn6TpIj8dBL5lCazlh/UnXX/l6HAsc0XOSRnQLWkaS8Wsn90kQ
	/U1/97KMcg0J3cHpdt3si6XPBusfxBYROucIYpzoHd3IOfyq6Qivbb7a6PzecjvKP2Fu4Xv8HTFuf
	mTde8jZ5+3qETTwv6FoNogoznqmu1eGdLcS+y50w1ByxFCJfDQhzUORQ4ybdJurqcXsSku3Ie86Q7
	qOGWhSNRbS28cFsiY/CBFzrmhbmDqSP4UxBRCEQg8OrhI2ceV/UeYhVo/F2G9AOLJFiDUn5ZHQqEj
	LyT7OjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpWI-0000000HNJc-0Ajt;
	Thu, 11 Dec 2025 22:52:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpWF-0000000HNJG-36YI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 22:52:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so953108a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 14:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765493538; x=1766098338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=09llb/bSY0mgbOt0WKaxBGw/YRUrWWHAQNbkHm/vJI0=;
        b=FPIECcgaCXuYl8vyt0iJOUJCfhNlDEzqd0IGhmFRK3buX8sJ2zaNITfvSvG/y3SHqx
         OURJ1u+GmhsDAMUxV6+RLsa7lnAhzqakXOIT6yUGxXVgvHvEczLvQULhyZlJI5bqVIPy
         RP42kbf9UBPo16tl8BBr3w8CgEmUyJ58yFloUsBLsxrrhitMry456VZ036bgTSI8bC5n
         snNcXTeqObH6QMWeNwrKiE6UMw4VoVz1G6diOypeY/KlXcgh4a9PgDXC58MdCTrrswqv
         KcCtg12mnBilNmxB2alwz9na09uGD8VTorpsX/WslCJpPlT22HqCFLdpV8H5Iv40d52o
         s/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765493538; x=1766098338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09llb/bSY0mgbOt0WKaxBGw/YRUrWWHAQNbkHm/vJI0=;
        b=ZYWqc5qM1yCoMzRSdBcWajVzNFWIVqNCll75+LtNdmk/OFNblvK7NMryeC21/Gma76
         yFlBh8qDW96nUeENUkJMnA5VHaPnKN+ndNMQzRjYtvwgPIQH29elJO6v/8HIu77VY4JT
         VOZGffdHEGSYv46KHi9k0mIeO8xEegUASGdw7nUcGVZS2c97YyovcWBU7gYSdqLtDqzN
         bTOA6yA9f+5CAgJDWhf3tQdtwO1lvfuIYt+R7MVI6SLZCaIQuI7z0JyHg/o8X1tqiKcz
         5xXDsdHC0dQSBVpq9mcF9oVRo7SojXXDrfKH2UHcMSXOt9al3IT3yASvHM0ljW79nSoN
         i2AA==
X-Forwarded-Encrypted: i=1; AJvYcCWA3SVC8e/W0YJPB3HDGw+hIjIgXsrb4BBe3E7ThMXw4vcyTxNqhxNbexKU3LTnihfddT+IsB8lCD6Uvgejq8A3@lists.infradead.org
X-Gm-Message-State: AOJu0YxlC+pA/vWEdPZ41TJ/nt2EZvt5mW8pe7aUClIIEPIlLkdnDq9G
	d7U7FLrMNBipeIzLyuC3ZdloqnpTZfQg3Fgpm3VpDO/qJKswXxY9UoN6
X-Gm-Gg: AY/fxX7PfzhUuN2aK+UQAwk5mbrBtg+rWx4j1CFW/Y+e01KfaQOI6vKIlTbnb+E/RWK
	aobFZYPXUg31JiIhjHR0ZEASGHVbxQ7o3O2AnQgxHZZUvbJvt4QSgoNvHHX2fVlepAM/lcz4sAd
	nLDMXo/B5zQuQmwG/ZmvQl1f0f41zRKkmdzOGc9nUo3RD0WE4BEdccH9DD6d9fzoqSQ2Q7/XH0g
	I5BHA4OE2s7Dkt/t1kGR/ewJ9thWL8X8qBuWTDNvH9soaU0AKUK+eNUBQIo440f9YreVIY07R3s
	oUYvdgoog9ZqBcUIyouvJhAyfK93rKBk7pakMNHPEdAHi3t/aGPfnT8sRqHgweUg6zoeAWKxbA7
	+J7P/b6wgit+AQm12yx5pZAnLif2M62fSb4mOIFUa6jkMaJLP8pUaHXWcaeE0z9gwNcDDNAzYb8
	r5lNrKkw3/9PESWH4BEQtF+ZhX8w==
X-Google-Smtp-Source: AGHT+IEyDaVAxyVQR6Uk5+Qu2gG/4xuKgZJSMgON/U7wgtg5JENf1PcVjQ2HIj3b3UveLtFXLBRzTg==
X-Received: by 2002:a05:6402:1ecc:b0:640:a9fb:3464 with SMTP id 4fb4d7f45d1cf-6499b168982mr62178a12.7.1765493537712;
        Thu, 11 Dec 2025 14:52:17 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:ddc3:acc0:61f0:9df6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649821316e4sm3771707a12.31.2025.12.11.14.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 14:52:17 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Jing Zhang <jingzhangos@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic: simplify vgic_v3_redist_region_full()
Date: Thu, 11 Dec 2025 23:51:09 +0100
Message-ID: <20251211225114.20474-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_145219_787845_62D60130 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

Simplify the function by converting the if-return-false pattern to a
direct boolean expression return, making the code more concise and
readable.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kvm/vgic/vgic.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 5f0fc96b4dc2..04dd2055e7df 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -382,10 +382,7 @@ static inline int vgic_v3_max_apr_idx(struct kvm_vcpu *vcpu)
 static inline bool
 vgic_v3_redist_region_full(struct vgic_redist_region *region)
 {
-	if (!region->count)
-		return false;
-
-	return (region->free_index >= region->count);
+	return region->count > 0 && region->free_index >= region->count;
 }
 
 struct vgic_redist_region *vgic_v3_rdist_free_slot(struct list_head *rdregs);
-- 
2.43.0


