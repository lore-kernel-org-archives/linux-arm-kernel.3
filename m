Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC9DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0gqmZQACO9w3LJC8YO02xH6lzr6nCg5VTTM+s1OBnzI=; b=QvZ7wWNvtbMiMEHYeWGAGlcwcN
	CHhPdCGl3MACj7OWGNDlxIjdJxpYDVhMRe0QFjqmttBGcsxYAXJ2rvqO4XBKr5/H21YjxB4RIQjjU
	fNlB0NUddQllRh8ZDz1vbUZFE85H7LiOU4K/5+V2rmnIQCT5UYqTSZX3SzcTVUtQVXaVnJL8Uu1MT
	3LibiROExXv6LuwuHPtj+djEqqgloX3NA2Bxz50tgf9l8LnLjojR9fZ9S42Mv59fvVFg5g64lC5YJ
	UMqoJJUpRixiIezfBl/YabC76DYr93QwkU/rRN+BDG36g1l4o1CXifgOYQFaIsagfK3oxGEanngfN
	LyoBJMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjSN-00000008ybu-3DYP;
	Tue, 14 Jan 2025 16:07:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjR8-00000008yLz-3RtB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:06:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-386329da1d9so2962219f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 08:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1736870797; x=1737475597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gqmZQACO9w3LJC8YO02xH6lzr6nCg5VTTM+s1OBnzI=;
        b=k7MF7buw2nlrFcU8NemH6Osid8iN7KwdWeinrqIQiukjLNz/01UiGG+2eDP4wG3Yh3
         jEw5aJGqI6BJN/vDaeDDaj8zCSQNzM7vp3yRt4bqIeL9TmEESCMqpobsv3x4JUJpvvSS
         IU1KlNe5ZVOCMyHSPYjUSUu+29aLms7gEpFPDNzK81MfXkuIONAiVDYLGL8ZOtraHLKk
         v4Qlkg9sxQ8MB9CDtRNzG0YKDyjCoxtoXtYDXg2sfIKXXkcSGZipUjujI+6hNAI1Ou2Q
         WxXTbYVs2DbEhqVpzHmU2etbBkRPFrnD+3vbGxoNYQ52YTYENKOA5fHwkELn/ePt0rlR
         uCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736870797; x=1737475597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gqmZQACO9w3LJC8YO02xH6lzr6nCg5VTTM+s1OBnzI=;
        b=LmDV0W6naom6l1WSH1P+Uia2qQIlwQ+3NdbEoyO6sWokRZS+MMaoURPqaD510/xlcr
         2FRoVwb+JwBPPoiNwSQBH0m3LOkW01mrz7+Kmr9HL171MFxpJ7skkikFKVxvdflVb/XH
         UNpaEi8Vjw98lDRgiPDj4k1w9t5t9QxmU0Qq3eTHPbOu/YwBGlxaihue8AGc055r6iVi
         tEVFwxXBacdNNbXHTkFgr7acCENi6ooL7bJAUCjD/4FbE3mvZ0vAlUwUxMJkhbzO7RTP
         5Hdhlu08+4PlHMguFDjhEBlxXCAbJoRxCiKdhrRYvTuTW9nCLiU3xw3hSjzglt1rVAIJ
         wNpA==
X-Forwarded-Encrypted: i=1; AJvYcCVfuNv6WwRGLvikcKRonplUZ9Em0ggItVW//1qkXEqGuST6rYb3CKo+rpjRzyflcl9yz1gyrx4bN5sPlrW1TpaV@lists.infradead.org
X-Gm-Message-State: AOJu0YzBkPT0eZUrz4sYfpVJA+pGKJ256yYXCjRP9u/lrJmZ27CQYvYm
	go6bwjd7u2BudTVjwIo+rB6TP3I4umJC4BirEqCZkl+uPXxrK4So7LUujjxqVgY=
X-Gm-Gg: ASbGncuPm0kmdrhwrpowmjIX286rFiozN9cbN1EexuHb+GKcmhNpkmvvs9D7I5uun5Z
	tIPrOWXGIE/g6T+1HBzUX9TU+6H/se5r3NBjDvcreuFUfye00FEeOQxfP51gAyHphPEOYwTwEYi
	oKDcMpQ23KKGRCIy6B3mut0hdVGp3nharEcCosxPRvwBcz6labqQG3zyKExdQuEyp3LvEcuIaIK
	orasQzktw3VM9r5+BhsBN9X5nNoG3aB5Yv22xQ+Uj20oltq50YlNXqTExUqHWk7rz6BB4P16tLl
	grC12f96e4XI0i1t
X-Google-Smtp-Source: AGHT+IEtcRD15Bkfdih9jwWpz12XEXEvsL3qzSqJKpUX7+iTScQQy1np3E7eSsjMUQXP8bE7n8kudQ==
X-Received: by 2002:a05:6000:178d:b0:387:8752:5691 with SMTP id ffacd0b85a97d-38a87309d15mr22654193f8f.47.1736870796430;
        Tue, 14 Jan 2025 08:06:36 -0800 (PST)
Received: from fedora.. (cpe-188-129-45-73.dynamic.amis.hr. [188.129.45.73])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm15505594f8f.50.2025.01.14.08.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:06:33 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] iommu/arm-smmu-v3: add missing header
Date: Tue, 14 Jan 2025 17:05:56 +0100
Message-ID: <20250114160630.1122885-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_080638_869704_2C6B8043 
X-CRM114-Status: GOOD (  10.49  )
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

str_read_write is currently undeclared and thus compilation will fail with:
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1911:25: error: implicit declaration of function ‘str_read_write’; did you mean ‘sb_end_write’? [-Wimplicit-function-declaration]

So include the missing linux/string_choices.h header to fix compilation.

Fixes: f2c77f6e41e6 ("iommu/arm-smmu-v3: Use str_read_write helper w/ logs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501111926.qOpnlK9J-lkp@intel.com/
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0e4cbb2c64d7..a0e395da8a88 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <kunit/visibility.h>
 #include <uapi/linux/iommufd.h>
 
-- 
2.47.1


