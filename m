Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7BFCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auDnTh/G9z3Y/t2W15bb+vq1E6EQIAIJTktRaItnI50=; b=dxY7Jj8oi/gfB6Zv5h58fJvoVj
	TLwbxm7nlY2zLOB8LcOd4rLk790mijfRQGbieQlq810ggRTMb/IoerQXwgqPTVn3tNfgVtkE2o1iy
	STGdVOyHDtnCdSMcqde9cf7sdppCQjQ+4F90Ex4NNjwIIDrC6eU/HI+lI4WOEIBXZgO1DZ2hY4mtg
	vLyEFoXeQAKMi2+RwXvhNTY8+vji3sdUnQ/BWwUbbGWJpLUPvJhDOnCrR1Fg+HPj/TlNqjzUKhOHL
	pi1XSTdErLHCIlLySeiycdviS6A2rmPMQ0KeMfceN5h7k1+9n6YfxU2IuvKxixDSF8uySYpA630Hz
	w+kY63jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti4I-00000005Ajy-1Hv4;
	Wed, 03 Sep 2025 07:38:10 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthvL-000000055SV-3C4p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1756884534;
 bh=auDnTh/G9z3Y/t2W15bb+vq1E6EQIAIJTktRaItnI50=;
 b=oe/QRFByZvJLL3zM4AlTBG/NU8utt+Qteq5BXB7ZMw2OfR4HLanLhdCcoz2cyhOnEhSkDz1Mr
 UJ8dEcVJE2mNsc+pRiV0QE83QpiXmqEW6ERGk89BddCXWDNeyTLvaGPPAy5Rbfn0KSOsSliVM2W
 gbJaNcaTYv7ejQPi8KXOoapVeymejsRmY5CM3u5su8b+Cy/xDXA2hQRwAzHhVrr7Z5BLhn0gSqA
 zap5Qw+HQRsfNmkMjvARjkEhU0Wpn8GDGPCxVJdgV2pAiB5d2c11/HRvD7qZ0NcFzSGD8YO9IKG
 RrYNkzh2v7vrWgorh3shtiXE6BoN2WiuUUGPVXaPCebw==
X-Forward-Email-ID: 68b7ee2f3a2f2af95f29221d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.11
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <8394c12a-1e1e-44fc-9bb5-92a464dfe410@kwiboo.se>
Date: Wed, 3 Sep 2025 09:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-2-jonas@kwiboo.se>
 <432ab63698b27ca5bce3a7a30d630685aff782b6.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <432ab63698b27ca5bce3a7a30d630685aff782b6.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_002856_203576_B4BA0A29 
X-CRM114-Status: GOOD (  20.93  )
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

Hi Nicolas,

On 8/29/2025 10:22 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> The Rockchip VDEC supports the HEVC codec with the Main and Main10
>> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
>>
>> Add the backend for HEVC format to the decoder.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Re-reading myself, most of my comments were off or really "nitty". So let's move
> forward and spare you the v3. Detlev is happy to rebase and work on top of your
> series, so let's help everyone getting better RK codec support.
> 
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Just to be transparent, during testing, it was notice that some concurrent
> decoding resulted into failures. I tested Detlev port to structure registers,
> and it didn't change anything (so probably not a stalled state, or one that we
> control). This could easily be a HW issue with older chip. Since you have used
> this for years without major issue reported, I happy to move on.

Thanks, I found some minor changes compared to the LibreELEC version
that I am running some new tests on, plan to send out a v3 as soon as
testing completes later today.

In LibreELEC version we enable some error detection,

	// sw_cabac_error_e - cabac error enable
	writel(0xfdfffffd, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
	// slice end error enable = BIT(28)
	// frame end error enable = BIT(29)
	writel(0x30000000, rkvdec->regs + RKVDEC_REG_H264_ERR_E);

and in this series it was fully disabled to closer match H264/VP9:

	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);

There is also an extra memset(0, ...) in rkvdec_hevc_start:

	memset(priv_tbl, 0, sizeof(*priv_tbl));

This should not really be needed and was removed in this series.

Still unclear if any of these will result in a changed behavior. Enable
of cabac/slice end/frame end error could possible activate some more
states when block issue a self-reset, but I am only guessing.

One thing to note for the flaky tests is that when they fail, they
typically just end up with a different consistent checksum. I have not
done any visual inspection of those frames, but will extract each frame
and compare them both bitwise and visually.

Regards,
Jonas

> 
> regards,
> Nicolas
> 
>> ---
>> Changes in v2:
>> - Use new_value in transpose_and_flatten_matrices()
>> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
>> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
>> ---
>>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>>  6 files changed, 2745 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c

[snip]

