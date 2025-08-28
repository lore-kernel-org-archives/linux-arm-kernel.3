Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D24CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PxeMfx1+uNFbtk5b+iMV6QezPtIYzUJuvmOTjg2DLuM=; b=TMekfj1k/1TldLTU/K/IgzMn1d
	VHp0QCom1CgHDzy1OHyBjDlGu/JDZLHrVB9f4lVB25htuxxH2tb33Shp4EpxgZedG37d9PtjzOpV5
	KmrFWPuPRfyQb81Ka/sP68p8kWqTH2IUlEkEg1MNpHoL5wvVSL2vvhId8wSMtx7aVM7so0xBcMTfq
	XNnQK09293Di3vugQtwLNixTHphFZ6TjIibibX3nMBQuLMk+iNjKHMt/8j6Vg0+ULQygZ9fhtKl7n
	qSrY9qcbvOw3kuQ6jYW6Ys/4aO67Sgh5/6OBXdEz9nnhlnr9wZ/D9Hsy2lH9spmqHNNHtbV2XhggT
	V38UUKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLS-00000002Pjj-362X;
	Thu, 28 Aug 2025 17:23:30 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraiW-00000001L4M-3lTb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 11:22:58 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b471737b347so562747a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756380176; x=1756984976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxeMfx1+uNFbtk5b+iMV6QezPtIYzUJuvmOTjg2DLuM=;
        b=CqdeEuD0nT8WLY2KV+AF9hvSh7Me7M2KBLrdjxF7NUG/sVvHkZuGIH/59ZmGu7zceF
         PQuiPGKi3/nXlIgF6njMWhIGazD04UmP30jyXWAMLKqhxhLrHS1GYsC6Mrc/bIhpO3gn
         KY3qtWdw89lBAv9s6nIOAONOGtcIgxEEE0TkTFKqakOtQ5ixlwI9VW/JJQd/EZ7u9aWW
         P6JLLqDztQiSpDS76jZ4BVowSePL8W83a/x/ewbYSlwzMBJilVdOKj/nqdJnneSFQlcT
         6N1M++iYbiWidRTXExYMdxerTFMobXGnVMN34W5p4z7QVKvTB8kjUc29h/fpwZVtDEtH
         kN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756380176; x=1756984976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxeMfx1+uNFbtk5b+iMV6QezPtIYzUJuvmOTjg2DLuM=;
        b=hhwApa17TrD2f50qcdlJSFe0G3AeXDzfOVX+NozrsE7OgX58VWrQXmlOoT7gU3fjPg
         8pTHUln86g6WQHBXE/gsI4faJwbSOJBAz1DXDiCv+QXK3DlrfZ9sR4iCLc+S/nuIRwXk
         z1s137TZuGXnKie8DR1Z8OX45MU3iePTIGzoUjKAY0N3vqq3yxgVwwFGst54iF102d4b
         OLcGtAi6dmyoVEMyXAhEirpmMvEVlK4RY9jiTqPxljMvvGEaSF2kOsEJbkfIyT1/jj4/
         GGr5ho065Wb2W84a27j3F0Swv8AFSVvp8IlLVO2jiEvGrcpxz1NPpMC05A0lBhPVGXhg
         /c6A==
X-Forwarded-Encrypted: i=1; AJvYcCWG/pgXyK+KsuYUazvIAceabEs4Y8SFHm3dTFgK5Oz0i3T55UbgqHSSLNI2r3JrONEk9t61BM/oq6JsVAovunlF@lists.infradead.org
X-Gm-Message-State: AOJu0YxZHMAfQSvCObguagSWE/WCNDrZo/xt41QZXz8Cg48UpQkm9r4J
	3v6PGuZ67zeo+9UnjoD9Y7WmsnBlYOCHgYmEcs1JXRTMq9SLDkcZWXiT
X-Gm-Gg: ASbGncvzNmYRO9iAbCl7wrqWzpXfjxUoqzFwcajjpcUK8Hz7uSpdzoTcWoxdcLHKO42
	ff0mby91sAd/1Jn3EV58RcYZjrMEogLmSIWNzRFlC6O96l+QvuPvajDYrObG22zNXjKiltX5Fy0
	jtTB5HDj9KnbozAtaXpJdTvLGWz92v8C/D/OfcpdIEcY8bFqkOydeGFOQ0v38t0nLPC849hHOOk
	QehWA83Mzryjk/hMc563Bzuu1bdLtBFhCRU/eea/2mWViHcVMMrMk07B0j8c9dpmxaEVxiNQK+P
	4j2v6ceJU6mXEcfNn7vd2ZctQgz6SZZhLoet9nezB6CL3iitKQeRcKil0Znt7jz+73+eA//d9pz
	+YAXhq8xI5OqLMpgZeJjqcQ2CWrB2UN6sT4bUUSYEh1MVNhVCzOmnRZ1E0nWuFBWmJDtq7lM9Li
	dqr9gXVRFkZZEGFKxRLASUvQ==
X-Google-Smtp-Source: AGHT+IHQiVu4toyB2lDInXoaA+fupYv0LkXXDoJV5p3MjYWV2/Hw1sV5uJxKSw9UtwpQSAHlRTlqsQ==
X-Received: by 2002:a17:902:fd0e:b0:242:accd:bbe8 with SMTP id d9443c01a7336-2462ef4ca76mr245371675ad.36.1756380175971;
        Thu, 28 Aug 2025 04:22:55 -0700 (PDT)
Received: from localhost.localdomain ([112.97.57.188])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3276f57ab3esm4952547a91.3.2025.08.28.04.22.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 28 Aug 2025 04:22:55 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Joerg Roedel <jroedel@suse.de>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ACPI/IORT: Fix memory leak in iort_rmr_alloc_sids()
Date: Thu, 28 Aug 2025 19:22:43 +0800
Message-Id: <20250828112243.61460-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_042256_935672_7C2BEF7A 
X-CRM114-Status: GOOD (  13.73  )
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

If krealloc_array() fails in iort_rmr_alloc_sids(), the function returns
NULL but does not free the original 'sids' allocation. This results in a
memory leak since the caller overwrites the original pointer with the
NULL return value.

Fixes: 491cf4a6735a ("ACPI/IORT: Add support to retrieve IORT RMR reserved regions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
This follows the same pattern as the fix in commit 06615967d488
("bpf, verifier: Fix memory leak in array reallocation for stack state").
---
 drivers/acpi/arm64/iort.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 98759d6199d3..65f0f56ad753 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -937,8 +937,10 @@ static u32 *iort_rmr_alloc_sids(u32 *sids, u32 count, u32 id_start,
 
 	new_sids = krealloc_array(sids, count + new_count,
 				  sizeof(*new_sids), GFP_KERNEL);
-	if (!new_sids)
+	if (!new_sids) {
+		kfree(sids);
 		return NULL;
+	}
 
 	for (i = count; i < total_count; i++)
 		new_sids[i] = id_start++;
-- 
2.39.5 (Apple Git-154)


