Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED580E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2BNxauvgR86wVgxl1iZjGE4qN7o21GTD/GjGRmEaXA=; b=i0Z82UD7KPqG5iI1gn0JGWSRy+
	/pyFjR+l7c2GytSN2oCguzwPXvmMqLkOvx2HwDHBL1m/ETbVQbnbeyDLCW8LzpMXwTFfbx4/FptwA
	fgNPDEQqNEaXApjKAbEc3TLiYRvXpFVFt1F1UFlefwnqH49OF77LZqgd+UQ8d6+MnZF6EAydnkalY
	YybN8VyQXGKleYUOwFQZRBMOYb63VPmO8V7wS1sNoZ0nRZkNRc+H5NomboSR/Oloz1r/DQ93J5QTX
	BAPX8NPNWLWCVbSM1ID8iJAcF+em0WuQkvrnGUK5pIy/LhUPCOt7hJ2fQ33oqPhxG4X64P3YcKKLU
	LVYEGHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfry-00000005T3l-46Ue;
	Fri, 20 Dec 2024 16:28:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfl2-00000005RsB-3YxX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v2BNxauvgR86wVgxl1iZjGE4qN7o21GTD/GjGRmEaXA=; b=FcE7CXmdkMLuIpQu6zU7VeMJGn
	TmpjXAIRewJVXRH23tiFVR+ngmnOAR9EQt2HanPvZ117SjI81Evq2y/9x+mbaZUDE4G8RFys5YfwK
	y53h+J3m1fkx8bSbxae39VRucRIukqKejG5Eea38ZIu7G4b3BFvsmpu2Wq403iEB6xikwhadEiJXY
	OLgLZrhEC8miVGLqOhdWeCGzJoXiRz3uXBbQLrq9n/2tsokvRs6xqXfHGve2kt9qOMLpd2slBH0mq
	u1QvxsKujFBFFLjxsF/ovhCqKv7moMBKIVhtAiYreG0pZtkY6BafZgOYdmu05ACZ01w6tEYoKx/M+
	9VwXwOIw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfl0-00000005iWK-0tN3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43623f0c574so14645075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711700; x=1735316500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2BNxauvgR86wVgxl1iZjGE4qN7o21GTD/GjGRmEaXA=;
        b=X1unj05JjHoQ9ho4A0Xcv6iYDa0J0OhlN149DBGIVfAPn6R2PDKfBOK6QpEqf+AqsH
         eNM86uJ20ki0CtLwpnnlo08dFA/2orXwsY1BJkRZJ/ags0GWRP/bad8hRDbIBkfQrLny
         RrHbhleNAo28sfqgZLQFjP8Oqu75cFuLvgTiNxaoMl4A4mrZhga2/7IjE+meGl6ZhZ/p
         r3l6tZW0+46DHQVcjKoFCAeN6NLjao+Us1V+dBUp9PJxD0s6ba3ZzcNLLILocMQfyrAD
         22ZuJGT9ph4a9T+wNAR+v8MW/aS0H6Sq77EYObuhfP793VXkSVTe8Lq1PGeRTWAwRX9l
         28UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711700; x=1735316500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2BNxauvgR86wVgxl1iZjGE4qN7o21GTD/GjGRmEaXA=;
        b=N9O04QLaPO2PbRXsh9OmpLufJ3cIzcW/VWCgXMSw0f5GYjlo/hFd0sR+/JZ7FM4iWC
         wV5+hZKk6bVEW7g5GpPGbSya8/OsloLqfaGRUw6ZHPux7XLUBgmKaxuKHCQuFe8z/bVb
         kkQvB4nUJeggWdRLyKdfUry/buNWdFw4cdduWNNBk8BfzRZxeSdkpUXwoR2oo8p9NdWY
         6XkTScT3EPEDFYzSpzTIEVQC4d3J3zf90S4gcVlOGA3KBiRz9DZEIvcL278TIuHWSjgm
         ENBlaf/vU5bD8FtcydcCYhmMS2hH/udLfQKu0tdTXcnRRQvaMGlrO1KejKnZF11GiC9v
         vsZw==
X-Forwarded-Encrypted: i=1; AJvYcCUvpsprTrRQXIP4ARFGWhMMiL0xKR18R+Lqkzal77u5gf3LaHXiOkMg0LwWrJkrd/tYQFYhu37x43OFeKz9Zen0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz50XwJg2qAtzetHe75z5t1ppLV4dKCuADvYybowLfmTYX4NW6r
	Z3upn6lWyQMXJWpONrqH2KdAFH69pLXMYx+oOgTZrlqnu/I/1945xbEUlE1TWt8=
X-Gm-Gg: ASbGnctoPBHesFLMAg/4s568btDFBVWejSYZuJp2N4CNJTMyH3l/zqlFBplOB7CBWhY
	DLZPRp8K4zx8kMkCZLHv5Jjm6lESze5FG5cHiRRwi4cCsa8kj4KaPa2BaLuA76BtNnFYE/7/3ej
	W/8v8/Ywxv85a/vH9FSCNZEk5J0U2H0pCfMtbXHAsWhfrtLvG7D1nVKfL3tzCXcp8ew33rtdlhS
	ja/nVlJDU2YTojR7EDcVYUoEeHUCi/CzeZsMDmtCTDcMtZl
X-Google-Smtp-Source: AGHT+IHZKwXSt3EtkR4/vJsXBDTgJju7+F4kSqL+22sBCcY1J09BA0FGI2cPpS1gnn5GDXEf6EXehw==
X-Received: by 2002:a05:600c:138d:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-43668643173mr32952625e9.12.1734711699939;
        Fri, 20 Dec 2024 08:21:39 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:39 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:17 +0000
Subject: [PATCH 6/7] RFC: v4l2-mem2mem: Remove warning from
 v4l2_m2m_job_finish
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-6-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_162142_335984_6C7251A6 
X-CRM114-Status: GOOD (  10.99  )
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

From: John Cox <john.cox@raspberrypi.com>

The Raspberry Pi HEVC decoder has a 2 stage pipeline
where the OUTPUT buffer is finished with before the
CAPTURE buffer is ready.

v4l2_m2m_job_finish allows us to do this, however as
the driver handles VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
this warn fires on every buffer as drivers that hold capture
buffers are expected to use v4l2_m2m_buf_done_and_job_finish
(introduced with [1]).
That doesn't allow us to handle not returning the destination
buffer.

[1] Commit f8cca8c97a63 ("media: v4l2-mem2mem: support held
capture buffers")

Signed-off-by: John Cox <john.cox@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index eb22d6172462..325a518beff7 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -490,13 +490,6 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	unsigned long flags;
 	bool schedule_next;
 
-	/*
-	 * This function should not be used for drivers that support
-	 * holding capture buffers. Those should use
-	 * v4l2_m2m_buf_done_and_job_finish() instead.
-	 */
-	WARN_ON(m2m_ctx->out_q_ctx.q.subsystem_flags &
-		VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF);
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

-- 
2.34.1


