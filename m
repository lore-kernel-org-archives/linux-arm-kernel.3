Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A28606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCUiyGTF;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pz3Mr8Hu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rUCby3YZiB/c/K75Lnrq0ACWkSYD91hEUwrMnP6159o=; b=eCUiyGTFV7EXBgZfqcl2PijA++
	LPjIuuVeXXdoDXZAfF/TZ1auYRM6AfSq31X6bufOpSlRkMdksoGGnBJax4Fz410VNzwl2ol+fz7Zx
	SLi3UE23eKcHiH/MQbpuLvuYxT2+k8w+dR3/PRGKqw9QvopgYboOxryPKfX8b2DhJl7WeTcLYci7Q
	nLNPqmtFGuMcdb/oluwzBjllvuZXSjH0LJyxGq8eQLPjIOKxbH6UeJvgppJP0ggPvVJ6NeNjN9Rp5
	aa2J3C2HvTG/anU4BOfMo7DeZXVfRl06QL4sysP4zLpImqXwI1GR3GLyDgnTtEkwZJ4dmpsp7LNCf
	5k1kzdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFyl-0000000GTtN-3b8K;
	Fri, 23 Oct 2026 14:10:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFyi-0000000GTsv-0ZiB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:10:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso575448f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792764638; x=1793369438; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUCby3YZiB/c/K75Lnrq0ACWkSYD91hEUwrMnP6159o=;
        b=pz3Mr8Hu2hETwymX4Hzn+4FV0WdACUbXqwKMnQGCOoafKltwAvk/jvD1CEdq2oHEhU
         y+e37+kci3p82c2uJnC0EehzUOExNN5x9+tQxclK/fF02W1Y4OYaPIAgOKAu6KEPV+Rc
         1JQMK+XgRoEZrPUPk+Anp8Aw2buYyZGqi8taUvnyzi66JvFSM/0NeMedD0YU1XIbf4uV
         QaFyj1D89LfUZJChb6tam1Ky9DO0KZBs0zbT2SGOpSYs//HtisrBZ7J0daGHaMg5S/DC
         rY00zG9S/UWT9vyMz8ib/ysPyUJ8AG1f7+/QntiNKOKVnvJHzaP2bfSfnUDJP3KK9xQI
         cBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764638; x=1793369438;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUCby3YZiB/c/K75Lnrq0ACWkSYD91hEUwrMnP6159o=;
        b=1GJqS8Oy0mRHmpW5MCOAkGACwjYwkEZcJriathF3ET/W5SlPYkrJloqqRb8wrps+8o
         KZ33ruXnCgjiXZ6G7WXHwUvnqTOwZ9DKF+yq00xpfG6FQ+etpfJaB8R22sUxMRvhh09F
         cIsasgkar7HZaxN1T4xQik7d4pVOqrvaEZnBi5xHgJga39X63sigxFRDUJrmlaVYFY7e
         mH47cA0svR4qsB1Mya1WRJ0pD9IOdr1mcYaePRprKixJ/H3XttNHHsmBUO95od38DUbI
         z3fUctJP5DOro6rALzYksFBxcLG/0LfuSnD6x0T7U6yo03p6OF1GosZW91k4Dbjxbgn1
         jmKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwnf0hEq8Lm7+jjOjX7twhX61W8Opv3Eej+Rqmk6GDnrcP6YtJz9uBFKvHOyEoJ7vq/+2l0VYLGhJwSul3TDN8@lists.infradead.org
X-Gm-Message-State: AFq9FYIKKwgDtjncd8UCSjLg64KntIhAYYWxZ/CW+8Ll8r3XiGTAWXII
	R0tt00qzPV1W8eczehMMLX/8ZBz2EC/pWFvTL7BOeKPNPiKu1fmL81UEasbsD5Gxhak=
