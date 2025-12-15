Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D659CD5B16D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 02:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=; b=0Wn9hiX/x7evb11n3F86yLAolL
	twdZaKvOgsEUAuV3ZiXFSOXhSIUSiCuwjWcOUx7sHSji7CuIKhYfMWxFgjC1O7EZ4N6mucmK/oe88
	QxJzDv7I06+qtBXgR+dAcJqEToyW+xYc8+RLeGeIbEbeoprqDSC50H/E1Zu23zDOWrHf4+5Di2+Mj
	5T4y3ZJ8yk8DNDvBPSJynMyRB/sXLcNV8rFuMnotwI6XPM4oY9vBEXSQ3n8H8+/sOHQPPVX7YFEkR
	Ti671D86cnTcZySIeY+QwMvB7b4bwXMjxQ3tIQ3SH6oUv3LgqONT0LPOp/9ljzz15cNZ/in0z1DbC
	x3sura2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyBk-00000002wKv-1k3r;
	Mon, 15 Dec 2025 02:19:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUyBh-00000002wKW-3kkC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 02:19:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0833b5aeeso26085545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 18:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765765189; x=1766369989; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=;
        b=nqJO4aPAfTSJxJKo0gUuYQA8desBS9csdDQ8B9yLK2LUPktmgfzHdPcy0c6raSf+ef
         whHrth14IWVhInYwgN+f41TbJCATcpSlkgjuuiU672mh7aMVoY2HqWk4Cb7I8BpeM3Sm
         Fc84U2I5OfCShx7O6WX2ckCtcMNUS5yRNSLZLsCX33WRv3j+JBWWDs+bevre7SQYUlVP
         q2yH0JjuojtXeEPJM+TdYcgWq8rj5/chj1ppk+JO3k2HYVMORX1KucwBIkbBBTn3Zlu3
         YZ03Zjtn7uALg+AQN+atocKxsmT0W2O9ZGiygzm2owa1iNahid6MpWCqhE8jx6E/R/In
         mj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765765189; x=1766369989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyQpy40LuVc+jIOEZN17H+ajGzV6rjuUMt2NowJl5CE=;
        b=lKqYiiulZkx5HHQ4poGkYp30U2AcAQbw0jIhvcqWSfoM7v+Xt9npRlRUzdD+bFvFZs
         ouLEO3qIwLO6T9jL6oNoQkDufgu9X9LZJaiDfWSoDdj8PM6ez8bstBPLto/tTACc9lEY
         agYRWZ0VKlQJmukijDwsbjwx4xbuGwIdlJ/9bySdp/ihWc5ioZU4AnwD0LDvJ8IwLeO5
         sJWddRFXTkl4qpmwz5v/68b9WzUru0eH+BKWJVeEatVmm8xNvVYJBVRNtQ5ct8LeEnPd
         ZPxF+TMwRT0LwVpx+lZh0p2Kk6PfaMK99maFv90jrk3Y4ODeH3O6ZuzWQTywVKSpqZHi
         p/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZAXS5GAQ0ouz5Zy59ICT3+qpE28T5+glWG+iKrD/Iy/+6HPiZbAupBZpYXOPatdxV8fYpc7iY8djRGNZBa2YU@lists.infradead.org
X-Gm-Message-State: AOJu0YwinaJuMxiWKYsXNVeMGVDFDZ9SwbbmLwE6x2QCTACxdnFT3K1R
	p/NzmybVBa0s/jEtRg8raSflT6aAgvF7VAW6TZtdcN9uvsEWjsW0+vPWKv4BLbv5vdk=
X-Gm-Gg: AY/fxX6eMnhcoxprSpd8zVEGwbWLwRYqr3TOkr5D935M/NW3PmbNu5dbpXnyZg3OlLC
	AwYomUmuZPBhzn/6GKHqRnrOtj/jkEQtsvdArfGinzk3+8g6smcKEySkT9cbUU3FkcoY8zmE371
	MH6h6VPGnFWhtGI9Tgk/iqNH4ZL5nSsTbbkjknksAFjcrvjn+PN2Pzuot0oAeilpAo/45cu2JdQ
	t2DoUeMXhfY7xExC23bnL2yGdLGLeE/tZmg2upyA3KWGgn/QURaUpkTVFhKXAM+IWL+UDI7TGNZ
	Y2fFHkPT9pl5YdzLIUIHoDFddtTpshAhMVk4PhOVbCHb4GxHxb8+hQfUkaayECiJsw1B4mpJT58
	bjnN0ORQ1G2lwvjlWWKFz7cqHABb7zaRGvCA1QZWsgp4h74pf2Y94qtEeCjkSxgHUby8uP/OK3C
	PrUV5HIcJQoyzC6JgguSLI4XWUflVvG5YERsfn9ecLvQ==
X-Google-Smtp-Source: AGHT+IHIU/jYZqSE4lK3mrtbuZ7ZFUKFi0MmSupmKRFzoKfYEL8mWKvDxqp7/lHuRh29MqAgh78KvQ==
X-Received: by 2002:a17:902:f544:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a0d6d5b935mr26580395ad.37.1765765188823;
        Sun, 14 Dec 2025 18:19:48 -0800 (PST)
Received: from p14s (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0e96df1c9sm15403105ad.39.2025.12.14.18.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 18:19:48 -0800 (PST)
Date: Sun, 14 Dec 2025 19:19:43 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Message-ID: <aT9wP_3olsf7WbPL@p14s>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_181949_960860_A85C31E4 
X-CRM114-Status: GOOD (  16.68  )
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

On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;

Before applying this patch, I want to know how it ever worked before.  How
did DT with a suffix tested?

>  		b++;
>  	}
> -- 
> 2.43.0
> 

