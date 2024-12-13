Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A21E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTU9/5MK0HAWBhEVM0w6Se/hTXoo9yj/PJnWYE15UAo=; b=AIh3EYp/6PpPrcQn6vGBT9IJgx
	/r4sn4MlDF3AkpgH5wMthLX7HIYpMyh68ftZyP9RFmBOauqVaIKxGwYRF/uZZOQamMdPhtbleBcML
	xBCSrGdNKV068adkkUXLl5+qKc+Kz6jlofniL3MhunoErr0C6pe+f3NU8qydkuikIgUS5+IbAxLuJ
	mYb6z5Xih3dJwlJH+sHmSwj0YhJfCeF7R89ajQKpYvvFPokotoa5NrmkatiU7kXj11NUy0SKT3At3
	BIlDGcxpyIoxs90CKa/1l+9SbRqiWs4UNOhAmuuPQswxHhmJiPnRE+QXGhZdKHnaYhp+Pfzoqx+Rx
	15fbuJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Go-00000004DZU-498I;
	Fri, 13 Dec 2024 15:07:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM77Z-00000004BQe-2k4O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:58:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso3812142a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734101903; x=1734706703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTU9/5MK0HAWBhEVM0w6Se/hTXoo9yj/PJnWYE15UAo=;
        b=nROQKFgYtWNElc7rfZp9OwSPOtWTVdfBSyQ8zO73j9hgkgzaBwoOkm2k/uYPfzpTfP
         C/1f+jxlZpD1VgUHnKCbrc0VYKP4cnGw4vOnXgvcOSut9S3VjrbeWuP3V+8e5+wxhDue
         PvSq1aXLXwDkxFRh14SHhEnfy6Q8kEhBMjkg9KZuMjaXj8ZydwFb7QFuEaBQ4HjthRhg
         MxdptR8PWOt+ZVZQH9KdZGS5Oy3sYDZtMLnqcXsmezFtnpwUyH1C7YCx1pdNgFKu699m
         qa75hd3wCVK9TQcv12w8B2PpbOen6/iEQyeISPtYjTC3uFLMnTDMceH4pRUZinuV9Lgu
         Dptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101903; x=1734706703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTU9/5MK0HAWBhEVM0w6Se/hTXoo9yj/PJnWYE15UAo=;
        b=TnmL9T6b5DPc75OViprBe5qso28hDnylTO++79/so0qnx7LP/fvP6+nU/SFudChWBr
         b6hxMxWldt8j7KyFfMyT2Mwzsq3IiclVsh4n8HLzB6cAf6tZe9AeF1/Dygs54wP/6XRQ
         jBtSlJhnoYF+CqzHvd8AAfMhM7sxf36kq29MpwsaHMBp9NDCi+/RjVpkAxj1zFB+U6qd
         JWYIb6mMEsMfbCgo19t9ArgAU8avBzaZECul1x3hjyFL8GuLLQrE1upNKe9LgPvMm/h8
         HI93m/rwY+EaeTPF2/AUhnWaCJVLswnO9e/26z9d1TMYp4vnn7OXHJyIoNzZNqOpl4op
         so7g==
X-Gm-Message-State: AOJu0Yz/78aMRd+d1Du3gxi6mqqk086Aya4lPqxOXnxVziZ5vYmuHzp2
	1bEkzNxs8n1vEeROmru1Dgtnkd1P1PI+aufDaVBQ0PCviYtG5KhfiGvrcA2N
X-Gm-Gg: ASbGncv318MDsq8d2gvIJ/3n0FM1yPQ4QwpC/A2C9WwPr7tcc9/i1KXO26MDTFRxPGU
	GLejl2XD1yLZzDNqUtwDHKLCh8A4i0XzWARA2POPDN/cmWl2bkkHOw+uxdkRhdXc/Dz0lIdiPaI
	4xzKH/owKcf15/USaU6eYJ29grM6uzDSUq2RbtoqJueKkAFXS6Nj0LSI1a4+wMQRhiUMVdqgY9O
	5G2FSLNYtrgLShlZq4Kv2KhKg8aYoqQUwbLqab9w3sLx0wksLwGIV6Y5ayNvDElBw==
X-Google-Smtp-Source: AGHT+IHAHdTmbS5FyHmI5caY2pFFoYj7IVic+V5ZxnRs/MLkIBNo1DY2zUzOg9k/TR+vdwTA1hoLjA==
X-Received: by 2002:a05:6402:3808:b0:5d2:7270:611f with SMTP id 4fb4d7f45d1cf-5d63c3ecb3amr2620066a12.22.1734101903219;
        Fri, 13 Dec 2024 06:58:23 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cedbb8fesm10048424a12.22.2024.12.13.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:58:22 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH 3/3] mailbox: zynqmp: Remove invalid __percpu annotation in zynqmp_ipi_probe()
Date: Fri, 13 Dec 2024 15:57:54 +0100
Message-ID: <20241213145809.2918-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241213145809.2918-1-ubizjak@gmail.com>
References: <20241213145809.2918-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_065825_695225_D41D5338 
X-CRM114-Status: GOOD (  15.06  )
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
so it shoul not be annotated with __percpu annotation.

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

There were no changes in the resulting object files.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>
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


