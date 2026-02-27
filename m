Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEACFEFB6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=; b=BBQn2zRu1GETcndWrgqpEwyx5t
	D5BmBP53qbhNVsMcHuxYYdu1+aBuB5G5CtzoZGNKZcIcohoIN1usumaLWBtkvzWa/oCTmfFnWEQ7k
	zae/Kp/gfxXU4lx/Pw+BKb01qKNSJsmJ3JxkQY8zCXm+LvEIy4LXP6oqi6p/ZeKvdA4uVHzs9KVgh
	5oBfMwEijTnmQBgsnr2KehTIjDASoPpvAwoeU02upxYO0IQZuOGl62f24OdAlH8o8qkJBkvtUv0LT
	mGn3tIGeMHCH3tR+0DQ+CIgmSyetaozSxwH9gqX0Jxa1tWVaVpaTytiynes3gxYqSQFvrcFcc4dAG
	S8hY5Qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0re-00000008kAV-2BUh;
	Fri, 27 Feb 2026 16:38:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0rb-00000008kA9-2k1G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 16:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772210330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
	b=G9zTsGk/vDU0dAK/PGDUrbVX5nlqFHDjF92dIiB9bFUZJERGVG4rYWqPiwFS++OfDJvYOC
	69W2K+rw31x2ek40HLrXol2mMiJm5o7KTIGknnhXaME9lcUMfW3ubOcmrou56oTwxlHEIG
	vux8Dd8f16VssfKeid5f02VizP1kntI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-t7d3ZPdsNgSSRCvLW3cYfA-1; Fri, 27 Feb 2026 11:38:47 -0500
X-MC-Unique: t7d3ZPdsNgSSRCvLW3cYfA-1
X-Mimecast-MFC-AGG-ID: t7d3ZPdsNgSSRCvLW3cYfA_1772210327
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89546cbb998so213920346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 08:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210326; x=1772815126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eN+vouZzrt2RU3yojqU84OifC1c0sqNvd03CXYM2zE=;
        b=BdwLdNOcyux1p/SShs78NcMJwz0SoWm3obgB4/R61ItQ303OQ9TFh7Wq9lspq1TxeI
         CoaQIMMmpna1TvHAKeaFQysXCLkp6WRWQlZKT4RasuUAcgUfuUJmoe4NEFbcYCKHgYau
         hk5rNQofq5w6n+/RONPrCEUCZ/9SfA7yk/RGYPFVoETgBc23thkgcNtxyYGBcK2ltNWM
         ZtW2NyaKx6YQy1urJR3VtGynmxZqh+0ZRvM8NnWRbqfubUN2GUkeqWmBJe7eLI205Jaa
         OVAYpimWB5K2MX3IHRp2SDYButaMYZGA3X49s15AcD/5jihRYeTTqS7DOffvkOKfE9c1
         N/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5imEvZVRq1eQcYLBbm89085+gpq64FeCU8G1Rz8dn6Rw1kH9b7VvcAtlXLYvyiaCqSYJLGebAvUiDzmmu8C6X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6sOJFZsgyosXVCbv+cAECOpQSCXG7q0/+9HJZIPgAXGvhA0qG
	4Qf72bKw5vZsHgp6Yw1IChoKbdCB2yl0sNssgdKNkk7Y6zPhy2TYCYCcR3DgoP+JcwA5LLAuoE2
	hKKjGT867Rm3TgOwBOTOE1gsXVRIwRg6EOdf5Sp9cziZKYbN1m0sCVkDOBiwBL1p1+Oa/DZfJ95
	bc
X-Gm-Gg: ATEYQzxIC3nWWTHPtVsN4lyr2XX2Ntu0LqkQfd3fmFAyZ3gFE4OD4PPqDoFWG1haRno
	VBrJsPjwTRff4EBMjGUMheCllIIlkB31StF9goXGi0QLSQWIs4fe4el6ovgpp654J5U/Dcm3ZUf
	xJ+p1leB6Qw9Q8PerVvzXzZMH/9zlN2jA0zA6kCN18t/ySOlDFBquX0RIJ7NC3BV27ZWDei1VVK
	nGxREx79DJsllGXXTqo59KrDNdww+jGRZ7DB0KfwZuxroyaekSQMs90pBSPfQxhY2OFg6/wZIJ1
	N/X0JcadQBey6OQ+JsycWy/ELIo8BNLFV0wUYLHbJbNCAVet2Pl112WaMTRPT0XaIkDU5xfglgY
	knR/soCWOCkP9RzoILtKMGH3M3z8HI5X23o6UiqPslNy0qmMmgit+HrYm
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49660156d6.8.1772210326386;
        Fri, 27 Feb 2026 08:38:46 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:899:a57e:887a with SMTP id 6a1803df08f44-899d1d84730mr49659456d6.8.1772210325713;
        Fri, 27 Feb 2026 08:38:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50751256df4sm24041401cf.16.2026.02.27.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:38:44 -0800 (PST)
Date: Fri, 27 Feb 2026 11:38:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaHIkpuK7AFXbeM-@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NoNWrarfF5CrKf3z_rOJcobrxKjBSH8K-UYBpBtGaWU_1772210327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_083851_780517_55BBB0A9 
X-CRM114-Status: GOOD (  18.83  )
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

On Thu, Feb 26, 2026 at 01:16:45PM -0500, Brian Masney wrote:
> There are some clocks where the rounding is managed by the hardware, and
> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
...
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1cda2c78dffaff037f0f16b0f11106b63b3a746f..187f8248a9c840c701cbbba99bb7cdeef7b654ee 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -32,6 +32,8 @@
>  #define CLK_OPS_PARENT_ENABLE	BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +/* clock rate rounding is managed by firmware, don't require determine_rate */
> +#define CLK_ROUNDING_FW_MANAGED		BIT(14)

Based on a conversation in the Renesas driver change, I think we should
rename this flag to CLK_ROUNDING_NOOP. Let me know if there are any
objections, or suggestions for a better name. I'll let let this sit out
there for about a week or so before sending a v2.

Brian


