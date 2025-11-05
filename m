Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48C5CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tAp+CUUjmtMNzKtHhR3HUxY21OvHy1NQeap6aCZGgaQ=; b=i36y7S+QRHpW2l5W7r8ixrNYGl
	9N1pq53cdpSQrJr7jmPiS9VRl795cFERtQ2lIMgINREj9qczZW1HSidPVn7/Ca7V+UvXMC2yqxK35
	ycoP1TkG92vTW2hzOxcDhWAA8XdKoe/8Bc29ej9+nfS2H7Q3PjOGRpsMy59l+c9JeAVctYR0GQ27O
	/LV/jB8qN9j/w3rNzp1hhk0Ew3Hid1NNkQS38LUmkTqCaaab+HToCzQjb3G65Zh4V9KV1lAS4qJb0
	eeXbjzR5qZJB288O9ZjqpUj6dtStb9y+n3x2i89sX3gBBfTiV1cTdCfq2ZEwr9YZD5ReJcMpLx6u+
	aun7q5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGf03-0000000Dsuq-1zKe;
	Wed, 05 Nov 2025 15:00:39 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGezz-0000000Dsu9-3JRC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 15:00:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b70bee93dc4so484414466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762354833; x=1762959633; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tAp+CUUjmtMNzKtHhR3HUxY21OvHy1NQeap6aCZGgaQ=;
        b=rjI6hRUvM1g3bgzUkFpSaB1wOs6xJ4yzC8E6YPX1vcyTzXzYO/z2HwExxgVrtYoMEB
         3Nz3HVgMEdpgJQrsY4/odFTOQeVvYMJoOm4benDjRWQ7zXgrRbZ3tNM3Rq4goICqsgP2
         nTZu6nkV90weplNrtaNgfnOZ3uWGwZor8jmDEKe+LRvssNCP92+UMevwZ/uR1mFhvmio
         BIDJzrJGVlASXXhh+QCClzKiDayYzjfR29XhnWaW+dLwLjCJO0WnJu4slEypi3Fa01V9
         WZpqiboJKGp63ecTIt4s6RelB1oqhrLNWJdpYr+5gOu3SEzs+3QYkKXOYmNBWVSOMrOg
         e9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354833; x=1762959633;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAp+CUUjmtMNzKtHhR3HUxY21OvHy1NQeap6aCZGgaQ=;
        b=MHcAq+7MJ5PfviurOj2LMHfpOjKYTysAHpUQTzI6jAcS0HJQG31n5Gf8R13zRN/da0
         X/Cm470a6BkNcY2KRzInSX1/+EDaCFeB+UhpQAlZ52YD+u65HVS0hV9Gow1YMw/nhw3r
         Ce/ulAkTHFMUxC99UvCrXeh6BwwXB0oTlFa+udt7vXHOO88ureBSgOvOCwRwu6N0fpzb
         n+Ta/x2edY1hRzAtDnSBjbfox50xTXRElxNHR78oHW/W3YSZuMD5Wi+7DV9seCwrfsKM
         ZiNKGksn/mWbTgxdfth/AzRcEV14/dyOSWdMqKL93LBJwm5iMnVcRgYxLMTkC5uF9BZM
         k1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpTru4mlE+VxdXdqsgEzVsEi2oaIsIaKD63nvcxg4Gmhvjl+3v5zjmIa7pxF4zbALBbG3petuuMYBIMEdEgVNg@lists.infradead.org
X-Gm-Message-State: AOJu0YxCYBq1i8FIRE58YLfI1By53JqZ1IbjkEmMbvmLe0DnSofKQsBs
	3EQHAQGjCZSEYStO6FcM3kPJeCZk2Brxyc4rJ2cAkjuy+lixH1Ifnv+C+nSN97d2ebQ=
