Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE80DC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1H5V/4krQO0tnwIPu67VnVVU8I6AEiTtxk+UIVEETD8=; b=D3pIrlBdVFD2xtTnayK75fT3f2
	wvslr320Va3qir6C3ZS3m2rtzBu4JHv5vMq57Ld8zSmJAb3Veq60IKkcN7M5x0xhNtD8OE8idnPHx
	Q5ZkUFJkXta7f154O8W5Dy5aDGusAUQhm84/OeeS/5OIZD9Qe2kPpozcwXn0ha/HQuGVGapzEYIer
	dSZhfXOnaZHohVOipdOAXVwiSOo9ExaE2cERFW26Ev8haRFwga/ys31F0ztlsYNDgyxHjZj0fy/si
	H35DJoR2Vbd5uqQE8OSiIIZ8gs/jlgWy3TDWNXTVC0/xXzGrdykkPvIi5J1rHOIjqluEVPb7fM/0Q
	t3LqT3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPkK-00000005acA-0T7E;
	Wed, 26 Feb 2025 22:19:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPW1-00000005YAC-3MNr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220f4dd756eso4481785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607469; x=1741212269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H5V/4krQO0tnwIPu67VnVVU8I6AEiTtxk+UIVEETD8=;
        b=weftFkvBGNR6S6ZYwLhJZCKNgkb5m/yMMCMuwxsFRMSh89v8XSs1oMF3D5tk60Ceqe
         y+P7XMsy4rcqhl52En11XZt2Y72LUJUZSX5NSRlWekoOVsQRT2qj2FFZQgZIjn9xyRum
         JcvI34jflkVjFzMORWB9QX9lTxtBSbaPAJRawKeCNLz+fhbVIURm+2jwrmMlMjmk9cRj
         sgXs0ltMei9ICC4oFW3r6S6+eSksKVmsLz41Tuy//bLN5PJ0WxkRYJ5rB81KYLR3nUth
         mWo8ZKBaP583p36QPNeC8jdrdRna40KWilQN9seJ6NPP3mKEQ+J2mVhm+qtIucI8FU1q
         /usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607469; x=1741212269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1H5V/4krQO0tnwIPu67VnVVU8I6AEiTtxk+UIVEETD8=;
        b=IIlwW2OAjY9GsfM7j0IhBNT3djVWsg89xJyg/9q0bui7bPnZn4NnGPnZy8zpBD0hDW
         c6VvAKfU2GcTCJZ6RpjEsA0qg9FFAXk58taFHhZCZvy8uO1025XoStowT21eu1nTJIxj
         t1mOoxVHIAp1IIUMQLn62JyUeTuMAgE6VopgKa2VvlRWrepOtIHbmtVto2BZGQK7q0mh
         aVp/jABESWF7TjeWNNqCOn1X6qD8Hx+co1CpPQ9sA4TlmgtxARAxxjLIu0iKqnb2Nx6P
         /dD+wS4yD4FPHM+PvG/NVBkFFvEj+8zB3NMK+vng+uAY6Ds4qQC/oJNO0+XCudF7L733
         u0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVsNe/ICJTcP+/bsuYSdB4CNVoAaeBvBf0dvJXsinAGnbGzWLA/Qyedg/I1PndHnX18OTMDKs1NljOvofyH+rrV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvy8qrUN7T8HDRwT3GtgrgqbgDEkEWXKiB/kZsuF9dVWY9c0Is
	sh2WQz16O6bbiirZy2y6wTwCqtISgXDJ+VFtZxMsp7IVaYzodpTTRnw6xwIa0jY=
X-Gm-Gg: ASbGncscQT82nN07t8iWIHtzhpEXaWahoOmT9Ryuk5CslddVkg88XxGmTH3ynoFsEuj
	h29as/0tcystjCVfjtXqoLuH1gMS0rp1Sb3HTlcuiLhWQ1FRxp2+g4pvtuuPW2zP3v1T4YTDouM
	btW80mcHcVrRhgqfNw4oA2tBQjfg4iPbtp3yC0n3hnY/4iWHY9R0jsU867mSB0N7jrX5S1RnEqV
	IpDLLNeF0H1ahVAMaqhkdvyQI33LCfTbt0hHDB/fs5zeuvbiiECUPx3BRv1pt1XdYdfMgxmkQQ8
	4QGHdtWAVqDyWJZ8gIL5gXqduPp0AyzoYnNh4S7T0O4IcbYsvtY1PzdF
X-Google-Smtp-Source: AGHT+IECzNts0Mtu5VbZUxztS2HO/B6nm80SgninqK7JKlelTupDcduJXw38Hys3XginT6lu7IkrHA==
X-Received: by 2002:a17:903:2348:b0:216:53fa:634f with SMTP id d9443c01a7336-22307e78babmr138892345ad.48.1740607469342;
        Wed, 26 Feb 2025 14:04:29 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:29 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 5/6] scsi: ufs: exynos: Move phy calls to .exit() callback
Date: Wed, 26 Feb 2025 22:04:13 +0000
Message-ID: <20250226220414.343659-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140429_836908_E37C6D99 
X-CRM114-Status: GOOD (  13.67  )
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

ufshcd_pltfrm_remove() calls ufshcd_remove(hba) which in turn calls
ufshcd_hba_exit().

By moving the phy_power_off() and phy_exit() calls to the newly created
.exit callback they get called by ufshcd_variant_hba_exit() before
ufshcd_hba_exit() turns off the regulators. This is also similar flow
to the ufs-qcom driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 27eb360458a7..4c3e03a3b8d9 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1513,6 +1513,15 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static void exynos_ufs_exit(struct ufs_hba *hba)
+{
+	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+
+	phy_power_off(ufs->phy);
+	phy_exit(ufs->phy);
+}
+
+
 static int exynos_ufs_host_reset(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
@@ -1968,6 +1977,7 @@ static int gs101_ufs_pre_pwr_change(struct exynos_ufs *ufs,
 static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.name				= "exynos_ufs",
 	.init				= exynos_ufs_init,
+	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
@@ -2006,13 +2016,7 @@ static int exynos_ufs_probe(struct platform_device *pdev)
 
 static void exynos_ufs_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
-
 	ufshcd_pltfrm_remove(pdev);
-
-	phy_power_off(ufs->phy);
-	phy_exit(ufs->phy);
 }
 
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {
-- 
2.48.1.658.g4767266eb4-goog


