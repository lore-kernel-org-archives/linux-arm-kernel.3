Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CABCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9+YREs/dwvkAURlYBalhERi7T5HA8/ejvJOwTN6088=; b=jSPbSr0xoKf/tOG6eTT8Je2bGV
	+J7oQmWTUFTAfyeLUwCcT4R0OnOW8BKJaoYcbiwEZEL/ZbxHvnIVL+221ScwpwyOKab6ou0GMsZVD
	okOX0kKtPbVrUbXGRvzQPabJUtPOfhn6X08vEsvPaZyZYVcEMOuXk2t+Y8VUn9UMrLbtoxOiwNgF3
	UZUYIN9otvtSWGz5NxVhJM0aw95KsAzd0D/uwnkAmOnFILrjln5TPGQdUpPqrvlSYyjYjtSIbkZlS
	l/zSWw6ly47jgJyG/b9mzpDTqO43WFP70iMbTQzH6GVk3VpjocJCHMAAtbdZRBGqGYCEebBDFgDdY
	MFSLByCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE50j-000000016al-2gNO;
	Wed, 29 Oct 2025 12:10:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE50h-000000016ZD-2YyG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 12:10:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47117f92e32so66382625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761739837; x=1762344637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9+YREs/dwvkAURlYBalhERi7T5HA8/ejvJOwTN6088=;
        b=CTtRQPim1KHmp5AR+O7GcFZdmJD0GG3cc7ioEjWjTkjqulaVHgBmT/iEQmUa9IbHuS
         RhZnu1l5CvaXN3xEGeOImBmV31f8+ThU0gAI0Z6jdzgwErNd+/DKkfAjrPNRoLHS4ola
         xnrYMZ6Jd3tDGWBxWraCSL1unv3I83UnoSawa3+AAISEX1nWMn32fxL40FyUYI2bG8r4
         Vfhy4MmEkyduXXi0Yzsl4OapiXr7+7czJCsnm4YSfZhCVgKpiYEYM88+bVfgUZel6rKV
         wU3hSbbtFxdAM3lOUCCSc3v409mHnvimkOqE+kd/43agA7QK3RuTTwEgIOnEwTEOflbj
         DWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761739837; x=1762344637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9+YREs/dwvkAURlYBalhERi7T5HA8/ejvJOwTN6088=;
        b=QoZ/e57LFmBklUw489S4/hN+4L+bcvT6T5/JLOPL0I1srgp3RRB+7kNKSmM4Izb61g
         KGBYBd5tLxTkSyHU679W/OXlgrYbVNFOIVa+r3a3bBou3GJio0Ei12mnZbGfj0l2CzJr
         +AIBzOjjOimYZ6n371cXDdwx9FMkmAaedjxwNrRipsdirfen48e9Wot0iKaf9Ugtic7x
         /kBhhMIRQu/rY6Iqut0R0UMUkjcDHKR4zuVu/v//xL2eUC3o5Se36DyscnsNnXUm76iY
         +fFUTYctE6b7q1NCrjv1XLl4tYzoRYegB27LX/wmpZDtWiA1R+xSa3LuvDluVi7bg4fL
         b/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUuuQTUhg6wIzF9pJ0nmS6CwpnA/VwrhA2PO+h8QCFxAqkaKDyjDFbZCq2QAhZ8Lqn/FJi1cWgCPofv+OPgkN4O@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqr8zVLNZXFGnbHD5nYhhPfq5XZuyi7l1VPRoH3f+PaXHvM82q
	A9oO6HWh7xegSc3K6lmRTx0aGpKr/vaq9TZnRLCK8789g3g7e1hOV4dltXf6tJCyYYk=
X-Gm-Gg: ASbGnctK06vZnQTJCxs3O28NOGZboUqLaCd02hKD4NSLG/QNkDaRobvs9P3aXDGfr8M
	C8qETavg1tokbiWJY//Fa56WCjajkn104CqhTiy4WFGGfDJT5eW9co6s532ML9Qxmdn5EPnchMj
	ZqeERvem0uNwXPc41/o5M15BZsMLWlUGrAhCV5kd3Um9NtJWOivA/EQBR2AS9qu7VCUDfhmJR4w
	6b+ilCje0gXAZx1zeOlNzllNW9KvNTjd5fH7TXOm1++rod7TUjY96tThXvSmbvGyhDTFGPVsVol
	tuPMkJxuPiGWiOykHbzeKSG7/EC4wEPjiIVE6Fbueu5XkkvLAHj1Nf6c+7Yd6WYRHbRLlBwa7OH
	AqHHi0LHrkc7/UzY11d8TSirXj8y+oS3/r00qxI9kbjvKz4AQPuoxIGkpzlD6CUEj+OdMDrYk9a
	m9siXwvKvMz8Qx5str
X-Google-Smtp-Source: AGHT+IGIDloDBN8XL8rmy10flsio+t482MTy1ZQ7mnd0IkV1PLp8bTgCqmolXedNqKzaaInabxjXJw==
X-Received: by 2002:a05:600c:528b:b0:456:1b6f:c888 with SMTP id 5b1f17b1804b1-4771e3937a8mr26462945e9.23.1761739837097;
        Wed, 29 Oct 2025 05:10:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e3b68fesm44788135e9.13.2025.10.29.05.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 05:10:36 -0700 (PDT)
Date: Wed, 29 Oct 2025 15:10:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v3 0/7] staging: Destage VCHIQ interface and MMAL
Message-ID: <aQIEOJUHdVMriz7S@stanley.mountain>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_051039_762143_00A50E92 
X-CRM114-Status: GOOD (  11.28  )
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

I did a review of some Smatch warnings.  These aren't published because
they generate too many false positives.  Only number 3 and number 7
are actual issues the rest are style nit-picks.

1. drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2728 vchiq_add_service_internal() info: returning a literal zero is cleaner
s/return service;/return NULL;/

2. drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:408 vchiq_shutdown() info: returning a literal zero is cleaner
Delete the "ret" variable.

3. drivers/staging/vc04_services/bcm2835-camera/controls.c:198 ctrl_set_iso() warn: array off by one? 'iso_values[ctrl->val]'
There seems to be a mixup between iso_qmenu[] and iso_values[].  The one
is only used for ARRAY_SIZE() and the other is never checked for
ARRAY_SIZE().

4. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:337 buffer_cb() warn: can 'buf' even be NULL?
Delete the NULL check.

5. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:513 start_streaming() pedantic: propagate return from 'enable_camera' instead of returning '-EINVAL'
-       if (enable_camera(dev) < 0) {
+       ret = enable_camera(dev);
+       if (ret) {
                v4l2_err(&dev->v4l2_dev, "Failed to enable camera\n");
-               return -EINVAL;
+               return ret;
        }
6. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:576 start_streaming() pedantic: propagate return from 'disable_camera' instead of returning '-EINVAL'
Same.

7. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:881 vidioc_querycap() error: uninitialized symbol 'major'.
   drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:881 vidioc_querycap() error: uninitialized symbol 'minor'.
No error checking on vchiq_mmal_version()

8. drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c:1276 mmal_setup_components() info: returning a literal zero is cleaner
s/return ret;/return 0;/

regards,
dan carpenter

