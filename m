Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E9AC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=; b=kjJWO+LBfTAKESzRYFuctOiFhe
	NawFi1e5/4LnkLQk8IPY34HS+JhfE4FGopC0N/uHkIp7Nq113IPxIDwaY1pdkJzjtQmCuHzwQduq+
	r/NGG+54LXA1YjWZw2JVEsy0Nazmxm+o9hRfvh/5tl3dauyMua/6NYK/iIGfp7BUhio//t14cd/UM
	Rj6nf7oqOuPJjEbwgkUb8nvicxE2K48+1Btw1Jr4qlzwb1pyKOQmIu4foLM2EIPl4k3wXwpMeAo9U
	CA2EfCOJPeN06eOn3E++zs5Tbk2ES1TvDw9xB9GawOJ2QDhqQJ2GcbckZT169qqJqUGqgesMW4Y+f
	9s1yVNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzovs-000000058sv-0JC2;
	Fri, 28 Aug 2026 05:15:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzovo-000000058sU-1z4L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:15:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d6e954afbdso4523095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787894111; x=1788498911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=;
        b=bDCKh7aaVSHWMSr/PToxED87SymlU38hcTF7LnB0sHOmGfZdXy+IIhtO3OrHqGvYPI
         AC0ZGDgWupZYjF0yxTZ3se41P5COwOOUfyhQIRL3koiyUIpd1KatiiGTbboh5v+ucWSx
         IhdrF82b3MbNMgfzt95SPO0wX4EG6my67J00YjovMnKAX0SQxNVd5+beoyXtCAK14ya+
         9OrT3TRwzafquRs3IYxcL8i/FyITAMRvwfLy+VmBJxCCo2o8LuWbQ/QFhrGV0gXja5VZ
         YDw3ydnMTZbCv3hbxB/qYIdQoxzsr7c0wdIvYd7lJjZ5ww00PX2+QZty604AXd+Kpond
         KYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894111; x=1788498911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+L5wETtDoWmts2CARQJ7hOgr0xkLRcjESgYRsPtYLoQ=;
        b=RG04pDb44oMQsY8FrTHJh4l4TjiKf8oSPyp79uxz0P750En1T6hICuT2YkkO0SpDAc
         edKT38hPVQQV25puYugFsI6ZnqdhzlKZung847ULAjJpF//3PhbxxGCWyICUeRxpDBGr
         sFfnxEXiGWmWDPyrorOGmgVc/+BsbpzVTgMqt3u2lkqhA6BfSRwb1s6M9QL7+z8+edfQ
         jc9isq2nKYvANHIE9FVB3ce851p4/GIjUq+eBjmYHwDhM2w9LanWuEkFICJp3R1igQE2
         eVzrzvSFyjECbjAPzEcolf8BUmEPmCo6VrdxGmfQO3DgItjvN3ECQwVz0xK53HIZyGM8
         Aq8g==
X-Forwarded-Encrypted: i=1; AHgh+RrMXyc1KkalCf0pFo04V2XxoK7xP5blRNor6RYTKGaNXY3SCshcKqViHCfxMvjDBm1r1lXTf3XnGISMYu5joTwB@lists.infradead.org
X-Gm-Message-State: AFuF++n3RJKmt2jJODWljpksjsP0eFd3wTFD2G5DJYiEV8vimUWDZiPy
	cIS+DcX5wu5Hz5YrfyhpG+in8C7Iy2uT38pWAak3wiRBMd2mbIS2lKZf
X-Gm-Gg: AR+sD13m/4UDVJt/NdKyFvDmqziJF/guQz3LKD+HJzwN01Cg29gXZ0EX4Cezd9dbveY
	jTjfNqSMhl78GkHNtyDDLknLhUhkO0AMQXOQBenHuChWuWlw3yENvgpqm/G9BF2v+JcMS5k7VPE
	ew/dc48odOsa67k8xUmFP2GNwWd4VjXncjdvHsTqS5keHEjUBUkpGOKJgXTOk+t9bcogA4gO74P
	FCoMCzPcmUVDYf8L1LOL9ZC8hzXCCybA6A0TOHffth/Dxz1H0wU1g21gRVZWl2GdH3NoxVTPWsT
	oftaoWehSorhzG0wn7Mn8u1YXxkljrflN34z2zn26kLIOcAvmuvC0ti8siNmAIT68us2OF9xxS/
	nmWLdQHV6ZkK/ZkCGoxwMGBiFcIU2xIwuB/csFdznOtgmMzZ62oekBiqNTf7vORsVfgbiX0EAaS
	UHkPh07laNG6xUL4AaUkAoU/LTZ7bgfY5VXBtjyWz/XiFueizpUdZ8QU5YAoOEyzHbTjeoHH387
	vO9n5oOaLMNsxZ69q8W4pqbHzxrVPgriEQREEzmUuk=
X-Received: by 2002:a17:902:cf0d:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d74def3ffcmr81309995ad.7.1787894111223;
        Thu, 27 Aug 2026 22:15:11 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75952ea6fsm2011745ad.21.2026.08.27.22.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:15:10 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: imx-jpeg: Cancel timeout work on release
Date: Fri, 28 Aug 2026 14:14:52 +0900
Message-ID: <20260828051452.1940559-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_221512_515191_4F606594 
X-CRM114-Status: GOOD (  10.57  )
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

mxc_jpeg_device_run_timeout() signals job completion through
v4l2_m2m_job_finish(). This clears TRANS_RUNNING and allows a concurrent
v4l2_m2m_ctx_release() to continue. The timeout handler then accesses
ctx->mxc_jpeg once more while releasing hw_lock, but the release path may
already have freed ctx, resulting in a use-after-free.

Synchronously cancel the timeout work after v4l2_m2m_ctx_release() and
before freeing ctx. The cancellation must remain after the mem2mem release
because the timeout is the only completion path for a hung hardware job.

Fixes: cfed9632ca8e ("media: imx-jpeg: Add a timeout mechanism for each frame")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 725e94152884..dfe3b1ea6bb4 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2805,6 +2805,7 @@ static int mxc_jpeg_release(struct file *file)
 			ctx->slot);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	cancel_delayed_work_sync(&ctx->task_timer);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	kfree(ctx);
-- 
2.53.0


