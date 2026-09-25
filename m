Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EBBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNgcmoTAloeowmHUNmz4bNSxZPU+SKZPCG1qfNB7cQ0=; b=aX3sNrA1lSAo4sstUz6228cnSK
	NmElwyExbkYdlNkOH6meuEUs917keCcv1Un8HbTG60ha7jWhIPylL6sKU+nhPPG1IbEtW10GWluHI
	CQwbZzcrztazgO62WInnwK9QOp1E/16vC5Hl5+0Shh40lBRjTkbsi3sjBVDkXnJW9YZu72j2pC6kC
	T/rTKQSKxoHS/HOleKwtd/xARS2Ip0Gkg6tu+lwfzpnywGg85RlCpjmdo5NIBaBxIGu5o2N7ExzBf
	I0TWxsZMJ+14ZwzcUIh6QCIh+ZzVM15mq9ob5hbyq0eCyWWN3+jzrU9kJ6sthkLiS4VE1+6lYO9Eb
	6n90No0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABNt-0000000EFGU-174J;
	Fri, 25 Sep 2026 19:15:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABNr-0000000EFG3-3QN6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:14:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD25860136;
	Fri, 25 Sep 2026 19:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A661F000FF;
	Fri, 25 Sep 2026 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363698;
	bh=zNgcmoTAloeowmHUNmz4bNSxZPU+SKZPCG1qfNB7cQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LZGvvyIxiNWJZjCtd6ZbM5i121zIeALk94bSDu6UNfB/8XmteDrSkiLGcwSPnwFHG
	 2OklXmL/E3RnXEznUsfjMqxK+A1NT3V8YAkItzfsmilkFDigM3KxusRan3y181dgOE
	 f8IXw+KRfdpaKEATK1iHX+0a0gcylYVUjHN/PfnlZ3sPZDpyFLnwK0gsePN0tOTK2w
	 RtlrBlUYA/mk8SmxnGl7SzKiCXwyMWBDjCQSdGzoO3GGSckrl3dZJEbrS5JkZwKjwg
	 1ZZJ5KPZ8tuK/jmXzvwnMz2FQfqoEEjHd10TouHvfF9IfZTkIjUAgNtsWeqqvpteTJ
	 aYZS89yzKkYlQ==
Message-ID: <2bcd44fe-eaf8-446a-b825-9fbe0adf7c31@kernel.org>
Date: Fri, 25 Sep 2026 22:14:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atmel-isi: release unregistered video device on
 remove
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260915112511.2397941-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260915112511.2397941-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/15/26 14:25, Guangshuo Li wrote:
> atmel_isi_probe() allocates the video device before registering the
> V4L2 async notifier. The video device is registered later from the
> notifier complete callback once the remote subdevice has been bound.
> 
> The remove path relies on the notifier unbind callback to unregister
> the video device. However, if the remote subdevice is never bound, or
> the complete callback fails before video_register_device() succeeds,
> the video device remains unregistered. In that case the unbind path
> does not release the object allocated by video_device_alloc(), and the
> remove path leaks it.
> 
> Only unregister the video device from the unbind callback when it has
> actually been registered, and clear the driver pointer afterwards.
> After unregistering and cleaning up the notifier, release the video
> device directly if the pointer is still present. This covers devices
> that were allocated but never registered while avoiding a second
> release of successfully registered devices.
> 
> This issue was found by manual code inspection.
> 
> Fixes: d12c9088c0b2a ("[media] atmel-isi: remove dependency of the soc-camera framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
Reviewed-by: Eugen Hristev <ehristev@kernel.org>

