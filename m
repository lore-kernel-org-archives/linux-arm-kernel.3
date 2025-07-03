Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F75C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t8sMnLmbVBtviSShW9F4axvuEDVtfhtpbcNw4bBlT7c=; b=aCZx1+gZk5LJEf
	hes0XvEYRmOEgPYCz2J2ApyWUmgTH9bqNXKth0+Q9/d0HEUJ/zOIfP6K+Sj8xz4vB4jSGZy2Uhe+f
	F7dLkAyj9TzJBoQ18103WXjD4meBqvv4/7CKD3+jSvLGmZ/+hLEJeb4BUyVF0X+xV+owFibPLTbCI
	pXP1wfvg6yfGhGO9afWOX9CMtH9hWfQ6lcxBCE+3IqX04Oth9VdfU5ABtQYB/YqPo+8SCaaL3oCv6
	9b7IdEQ3oOD+f2vf1YA/SFVzak1GiVzSOIYQ/s0/JA63LBoYOentqXbFB5nJ3SpulIxfr/Ru3uKPR
	tfnG5aR0UuDtCClU+z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKzV-0000000BgS9-2Ib3;
	Thu, 03 Jul 2025 14:32:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJbB-0000000BQYG-1hBD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:03:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-453643020bdso69544815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751547811; x=1752152611; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8sMnLmbVBtviSShW9F4axvuEDVtfhtpbcNw4bBlT7c=;
        b=i7Z9tfywV4guY5YB1r2L+oto81R9ccgRL5SUhdPdr5cNLzlADn1z5ORBh44+jqrAr4
         3vdeg65GCy689fQZK538EgDcAPXt8qX0/j6DoJy2NBoRA29DFkfAlXz3Wz0LFPe9rKPD
         pcHANrD+3dXeTh1yLKe+ONxlUgb4vkdqArZYHwCP59pLPD9FgUk9PojlX1z46/X97o2X
         HgexIAxqi1dFjsxm8QZmlfdeE2iA0TcsTtTUcXo27rxpb9CWbc6x3xgLpq6tvdJDPujo
         pNpN3EANKhiFs7N6Mby39Zdci2lyT+nD/gST9HhjsmVZrFOD7aVP33TVW0SU7V+xQ+80
         AfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547811; x=1752152611;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8sMnLmbVBtviSShW9F4axvuEDVtfhtpbcNw4bBlT7c=;
        b=OZAq6QsspBVzzwI5Mnm+YFJxGcXOPqiuN7DyReMB5ehfmMgvuulPJ8sakd7tx4gczC
         EQWpFfjShoPwTA6jIkVq3V8jiCBTZBZ88YniCNFN/8UDwKyv6fGzsQ8S9ev3A/IWh44i
         n9E6PGgvL/hBJw6W/yZ8fTZiOn5bButAnGAsgu0EH+BKPpYV6JCNPpwt/zJ6i9TyiTtr
         l7U1BgKK612zWGA3peTX7Vyu0nE+RGyZc8F6a05Hi4U/TBDZlJog9iRhN13DmHR8tFXS
         4KHkS43rhrtI8JuRCQDDqblx2KSQ0wPAROjlhbHDn90K72Id+5+J11oVX4M8CVl/dxKl
         h6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXsMUyCKTigk9W2VNcZwNezstzvF57VaF8BBXi5Ha2/va8cQjdwbpSfjUlhUbHb6G/X0m4hqC5YfgtkaTYBuxjC@lists.infradead.org
X-Gm-Message-State: AOJu0YzTdJfkdIKu6wsxUcWwNbF7tmI9Xt9Lmro2iNK21PrA8QzGCNll
	UPIVin7FA8r1J0fB8fnOXVSo8jVQhFNxJaKLeAJHbGwQO5Aqu72v/8Orok22ObEhL8Y=
X-Gm-Gg: ASbGnctODuNEcthh1TSSmqt7iojTqKiZrEaF14W52PKLy8qfvVh/EabzDNbxtlyoC0E
	VmmnQsiIvY49zRHC1OaG37so4581Rmj+Gos42l6cFL3vopRUMVWOx3lJfvTThSroK6F7XDYnHRj
	DnkS2ocOfwZrgFfHUr0/FHGMMjrtsUGrOLmipK0nrJj+L3vMxiCsXltBoB09OQP9B6kk8y1EXkg
	NvAtAc5P3b1POvUs/9bH4ZnNljiaq8819RUb22Tu2ATj9KJCxXRKOUmC0UZLRtKoCyF2oZl0Iex
	Pj2kVgt6x9x52DU1ILLUvr46dMuAjubTNgMjmkSaDlZ34q39bh3qY2PzXJBszse/wjMnzEIyvM/
	t9mYFisNgM+/9wjJz
