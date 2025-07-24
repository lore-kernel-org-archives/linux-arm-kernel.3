Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAC6C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGecDSfQkRQwOHSUrTvJEbSVKAprJg4maVsG15+73gY=; b=NLZiQi94G8K1JO6QzxRHJycZ5k
	ItHDiM01c2K6D+U5ro/7Rh3VOD0hYkYnbvypgiu1bPJnV6spIhXCgbqSKZefq1GnxoLGCOIpCQSiA
	s5E19QKY6MHurbVsJkmwllGkn4mnqPSlOW5TvjGjzP4i5O7V3jd42EnePjmA552g2GEp8/gs1bWvA
	hLMOWlRvd+fL0790Zg3Kynk0W8K+Uohg/+1cvsEppsopjAvc17KUvnaKmMwqSieW+l/v0p6jHyiA3
	aHqB+EBK8CirfUDv7+K6NczhtWFCQH2iZ4o1pPA+Y0RiZU5M+aPJUccaXivnCZ/Pp0LrcGhRb4QO7
	TsSmsmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexp7-00000007qGc-36u3;
	Thu, 24 Jul 2025 15:25:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetef-00000007HCo-1bA1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:58:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso8680345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 03:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753354707; x=1753959507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGecDSfQkRQwOHSUrTvJEbSVKAprJg4maVsG15+73gY=;
        b=Lh1e0IYDvmV2ghjmtfDCJGe0y3W0ZiF4qG2fcYXXypG8C2+F163M4UUFDlhM8OYbaK
         yKbQK4iBBX8iV6yvk0EcPEenJKDxbZjLQTqAk1TBPTklCVB8d9ezoBbDCbMGbcsuMXep
         sKqfCLk5yIJwGoImHj3jAFAo5z4f5AazPRN59C+hjJj7avdRx7ewguyjEo0Rmme132MU
         nPTHdW2iHcDp6LMhU/hcNDeMmPFkp8YQeMETDTMs5MM/wbuD3+PvNPjaID7Aa3zmkm8O
         m/sklq8Gk8ZWL49DRpu8hkH6vzX+3qZXw1f3YOK1sGrdsgeGoCIoYum7wPtSHZ5yZfnI
         h6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354707; x=1753959507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGecDSfQkRQwOHSUrTvJEbSVKAprJg4maVsG15+73gY=;
        b=HEQh3oN1vZkbKqQVKNeJE+w/SOg4LIS/php0DEvRkWjE18MigBlRQplrVjUmZYEujv
         5jxsk9mhKo7Bg2wpRrZ+qD4sGl/OScnSkW/2hgf+oiAdwNExs4HW65aU4ALPaAUYVSUR
         f1pwqAzXFeNofkLrvsGM98t6xNK1bU+51QnPTcHqVvxrGUmn0K2yM3GWbPH/Fg5apTYY
         I4Y9Y864/X0RqOE5+V//r3VjjePqdxer9VHgKITV7wAOD/01n8QS2SwrLFjROZ7/FHfF
         WwAvEHBFTkXl2Xa6PB9rzx9fdnuOsDrs1zqUyoYJi7vH53jJkSOTOJ7Ev2k7/K0+7ZXd
         2lnw==
X-Forwarded-Encrypted: i=1; AJvYcCW47cUNoPINvUZ9hSyqAefc4Hy5OtaPFfu40Rin9jpvLoGTOH2/QALCMzBAPHn0pf/9JBjXKnzezBH4hrXVxjIP@lists.infradead.org
X-Gm-Message-State: AOJu0YwXRpG8CCyfUCEj5RoVMjl9tLAEh3Lzp2yDUo7iIUcjN4dcvFz3
	rPwpvU+fCdKs0VWxIbfQeAPHu2XutT7yCxMBEaYfxxMrGQtmfQXYPkXi4opvjKoH+aM=
X-Gm-Gg: ASbGncs9qJACKWYwY6qK0RXsdleWOCVHlNar6a+wHfuD4gZ8hv11rCMTCeTs4444WnF
	6DAnLcXHRlqb2ViprZir6VLkgBHqnDkfwSfUATbU2j4FkYDumNVfpB6qm0epVxUZgviEdz3PzwH
	GV43yLeWDAEUhz21V3L3T8Ax78GCZKDBfNMzzXByNB6JpkPFoNMwaAqt4gN67t+xjaZP3l32jxE
	qg+nmhry7+1KoR4zZhLk8HccerbPMxot6nlDPfVdHFFTqiikOBy2/wtBdmieh6ZzhfY85mTJGqN
	wrlDP0Qo3NReLI4pwCHQ+0NAPSGXKi3zFmSnKl+5kP/0kKKXpYNa5x8td2Vj8s/hxSjJ7r0v4PX
	2tomxt5dK/6w5W5IN+ay+
X-Google-Smtp-Source: AGHT+IEec1gAogEhVNDlKxHHWHB5R0+lqM/g4ZlsnII2um+rpJwBJ/Nvy+vyPcI2BysN3G6ob2NnHw==
X-Received: by 2002:a05:600c:3e83:b0:456:2000:2f3f with SMTP id 5b1f17b1804b1-45868d53693mr42892935e9.23.1753354706968;
        Thu, 24 Jul 2025 03:58:26 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458705ce781sm15812735e9.31.2025.07.24.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 03:58:26 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] crypto: stm32: Fix spelling mistake "STMicrolectronics" -> "STMicroelectronics"
Date: Thu, 24 Jul 2025 11:57:54 +0100
Message-ID: <20250724105754.140400-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_035829_439004_4406F86F 
X-CRM114-Status: GOOD (  12.22  )
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

There is a spelling mistake in the module description text. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index a89b4c5d62a0..5e82e8a1f71a 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -2781,5 +2781,5 @@ static struct platform_driver stm32_cryp_driver = {
 module_platform_driver(stm32_cryp_driver);
 
 MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
-MODULE_DESCRIPTION("STMicrolectronics STM32 CRYP hardware driver");
+MODULE_DESCRIPTION("STMicroelectronics STM32 CRYP hardware driver");
 MODULE_LICENSE("GPL");
-- 
2.50.0


