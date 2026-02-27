Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B015FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=; b=KqCB74UCv3NAVLE53oYgDPE6tj
	AI39pVBzARBSBTISh/Xa08QbS0Y6M4BZJMB8AapMcuUWUK64732oXUiCFEWqlvT1+YvT93Yz21ZM8
	QoIOcCDrStvfeIbcQ58/SJJzcHtRnpq/+cQP+d4FMcHDhG8nHx+xfZjAcWFlM+e8GQGJP1+7lnZlQ
	VUT3fRbg8j5XFQazoQL7kWK/0yvT8QthPJ5/q/7sEnJXt8trPzj/cv/ECk9TDshFdG5uRQmx3nlqg
	MP7N4MfdkHXRn/Lm4yvL9O91S/kNm01iFpV/+/Sn/XOx7l5DCTVrq9eodHTBnQ3azikYije9PizfX
	GMq3bJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WE-00000008nKj-2uyR;
	Fri, 27 Feb 2026 17:20:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1W8-00000008nGE-3lvA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:20:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48371119eacso26331695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212843; x=1772817643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=;
        b=G8P/4C/CbbIynpk73Lau4DXTrcEUlePmykdjeMd/zPVKeRCZfRNDWK/xCIlu8Q/7J6
         /mMyukMbk0yj+/tp7h7r5tjczaA+B0E3J90RMzuhr6Tk58kgutjp2We+kggtBujJUjuV
         EE9oRYoKsOkkAv/A0URTT5jxF/o/Y/ZHi2pWM6J6e4eJonJbt5hhSaX1orN+FyRvl+7p
         dmTFv86iyp1xV1ZILw82zH8C/DoxRFZA4/2PV0MuJ+Dna08ed42peXtZyp93HDBFbgXN
         /GP4vYlh3Mc5+NwMi9w7EiPAEsKFjhTpW+zpv5yUp5U/g0sD+rF/ZFezfil0rJ0IG5y4
         gubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212843; x=1772817643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yNaltXKAWAjQbwu3MqBmJgovVgpV61nuOt86Xr0pRVM=;
        b=thQsWLSSfMboWBcZ81jhwpIhfEdpk0Op4G8ZM13gFprtC8K860X2aN2+Y/hlUMifOw
         5nxw2FgsbFlyWVzXHb6DWFaoCB+BKZozTysgHjPZ/tZcH1JfG+acTCP6Q/T/31p/TyFj
         qzw4lgTILK1WkS8R5Ob1raC0tkOqwYEQFwkRHmbYACmqqOEHn+LqWbES0/jv8akXpn/I
         qNoMee7MImaof1nzUbz1QKEFP612rJWdzPHzBKjUEEu6fOdeWXofMuzAHgCH6aDhSzCe
         3nRI0c2e10NxTNLYC1HKFMYGEGedOQ/P2MQ+loF9VzpqP+gUxHoMJCE2VfbN4/hVE4F1
         1ztA==
X-Forwarded-Encrypted: i=1; AJvYcCUYgSB9qLQ5H9PD3RjG5x3SwSiVnROKwDShXrEKeyD2oxDZSgVUVUWuPadpUhgM/5LMlQXDbIP8x6ZFkZHFh9bY@lists.infradead.org
X-Gm-Message-State: AOJu0YwyGhPfJxdDm2Xig6G+Luzb0YHgbYhl7WENVxT63SoEBYetQ2/N
	FhmnMxeILvHAdYjiihtmv1GcyZ8mC6+TziqNTB1Br+WcEAuu5g0G1nsiLZ74GzlMiUk=
X-Gm-Gg: ATEYQzzk2sLUgazUEBFuXVK3jPR1a4/BuetarVUqQrcHJ1HBFnKt2h0pH6h6hiMMxVM
	fUai+y4WJJ1jCub8zaZ70R5b2t5FqvewkIAdX75xc1ObBEr6/y6GhQWDdnstB+dpL+kz7mrrIH6
	7ulpgDh3QHXLUOnf+eADs2Ni6o1oJpkh6/yg9uia7PCFMfK8wzvkWJpX6AYwNAS3keg+AN+vZA7
	EY9xQKnUD0lvd+Pa5F9w4dOD+DzBrEQX1SAL2TE4dNmd6f/kM7XR/B/vzqCyPug285jbhdXL0VB
	KO5/YkL6l+hL6JhlbrzK/8SUf+wEhs3RtX60OBi8Xe1zHEI2JpwO9p6ZkAlNhHwbqG3ikxkXOZA
	361n8JybDYnjB9FY28SxyotAVMvwC+29iE80FIy5dDD8zw+kmUlf4QygXxRXcOpK2yjWoQ8cGY+
	6TxKKlPmgYy578nA==
X-Received: by 2002:a05:600c:4715:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-483c9c2a51cmr54872485e9.33.1772212842981;
        Fri, 27 Feb 2026 09:20:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:42 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 27 Feb 2026 17:19:06 +0000
Subject: [PATCH v5 1/6] docs: uapi: media: Clarify HEVC slice_param
 bit_size, data_byte_offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-media-rpi-hevc-dec-v5-1-9bb3fc1816de@raspberrypi.com>
References: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
In-Reply-To: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
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
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_092044_977369_E84DF7BD 
X-CRM114-Status: GOOD (  13.75  )
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

Clarify exactly what bit_size and data_byte_offset mean when there are
multiple slices in the bitstream data.

Signed-off-by: John Cox <john.cox@raspberrypi.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 3b1e05c6eb13..a54e8ea29440 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2399,10 +2399,12 @@ This structure contains all loop filter related parameters. See sections
 
     * - __u32
       - ``bit_size``
-      - Size (in bits) of the current slice data.
+      - Size in bits of the slice_segment_data for the current slice including
+        any emulation prevention bytes.
     * - __u32
       - ``data_byte_offset``
-      - Offset (in byte) to the video data in the current slice data.
+      - Offset in bytes from the start of the current v4l2_buffer to the start
+        of the slice_segment_data for the current slice.
     * - __u32
       - ``num_entry_point_offsets``
       - Specifies the number of entry point offset syntax elements in the slice header.

-- 
2.34.1


