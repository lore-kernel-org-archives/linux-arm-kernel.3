Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4855D109024C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7WbbIrQRZg+WI5V+d2UHHYYa3r1L0mKPW9kQXI1QdeY=; b=shbga0WtLjKvYcoLO2OFsGUnPU
	QAXUCdFmbfRWDX5jA7+2olJLMdCKUD/gYssKLNyp+Ir/5QSMUz6BMzherP7UFSzZp9aq4kaYvcbMR
	QzP99+3iLpiCu0w8oN+o0t+CMJzz541rLXml/mFeUXa3mXJjY66jrBpWGzBlUYsthSn2NGrGYE0X8
	LvcBMmaAXWHZxJsePSR5fkeT4ne9me/0g5ChYgAY0pf93BJP+DyXDTL5azoj5jOyTyKTAeY73U832
	2aznjps8j8Iwt6TuyWOog9toGxEIAdyPHDx5gHUUk+UBlqdYm5INxZUf8s83uMWiO2OjCGW/AobIE
	B/IwsXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GGX-0000000B4z1-31JL;
	Thu, 19 Mar 2026 16:30:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GGU-0000000B4xv-2spv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:30:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aae4816912so7568095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773937829; x=1774542629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WbbIrQRZg+WI5V+d2UHHYYa3r1L0mKPW9kQXI1QdeY=;
        b=XEiCZNmrF8i/bOOPCZhEf5ei95AULC4vSjQnjlvg3IqvAbbYomBbomi4QkPrzd9pI3
         vFQaTI3DBPDAPxzMLDR14YnANAXiPo5KA+mpEF+QCbvtvOIubyxirZedxmgPCM2a0fu5
         pVcYtY6QU4j3VmbodxSEX0WefKTrk99yP2qhOHV5AhiUHkMk3ws6MOlv/i/6bwYTeeaH
         YM85NanXpGqwcU243+s5EsfQPnqjQxea+eU2u/BLVO0X99jl3iSZalh/h1zqXufkraoh
         yK2gJuaIvIj2drNKNcyBvJnLOgHYUPTLAINbyHYk/DnA0IuzmoKBQt8m4ToiAajUhAPM
         4l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773937829; x=1774542629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WbbIrQRZg+WI5V+d2UHHYYa3r1L0mKPW9kQXI1QdeY=;
        b=Yx1HUeQVGpschSqcEXhYVcItvtsnj6WPrq/uK+lFtQHNWQPVsPE9ZL9mZIBDqtaFiz
         qtoJHqjHT8G8l5RAV5/Sn14ntJsaAcG6DnCZwdKtPkXzDN1uuFhjn/mepSIdLX6wEvK6
         UmZlr2xbBXP54Yhld3cGbCZlO2R9nsEhADnkrW9X0jbkFl8okdVGxUjrjovOZeUkq+ve
         wcOCRokkfAEQXkgUHd7lBbXHhsaol0ml8hyIQlVuc/9upGj+vKVgC8ZObHX7Kv3dJBDP
         95/nuMD9lNPIO6X+M02z7tymrZ4+seg6ZnSqH8Am42S1JLS8EBvvDhuOB35KC5cQWyZM
         x1aw==
X-Forwarded-Encrypted: i=1; AJvYcCWLzYWYsX4o87MsBKYOl1yzcZrRnMvqSgEP+dT7BhX232YVBJXW8FM+x/AMOiFODRS5kzPTSmonDoxbtlxGXtUc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe1bnxNtyozvfGr45rcdTPnMRr7ZCXIbHnOuZ6Yr80JUVX/jVw
	FGsqrcwN1RIErnMnvGj7l6NmXaSa2rHOdF6asHEdCQJ13No+qZDpIklG
X-Gm-Gg: ATEYQzy52xOOMH9xoOkvn7U6/IXOJ8fZ+mAuvp36Q6Zzcc9mdjFyAvHXgQQCFU4RYc7
	6C7xiG5xLs8Dowi+Amp9zhrOlvRqrd/9n08WxTJdOoa8GDkeY+vHQ4vUPHJVoBiUHxaQgniyLPa
	Pp99AanXdPFP2fz0hK/pXuK4Bd9063j+VRFR77oVVBe91AuKKSp492I8PIgXpz3gVYFXW1hO9Sz
	kJ4A+/XktstBgw4tUQtDaVq1zZGrz3vIzllKFPftwwqDg4s4GSySvCK6Rws0maWMcOpo11Wj9CK
	pwxgtS2SLSJjLfgN5jmhjJgT/La7nUn9ffe02ZxGGuzustaX26cMHCoK2b5/HAS5JZOk4+0hvBP
	ZrPYARbGtAbsleEPSL0NKdJ3+qGyEAJoOj6bbVKICSuishPv8RxYR+AArUfMk8CsI6cjtjPJrmw
	jjcNAyEGiJVm+/XpUmlQzR3y2cSpY=
X-Received: by 2002:a17:903:17cb:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b06e3bd39bmr79715765ad.28.1773937829185;
        Thu, 19 Mar 2026 09:30:29 -0700 (PDT)
Received: from ubuntu.. ([152.56.142.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06f7e8290sm61584485ad.82.2026.03.19.09.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:30:28 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] devfreq: event: rockchip-dfi: fix missing clk_disable_unprepare() on error
Date: Thu, 19 Mar 2026 16:30:11 +0000
Message-ID: <20260319163011.18876-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093030_724341_18602F6B 
X-CRM114-Status: GOOD (  13.99  )
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

Smatch reports:
drivers/devfreq/event/rockchip-dfi.c:215 rockchip_dfi_enable() warn:
'dfi->clk' from clk_prepare_enable() not released.

If rockchip_dfi_ddrtype_to_ctrl() fails after clk_prepare_enable(),
the clock is not disabled, leading to a resource leak.

Add clk_disable_unprepare() in the error path to properly release
the clock.

Fixes: d724f4a4581b ("PM / devfreq: rockchip-dfi: Prepare for multiple users")
Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 5e6e7e900bda..8db0bceeded4 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -185,8 +185,10 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 	}
 
 	ret = rockchip_dfi_ddrtype_to_ctrl(dfi, &ctrl);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(dfi->clk);
 		goto out;
+	}
 
 	for (i = 0; i < dfi->max_channels; i++) {
 
-- 
2.43.0