X-Google-Smtp-Source: AGHT+IEZcpwBB34LdSCvoGZVWtrYKSw+G3TApJ8ZTvGGFXgDj4RIhH4+oyBw0wZkTYa243/SZJTHFQ==
X-Received: by 2002:a05:600c:3e17:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-454aeebbbd2mr18095885e9.0.1751547811082;
        Thu, 03 Jul 2025 06:03:31 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99693fesm26170005e9.7.2025.07.03.06.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:03:30 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2] Add new phy_notify_pmstate() api
Date: Thu, 03 Jul 2025 14:03:21 +0100
Message-Id: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJl/ZmgC/x2NQQ7CIBBFr9KwlgYG0caV9zBdoA7tJApkII2k6
 d2lXb6X/PdXkZEJs7h1q2BcKFMMDeDUidfswoSS3o0FKLDqqoxMc5UhFvJVpm8urqD0Cp7O2gH
 8xYo2TIyefkf0MTaeKZfI9fhY9G733FkrBaC0tbY3xoA2gwSZsCD3E5P3FO4fCo5jH3kS47Ztf
 8gMlG2uAAAA
X-Change-ID: 20250703-phy-notify-pmstate-f02ba5582f65
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ZYfjP7FwB1GpkWrGjPRU1WDQ3B9s1Ej+w3TERaVUTTA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZn+gsenijhnxKUpeWCimXuCgH87uwqGvZ5h9B
 ItzoiuZf8qJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGZ/oAAKCRDO6LjWAjRy
 ukmVEACZ0M/YG9thUntvvqJNn1ALzw38f/38Op1eJmLNktFegKZPe7cw3exdz9z5Cedz8JKpRdJ
 7OLXUspk0PpOMeSlMxgZ9/I/SosG/NW6FogiUTYp5NP6cJI29frGBmPBa58ESACp2ZmoT6HU4WK
 4iuxz1sz905KPYKeQzbVvDpq7cvUeBU2lDndiUpYca1IIcpABOYdS+vaelSaHOUJ16BijTMUYF6
 LA1Sno7YcJrDHwck9XAiMsRtx1TCxevJ+UOw+MctfARkFmEtby1l5PlEQlkXPNTHZvofoxZ/jMW
 ecICz63mFFrvCfa3AecCmFACrO4CtMilo04/Z0r75qy5guAoel/HytbeDZBZanDRAM4Kz85tPQ1
 I1QYPj1YWVsVwxpASjNuNl5OIbczHipzsEUhKj7pi5x9jao0uOAmE/WP0bDXmSdtbq4CRMo0IHT
 VNdfkbqSEfdT1HaTDTm9zfjYO2UqkmOc6b9eQR4zvYi326n1Q26GI0wfean3GWWwc2uOjxnu7ew
 I9tBJtZsxQ5dDSPxXX7fbvsBMf5kM2KXbL96ImXGDH+kULjShiixR6gZcGbV8nqrEhWkPQZl46t
 eACzHe60dZh/t9eSzVZoRSIaXArw4G4wEjNrLNSTK95TM/UvamybZPR43mJK7borZCi7xrdcz60
 5JvP+ZqhLH1zgZA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_060333_463516_A4ED614F 
X-CRM114-Status: GOOD (  12.17  )
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

This series adds a new phy_notify_pmstate() API to the phy subsystem. It is
designed to be used when some specific runtime configuration parameters
need to be changed when transitioning to the desired pm state which can't
be handled by phy_calibrate()or phy_power_{on|off}().

The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
needs to issue some register writes when entering and exiting the hibern8
link state.

A separate patch will be sent for ufs-exynos driver to make use of this new
API in the hibern8 callbacks.

To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel-team@android.com
Cc: William Mcvicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Changes in v2:
- Add new phy_notify_pmstate API() instead of using phy_set_mode() (Vinod)
- Link to v1: https://lore.kernel.org/r/20241002201555.3332138-1-peter.griffin@linaro.org

---
Peter Griffin (2):
      phy: add new phy_notify_pmstate() api
      phy: samsung: gs101-ufs: Add .notify_pmstate() and hibern8 enter/exit values

 drivers/phy/phy-core.c                | 25 +++++++++++++++++++++++
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 38 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 +++++++
 include/linux/phy/phy.h               | 25 +++++++++++++++++++++++
 5 files changed, 123 insertions(+)
---
base-commit: 97bdc30f39b63758868f67841cebb8c50869e16d
change-id: 20250703-phy-notify-pmstate-f02ba5582f65

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


