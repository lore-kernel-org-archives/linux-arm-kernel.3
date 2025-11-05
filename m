Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12DCCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmFotMcFPtd7mRBsLfVlVk451p+y5nFGd9HEIFSHePA=; b=Q19oIchvwwdFs0ZwWNW2i+qroR
	w+y1jHxcLJ6VZoUHLJbAzDEvxrnn+p7FSb2vLe8M7PCc23P6ZKFQ3AT80hez2HnjCEtgWpEWZuETl
	7rNKLgVBE/rP0PibvWp92BU31ooX5FtybSL7NTA/2a7NSbjFz0c6RbkY2BN0L9Qdun5P2ogS3625d
	e7YYI+Z83JFQ3OzDgtrhUXqN6gphmpVHHvbI7BibFx1ls1FLYLAktFqsYe4fj5toP+ql1LWH5G6D0
	tW8UtVqpefazBhV7KtuIXFOmGmFDKEwdR5L/I8qlSB7wgjf/4DeGrCWg2Mx5DnqAy5qmah1c+M13O
	4e6fTBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGggL-0000000E64E-3UkF;
	Wed, 05 Nov 2025 16:48:25 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGggI-0000000E632-31HY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:48:23 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b70bee93dc4so624266b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762361301; x=1762966101; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmFotMcFPtd7mRBsLfVlVk451p+y5nFGd9HEIFSHePA=;
        b=VFSO4iRrK+YZm0Yfk77lSTSG7sa8h/4cvMbzen/4McZgYsFb8NL5nWv9EZJ1C2bpxP
         xNR8auN9ynIyRYXRSBANF2YQz2rXkVDElUjfKPcrlheFf1VVM1PdtO719+b35pt/7y3X
         JO+sL+675x6OJlqvall6rr0HYo2PpG5/MqJ1lsa3zAX3tvnQw5L7/RdS/2MiFRrcamc2
         DKxIs5lpHA6klsyb1tPd6W9ang6aLCt+aAW/bwc7DJ0k9AWkT6tvHrBZB8qdQq0I0JyX
         fq8CutQ3Ma8IGeI01cQ+NyuuMLetsCKPqMxevljrj6dhhGaM7VrL0hx6juzL1xkLjpmR
         h/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361301; x=1762966101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmFotMcFPtd7mRBsLfVlVk451p+y5nFGd9HEIFSHePA=;
        b=Xq/lnyYMatEQmo/LxklTZ2BWlxNG8M42M2RVN4lJ0J1sr5APSVbHuvKuB8YLu661pH
         NJRwuIHfoaZBnStqU6bEswwqFodmKz4tqEAl8nyZPnaqQa8Fjv1jxTEohUAUfG69uvxF
         jtUS6g4GIKIeo3ZeGNFpefixu+QXSqKx/uznq2kSr6a8cgfAQjo0uj37mIZUIJud2vub
         rd0W8JtItO6I2uGxQQRgK+3X3kkg3RSNThf1rZk7dTK4Onr5Mbw8xqiZlY9tNUavt30O
         avocCLghl6YzfgE63TG7FlcLye+bsgzb1ILEGOMvWPnDbhRPk9op1uzZcu1kTYqOv/5J
         05CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiG24QuDnBS7kh4cs8oHK5PqqkuyRCi6N4bb5V0T4F4SoXAMmN7zXGZxpIy1Up/FYYmiRvvs3KmkC+LRsiOwh7@lists.infradead.org
X-Gm-Message-State: AOJu0YywAJRiCLntnJgaH3lJj7DxkYW6vA01e7Q5INYEkyQPhQh0yCBC
	rr7XzdeqGPJw/2si4rRoGXGm2FTFP4wFQkxFbveiwweZECg/tKiN03zeP0BNnWsFiqM=
X-Gm-Gg: ASbGnct5SB4Jf8Tab5KT89aCCdxPXpq4o32IL2iWLpsfpLI01lQVyMmjqtVey89bKc0
	3QufXZHsJM3fo6L/HbPwvOA3GtrHGcTwh+kP8fhOLAUidoHzWQDGtrDuf2BqgKjxCOOdUVD2oeH
	V3x3kjGfctWmJ4nmSyHfArI3L8NKyJ7aEXXlyJSTLDwtvR3wD+VddL2xZif9463wLxnxxWo7E8D
	XEQZqSvrMB31P4qH2NvmARUFTO7CRYvgyXK+UWhDIn36HfQP4zRMC1NVWX80SbSG1E7FQ0GuyEL
	J3N3xE80kj2AjW9+lYqgGe9fKsTaC6j1EYp9fLhYegGfMMisXYxJiIJyQFYJLfeMYtaWQFN5+eP
	g6WkrJnZssQxMM3Fc9oX23kGHLLNcFYh/82T0ICOprvU6vGfP6hEeD3daSw1q2iMvP9vEXaxfvi
	gfWgJZpy/W5fLa
X-Google-Smtp-Source: AGHT+IGm3Wa56XUydCTKudmGMentGaT4iUui9wuImfhosfZAtqWdEBdlJW8tn8ToaWyI3p+ndFALWA==
X-Received: by 2002:a17:907:3e0b:b0:b70:b3cb:3b30 with SMTP id a640c23a62f3a-b726567fa67mr356526566b.59.1762361300655;
        Wed, 05 Nov 2025 08:48:20 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72893cbc72sm3380366b.29.2025.11.05.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:48:20 -0800 (PST)
Date: Wed, 5 Nov 2025 19:48:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v3 6/7] platform/raspberrypi: Destage VCHIQ interface
Message-ID: <99c95bb6-6595-4b68-afa7-1614f619a20f@suswa.mountain>
References: <20251029-vchiq-destage-v3-6-da8d6c83c2c5@ideasonboard.com>
 <f11dd2de-d8fd-4d8f-ba29-6974ba923b4e@suswa.mountain>
 <CAMEGJJ1Rsjsa9CGB4Hv6ukf=xi41TTDRNf7nkrX4nQniEp+8zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMEGJJ1Rsjsa9CGB4Hv6ukf=xi41TTDRNf7nkrX4nQniEp+8zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084822_789056_9BE35B7C 
X-CRM114-Status: GOOD (  14.08  )
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

On Wed, Nov 05, 2025 at 03:17:01PM +0000, Phil Elwell wrote:
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  583  static long
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  584  vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  585  {
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  586   struct vchiq_instance *instance = file->private_data;
> > 3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  587   int status = 0;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  588   struct vchiq_service *service = NULL;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  589   long ret = 0;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  590   int i, rc;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  591
> > 96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Thomas Weißschuh 2025-03-11  592   dev_dbg(instance->state->dev, "arm: instance %p, cmd %s, arg %lx\n", instance,
> > 8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  593           ((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  594           ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  595
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  596   switch (cmd) {
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  597   case VCHIQ_IOC_SHUTDOWN:
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  598           if (!instance->connected)
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  599                   break;
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  600
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  601           /* Remove all services */
> > f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21 @602           i = 0;
> >
> > i is not used any more.  Delete.
> 
> No, don't do that. It's passed as an in/out parameter to
> next_service_by_instance - it maintains the iterator position. This is
> a false positive.
> 

Uh...  Crud.  You're right.

I knew this check was generating false positives but I try to filter it
manually.  Which is lazy.  I will fix this false positive.

regards,
dan carpenter


