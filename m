Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC07C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=; b=ZSZTbzQls9HTsKmhyaOI6atfsZ
	mmxpOz9eO7W6OHMAa6qHaH7fkbTZYLVuOKJ0zzdL1M6VLnBbimwhEMLlO/ISL1I96fB/dpuxW38z0
	+19kpOPLc31m6laHKkJ3rVj1TbAenM15K0/Jd/m4stDDBEAbRHqQF/L1mEVmDrqb64ldpFiyEVAJt
	r+rKuk8sD3JD7WEk1iiMFPt9C3nfIZItrvqnwKn6bauZudzyXfGRR9LSK5onlCVz/He2ZJLRVF33/
	WA9b3Xx5x3EnMEwfjRwPmgRcq/KL4aJAbVyAYMNdEwwraBynkuzFZ0tu1xl5U+qZWaWyEk5fugsDe
	JUFFdXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Nre-00000002zEH-2PfR;
	Mon, 14 Apr 2025 17:44:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4NpL-00000002yfU-2mtz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Apr 2025 17:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=; b=bY24G5CeWggKfwW9zfXdx4oFEH
	BDBLDbsxXFqU3EO5bWxZUoGhAv/trpms2oy4Sa6TDPr6fmEuZSLw33snOa6dQnKYkzAT4HL/yDTz/
	uM/SVbKd3C18xkiVhxSZ+VdptuIkH6mCj50KfJAUqUwJFPhL/CFMNtfCuST/++YhGOh2+3y9R/7DG
	1h4aciPQRjmD+bMatQJSngyPyNks7K7XbCtDQ54pr/CLbo6pZWuAOJ8pADussyx4ZEFRtaNhu9wQk
	RssYh4ly7mxVaM+PrchWv66oLDbY+eXrAM8ITH63Gw05Yk9qjn+YSpjmHko8WAOdeI1QHpaLCIqlv
	uVdWXfiw==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4Np9-00000009kRn-002W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 17:42:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so49946515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1744652519; x=1745257319; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=;
        b=Koyio3IP26rGEvDnb5QmgUneJ18J3EUJucNKhz6c2l87CQNX938Cs56r7Y3RgqSwIa
         ppHnPPggtcvPW6Vx98VvByRBotI/ngh9glEJKTizcN2UHULMwaqUZQf4vAY2Yg6G4rtF
         LWjBFVme++qbgYJ0mjhdQA8qNZsJSgiBZjPoUwoIWmDltY1o7NRpgQDMM9co3tmfOJEN
         kjmK/ZqryHJzHVXFCui9QjY8JozheDdkYLwEv8A4K9Rnf8Fx51vOGdIO20mQ+TJGY5iT
         8ikTqbagt8cOf3BKQYzime7EnKlyGxcDK6WlJPJYE1sbLUHWsKBGQAhn+HtfKncFLKPj
         DZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652519; x=1745257319;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0NiqX3kmmnvN0D1p8k2XJtWrJOkDyGN772Tt9wsVFQ=;
        b=R9PfH/1hknQQnN5w/HlM5WaA78RPA5fpQVx07gRydzyHInIdbSLxZ+x6Z3ehRi1f3m
         clz8U3FCfbnG8U0M84/pm/2Nykew68zC4v1jQm/BI+f7BN60hL1B012J3f2a97F3yqeW
         Wdb58U4LoneWhtqDNt/IulZllrCf3cqqaT43HreBg0hfLAb8dz6bvvXUuBsZJ8ITf3C7
         RUvvTdTF3A1br4Qbk2w+RfJnsSJX/27dJIB0zbCdNmcg3HUanFCTvDeUay4WJ92usqXQ
         0LTsYgfT6hUcYhs/oKcTjWBpfLW9AP7DWFcDhlm8IoyXQwrKjpT68swTRRbhM61ZBpbM
         Hu9A==
X-Forwarded-Encrypted: i=1; AJvYcCVqWCF5+2S+VRW0Q6iFhftfGfGrJoVkhFW3YO5ddVkIDzFg9/hJKB5aXacLnft0zz7BE6J1QtyM8aG5pTVRIMQO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs/f6PciS5Qy091PyBVAoqWpfDyILIG5o44HjECvzudWhTHGg1
	jsGlZ8OuXKPo0xfc5eP7P5yohKOQcYarBTceNpukMlaDQHGmW561K+18x+oVKGM=
X-Gm-Gg: ASbGncu1z/sbXN+cw+46yTl6w9W8v1pVAaxi2q8IT320coir4wWykYC+1oATrE81Va6
	Al9V+I+giaognYlOYfcjD2tru2Kip9TenaPlPUytHl/UUBxdntmfENaXmrD9aGAPkkqRz1zud6B
	G+8H2ZrsobhWQ2vISqRozdoqBpbxFTFrk26MxZ1lYyfZG6oNg6hpJKYjiU6/RUZEdtX9owPxz9v
	tgs5W8s6gx4P9TAH6a0+Cq9jYYwjjebQJ/nSGQoqEXXJyocUcuU77lUKmgSBlpxRa3xmABE9lM3
	Qsfj/LlXzoBZ9jnhIkF2iBSJeadZI+/e7rMnlk3T40g=
X-Google-Smtp-Source: AGHT+IGLnXM1BCPUabzkGT8/AC2HrOP60k3F3Sd19EtJp1J2kT6z69sfo+nXbu/QtW8zZo8TdUB2dw==
X-Received: by 2002:a05:600c:3b0d:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-43f3a9beb77mr127249525e9.27.1744652518940;
        Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm182367365e9.38.2025.04.14.10.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:41:58 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 14 Apr 2025 18:41:47 +0100
Subject: [PATCH] staging: bcm2835-camera: Initialise dev in v4l2_dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIANpI/WcC/x2MQQqAIBAAvxJ7bsHWguor0SF1s4Wy0Igg+nvSc
 QZmHkgchRP0xQORL0myhwxVWYBdpuAZxWUGUtSoulKYzslL8GjsRq1u8KpXwlluNK0zrtPakja
 Q8yNy1v96GN/3A893aqlqAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_184223_566969_7E5178CC 
X-CRM114-Status: GOOD (  11.65  )
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

Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
vchiq_state") changed mmal_init to pass dev->v4l2_dev.dev to
vchiq_mmal_init, however nothing iniitialised dev->v4l2_dev, so we got
a NULL pointer dereference.

Set dev->v4l2_dev.dev during bcm2835_mmal_probe. The device pointer
could be passed into v4l2_device_register to set it, however that also
has other effects that would need additional changes.

Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Noted as we switched to 6.12 that the driver would fail during probe
with an invalid dereference if a camera module was actually configured
for the legacy camera stack.
https://github.com/raspberrypi/linux/issues/6753
---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index b839b50ac26a..fa7ea4ca4c36 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1900,6 +1900,7 @@ static int bcm2835_mmal_probe(struct vchiq_device *device)
 				__func__, ret);
 			goto free_dev;
 		}
+		dev->v4l2_dev.dev = &device->dev;
 
 		/* setup v4l controls */
 		ret = bcm2835_mmal_init_controls(dev, &dev->ctrl_handler);

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-staging-bcm2835-v4l2-fix-b8dbd933c23b

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