X-Gm-Gg: ASbGncuULQCxc63hjd2NRiB7wegDdMB9xtcikmMvAjUV0+He86ErQuwT50aEXE9uE/y
	iNQX+B8506+3rPY9LlRJxi2ecb+ERXNitcoMzf6irKEtbrexRC2DpeWof0fiiOPW9avYUs3OU3H
	j8+N1HfnrVItNRHAKrbSClyaCWAcXoLRsVLKjzvDgIlYIcEl8Jybcd+qVU4S6SzouxNRLOETFFR
	+JlMMtwFJXktLB9RgJJ0ckTCdgphGoVfQrG/NGLV6GAKtkRM41sKKBZE5JiQK5TCsnBWGjy4Mp6
	tubeyDp5kwm9Ng6YSbANSKHfvbOjXhmmcRe5Xab0gAXaECwwR7qa+AisHyNLXaXfOcWtDiJ4Tw0
	TcaelMHp0KtIqBsuBgzIPylwzPZ1Uu/y6WFZ/SmjtaG2iAkfQAmcQXymDaMTcoNUZsJ938bhuOw
	kAPo7ywb7bLLH5
X-Google-Smtp-Source: AGHT+IFFrjgNjQ+G4iB/F0l8vWOxq4uogcHRcsag/pbsbbQlTdgBJnj+pmkUkeh3w8W4XAp98H3Keg==
X-Received: by 2002:a17:907:6ea5:b0:b6f:9db1:f831 with SMTP id a640c23a62f3a-b72652bb1b3mr329736266b.23.1762354832872;
        Wed, 05 Nov 2025 07:00:32 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72596bb0f1sm393839366b.0.2025.11.05.07.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:00:32 -0800 (PST)
Date: Wed, 5 Nov 2025 18:00:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v3 6/7] platform/raspberrypi: Destage VCHIQ interface
Message-ID: <f11dd2de-d8fd-4d8f-ba29-6974ba923b4e@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vchiq-destage-v3-6-da8d6c83c2c5@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_070036_125978_6FBE8F79 
X-CRM114-Status: GOOD (  11.10  )
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

