Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE47EEC2A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zA8neqIU5RolfFhf2Lp4LEYhHtdffFh3y3a13wUOp+g=; b=gm/gPQwTMiJDwntRn12VazFfv7
	2fjX//6nJhnct3CepnbQCZbEvY9mEpXl7gjwGIxttNCcOZSKeVAGCvhdVInLdoSmqJ3ylfwa+Xuvf
	2eWbG596bkmAiKJysgAlPCccfvO/Va2gd3FlfhpBrVh+WtV7thqN3/55PPYaSAgolaPGKt2FdsnLe
	sV6LSlny3k576E3jguOODazvPu7K7MJTICQJNY/PMBPuNiswN5JEtOFT+Ws90w0MGk+O3MxDShEOY
	TQ3a1WeHRWMTcYQCnB2crEgTmgD6cew3pKUj3A2vqWF7OcZXDa7r/tCr/tDmXkbgcGGxMN0cnhJV5
	TGfEarDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuee3-000000017xs-12Pi;
	Mon, 23 Feb 2026 22:43:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuee0-000000017xB-3IAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:43:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8249fc726e9so2513629b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 14:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771886592; x=1772491392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zA8neqIU5RolfFhf2Lp4LEYhHtdffFh3y3a13wUOp+g=;
        b=OjI21rPzGfzRYqvcm3BnAL4BF1VX5zVNZOtI6fHNW5R0qn8qwOBwC8SY45RcC9VjVy
         VLrHK5qNTvMTu9csyP2r6/1pNwvy3OYjVPXPt6ueIMNaj+t28GTCVaeKEKIsJHqMrYR7
         Bzue60LZcyBcwZzSNX+MI2cZgLCEdoozGAts8NZfYoF+P2H/tSaNZhKAAVwcp+PaOgrQ
         Zp625QhzUklCZBwVgAiHrTDhHoYGVIkj4UlnnVzuVFzolt7k21RmmJ0Cy4e5v8fSC2IZ
         b7EdTT+/BPeI1JKQXTWF1vDtkEXHcV3qXW0tMpzLNvLoDTzh9/76s3AwLVyAc/d/2Yye
         E0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886592; x=1772491392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA8neqIU5RolfFhf2Lp4LEYhHtdffFh3y3a13wUOp+g=;
        b=KE2m6DicajhcE/trZFfW+sxeHNhuwBvkp80xpdUW0TMONreWpexooNMPR5aBsUXBgl
         CKCaqOBAys+t104izJ3eJ0t2+fF4yje9Xsy2GLM40XC2CIbIQUUrsCDwJj0AmFw45oQA
         FaZS2duf2N08SQkzHavzwVuLQmOW2PL5IgG5mtsl4h9Z0D7wsc3cKGz6Ue/38gY7FcnK
         /awhnJ5q7FBUsVGrcXEpxHePgG/7c9opQcsnXE6Oa9KGWTnD8IAAkP0nywSnmIM6Szq8
         KD4TG45YAdz1L94Bm5X2DK+jvFur9Aq6VBy27R7K9dYiiJKpoFdsiM57HKVkkg9TuKjt
         lxbA==
X-Forwarded-Encrypted: i=1; AJvYcCXIozCEHuEZZItCuKVlrzwTxFl+mFSmIVm6+Y8dkZaVtoL6b02yjyY3bOk6qnVMWZvGOMMfWDfCvCbnstEZ8276@lists.infradead.org
X-Gm-Message-State: AOJu0YwNiNktoJJZpD1v7KKtmMMQenhYnXwG/2RcgFtAF12AHkLE4ilz
	TvLGHTtiOfaKJBN49wvfiGMGuWoiob6u+J4xLUqNf99E/5SxOgQ0RMZo
