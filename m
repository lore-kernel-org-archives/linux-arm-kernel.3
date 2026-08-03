Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952E4C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=; b=COH2ahMYYv2TSurWwdDGR2yp/s
	xTXG5MYnFflRjtw873vMFZYSAO3N7G2ooDrq1JZ0cOcxC7DGVDKGcgWPaDeMIpC3ciu2zlnEQesBv
	JLj47vNUrEaWOMumlYCTM3izAyWm4dcQ5LZ2s46dertzpm90JBfle7ZsL7AgztKS3569FaRRe4dQ1
	8d9umPTabDExnumSMz5nSz5OWNFT3iEfkzadZqu+Gm8meu6MG3qLEYBRnRzqnoZh3NxkQs8FQkvig
	8VoIDEOhhATbfbBO8i+FJM/nLNQNFuwl6L2FP/SnO6dapzw7jNmnLUuFLQDNNoBzdnZTFhkx2KSGa
	uOUM73dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvAW-000000000e6-0sEo;
	Mon, 03 Aug 2026 16:05:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvAU-000000000dV-05WR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
	b=IvCuQrHNqAxukO5AaQ6Avure5gpxAfZk4Bnvrkk357CPjv0zG25eC9/nGQVSt+ZVwFAkGe
	slxHSKTZqtf9ZcDcUJ5KJrZprfPtO7NpbyhMWHkWPnAtx3wsvj+cGjd3uZhIMZhenD8zwh
	DxCRKQiNeLHalW9lDU+4NiExkcEhi50=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-1_wrmIZLMoC0leeDzKWXHA-1; Mon, 03 Aug 2026 12:05:31 -0400
X-MC-Unique: 1_wrmIZLMoC0leeDzKWXHA-1
X-Mimecast-MFC-AGG-ID: 1_wrmIZLMoC0leeDzKWXHA_1785773131
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fe835353acso54802497b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773131; x=1786377931;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
        b=HXTTuDqahK/IM2iZ9b8+ZrPnKEZ2ZgxS5IJ0r7TBozRNlx3ltyZzZGhhY1wYwhggVI
         +xZc1OIqh+aODUziWws1yRE3BmIlfVoKtsZDA26TtNEdQh2DaYaLrgOk3gPrnkFgUbtQ
         K1SQDReyH5peDFDBi17E7V5CSmvbRFQJVEfG1Hdb4mAbdCgDH2by2nbiyGON3fJENdGL
         vl6Cc7zsuGdBReE5aGChucAQH2aF+wk8qF3VbJcg7KA1gC72If2IHxcB3YE7zNhNC+iZ
         goMnN1Whk9tbDR7aXJ7cZ4jtvsvzHd7g0qoYOSsGFj0h/x9NQoZhqNhVK1prsLypbmUh
         exlw==
X-Forwarded-Encrypted: i=1; AHgh+RrXgSsKVIBPkn9Elpl6yU2PyqAMoehR8humHz5kMff4WW+f7TeQ50FsFHwQPzsw1witdT7x67T4K7T4q7LwrPsK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw10vxTqSvedITMC92GYfRI61mv+8EDjsF6rG4RKmDW0AjXWvrn
	XGQ8B4eRYLtHGlOo6NniG8ZUIRiBvwt54Y7hfoqieOeK+5sC+OB9ZsBzBULGJPXoRguKh5kYtXp
	abznRgf/4kg50kqEG/dQOOzegkHbdglyJMw4FII9DrriMHkT/TlUBb2CD0epeWP2/UILmyiefVR
	wd
X-Gm-Gg: AR+sD10BlVNlnNsN/Ey/m9Dl/wv9HQ4h3cv1CNX+zKqqs00p5r1E9TTdq56cf4VFPmK
	1S5nJ4EVt+F0D9CIyiA3YWAAwxYU4YN7NNnblw5T44mrhRA+my+KFFy/LYUqzQ/nSFnzMkLGkiI
	j1jZL8uObW8f+9BlX82K8xHWc2zSIC2tpa1wqwUrK2m4lalMOo1sfJtT5XCcQ9j/ZNqNGcjSQLW
	x3PBeyINwx4sySxZvP7S71nzHVMQK4BCu8cEfytcxfyjsLBE8cMzv96/oTt7fX6YfGqIkxSMcLv
	DA0PqFJsxqlKwrjEb7IueWfWkgEpkNFfX0nHTtOYeT1KCOMCtemsB9dgS68xe33CuYROPcbbKfE
	oBJsdYwwIrdnB9cH0NAPGBRW0ZvaJ33bRBGM=
X-Received: by 2002:a05:690c:6f04:b0:80c:ebd4:762 with SMTP id 00721157ae682-81fd49b4b80mr130783397b3.7.1785773130737;
        Mon, 03 Aug 2026 09:05:30 -0700 (PDT)
X-Received: by 2002:a05:690c:6f04:b0:80c:ebd4:762 with SMTP id 00721157ae682-81fd49b4b80mr130782967b3.7.1785773130388;
        Mon, 03 Aug 2026 09:05:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf30319sm57712047b3.6.2026.08.03.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:05:29 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:05:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anC8R2Nxgv_w7Ahp@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FoQZwoLIjmO9H0Jh8r3bHbhPsGxkhAbySCntHseyDcU_1785773131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_090534_127927_79C8A920 
X-CRM114-Status: GOOD (  17.21  )
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

On Sun, Aug 02, 2026 at 11:33:37PM +0300, Stefan Dösinger wrote:
> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> new file mode 100644
> index 000000000000..175fbba3e0b3
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#ifndef __DRV_CLK_ZX_H
> +#define __DRV_CLK_ZX_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
> +#define CLK_ZX_MAX_PARENTS		8
> +
> +enum zx_parent_type {
> +	ZX_PARENT_FW,
> +	ZX_PARENT_ID,
> +};
> +
> +struct zx_parent_desc {
> +	enum zx_parent_type		type;
> +	union {
> +		const char		*fw_name;
> +		unsigned int		id;
> +	};
> +};
> +
> +#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
> +
> +#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
> +
> +static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
> +						   struct clk_hw * const *clocks)
> +{
> +	struct clk_parent_data ret = {};
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		ret.fw_name = p->fw_name;
> +		ret.index = -1;
> +		return ret;
> +
> +	case ZX_PARENT_ID:
> +		ret.hw = clocks[p->id];
> +		ret.index = -1;
> +		return ret;
> +	};

Stray semicolon

Brian


