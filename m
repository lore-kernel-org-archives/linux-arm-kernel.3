Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A61BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=57rYJvDLr2D8w3kMcZW5Qve8k2sDHgGAExSpeGzzFo4=; b=oyDcLICw/MibMahwKj4XkYYyor
	EZDDY3kWINHJm+WP/XZ6bD9vmZaaydJY+N7J/8md/nVnbgal6XBjzVATFxs1Ff08vVhaV7ATC7QPb
	HIjUt+kawhqB6bOXVOTtUYs2TyFlZ16rWM2N3GD2TupBmINzVp6fbSfJQXxCyXT0VvC0oxdGy61xD
	17gLM9sgUJIr19HoTFlaTUs/Cy3pR2Nypm/ZlNRopksAIeWTrfpXr7LMYdfzgcufKTfCJmqMSTTP2
	wZVf8SdN0jYOGsbNssaSR5JNW+1i+nM2oWiRM7En8KhgoY0CZIK9uuNWdHcYBTJYs2jT+al4AX53e
	snHl63WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqJW-00000003G6a-0TEc;
	Mon, 07 Jul 2025 18:11:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpHW-000000037MU-3SNY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 17:05:32 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ae3b336e936so635132366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751907929; x=1752512729; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=57rYJvDLr2D8w3kMcZW5Qve8k2sDHgGAExSpeGzzFo4=;
        b=nGbfIq4f53QsAvbWNKmvbw0sF2sfTF5mAg08AWOvG8dml6z6neDqCBC1UeNYfv8d/8
         Jj3SdP2+xVrdF3F0z4B5GS+jfAVV0JxbBMyiqkUJ70+3c4I8SKWM8h5k1k9iZTpY3KpO
         SYuRGhyISpQTL6OlR93FmJ2I5bRJClUpmfDaYEbXVu+YAy6hjPwoHVlxX8UAeL+Agk9V
         mQVnWFHLpkk95aY/miZEve6QASgVggEkl9hfvmJ/A6cfnKMoBZU7BzN0beHhTyyCpetv
         aSQXR/B+DSErQnWmF21EwIXG16IO7GvJDCQDPSGvmSXrSbuW812NIBhG+W6VU+lwIPHx
         8+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751907929; x=1752512729;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57rYJvDLr2D8w3kMcZW5Qve8k2sDHgGAExSpeGzzFo4=;
        b=eSu0EKCCqy2Ty5cTzOc5ZIgKq34RBvjuRtrp1Q0QJj67eKOFIYGBxr0Tvaa+F5/deU
         9ROJm0MwxJgmiqqblBaG7bUz0nfsu5Oc7LB2JuQaNGNfhdNJZ6hjc4Yxg3ro+spugie9
         6qNe885UHZKdSXb+49oQCVD1xH8iHJ8e4bwzkCOZPDueNfkxW4mxxNGEkcr0GPLvc+DF
         01WMUUcV7EFKMh5tpHm2zVrTqK741SW89LQJunXNeLFnBwc6Wb9JXFtXcC5ZdIpGW4UM
         sB75JXrruR9WXIWf27yazu/g7xowc2XkeKwTBadMoM3f9kqICf5lNVIrLaiUN6zERX6Q
         skAg==
X-Forwarded-Encrypted: i=1; AJvYcCUTMbo6yimWgDZLf5pevMykMCJaCQPgQLVwoHDAmVu5ZmuY8VdtejiXfpH4XxScHHrPiEsETDmCeSzUMTnu4aDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr+sGyRBKRWEP2xnkAFT6jzM+QL07c5PLDG+NC0oX5+/C+8Bb2
	UH1eEndWDXQDS+SKBjK+cw4KqLOum8I2nSN1onp12c0J6iAzKgiOma036SU647HgObk=