X-Gm-Gg: AZuq6aKAQ1LWrzudZl8SSKD/iT7LXc5lbHZfZ9u/As0HjdNFPqBvYqG/hlZPNLMeKoo
	ZfKvJppaWar9yr6sn6dgbPg6kZYSoOyTgy5R5OZ/8IKD/7cu5Ze5yKe7C9ymRlH8cWL6MLWsiF1
	IQaElMQVnqhmeQU/4IgkEwLHyZQdCKAYhzqSc/AsmSpnsRN2JQqie1trlO0DJcIp6qZ+1vqmnPu
	eLEG81Hr1fkQ0bxOnFCxynoIVspl6WOmKeUueVLbA4Gp+w6KA5gOZPvkdY6auRd1XjBNGPvfp8k
	S6aEIdzeM71OyK5qbYZVx9KrhRCBTZqzay2kLTo/L21u0BJXeITAg1BOWQBslTBAgeMHdksE6NR
	S1lj2iExi5IERGO8usQyGG7W01QFgE4dLXY4uhq0b5jx/Ph+eUwwD9Q4ThdYg4blPYtJ0agqxpK
	Vg9KfINp+PgcDOKxTSe+afIpzo3+w0fxfYrqkLnjrEr+6HA24swcZ2hRwPF41YhB42
X-Received: by 2002:a05:6a00:130c:b0:7e8:4471:8db with SMTP id d2e1a72fcca58-826daaac4c5mr8310461b3a.60.1771886591857;
        Mon, 23 Feb 2026 14:43:11 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd693845sm10614461b3a.26.2026.02.23.14.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:43:11 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath9k: owl: move name into owl_nvmem_probe
Date: Mon, 23 Feb 2026 14:42:54 -0800
Message-ID: <20260223224254.27081-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_144312_854458_303475F3 
X-CRM114-Status: GOOD (  13.21  )
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

There is no need for dynamic allocation for a simple string.
request_firmware_nowait copies the string internally anyway.

The error message on failure is also wrong. It's an allocation failure,
not a find failure.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../wireless/ath/ath9k/ath9k_pci_owl_loader.c | 31 +++++--------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
index fe1013a3a588..b9ef34709202 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
+++ b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
@@ -137,24 +137,6 @@ static void owl_fw_cb(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }

-static const char *owl_get_eeprom_name(struct pci_dev *pdev)
-{
-	struct device *dev = &pdev->dev;
-	char *eeprom_name;
-
-	dev_dbg(dev, "using auto-generated eeprom filename\n");
-
-	eeprom_name = devm_kzalloc(dev, EEPROM_FILENAME_LEN, GFP_KERNEL);
-	if (!eeprom_name)
-		return NULL;
-
-	/* this should match the pattern used in ath9k/init.c */
-	scnprintf(eeprom_name, EEPROM_FILENAME_LEN, "ath9k-eeprom-pci-%s.bin",
-		  dev_name(dev));
-
-	return eeprom_name;
-}
-
 static void owl_nvmem_work(struct work_struct *work)
 {
 	struct owl_ctx *ctx = container_of(work, struct owl_ctx, work);
@@ -195,8 +177,9 @@ static int owl_nvmem_probe(struct owl_ctx *ctx)
 static int owl_probe(struct pci_dev *pdev,
 		     const struct pci_device_id *id)
 {
+	char eeprom_name[EEPROM_FILENAME_LEN];
+	struct device *dev = &pdev->dev;
 	struct owl_ctx *ctx;
-	const char *eeprom_name;
 	int err = 0;

 	if (pci_enable_device(pdev))
@@ -215,11 +198,11 @@ static int owl_probe(struct pci_dev *pdev,
 	if (err <= 0)
 		return err;

-	eeprom_name = owl_get_eeprom_name(pdev);
-	if (!eeprom_name) {
-		dev_err(&pdev->dev, "no eeprom filename found.\n");
-		return -ENODEV;
-	}
+	dev_dbg(dev, "using auto-generated eeprom filename\n");
+
+	/* this should match the pattern used in ath9k/init.c */
+	scnprintf(eeprom_name, sizeof(eeprom_name), "ath9k-eeprom-pci-%s.bin",
+		  dev_name(dev));

 	err = request_firmware_nowait(THIS_MODULE, true, eeprom_name,
 				      &pdev->dev, GFP_KERNEL, ctx, owl_fw_cb);
--
2.53.0


