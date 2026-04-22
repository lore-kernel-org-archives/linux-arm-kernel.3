Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC61FA1FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glsNCiGTPnKVlFZ4EtRJsTgOFyTiPddZ/76hLM1QwNU=; b=3QaP/IOH7jjNgrKy4WessYuKgx
	fH29ZF1pVBkZDVaRtejCa+ZOjLW1ZwdaeQrEtFM1QhbdxwyzGSMhNuu9G/9FtVD3yMzqISGOPSURU
	UN+DK1IQ4WU9AwW8FXff6sC7UpOHMt/7ttTFZ66qUByUBA+VlTtYj7Jw5d/ZmDW47odOg73FbQjDo
	BaVrLfeIkeL+zjalTZkwuD7V4A8AZ0mlW+2+N0CgYrLetANR+vWqzHhAi0m7eFssFcafPRFdi3a4z
	S9pjMoFGN+PdEd2DIZNIK53i+KVVQTt7TAjar6FBzwklvNnzRbHAw+KEWGGX3U7UZqC9XkOwU3Iwb
	7QHi+N9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcfI-0000000AeEZ-0f2G;
	Wed, 22 Apr 2026 18:51:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcfG-0000000AeED-0cjS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 534A94166A;
	Wed, 22 Apr 2026 18:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334ACC19425;
	Wed, 22 Apr 2026 18:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776883869;
	bh=QAnJAPXdDP9ZUgfbNMD+G/bRQFx5oM9LjIYK7IpcsGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCAp4JPX+e+nvkLxiw3/olEBTK1qHhsLYsH+n2yn2yUAKZQD2u/v3Z9BU4H4gDnNl
	 +y9aEGTLvpbfYVWWLf/ArlanlmwwVD0Ik1jGbeTGev6Al8B5MOdItw01rn0X0iP2sO
	 q+o4rxGAIA+mlVi1VFFn24gQaGvmpK2SAfjtQn6ReEE5VWHybOEVUVgsiHfeMAAUZR
	 VBlH7XyyS59i82MBTaTy5nIzrbjlszTJNt8S4E/0SSGRxM9Q4h+OyuqZr7lVncaSZ2
	 9svshMGjxS8h5aMHXTzWbpDk+PIjVom8nEJ4HSbOx6Ngt5BAl9+lIt7sNWrAoZUd9W
	 1owGLZ18teIPg==
Date: Wed, 22 Apr 2026 19:51:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/2] clk: scmi: Add support for two #clock-cells to
 pass rate rounding mode
Message-ID: <20260422-satisfied-rough-mongrel-aabca1@sudeepholla>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
 <20260306-scmi-clk-round-v1-2-61e2a5df9051@nxp.com>
 <20260422-huge-kiwi-of-tornado-4fce89@sudeepholla>
 <aejUd6L1AfbsflxR@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aejUd6L1AfbsflxR@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_115110_255395_C9E1B4AE 
X-CRM114-Status: GOOD (  32.69  )
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

On Wed, Apr 22, 2026 at 10:00:23PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> Thanks for giving a look.
> 
> On Wed, Apr 22, 2026 at 02:14:56PM +0100, Sudeep Holla wrote:
> >On Fri, Mar 06, 2026 at 02:20:13PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> SCMI CLOCK_RATE_SET allows the caller to specify the rounding behaviour
> >> when setting a clock rate. The previously added dt-bindings header
> >> defines three modes:
> >> 
> >>   ROUND_DOWN / ROUND_UP / ROUND_AUTO
> >> 
> >> To enable device tree clients to select a rounding mode, extend the
> >> SCMI clock provider to support "#clock-cells = <2>", where the second
> >> cell encodes the desired rounding mode. The default remains
> >> ROUND_DOWN for backwards compatibility with existing device trees.
> >> 
> >
> >Where is the binding update documented ? It's not in 1/2.
> 
> This was missed in this patchset, I will fix in new version, if this
> patchset does not have big design flaw.
> 
> >
> >Also if it can be static in the device tree, why can't it be
> >autonomously handled in the platform firmware ? I think I know the
> 
> Linux passes ROUND_DOWN, SCMI firmware uses round down for clk calculation.
> 
> >answer for this but I want to make sure it is a valid use-case and
> >gets documented here as part of binding updates.
> 
> Per info from our video software team.
> We have some video modes where the best pixel clock rate is slightly above the
> nominal rate, and the default round down rule (CLOCK_ROUND_RULE_CEILING in SM
> firmware) can cause the resulting clock rate to be much lower than expected.
> 
> disp1pix = 96200000 Hz (desired pixel clock rate)
> 
> The MIPI DPHY cannot hit the exact frequency of 288600000 Hz needed for this
> pixel clock rate, so the next best DPHY PLL frequency is 289000000 Hz. This
> corresponds to a pixel clock frequency of 96333333 Hz, which is slightly higher
> than the nominal rate of 96200000 Hz the video mode specifies.
> 
> Setting the VIDEOPLL (disp1pix parent) to 289000000 Hz should divide down to
> the adjusted disp1pix frequency of 96333333 Hz, but here is what happens in the
> SM firmware:
> 
> quotient = 289000000 / (96200000 + 1) = 3.004 => 3 (notice that the SM always
> receives the nominal clock rate, not the adjusted rate)
> 
> If the rounding rule is round down (CLOCK_ROUND_RULE_CEILING),
> quotient = quotient + 1. Therefore, quotient becomes 4.
> 
> disp1pix = 289000000 / 4 = 72250000, which is nowhere close to the target of
> 96333333.
> 

I do not think this is the correct interpretation of `CLOCK_ROUND_DOWN/UP`.

`CLOCK_ROUND_DOWN/UP` should apply to the requested `disp1pix` rate itself,
not to the divider choice in a way that forces selection of the next integer
divisor and produces a much lower output clock.

Here, the requested `disp1pix` is `96,200,000 Hz`, and the parent rate is
`289,000,000 Hz`. The achievable child rates nearby are:

`289,000,000 / 3 = 96,333,333 Hz`
`289,000,000 / 4 = 72,250,000 Hz`

Given those options, the firmware should be able to round the request
autonomously to the nearest supported `disp1pix` rate, which is `96,333,333
Hz` (`289,000,000 / 3`).

Under that interpretation:

`CLOCK_ROUND_UP` would permit choosing `96,333,333`
`CLOCK_ROUND_AUTO` would also likely choose `96,333,333`
Choosing `/4` and ending up at `72,250,000` does not look like a meaningful
rounding of `96,200,000`

So the issue appears to be that the firmware is applying the rounding rule to
divider selection rather than to the resulting `disp1pix` frequency.

> However, if we can use `ROUND_AUTO` the SM firmware would select a quotient of 3
> in this case, and `disp1pix` would match our target: `289000000 / 3 = 96333333`.

Given the explanation above, I would not support this approach. `ROUND_AUTO`
should be sufficient for this case if the firmware is making a sensible
selection.

-- 
Regards,
Sudeep

