Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ED3C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=; b=F2H5gosbD8LOTv4DxyZcSE/Hmm
	5wcHQG8D7NPUdKqn0INmwYPHJnDd26pyST8IEdCv4jUd4mE8vj9y6reXBxqfN8sO1YMz+rOxtLbxy
	fHcWWOQ+ERNUwRAqP9IWZLAkvO5c2l8UujnayiesKz1W3OLBUcC4tSge3QJN/LJrUu+V7paooKn9x
	XA0EVGtx8CcNdEs1RDPjiCkVffKbiz3VWdeyeeK7QdwHPXOUCow7sDEfb2cZulbr8tAWAt9XoPq9Z
	rLrkGf0bhMqUaUBZs6o4PK/IgUtU0N2Ro0Sz4gDxfiwBaBn5l+c+rkl1O1e0xG8LaYUFmorJCEfgH
	HkatYf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wses1-00000009ISL-1gLR;
	Sat, 08 Aug 2026 11:05:41 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsery-00000009IS0-2V33
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:05:39 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cbb973e6749so447707a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187137; x=1786791937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=;
        b=B1T2TcVeedm0bgHjAfFfyM/DxS2Mw1KF5/RK1EetZF9FOaRLCVWOg0oQKEIzyxBQ7s
         VL0E3YAUfazNvOMvOkF8PKC/h6Exd5lQykrc8gy5e9ABEdJFbPA2QoSYPnaad2nh2tiT
         l7Yogh6XpfzByJv3hNrrN71POIBjdpOsX0PPCPqDPWg8EmnMUdLRbMRmojYQIL/4Da9R
         tMP/rqJz6NnpQaQpXbkXDFQTnsQWtWWRa3ZHXU1aFXdG7bHdiRariswqO3DDHb3otVvk
         4hxWHCLj0EWEqCqMxMcP31wniZeTD8chdaW27+y/Tpov50mQEliBYdcjrLDst/+i8Z+0
         UAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187137; x=1786791937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd3mCxZmxHBD2Xo74+SQgSYvrRmOoQOdDSC9aBG9aE8=;
        b=Y16TckJ8X8lKaNsQMt8xaxE4PnMJkyPJFTd7MKBgQHO/T2u6ZMEnpdKEDjA4QhDURH
         qLy8R2eVZPsvc6UWLdaDXbWUKc60ow1N1jFIwZyDqPVYAPvKLL9E3CHrK7vIpqts9Vy4
         lItVOSVCKkoLP07JwQXG/BaPP4RW0dLBf4W7nTN5tG4r8a/f6fVFRhPyAEaa0Z8on8eR
         k90jGzOGiO8itzTxwvWjxtjBuC9UnM8O3Eim5IY5PWKu/Kb13GJq2Oi2a/QJMsRuT9hn
         IwAueELbPBNaxFXjpCrO/5/kfBcoXr7eW0d088EqlCA8ec2WE4G/c5brK7y0vdB/ce8Q
         RvTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/F4WD4V11AD7OtOdMFwZtVpD96P18QRu+82q/qQSHCycDkJTPq18YYXoDEjQtNjf+WbZNBGUVSGzYlBzvx3Z/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtl/9VYHdqfofjQMjRLlKDbjEIP0YAjJP8gpcivfKPp118SBYa
	Hsm1LSZ+N+sSyBLOEF3FWEBTs3bIHNDS4Kr0ZSUkRSJFSgruhmki/knj
X-Gm-Gg: AR+sD11mGVx/pUmrCe8kB3VRtEHoG0waNWRmW8twkYxKTMRCglosj8/qH/tLeqQQQ7f
	b7Z8wCe6Uw2WGlAnps6+Cx43GgxRdck5ubVGzU9Qs5lc9Tq0yKapEmmFfS6yWQbiPC3DTYOl8Gc
	mFRfltvr5Q8nnZvQq0826dKyTSCflZwSaX2T7BuFWt2HYKDKEGThU01Ex9nFc0EIZ9aYwKW8HBo
	NW8Tm/eCyYEN59zwAsPKYJpzPfnmK8IsSD52DB2bLYNZCdpvmihOt9BpWockMS61BRNZ8lrcQI/
	kolaSeWt7h5gbMRMBI68jqiXFm6woNjcPIzfxG82SRMxyiJFRj7VEgIoQfZ4Y9hqYWurarmdR1P
	mQbWmcWM4G61DtPukxojmG3VChga3lWai8qxLL8hCdH4cTI7B28XYn8OFx85GBeEupUueMf8NyX
	+pvm2S+Dcw4wac/tBL0ZSi+js/KnYcvxRmvp98W41ihKC2UkZebR4SzYpAxZRqXalGpy2PVjOkh
	05Ywl8JQ029onoz
X-Received: by 2002:a05:6a21:6817:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cbc0490091mr12371196637.33.1786187137473;
        Sat, 08 Aug 2026 04:05:37 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm21643469eec.28.2026.08.08.04.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:05:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH v1 0/3] media: sun4i-csi: fix lifecycle bugs (leak, IRQ, unbind)
Date: Sat,  8 Aug 2026 18:05:26 +0700
Message-Id: <cover.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_040538_676948_88AB1912 
X-CRM114-Status: GOOD (  14.51  )
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

While addressing an async-notifier cleanup leak in this driver, I audited
the surrounding device lifecycle and found three separate pre-existing
issues, all present since the driver was introduced. They are independent
of each other; this series groups them because they touch the same driver.

1/3: sun4i_csi_notify_complete() registers the video device and the bridge
     subdev before creating the media links. On a failure in the later
     steps it only unregistered the media device, leaving /dev/videoX
     registered. Since probe then aborts and the devm-managed context
     (embedding the video_device) is freed, an open() would touch freed
     memory. Unwind the registrations in reverse order.

2/3: sun4i_csi_stop_streaming() stops the capture engine but never disables
     the frame-done interrupt or synchronizes with the handler. A late IRQ
     after the block is runtime-suspended (on release) can access gated
     registers and crash. Clear CSI_INT_EN_REG and synchronize_irq().

3/3: The async notifier ops lack an .unbind callback, so csi->src_subdev is
     left dangling when the remote sensor is unbound; a later STREAMON
     dereferences the freed subdev. Add .unbind to unregister the video
     device and clear the pointer, matching stm32-dcmi/atmel-isi/mcam.

All three are marked for stable. Compile-tested (COMPILE_TEST) and
checkpatch --strict clean. I do not have the hardware, so testing on a
real A10/A20 CSI setup would be appreciated.

Cong Nguyen (3):
  media: sun4i-csi: fix video device and subdev leak in
    notify_complete()
  media: sun4i-csi: disable interrupts when stopping streaming
  media: sun4i-csi: add notifier unbind callback to drop the source
    subdev

 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 25 +++++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 11 ++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.25.1