X-Gm-Gg: AYBFou368cWyCZFTPgkvIe1uZj9MrT2/wojNYFGXevizDNAHt4efkKLuITvggEzSMD7
	oR/nB6MFDMoKaZZpgI9GltiQqa0/UdFM3G0NL0lMghg+/vyGnyfYMS+NdO7/at7v/9lgB9UF6/M
	ByxqLGNul+SgD93dHsLNVa0z0UJ2+G+4yGwuLa0si/hjjGqAhpdbK3szPP9bNxrBIMkvkfkTUIH
	9m3rCbgb12kcXR5BEeU+twh/KxQVeSeMuO9lKeRtcS28ChF3yds5Oojgq4CmyA3xwINsstSRW4q
	76Trcc6EYpp7DjBVl5MZQxdJdb0Bj/Vm46bjTmZgJDSCRv6FacH3yuS9HXQC+VxT3cRSEjfAQd/
	QuAFXxxiRb8tAzyQh9ixRmW/Bao2IQhZfXaD6gC4arkb60Da0/7PhZJgfr59owGf9w3LGa2z6ZG
	+g7Pp+2WDZuo720ghgmt34wUGoA6UMg8fyyVps2LZOHJMp0ZUUnB2I1cpG3hmn59xKjMLsamPUr
	yw2XJGze1Z5KKsC4oPU47/PoE/VPNFv/O+JP1S0PTBdG43WGjlNnHZCeXhJmnikmkIS8x6m/iDF
	Id6hk7oCP8dTpOsg2t5i
X-Received: by 2002:a05:6000:986:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48e3859df5dmr4185485f8f.17.1792764638081;
        Fri, 23 Oct 2026 07:10:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6a5sm73564f8f.12.2026.10.23.07.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:10:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ian Ray <ian.ray@gehealthcare.com>, =?utf-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
In-Reply-To: <atjIIHkoNwBVDO5b@redhat.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
 <atjIIHkoNwBVDO5b@redhat.com>
