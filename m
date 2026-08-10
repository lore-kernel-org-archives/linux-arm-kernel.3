Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFE9C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=; b=cmz1gQ3iuNH06kgL2jd73hIp7Q
	UM5xIgIcvFFhk61XiFxlgDG6q9OUEJPM5eS1FnGNIm5wcYs4S0oYD8Gh0mREZSUzfPdV7X0HQNN28
	5yBVQaUQSeJ5F6zrfZHLtlGCqy9kTnNjwaUSwrTx7MySLONEiRVrPJT3VnGHWAyvrXeroVRrkElMd
	/DdbDkTZNseaGFidM078WCY+Ts8awHoByo0BzKZWAY5T4BgRpj9oUlYTZuHdMufCzI9mT3QKADJaF
	qqUJ/tnC5Z8W444iXvzKSb1hT8KGOs5rK5rFgaSOuWV4DqaDRBZrgvZvjjSZ3OJAZeVe8FkGY1nCX
	8pRcPdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJS1-0000000B5Ke-4AEn;
	Mon, 10 Aug 2026 06:25:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJRz-0000000B5KI-1BnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:25:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1517308a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343130; x=1786947930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=;
        b=oACSKk79Eij/y1QKzxbJ+0x8OyNR8kr9y8EM2CiyphVUYRGSk/hWX3KUR0tOK2oB+P
         3plRBAIAekB2Cy3rwSoetvNfHmSEkUXojK0MtrxWdQWOc3DaRTlNzuJq8OAqXRQxwW/l
         7OTd9tq2RhHf50QXgrXPFoq7PDJKS/jOJsl2Cu6QmkPakfCQqqC2zXn5Jk8SWzFgJOT2
         gpgMpIwhqUMyIkhXM/cdKyKoxKL1z78pe0jpGDyF7OiLpV6jD2VKQvtOB0vIrbGYtVAi
         5SA9Rj54jBYy77NWnDy/X8KW+MHUTQHOX7PVmtXGnl2jOEjBoKmhZA1HLIdf3b8jcaQD
         aV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343130; x=1786947930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=;
        b=hLm/1Mgl8VVDSLI7T0VOmGIfOLuyWnxLKpMtZIY1naMMcmXi3VPHeELIRnOQ9TVM1M
         VH94ry+mry8iW8Ga4klSxVNdDdmCcSDvkBIyELyb4UOlGqjFucMBdBOdNpF9vPO3ypWc
         Ov3zsjKRNjd6aMTl71Fv+FMka7zFw48d5WlvRHp1t5LSSuM5b06Jym09gT4XhKiElxlt
         qWi76uWeQUswWaxPe27rIVDFwlkL5X8dy98uZR+cVyLlERzBKcy8RcF0FBDD9HT1FOer
         +577C9Sdc0gx9p+wytiUe//T40ufp+y0eHgNtdU6QeAMu0gFh5eQC5BSVAQ9/b/Hudpo
         SbXg==
X-Forwarded-Encrypted: i=1; AHgh+RpdlH+HqmAdacuIQRZZrEwZ7nRRscA4gWGxwPtyhlod0xAGjVNLPIEFfOtF0GTmR9yODBkQOmuduZpEO510hS3S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+5o2fSKpYvoicj0ewGQzPNDQraNR3mFD9mEK9FAwRKHQkTw2V
	IkjpMDneJSJE9GuolHN56jxc5u2q1P38iDz0DRA1GWv3K05EuJ/7JaFN
X-Gm-Gg: AR+sD11Eu9bEwzYzzVpxCh6J/zFR0EhJUOG1L6yUIfnALiQN9UanLPl8YEkGSIXcKc2
	ivV44TYlrP3mVfmH2ojPOdOou51FvSgyqclCV3VYRNfQRYcv/G9kOwbGRK06aqzF4qXWE/qcAeu
	mm02EPn38B+ImukhgEqsRGEBY1xvqumTR+wyIKZaRTJTjmF8jq6Zkl746G58iLXY5AfaUH0F7rU
	o/iMM94pNDqv2BT+x5fi/w52C3IM9ayeyVdNm2vth7StK42nGUQ21c2POL+mw2aY9GeyBZDUhyS
	5ouBBr3BnfQN/n/k1F3aAJN1kbIBzIRtKXsAMtzXJeVtL4CsPGJBR8mZFi9uTy8NpfQzih4vutp
	975L9bZ8+AMhzrg5aPnVFN1+qrKb0kMmaEe1zAnqE+sai80fITYWgVPrPTvlK6assSst4KbI8XG
	b41i2W04TPHJE/F7aiJ0MehRnlZZEm56MirDhqgxTYgNARaSNe06ZEdRIBoLmbNP0lAvCAh7XuI
	0w8+Q==
X-Received: by 2002:a05:6a21:50e:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3cbc0431dd0mr25765056637.28.1786343129913;
        Sun, 09 Aug 2026 23:25:29 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:29 -0700 (PDT)
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
Subject: [PATCH v2 0/3] media: sun4i-csi: fix probe/streaming lifecycle bugs
Date: Mon, 10 Aug 2026 13:25:18 +0700
Message-Id: <20260810062521.1709379-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_232531_326785_DCF99012 
X-CRM114-Status: GOOD (  16.00  )
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

This series fixes three independent, pre-existing lifecycle bugs in the
sun4i-csi driver, all present since the driver was added (577bbf23b758):

  1/3 - notify_complete() left the video device and bridge subdev
        registered if a later step failed, so /dev/videoX stayed live over
        the freed devm context.
  2/3 - the frame-done interrupt was never disabled on the stop path, so a
        late IRQ could touch a gated block after runtime suspend.
  3/3 - the async notifier had no .unbind, so the cached source subdev
        pointer dangled after the sensor unbound.

Changes in v2:
  - 2/3: read CSI_INT_EN_REG back after disabling it to flush the posted
    write before synchronize_irq() (Sashiko AI review).
  - 2/3: apply the same interrupt teardown to the start_streaming() error
    path (err_disable_device), which had the identical defect - the IRQ is
    enabled and capture started before the s_stream call that can fail.
    Both paths now share a new sun4i_csi_disable_irq() helper.
  - 3/3: only clear csi->src_subdev in .unbind; drop the
    vb2_video_unregister_device() call. Since notify_complete() registers
    the video device, unregistering it on unbind would make it re-register
    an already-unregistered embedded video_device on a subsequent re-bind.
    Clearing the cached pointer alone prevents the use-after-free.
  - No functional changes to 1/3.

Two further pre-existing issues raised in review are not addressed here, as
they are out of scope for these fixes: the embedded video_device using
video_device_release_empty in a devm-allocated struct (a broader lifetime
rework), and notify_complete() not being re-bind safe (it re-registers the
bridge subdev, which needs a larger restructuring of the notifier flow).

Cong Nguyen (3):
  media: sun4i-csi: fix video device and subdev leak in
    notify_complete()
  media: sun4i-csi: disable interrupts when stopping streaming
  media: sun4i-csi: add notifier unbind callback to drop the source
    subdev

 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 25 +++++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 +++++++++++++++
 3 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.25.1


