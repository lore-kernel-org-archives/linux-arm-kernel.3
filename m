Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412B2CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+CyYpr5DG2wVXaggugKyiSvcVLQEXsc/QvDPZHxp5lw=; b=DdzBWNqU9EYBRZySNnJ5kH/GsB
	JSqsZTp6XMrd1bm9cAzYDwsOhpYi6HYcsKIGq73d29nxinyBS8e9dWtOEUntMmFNL0n5CWKxGeLXy
	WZ58pSDOOYEdhstrXiT7j5xr7ZOnKwU+UApwQklVFNH/n0ZuHakAhzi+83cvpnBY/1LA/Bv3fBUKK
	DimrhO7su/dd4+ToH4jGqHTTCi5c5qtcxUxLeZCAzZHrCIKCLzTtQo7LhVQWk9mUpAkcb7zUbMIRB
	oLKDAckV/lgKqssZVh+t8wfDkzGp+id6BTwtfmDe+0vEvXQyIMdbalRhcHHg4YcxX1aRD5ZnfhnUi
	i+I0/TTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZbj-000000061WY-3g2q;
	Thu, 30 Apr 2026 22:11:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZbi-000000061Vo-0FcY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 22:11:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8318293f02bso843138b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 15:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777587101; x=1778191901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+CyYpr5DG2wVXaggugKyiSvcVLQEXsc/QvDPZHxp5lw=;
        b=Uw9xKn7+fLlDUT2dswHywWD23IukOX4bZr7aSygQXGfHAku8Sc8IYLkYBvx0aM42dM
         M0+Zoc1dMOWo2iRsk7R7A8nz4szCpWwgMV3QviIzlR7fsax13q2peJG0s+63Yu5K2ONP
         HEvWACun6T8CBin8nYooOojR7VPT2VnVbcWLWyswykIMhogg+MAFcaMk/z8mp8nTkukI
         BUuoEBO46LGw6xVcRkp/WpIMer+7DJ6/f2u8Gg+kYyLo3JTKhRjS0/Ssw5BzEtCGqAqe
         2uus5q1qb5m6h9IPPg/2O3PnkeO7EzZFe94p5eHqcOqEe6CKLP1/xwdRFFuIavOSVmVC
         e3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777587101; x=1778191901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CyYpr5DG2wVXaggugKyiSvcVLQEXsc/QvDPZHxp5lw=;
        b=KBYp+kD2vD1doxbcMeIsk1Ttp5n9+BX60egUkCuQMDQqkC7ibRjPL/vBR4ktv6NNYJ
         bX/oarXlfm9x46Lg/7jokJREpe2xtLis6XZ39VtmEmYw2PvRKB2gzNUWT9oDAhMOcFW3
         D6MVkg1WUiFfnrpV/MOsnkNfT9yl+IHKV1BiDmcj8aQiKcVpwazC37Y/iMIkLW56CaKL
         eyKaRFew8B1xJUMukfvUlywIGYVz3cCmTf39097S1gBDskLNOWjRaqyN9DltlT20H/3Q
         QsBU79ViSe3OsLs5Kie2cVA4e7c9hKrsVinUvm16noJc10ehf+DaFsy32UvAlv3oUiID
         C/dQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZIlIvcz2xLZ3lf3KTtOMWW0kfHhIkSt5dTLVYcblisC47JBGicdHkikBH2ms0HdsERc9hKv1psehzEVnVIf7q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4KzLfuXiMsnPw76kr8VWrEIgayfrCOs6qRsdwnsabYtnwtn4l
	dq3KDOVAKFHqlsen/63Iwcay5IiK9Ufqd29H1cgw9uMOZvP8Tnqtr9J3S4M6Ygm6
X-Gm-Gg: AeBDietBSbJo/gXdt1mvRZ4mLuVt5o7E9uq67XDQ5vBXKzw4IRzpKbIIcTF19dOyA73
	uEAkmm5pf7LUUXXk/3o8dpvhScQ2UG+Wp+hYkVGaNe5WJPx4DWUlM3HEWaBQ+4F+F9+g0Xxq136
	AaeN6DL+Vah57LdnFPiL9TYSe1/KYIib6HSVBQnW05hY7XchTZzyvm5PiFAKUapzgggoVGU3J27
	XENAvsH+hDTexxaIeQpxluJT46wqM1AS+3LKdcS+/VmcwQJN6fu9w52NHBreRvY6g0XMMDk3AnC
	6ViYossFFJ5ol7X1lHkX3Y3DguhTF2uJrq5Bo4+90FOEukhzEHT30/OWIGS4AkfaOVO1lihZSGp
	Ae8t2C7yx20w3JYtPie9ZgKRkhEm796/rwzmPU48jO3qaSnWB3r3OboP2IZqArpNq6IXs01tVao
	fhlB99D3fYPH8gk+KbsG+A8sd/cS7mG/zbBEW466W1ISBZY5F/ENnb2CewqNJVJmAcRVCoo2OQ5
	1pbE0/t/M2oG4F+7l7QFk7gWA+A6Kpo1RVc5lOStJdUO5Gg84++eGZB
X-Received: by 2002:a05:6a00:299b:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-8350017cb7amr4240028b3a.20.1777587101053;
        Thu, 30 Apr 2026 15:11:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515838b34sm626013b3a.4.2026.04.30.15.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:11:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TI...),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] firmware: ti_sci: simplify resource allocation
Date: Thu, 30 Apr 2026 15:11:23 -0700
Message-ID: <20260430221123.79947-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_151142_102694_8AA6BEA0 
X-CRM114-Status: GOOD (  12.51  )
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

Use a flexible array member to combine allocations.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/firmware/ti_sci.c              | 7 +------
 include/linux/soc/ti/ti_sci_protocol.h | 2 +-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index e027a2bd8f26..04d99c1fafa1 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3574,16 +3574,11 @@ devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
 	bool valid_set = false;
 	int i, ret, res_count;
 
-	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
+	res = devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNEL);
 	if (!res)
 		return ERR_PTR(-ENOMEM);
 
 	res->sets = sets;
-	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
-				 GFP_KERNEL);
-	if (!res->desc)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < res->sets; i++) {
 		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
 							sub_types[i],
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index fd104b666836..7632bb11c862 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -599,7 +599,7 @@ struct ti_sci_handle {
 struct ti_sci_resource {
 	u16 sets;
 	raw_spinlock_t lock;
-	struct ti_sci_resource_desc *desc;
+	struct ti_sci_resource_desc desc[] __counted_by(sets);
 };
 
 #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
-- 
2.54.0