Date: Fri, 23 Oct 2026 16:10:34 +0200
Message-ID: <1jtsmch5id.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_071040_322059_703EB1EC 
X-CRM114-Status: GOOD (  54.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On mer. 21 oct. 2026 at 10:11, Brian Masney <bmasney@redhat.com> wrote:

> Hi Miquel (and Jerome),
>
> On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
>> Hello,
>> 
>> Thanks to Brian's series, we can finally solve the problem of rate
>> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
>> series using a v7.1 mainline kernel with a lot of unrelated DRM
>> patches. I then re-applied it on top of clk-next after fixing the few
>> conflicts when applying Brian's series, but that means I cannot (yet)
>> run a 7.2/7.3 kernel on the platform (and applying this series with b4
>> will fail due to Brian's series no longer applying on top of clk-next).
>> 
>> The DTS patch is there for reference, I don't mind if it's not picked
>> up.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks for testing and posting this!
>
> I know that Jerome would like to see some changes to my rate change
> series before it can be merged. I'm going to probably poorly describe
> his concerns here, so apologies in advance if I miscommunicate this
> Jerome. I'd appreciate it if you could clarify.
>
> - Currently the latest version posted (v8) to the list has the LCM
>   helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
>   helper should be in clk-divider.c. I agree that it should be in the
>   divider code, but we'd have to export some additional APIs to allow
>   that. In the future if we went with what's in v8, and wanted to fix
>   the fractional dividers, then it would need a similar type of helper
>   in clk.c, which is not ideal. I initially went with this approach to
>   limit the APIs that are exported from the clk core.
>
> - I have a draft v9 series that I haven't posted yet that adds two new
>   helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
>   similar to the existing functions for the parents. This allows moving
>   the LCM logic into clk-divider.c where it belongs, however the
>   downside to this approach is that it expands the clk exported APIs so
>   that providers will be able to fully walk the clk tree. The concern is
>   that providers may abuse this in the future and it may limit future
>   changes / cleanups to the clk core. For example, if we wanted to clean
>   up the way locking is done, this may potentially limit the available
>   options.
>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-divider-scaling-v9
>
> - He would like to see it where each clk consumer sets the min/max rate
>   that's acceptable, and the clk scaling in the provider takes those
>   ranges into account when rates are negotiated.
>
> Anyways, please chime in Jerome if I got this right / wrong, and any
> additional concerns.
>

Hi Brian, Miquel,

Thanks Brian for the summary, and Miquel for testing and posting this.
The i.MX8MP LDB/pixel case is a real problem and I'd like us to solve
it. My concerns are about how, more than whether.

You got most of it. The main nuance is I want to convey is where it
should live IMO: not in a divider helper, and not in providers at all,
but in the core. I'll try to explain.

So far, CCF has preserved the settings of each element, or more
honestly, left them alone: if a divider divides by 4, it keeps doing so
whatever happens to its parent. This behavior has been there for years
and many devices rely on it, even if unknowingly. Miquel, I understand
you would rather make the new behavior the default, but I think this one
is here to stay. That said, it would be nice to have a way to say that
the rate should be preserved rather than the setting. I'll come back
to that.

My first concern is about the responsibilities of each component. IMO a
provider should only describe the transfer function it implements:
"given this parent rate, here is what I can do". It should not walk
the tree or care about what its children are doing. Coordinating the
providers is the core's job, without assumptions about their transfer
functions.

Providers already query their parents: a mux asks each candidate
parent what it can provide, and a clock with CLK_SET_RATE_PARENT
forwards its request upward. That is the request path, and the core
stays in charge of it. Reading the state of children or siblings, and
deciding on their behalf, is a different thing. Once a provider is
allowed to do that, there is no good reason to deny it to the others,
and I think that would make the core much harder to maintain. It could
also get in the way of other pressing work, like the global lock problem,
where tree walking will certainly play a critical role. Miquel's
patch 2 is a good illustration: the helper ends up comparing the
clk_hw of the tree with the inner clk_hw of a composite, which is not
part of the tree.

My second concern is that it is tied to the integer divider, since it
relies on the LCM. If another element with a different transfer
function sits on the path, it does not work, as we discussed. We could
extend the principle to other types, but:
* I don't see how the different types would reconcile, since each one
  does its own thing in its own .determine_rate();
* the change is no longer simple and harmless if it has to spread to
  every provider to work.

The behavior is also hard for consumers to predict. For example, the
parent rate is only negotiated with the subtree of the divider's
direct parent. With a gate between the divider and the PLL, the other
branches of the PLL are left out. That could be fixed with more tree
walking in the provider, which brings us back to my first point.

If such a mechanism is needed, I would much prefer it done entirely in
the core, in a generic way, with no assumption about the transfer
functions involved. I realize this may go against a direction
suggested at a previous LPC, which this series followed, and I think the
points above are worth reconsidering it for.

I say "if" because I doubt clock trees are designed with runtime rate
negotiation in mind. So far, we have mostly dealt with these cases by
removing CLK_SET_RATE_PARENT and using assigned-clock-rates on the
shared ancestor. I understand that falls short when the PLL has to
follow the display mode, as here.

For rate negotiation, my suggestion would be to reuse what the
framework already has: clock ranges, and re-running .determine_rate()
on the children being dragged along, with the common ancestor's rate
pinned. When that rate does not suit a sibling's range, other ancestor
rates can be tried within the constraints, rather than giving up.

clk_set_rate() is a best effort function. It tries to get as close to
the request as possible, honoring the ranges of every clock along the
path, and it is up to the consumer to decide whether the result is
good enough. That decision is lost if the framework recomputes the
rates of a sibling branch on its own. Ranges could help it decide:
either "I'm fine with the new rate", or -EBUSY.

What I'm suggesting is to treat any clock with a range as one that
needs updating. Its consumer cared enough to tell us what it can and
cannot cope with. That removes the need for a specific flag, and puts
the rate policy in the consumer, which is where I'd prefer use case
choices to live, rather than in the provider or the core. It would
also fix clocks being dragged out of their range during an update.
Presumably, a clock without a range does not care enough to give us a
decider, so the framework has no basis to act on its behalf and keeps
today's behavior. I think this behavior will keep on being good enough
for the vast majority clocks out there and it is a lot lighter
on the math side (which is already quite severe as it is)

I've been checking whether the idea is remotely feasible. It involves
multiple planning stages and multiple tops. It is still very rough,
but there is the beginning of something:

https://github.com/jbrun3t/linux/commits/clk/clk-rate-range-update/

Miquel, if you fancy trying it, please let me know whether it works
for you. All you should need is to set a range on the clocks you care
about.

Sorry for this rather long explanation.

Brian, your series is what got this discussion going, I know a lot of
efforts have gone into it already. I'd be glad to work on this together.

> Brian
>

-- 
Jerome

