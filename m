Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD46D3ABF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+f3u/Hy7ggU6TYper9ScR7UkjM6HPFZfTcg01Knz8Q=; b=456Kd6LdZrH/JLGj7wIztdFu1d
	SN6ZZGm8u/CF9pc+ux2Wt7mDx8Bi2OFKpxQCEUrngZXLBFkZHLfTCtHfWoZ5cuYVQ1vMu0aIvO5NH
	h3ECYYmcedDoTi+B/IYYU6esZWH3cPESWq9BUuBPXp4Sdw+LxhE9+5wMaDV7j4J0vsvi3fJUAN9GS
	mhhffXtVZCn8zUoBG+33y1yyzWHFQ5+Uf/8viruClF3BuXqKDlMwZcdlL8HNmFhOnck6ndE86JUoT
	1b7C7oNGQXkjY9fxtDkRSKETTFLJC7LWP0aMVh4bUPfCjUU8AamADTzyX0NC5+FyFkJFBx9GH23OW
	FuSBEvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAa1l-000000012tE-2SLv;
	Mon, 11 Nov 2024 19:24:45 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZzx-000000012e0-3kxL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:22:55 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2689e7a941fso2859352fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 11:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731352972; x=1731957772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+f3u/Hy7ggU6TYper9ScR7UkjM6HPFZfTcg01Knz8Q=;
        b=Evp6AKMJeMcTe8Jv9ukYj5g9Nvx3vAtfR+0MBh6j/q7zrOg0pNR1FhJ9fkWH3AoCgD
         cXg8FyzHGT9xxrOg+9qJIPJwidJ8vNYHW7f+xKuCeQqsjqq6TPLK4Icm6rieNhnknXmG
         dHyt3+jlxVZLNWh0Rk8x3uVv98c4iIvXWv8mkR5YqcxzFy9X2YI9+3Yel0QPUsZsIwir
         7L+hBkdJdV16mxrN8oeZQHHxR+lQEzxVrst+YD7Bsr69FgaEd3to7MlRpxRBJxgdyFU2
         LtdeXFMLhVcwHThOHiwgBhuRXZqipdK+h+JuFCl2ridkzejbSyn+qx7d0oVm2npTiUNf
         roUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731352972; x=1731957772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+f3u/Hy7ggU6TYper9ScR7UkjM6HPFZfTcg01Knz8Q=;
        b=f9VSbFqnCvcmmR+pqzfIQo/HF/UoY81JgmGHlnxz4YNPxAnwjn41/Ii1uRzm0dQWit
         uENCfmMFicsnUPyVoxByIljZ/qW9cojkxu1XOKO5qxiVnTBdbJJlDVoxR3L407U0udxF
         O6+4QmhuO3AtHaeQVNZlX7BqeAnrLjYopC4pteRGtffU2t1SvuEEYBdhETsxZy25imqy
         nIZGqtodSlZgdlwoGSvvu6h128wnFQN73JtNUbTz6NMyTB/03fmD4KtPdhlNmXGfssLG
         6FXyqFeHS+QSjEFNpkTuJ+6EEgtx+bEIIX/XYQV4TRFf53zYNgWeYYHfpz8XMaq8b9VZ
         kcWg==
X-Forwarded-Encrypted: i=1; AJvYcCWU6fvkRywArD/7H6BzOC7rpRcPZ2u+4VtGm7MDb8Y+6JDPalfSBuiTTbdjmRuCRIlrsBaJ36P3f7diobdIx/Gb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywljv5RSSAMevfCqo/Ha9tge8+qQzt9s0qPOcJvJLjb7xHIJVGL
	EAtNi41KGuXx4nF+RrqXi6REcO0EdTOqB4/FxEg+dZJ6a876TYo1
X-Google-Smtp-Source: AGHT+IG2nHO+Bg1rkJrf7qfukU+vp9KRWNaZefDaFklMRxL7gpN5i3aVFdozoWQvKm9ndIshve7DYA==
X-Received: by 2002:a05:6870:d110:b0:287:3cf8:4abe with SMTP id 586e51a60fabf-29560099278mr11079889fac.18.1731352972553;
        Mon, 11 Nov 2024 11:22:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f644036sm8879120a12.66.2024.11.11.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:22:51 -0800 (PST)
Date: Mon, 11 Nov 2024 11:22:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: hwmon: ti,tmp108: Add nxp,p3t1085
 compatible string
Message-ID: <afbd8490-f5bb-4ca3-8da0-aa1f01de5efa@roeck-us.net>
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
 <20241111-p3t1085-v3-1-bff511550aad@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-p3t1085-v3-1-bff511550aad@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_112253_955699_DCE88FB3 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 11, 2024 at 12:31:58PM -0500, Frank Li wrote:
> The register layout of P3T1085 is the same as ti,tmp108. Add compatible
> string nxp,p3t1085 for it. The difference of P3T1085 is support I3C.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

