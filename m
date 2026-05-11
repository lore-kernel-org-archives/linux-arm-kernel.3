Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C5CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=; b=5GPBytKqo6SZ5dxeGV0gRFPWL8
	cdrbCP3yvSoGAJT8Na/5X470FzuolKjyS6RfY+vnjsZ8JczrZB/6JEj8RgC9iSQ0kySA1NoUK5uaH
	F7bKU1mVaS3bL3lClm7IGKiZPd/Vr/F0mueywDlKZgMBF+wzRzTUP6tk7YEYp/qAjCk/J0YYveMYh
	YX7yrqezlamH2E4eJveayxmn/BGhuokwrIM+9jtQNS4LMOPt8zmps769/4V3PukDyRCjKQUxX3CLW
	Jzws59GHuCJ6Cxql98Liafoi3l8M4u1/I6xEd+EP3Auih7zrzwugUecAq0XWWtvVrMypAl3FgOwcz
	aAR7dyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB1-0000000EJt4-2BvD;
	Mon, 11 May 2026 17:12:19 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUAy-0000000EJrq-336a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4867556e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519534; x=1779124334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
        b=SIZflA18R3voMkEGrUPTu5hepiW/fviW5XoLBdYvo3xwkNHEg6iOe9HfXNmEdtgsl2
         gO6TCQobkmT1cFRQQiG+Cw39WCdjgXufK9LSsLJWzGWbcuUH3VdU3Uz6u1SUkjjiCYSl
         REstcYEQNDaqNwsXujQBVWI2h2B4TyAN2wpcem4ocNCIySnlnjFZZ0FWzn3AWkdlH308
         +ua+Ew2airhb09eIj95xbeFJGg32PB3KzXvi5UXoAcNjK0BLOF9tRcsOlq8Bq1pQ3qrp
         yRIEhr1LidFqiMuim09IXIny8BAkzbyfU6z20K4xLmCoDaAa2ObO+p3rR8XKH/MBu+AQ
         9SrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519534; x=1779124334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
        b=saofkz9CXL8GuSXykAQsodbC6/1MFS+z+AX4aASU72XXOj4ZIZIKUJfqhvYEzvs0Fs
         fQFMBue+kxExj1fzNXcQJNPDdJ+g/Jcmhqmw4zQFdO/nTkpxIhGr3xXjJRJNmDkJgWCZ
         7ZFeyd20T8ss0pBwHEmgTFQeSMp1XYTGD6rtDbeUPHxJMbwGediA7Ja9HTn/5WBYALRy
         pMfFRC30BcUgC8ceRcKXzqr/Lk0DW5aMjXW2SsVVt4Hm66iMl1b2a6kvhVlQmj3OfzQ4
         JLfDrTJ27AtEhXflidkGtM16jl2pMF7mrFtZqXp1NJxDdGpFjA4k3WttKVn9y03iv1nd
         Sulw==
X-Forwarded-Encrypted: i=1; AFNElJ/yjWwoojX1jC85g0KbvtuYqcSkumOjTP5ofPl9BXw3WIpoGvdhnhRN3ItmQWIRysCfi12yYR3b0cYAT+kk/3LM@lists.infradead.org
X-Gm-Message-State: AOJu0YytF71fkIalEuk/afJJcQR6Bs7eaaN1kJYEdW9NMoevi6JoFrrA
	N10s/R34oUConyJRE5PAc8XxThrq6lHhXujz1dpe+nqmCHbxEFIzZc4C
X-Gm-Gg: Acq92OGsvRLjPxxlSUGGHmuhKGFjO5y1K8h6Lq9rDKAWzxC9kwidT87Gc6FtjcsB48o
	6gX8TmSuXRqbDw1gKY6EB0pIa4RfqCT8MAtakRMD+AOr8GwPFMVVwKIreMARiPZ8ZWQMlA5NKyW
	89ZRni9Q2kGtu+IBa2VxadwZMOF1Opun/2GGgVDGVdLR+EtIGNFAMzjp0FyVlCd0ZwgAtmH/B+G
	TiEx+CHGsWYDeVqud/uxtUjNzaItneKhgYsBWfnbXS2g7w/5S+yV9aC6Gbz8bx1wHhdfly2noT1
	FZZVz06zpSqvgyR0tFQ6AsD7oe+ubUg8LPywCW65TajRr1b8+SzKlwVKhrllK0HYicp2cSWbwOR
	po9W+CRvqblJdQCjgufDrNgs9JEy8QuNsAZwWn1N30HskiHt0/4yf6kKAVx1b+wY7YbK3d7AVjH
	sVRaYX5cFImeBYxBaDleVBbeLpIW+AS1AFIP54q+UFSe4WZW9ZI+PGnFlVBqwg
