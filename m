Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72A5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doori9Bvbmf0yh+rfadTHWNziYl0BNfQpS5Q5pkaIIU=; b=2CLGfstxPl/wx0Q6uvdFgHu75z
	3rt9KGipQIofcUGtY/ufRVBB+aSD47hyN5lvti+ZDmzApblM+mC42/qTBgTrwUSBBf1Rt0zVqyi6q
	oqmvxy2OrBSAJdw3Sa7bAR5xmQ1orVS3LsjlzdyKJoBsQQFy4va/mILuy2TQOUYy8L3ZrgSgewcHb
	xh4ubLSUykFPwCxoPMWewh+AAeDyRZ2lXYmq9Q9XGa5RiQ+5ADyWtg/F6ONGi1clfQa2KcjqmOGye
	1hxRH3tUlP+rbqMuTCFWe8ERQAxq+8qWu+pSImRM7ORzLJKho0iITYYrN5ri2ULNb5YtqP7Hz1mAW
	Rl0ylhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQCb-0000000F2XG-1StT;
	Thu, 16 Jan 2025 13:46:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQBL-0000000F2SI-2cb0;
	Thu, 16 Jan 2025 13:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737035109;
	bh=D07iJIxZgL4Eb284YnQCEptX34FdVpYWwiTTYDL2kgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPMmvO8LK5AIvAlhPQDFwCLUTfmnYXxtWxtXl6syBmjm0129bgMzy+GJzfd4Ohru4
	 mqdhf+8jbskUx98gV1rT07I1ZLh18oClUUvRw7AxEaezZF7B2T1hwExSghjXreXrZz
	 wZEtIvorszfExkenmmsJxfIaOLj6P75w3s8VaxUO+8qhkROQ3SAfkJfLBZjSTrV7Y+
	 K1mEo0jps2+hjioZp9uhb9I7Zm1uxegrLNWbWCQgJ24/7a30HeqL/+i+PO0LmmV+Up
	 xhcPSqEk9K8JGZKt/1NCHjZ5D5xEm+efrmf1aHY3o7uwGflY3OLMwf5shZtA6ySC4W
	 W08BLW+aWPU6A==
Received: from notapiano (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E24A917E0E48;
	Thu, 16 Jan 2025 14:45:03 +0100 (CET)
Date: Thu, 16 Jan 2025 10:45:01 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND v2 3/5] thermal/drivers/mediatek/lvts: Disable low
 offset IRQ for minimum threshold
Message-ID: <22c4fc5a-2634-4e14-a659-1a2a6329c7b3@notapiano>
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
 <20250113-mt8192-lvts-filtered-suspend-fix-v2-3-07a25200c7c6@collabora.com>
 <90dd8d93-5653-47f1-8435-f03502e4c0cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90dd8d93-5653-47f1-8435-f03502e4c0cc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_054511_844866_74A825C0 
X-CRM114-Status: GOOD (  19.77  )
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

On Tue, Jan 14, 2025 at 07:30:31PM +0100, Daniel Lezcano wrote:
> On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> > In order to get working interrupts, a low offset value needs to be
> > configured. The minimum value for it is 20 Celsius, which is what is
> > configured when there's no lower thermal trip (ie the thermal core
> > passes -INT_MAX as low trip temperature). However, when the temperature
> > gets that low and fluctuates around that value it causes an interrupt
> > storm.
> 
> Is it really about an irq storm or about having a temperature threshold set
> close to the ambiant temperature. So leading to unnecessary wakeups as there
> is need for mitigation ?

Yes, that's what I mean. The irq threshold gets configured to 20C, so whenever
the temperature drops below that value, the IRQ gets triggered. But this usually
does not happen just once, because from the thermal frameworks' perspective,
there's no thermal threshold configured for 20C, since that's done from the
driver, the framework thinks it's -INT_MAX, so the threshold doesn't get moved
after the trigger and it just ends up triggering hundreds or thousands of times
in a short span of time, hence why I say it's an interrupt storm.

> 
> > Prevent that interrupt storm by not enabling the low offset interrupt if
> > the low threshold is the minimum one.
> 
> The case where the high threshold is the INT_MAX should be handled too. The
> system may have configured a thermal zone without critical trip points, so
> setting the next upper threshold will program the register with INT_MAX. I
> guess it is an undefined behavior in this case, right ?

Ah, yes, I don't think I've tested that before... I'll test it and send a fix if
needed.

Thanks,
Nícolas

