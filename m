Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28201C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJzKMlAoFsqTCOtfDur8Zx+vsisRMUUea0lzAQccblM=; b=uFcA4LQgR9pWCyOh5QrmZd91YS
	U6ji0faONVJXoSUIBz5eaUYqK4EEA2oAVj/gkAQKxr/XcdfM/YpKAeJ+79txrVo8yVB+PXq5e4AyF
	aYuF8Tqt+wmS6hjE9RiTRmruNIyf9AYxknmJdfAM9MEieqiBgls9e9nIT7C9zSbbHk+0npl68Wtvf
	8j4X9pIaglpPLxH932QKK2Wx/ObUZAEw20clNZay0RTUTVi9mIuV2AsvCZiN17k+qJaAAMbqs6cFb
	1SFvQli+rpX7GbivC4C+Dr/E58YQBEiS/8AApDuaUpe+mBCLjmXvAafwlRWFZAza5Gaa8F8REjE+B
	3EIJwj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xGH-00000008qU8-2GC8;
	Mon, 31 Aug 2026 08:21:01 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xG3-00000008qIu-3PZu;
	Mon, 31 Aug 2026 08:20:55 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 0265013800E9;
	Mon, 31 Aug 2026 04:20:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 31 Aug 2026 04:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788164446; x=
	1788171646; bh=mJzKMlAoFsqTCOtfDur8Zx+vsisRMUUea0lzAQccblM=; b=Z
	EQqs4KjrYEAzn2cyphBBrALVJMuYodWKxbKxCXfJmmdvGEeOtITJ78xJ4sANY5aR
	ODMjoFaYYZ0EpKBgUHUXZEnZORhvuoY4w2F+TAluKxTCrjAHuS4z36F8SneHyo3u
	tMX/crgmysu210nuO9234/CWlakbxHbrQjhUS+V2FhtFYec6gs1eWUQph4uZPt5Z
	P1peQlS5aHvnalc5VbGPWB7EU/sEU9Oi4lzTS8bNQIPmz1V6h6BE9ipMunRmoTCo
	zfwJX/Lbxbki494RtsBOfsgs/9uXpMUuGpaCllN/P4IebjMi0PDDYmJWJaHlk0yB
	X+uj3fEyAJpMuVw7L1OYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788164446; x=1788171646; bh=m
	JzKMlAoFsqTCOtfDur8Zx+vsisRMUUea0lzAQccblM=; b=Auryg44p6QAsBkDIW
	MFaxdRgVpf542XchrVK8wMys8Ot9D4GQ+G1vupjCsWVQ6+i8vsw99uzcMUjJJJrh
	96PtLfPItLzpFALnsEBG9EU+xdOeZoZVBldxAxn9j77wD7D64uJL0fwlkGPk1rL2
	x1Pg55yCDya81y80qhciY0pHifZW2xDylwqfipNioSuDRe+KcIXTXWaw2+UwK6/e
	8H1gbOjSw6db9hY8UV3XYNFz15tLF5JMrwzHWS5zmoHnawMWD5JvJDta2mzxmmbu
	t+xlZjBkNx3BnmMe84LcVW4UUqJf/+eTIaNY6BaMGo9JmjgJGgawZJ6wu+jlUk1G
	t8Agg==
X-ME-Sender: <xms:XjmVao-zME4l6QYTsD0zOrWqsyIPj-9cT11C9Nf8bcJW6QZKaQj6qA>
    <xme:XjmVagltxbZWLHC70UqdN_Pr-BoGbjYCtJ3SNtHb1G8gyv6YW8t2wfLBlcjLDLL2S
    xReAW2YCyiSEPTRLT0QGMA0HhMgNyfRSusGo3HUD3ZtfgKuCf0M7D4>