X-Received: by 2002:a05:6512:3d9f:b0:5a8:6931:ddea with SMTP id 2adb3069b0e04-5a887add27dmr10425983e87.3.1778519533815;
        Mon, 11 May 2026 10:12:13 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:13 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH 0/6] media: vb2: Return queued buffers from start_streaming() on error
Date: Mon, 11 May 2026 20:12:05 +0300
Message-ID: <cover.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101216_787363_5BCAD877 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

The vb2 framework hands buffer ownership to the driver via buf_queue()
before calling start_streaming().  If start_streaming() returns an
error without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count != 0) and the
queued buffers leak.

This was previously fixed for uvcvideo in commit 4cf3b6fd54eb ("media:
uvcvideo: Return queued buffers on start_streaming() failure").  The
same pattern exists in six sibling drivers that still return an errno
early (USB disconnect, signal-interrupted mutex, or media-graph /
format lookup failure) without draining their internal queued-buffer
list.  Each patch reuses or extends the helper / cleanup label that
the driver's other error paths already use.

  airspy.c          - moves mutex_lock above the !s->udev check and
                      jumps to the existing err_clear_bit label, which
                      already drains s->queued_bufs.
  msi2500.c         - rebuilds start_streaming into a goto chain that
                      drains the queue on every failure (including
                      previously-masked set_usb_adc / ctrl_msg paths);
                      parameterizes msi2500_cleanup_queued_bufs() with
                      vb2_buffer_state so the start_streaming path
                      passes _QUEUED.  Rolls back isoc_init via
                      msi2500_isoc_cleanup() on ctrl_msg failure.
  pwc-if.c          - calls pwc_cleanup_queued_bufs(.., _QUEUED) before
                      each early return; state matches the existing
                      pwc_isoc_init() error-path in the same function.
  rtl2832_sdr.c     - calls rtl2832_sdr_cleanup_queued_bufs() before
                      each early return and at the err label.  Adds an
                      explicit success return so the cleanup at err no
                      longer runs on the success path.  Parameterizes
                      the helper with vb2_buffer_state.
  dcmipp-bytecap.c  - replaces the bare -EINVAL return for failed
                      subdev lookup with a goto err_buffer_done.
  sun4i_dma.c       - replaces the bare -EINVAL return for failed
                      csi-format lookup with a goto err_clear_dma_queue.

These sites were located by a Coccinelle pattern that matches
`return -ERRNO` inside a start_streaming(struct vb2_queue *, unsigned
int) callback without a preceding vb2_buffer_done() on the same path.

Build-tested with drivers/media/ allmodconfig.  Not runtime-tested on
any of the six devices.  Maintainers with hardware are kindly asked to
verify nothing regresses on their device.

Valery Borovsky (6):
  media: airspy: Return queued buffers on start_streaming() failure
  media: msi2500: Return queued buffers on start_streaming() failure
  media: pwc: Return queued buffers on start_streaming() failure
  media: rtl2832_sdr: Return queued buffers on start_streaming() failure
  media: stm32-dcmipp: Return queued buffers on start_streaming()
    failure
  media: sun4i-csi: Return queued buffers on start_streaming() failure

 drivers/media/dvb-frontends/rtl2832_sdr.c     | 19 ++++++++---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  6 ++--
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
 drivers/media/usb/airspy/airspy.c             |  8 +++--
 drivers/media/usb/msi2500/msi2500.c           | 32 ++++++++++++++-----
 drivers/media/usb/pwc/pwc-if.c                |  8 +++--
 6 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.51.0


