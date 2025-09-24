Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB749CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5p9OhedmlgnqtH6MtrKzkYKSqLa11Xwu0UHh8KLtW4=; b=Gn8CwrgrrO92wqX57ADzpFCG3F
	mdx4gT2h1W0jcBtJRm5bcpZZPM+Nrr+BpDk1o4SeSRon5WVaUFc/9Sm4ub2JHxzyzCuSPD8yRySEr
	LnJv+xjJtug1FqZwe3LbySLoteT5Np/b7TUxq4zTtyasKL/lPW/VhbOPfdBz7IZIiT6EI9UqhA2qU
	qt+pP5+W8CkUVdZUuoomq82auEcgP8s8cbQ34lIZwkFbHELheuaW1lrqLOnsiFs1tJXnzNEQBvHlL
	wISsGWEbZaoVpY20F9kLjF/NPHsrpY9Sh/xLzbMkddAK7IWFdXpn/+psC/0v2oxlFstW3CTlK83aA
	qVaOfYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1T10-000000020o0-16uA;
	Wed, 24 Sep 2025 17:10:50 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1T0x-000000020mW-1iCK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 17:10:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso316333a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 10:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758733845; x=1759338645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5p9OhedmlgnqtH6MtrKzkYKSqLa11Xwu0UHh8KLtW4=;
        b=rVCD+zUT4485IPNjBxJ0LucOul8cGHxvZzp700qNnLajPCV5y9kEOPr/C2wIb2+RG+
         y+8t0oBgHgocckJaJ9269/SumRbFBp7eG1rv9vDEwYvWmYFLLeF22zJLFxKFH4s6V2mY
         ZHjvJOMArThRQLSTRO7H1FIBCKJVc5sRMpxu4mKpL025X5o04sH51BEBKJGdEagJfP11
         CeU2/6dGpJSqqrAzfbqIBAWrSjUEzi6+ETKzlpC0ycPNQvOcgU89ILeBsmQc23p2jMv/
         ZdG83w0obiovytrQeGxAyGCElVzlWKDJnCnbgkmsMh3zmNUy/fk1sCa8lJpYhmqrWUZB
         PMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733845; x=1759338645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5p9OhedmlgnqtH6MtrKzkYKSqLa11Xwu0UHh8KLtW4=;
        b=lB1wcihv70jZXObo9mH8Jke4jmWZWDtvjCt230p0/CWoBprboI0zbPQcIRQ7fdwYxQ
         HHA0wGvQldIRT8JlfexnNI/sBuZeO2xs3uQ7IxqRlkSZi/i7F5e98wQBZMei5ryXG4nY
         VZ7vH41VoCEpoZF7X6eMZbMjvtdNKXjbN6TEIcyHWvMWAnIxChV/5L1CFT/RYmlbvLBH
         9WoMB0at8Sgf5TnVBoJUJxWxauySNZPD+7yNdiXe0SJvbN/Wdf7I2xoenpt8tUulQzbj
         wLlz/tKfo+Ysa5pJ+6hRhJqctgr9qEHc+mQ5lKn9VwUzpIaHP5xxCCSiPS5s2DnaeURm
         VkrA==
X-Forwarded-Encrypted: i=1; AJvYcCUp+vxjYWcZVNZ6aAVPnc4r61pb6aboaPqWHakzH9HqTVIIAQWFmtXA4rTonNF9cGfwHndQzANdJN0hgXaRmQEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxMiRx5809MmygmSitUXA+GRWGvqgwjkxIVoyN5KDFwavyJJak5
	z2rUGV1xMCr8Wxu+J06j6JuDAuO3jY2k6rxZc4pS0NHKn08j6/oS+pWi64emJWvj5uMrQZWgIm0
	y3u7ff7Bf0WpIFAyZhtcDkbh+0V/B8R2xSfd1RYvkyw==
X-Gm-Gg: ASbGncuyTkPwjtV4pq0Zn8d4xPjZF/4hF8hkMFKScUC2/UZyR5ogwqQV2MnzJ+2jfSz
	t9thweznl/gmpo91aV0JmtZq8yMGECihAQDSJ907ULnbjIZTWPoO0f4zkft5YgCHicYAci0+9CA
	ec6hhiogrrrODOYfVW9hD1EYQk8IQVzm3RbqN5oSIQr5iN6dBKdUjU+3ZqxGvJmHESEk3KYMkPI
	hPZfJlXyibC4OwdIMdJioBP2Aou4HDQhQ7Zwlpz0/Q6sntyw794BxDXq+6B8z/DYRFtM5haPknt
	EPX1m42pCRwDsDWRjQV6fT0XYxNEBB/PV0j+VRKc
X-Google-Smtp-Source: AGHT+IHZl+DbJWqzsW4usvg5XU8XG95/QBxRsXHVNuqnHskrM2O5sL7CTEM1KL/dJojrWYwbNX3q4vepU43szuZh3Cg=
X-Received: by 2002:a05:6402:5612:b0:634:66c8:9e7d with SMTP id
 4fb4d7f45d1cf-6349faa3493mr143723a12.36.1758733845069; Wed, 24 Sep 2025
 10:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com> <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250924164650.GA2711@nxa18884-linux.ap.freescale.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 24 Sep 2025 11:10:33 -0600
X-Gm-Features: AS18NWBF6pgBTDh35FbgLrsaT57uZ-qc2vyxmLVdoUBaK9TLl5St00uV6e6iIsQ
Message-ID: <CANLsYkzWQEWKM-_iff7wY-sk_OERFiAMSrXP6Cyf8vJfXqunjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_101047_639155_AC81F2DC 
X-CRM114-Status: GOOD (  20.04  )
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

On Wed, 24 Sept 2025 at 09:35, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Hi Mathieu, Bjorn
>
> On Tue, Sep 23, 2025 at 01:16:32PM +0800, Peng Fan wrote:
> >This is the 2nd series to cleanup the driver.
> >
> >---
> >Changes in v2:
> >- Address a build warning in patch 4/6
> >- Add R-b from Frank and Daniel
> >- Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> >
> >---
> >Peng Fan (6):
> >      remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling
> >      remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
> >      remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
> >      remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
> >      remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
> >      remoteproc: imx_rproc: Use devm_rproc_add() helper
>
>
> Sorry for early ping - I just wanted to check if there's any chance for this
> patchset to be included in 6.18, along with the other cleanup patchset [1].

It seems very unlikely.  I am currently looking into how the PM
runtime framework behaves to address my own questions about this patch
[1].  Furthermore, I am worried about the usage of the device
management framework when it comes to freeing memory.  I will get back
to you with comments on that front when I know we are doing the right
thing with the PM runtime framework.

I dropped the 3rd cleanup patchset.  More than once I asked you to
submit only one patchset at a time and you still refuse to take notice
of my request.

Mathieu

[1]. "remoteproc: imx_rproc: Fix runtime PM cleanup order and error handling"

>
> Both patchsets have received Reviewed-by tags, have been tested, and
> successfully passed builds (arm64 gcc) with each patch applied incrementally.
>
> [1] https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/T/#ma16bb8a38300f6eb333ee04f00d57805aee3c114
>
> Thanks
> Peng
>
> >
> > drivers/remoteproc/imx_rproc.c | 128 ++++++++++++++++++-----------------------
> > 1 file changed, 57 insertions(+), 71 deletions(-)
> >---
> >base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >change-id: 20250916-imx_rproc_c2-2b9ad7882f4d
> >
> >Best regards,
> >--
> >Peng Fan <peng.fan@nxp.com>
> >