X-ME-Received: <xmr:XjmVarWJKdswpkafnMvo2ltWGFBiTk0DhPMQflrLYClN0fcxLOjNKDCVmhXAvGdILWzG8Ikp9A>
X-ME-Proxy-Cause: dmFkZTEDSj4wf5uUH7b4VW5aGgPjNYkwheCnOBlFEaSCsKAZCO4DaPX41bDfdUe6cEq7XV
    f/SxT4jjt3FgAg44zOlOGDc1jgWZqzUmYg1MOeAIqeuz86G52KG6X2EgZlGQI9zLdkd+0n
    Wbv1J+k6GhdWB4CQjKDHdSduI5SClYBbcPC+mMOg7aGcg9fw0WzllV0BJecnkxXDyJ7th0
    DFxuYmsvE+hnSyGGN6geSTjCaHWIZE5tWcxAqdIf8erZijwCLNDVRRDtjdlPwOQLoHh2VV
    LEBek4TkRF0y4AtOKmEoZmiBIX4K9KGufMIc+sck/DxIta7+M76kGmE07PnV6ZDYC9/dQL
    mb57IWomXJfh4cx8AcF365LiBaw8ewMs7088Ac3YlDBmqHfUnOUZTbFifdU3iuj1jr+MmB
    OegAlD62xTSKDSxGR6+/6mJQvNjy91cjW5GIddnmGqCpGsmohvE9YJ1X44F07tSzJXyhxA
    3775yyYoj93sBx1iCKwQ1k+3NHqXEDQRLsIPQuVetkhlzC94dMb/NVBufHhtzIu5vCVmDZ
    IKu0nXp3muIkQvF0fyMejMZxk/3FzYySwsjtkpw18JUwAMChNXeovifeCm7OTtnAiI8F1Z
    6KboOjiGxKA/NZ1osKPnbXn6JvNQ3k4Xak553J0wE0s9Qk2sToCjctn0dLZg
X-ME-Proxy: <xmx:XjmVakr39HJHbDVGxSXG2Z8qvvLnUWzPVZHitt6wSyTTDCBy1nLZ6g>
    <xmx:XjmVaqWbOWNOXYOGiqGKFtEuieZuw8TDslbp2OmQWqTqMvv83Yt48A>
    <xmx:XjmVakDJU-Zxmsuln5-QMaTlUHtec-SLEalLP2L-nRFeFjP6UtFp3Q>
    <xmx:XjmVauXrzH30UDJZBlMDSnfRooSZk_CisSGrMFUu6Sw2Bm2RpwH3eA>
    <xmx:XjmVaiYzBNrwKIWjMbN9wu_pNZB_a6JRvn3jbfxaEvNkUEERsVcsKA3C>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 04:20:40 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v11 04/14] accel/rocket: let the core suspend after a reset
Date: Mon, 31 Aug 2026 20:19:46 +1200
Message-ID: <20260831081956.84871-5-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831081956.84871-1-gahing@gahingwoo.com>
References: <20260831081956.84871-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_012047_975248_F3518062 
X-CRM114-Status: GOOD (  19.02  )
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

rocket_reset() drops the in-flight job's runtime PM reference with
pm_runtime_put_noidle(), a bare decrement that requests nothing. The core
is left at usage_count 0 but still runtime-active with no idle request
pending, so it does not suspend until something else asks, and on a
platform whose power domain does work on power-on that work never happens.

On RK3576 that work is a bus interface reset the domain cycles when it
comes up. Without it the NPU's IOMMU stops answering, and the job after a
timeout returns a surface of the output zero point with rk_iommu reporting
that MMU_DTE_ADDR is not functioning.

Measured on a ROCK 4D in one boot, three runs, one variable between them.
With the bare put the core reads runtime-active with its rail still up
after the reset, the IOMMU reports the failure on the next attach and the
inference returns 0 of 128 channels. With the reference put back through
pm_runtime_put_autosuspend() the core reads suspended with the rail down,
there is no IOMMU message, and the same inference returns 128 of 128. A
third run repeating the first failed the same way.

It also matches the put in the completion path a few lines away, so the
reset path no longer leaves the device in a state the rest of the driver
never produces. The remaining put, on the error path in rocket_job_run(),
is a plain pm_runtime_put() and is left alone here: it unwinds a
get_sync() that never reached the hardware, and changing it belongs in
its own patch.

Igor Paunovic ran the differential on RK3588: 45 induced resets across
three cores, with and without the two preceding patches, and the domain
dropped every single time with no MMU message on either kernel. So this
is not rocket-wide. His conditions cross a healthy block with a lowered
timeout rather than a hung one, which he was careful to say his protocol
cannot settle, but it is what scopes the change to RK3576.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.com/
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2
---
 drivers/accel/rocket/rocket_job.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 3c0ed4605..a89ab49e1 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -406,12 +406,12 @@ rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
 
 	/*
 	 * No handler is running now, but we might still have stuck jobs. Let's
-	 * make sure the PM counters stay balanced by manually calling
-	 * pm_runtime_put_noidle().
+	 * make sure the PM counters stay balanced by putting the reference the
+	 * job took, and request idle while doing it so the core can suspend.
 	 */
 	scoped_guard(mutex, &core->job_lock) {
 		if (core->in_flight_job)
-			pm_runtime_put_noidle(core->dev);
+			pm_runtime_put_autosuspend(core->dev);
 
 		iommu_detach_group(NULL, core->iommu_group);
 
-- 
2.43.0