Hi Jai,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/staging-vc04_services-Drop-bcm2835-camera-driver/20251029-184912
base:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
patch link:    https://lore.kernel.org/r/20251029-vchiq-destage-v3-6-da8d6c83c2c5%40ideasonboard.com
patch subject: [PATCH v3 6/7] platform/raspberrypi: Destage VCHIQ interface
config: arm-randconfig-r071-20251102 (https://download.01.org/0day-ci/archive/20251103/202511031105.3z4Gf3FT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511031105.3z4Gf3FT-lkp@intel.com/

smatch warnings:
drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:602 vchiq_ioctl() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:1250 vchiq_release() warn: iterator 'i' not incremented

vim +/i +602 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c

f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  583  static long
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  584  vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  585  {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  586  	struct vchiq_instance *instance = file->private_data;
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  587  	int status = 0;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  588  	struct vchiq_service *service = NULL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  589  	long ret = 0;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  590  	int i, rc;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  591  
96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Thomas Weißschuh 2025-03-11  592  	dev_dbg(instance->state->dev, "arm: instance %p, cmd %s, arg %lx\n", instance,
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  593  		((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  594  		ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  595  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  596  	switch (cmd) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  597  	case VCHIQ_IOC_SHUTDOWN:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  598  		if (!instance->connected)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  599  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  600  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  601  		/* Remove all services */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21 @602  		i = 0;

i is not used any more.  Delete.

f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  603  		while ((service = next_service_by_instance(instance->state,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  604  							   instance, &i))) {
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  605  			status = vchiq_remove_service(instance, service->handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  606  			vchiq_service_put(service);
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  607  			if (status)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  608  				break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  609  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  610  		service = NULL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  611  
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  612  		if (!status) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  613  			/* Wake the completion thread and ask it to exit */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  614  			instance->closing = 1;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  615  			complete(&instance->insert_event);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  616  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  617  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  618  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  619  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  620  	case VCHIQ_IOC_CONNECT:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  621  		if (instance->connected) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  622  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  623  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  624  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  625  		rc = mutex_lock_killable(&instance->state->mutex);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  626  		if (rc) {
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  627  			dev_err(instance->state->dev,
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  628  				"arm: vchiq: connect: could not lock mutex for state %d: %d\n",
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  629  				instance->state->id, rc);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  630  			ret = -EINTR;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  631  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  632  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  633  		status = vchiq_connect_internal(instance->state, instance);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  634  		mutex_unlock(&instance->state->mutex);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  635  
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  636  		if (!status)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  637  			instance->connected = 1;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  638  		else
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  639  			dev_err(instance->state->dev,
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  640  				"arm: vchiq: could not connect: %d\n", status);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  641  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  642  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  643  	case VCHIQ_IOC_CREATE_SERVICE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  644  		struct vchiq_create_service __user *argp;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  645  		struct vchiq_create_service args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  646  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  647  		argp = (void __user *)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  648  		if (copy_from_user(&args, argp, sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  649  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  650  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  651  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  652  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  653  		ret = vchiq_ioc_create_service(instance, &args);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  654  		if (ret < 0)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  655  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  656  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  657  		if (put_user(args.handle, &argp->handle)) {
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  658  			vchiq_remove_service(instance, args.handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  659  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  660  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  661  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  662  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  663  	case VCHIQ_IOC_CLOSE_SERVICE:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  664  	case VCHIQ_IOC_REMOVE_SERVICE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  665  		unsigned int handle = (unsigned int)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  666  		struct user_service *user_service;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  667  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  668  		service = find_service_for_instance(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  669  		if (!service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  670  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  671  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  672  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  673  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  674  		user_service = service->base.userdata;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  675  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  676  		/*
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  677  		 * close_pending is false on first entry, and when the
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  678  		 * wait in vchiq_close_service has been interrupted.
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  679  		 */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  680  		if (!user_service->close_pending) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  681  			status = (cmd == VCHIQ_IOC_CLOSE_SERVICE) ?
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  682  				 vchiq_close_service(instance, service->handle) :
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  683  				 vchiq_remove_service(instance, service->handle);
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  684  			if (status)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  685  				break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  686  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  687  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  688  		/*
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  689  		 * close_pending is true once the underlying service
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  690  		 * has been closed until the client library calls the
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  691  		 * CLOSE_DELIVERED ioctl, signalling close_event.
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  692  		 */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  693  		if (user_service->close_pending &&
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  694  		    wait_for_completion_interruptible(&user_service->close_event))
82a9eb4a3561e1 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  695  			status = -EAGAIN;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  696  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  697  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  698  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  699  	case VCHIQ_IOC_USE_SERVICE:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  700  	case VCHIQ_IOC_RELEASE_SERVICE:	{
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  701  		unsigned int handle = (unsigned int)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  702  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  703  		service = find_service_for_instance(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  704  		if (service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  705  			ret = (cmd == VCHIQ_IOC_USE_SERVICE) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  706  				vchiq_use_service_internal(service) :
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  707  				vchiq_release_service_internal(service);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  708  			if (ret) {
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  709  				dev_err(instance->state->dev,
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  710  					"suspend: cmd %s returned error %ld for service %p4cc:%03d\n",
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  711  					(cmd == VCHIQ_IOC_USE_SERVICE) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  712  					"VCHIQ_IOC_USE_SERVICE" :
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  713  					"VCHIQ_IOC_RELEASE_SERVICE",
ae094de38e430e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-10-25  714  					ret, &service->base.fourcc,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  715  					service->client_id);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  716  			}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  717  		} else {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  718  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  719  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  720  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  721  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  722  	case VCHIQ_IOC_QUEUE_MESSAGE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  723  		struct vchiq_queue_message args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  724  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  725  		if (copy_from_user(&args, (const void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  726  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  727  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  728  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  729  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  730  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  731  		service = find_service_for_instance(instance, args.handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  732  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  733  		if (service && (args.count <= MAX_ELEMENTS)) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  734  			/* Copy elements into kernel space */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  735  			struct vchiq_element elements[MAX_ELEMENTS];
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  736  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  737  			if (copy_from_user(elements, args.elements,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  738  					   args.count * sizeof(struct vchiq_element)) == 0)
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  739  				ret = vchiq_ioc_queue_message(instance, args.handle, elements,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  740  							      args.count);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  741  			else
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  742  				ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  743  		} else {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  744  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  745  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  746  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  747  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  748  	case VCHIQ_IOC_QUEUE_BULK_TRANSMIT:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  749  	case VCHIQ_IOC_QUEUE_BULK_RECEIVE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  750  		struct vchiq_queue_bulk_transfer args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  751  		struct vchiq_queue_bulk_transfer __user *argp;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  752  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  753  		enum vchiq_bulk_dir dir =
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  754  			(cmd == VCHIQ_IOC_QUEUE_BULK_TRANSMIT) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  755  			VCHIQ_BULK_TRANSMIT : VCHIQ_BULK_RECEIVE;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  756  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  757  		argp = (void __user *)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  758  		if (copy_from_user(&args, argp, sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  759  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  760  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  761  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  762  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  763  		ret = vchiq_irq_queue_bulk_tx_rx(instance, &args,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  764  						 dir, &argp->mode);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  765  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  766  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  767  	case VCHIQ_IOC_AWAIT_COMPLETION: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  768  		struct vchiq_await_completion args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  769  		struct vchiq_await_completion __user *argp;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  770  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  771  		argp = (void __user *)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  772  		if (copy_from_user(&args, argp, sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  773  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  774  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  775  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  776  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  777  		ret = vchiq_ioc_await_completion(instance, &args,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  778  						 &argp->msgbufcount);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  779  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  780  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  781  	case VCHIQ_IOC_DEQUEUE_MESSAGE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  782  		struct vchiq_dequeue_message args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  783  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  784  		if (copy_from_user(&args, (const void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  785  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  786  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  787  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  788  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  789  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  790  		ret = vchiq_ioc_dequeue_message(instance, &args);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  791  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  792  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  793  	case VCHIQ_IOC_GET_CLIENT_ID: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  794  		unsigned int handle = (unsigned int)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  795  
bad44825fbf5ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  796  		ret = vchiq_get_client_id(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  797  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  798  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  799  	case VCHIQ_IOC_GET_CONFIG: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  800  		struct vchiq_get_config args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  801  		struct vchiq_config config;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  802  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  803  		if (copy_from_user(&args, (const void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  804  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  805  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  806  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  807  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  808  		if (args.config_size > sizeof(config)) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  809  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  810  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  811  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  812  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  813  		vchiq_get_config(&config);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  814  		if (copy_to_user(args.pconfig, &config, args.config_size)) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  815  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  816  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  817  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  818  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  819  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  820  	case VCHIQ_IOC_SET_SERVICE_OPTION: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  821  		struct vchiq_set_service_option args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  822  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  823  		if (copy_from_user(&args, (const void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  824  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  825  			ret = -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  826  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  827  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  828  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  829  		service = find_service_for_instance(instance, args.handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  830  		if (!service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  831  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  832  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  833  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  834  
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Adrien Thierry   2022-05-18  835  		ret = vchiq_set_service_option(instance, args.handle, args.option,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  836  					       args.value);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  837  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  838  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  839  	case VCHIQ_IOC_LIB_VERSION: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  840  		unsigned int lib_version = (unsigned int)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  841  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  842  		if (lib_version < VCHIQ_VERSION_MIN)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  843  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  844  		else if (lib_version >= VCHIQ_VERSION_CLOSE_DELIVERED)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  845  			instance->use_close_delivered = 1;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  846  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  847  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  848  	case VCHIQ_IOC_CLOSE_DELIVERED: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  849  		unsigned int handle = (unsigned int)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  850  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  851  		service = find_closed_service_for_instance(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  852  		if (service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  853  			struct user_service *user_service =
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  854  				(struct user_service *)service->base.userdata;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  855  			close_delivered(user_service);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  856  		} else {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  857  			ret = -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  858  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  859  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  860  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  861  	default:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  862  		ret = -ENOTTY;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  863  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  864  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  865  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  866  	if (service)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  867  		vchiq_service_put(service);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  868  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  869  	if (ret == 0) {
ab73dc85328195 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  870  		if (status == -EINVAL)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  871  			ret = -EIO;
82a9eb4a3561e1 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2022-12-23  872  		else if (status == -EAGAIN)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  873  			ret = -EINTR;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  874  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  875  
f67af5940d6d2e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-10-24  876  	if (!status && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK)) {
55e23aa95b1073 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  877  		dev_dbg(instance->state->dev,
96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Thomas Weißschuh 2025-03-11  878  			"arm: ioctl instance %p, cmd %s -> status %d, %ld\n",
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  879  			instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  880  			ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
f67af5940d6d2e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-10-24  881  	} else {
078666d7ee6d3c drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-12-05  882  		dev_dbg(instance->state->dev,
96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Thomas Weißschuh 2025-03-11  883  			"arm: ioctl instance %p, cmd %s -> status %d\n, %ld\n",
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  884  			instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Gaston Gonzalez  2021-09-12  885  			ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
f67af5940d6d2e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Umang Jain       2023-10-24  886  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  887  
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  888  	return ret;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c Ojaswin Mujoo    2021-07-21  889  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


