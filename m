Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610AAD767DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9jgbEBOHttlHnzoEFJvpzWVhBO7kDylk6QvL3iIgjQ=; b=iIW+FWns3xJRGjq2hTtumf21he
	9m0Mbiw2s+BqEroZlSA8HXCJP0Kd74ShkMn4N+o5LfTd34Yds18pplf6UfjfuhGaCT5B88sE8mPKJ
	JImRgF5UzI0qA5ou6jnf6urcA4Ddq3sqSJavYO+g+8tJTc/uAOrdI4z7VE01A+6iTt3NOPsT8L68B
	5z7gHGKR4XjVI87Ny56Ru+JckhrkQUzB9o9RbPPAoWWILK+4Cj8GOd5vqFplo0oS4qwdXFdHuqyva
	qLE9e29XxWxbLrsgX8t0cqEBHZ2f3y+vEF8UBAJTciK2lJBCW/o8Bik+b4v1Z3C3s0D62exDrrRIo
	34aNIWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAi-000000040an-3dBR;
	Thu, 31 Oct 2024 15:33:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfN-00000003tgd-1VHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so8633875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386850; x=1730991650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9jgbEBOHttlHnzoEFJvpzWVhBO7kDylk6QvL3iIgjQ=;
        b=AGjmPv4KcE1xlaxwxth3+VIvC4rDqBZkwsi3CvKJd15pV8lZvYy2UcumhLUjAKiWaD
         Im00CIHTlPPSUa6cUB9agKjOLwkupVrdyenB2OHRek2mD85RRzLr7ZvWdMJlBIOeF+oH
         E+SFqVjc66dVjSWNm0s3gQ+dP9W8KU716iNu6MRZXn/xYmucg11NFdRE9jAv+hSH7dlU
         le7GRroq5hJmNpU00YY9FnEDeYXAhTRPOqeCd6KZBCNYmBytfMIyi9fPHTW33+Ymktwo
         CB34WPX3GhNQSg+SufimUHIsfRxXLNuN29jV5El/N/RCwjzvKM6cURdpB+MxkBofjQ/6
         6+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386850; x=1730991650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9jgbEBOHttlHnzoEFJvpzWVhBO7kDylk6QvL3iIgjQ=;
        b=vXHqjwmv3H+GUIXLLPmzLoKDjPFrUEfU+ip9avT4yE3pRWE9YNZXpOiOXaU5dEl4Fm
         zgECzrl7FwBrXZbwBUNV9j/KuNw4tvmQTYgCPFzDNL6qpmbDyDVXhJPn3NbAtmBwP05l
         4hWubGZmIwqYlzF1G+yxX7Br8IKLQj6/6tK0cCOv9iMlfzhvK6UzN/fqnBxumKckngxf
         MQ1yyJIZ5SHCI7UlPfPkDZULkSu3PVy2x4qSjbSyexnhgciJM8Qd+Ij9lMMiU0ofSf7z
         vFNOzBUlvFpckxGD+s6hNlEv6P1KLeLLDSjSgp72YIidwq+d3sLGRXrlQR2UH/rEE0kC
         ZX2g==
X-Forwarded-Encrypted: i=1; AJvYcCXx0QUOPqxwEWmh7e/YZtR4SH4PIA7AyTbb5P4gM1Bb2RENI9PWZ7Y06P0n444/FkcCPOoYRJHNq2lxfVwgaqvF@lists.infradead.org
X-Gm-Message-State: AOJu0YxEO8TynHBWdjGVtCS2S0x+Lg5HyCZ1bQHDRjQifObqXOJbUU1H
	/zRtoRmHeEQMOQN0X3ghCeh4TFkDPEaju7rgLoXknasvAju8mv/MuGgMUkybOoo=
X-Google-Smtp-Source: AGHT+IGBloKnQyzK042bxpPzzNwKfFJqeBubjE+dIc7DcjDnTJukogo204p6ptQH0HImb9KtmNPitA==
X-Received: by 2002:a05:600c:1d1c:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-431b17365ffmr107037035e9.24.1730386850219;
        Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 10/14] scsi: ufs: exynos: enable write line unique transactions on gs101
Date: Thu, 31 Oct 2024 15:00:29 +0000
Message-ID: <20241031150033.3440894-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080053_565584_3AA0B7E3 
X-CRM114-Status: GOOD (  11.40  )
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

Currently just AXIDMA_RWDATA_BURST_LEN[3:0] field is set to 8
in exynos_ufs_post_link() function.

To enable WLU transaction additionally we need to set Write Line
Unique enable [31], Write Line Unique Burst Length [30:27] and
AXIDMA_RWDATA_BURST_LEN[3:0].

To support WLU transaction on gs101, both burst length fields need
to be 0x3. As all other SoCs expect the current value we update this
in the gs101_ufs_post_link() specific hook.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: fix typo s/burth/burst typo (Tudor)
v3: update commit message (Peter)
---
 drivers/ufs/host/ufs-exynos.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index d59e1933b64e..78307440107f 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -48,6 +48,8 @@
 #define HCI_UNIPRO_APB_CLK_CTRL	0x68
 #define UNIPRO_APB_CLK(v, x)	(((v) & ~0xF) | ((x) & 0xF))
 #define HCI_AXIDMA_RWDATA_BURST_LEN	0x6C
+#define WLU_EN			BIT(31)
+#define WLU_BURST_LEN(x)	((x) << 27 | ((x) & 0xF))
 #define HCI_GPIO_OUT		0x70
 #define HCI_ERR_EN_PA_LAYER	0x78
 #define HCI_ERR_EN_DL_LAYER	0x7C
@@ -1922,6 +1924,12 @@ static int gs101_ufs_post_link(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
 
+	/*
+	 * Enable Write Line Unique. This field has to be 0x3
+	 * to support Write Line Unique transaction on gs101.
+	 */
+	hci_writel(ufs, WLU_EN | WLU_BURST_LEN(3), HCI_AXIDMA_RWDATA_BURST_LEN);
+
 	exynos_ufs_enable_dbg_mode(hba);
 	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_SAVECONFIGTIME), 0x3e8);
 	exynos_ufs_disable_dbg_mode(hba);
-- 
2.47.0.163.g1226f6d8fa-goog


