Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A206CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 23:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UKOPT9vpO7tVqgXvj3ava3zXsZTtMZdAs3/7bhxkzs=; b=RpBfAUrkaohZHT05uwT6J02H44
	/NS0AZMv+THT2sueUEom5ngXhpXovq2WfQXbms3QCpo9qnUDlFTvuM4cvk+rXN163oHr89U85zvGf
	onfMW8az9OaW9PWo5BUAUBoDmDyfaeDU6vVTHV2SyHnmaXc0Vjl8bRit1a/QYV90Tb1O2cKu+W2Z0
	r/tYuhPLBNf1tL5T9LyZ9N8kI5Yflpu1MDOrn4yBgZIOnWK8L1wPLKuYnJcREBypUoWo+m0nmKMNA
	CmXd7hnnG4FDYKMNZ6tUGx1D5hNNLyRsCHKbhc6w1UASNtLmqJ3htIlSqTPRZJMfl9gt4S6b72o5Y
	RowAgDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCiZ-00000009J7k-1vpc;
	Thu, 21 May 2026 23:22:19 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCiW-00000009J6S-4BWB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 23:22:18 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8c7154725easo77540666d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 16:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779405735; x=1780010535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7UKOPT9vpO7tVqgXvj3ava3zXsZTtMZdAs3/7bhxkzs=;
        b=Diktyh+MJK1JBbLVDcORfXWfU2YAPVm90Sw3bYYCvnUZGBHbdDRsWfPQmLTlZ5i9Tr
         dI0ySvWGEVa7Bd616MMweX62wj4YD/hjoR55gL3fIuKQKUkMPgYrhoO90aeiPmj398Vj
         uvTeiBLhAP21cUklEmOzP7OH6GGwzsYZCrorXD0pu5zhZu8Ox3A5rKUSAkWvrTNtEdVo
         6qOKYh9De+ATk1+8tELjFuBX0e5tysD2BrHTLF/1+DbVEECzd+p9zkPcEJPDkxIY6tro
         sGsvaKVXQON3ZIO51Dp4YDQOK7N/go6xLDHhnEvsGI0j8QcTT/ii4+k9seLDjKVwgJtw
         4VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405735; x=1780010535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UKOPT9vpO7tVqgXvj3ava3zXsZTtMZdAs3/7bhxkzs=;
        b=pRJeRDM0PTtJnffvkIPoy2iNKCc+iNVjNqN0S00X0xukVYkM6sV0bLhc8SSSlK8wFp
         ah4tjOXx7LHcDXVo7uiDVS/7sizKzisLjYkaiBw0UtxYQrAhRNrPN/+tnSt/k9hN5b24
         3NmFcD/LEsuI0yjxOMIOF2jdCCRZX1xr+z1luZBzLV/l0jtyK3WBN/bBQ3C1eFWD0sxU
         usd8Nb8xB6kZ9ZwSgkcIdTE7BJP/JIQFP35E7Wd6O3ntRi1NGXJ3pakSjtMfZqqQ3Q7n
         zVZaRYwH8IK6AcusgxL2yzwtuA+v4E0p0ZPqmjlR0XrNIOSyaBAuaavhmZkH4Lw0q/nY
         RNUg==
X-Forwarded-Encrypted: i=1; AFNElJ8Qt4izp9bbP9VURW+GjVi0yonmNgiKzNAGTN4lT3JdLFPdrOzeiXoi1RftslC3HV6TSMv8oLwOqlXQ/07gaSKL@lists.infradead.org
X-Gm-Message-State: AOJu0YyaKV5WtLZMO1CUvHQ4beDCcsten1e6i9C7KSBq1BzUFrGDJo+7
	AkLd9JpluQ4JMEpNubfOXO+TY9RtS1nex4muuVvuZR91akNJfHxWDKWd
X-Gm-Gg: Acq92OHeagNlLgcSzKo0VMZq29Z9Wf8LLSnQV8hQlO0g+YL4LHUsP66roQAI7X5uYGJ
	FfIPhHmPjLJnbqZ4S8NfuVp8AH+vfliUy/a/C6bxz0nXH7r9GRXzPjiax57nWM0EcFZ2lXeC3q/
	6bbrajv0T2lQnitul7sOjnccF5uE+zggzhFpHY57J+DP5l3Iqsppu1u0FlewCDj8BDsIk3myKT8
	D0Q4AtVLiCaDdelGZTvdSQ7Dc8D7xPM/0EhRY+qVRGSZE01g9MC1+C8y1gt0RCUEIS3wfJScqMC
	7XxwmVCfG3lIaIfW/mdanXkMQju1F85F4jLtkvPqoIlpYSgvefOhA2xRQAs6LOKfjZ28y8aLY5w
	xl0vTJjHwapKQLOWweGEeT6i86f9RsZhCQBAHWgaBd42LcBzxTPYdrRcxGMGEYIab8O4QtbedeU
	/ijmVVarf8T+ZkiNGjZxCyMjt7SS+/L7Rfg/1b0ckPZy689avIq3ejCn+P6bYz/8iH2fQM4ZeUi
	tYUgpptpPvBTexvRua5q54jratuGEMP0YpC1ta8SZiQsQ==
X-Received: by 2002:a05:6214:501c:b0:8ca:1e0f:f20c with SMTP id 6a1803df08f44-8cc7b5f0c35mr25342536d6.4.1779405735302;
        Thu, 21 May 2026 16:22:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80df081asm1663276d6.18.2026.05.21.16.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:22:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath9k: owl: remove misleading error message
Date: Thu, 21 May 2026 16:21:57 -0700
Message-ID: <20260521232157.261575-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_162217_040820_FD9553E6 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

The error is about the firmware failing to be requested, not calibration
data. Just return directly anyways.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
index b9ef34709202..4460ee7f44e1 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
+++ b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
@@ -204,12 +204,8 @@ static int owl_probe(struct pci_dev *pdev,
 	scnprintf(eeprom_name, sizeof(eeprom_name), "ath9k-eeprom-pci-%s.bin",
 		  dev_name(dev));

-	err = request_firmware_nowait(THIS_MODULE, true, eeprom_name,
+	return request_firmware_nowait(THIS_MODULE, true, eeprom_name,
 				      &pdev->dev, GFP_KERNEL, ctx, owl_fw_cb);
-	if (err)
-		dev_err(&pdev->dev, "failed to request caldata (%d).\n", err);
-
-	return err;
 }

 static void owl_remove(struct pci_dev *pdev)
--
2.54.0


