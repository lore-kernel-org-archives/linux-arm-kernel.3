Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02962C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 03:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=; b=SAZoXt639y5rBCATy7D4O0iXkH
	iyLLDf4b926c2cHeNk2uETfnsdHQ9ZMIvhdD5ue2zP8WNiSGtvPxNlWqfOxbBTfMDOFArAJWpTLqM
	7CYoxhxcTXGKHD/Jn7C5xs2sQ1jLyyCki9n0W3Nl8+lgdJ0zvWA0xw2BYNRT+QDZD+6kZZjk2Zi5+
	+PGInxsvDQ8SBxdE0/EUW/Rb3wk4pew/kSv3VZysyboEKBHvJ3oiqosDuh/LYJgp1Zq2UkJ6R3aOf
	wqh9feXbmg9uj93cmECPml3rTf/nG8fR5ThMCsqJrE1C0sApuXOEKF3jZj7GElr/m1oGqBNMCTzlp
	f3ZIubPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Uqe-00000000mAG-2Qwh;
	Mon, 21 Sep 2026 03:37:44 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UqY-00000000m81-3bz4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 03:37:40 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d91ede8035so29739545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 20:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961858; x=1790566658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=;
        b=IDCQHrmKNIgc+K63Z/GcO1Uj8fv6uuz/PJLa8YDj80/VYcpAz+78tdF3oEUJWHieh9
         Dk8KrLs6j0dAFH8sdScp4S7GUrFT1K0P5z+Vsm6EZqRFnWAzftJ6mvByn9mUtUh4bvfZ
         qX8EcN2NFAI2IrSszozO7HGfjM4V1aojX+soCAQRfKEAnvmU+9r4NNR9w0JDbLDU9UIV
         JzaueM1PQ6ACBdeBSXiyX6+KWI5WeN7BcQuftabGR2Kr3WWJtrPnvnRHtD/zAfmmHuzg
         wapfP+BvGWo0Ye3digjqi2q1gAOmv9j6IdnZ7NAyCGSheZa63QoxPE0+MfqYJIh5XeSR
         URaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961858; x=1790566658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=;
        b=t7aVV/I+2SLfQSsp/5NyK6+EyHCVSMRbu+W3AtlHPl40/3ReLfZLJl5hZpCRHFpd4/
         b8d39VozomFvoyVu6Z3RISgX0629+p2tWHdr7D4xGoiorE0hgoNpIRH++JuHV+M1bMla
         8+KFVjSnjVEA4zjmAIiH9Z/s16eG5m8O8hyOMuEJtdspVbL0ZcCs6IhqYLMIai1cNHKj
         JAM6TGNR7XVo+DD9L8vVy2IGhyZT1S5deH5xMWu9SPzWWcK8CvY/WJnwEZgoWy/tgfYL
         6BMBz8ePZbyVKuUngmbhxsmO77A3b56MsMCrqRzdwwXkqX/WOrshLtE6hZSNLoNTcIs5
         XxFA==
X-Forwarded-Encrypted: i=1; AKwUvBzDRZBjAf6t86v59vGb9Cp010Euds59GyvQaw4KKlmL97aGB6+gbt0ydLXIhVYtQqoyqqy9zhm5DcKe1pBNkAYg@lists.infradead.org
X-Gm-Message-State: AFuF++mrwc6oVPzD7QxbRoj6dyZcUsXE1kuvfa39CyGiPdvSEzHm8NtV
	GcBmqRmBmTwJ6mpRLgkhJImksnJf65C0gaJDj9yrAdYyedvLc82k0Zzt
X-Gm-Gg: AYBFou32CDzFdAAaRDPRZAkO+cKc509DYG/qvS1kyL2FD6ld0tCdyj2ID5zFKW3YBMx
	Q3fG6lG1tL3FCPLHU9Cot1OjcI0SG+v2iLGAQnemuy3GrxkLp6tZEFCkSB5Pc1n/sKmeQLuPZaL
	dBcrlf2XxqNakQu+V3MkNRgRS4yOBI+ZFMHtxOm6iMwsV27YWyMmCOH5EnZKoTE6FnuYlHPMB0I
	kDMrboc0qBxvWX7oW7KTDFbII3MzJD5avF46fse5BYmj3hJ/QsjSFHHMx+1VlThHIcToFQohR/5
	Rn5VWMmx2szglP3w+VUnpJMH38TZBfCRGBgN/6tIYq75bOyHelVkYB+ldDmnTONsQj69iy/BR+l
	rqzrGdntPSCf5ZrV87llDeLsmj/2gc4YNBPudVYgLLir7BD7yXQiFl7svXnHNTbE5UDGQeIJapa
	p9hMSbZSQ7bsuMnC58Bz9usjxUoQeyHDPuuVccEWD3ToE+eXY6EyNlXd45/8QrHnPXh93cKtI6u
	kCAZKPrcYzP8fYdG2TPNHwyDjzxYztwc+AVy/oP5jR1we7f6Ix1RxWPwskf5FXhJQGKT4HtDf/8
	McQpBsXGShm1dQ==
X-Received: by 2002:a17:903:324f:b0:2dd:c053:9c6c with SMTP id d9443c01a7336-2ddc0539d9cmr89231915ad.34.1789961858000;
        Sun, 20 Sep 2026 20:37:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:07 +0700
Message-ID: <20260921033708.14433-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_203738_903704_3A3C2CDF 
X-CRM114-Status: GOOD (  13.48  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 479789009c7f..fe083b1e7251 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -99,9 +99,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 	int ret;
 
 	/* make sure bus domain is awake */
-	ret = pm_runtime_get_sync(bc->bus_power_dev);
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(bc->bus_power_dev);
 		dev_err(bc->dev, "failed to power up bus domain\n");
 		return ret;
 	}
@@ -382,20 +381,16 @@ static int imx8m_blk_ctrl_suspend(struct device *dev)
 	 * in the system suspend/resume paths due to the device parent/child
 	 * hierarchy.
 	 */
-	ret = pm_runtime_get_sync(bc->bus_power_dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(bc->bus_power_dev);
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
-		ret = pm_runtime_get_sync(domain->power_dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(domain->power_dev);
+		ret = pm_runtime_resume_and_get(domain->power_dev);
+		if (ret < 0)
 			goto out_fail;
-		}
 	}
 
 	return 0;
-- 
2.43.0


