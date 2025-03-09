Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7858C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jv9BJK8h1smkPFin/eoitVvyZGcBn6mtj+ZWUnOyrrM=; b=EwHlfkQooTijcUkpA6KpIPH/K+
	SXmHmTsH759oG1N2Lzc9lOa8PDk14m7F53xnO0Ku18+B7UqaIZxL5BQv087owUdG9P/foJ7h0Or+s
	t41r29zKQ1rfGXxpQjRSrzw/NYKXRXTlTzqlaFUOuHT/4kc21XrWokwsf21Dkih8m+KZpWAv7IdqK
	PFVqM7B6sPBRY+q+o4OMhHFebIgUbLRGDkN42CnWV/nco80r/rFf+gLc7cwkDGYWjatB6DKh0EFyw
	tw/iqjorRIChiwctmzxwQ1R068aL0PcQKb6/V7OfMighm6f0EEwAZoMzsaghtKsSfGgyfpWlr/4SH
	6eDuKU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCty-00000000HJW-2vIr;
	Sun, 09 Mar 2025 09:24:54 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCoY-00000000GaV-1Fkx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 09:19:20 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e5dc299deb4so2760487276.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741511957; x=1742116757; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jv9BJK8h1smkPFin/eoitVvyZGcBn6mtj+ZWUnOyrrM=;
        b=WbYd5gzVVoetdsqJJ3dCurh8diz7M75W2N6zrYP9i40rLrwvFwMFJuQrSCGQxfti1M
         AGNrpp71gXdfrofJzW6BkUbWooC+x22nAlce+XAhnLaTk6fq2yrCY5TCuvU/cPbKWfR5
         Mv/q05iON0fgH0WwTeRenhFZDxwnrQEZF8hXeby4HK1a7XRcSgw6Cuv/TP28s30BirXi
         sbwabBhe1DRrF7GkUXw93FGXDgNKeF/JiWrdC0fWUmWjcWIJL0Yg2oqxGO9IRCWo/aoT
         Vv6LPekB6JgyXSpm4ig4wS5/NBuD74MPrG42RD1yRR+tnNpbJe+wc2cUSdl0wZ414YTt
         Zliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741511957; x=1742116757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv9BJK8h1smkPFin/eoitVvyZGcBn6mtj+ZWUnOyrrM=;
        b=Bq0I/4eWXL1RL+971yBBMz3B8GY5sd9xrbQ8AgjSyQfpyULFVFHBtJrXzyg36onbLV
         kOOfGpXhsOqsf87NF+H8qThvcKU/QPPx2AZv//TsjcJn12MNzzqaJ22p33rtjvXkq+1u
         c3zYhAkNuKBeV24ySXa3BHAGQIk1HqhwMlDJVsTI/bA8+SinYT0w/FoBhA3pSQGZRl2v
         ppjGOg/NtG8LO7d7Miak2hEc57e5UGJgAUOnCsDa3tiQYDmK5n2oGNMosaDq9ssQdnYi
         NjermskMV8plKlPBpHjpMi7eYG280Pyr0lYVFeeosCpUppRj9YOO79hTlFDCx519bLzA
         KgLg==
X-Forwarded-Encrypted: i=1; AJvYcCVKiB0SoXf9E3bWg3DqMsF0BZsUXOXsHnoYNtUKmVIhwOo6ra4s+j22pk1a9Wc1K1Fjv47xRvO0PVkiyNCHOBPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+R0f6qGAiCurHJ9wJPTiSJ7wr/i9tFF6Yf02BIUXPId4YQvUK
	Zb0iG+9wru+h+SRams5AOg+k7R4v9pzokxolgJzcUETs1ErshGjxbVWcVB9xnCMGZbApC0fTHRZ
	SpSWPjFYRd6En8RPD1MRwqkux4vFuv70+20eCHA==
X-Gm-Gg: ASbGnct9PUnj/uQ/I1SGNhyMqycNX6KP+HwTeARrnqE6MZ8l57CkGxiD9tsDqPWZCVf
	86hARciU6GsqepQ4BpyO97XEfjKL18Sq/LCecKMCxQT9AveiP+9nT087GvVmCPA4cZjt7ZJsEvl
	iRm2rPDElZvlMcVHAt2mAi2+w9new5Th+9zcveQJyM
X-Google-Smtp-Source: AGHT+IEu/PQ12bVNZYXCd34qYJvUqyHf2vmlZ85Q5AvR10mVaF6BlXxpWuNpl9htbiSsYttCY66TAN4aoeQg9Ypsf2c=
X-Received: by 2002:a05:6902:320c:b0:e5e:2428:fa56 with SMTP id
 3f1490d57ef6-e635c1ed376mr10933687276.41.1741511957257; Sun, 09 Mar 2025
 01:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com> <20250308-phy-sam-hdptx-bpc-v5-6-35087287f9d1@collabora.com>
In-Reply-To: <20250308-phy-sam-hdptx-bpc-v5-6-35087287f9d1@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 9 Mar 2025 11:19:06 +0200
X-Gm-Features: AQ5f1Jo6fNACL-x0ajpVmroongj8VydVA56TBkhnTi7aC2zOMYCGM315yQKl7gQ
Message-ID: <CAA8EJpo_AF6BHCDThNncuH36VHZy1ZJX-=Qj8mj7-UZY41rCuA@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] phy: rockchip: samsung-hdptx: Drop superfluous
 cfgs driver data
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Sandor Yu <Sandor.yu@nxp.com>, Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_011918_342817_3B4B448A 
X-CRM114-Status: GOOD (  11.86  )
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

On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> The ->cfgs member has been introduced via commit f08d1c085638 ("phy:
> phy-rockchip-samsung-hdptx: Don't use dt aliases to determine phy-id"),
> but it is only used during probe() in order to setup ->phy_id.
>
> Use a probe() local variable to store device match data and remove the
> now unnecessary member from struct rk_hdptx_phy.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

