Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A239FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phPxbutaSa2cHj8lQiAqRNXIpOiUr1sfgJg1sLmhr6Q=; b=mJRhjcIfxFDP3BzfxxSzOOmlOh
	1fLkUnKjn48BBiwum9xKlfWYEiHXbOZ3919Hyge8rwMoQZqaZRoxIEOJE3LbmrpCDMBw0Gi/WyKdY
	iO2/oNUn2UHIm1qXCYAlD8Y9bKwZiZiUFjl/u2UtGeyvy2BWuxNMeVlhLnK6GnjM8X4KbJ3YGCpKA
	Hq04upUc7mYelcVRVHvnecxnSKkx4QGX3Fyv+kl45AQ9KCK2kgWFmmmlx+0RMeLIg2OXOxX84VokO
	GPhYJPPz5lObgGb+YmPOgt4yAs0/wKC6Qo3Q4YWNl9K4Il7HRxfdF/zHizW+EfW4tJOc+BjKiLVf4
	PCBA/OVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrT-00000007rEa-3NMW;
	Thu, 24 Jul 2025 15:27:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR5-00000007eqd-0vCs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so7221845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365398; x=1753970198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phPxbutaSa2cHj8lQiAqRNXIpOiUr1sfgJg1sLmhr6Q=;
        b=EFcGovTxvCsE8JLkBqSeroqoUNZ2kRpCIji50mvSn65UOzjTYA9J1Um/IYrCQpGvXH
         qu58ozZIAL9tpznjvkNSWi2epqyZ0Z+51mpZ0vgBrWGX2rPc6u0DksqtmfO8QvNhglf4
         h/OwbrWpJJHZJENR75QsdEDzlnh9Qj/ykZ3bA9QyKFnzqg8fKvoPQ/lCk3LyIg5VbBPd
         Uaw8W79VThPtB8TVUniOdhDvCecgxnjhj9fX/gntWXI8slcxfqEU1wnzDsUasM8qrIdA
         HLO4ieiLszP69wIbUelBvc7lvF/QRMOkYj9CBfD2pqZgORrG/yGPGTrUgydLC8xdGAQL
         p18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365398; x=1753970198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phPxbutaSa2cHj8lQiAqRNXIpOiUr1sfgJg1sLmhr6Q=;
        b=j+34Ikeft+hfIm340hc8a5c358U/An8UsXubgOVe+4z1aa9jWMpwn8pXyB1xEHVEwK
         rLOpclyQRxD4XAnOVyaLK6E4GNdIm1xOkBbJKISlDPSLraSbpQyeG26YKSepYCJ49Vgq
         m4+wmdF+plVutX10YWxXa659nN5iyUeSIATVaYIQI3YZf2+M+Ly3PewHXzlZsxG/HZoZ
         hrP3mIkqbcYXNhqOeN93380Mur59Kpo4LGugCH9UKFkgnGIL9me6NaXHCwUIJ8l1FBe8
         L3vHLRno8aQiDl97qlZbF+N3jvAcLPYI7kFl3i4AQUw+J1uYe52GogbbLKucfvzVxAsC
         6eVA==
X-Gm-Message-State: AOJu0YzwjbzmMkN63FyL21SmRCCYMlGZ4XCyHThfkf8R506/BkPn3VMv
	LqHAUD/qxCzl7Ei3cXI2Za7anfMjz9ATY2RCviQEXxAuNio+oRcheEm8s45xZDPda6g=
X-Gm-Gg: ASbGncsif5PD1i+sd3PcboJhegxUWiHSqW5zxqRhrHmIdxCo4C05wPgNwnIIJ/gDcHx
	g8Bofl/F/H6mWIKSP45XCRVNIZlkj4gdEBEzp8tnpi3zU/FKUdTGumT0S15MYBJrfaEx9cvnN32
	uqmC2iN3fw1MgedqQPKhYa9TT0Q2EKl498bJKxpjRXbNjhSexj1nFYowh84wIGyVhwIaYNomN1P
	GUM+uKfLTUfaw9ZohLc79KdXtTXhn1aneVSufJAlV5ezGvudE1gP5V7AMxvK8++cJLBza7j2r/5
	VBzykuVjcTk3LmxaxECBhdy/13zV5fix6/oUNYTg7FW4CT+GShEcIlD4Hzcd0hkMRLW8C2IDzXc
	b3rpgfxZuPT9U+nDWtWFJG3NgkJjCddDcxn3MLZ3CuHLOm6Pie/PnBvbgAiUYC2drVAsQTvLibs
	3m3fHDnB5vhL9P
X-Google-Smtp-Source: AGHT+IEzG7rA7SjcU5/IexjXqSf6MXBAUKpIcrbkFM4DkAzOo8wQtcA8euIhs0yEfuaDr3L1GJYTKw==
X-Received: by 2002:a05:600d:d:b0:456:207e:fd83 with SMTP id 5b1f17b1804b1-45869ea827amr55222245e9.4.1753365397698;
        Thu, 24 Jul 2025 06:56:37 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:37 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 17/29] mm/swapfile: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:00 +0300
Message-ID: <20250724135512.518487-18-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065639_254694_E1CEA5FD 
X-CRM114-Status: GOOD (  10.17  )
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

Annotate vital static information into kmemdump:
 - nr_swapfiles

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index b4f3cc712580..ac5a2307a278 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/kmemdump.h>
 
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
@@ -64,6 +65,7 @@ static inline void unlock_cluster(struct swap_cluster_info *ci);
 
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+KMEMDUMP_VAR_CORE(nr_swapfiles, sizeof(nr_swapfiles));
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0


