Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C374D75BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+aBVqr7lmdXm3Wn3wbMrPw5OiE0VNIMGsehmxwhImM=; b=xgRXWkw2IM/I9BQJU/uAOoXNrU
	yN2k+TIQR0Ptpb9h1BltIu4odKW1Fl2skvBLXcBJEFzPJIc8xyATY3XoC0cqtPJWyAolGIwML98W5
	G5MqvL6a9cQoBDHF7nWDxwRUhVSuypEDSkJ9dZMBOzBgjlf79zKq6Z2s5GCKSwkU9X7nIVBA+X/FJ
	qtd14gJNqLlMetxu7PgQGjrVTwcccGbB7bG5mIpAYxM0ZWlYCZEN0IAAwW/BP7pEcRpo9fLJyd/bd
	WT2ScVtYCgsKDCXu7utv/EV22IGxYFmk0j/0FB5IXD9dd1aV6jAbtBA0sO3oaQimaUMvKB8leSZtZ
	Y0yag73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQVO-00000002Bmb-0SbJ;
	Fri, 22 Nov 2024 10:03:14 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQNQ-000000029kp-1tOk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:55:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 177374000D;
	Fri, 22 Nov 2024 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732269297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L+aBVqr7lmdXm3Wn3wbMrPw5OiE0VNIMGsehmxwhImM=;
	b=KxroAW/X/yTXmXDjzIRxtBnIZqU9ltO4G6GxfFSjIUDzHakeOGYxFHr2yYgPl0LdbpRZ1t
	OK6YiNdDecwOfmbXL8YUX1u99ZZ9fkUtTBcd8adBRey04y+ZzxIczzjDxyGoi0R35UlHIx
	sqp/Ec5LU3YN7qIcY1mJ130gZV1JpGIbpR3iSEXbt1jHXwfkz5IiGWjewXExTo+iEfIbV7
	JVwL2V2FwXAZRKllWRBOutFYx5+5vEmgse6BEvbUiSRZ4wYQPyDowLPGGdswdD67jpHd7u
	r1AUxkQCP+3OTwg9wrmi11Rsbji2mL5Lj0XO/eTxdKGgdZaCM1GYWmx5fbP4TA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Marek Vasut <marex@denx.de>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>,
  stable@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
