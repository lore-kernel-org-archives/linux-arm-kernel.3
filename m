Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78FBC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=; b=sZwO+Q1+oucrg0CjLaec3dU3Iw
	0donbPv9YeMhu1IPqCDF265VK7rB2/o78RgkJS35nBP+eP6kM2jKOyP1ZeJ0OVmq52hZrH6M8+M3Y
	p5bnQRL4j+NNpMB4HSxtP8weNlDSMhcMuPQjlhyYVIaVjTBwLvM4e3+ZmRjllAXSQdVph9vdm44ZV
	m6mZ015DRqpFqA30EptXPRO3mPYcuMIcFFYURERYmEA9Xx3KfxSUR0iORjLNS3NimuWw4KC1Tr7/7
	LEsrHeQPh3GQusrqWWD9vabIvNB56u23MkR5wWjl5AHc1hQBhYceDY+ULn2F19rfQGYUk0YMZrqq3
	/hsbBx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJSD-0000000B5Q9-2eLx;
	Mon, 10 Aug 2026 06:25:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJSB-0000000B5Ow-1xdN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:25:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cca0c5799eso13999135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343142; x=1786947942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=;
        b=YVHgiOBjq0+opcYHjgGPYXU6/ZSKxK+78CVBSew1eyJBTMbgkLuYVoDpJaAtm/0cK7
         nO027OipxDH0vRSDAQXLDC4/b2af27/5PfSpVLp7tZVRWng9ZWU4hjUYeQOuhqmlpcGj
         gy1qQVJg40EGHuo/CJpvuoOeC3sleuUjEpCCbf3/y5myk8mnZD1mRO6EN/EYPEKWzCkg
         OmCMJ/Lamcu4hy6Cyuuy/4Pobl0RNTfEJToloD/VSuzTnykHIECz3jDkXd8v2jBQl/6v
         RN5PljG3JAzilD/lr6SZC0Oe89JNnNCjSdjtqdBshiR5KKCukMvZUSXh4hs/bwl25t4l
         Cezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343142; x=1786947942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6svQF5GPAZfouFfjRsxMRw5S+3HKyD/RZ/OlzpdStc=;
        b=WpwquJlxtBzTlM6+zua7i93E4bWJdSDBGXXfXNCPEP7U1F4OsejPbyECrHvE4dsWc3
         +eJFGazgiywoQ47VRD/7BkC8edI+yy6PeHlGdVpAq3hzQssmCSBSM2jhGnBncmGWMWcR
         mDEUD+moYyt8X9Imf5imOtmamy9U1Aeyy2cPhEQq2UYCbhcofzboVpNJwkIZuwKw5Qxg
         J7TO5UI7yibEtpyhlrxoj80Yi9cMYyQ8XFpAvqXA6hD0yqQZbtDbg6dgQSqzMTQKQ/H2
         2SQq9D7ah0/HT6TbsMGhKXWpujbAs5SXaRZCRpGnzhKDc2vQZm7w1DcjFIw/rCdLtuj5
         FEYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEccyW1G0+wZhV+5QLxVP5gAejJCEjgtHiS8dh4/0hqz8mLCI7qpEXIg3NJvIAdcr9WJaPh4usxBnXr1bLKDYr@lists.infradead.org
X-Gm-Message-State: AOJu0YzYtl1NYEEpwCjetjCHMEyhAZuI0A32Uj8rvU7DO2PvhZsasq+Q
	w01y/vnmSaOKsKct2+MJm1xx2dYY0ZrJNM25rXzyQdYiWJX6Ft0i071a
X-Gm-Gg: AR+sD13Qjuk9jbskAHm8EZyfAbHzWK9rFqCCDEWNkpiLHiJ6eeP69POF17P0+KYzdZR
	lQWdGpI95NDL0x/6QjP9GOOvh+Y/NNMGfcZplXJPBkA2unYxiositDojiMasSDaabmE95SD+pMN
	g2zLYhHfubSrky8ywaU6TIpcYCTlzX2j5rcRAHAHMS9Z7AXtf1YkIdGAMF5Xk7Y8zwH/z8haTWY
	puP+PRcOcb63DUd5wrpw/tiJ0CiFgJaXSNe51qNNOKzKQK+U8A8YuyVgRcBBAypld0QmSujyK91
	gZ3qmEWgQ9rjFn9QMteb8XyAaKunJOxqVJuSzqgpd+5Lr0JVGBOGkiGuB06tu61AywFHjww1JD3
	Y1kLoajbp7vGNXJ4nA4ANvPPHnekSbM9qna2sfd5v+1pSJGEIMc6IASOWPSzTFn/SgMjrC3HLBV
	RDPZSV5QHPyQKDvhjMi4CQuodaZPI25fJOqb6TvZaVxV85KfLVavZwvLcIu1DribnYbyjC+GmNi
	yanmQ==
X-Received: by 2002:a05:6a20:d43:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3cbce7999e3mr19834403637.13.1786343142488;
        Sun, 09 Aug 2026 23:25:42 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:42 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: sun4i-csi: add notifier unbind callback to drop the source subdev
Date: Mon, 10 Aug 2026 13:25:21 +0700
Message-Id: <20260810062521.1709379-4-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_232543_513602_1F7B9AF1 
X-CRM114-Status: GOOD (  14.53  )
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

sun4i_csi_notify_ops only implements .bound and .complete. The .bound
callback caches the remote sensor's subdevice in csi->src_subdev. When
that subdevice goes away (e.g. its module is unloaded), the V4L2 async
core frees it, but without an .unbind callback the driver keeps the
stale pointer.

A subsequent VIDIOC_STREAMON reaches sun4i_csi_start_streaming(), which
calls v4l2_subdev_call(csi->src_subdev, video, s_stream, 1) on the freed
subdev, resulting in a use-after-free.

Add an .unbind callback that clears csi->src_subdev. The pointer is only
dereferenced by v4l2_subdev_call() (NULL-guarded, returns -ENODEV, so
streaming fails cleanly) and by sun4i_csi_notify_complete() (which only
runs while a subdev is bound), so clearing it is sufficient to prevent
the use-after-free.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../media/platform/sunxi/sun4i-csi/sun4i_csi.c  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index a8711336a754..f19508f2c7ed 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -122,8 +122,25 @@ static int sun4i_csi_notify_complete(struct v4l2_async_notifier *notifier)
 	return ret;
 }
 
+static void sun4i_csi_notify_unbind(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_connection *asd)
+{
+	struct sun4i_csi *csi = container_of(notifier, struct sun4i_csi,
+					     notifier);
+
+	/*
+	 * The remote subdev is being freed. Drop our cached pointer so that a
+	 * subsequent sun4i_csi_start_streaming() does not issue a
+	 * v4l2_subdev_call() on the now dangling source subdev. The call is
+	 * NULL-guarded and returns -ENODEV, so streaming fails cleanly.
+	 */
+	csi->src_subdev = NULL;
+}
+
 static const struct v4l2_async_notifier_operations sun4i_csi_notify_ops = {
 	.bound		= sun4i_csi_notify_bound,
+	.unbind		= sun4i_csi_notify_unbind,
 	.complete	= sun4i_csi_notify_complete,
 };
 
-- 
2.25.1


