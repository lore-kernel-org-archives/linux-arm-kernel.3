Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F622FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=; b=RtvHwwlAVx1NFEQuZjEYsKw2H1
	7In8YEkuAZABouHjLuv0Xh83kTtRlu1hcwqBg6eZ9JBFufyP6K1ngUfz0uccTGr1HeiDScm1Su9xz
	L26loucNHCeu9UPc2QIqqpGE+JjJBxY/DFFNnJ9mFAXwMTGn27f1Y9IVv3s/4K26KJrrlIfItaOTc
	iqad0guefOVTN1xemUeWg6pGYVOD2M8ewF2e0C06uGYGK+l90v1I+xsa/GCWohQhq5s+FNwOj5uvI
	4Ud1wp6qgsSz0E0zVwqFYdJpLo1uPD3kiDWRDp5xuwXWdzKk30+6HvML4SWSVOOtV1n8WyN4DQYpo
	LGjFnU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpCS-00000002TIg-3X40;
	Tue, 28 Apr 2026 20:38:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpCQ-00000002TI8-2t8b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
	b=V9YpFNj7NGViHZJoAbmz5tpWQt77RUyGBSnHolY4IyUXf8NBhs+0QcQNVBLUacvQUpvdMp
	5eycBjG6iuYb+zLWGR9zza0Fy1hvIi9D1MOWKmwzjbcyRJKlUCWuJg9waxupndsCGWhfCt
	Ye02hBE0qzZJiao9X2Lk3X2MfEw0nvw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-Hjk2J6XPPKeWI7FeIgiq4g-1; Tue, 28 Apr 2026 16:38:26 -0400
X-MC-Unique: Hjk2J6XPPKeWI7FeIgiq4g-1
X-Mimecast-MFC-AGG-ID: Hjk2J6XPPKeWI7FeIgiq4g_1777408705
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so175940466d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408705; x=1778013505;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=OLIO6aHqCEpAoQob7MLma6CTea9xtnCxRk9y8+GvMwfMOXxtWWDzgF472xXpeA8cq1
         zFuKNWWt9sASZ5K09MoY05GdvDYBHXGznV6Kt6AHXxjLK1v8AjcpulZIYLEaRWBGRS8q
         mpDzNRdLf7pEdMu2iWYKybdpvWDZLGoR2JLdDRbq0s8CUZLEj+xobhh4AySC0UF8r/1J
         mZ72Qih8vc7Hc/SjXTtpwpZXQtQNv9BePTIjamrrmQbtKyBcVFYGljna+S+41Ga9hYZ6
         8hKVzcEnYn1WTZBeRURtFmYD2IYVolNKSPNfmoU+vTVtrokgz1F8tBhGIyVSBqQ0m/cs
         mBHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ioV8e4nKKTp0zQcZkIjVntHXZzC2FEqZQWpjpOt06wjqbT6G+kLMJpsLr2mwD3mXhF5cBP4tIeL7jW98Jfx1y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx92BVLckh+ftFgXcc2epRMP7nrHqMKTdS+tsnQgqAGgSvjTm9I
	4qe34zDLx913D2kbLx6I+NCR+z0MD/9mdO0+L6bMt8iALtIJk1I9rTnkl0oet6OeEpH9FmmhNrq
	DqpuWey4ALZMdO/Fg2z1bi6pQFvvsCQYj2huL/qlECgsH7Y2o/ZWOjXurbNPtgKGV8fXHC1u5+F
	SL
X-Gm-Gg: AeBDieuDooo5QDNvvny/va5G0X86LBN8iAF1E3+B7WGBfEeTDjEtaLAokJnBiPUWX6N
	oh4KPBmUSjBGNTcrKiYDwVPNcztUhj8hzmunP9XwK0g8kgAyxeL0TnfRGo6alo3/AJ7MR2RVrl7
	L1dRPOch2WAC/SJLMABxtzyxe33tBWw8lsaSaolkRB3zVzKkiUyH7fpXXemvayGVnPHDiWWkCP6
	tsvlfBujVpkilsPeMpntqnjppLe2dL1MrYtBluKU+uy7ibysE2U+0Ux447eaLoidTybVwkPmU9X
	SWp73tyGA9Mn69b8MnAxUko+aeBH7oxf9rTNF8QjPABip2nKuj5UhJ/s0nq+EBm5uE2s88rFnUF
	PnhxttAqjTMZB1sn14ZbkipCHOrNBaLY=
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22408106d6.2.1777408705542;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22407456d6.2.1777408705068;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ef50fsm699056d6.32.2026.04.28.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:24 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:38:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afEau1Ny-7RTz4vc@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c0SRwN6vl_4uOFrrAdT6Lb3CHpSg3XoxQblcXnHTeaI_1777408705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133830_796248_2978ED45 
X-CRM114-Status: GOOD (  24.59  )
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

Hi Stephen,

On Mon, Mar 09, 2026 at 10:38:39AM -0400, Brian Masney wrote:
> There are some clocks where the determine_rate clk op is just an empty
> function that returns 0. This can be either because the rounding is
> managed by the firmware, or the clock is capable of any rate. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Based on discussions with Stephen at Linux Plumbers Conference, he
> suggested adding a flag for this particular case. So let's add a new
> flag, and update the clk core so that the determine_rate() clk op is
> not required when this flag is set.
> 
> This series adds the flag, some kunit tests, and updates all of the
> relevant drivers under drivers/clk to use the new flag.
> 
> Once this is merged, and in Linus's tree, I can update the few remaining
> clk drivers that are outside of drivers/clk via those subsystems at a
> later time.
> 
> Merge Strategy
> --------------
> All of this needs to be directly merged by Stephen as one series into
> his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
> To reduce the noise, I am only CCing people on their respective drivers.
> 
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

We talked about this change at LPC in Tokyo, and you were the one that
suggested adding a new flag. I initially wanted to add a new shared noop
function to drivers/clk/clk.c. This series implements everything we
talked about in person. The only thing that we didn't talk about in
person was the name of this new flag.

Anyways, let me know if you are interested in this change, and if you
want any changes. If there's no changes then would it be possible to
pick this up?

Thanks,
Brian


