Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA51CC982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 03:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A7bjFDm34OFInSMA2wk1n5UqXeKw0k+y9VVpS6ySqY=; b=gBmjzOi30d1B6XKlu3ILhbXBkV
	duHMSTPpvN6sCaDvx98q0b8iPotKqI4O4tlvQlfW1Db5poA22Wbum+OXsx+JU38cXehhul1ASHJq0
	WTyX0IYma4REY3J7oIn0ck9kFDffy8QO1IY3OXSrT7zUnPXUmhUKalASsjbEKvTJ5RIDwR1p8OHBf
	+W/upjoDil4mMTqNPtlWnwj/q5hVKI7H67UeSROgy7CK1XJuT3BAR4hrsyGOgmKpZcyx/kIdjnXgE
	MTS3CEMI7m0CFBJZkw1ZZPwbBKNX0YyDDaRX1332EHbXQQbjZYdwCox6hmbIiN7fXdu4Vy4AqcNba
	ZllJvH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Uqp-00000000mEM-3GVH;
	Mon, 21 Sep 2026 03:37:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Uqm-00000000mD7-3wCL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 03:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2A7bjFDm34OFInSMA2wk1n5UqXeKw0k+y9VVpS6ySqY=; b=ZoRKwMgITpkW/4ghF9LQJCg3MX
	H04qr60tfpCD4HMaujNyft6J4LAVhNMLGSUsg3j7IA9X2gaID42JmJMEpbXfYFYFdT6HBqkwC5VOL
	UBQ0bOLRCtCeUNOnjZmlLPQerSzQ1EhX25Qfw8lKxfvy+qeXjmXb8DuTwXcRjtopqoxGrP/snQSVu
	BO7bsHmk7DG/T49tQ0DBhkJxQi7L4RGPBHIHWDBUIPyJmngTNVYHCv3XjtHOXgBgGNqsZdUoDQUv0
	is3OqvvczB9jGj0XdNLHCp73hWHC8XyVL9oDdB/G6HeMcRzS7/l3L0Kb3gRAm84RREFGeohysj6BK
	ss7JazQA==;
Received: from mail-pj2-x1b.google.com ([2607:f8b0:4864:39::1b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Uqf-0000000Bmsg-40OA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 03:37:47 +0000
Received: by mail-pj2-x1b.google.com with SMTP id d9443c01a7336-2d747f066d8so8995725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 20:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961863; x=1790566663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A7bjFDm34OFInSMA2wk1n5UqXeKw0k+y9VVpS6ySqY=;
        b=Zxp0JNEBGyE/O75OUuWQEdsxAYKLa4E8NZGWHFLeQ1zXuzcEqXJ+u7rfRYZPjBGDKt
         t4xgSS8VpBbcmHeF1HlVq0wmZdCyCpNJZRwgfOeZPSpwNggna4AO/lNS1PK5t9CTjDLD
         Ju65+2qgTl96fdXy7G0ri8FBlt+U3q5bJrML5GhIE4OWy2XoAHUhUaxCoEBRvwERg14O
         8FW5Vcc70HLMeHwBjoaCIdnn7AV6+gmWzuz/T+JdlKzZWLIFZyYlxvH4CyVSuAS8zmQj
         49iM5kYXVL7rqm+wadujm55F8lNlIxdS2sh4JOXyEZpLF5ndFC5mtacMzAdIA6/nz+1s
         +QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961863; x=1790566663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2A7bjFDm34OFInSMA2wk1n5UqXeKw0k+y9VVpS6ySqY=;
        b=dmWFYAlluknOqLxGMM4mKDUgkmmDSzpNKdVlYiHe7bLRlp9IVH0geLbLfS24S+w/Jj
         uNVMe69DX0hUuxzb5JXAD1aTft63np93d1VXRROXnpL0RF4gvZ4LcWfjhPL4UXY2zYyh
         lMwgkUo7eWTqGAkB2dD9Af+iD+8/gia2ASLmEUTXcww8SpneWPkNTRNqzRO2i5ZMiRLD
         av5e6uA7QB9aO1VYMFlySUj+Ff0wLjGuanApJ09Q+/thWkRFdv1bX+/uz3irSpNLEQqT
         VD7cajOLKJDUAOIloo/leLk/spxWf0EQ4zf8bYDvK+O1UPbR6Mq/Cyyp8V/fpNFOJRyR
         kM4A==
X-Forwarded-Encrypted: i=1; AKwUvBzedfS+7QDAzCvLhmly3hkM0urXPk8ZUSPaPTjW50j9JYhr50XzMyCuPTGyzg9feAMAcQGo9l9P/3MXVAqNyFhk@lists.infradead.org
X-Gm-Message-State: AFuF++kBdsRMnfM4P2FnOl6MfTEhDB3IoOY1Dv2CJMP10y8GWDfd7Z9M
	M+pdZOaWlNcBibofzcbky9UCE3H1jaFA/xRTpTrm4rItCh+RO9Ta4KcW
X-Gm-Gg: AYBFou1jEw0qiM39vmyFzyaUviOez0NsmofIqcKX3w5/VntI67EFVHlN4nE+PBMKyXi
	EQaFZ4FXrrZTkgt8U6wrQRzIQpIpGGkxP7Ux9Cu/QBc1k0byeNCUJjKfc8WAMfNUgPZFjWzBSma
	K7bDVJ9tYglv9OdkxUZVYyqY+SU5h7IjaH66v6Hz4BoscUiZV6hNkqx76T2St4KYYVOcLEr2osg
	pSY3BumnCb79NUbOJ0Xry4dlHgOc25oRN2imlCGWBGVErD+w4PnbHXLvNXojurPGN7l39EdSGDr
	wDLqR8qswMR8SQY4KDJUiOKZyA3CBWozGUhQQEzhSDj9QNMHsT9yt/5iF/iGyxoT3743znf0Q+r
	xXjmtpvqf+dyp0iVNv/Tv1/Dhf+LTiAfmxnFSie/EaF+Ab5BP0PGaZ4C/qOkjtlN7UCX0mTllrn
	87Jiq/+clMjhjhAtJNW/nAOquupI3kAYxcds/kwM9/P0CsqYXudgxHGTz8ny0X4yzkGDU+Nzcmo
	Q4IauhEIqMu5lOUwZE5yrkkzaY3iE7/FraroFN5M7HThkEnsNwgs/BFRntSXjKUAjp5C17bTMIb
	FWeeyw+syOesP+o=
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr64473935ad.32.1789961863038;
        Sun, 20 Sep 2026 20:37:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:42 -0700 (PDT)
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
Subject: [PATCH 3/3] pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:08 +0700
Message-ID: <20260921033708.14433-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_043746_525141_A5107524 
X-CRM114-Status: GOOD (  11.27  )
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
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 243ce939ba68..6d4c55a85c64 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -152,9 +152,8 @@ static int imx93_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 		return ret;
 	}
 
-	ret = pm_runtime_get_sync(bc->dev);
+	ret = pm_runtime_resume_and_get(bc->dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(bc->dev);
 		dev_err(bc->dev, "failed to power up domain\n");
 		goto disable_clk;
 	}
-- 
2.43.0


