Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A509CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=; b=SdUvQ9uQI9Z+s5RAevpl2PL1dt
	1sUN6cI7uFc3UfzP6ow6fIDDMnq6v2bkmtRdZCdlp+VPFj7oNzmCObitFaCwGMEZSNAo2IR8RJgzz
	6Nhpw0AF9Y0TygWefk5Zh56zMrBMtvHnMN7sjOOp2KkbxKEn885Izxb+SIpaViaw4B67SSkADa/nc
	geO3+a3gthoRxefoReB8LacVgPFRtjh54RpU08mmOWPrkFIpnTbpw2lkbc7QZ1SO2AZZvw7cihYGx
	ZkfW69jVEQ71JLVK849WNR5t7JAT7MlrshFLQRWSioDJTCsW6RpDYc41iKVPbRUuYmXoHu3ONyScT
	4m9OHE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbZE-00000000nIw-28uW;
	Wed, 06 May 2026 12:41:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbZD-00000000nII-1yLQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 12:41:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-835399c11e0so1672627b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071290; x=1778676090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=IGkRlIxgJcXjDKF9PIj39WLjqZOhnEDrOODpF8EttkKO+VDKJWVnFlIWTM+VNPLSsO
         BwlW5rxgmx6tnbL9pmJOUS0NH8XeSvqcBasHfnWUeQpIim0c0LNVdkokeMxc9tt/WyOX
         jfQSkyo6eRIX0C6bSp1SjS+yJaH37EnKQDcH0tbRbAN8Pk5nJdXIfxY+NptVo8SE2XyR
         h+9wlo6wkIurHcqadiZj11T6lFxaw706dHIqF50kwKNRi2Z7MH9ONGu89OWdH2mQ3uWd
         RBruAUAPolcXZ3ph88olDBI6+XPYJWkMjj3jgw6x2EfT8CDjOXjlOJ5yvhbs0bGo8Zzr
         dsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071290; x=1778676090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=hvOhTxbIAPofoQCCX3xdSZSl4eYC1MfMlBZxMu64A0MA6iG/3NkoFIw0HSZ+Si4nSO
         35UshgSE4wdnK4sXgWHLUbnsCMPoFQ/HxvfPYCN/cpGTwbA2ML5cyCFSXFpvq/kEnA3j
         5+q9WkxJdEH5LxzV1jI0lkqdkHDDtznP8nti2UiNA8pG/xGXmbuLF2CWypcd8xeeDVGS
         3CgJnVmiQ0ba0qOVwDIf22MJyzY2KVFXKCPfaq2gqHzZEfg1IFRPrZdHgnb2nGEewBnF
         6HpaMA7R+ISL6WPwA+6sQWB0M8jqkxdeh+Ingt8uJTdR/rCor+TPUY/uCyOSzSv30pc1
         8NtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jUueXVnbpdbmO+nyf75OJd1pclZEHUril+qN406G2cD1JZXB5XaOApf1eq5TFtxR8FszoXD9jMcU6oOg5P9MG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywul16iNSdhRfKRw2Blh1hwqufan3E0nZlO9A9W+F/2XG+G2PLk
	9X5d+R/nRT89+ifP5WHrPfz3BJizIa9hIoTJScpeEbz52iMXumlF0tA=
X-Gm-Gg: AeBDiet7oYMsporf4IWGaFUUjRPoPvHa4xuSIc9ZqlQkF+/Fk4JE+fLKrJoLr1OImkI
	b2cbKHQ9IDK6CsHkyh85L3Vhdw3Il/lhubuBaScs49M9X+UpXDjAzE6F+4QsilbGtLaW0oOA0aP
	B9N5N9EjmOPQk8Se5oD6v1R3JBHTRaDFTGkmVRLoa4+ND5vGgxagqsqaaPpOELwakP6CUyK8kwd
	Fk93r0JLiiV86s6Jh53x4/NL0nAa5yi8CQJ3k69JDHvhMv5LjrX6mdshgfg3R191caR5ug42m9i
	66FF4C7qhFdrPWezvY9IapdEv/NoeSN+nnVmg7W2YWOsuzjj5PmCmipXROqZBv3xNjClFUlHbDO
	/7VVP9xcqoVOl8XbtRCTOyXJL2FvErc+BQq1o/EADDKOxZN6m+MmmR+2YIxxAmKK5DjQz0dal0W
	vZ+CByDlmxOBg72FVP2y/rMot24yLcf39rlIX6sphSlEOlKCJffRwDJwBxPyflZWMaHGO4IrwCZ
	X1E+a4VLw==
X-Received: by 2002:a05:6a00:4193:b0:781:2291:1045 with SMTP id d2e1a72fcca58-83a5b2d34damr3232862b3a.8.1778071290350;
        Wed, 06 May 2026 05:41:30 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm5494056b3a.35.2026.05.06.05.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 May 2026 05:41:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] media: cedrus: clean up media device on probe failure
Date: Wed,  6 May 2026 21:41:16 +0900
Message-ID: <20260506124124.27802-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_054131_511467_97797521 
X-CRM114-Status: GOOD (  14.20  )
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

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Rename the media cleanup label to err_media.
- Add Paul's Reviewed-by tag.

Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..7cb1f110d6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,7 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
-- 
2.47.1

