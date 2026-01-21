Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9F0C44525
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NMHqsnCQRyn8ggYcyKGe99xv1siVufF+RsMTHXZ7p+M=; b=DDVJBnv4gU5X8uG0matG0MCceR
	PwjmYrsIebaFn/WNpy/izfZrlcrIGccCrhE7RUrg1C7tgglVRhob/iN/XnuX+EHmbJf4oDje3I/en
	6UxcoV/e9CdBfoP4s8Y+E0C7XI9A/zzpF6soutzqc3eJpc/eUvGbw2zyy45SkECb/OM7utZQNow0L
	Hi3AL/lm7JUWlpIFwG2TwKSLPz4tswz9RmOcu7UfiETZHjIUMbcEdgbQedJq0m3kp1ua8ARWq4BUX
	fd4xGH3XlyG0IXfvwIQFD0aEaH/c0j8L9cWrL/V9OktQVXI0i+EN930o6pOP+hOdSIj2vH9UqmHm6
	o1oh1Gyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXwn-00000005TWw-1Z3y;
	Wed, 21 Jan 2026 13:08:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXwk-00000005TWB-2CbU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 13:08:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so3424053b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 05:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769000908; x=1769605708; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMHqsnCQRyn8ggYcyKGe99xv1siVufF+RsMTHXZ7p+M=;
        b=UsC+hYOeM6xoUEw232ZTNwQzyimX8gPPFk1yUJ9DsYqPnjIeww3e0lZCcSG2cm8ff9
         gd2W/gHvabcrA8nzpfLg20KGbZrRnKpEC3Cxlmbs7xuMQ25L0beskcI8Amg2frynNvQa
         hf4N/lKi9h1Wq6p7qJMriAZDXpdXGx2F57u1r+LUf1h62yyFtu9cprX2F9/V78Y0U9Jz
         ppjFaGV9NS4nuKRlODFsd1zO3HgtUuEzKIfb6wQs1diPvg1AnpMi9VsIECnJrv9E6vQu
         TJRijNGgNwf4tnf5h2/JItuXiNs7edufV1L+DxPAJGS1c1JpM/v/ZXv3+eTD/eVrta4B
         h6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000908; x=1769605708;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMHqsnCQRyn8ggYcyKGe99xv1siVufF+RsMTHXZ7p+M=;
        b=o0DhamQgYrtO+onct0cICdqIp77smtVrqxm2g3Y5JEyD66B1AXChRwtpGvdj/c8gSP
         g1T3V7A6X5CnqH1Q5+GoKxZQzJokApT3lYPvk9tJyd/+zQUBHX4PnryYJ+qpndteZMpJ
         rHqGT3GXFoDKER6qf4XXPk9RC+Ygc4aVwgBxmN3nKgJWW6wqcSH2OaRXf9oNroXM12sR
         AcprZtVATCbwCKlDpuswEdk3gCY7KcWne+sgnbvWZzm5X5/6hfJG4/V/2K7WRiEQ16CS
         0VRJycFAQVBTOE2OMWg45OiKL3kxXrEmUwTxxS4j/J6XVkqSpbtlVj2T+TJ40NMBJTZ/
         CNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOQvSPIEb8ZvQfe7oKqk42A2EP3FOrKDVEB97hsG5iCdJzyu94jtSNe3+5cG4dO84eNr3rFJ6J2UxtFdOwIM/e@lists.infradead.org
X-Gm-Message-State: AOJu0YxJBsHeyBoRvJu990+s7olqIUeOGV8ykaghqTNpDEku4pBtUEKa
	95gouoLhnA+sBOzdJYXBOFadf+qNYINsEX0coWAaELhDCNNRyEFxfLiCQ3Thhw==
X-Gm-Gg: AZuq6aLaGaByK5w3fqPHDtK0mEeFfb+6ilyp7YRC+qQotrbwztUYgRZp4wVpMtacA84
	39KK229M8QbVmy3wRjUb7Mq5GocVELkYa7FEKI4iUIkhf8dkrzhKy9xxxOnRFmndYItinlSR52j
	U4kVuhr8pMnPQz63C0CeBbqzJfyKCfUG0jxmspauV3IN7vXmdrtLoRDl88vElGuku9PIGBNX0Hj
	if2NUKviLBFO3CZGaqtI5LmnaOqkH2/sxwJuJLoslVRl97CMAgvKxPDbTr5hXg0Mc8AdPEjkeO+
	Rdi9xm9D8Meyx8sbi3kqLwhkOJCdD+M7cf6RtxAOBfENLw0gQlcej72SR0HxT/6QIT4tNw7eb7b
	lvdR0P+aqRIunwbzk2vZWjqW7HfO8PDqV8zms+N5o+9t/Kr7vSxtl4k9Klm30bKQ+LMHb96GdQg
	pXLqQ84/lIkTZzGX5/HTKwGqmi
X-Received: by 2002:a05:6a00:1388:b0:81f:45ff:48b0 with SMTP id d2e1a72fcca58-81fe87db4d4mr4982900b3a.13.1769000907655;
        Wed, 21 Jan 2026 05:08:27 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-821812a12aesm379876b3a.43.2026.01.21.05.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:08:27 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 21 Jan 2026 21:08:19 +0800
Subject: [PATCH v2] firmware: arm_scpi: Fix device_node reference leak in
 scpi_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-arm_scpi_2-v2-1-702d7fa84acb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMLPcGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3cSi3Pji5ILMeCNdE5NUA4MkA+M0E1MzJaCGgqLUtMwKsGHRsbW
 1AKQF5cJcAAAA
X-Change-ID: 20260121-arm_scpi_2-44e00b03f456
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769000903; l=1791;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=WrpyBYrLRPsDYxS10ClCNybzyU3ZizE078W5ZmsR7jg=;
 b=Wuqb9gFAWeVQpz2me9m/Lf1notADMj2TBwywBe9OwE7Ku2k6ISfu734YtWAiG6v8tzEzBCnWd
 icQ+770y/XaB3ON8aHW9aomXLWuM1MOTxCfeV74szl+qFe/yw2Cu942
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_050830_578532_A2689670 
X-CRM114-Status: GOOD (  14.54  )
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

In scpi_probe(), if of_match_node() fails and the function returns
early, the shmem reference is not released.
Use __free(device_node) scope-based cleanup to automatically release
the reference when the variable goes out of scope.

Fixes: ed7ecb883901 ("firmware: arm_scpi: Add compatibility checks for shmem node")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fixed build failure reported by kernel test robot.
- Link to v1: https://lore.kernel.org/arm-scmi/tencent_845B889AF1A932F1347EE0C09F350E491009@qq.com/
---
 drivers/firmware/arm_scpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..398642cc25d9 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -18,6 +18,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -940,13 +941,13 @@ static int scpi_probe(struct platform_device *pdev)
 		int idx = scpi_drvinfo->num_chans;
 		struct scpi_chan *pchan = scpi_drvinfo->channels + idx;
 		struct mbox_client *cl = &pchan->cl;
-		struct device_node *shmem = of_parse_phandle(np, "shmem", idx);
+		struct device_node *shmem __free(device_node) =
+			of_parse_phandle(np, "shmem", idx);
 
 		if (!of_match_node(shmem_of_match, shmem))
 			return -ENXIO;
 
 		ret = of_address_to_resource(shmem, 0, &res);
-		of_node_put(shmem);
 		if (ret) {
 			dev_err(dev, "failed to get SCPI payload mem resource\n");
 			return ret;

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-arm_scpi_2-44e00b03f456

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


