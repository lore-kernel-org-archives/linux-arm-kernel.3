Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB03C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 22:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cyDuDliEUJAtG1xZJlTNQXvCHyisGFvDjeXiDoJw63M=; b=MOsd3a7+M38tkjAEyH/94XlqsQ
	Ze4Qp+xRHjAVvUP+GIBnCqXN/1dsITD2Uxk0e6PqC//ugNq+YiZHoTjQY5H1MDHVHh9mApc9NwPaq
	lL4t4UJVrmAS/L7Iw73puxoHvTAF98WstT/P6zZ7XZW3nt+exrVA6wFO6s23XcjpVGv4HF1FPMaJO
	WVR1dtGNHFUF1C1+cUovGm83ghsr4J8YTwoRITqFibw+ZT7i4M2ejoBX0dsfbZekZ19FgQxbTgE4/
	vnQedvNG4yeYHeq43A9lFV+UoCD6rg9jBS06HbbKA2bDp+ricLIRymiCzWdcjqgAV/cDPJmpTRWPP
	qPZaHsJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzM2d-000000034fB-02tq;
	Wed, 26 Aug 2026 22:24:19 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzM2a-000000034ef-22WT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 22:24:17 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93900ed2925so5871485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787783054; x=1788387854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyDuDliEUJAtG1xZJlTNQXvCHyisGFvDjeXiDoJw63M=;
        b=NT6P46bmgxwCGFneAGyTneKQvELkpRKenf85XoHbVQkGINJCnxMmEV3oxXAayeAVEm
         Mn5aAzIj0KJA3w/2C5R5XkMwveJpN6151sp2uzSsec3HQrOsQw5GO40LxoH6m8LMxp3p
         OOObIh9B1X5QGYDKHEj5guITNPrzpF9eP6xpbPUYgjzHgY6lfiOsQKsEADHpjWxP9wjS
         3L24hO2PeAaiZzgfYDNSnsiwnxsiWF6+QZ0zGrRe/Qn+VhjQ+DeFGNc2W21M11UAfL6z
         zomvcSPJzyS3KjXkIhFu4FSjbzV3/Y/yW3UgrQFTNU2HQAm2zXgygy0z+qW/vlrg4RAy
         eirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787783054; x=1788387854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyDuDliEUJAtG1xZJlTNQXvCHyisGFvDjeXiDoJw63M=;
        b=fHzAJrg1lW1eDKa2NRcxyeZpmahsb16NSWqAkBlU3WdwIDwPBTNrYP26A58BdF0ldj
         Qv3Oh3lELZJ94WgnES7gnpDEw5v01lxngx9xuyqqlRt93QgN4mUu5awmXoPIx+X5+cCh
         uSliB+Fn3lKGs8kP22qqqTXIqhfCrBoUanPzWRAFeEgPuBXQpFDUKnsohD0C7nPB8bcc
         LC3BvT9ElS6/uSzTUYnauqcb6KDihkrGIueww5JJQriC+aZfl69UBXg6Itdp9Q+zdD2x
         VrQF6TFMOEorg8w773Ma7cquP85CxAEvyF4EpWy+ZrVAwA0atvKFxSNHzINYB1pFYstI
         atyQ==
X-Gm-Message-State: AFuF++kv8a0IOY30lk5eLO7P4XH6HYCejtDWkKFjIDPmrgJK8u/wrYCw
	fKYTsMZPzHlffT4kubC1KpuD/CKn3Q+bviVI90UumRUqzvzNCyVgY8ul
X-Gm-Gg: AR+sD13jofDa10S6kkPlM3LfmfHXhN/NFlGBh+X4KaICDzrWJcj7W1NQvwLRqRWMDuV
	B8dfk2qYmLmyLY97rB5xTy/2cyyp6ryi08XU//+bTv5HQBy9f4bKfDJy5Hhw5tqSa6SbLgEBXi+
	HRb2V2swSlZM7PY05oXEVNRabqOnLqqpSYKj2vK0QDIL+r9uZsoqu18LNjXFlYeLiF/n+NefQaR
	aW7gKlBs8lDrACmBkxLnp/j5zs5ySAQyv33IslgYVlnPXEEktTk4BsD7T1tL8JaneJmLvMGWC/c
	ARumRiyuxxUceMTBvQwA8+9m2NyqWfrcXQRQhSQ9QOiZjBZsgx+sKzy94Yj0dKLDcv9TmqgUyWP
	MPT+n7C2yoI0f6VToRrgqJmvPqiZtfY9nSEy6vOhoSxilDoog0+4UgThErBMAgUe5Aao0uqpXZ+
	1eoh/+rB6CIGBjedAF+J20suJGOpbJ+g9hYKp4osSFL/SPvOGgtvyPljVmWIs86GMZeG+lEcYT6
	NyN5feMwUyC4Wt23IjfDGQBIcruuNkB2Fv0R1LSibF7lw+8Jl+j
X-Received: by 2002:a05:620a:1265:b0:938:8ddb:5e9b with SMTP id af79cd13be357-9388ddb60famr568460985a.8.1787783054367;
        Wed, 26 Aug 2026 15:24:14 -0700 (PDT)
Received: from CW-D0XG2Q16P7-L.mynetworksettings.com ([2600:4041:5d54:8900:dd0a:e212:7941:39d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e379d8csm310292185a.20.2026.08.26.15.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:24:13 -0700 (PDT)
From: Maxi Saparov <maxi.saparov@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Seth Forshee <sforshee@nvidia.com>,
	Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: [PATCH] firmware: arm_ffa: Unmap RxTx buffers on device shutdown
Date: Wed, 26 Aug 2026 18:23:37 -0400
Message-ID: <20260826222337.73480-1-maxi.saparov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_152416_560109_98C114D8 
X-CRM114-Status: GOOD (  14.69  )
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

From: Maxi Saparov <masaparov@coreweave.com>

The SPMC retains the RxTx buffer registration of the current kernel
across kexec. FFA_RXTX_MAP from the kexec'ed kernel is then denied
because the buffers of the previous kernel are still registered, and
the driver fails to probe:

  ARM FF-A: Driver version 1.2
  ARM FF-A: Firmware version 1.1 found
  ARM FF-A: failed to register FFA RxTx buffers

The notification bitmap, when one was created, is retained in the
same way and a later FFA_NOTIFICATION_BITMAP_CREATE is denied.

Add a shutdown callback that releases the notification resources and
unmaps the RxTx buffers. device_shutdown() runs on the kexec path, so
the next kernel finds the SPMC in a clean state and can register its
own buffers. On a regular reboot or power off the extra teardown is
harmless.

Observed on NVIDIA GB200 systems when kexec'ing between kernels with
the FF-A driver active.

Signed-off-by: Maxi Saparov <masaparov@coreweave.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8654b3365c9b..04948be13b08 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2222,9 +2222,16 @@ static void ffa_remove(struct platform_device *pdev)
 	drv_info = NULL;
 }
 
+static void ffa_shutdown(struct platform_device *pdev)
+{
+	ffa_notifications_cleanup();
+	ffa_rxtx_unmap();
+}
+
 static struct platform_driver ffa_driver = {
 	.probe = ffa_probe,
 	.remove = ffa_remove,
+	.shutdown = ffa_shutdown,
 	.driver = {
 		.name = FFA_PLATFORM_NAME,
 	},

base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
-- 
2.55.0


