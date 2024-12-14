Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B918E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZWJTd+mkpnIyhgqJugaw5uScKdqJqGvg38Q5km3k6a4=; b=NO1evRdqwi1xrMMte/+xaIJMKv
	HSSkGyHxYOP0yblrYQH/akacrBbt+ofB0xSUtMMe0Ppdau+vsKW2ds/YBVbAHoC+9dyw+q/uScc9a
	5VLj+PZd7xQ0TUpI9Qo6sEPcVLhGDxwSVAIhuCJITAmWfRgfa++fm80NXtjeS7Q5ylohKTE3Ovwyo
	4nJ6ixHjWrvV+IZCEdoSq/hMmE/B1hwOb75ktN+y4rpfXpWMVLv/FilQYYI93ajQZxZRTTe2htKa7
	8YbRh2O0cjVbGDubWzJjXnCOJe4AifHwVExCuQTsLzwOOivt9uwhsP0Co9wAxwXtr9p/fbpAeY6Gr
	BCXEisQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMOEd-000000065wD-2LDo;
	Sat, 14 Dec 2024 09:14:51 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMODZ-000000065qS-0j8z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 09:13:46 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so3471627a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734167622; x=1734772422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWJTd+mkpnIyhgqJugaw5uScKdqJqGvg38Q5km3k6a4=;
        b=b7/O+Dk7ZcuKVg5W/7VuUtTv2WulRPFLYwmxj/Eyn/R3u3mgahNoJJdOsBVxw5Wr6C
         bhJPMrGFsP+DTKItQDc8N48P6jdVJ2wq/MRqSCaVtRL49AufDJqv73l1tzPskgrzeifK
         P2ykdek+YULMFE8RrXFv87I3Gxi7V5JjcZMqY6cWNxCKJ0BAbeaVm9wxYG8RFEEeSzRE
         VvuHjJnSV8+9o2jpHpmUVqYYtwmhx0KvLMSg44FYaJXmW3fwWYtvSZWoTnZ0bvAOuPMj
         YwlEOa9IFgRPoW19j2au+oUGEVSnE1aExTJFN7kKxxZws+FUcVxaPFM/hKNKaH+JDbbD
         UsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734167622; x=1734772422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWJTd+mkpnIyhgqJugaw5uScKdqJqGvg38Q5km3k6a4=;
        b=FgVTvQre+7srhq/VTx2C39TaL9cJ75/XDINNMlI3FC8tS4/xTqkcUJ70XnIFszJkMl
         hh1nm8v+7ghZxHaGXA6IAVYwhXhbVPXb9ru5hcW5yBCm8aN4uG0D0yGKZFARGuc01CdQ
         HphLFSmCnPLWjrkTNnNrekHrmH10aN7vR26inSAkmbE+A2fV0KOfW+cYeHC6f9fNLMas
         V5NKooo9tSFTQNfSXCaJ2iljZeDh3uJajGm5RJic324bku7cY0hYULqwEgJoE2/VhHtH
         yM3Z74eC107FJrmIsvXNeNDUpva2eQNpkpsXoJcvPr7E1iuCx/eMqkFwVkSUMiNshDGX
         BoGg==
X-Gm-Message-State: AOJu0YwttIgoVR1Lak4sQiZb89Edg6/4pCKxQiJcfcfBd0GDX/wmqhEi
	NyMnC1iKozqJyN/e9bbBnjW+YKJLS27s6Uuzy/+1oc54R5DmFlKQGM9JOVeW
X-Gm-Gg: ASbGncvkmpmuWuXPx/BZtV2vln4j9Z6prrUAsRmeEv3YIdieKNaX0HGVay3LTnr9WsC
	XQDffebAI1O0c8YW1rmwWIyQPa6xjDnX2LFMH/537ateTtt60kpN9byt1PtBgzFn2/Dy3GfszxG
	UYBha0QL2dgfrbeGofxBd0Lcpet4t8fcWnPiZwQ/RsckKBpBSQJIfryU0Aozz/dJRAyKdmXYDK/
	iSw8OCwm1EnKcu4ZFBZ5y5rKM6Ne9OIy0EfQbw9MVmo1iTbBCDLPfjfJVQEEYamWA==
X-Google-Smtp-Source: AGHT+IEsz44F13hbhBzowUfdoYK8xC8d6azdNR1NJs8oIeuPs5Sh+Lp9FpaYKm3Vu8QhX2PH6u/BGg==
X-Received: by 2002:a05:6402:2690:b0:5d0:cfad:f6b with SMTP id 4fb4d7f45d1cf-5d63c30684bmr4653744a12.11.1734167621703;
        Sat, 14 Dec 2024 01:13:41 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae137bsm765770a12.51.2024.12.14.01.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 01:13:39 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	stable@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v2] mailbox: zynqmp: Remove invalid __percpu annotation in zynqmp_ipi_probe()
Date: Sat, 14 Dec 2024 10:12:59 +0100
Message-ID: <20241214091327.4716-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_011345_213130_0011B0E3 
X-CRM114-Status: GOOD (  15.66  )
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

struct zynqmp_ipi_pdata __percpu *pdata is not a per-cpu variable,
so it should not be annotated with __percpu annotation.

Remove invalid __percpu annotation to fix several

zynqmp-ipi-mailbox.c:920:15: warning: incorrect type in assignment (different address spaces)
zynqmp-ipi-mailbox.c:920:15:    expected struct zynqmp_ipi_pdata [noderef] __percpu *pdata
zynqmp-ipi-mailbox.c:920:15:    got void *
zynqmp-ipi-mailbox.c:927:56: warning: incorrect type in argument 3 (different address spaces)
zynqmp-ipi-mailbox.c:927:56:    expected unsigned int [usertype] *out_value
zynqmp-ipi-mailbox.c:927:56:    got unsigned int [noderef] __percpu *
...

and several

drivers/mailbox/zynqmp-ipi-mailbox.c:924:9: warning: dereference of noderef expression
...

sparse warnings.

There were no changes in the resulting object file.

Cc: stable@vger.kernel.org
Fixes: 6ffb1635341b ("mailbox: zynqmp: handle SGI for shared IPI")
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Tanmay Shah <tanmay.shah@amd.com>
---
v2: - Fix typo in commit message
    - Add Fixes and Cc: stable.
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index aa5249da59b2..0c143beaafda 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -905,7 +905,7 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *nc, *np = pdev->dev.of_node;
-	struct zynqmp_ipi_pdata __percpu *pdata;
+	struct zynqmp_ipi_pdata *pdata;
 	struct of_phandle_args out_irq;
 	struct zynqmp_ipi_mbox *mbox;
 	int num_mboxes, ret = -EINVAL;
-- 
2.42.0


