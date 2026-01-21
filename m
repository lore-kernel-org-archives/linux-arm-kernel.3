Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C071D26296
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iKrrqjcg46QuFiM8rQG6H6noqywu73UQ7w/zxl2mM20=; b=xLY77Daon7fK8Ti29FJaUBDH+e
	fwSewnFEdME7xvnqsUxJu1zovaxf62ysDqQxtajzVfJuzsbQbBbReQ5MP7dGF3fjQdANd5/Dd/5iQ
	pKkcP8Fhrko2UCANfDDwU8RGMUY2H0C9VmPJ/ZZ8doe/EeBaP/iZmxBsY0yOmFZ0+e6Zrm0ZTJsgH
	bgw550UnGcrE7/pkzNPJB+qi+JWlFgApYJwr0ZEtz8t6KB3pcEilAnjgBd2nNA9bKgLUETQaSBT0U
	iVmZysBlraHMf6Ah2uCRcbmPnkNNs2zhsbznQwMrxBmhaHKYRioAYpBtLRJELX1RQ8sTsEaVlmaj3
	uY9G0hHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ1Y-00000005Zw3-1STP;
	Wed, 21 Jan 2026 14:17:32 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ1V-00000005Zvc-1Vlo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:17:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso3969459a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 06:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769005047; x=1769609847; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKrrqjcg46QuFiM8rQG6H6noqywu73UQ7w/zxl2mM20=;
        b=gP2gH8ssnqYUvWLXuiF0WuPKDsOvFktVZxCCtpsGUevJlq2t942gTn1R5C9BYpA0QT
         GGLG7Hd/dwd1JM8t8OFRBHqqzqUyKOaYtSWpbfBJ4vHjq45DVVzxHIhPuMChoalJV9bl
         y5R1BPW4tjbb1KDyh1PONvrTb3F6IIyNIBhW+WtqHC9usDWZsvkGlPyJPLjqI44vG89t
         vZo1iSRWtOktz8npcVKKfeqzUGQCE8VAab2AMM9AVzebZV12MVL7K21F6EjdCi2M7not
         6+jo7JQsrQzXppgoVQBCYInZsMctFRaQtOSoDsq0qft+FF28NfjuIpbaQG3OU5I4o54j
         PrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005047; x=1769609847;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKrrqjcg46QuFiM8rQG6H6noqywu73UQ7w/zxl2mM20=;
        b=TW+lmMTN2hIpqS8rudGn2VbZ/V5a9s48S5t/3DzvDPO7+D4PFZLpcfZBmoXHGWpqld
         R0Zn6jLk1CgKODLeKc6sXQr8rn8cwiEyb2dGPKsDCieBwj70yg3330GBaiwXIzGYhXnr
         aT4UdJp1b89m624b+6ji8AxhHBliHVLoi7IH7FfxzC/SFaJr+lo2+xPl70VYoCSRrOS8
         NLwKjlfOFvmxjJr7QAthsZxX9d1TrwBkZ7hvttQjRkjYApBoAVhQrGyPZ41fRLhoeDHm
         E1SsKPBtDfgeBxanxRiJ/M1704ae4L+PsLqmroPYK1rdyc2gH3tWMa0t7XvoVapVRgYD
         iiew==
X-Forwarded-Encrypted: i=1; AJvYcCU7j/MA77HAR69W0eR8a2WiSp27HqMvg807Qw5IJQVLx7xrwAPW4d3tqPXzx3zDGOTLCGlsOSWLnPZ+3G0YYBze@lists.infradead.org
X-Gm-Message-State: AOJu0YySahlfbheuaKE27VLVQO2NEmEeIsCkeXw12HomqPv29WRv9dG7
	GXCPsQGt/DCR7ajwhzGMQGj0zmGzubEnTYgtMfX7lHeJom4YzH+N+r/5
X-Gm-Gg: AZuq6aLE+b0xUGh/gs8wIvp7O6EXSXOGbxaVuIE1cS9LgpZL2dqwXwDlFMqwuP9E9oz
	cwi7OrWC2b5mTNyN9KxXqhl4alhYQsWMDDVgbSLeAAKVMFQmfnXpZjLWoiiGXoxQMqIIzhL4ToC
	5DkXNl38gVPshSUUgO29WDjQQBDH6ResDrHugUGGSiJoCBoUjiW6uNBfPmPsKKZIrR6NSbgHaEC
	wWt6nwWhJj28HE2Kf6k1b9rkpb6jwG2Lejk/IML1PyAxaFOHZENREA1QH2QBgOj1MkOtjmci/yD
	56+TZ68xxoJZMf+bvaOVr+Y7jeVERmc/4PfAYGMsx9H1toUNW3w9Cpo54XJx32D0dcCnhcq8Ze3
	9oyhnN7UGR2DvAqLxhAqZ7M/H2kgMJl3zG9J0eRiAUrQzk+t5KedA+UYe3GQ7tkk9jEIfysGcLq
	XixjwC9VfMxY5Sz+68l4ufQbZ0
X-Received: by 2002:a17:903:2f91:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2a757515da0mr55304155ad.12.1769005047012;
        Wed, 21 Jan 2026 06:17:27 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm158144605ad.38.2026.01.21.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:17:26 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 21 Jan 2026 22:17:17 +0800
Subject: [PATCH] firmware: imx: scu-pd: Fix device_node reference leak in
 imx_sc_pd_get_console_rsrc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-scu-pd-v1-1-f993e4082089@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOzfcGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3SQT3eLkUt2CFF0jU/NEy0QTg1QLk1QloPqCotS0zAqwWdGxtbU
 Aj9diLFsAAAA=
X-Change-ID: 20260121-b4-scu-pd-257a9a40e84e
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769005040; l=967;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=psXMmI1AnrTNmbUPhfuPxpMrDFwww3OT+Tpf52rUs4k=;
 b=UewNA73STZQdwpe60NY3QQLvtNzecqxLwUk0xLMEiSVclZNQAxE+IH3eKK335EAGp/MKGyHZG
 wY4gCGmtTJ0DRQcZJY1wETuCJmC9PKgZPFG3SozHPeDF6CexTqIJ/lk
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_061729_413412_1F144721 
X-CRM114-Status: GOOD (  10.23  )
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

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In imx_sc_pd_get_console_rsrc(), it does not release the reference.

Fixes: 893cfb99734f ("firmware: imx: scu-pd: do not power off console domain")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pmdomain/imx/scu-pd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 01d465d88f60..3ec33667a308 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -326,6 +326,7 @@ static void imx_sc_pd_get_console_rsrc(void)
 		return;
 
 	imx_con_rsrc = specs.args[0];
+	of_node_put(specs.np);
 }
 
 static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-b4-scu-pd-257a9a40e84e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


