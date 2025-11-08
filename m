Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87076CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oO3j4actqzf2xVKKJ0nWDgX3aF/G+cl1rlsWPWa+z8=; b=fDc/ZCNWkJPhHVBUoZEWlcag/a
	t1ZLoSazNO8NWIZt3ahfVx4oE5ixfXodOUe6SDCwnDhAi8dDc2YmGvj6/ZIfRI1IthJnaRWdkh63q
	e13pcnyJtvIx1kgQhlIcdqjyF4z8fhJ1wq2nTtc+hcL/q6be6jgYTKW6XQjqI1kwFQOfrtAmZNiv5
	Zr5bZCeET3mB/99BFtORTQEmBvg9KJtZWCKrkAr+7Qoa6IrgsT/D6HuFVITMMzGO9/lrNaYgs4m0D
	a4toI6qa1Brwi+nbwTLOBJ2Velgn/HLDtoOJCsvnMMDvPXVgbFF4uRokIQzJVYRe8BaWLad9GBJs6
	caJrNAfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7k-00000003Yik-36IL;
	Sat, 08 Nov 2025 23:13:36 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7h-00000003YcE-0f6v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so526507a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643611; x=1763248411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oO3j4actqzf2xVKKJ0nWDgX3aF/G+cl1rlsWPWa+z8=;
        b=S5NhQRl2wdWS/psHzwrJykZpgQDEFqUWvJ7IKGz2w1S+RoYXVBrccz+a4T3o3b1Q9M
         Zi2Qz+W9Z7RxmtX3eutMpuNsfA3+EJO0PlbVT+tNQg8I2afJ2pOYQVq9Rw3xE0PmxwmL
         Yft8rMZh3zk1ZftgrRdIG3dxgr7EIOLTM5VMnkjqOpJ5PlEdWlgbIA2wt+aoQ4O45bzT
         SZduLLvXOSd4+Apn5X3cFrjTKwoqKuH5VzQn+yogVPWyf3K1LEJLJT5qK7Q4P08mz9om
         oVEDdRGRaVpx3CKjhp/oZ1szkvbcUKb46l26T7YWL4L473mC4G0sfZmcKUcxB4SSQzu7
         CSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643611; x=1763248411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5oO3j4actqzf2xVKKJ0nWDgX3aF/G+cl1rlsWPWa+z8=;
        b=CUJDcxYCiOvkJxMRuJSIf5yITa7fIvZMN6CvO/5/QqwdY96u3YDz67uGnDEbOOSjsi
         ObdRn7g8vPU/nK1DlkYRVUgBb3pbTaM+h6Ls176eg13jkibpRDwfDwRSVroemMLGrsOn
         bBRTIsMDG3zZQmzl0xXrfQJNy/8pzyp6z3ZlQR13PP7tOmPgfHAFzcSs2aOkxT/s0RZB
         Lz+WakO6i7nnPIstu0stfNQhRALH/LYolqiu9JqlWHWavy6ECElDjbjYQesqVtwqAH4y
         AvFCE5LChK1suISh/RHTTn3/JnCJe4HGgeiZUV+cWRSumFdjJSMf34zfZMXQun63tQ43
         0J9w==
X-Gm-Message-State: AOJu0Yxg1U+5W7WnASL0aYqTY+HOmEDfusiqOvPVwBGdua1N/i0Zi+3T
	n05Q08tCCaOZSuRH/8JT7fdSqN5L7z0ybi5g6QGTaR/9fUpNgIFpqB6T
X-Gm-Gg: ASbGncs5XDYXiNDlOf8QZ9TbyTycckmXnS8Gvv1N/ez6h00hHP1W1sefCDuHPXU6mtr
	4zUJ/MepJXSVwLOJVUdGtFVSJAp67LDKFwKzBp67kYL2zEGazU/sOArm4m+1U3nB3G9QOaX5UbA
	OmIFOuLODUJarjJ8B4zVXwhg95muVs0Wpgi52gkU8TdEO9tRO5JtJ1jX2wXgpW/ztvABSXzxwYs
	r9tgOIhjc7J9SaX+wbophg90a20IkJFLwvRsBdNRL2aHpsEKZ9RWag2/WYyLUFGYcPunWFPpJ09
	HUkoKNg0QvVWwYjQ/BM0stwxdSDH+4dtPmzDJyNIlcDlr6rTURxIWFQwNkae/gyVGxOeHOSl9AO
	fa+eX5LM26XWDM+2AVtk6ScevemP6JME2qfdwJavnC5KJHITp4Cfz8qrn5Q2CDaFYLoNfrO/ktX
	e6h7UjfrWupKTM8dnFvR6pJqbz27BzOGoiqc9tvHA+D3uMg1/fyfqdocKKdjeQDSHF31ZgHssZ4
	10hhOjG4DnALTaPmU7z+8wyNOHXJL9LNz3X6DjiAJo=
X-Google-Smtp-Source: AGHT+IGKjmu35eL8DzEjWyR+sT9K1rO2NK/av8+BPsQU60PgD99LUOCuaaHsb7hf+eDzu3/wZf4PEA==
X-Received: by 2002:a05:6402:44c3:b0:63c:1170:656a with SMTP id 4fb4d7f45d1cf-6415e809ff8mr2471765a12.37.1762643611141;
        Sat, 08 Nov 2025 15:13:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:29 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 6/7] mmc: meson-mx-sdio: Fix indentation in meson_mx_mmc_irq_thread()
Date: Sun,  9 Nov 2025 00:12:52 +0100
Message-ID: <20251108231253.1641927-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151333_256347_D847AB5C 
X-CRM114-Status: GOOD (  11.74  )
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

Keep the second line with arguments for dma_unmap_sg() aligned.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 052bcf8f32df..e8b63dc45dd8 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -436,8 +436,7 @@ static irqreturn_t meson_mx_mmc_irq_thread(int irq, void *irq_data)
 
 	if (cmd->data) {
 		dma_unmap_sg(mmc_dev(host->mmc), cmd->data->sg,
-				cmd->data->sg_len,
-				mmc_get_dma_dir(cmd->data));
+			     cmd->data->sg_len, mmc_get_dma_dir(cmd->data));
 
 		cmd->data->bytes_xfered = cmd->data->blksz * cmd->data->blocks;
 	}
-- 
2.51.2


