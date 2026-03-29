Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F75F3D5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=; b=hIE6VGYFpLhl8xsmwTg5mN+LzU
	mYGrxHp93AuQ6oN1FTpIHzie5M6f2oz3u05FGewGLkpO+j8GzZsjT7g9E5nZFobtTfuJQ0jlOZSNs
	h/rI1Isz0Iw1mR3+tQ3d+SZ6fkT085T6NQ/InLoHSD418la1OYZAjKVwHFCSLE64Dpg8FzSwmDPXD
	RPmdZ5OkjUEcuv64ClCiJgpOHS/aaLQLCkjsJAgfe8aPX8e5CcfUKeDF1KD2EKw/dQc6Mx2YGERZN
	lphezj7gXge7LQAg4/Fa1oRwLAmzAFmb26R/R93Y7ZoQUHL6uf4xXd+C8rxFCTAqJJHSo1AjWXa1d
	B2RW1Bug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kO2-00000009gjI-2bhx;
	Sun, 29 Mar 2026 07:16:42 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kNy-00000009gh6-1Iy1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:16:39 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso3915530e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768597; x=1775373397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=;
        b=dHnMpHsQvWkD/Zq6IDcIwj0RtTa92/7eFQ5lDnqtVR0LcyUeAxF+OkqEfAh2QXs/ok
         Yu0Sglp6paWZ13uY0vqw9k4od1cTmjU0HgRCX2VUbHSt1gjimg6fy6DeFL9SPAT8qgGn
         xyXd9NP4bJEDPx7FtXI8xzr2K0/od4tvt/W2o6s+v4sBf6gtVOPmFZmnJo2U9+5R8Nh1
         kGl91qLZ3PmV7CthV3VFtpVU+DgHC2hEPz3qy1Ztq/dyYBZLw4uRoJuEWVlx0q3NDXIw
         VpuJ4YIREFYOKW1HiNMKqN38l75myqRRJSySjHObZ+qg/HF35BVxYO2YXt/CSCTD9aZe
         Aceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768597; x=1775373397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=;
        b=Tvt8QLqnn0RafeaNVKa1AKyDA0py3qetZcr2fjTk/CmjR5A1DfqqZ2qm54KixA+eKu
         msKNpnHaa3SJ83pbPKFZ1XsZrEeBgmJWJ/6bgth5Qtqqug/2lIIE5SqT8XjRn9c4bjff
         aqWiXGnHQzmYqic54xjYscq9ihrShx86tVsd+9K+b2/pCijNYMUEx4WA2Q5CHGQtxV9N
         bJ5YNejdZM2Bg1tVzXIASmdy1Wm/4qlp5TEm0Mqg08AzzzamvhLPTZg84rmDxjgVlcHJ
         Cwbbrm7evhOpuYQw2AnFG3tdGIv8Sggt6RMzguPBgeyEcgE2R+Ru/yQYAMWHLvIaT6+n
         BW5A==
X-Forwarded-Encrypted: i=1; AJvYcCWgWjr1BYOnMwyYul72eeIUa2CXeQloUAbCJI8QQvBu7T2DV+oPmtN/AyqdoYBL++uqCao5X92Hsu/fObAfN77x@lists.infradead.org
X-Gm-Message-State: AOJu0YwYMcEDmh8dlEzbhEc/A2/vqu37BkAA85rumT33mT5MJMfrsCpj
	DLtmr5nvJCZGYrrPvLElhZeYbn4ycBWvM0HhtB8uggzl5Tgc02LDR1mh
X-Gm-Gg: ATEYQzwPVxHCvnxNL6r71aBAXAfxCxn3yUL9CW0uMBrTg2Gq4vuc7cmxj57RPuFOUgq
	HBIeFae3pTfQBz7BrAASij2wXS2nVIV75NB+Zn4kO9VHih+dQw0yfqbMsx79iDXL0ASggQknibd
	GVMJDDrdFWQZsMdkQtivZFdtyrs2EF4tHUj1H8R6rRuiGBa6IpYLRMoLFpfOSdjvQpARONYVKoY
	DfqxthXqbG8ucVHmK4WW73Rk27I5YBt4ldmnSR9sLaGzi7igFFBcp5a/bg1sZe7PpOexq6U4H8U
	u4KvWN0vkZ0GWsGN7oi9v/XA3LYhA4bpVF/M8+zB4926mFB8p/ONUj23FgZuTFeBLhMuH7YQJxw
	e4ydkX//YcvFQAfx2MX+sjNHOstRSmLrJICeyz3puHB2QrGA3s83p0juteSd7mKoBM4DNlLYRsj
	cgJ+0D3oBoAkkVryyaZIgNNcs4kw4uIjBdVWk=
X-Received: by 2002:a05:6102:6cb:b0:602:9977:a4f5 with SMTP id ada2fe7eead31-604f926f2d3mr3395247137.27.1774768597337;
        Sun, 29 Mar 2026 00:16:37 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:36 -0700 (PDT)
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
Subject: [PATCH v2 3/4] staging: vc04_services: vchiq-mmal: prevent stack overflow in port_parameter_set()
Date: Sun, 29 Mar 2026 01:15:41 -0600
Message-ID: <20260329071616.507876-4-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_001638_365078_50D0B386 
X-CRM114-Status: GOOD (  12.50  )
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

port_parameter_set() copies value_size bytes from the caller-supplied
value buffer into the stack-allocated struct mmal_msg's
port_parameter_set.value field, which is u32[96] (384 bytes). There is
no bounds check on value_size before the memcpy.

While current in-tree callers pass small fixed-size structures, the
function is exported via EXPORT_SYMBOL_GPL and accessible to any GPL
kernel module. A caller passing value_size > 384 would overflow the
stack-allocated mmal_msg structure.

Add a bounds check rejecting value_size larger than the value field.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 44e5246f1..18e805b92 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1361,6 +1361,14 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 	struct mmal_msg *rmsg;
 	struct vchiq_header *rmsg_handle;
 
+	if (value_size >
+	    sizeof(m.u.port_parameter_set.value)) {
+		pr_err_ratelimited("port_parameter_set: value_size %u exceeds max %zu\n",
+				   value_size,
+				   sizeof(m.u.port_parameter_set.value));
+		return -EINVAL;
+	}
+
 	m.h.type = MMAL_MSG_TYPE_PORT_PARAMETER_SET;
 
 	m.u.port_parameter_set.component_handle = port->component->handle;
-- 
2.43.0


