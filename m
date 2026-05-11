Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15658CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=; b=o0sMi1QV2oFrlyTvFzboUFqqmw
	Y1al5b0UkAMUHB1ooc1Z58uOnwvZfNfmoP1vB/OyvyTjbEfoDrWRseQ3nMxWZRCLGTLXJ3VJ0VLn8
	B7bqf8LKPa0svNoAO6WDuIR+J0yh3fMQUnVO+O4riwypMYsKbaiuUbOui10GyovY1A4glevEdbRva
	ch17kD1p+EVIJWTdNvtWpfiSdI4uRMNHOUuhzHPUNaC83MhY6qEnHi2wBjSFeTwfAMlIBaDKT1ZDn
	EsPQjNL5Cedvnv1b2OiO/b08lBmYXmY4VRdodfkA3X9Qii6I00lv2Qj/PLhhLNZyTc+0D2fplGeQK
	6PQWtFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUBD-0000000EK1S-2Mb4;
	Mon, 11 May 2026 17:12:31 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUB8-0000000EJwb-2awl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:27 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so1465013e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519544; x=1779124344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=;
        b=nxqKFT1j3D9lN0Ky7GF8vPr4ncV4ob8rnPoJLfJ+PRGs6bsbEtTbnzhMEgHmjxrswr
         b+8Yc/gNHepvgmo10K4rp+v2pmhDecim9zkWYrY/F5EMXg4prOOiNvpDdMsTZSSM9j7s
         TEBQO9buPaHHCJgmKOmAZrMSjvJFoSJOaYLNdI1tykyXD0K+SNVxCabtKhW724q5bNqd
         TNGj9Zzsy5Ej/1latQtFwnCGiZcGcqALTBoTS3Zjvd5xsfm9a1dEtnpbj4hgF4uuU8sA
         Jg8xSkU2ceg0/3+QKJIK80mF/wUXe/j2K0E+pQMSpLMDIX8j8TfK2aOtW3vTReQVtii9
         ujwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519544; x=1779124344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxqdxYVfNyLoxNKHswDJZT0z/g1AEcUqUWKcspgGBc8=;
        b=Lq7yrwmjrpujmIJaqWebD4R65sQERzJuoyVldrgYtcAN27nQjqPp57oKN7dMzHVL42
         O7LouIdYsmcbZQ4vrG0FVU1qs5rRTSOP/34tAF4PIlqHuRPHso/3hqbYNnDjD9vW0vk1
         ZtzXogHTAP80bYqy6RXLeOvTdc1Ot51YnTsCNTNUnvVZz3t8+NRpVVGWOMB1Ad2ruYbW
         a17MGCkEhqTUgB05jDt5EU+VQQIdrdf+YMBMWbItou2oHBoZJpYcL2Ks/S187fEn845t
         i3geETMQSOPzHzvAtbhasUm0AkFUDsRj1D6Qidq38Yu3ycxqWdArrxmgghiewCZDUxY/
         0Jxw==
X-Forwarded-Encrypted: i=1; AFNElJ8FeXdUofxYM/RdR6ArwK+NWqDkXbipKXqxOiQuz5luPNq+aGncubwTiPTgAp0IKptAbDKvEHDtm6zJSxZ4hUSz@lists.infradead.org
X-Gm-Message-State: AOJu0YyjpZl3jpD2zvQTf7nc6pcG3KL85657znu57iyaDYR41C9vuL5U
	/3od4NL689u1P4dzGtal474CE0Db2dY78VnUAIeoSsqzcG/ugDPgd2GX
X-Gm-Gg: Acq92OHXHjJfEU17IMYNDU1YBxPM5NYgNhb+0WdElQSQ7YIpJw9PqOp2chHwGSF/TfJ
	EEaUwzPXSLYCn70JP4roEPs4OdzMApQai1ak2M17wU5x+r0q55AZlmyX2lLavuwB6OfeWvJ3EKN
	UaLhlz1XDo8AAUf0bYe4HcVPBLjlSROmapYfR9QpPe0Vws2YsNhXTigEszfhSx4d+wbsSnqQ++g
	TmvSO9gdaxgR1kUvuzODnVZ1ZNblxj4YXbW92whEWkQCrj9M/L2bv5d3X+vyCs5OgkkdHsPGTgK
	N4isnXUcVEhUQeaxtniuUy9hLNTZHS5XksfKDFOlaRXu1JK0VZdpZe1XVqpvsU+FJVvoQFjKCch
	5EQPKEaey6mzF9qT+jWriI16ieQQgbG5qZl9x+01bcuaz0wwf/TP0gkAyQy/kyAM0uRHLmTSXR8
	22ukAX59yUHV2HBdF1neGuF83kBYLEFdg1f8v317asOw2OOx6gm58v/IZ5Vdd1
X-Received: by 2002:a05:6512:2309:b0:5a2:b86b:56c2 with SMTP id 2adb3069b0e04-5a8e0f35137mr91615e87.21.1778519544242;
        Mon, 11 May 2026 10:12:24 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:23 -0700 (PDT)
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
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/6] media: stm32-dcmipp: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:10 +0300
Message-ID: <3b7c3d1be61bcf092484016e25e7b8add98bbe0d.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101226_672187_5CB980EF 
X-CRM114-Status: GOOD (  12.55  )
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

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

dcmipp_bytecap_start_streaming() returned -EINVAL when the source
subdevice could not be resolved from the media graph, before
pm_runtime_resume_and_get() and media_pipeline_start() had been called.
The remaining error paths already converge on the err_buffer_done
label, which calls dcmipp_bytecap_all_buffers_done(...,
VB2_BUF_STATE_QUEUED).  Jump to that label directly: the intermediate
err_pm_put / err_media_pipeline_stop labels are skipped, which is
correct because nothing they would undo has happened yet.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index a42f43d19f9e..f0e809458489 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -401,8 +401,10 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	 */
 	if (!vcap->s_subdev) {
 		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			return -EINVAL;
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity)) {
+			ret = -EINVAL;
+			goto err_buffer_done;
+		}
 		vcap->s_subdev = media_entity_to_v4l2_subdev(pad->entity);
 		vcap->s_subdev_pad_nb = pad->index;
 	}
-- 
2.51.0


