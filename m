Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7956CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGtCSR7EeU4PQbry3weYc55FRPjXetuC+CXU0b67FGM=; b=mbFbavT5Kr5Z3ryH9GQ/rrDeXQ
	pp/54ghgnihFxdxc1mI0/3fr4S2jsEb3+6D7sT20gi2e3XLJk+k6s94fI64n0vplokrbZJ8aVGcsC
	3gO7/i0TNqWt3DdjfDslEuFyp4a1Wg3cOzK4af6qF5pz2TC4Qn0zBm9ECiQNxhiOj+jZ2alJRURiI
	XkYitLcZ1iMI3CCeC1ViIiM6TJgB0LEvMNMH6QsuBL/JVq1aeFSoKs+KGR7UpRXYlw10bLXd2NEbH
	V6Z2dEEKoF+3kwoJfM3K354cEKb2C2Hi+5SZ9U7styY2CxjDeaRYO15M1txknLpPcaHzzm97RSHI0
	+6VGinNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0np-0000000Bf8B-1JcC;
	Tue, 10 Dec 2024 14:01:29 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0lq-0000000BehF-0kA8;
	Tue, 10 Dec 2024 13:59:27 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733839164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WGtCSR7EeU4PQbry3weYc55FRPjXetuC+CXU0b67FGM=;
	b=r/8E9EC6TV/aMV/96LuAUOyPdx+bIPuJE6ANGTFf2tdpwYfvhMz2NbAanz1XEQGvfgI5DH
	pBlpCmOH7yIqG9sXrjxWxspNIuPhBoSNVhij7YLVT2W05+I2hL8KEKAtgKh3qCUy5ZJayM
	G5bXalU+rQ4kytfHZlrYZ4qCqvtkFFRhx8XPQrtf6wsX/6Osm4KZ6x8j+0DOoAD+dqwQUk
	4nVfgMNOA5p0AS/T55BZQ4H0kN7WIS6Wqi7F1orbxTX3wrTeEU6jK7WJNdTrsb1lEbk+8h
	m7oFqofKVDEgJRWswfF4BgOxiM8IXmODZGpAe0kPJu3dZl+xq/IGuKNAxXjwzQ==
Date: Tue, 10 Dec 2024 14:59:23 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang
 <zhangqing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for
 rk3328
In-Reply-To: <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-3-pgwipeout@gmail.com>
 <0d11705121f29ccfb7cfa342505a6e35@manjaro.org>
 <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
Message-ID: <bcc296ea8c15eddce62a8d3ef3a509b7@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_055926_510536_5B63D521 
X-CRM114-Status: GOOD (  24.87  )
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

Hello Peter,

On 2024-12-10 14:27, Peter Geis wrote:
> On Tue, Dec 10, 2024 at 4:44 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> On 2024-12-10 02:30, Peter Geis wrote:
>> > Correct the clk_ref_usb3otg parent to fix clock control for the usb3
>> > controller on rk3328. Verified against the rk3328 trm and usb3 clock
>> > tree
>> > documentation.
>> >
>> > Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
>> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>> > ---
>> >
>> >  drivers/clk/rockchip/clk-rk3328.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/clk/rockchip/clk-rk3328.c
>> > b/drivers/clk/rockchip/clk-rk3328.c
>> > index 3bb87b27b662..cf60fcf2fa5c 100644
>> > --- a/drivers/clk/rockchip/clk-rk3328.c
>> > +++ b/drivers/clk/rockchip/clk-rk3328.c
>> > @@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)        = { "cpll_peri",
>> >                                   "gpll_peri",
>> >                                   "hdmiphy_peri" };
>> >  PNAME(mux_ref_usb3otg_src_p) = { "xin24m",
>> > -                                 "clk_usb3otg_ref" };
>> > +                                 "clk_ref_usb3otg_src" };
>> >  PNAME(mux_xin24m_32k_p)              = { "xin24m",
>> >                                   "clk_rtc32k" };
>> >  PNAME(mux_mac2io_src_p)              = { "clk_mac2io_src",
>> 
>> Sorry, but I was unable to verify this in the part 1 of the
>> RK3328 TRM, in both versions 1.1 and 1.2, which is all I have
>> when it comes to the RK3328 TRM.  Is that maybe described in
>> the part 2, which I've been unable to locate for years?
>> 
>> Moreover, the downstream kernel source from Rockchip does it
>> the way [1] it's currently done in the mainline kernel, which
>> makes me confused a bit?  Could you, please, provide more
>> details about the two references you mentioned in the patch
>> description, or maybe even you could provide the links to
>> those two references?
>> 
>> [1] 
>> https://raw.githubusercontent.com/rockchip-linux/kernel/refs/heads/develop-4.4/drivers/clk/rockchip/clk-rk3328.c
> 
> It is unfortunate the TRM doesn't include the clock maps, because they
> are extremely helpful when one can acquire them. It also doesn't help
> that the TRM register definition only referred to this as "pll". I was
> sent specifically the usb3 phy clock map for my work on the driver,
> which had the location of each switch and divider along with the
> register and bit that controlled it. That combined with the TRM
> register map allowed me to find this error.

I see, thanks for the clarification.  I'd assume that you aren't allowed
to share the additional documentation you've got, which is unfortunate,
but it is what it is.  We should be happy that at least you got it, and
were able to put it into good use.

Thanks for fixing this!

