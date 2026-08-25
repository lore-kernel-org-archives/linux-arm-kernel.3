Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B47C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 03:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:References:Message-Id:Date:To:In-Reply-To:Cc:
	Content-Type:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hGIWtKmuPfKNxU1ZrkJYDJd8jXk6hvJToJtt6nustk=; b=YBEV7KfyA1qw8X
	6qy/IpsSzwUaW55K7v3xzoF27PEmkUaQ8bONpHJRATqoYdwiq/+Fx6J3ROyFE8oZwS+2Ei2UipGzL
	2RFLHfMbqm08sWC4z/pZ9vPIlg7kYWK8h0E92cP8d9dXaUp+bcBOZ1IyYLHdwslrPzUtAxEFugDC0
	AHgB5OHvJl/Zw0+iMB0ZK6zkNUb5citjsNLvvuoZZk1jiMa+d6Owf6Kqnolq6DVHl2e5BdbZY5DAZ
	2sH+Q7V8cFXXo5O/Bb3eRVCLwnHNwwk/As+phIvM4J46kj+AzeBNBn/kk5Nry96brFgYAoRtxIU8m
	4H9pRODQquH8Wal9XxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyi0l-000000006Qa-2ito;
	Tue, 25 Aug 2026 03:39:43 +0000
Received: from sg-2-4.ptr.blmpb.com ([71.18.227.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyi0i-000000006QE-05Nh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 03:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787629169; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9hGIWtKmuPfKNxU1ZrkJYDJd8jXk6hvJToJtt6nustk=;
 b=hWxRJq5Md8x3lOxz3clKmBlJ5j4eJC+Pxt8nU0L//14h6iyx3Ul6M7L1a4MbsKsPxcSvrb
 fKu53zejRIXhnx0oq+mI/2MWmOgz0oPEduVshMm5CczrKyfIcnzbVlcoOW0BX47Pp0fdfJ
 FBnPVU80rDgXsWuacpIWc26+c9HCZBRJ0QQmlWYvUBgzyXKOunJTFZyMI9JpspUpfW1xrp
 EgbSvBxiMOq3zsPk1nbN2iqDAwsdUMrDse/AS2NhwR4LKf5NFm5iD4sP0+dVDYdU6nfN5C
 w+56gtA3dotsDZ7rrei67UnkfxMqjGFbjawn3PWpoOzEb33KnjUAIHqG8I2EJQ==
From: "Shengzhuo Wei" <me@cherr.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26a8d0e66+e0f32a+lists.infradead.org+me@cherr.cc>
Cc: "Shengzhuo Wei" <me@cherr.cc>, "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>, 
	<imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>
In-Reply-To: <aoz1dUszJJv80bkj@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Received: from pve ([111.42.148.52]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 11:39:17 +0800
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Date: Tue, 25 Aug 2026 11:39:14 +0800
Message-Id: <ao0OYhW1YOtnWMdG@pve>
Content-Disposition: inline
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc> <20260825-media-timeout-work-v1-1-ebfebbeb6c31@cherr.cc> <aoz1dUszJJv80bkj@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] media: nxp: imx-jpeg: cancel task_timer before freeing ctx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_203940_261301_F0B9BEBB 
X-CRM114-Status: GOOD (  10.73  )
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

On 2026-08-25 10:56, Ming Qian(OSS) wrote:
> Hi Shengzhuo,
> 
> Thanks for the patch.
> 
> This use-after-free has already been fixed by Fan Wu:
>     https://lore.kernel.org/lkml/20260623103031.3051-1-fanwu01@zju.edu.cn/
>     [PATCH] media: imx-jpeg: cancel timeout worker when streaming stops
> 
> Regards,
> Ming
> 

Hi Ming,

Thanks for pointing me at Fan Wu's patch -- I had missed it (it is not
in the 7.2-rc6 base I worked from, and I failed to check for in-flight
patches on the list before sending). His version is also the better
one: placing the cancel in mxc_jpeg_stop_streaming() closes the
re-arm window that a cancel in mxc_jpeg_release() leaves open, which
Sashiko also flagged on my 1/3. I'll drop that patch.

The other two patches in the series (hantro watchdog, mtk-jpeg
job_timeout_work) fix the same class of bug in different drivers and,
as far as I can tell, have no equivalent fix in flight. Sashiko raised
one real point on the mtk patch: jpeg->job_timeout_work is only
initialized on the single-core path, so the unconditional
cancel_delayed_work_sync() in mtk_jpeg_remove() would hit a zeroed
work struct (WARN_ON(!work->func)) on multi-core variants. I plan to
send a v2 that drops the imx-jpeg patch and guards the mtk cancel
accordingly.

Do you see anything else in the remaining two patches you'd like
changed before I send the v2?

Regards,
Shengzhuo

