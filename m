Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC94EE7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehuxIelX8DO1vrFPZF560cKcYx8GrjFEJ42I4SDiRJw=; b=xKhZxSjtWlzopDEi2EyXpGtke4
	msyJrRh4z3qxPLu7WJap9An/6f6hfZOpDZiMdpzT8lZes750j9OJFORC74HboD66X1mCqv9pMP+RP
	jvdTMR1r55sqXRbPvZZLMxkA5DN5j+eDOiO5+NpF4W8/Qd5Xxpp9gZHSuVJPslu4kMfzZe9wOfGiu
	85QAVvj6KaRhQJMjD3zmctKOQq+iUfQ3oJpMMIQzUlGDzJdFyFcctn+q/oB6V1JQ3C9GCP0wmRJxE
	5HLW9PcI3lRPUPIKf1Xdlfh5lgEOE/SyGnSq96p/aKrs3lgsmQK1dYx9lhWf9WgVtabBjwvuPimO8
	tjW0nhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfpZ-00000005SeW-1cFX;
	Fri, 20 Dec 2024 16:26:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkz-00000005Rr0-0JU8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ehuxIelX8DO1vrFPZF560cKcYx8GrjFEJ42I4SDiRJw=; b=HPIuvV+ILP9n2VpD0AXXHV+rbi
	HE8Mb+nimk583IOnnfNzZPAP7roxZWDZ09FL2ckVFpvhNKhbaPxkwVwt9O4IcGbVkQjCgTL/TN5pQ
	1nWLqjUEQoyVj0VeHyR/fPaCuWNYAZZJt8myi34ezfpIyU+KPrlpQhiaCPBLUT0ELrLdzThgx0LCO
	Jl6suvWWsouXzcJG3i4kwU1quysCkeeMZeTnmSJ73RYepjIAmlcybE3wqNM1iIpCb4AUIKnIU6cKr
	BPSCbgACxgg8lxolYp4IzuC3DfgdBjNzQtEGtX/2fL4iGr+f2+LDl6CqqZgz5SN3Eg5Z46mOPQQ5/
	U1DNyrBQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkv-00000005iTf-17K0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436202dd730so15441355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711695; x=1735316495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehuxIelX8DO1vrFPZF560cKcYx8GrjFEJ42I4SDiRJw=;
        b=rJNhXw6iOWb3GjH/xmEnge1W7pDaOemTXGdVT7bSN7BaPGXO35hoXY44vmnMkhxCPp
         NfduDrcsNIG/X9BuzsqyI6nIM3tYStxU8SyzSIEXCKVIu28RfiBdSwYWeUf9BoOY8swS
         krC+Xfc+qEIT+4w2srEQJV/ABknxyk8mC+88JO8xbHYlUCpUyXY6Ukkv4JkDJzxdzNow
         sUG8P3dypA40CNPaYg/7QkDnjMVYMyBzEYXNlfp7xfZK6EjYW91XO9vBwbkWfsAAvH4T
         ld0QHYVoYFWwuTGUeWmldyt5tkiigpvmCAkeuimy7HdJeiYzn6VLcbKS7/dhsaRomDug
         FabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711695; x=1735316495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehuxIelX8DO1vrFPZF560cKcYx8GrjFEJ42I4SDiRJw=;
        b=vrzhE8YJUaC3hBcA2OuCOAtPXVAokqM94g324/rzWV0+rnzUoNpb4rp0NyAinZADU5
         30ux4VCiXO6an9qGjREM9cJdruyo7dUoIyAHdiCc0e3Lzf5PY6Snin1wSwefdnia/oN5
         Wk+gdoM6Dy7RvnAtIoM7YAR34hcnLVw3i1jrvmgqr4u8QK31K9bxSvZxQJUqRzSNwYvL
         X/QLiFQQHZhphWwLnWJOQRD05TksB+GU4BXDg+gZ/o8X9HnPiRaTFqvnPIVu337g3x8u
         FgFIZiJGKszMhpoxlScOsXl7Y88dFm9zW+RQFF5dmz38+cRfVQEjZC6qtNw1NNY0Fsl6
         7h3A==
X-Forwarded-Encrypted: i=1; AJvYcCUjPWJaIYNRBNlYBTLVgkMM4glWwY+G5zZX35qFdI7xz+eqJUvvgCtBqx2/FVLeX+EAjOU7JQuyq4UFHBgUt3sd@lists.infradead.org
X-Gm-Message-State: AOJu0YxSKuQllw0xgvdiAZc0AZbrONBn/gyK7sDDYV1OtQ1KK5EiT4ah
	t66KQEd4uWimkBY42CXa4gOdaM80gcUFpRzaAfPLS1fjU4VxyLBOonvcNhtU08g=
