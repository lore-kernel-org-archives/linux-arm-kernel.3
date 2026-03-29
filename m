Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65936F3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=; b=DpCDDT0Mt4xyASNzivXSKguz2D
	Knly2SEzeA7846WP0uxeUEjnOwYu+diwObq16Pt+6tmB/IeCKaFZT9+bCdXLMTSS5aDFkgpkBK2qV
	FhUmHRPv14SVGaeFiJOFXZvZ+L7LhgpuMTe6kIDy5zfAc3YCcKQ887N0Jr2c7amQFnp+ITRSASuwJ
	EJ+IVstBKbfmaXJJeQsJit4dJ+Ee+TQwJNhkZxufql5R/0PVprofSbRc7RoalPVVd6+gmIAFvhX0T
	NwzGZcm9UZXfKH7r6SAvzjwvywkArs/iDLwEDWPlSBw5uhlvDrwzLyP1NzYdMOjGq8c2tf5hie6DH
	hGilvhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jXt-00000009dRn-0cH1;
	Sun, 29 Mar 2026 06:22:49 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jXp-00000009dQM-1Y0a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:22:46 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so342368241.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765364; x=1775370164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=;
        b=h7la2GE2DrYfUByVsC0uFfrOkjkk3Yogz/Xw9+44zPmw5DZvEIRs1mvyxTSInLFKhv
         Q7maq4s89gjHSwFomWKD62bSd3jrD4g9MyHj8o50/SEdH5T4m6ztv7a6gLPQkOBS3vHL
         n/v/XlTlmbegcvkSwfEOuHtlJu2EbrhlW6B+7nCB3Zq6nk08mOnd3Ous8dVv/xKJFpMO
         cDA07lFrIuSRULu84H3i0yk1dpB73DX5sGsuscR+DdqD7OR/Os9UOdMH/3GYdu82jwtY
         CVBb3MXirME9OdBV0ERWgh1E8I6E0A6ROpXbrdxg94HX2kxxgCppE2rXjQbkVm9HxWo5
         Ox5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765364; x=1775370164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=;
        b=HALm2vCOGFlVg91C32OHpLnRd9vbETGCTnnXUd2J3A1gfcciibLOQqMY17MEo8Z01t
         sufWSZhdB/fF1PUk7P+r0bJOuT70jf3VgrYz7NBUdrOuSxFUcDrmK15TMQy+el1iLFnU
         wx2ZG0kQXZbYZutDS56ov0O7fQTb/7fnewScqzKOj9YAceZFo73F/EitlIp45TTi8hp4
         TgV1uyjirnoWLXWuEEM3VB8ylJSwP5ZyBWrbTrQeIHomX/EXkHWBMGOXuYms8FjrZKQM
         NCN5+A5z0iyrDu13T3C/bE74RLV2w+OnhLT3rh3QX2zOTxIH1veGCU8hcfOZWBst6hLj
         LMqw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7WQ8rj+I5EvVUscvh0opf+Yvjb0LGHQatSyRkNm9k7NnQcUcvrTUM0g4Fkl25Jn1m5ZcigJwA47PWml793Bg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx501WivqQv+d+CtIrDxhWH4bS+XrEcFntpL69WgacxWgIVrsHB
	/zEyIY7wmgBhD+8xXYIsNWYLAXJ9+0SF68szu00mx9Prs2SGl6OjRslH
X-Gm-Gg: ATEYQzyjmMqK8ysIzXcU6aP7oOZqwv9NXaXqis+9vQjI8tkxRBCBEceq6XU1r8Pg7Ot
	uppHmGwiSH5RE5OfSkCjT5zK7jXNa2wvS95aWcmFPYbXN6acRrkHKw0FTveS7N6EgfXrTYokj1Q
	jxu8hT9RP3sXpGPS2XsJEO/ZaSeAIHvm+IAjXYYH4lKVj3bqHhNbZaiCHErzdxR9wpF8m6Ilbn+
	MIfg7e9S3Js8yJbPNH5kWCtorJVj5ufRQW6wIOhgJp7hhSg0S7SSX6sEVge3KqNOkHV4XLd6saq
	u/NqPEpaDtw/DYaFcMpc/r50bvfa1mSBiiUPgtowJnEcg0rEmRJIjqdSsw7444ggXITy7TRVGTU
	iKbOBrmORGaJUd8HSNn8R5H3qvPSgnp1ILTZtRbkePt+FGElzrEmDKPHCA1gqNUwop5neNxbNFf
	lx9y9q56Hy/g3pa2VRxnoWCgcD
X-Received: by 2002:a05:6102:26c3:b0:602:8de3:8df4 with SMTP id ada2fe7eead31-604f92c4d39mr3130236137.20.1774765364018;
        Sat, 28 Mar 2026 23:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:43 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array access in event_to_host_cb()
Date: Sun, 29 Mar 2026 00:21:11 -0600
Message-ID: <20260329062229.493430-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_232245_438635_C9FE1A55 
X-CRM114-Status: GOOD (  14.44  )
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

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

event_to_host_cb() uses msg->u.event_to_host.client_component as an
index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
= 64) without any bounds validation. The client_component value comes
from the VideoCore GPU firmware via VCHIQ message passing.

A malicious or buggy GPU firmware could send a crafted
MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >= 64 (or
negative), causing an out-of-bounds array access in kernel memory. This
results in reading/dereferencing a bogus vchiq_mmal_component structure
from memory beyond the array, which can lead to kernel crashes or
potentially arbitrary kernel memory access.

Add a bounds check on comp_idx before using it as an array index.
Move the component pointer assignment after the validation.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index d36ad71cc..4772126d7 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 			     struct mmal_msg *msg, u32 msg_len)
 {
 	int comp_idx = msg->u.event_to_host.client_component;
-	struct vchiq_mmal_component *component =
-					&instance->component[comp_idx];
+	struct vchiq_mmal_component *component;
 	struct vchiq_mmal_port *port = NULL;
 	struct mmal_msg_context *msg_context;
 	u32 port_num = msg->u.event_to_host.port_num;
 
+	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
+		pr_err("%s: component index %d out of range\n",
+		       __func__, comp_idx);
+		return;
+	}
+
+	component = &instance->component[comp_idx];
+
 	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
 		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
 		       __func__);
-- 
2.43.0