In-Reply-To: <b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com> (Liu Ying's
	message of "Fri, 22 Nov 2024 14:01:49 +0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<b98fdf46-3d09-4693-86fe-954fc723e3a6@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 22 Nov 2024 10:54:55 +0100
Message-ID: <87zflrpp8w.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_015501_068249_3A1694FD 
X-CRM114-Status: GOOD (  38.69  )
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

Hello Liu,

Thanks for the feedback!

On 22/11/2024 at 14:01:49 +08, Liu Ying <victor.liu@nxp.com> wrote:

> Hi Miquel,
>
> On 11/22/2024, Miquel Raynal wrote:
>> Recent changes in the clock tree have set CLK_SET_RATE_PARENT to the two
>> LCDIF pixel clocks. The idea is, instead of using assigned-clock
>> properties to set upstream PLL rates to high frequencies and hoping that
>> a single divisor (namely media_disp[12]_pix) will be close enough in
>> most cases, we should tell the clock core to use the PLL to properly
>> derive an accurate pixel clock rate in the first place. Here is the
>> situation.
>> 
>> [Before ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]
>> 
>> Before setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the sequence of events was:
>> - PLL is assigned to a high rate,
>> - media_disp[12]_pix is set to approximately freq A by using a single divisor,
>> - media_ldb is set to approximately freq 7*A by using another single divisor.
>> => The display was working, but the pixel clock was inaccurate.
>> 
>> [After ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate")]
>> 
>> After setting CLK_SET_RATE_PARENT to the media_disp[12]_pix clocks, the
>> sequence of events became:
>> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>>   setting video_pll1 to freq A.
>> - media_ldb is trying to compute its divisor to set freq 7*A, but the
>>   upstream PLL is to low, it does not recompute it, so it ends up
>>   setting a divisor of 1 and being at freq A instead of 7*A.
>> => The display is sadly no longer working
>> 
>> [After applying PATCH "clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure parent rate"]
>> 
>> This is a commit from Marek, which is, I believe going in the right
>> direction, so I am including it. Just with this change, the situation is
>> slightly different, but the result is the same:
>> - media_disp[12]_pix is set to freq A by using a divisor of 1 and
>>   setting video_pll1 to freq A.
>> - media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
>>   to freq 7*A.
>>   /!\ This as the side effect of changing media_disp[12]_pix from freq A
>>   to freq 7*A.
>
> Although I'm not of a fan of setting CLK_SET_RATE_PARENT flag to the
> LDB clock and pixel clocks,

I haven't commented much on this. For me, inaccurate pixel clocks mostly
work fine (if not too inaccurate), but it is true that having very
powerful PLL like the PLL1443, it is a pity not to use them at their
highest capabilities. However, I consider "not breaking users" more
important than having "perfect clock rates".

This series has one unique goal: accepting more accurate frequencies
*and* not breaking users in the most simplest cases.

> would it work if the pixel clock rate is
> set after the LDB clock rate is set in fsl_ldb_atomic_enable()?

The situation would be:
- media_ldb is set to 7*A by using a divisor of 1 and setting video_pll1
  to freq 7*A.
- media_disp[12]_pix is set to freq A by using a divisor of 7.

So yes, and the explanation of why is there:
https://elixir.bootlin.com/linux/v6.11.8/source/drivers/clk/clk-divider.c#L322

> The
> pixel clock can be got from LDB's remote input LCDIF DT node by
> calling of_clk_get_by_name() in fsl_ldb_probe() like the below patch
> does. Similar to setting pixel clock rate, I think a chance is that
> pixel clock enablement can be moved from LCDIF driver to
> fsl_ldb_atomic_enable() to avoid on-the-fly division ratio change.

TBH, this sounds like a hack and is no longer required with this series.

You are just trying to circumvent the fact that until now, applying a
rate in an upper clock would unconfigure the downstream rates, and I
think this is our first real problem.

> https://patchwork.kernel.org/project/linux-clk/patch/20241114065759.3341908-6-victor.liu@nxp.com/
>
> Actually, one sibling patch of the above patch reverts ff06ea04e4cf
> because I thought "fixed PLL rate" is the only solution, though I'm
> discussing any alternative solution of "dynamically changeable PLL
> rate" with Marek in the thread of the sibling patch.

I don't think we want fixed PLL rates. Especially if you start using
external (hot-pluggable) displays with different needs: it just does not
fly. There is one situation that cannot yet be handled and needs
manual reparenting: using 3 displays with a non-divisible pixel
frequency.

FYI we managed this specific "advanced" case with assigned-clock-parents
using an audio PLL as hinted by Marek. It mostly works, event though the
PLL1416 are less precise and offer less accurate pixel clocks.

> BTW, as you know the LDB clock rate is 3.5x faster than the pixel
> clock rate in dual-link LVDS use cases, the lowest PLL rate needs to
> be explicitly set to 7x faster than the pixel clock rate *before*
> LDB clock rate is set.  This way, the pixel clock would be derived
> from the PLL with integer division ratio = 7, not the unsupported
> 3.5.
>
> pixel    LDB         PLL
> A        3.5*A       7*A      --> OK
> A        3.5*A       3.5*A    --> not OK

This series was mostly solving the simpler case, with one display, but I
agree we should probably also consider the dual case.

The situation here is that you require the LDB to be aware of some
clocks constraints, like the fact that the downstream pixel clocks only
feature simple dividors which cannot achieve a 3.5 rate. That is all.

It is clearly the LDB driver duty to make this feasible. I cannot test
the dual case so I didn't brought any solution to it in this series, but
I already had a solution in mind. Please find a patch below, it is very
simple, and should, in conjunction with this series, fix the dual case
as well.

FYI here is the final clock tree with this trick "manually" enabled. You
can see video_pll1 is now twice media_ldb, and media ldb is still 7
times media_disp[12]_pix (video_pll1 is assigned in DT to 1039500000, so
it has effectively been reconfigured).

       video_pll1                            1   1   0   1006600000
          video_pll1_bypass                  1   1   0   1006600000
             video_pll1_out                  2   2   0   1006600000
                media_ldb                    1   1   0    503300000
                   media_ldb_root_clk        1   1   0    503300000
                media_disp2_pix              1   1   0     71900000
                   media_disp2_pix_root_clk  1   1   0     71900000
                media_disp1_pix              0   0   0     71900000
                   media_disp1_pix_root_clk  0   0   0     71900000

---8<---
Author: Miquel Raynal <miquel.raynal@bootlin.com>

    drm: bridge: ldb: Make sure the upper PLL is compatible with dual output
    
    The i.MX8 display pipeline has a number of clock constraints, among which:
    - The bridge clock must be 7 times faster than the pixel clock in single mode
    - The bridge clock must be 3.5 times faster than the pixel clocks in dual mode
    While a ratio of 7 is easy to build with simple divisors, 3.5 is not
    achievable. In order to make sure we keep these clock ratios correct is
    to configure the upper clock (usually video_pll1, but that does not
    matter really) to twice it's usual value. This way, the bridge clock is
    configured to divide the upstream rate by 2, and the pixel clocks are
    configured to divide the upstream rate by 7, achieving a final 3.5 ratio
    between the two.
    
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 81ff4e5f52fa..069c960ee56b 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -177,6 +177,17 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
        mode = &crtc_state->adjusted_mode;
 
        requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
+       /*
+        * Dual cases require a 3.5 rate division on the pixel clocks, which
+        * cannot be achieved with regular single divisors. Instead, double the
+        * parent PLL rate in the first place. In order to do that, we first
+        * require twice the target clock rate, which will program the upper
+        * PLL. Then, we ask for the actual targeted rate, which can be achieved
+        * by dividing by 2 the already configured upper PLL rate, without
+        * making further changes to it.
+        */
+       if (fsl_ldb_is_dual(fsl_ldb))
+               clk_set_rate(fsl_ldb->clk, requested_link_freq * 2);
        clk_set_rate(fsl_ldb->clk, requested_link_freq);
 
        configured_link_freq = clk_get_rate(fsl_ldb->clk);

