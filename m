Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52A710F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LWhF3uaArkhQK+8SH0+E8r9jK9foFcw9lUUPANL8Bg=; b=xAW5F3RiBb6xNo/l7oH9eXp8sN
	9T5t5t8kfWlgxxP1ESLvOUbEQxyF4QenxRtn0Ed2rN+p/fvF2hxGnlbKZ/z60LQpJ3WJ3ZbzkLAed
	UgPmfXq98oQ0kV+a6zyThuZjc7V2SVdHiDWdOboDXp/a9OVNJVy6YpANqUJI0xjw6TuKfkZ5TMjHp
	fEXLzD0vEDrI6x1XXIDhgJ0IWzN+37/opDTpzPO1bPPR1VqHCwzkyEyVJez3AeU06qJj1merOL8P7
	UuUor11vnG0I/PYa2oy5RmDmkq/4iGl3bBl1fvXZ0peV1yAUjBJbUejBQHJ5NsgQdyfjeZ+mbFoVr
	MAlX1ucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6RlS-00000008slB-0IvC;
	Sat, 28 Mar 2026 11:23:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6RlP-00000008sko-3kI3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 11:23:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so27719855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 04:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774697014; x=1775301814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LWhF3uaArkhQK+8SH0+E8r9jK9foFcw9lUUPANL8Bg=;
        b=f6dqBihnyd1ZWyHcPySVF5KX0di5ywDKXXbujDX7V+sVzTxVhOr2Tpvl3K2OdXFxL4
         756cKr3/C4p7AOSjgz+Ji/2MlN4Ndh056pII683Qi723hqxRRlYRM6QRJib6CdMSyZNv
         ZqLBS+eQml60SGd3sX9rN8Wz9eXWvpYHRVbGC0qor0Bsvpcgo30QUS755WB1PHpUIhDg
         RJlvWknyFvqD0UPk+XWQVAt9QQujntkL28P127l10MhcorJYKXRfRpUGnjjk6hdwgLAE
         LBD3l6VnoNMXvQrFQWzUtvM5V1/bHA+84BqrNQJ+/GSNkapbmTtoGoOjlNF/rPDDKl6S
         tuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774697014; x=1775301814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LWhF3uaArkhQK+8SH0+E8r9jK9foFcw9lUUPANL8Bg=;
        b=DHmWjYlHU+J1Bb3Ah7fI9iqeZcpOBohaIiFVqfSkNPwXH2nK6No9Ap7E4DSuD/o3vD
         RecTb0eLElS4zwvWFEyk9uL8zzuaFeJdaI2RJlsgPZIlrZpO9w6qSmPadsLSm8Sxn+hh
         darZ+/dnOhJv+rt4MyzmGzrOybBgVAw23Q4R8I5VDW27eDsqs9kRQPe9BIVFc0fE4eio
         4NrN7vsR/80NvcOTz11EQeAn8EnS/FkNSSxqYdKt2Dy4XXLLgLPNKJolghiz1KdYcnHp
         X+hnm1/qCNsKgpWduABUFhFhyj4XpFyrgrLlfrOIJe/nUxnI5AWrZaGFaV6tttRMboHn
         bZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYP/M+lVhMxJ/kmYbgFBJ9SpFw0LYrWO93xdWIoRoeTbO03buI81Neyyn+XIXBrFPG+aYF5bxI1oVVsNC0qFMP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7+TwcrUnMZJgzRIstgT8bft/ifEfehfUPC5xf88WeL/NaoTbq
	I5I0bVMsSjlnXtzcgry6Sq3jzhtlJG5p8tYzRPjKg7iL6u7/+JaXJ7We
X-Gm-Gg: ATEYQzzWMkod4U8a7c63SNDWW7v6hHTcF8bX/61fe9fuMCoYX1OHT1Auaa5I9f92XA0
	uC1yqrhddV3+qeQm0YvNYXPB0DgSTGOE/w0/6CPIYiG9QMDX1UwN9MFHhTUO82Q2FA1sfvFxKKP
	+NWRPKkcrLirB/Ku1ve/3ouTA8pa6rvVm6cXz0CAIBZu5kr6R9FN+zIjwU8QJQTvW2ogsbFsWJN
	m6c5d870VtRFqb0csXhnCH5/TzB16Er+DSLmoR34r6glflriuPk6XRCJ/U4TxDOyPBV7HXmaITZ
	VehyJQHCy+I0y6WYIOfU7otQ7RhnwO6rmf4Gm/qtoLMFA+Ls3maZTFSud8U1cZuMxVW+Y7DWHDz
	a5KVapFYqz+ClAlhdvajDgm1T3257Wc/lje68fD2VF04wVfDcy8WJwLTFQpnu2/RBpj0kthJl9T
	Qmk+xyscPSRJ+OVBo7mCL85U7DYzj4imTwxdBemJGJd+rJq+Ae0IFK8yLnD3EOt5U0PGoJeDWLK
	QdCoZ5X3l3PNeXE6tUOGz4=
X-Received: by 2002:a05:600c:6986:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48729109c35mr80167305e9.11.1774697013685;
        Sat, 28 Mar 2026 04:23:33 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487305da785sm41491685e9.0.2026.03.28.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:23:33 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: aspeed: fix missing of_reserved_mem_device_release() on probe failure
Date: Sat, 28 Mar 2026 11:23:30 +0000
Message-ID: <20260328112330.50726-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327220827.266556-1-devnexen@gmail.com>
References: <20260327220827.266556-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_042335_949015_BA25DDE7 
X-CRM114-Status: GOOD (  12.21  )
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

aspeed_video_init() calls of_reserved_mem_device_init() to associate
reserved memory regions with the device. When aspeed_video_setup_video()
subsequently fails in aspeed_video_probe(), the error path frees the
JPEG buffer and unprepares the clocks but does not release the reserved
memory association, leaking the rmem_assigned_device entry on the global
list.

The normal remove path already calls of_reserved_mem_device_release()
correctly; only the probe error path was missing it.

Add the missing of_reserved_mem_device_release() call to the
aspeed_video_setup_video() failure cleanup.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 41cb96f60110..a292275f6b7b 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2343,6 +2343,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
+		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
-- 
2.53.0


