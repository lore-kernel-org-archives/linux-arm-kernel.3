Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13911F3D5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=; b=kNpCdHemEGncQUztTAK4YvHgd0
	ZVfQkgff3Q6/k0tcMYStq3TMqbSeMoZRIvp7a4dSt5xXAwOZQAAngAfFogab1dcs/m4390e53KKyn
	8XM6BfPF0rLbD1TX99IOArEpM4jKUZTvMXFxWFOLukjxJT+Mv7oQ7WpQhoTAdhS6BcLMJkIeLaRyO
	BYWrDZU5e3e3b/kGAD+4vr2X74K1tJTyYn1TlKU21kD9Oq/9UZ9ZpBKLq7Re8XFTwPthMmhSLBEBc
	IG74GHL4pkMEb9OjgPGLnW8yCLU5JUwix7qW/zdvm+liSzpvLfVRqMxDxuy8+/1mfpBKqk9j33o31
	PRnLCvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kO1-00000009giM-1vAe;
	Sun, 29 Mar 2026 07:16:41 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kNt-00000009gei-31X3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:16:35 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-605159dd396so250761137.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768592; x=1775373392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=;
        b=W1e7t1nsKa1onleo4dIq8TppZNB0sAVXi7Q4VWu0pkyrxCsYRR+RpRKmJAsF80CAUx
         4y7R6xIL/3A9xg6/WXyulAfPV6tZTfnXGYvbTXPBE5cQiX3QwK8m5PNFILBrooo0Y6rM
         wvIv+x9HSq6JnzTIHP+4EwfnF7LDrakySpBSEx2A060Qplz0vSy8EMSmtDpQ8HfH5bPn
         eXKQNxE7rc9bZYO1dWKkOYJ8ZPDqwKlEe/LnGk+yB77Iy976GiuKVMnQ1psA86+FeBN0
         ZowFUjOmzTIoQuQEEYq+VqJ4kCQv6vlSp0QxOrn1Zs8SVf8SpaPDBRBZiUB2NejQ8X79
         thlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768592; x=1775373392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nSlLWkq4h8uaqpliAQo5iTD2HSvpKos26zajciLvI7A=;
        b=oBOmsYuVuU3kluwjh/fVdYHmzTd/V0yUyhK3ZRrWKxpR6uhVNjCLf+a2OraXP/7aa7
         yHYprCmIol0vFSsF9ZY6NEFPCtKqNK81VJRxlInKeNZxZ+eUNTL1PMAkItN5PJzmX7aH
         gdJU3Opw53Gl5PVb56ohivYxqI5bMi+jzZhiiq6ynWIZoBwSi6n7D6N2w3ecsbSEZMNZ
         aPCpK9XlF5sMHx61tKMZwSaflBQVOeCNPCbFOn/Hwt3C8hqpJ/uQOa5vVJahUXe0+vqz
         pvFkgA3BVJjhKIbisFo2aNvBkkukLdJxahLDcQn1ShElSy7fYgsv4e3j2NAJNReiZnAr
         V2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUN7AQnh5zd/HMDzONTM6hPNpCclTVrEET+ipAyf19bDhW0dgX1xZbuVPwsrH9aHCF+sgeznc1TwehTyQXo4TuY@lists.infradead.org
X-Gm-Message-State: AOJu0YwpbFo3s2rlVt/tTe76Yy5qgne2tlCFAxD3dSbSQ5EkA4i/Y/MN
	NeSANHt5i+ubZxSJW93NSmG0i0AaawD+wPzCr1MvnYTc97yUFqesLpuX
X-Gm-Gg: ATEYQzytOUCu6bNDdqabT1PDEPs1+2WkW+MakoWj1V85ri8u3eVv92v4H0TT2zwmR0q
	HkYUwvRV3vWNcseayp4ePS3Dsxx8p5eFCHTUBGSYHIQe8/oM050VhsdtQLlt1MAcstWx1sXpefx
	OmyI8nOC7855uUcix9Wc+/7fJbYJlk/uFxmNRTMARHqWaqDtG32Erbhg2FBYwiWVYKjRAfAhOWX
	JGwdJQY7L+OZU5LIRsHxJytzGKcMUTN+i7+FV8TsNS2gvH1GSgQFCG5A9G8sOh9Ail8gk5N9gyq
	yhngma2d3ICqRNu7fJ9V4Nze3Sa7ZP2Gp9tcOMx/T3ZacNXWIteykUi38C4HVcO5mBzX3vfy7eg
	dtoQ4sIZ0KWfGKEEKFvkf5YtK2ryWGvgdO42LXwih9r8NjibegUv8KvEziLRSe56z9LRnQCxKCT
	Y64AfTGAQNtjeu/BTeAjVt8kUx
X-Received: by 2002:a05:6102:4421:b0:5ff:219b:497a with SMTP id ada2fe7eead31-604f8ff5ff7mr3225622137.3.1774768592246;
        Sun, 29 Mar 2026 00:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:31 -0700 (PDT)
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
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] staging: vc04_services: vchiq-mmal: validate component index in event_to_host_cb()
Date: Sun, 29 Mar 2026 01:15:39 -0600
Message-ID: <20260329071616.507876-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_001633_851747_982E98F3 
X-CRM114-Status: GOOD (  15.37  )
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
= 64) without bounds validation. While the kernel generally trusts the
hardware it is bound to, a bounds check here hardens the driver against
potential firmware bugs that could otherwise cause an uncontrolled
out-of-bounds array access and kernel crash.

Add a bounds check on comp_idx before using it as an array index and
move the component pointer assignment after the validation. Use
pr_err_ratelimited() to avoid log flooding. Note: this file does not
currently have access to a struct device, so dev_err() is not available.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index d36ad71cc..9c6533f82 100644
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
+		pr_err_ratelimited("%s: component index %d out of range\n",
+				   __func__, comp_idx);
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