X-Gm-Gg: ASbGnctBclYo+SROXFvaBn1wa8uG4AqiZS/vlODsDYZIcu4+tP9bOB1qCBmmjmGp2QQ
	N+3H/Jn6dO40FBHjeouMsLe+4dS9sC7p79ynY+vt5VJUfvqeIlVcFZ9CZQIsQ22Su1E9gc/TgHj
	Gx/TkMNmrHrNbInfRuHys7QwGR9EElXt/Ihetffm4e2KTtuKB/CtmdfOwMdUyYMiha25/Th3M/s
	U5s5YxrkH/23VN/Agh8jnmEmfQo295vzt42TL5Vn/d8FNYcvAWLv6b89leBD2NGyMFaC/6tjOi4
	qL34ngl1kjiqqoL8++hja3pG7X/e90kRAI2e9sk+6LRdjm0oKEOPTnino97gW+UHFRzmybqDDcH
	dQ6EGAJkRkNXoRnMDqxIwNJUot+ef8g7RFN4nTVOp60dTTw==
X-Google-Smtp-Source: AGHT+IH39ie4cMyXIg4z35kSN5NcopH3AiyCIAZ7/0N31t7b87LaPnUMjOhDIkjPEUdI9Xt4zZAZOg==
X-Received: by 2002:a17:907:3c91:b0:ae3:70cb:45d5 with SMTP id a640c23a62f3a-ae3fe741335mr1295648966b.48.1751907928992;
        Mon, 07 Jul 2025 10:05:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac54a0sm745507266b.109.2025.07.07.10.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 10:05:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 18:05:27 +0100
Subject: [PATCH] scsi: ufs: exynos: fix programming of HCI_UTRL_NEXUS_TYPE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFb+a2gC/x3MPQqAMAxA4auUzAZqqT94FXHQmmqWKo1KRby7x
 fEb3ntAKDIJdOqBSBcLbyGjLBS4dQwLIc/ZYLSpdKMbPL0gpTtsgrKyP3Cq51K3lkzrLORsj+Q
 5/ct+eN8PxFjj5GIAAAA=
X-Change-ID: 20250707-ufs-exynos-shift-b6d1084e28c4
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Seungwon Jeon <essuuj@gmail.com>, 
 Avri Altman <avri.altman@wdc.com>, Kiwoong Kim <kwmad.kim@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_100530_867375_3E14BF95 
X-CRM114-Status: GOOD (  14.68  )
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

On Google gs101, the number of UTP transfer request slots (nutrs) is
32, and in this case the driver ends up programming the UTRL_NEXUS_TYPE
incorrectly as 0.

This is because the left hand side of the shift is 1, which is of type
int, i.e. 31 bits wide. Shifting by more than that width results in
undefined behaviour.

Fix this by switching to the BIT() macro, which applies correct type
casting as required. This ensures the correct value is written to
UTRL_NEXUS_TYPE (0xffffffff on gs101), and it also fixes a UBSAN shift
warning:
    UBSAN: shift-out-of-bounds in drivers/ufs/host/ufs-exynos.c:1113:21
    shift exponent 32 is too large for 32-bit type 'int'

For consistency, apply the same change to the nutmrs / UTMRL_NEXUS_TYPE
write.

Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3e545af536e53e06b66c624ed0dc6dc7de13549f..f0adcd9dd553d2e630c75e8c3220e21bc5f7c8d8 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1110,8 +1110,8 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 	hci_writel(ufs, val, HCI_TXPRDT_ENTRY_SIZE);
 
 	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_RXPRDT_ENTRY_SIZE);
-	hci_writel(ufs, (1 << hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
-	hci_writel(ufs, (1 << hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);
+	hci_writel(ufs, BIT(hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
+	hci_writel(ufs, BIT(hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);
 	hci_writel(ufs, 0xf, HCI_AXIDMA_RWDATA_BURST_LEN);
 
 	if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB)

---
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250707-ufs-exynos-shift-b6d1084e28c4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


