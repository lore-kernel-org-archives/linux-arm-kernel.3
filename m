Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9253E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfks6ZTiwp1kxRzHwe4qrzjZlR1gfefb3q3lO/fYtDA=; b=3PEjdVGIWEk1znRYmxH+3zmWwQ
	uk8r0wJZQGavcJtq8LIXoB0J+AZtOrfm0e0sTT2JDmitluqoswj6Jb+tZIZdXnHPo3V+YrrYARgeY
	G3UthEtqPSAYq5rqGtyX1GHShA03NW7BUnFu/IUd4q6JQfEVVG6/LATlXEsMQT9DJ0HPxBR0zhXpq
	MMjlBPJnWBLey7Zirj+HJWFEhhY6pSWy8l3vE7flQt5Hyg8AD9MgdBWIAlkZH8r2mbU8b2h1myO5o
	G70K6fc5mCPY7eCyflQVFJRLT3YjTt+31HKCztO6Mfr267nU99P4HVpHTAvHKIJtc5Ry35bKCOJ0A
	0vu/SbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL34c-0000000C5k6-0nCb;
	Tue, 10 Dec 2024 16:26:58 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL33S-0000000C5MR-2xxA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1733847942;
 bh=Rfks6ZTiwp1kxRzHwe4qrzjZlR1gfefb3q3lO/fYtDA=;
 b=yurxfwQ7unIjEb47s7vUlZ5nmET+d0VFLe6GN+5yltcPCDp55mdq2yk34tDlbS1JKKK26E+6Q
 BuA01kE/9Q2TbpPFlrERXB1zdYKsJMIxjHKT11m/ehftMhBLy3ywdXesujxDSIlMk4auO5xK/IX
 IoihvM5L/pGdCuFof4QVP2sKMBuQ7TALx9EzorM+fdc9WgSrMpoJXwXqQRXGPUV3qEp0e5MjGAL
 GOwHoJVAXmn1NpbS9KXfk3et5WGdZ8iCMmm70veO9F+NN55Q+rfvPYdC652EjICEVx1lejT3FQm
 K64+FyWCPm6yF+6fHKu4ptB2KpLyvQWFpgssZ/GmBhXA==
Message-ID: <304fd668-0e61-4f5e-a12c-36fd7e54ab6e@kwiboo.se>
Date: Tue, 10 Dec 2024 17:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for
 rk3328
To: Peter Geis <pgwipeout@gmail.com>, Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang
 <zhangqing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-3-pgwipeout@gmail.com>
 <0d11705121f29ccfb7cfa342505a6e35@manjaro.org>
 <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAMdYzYqJLK6oJHCUVztth6mtJsYrRQSPzNYpR-ZmR7rNprZXfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 67586b83ce9f514b1380d1a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_082546_786861_D23F2525 
X-CRM114-Status: GOOD (  20.82  )
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

On 2024-12-10 14:27, Peter Geis wrote:
> On Tue, Dec 10, 2024 at 4:44 AM Dragan Simic <dsimic@manjaro.org> wrote:
>>
>> Hello Peter,
>>
>> On 2024-12-10 02:30, Peter Geis wrote:
>>> Correct the clk_ref_usb3otg parent to fix clock control for the usb3
>>> controller on rk3328. Verified against the rk3328 trm and usb3 clock
>>> tree
>>> documentation.
>>>
>>> Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> ---
>>>
>>>  drivers/clk/rockchip/clk-rk3328.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/rockchip/clk-rk3328.c
>>> b/drivers/clk/rockchip/clk-rk3328.c
>>> index 3bb87b27b662..cf60fcf2fa5c 100644
>>> --- a/drivers/clk/rockchip/clk-rk3328.c
>>> +++ b/drivers/clk/rockchip/clk-rk3328.c
>>> @@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)        = { "cpll_peri",
>>>                                   "gpll_peri",
>>>                                   "hdmiphy_peri" };
>>>  PNAME(mux_ref_usb3otg_src_p) = { "xin24m",
>>> -                                 "clk_usb3otg_ref" };
>>> +                                 "clk_ref_usb3otg_src" };
>>>  PNAME(mux_xin24m_32k_p)              = { "xin24m",
>>>                                   "clk_rtc32k" };
>>>  PNAME(mux_mac2io_src_p)              = { "clk_mac2io_src",
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

I can also confirm that the changes in this patch matches Fig. 3-8
RK3228H Clock Architecture Diagram 7 for the USB3OTG block.

                                    XIN24M -\
                                             S45_8 - ref_clk_usb3otg
S45_7 (2PLL) / G4_9 / S45_0 (DivFree 1~64) -/

Regards,
Jonas

> 
> Thanks!
> Peter
> 


