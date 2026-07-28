Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52FC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/Q+4IfTspAd2Au/z24TH9Dq9iQ4DvV1SrEP1AYAt/Y=; b=t/F6Zq9tRKwA+VJZXv0qPsRBcI
	MB84FO6fHP6RWDjHgTRcR+B6ea6t97BGwjou12hjK+JG0Rhog78FVxLsKuotvTiedAACBckYJb5Bi
	SIQFECoc/ru8KOH+OhCdJgw9xD1ysZjnqg3xhZY+1uoEeHuX0gg2UlGQETSbWG+zsXE8uXtiHRo6I
	Rh67/Q4YPW72Qh1YEifR+fkR8Dkpx4TJQJYx7BcZJsP9rR5nL6llrc1WJnUdanDpeYIdtf/vU3xO+
	iU8eszjNEh4oI17iLnWPVMXsN7PjU10G1ZfeSKb+j7bcfaOO9/J0CU3065lPceZ9x/Ka78Us9v1ur
	HRva8MtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woitv-00000005WAq-2Ou3;
	Tue, 28 Jul 2026 14:35:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woitp-00000005W8v-4C5I;
	Tue, 28 Jul 2026 14:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785249315;
	bh=hi1tKX7EjWI5J4ogBRa8uDUOJpWIFZD5uMblt8+TA5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DPK+/krdDGlW7ypWcXs70J7Jg8Jj6H0ImjrHo+kXM1WxxwL+PLT5nx/uEDQ37DF40
	 1IH8wxxUKt6EI+kKy0MjO8C49AQVHXzDIDxFes5kCh1AjiAQ7W5U/bXJRgaX8tX5mN
	 kZNmv4AhGPoy8l7KsfYTWg9ov0d/nOniJuBkXgTij2wQlUWUKYDYJG0s0WEJzQDsIA
	 98CF5QL+cilwXgIa4ooFhHpv3CxgOf4Vwl9dJdZXog8W0mMKqUiE+fgRSvjmh3/QUe
	 aq32xyjL9IrjIhUP3y6Qs9O6Xh2cidVT9N2W/uyLMBowLMlwJ8f3hQhz4oiKa9EF6/
	 Ed/RZScjTs39A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7321417E019E;
	Tue, 28 Jul 2026 16:35:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 YoungJoon Lee <getfeus@gmail.com>
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v4 0/5] powervr: MT8173 GPU support
Message-Id: <178524931441.575499.11268846943253988242.b4-ty@b4>
Date: Tue, 28 Jul 2026 16:35:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_073518_213839_E88400E6 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

On Tue, 28 Jul 2026 17:17:58 +0800, Chen-Yu Tsai wrote:
> This is v4 of my MT8173 PowerVR GPU support series.
> 
> This time around Mesa was ready for basic testing, using both vulkanmark
> and glmark2-es2-drm (with Zink). Details below.
> 
> Changes since v3 (all in the clk driver patch):
> - Changed pm_runtime_put() to pm_runtime_put_sync()
> - Added missing of_node_put() in remove function
> 
> [...]

Applied to v7.2-next/dts64, thanks!

[4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
      commit: 3549c85d4c0e942d3ac9972a6b35ce0078bd3550
[5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
      commit: 75bfd9e7cdae0ae04dbaaf8dfc487adb67b7680e

Cheers,
Angelo