X-Gm-Gg: ASbGnctONMZWCyhBpIaO6oaPxgNxbERIzd+teW/aNVi4Y3h8/rmwbCQorkZu7vfxNYw
	hyXbkhUGnOiXLPfMc4O8YlruM1p0v/iuNyuJuUXAi3y7vh7gd741JtKOyjyMY1eHPY76tLHSe3A
	4vu8mTXhcLuaFVNP3SZbZo36QWoMgGp7mQwiFkq1IwlPMtuaS7xN/ULO8jYdZEBfM6OtFGiOQQn
	krLDlkrlnf4bq5IOYjW8AGJzXxsb4RyoTSi/L7q6r/21LQ8
X-Google-Smtp-Source: AGHT+IFgSqb5b0E+v9TtN0vGwY/ilsvnvmz9GDFQcbPASO0ILJQEFvVgGISRslh9RDK/uoVDtsQUvg==
X-Received: by 2002:a05:600c:450f:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-436686461cbmr32737635e9.17.1734711695038;
        Fri, 20 Dec 2024 08:21:35 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:34 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:12 +0000
Subject: [PATCH 1/7] RFC: media: Add media_request_{pin,unpin} API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-1-0ebcc04ed42e@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 John Cox <john.cox@raspberypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_162137_465875_90245E51 
X-CRM114-Status: GOOD (  13.88  )
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

From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This is probably not the API we will want to add, but it
should show what semantics are needed by drivers.

The goal is to allow the OUTPUT (aka source) buffer and the
controls associated to a request to be released from the request,
and in particular return the OUTPUT buffer back to userspace,
without signalling the media request fd.

This is useful for devices that are able to pre-process
the OUTPUT buffer, therefore able to release it before
the decoding is finished. These drivers should signal
the media request fd only after the CAPTURE buffer is done.

Tested-by: John Cox <john.cox@raspberypi.com>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/mc/mc-request.c | 35 +++++++++++++++++++++++++++++++++++
 include/media/media-request.h | 12 ++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 5edfc2791ce7..b5334389d846 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -499,3 +499,38 @@ void media_request_object_complete(struct media_request_object *obj)
 		media_request_put(req);
 }
 EXPORT_SYMBOL_GPL(media_request_object_complete);
+
+void media_request_pin(struct media_request *req)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&req->lock, flags);
+	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
+		goto unlock;
+	req->num_incomplete_objects++;
+unlock:
+	spin_unlock_irqrestore(&req->lock, flags);
+}
+EXPORT_SYMBOL_GPL(media_request_pin);
+
+void media_request_unpin(struct media_request *req)
+{
+	unsigned long flags;
+	bool completed = false;
+
+	spin_lock_irqsave(&req->lock, flags);
+	if (WARN_ON(!req->num_incomplete_objects) ||
+	    WARN_ON(req->state != MEDIA_REQUEST_STATE_QUEUED))
+		goto unlock;
+
+	if (!--req->num_incomplete_objects) {
+		req->state = MEDIA_REQUEST_STATE_COMPLETE;
+		wake_up_interruptible_all(&req->poll_wait);
+		completed = true;
+	}
+unlock:
+	spin_unlock_irqrestore(&req->lock, flags);
+	if (completed)
+		media_request_put(req);
+}
+EXPORT_SYMBOL_GPL(media_request_unpin);
diff --git a/include/media/media-request.h b/include/media/media-request.h
index d4ac557678a7..c48cfb710959 100644
--- a/include/media/media-request.h
+++ b/include/media/media-request.h
@@ -189,6 +189,10 @@ static inline void media_request_get(struct media_request *req)
  */
 void media_request_put(struct media_request *req);
 
+void media_request_pin(struct media_request *req);
+
+void media_request_unpin(struct media_request *req);
+
 /**
  * media_request_get_by_fd - Get a media request by fd
  *
@@ -228,6 +232,14 @@ static inline void media_request_put(struct media_request *req)
 {
 }
 
+static inline void media_request_pin(struct media_request *req)
+{
+}
+
+static inline void media_request_unpin(struct media_request *req)
+{
+}
+
 static inline struct media_request *
 media_request_get_by_fd(struct media_device *mdev, int request_fd)
 {

-- 
2.34.1


