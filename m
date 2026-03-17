Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E01F3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=; b=ZTQnMm3kEGIz+TI42J4HgzgTpS
	aVtL3G5Ep87BVZFtYh7roztXAhXo5S+HQcLHFm2VXHCjrMJGPA/cOCJCvG8GNjamwQ8uLU29geAib
	icymDm7hX07SwUs9PVXecTDOTEytWr8cANa3V6TtKxxmW9jOYrIucR6Q02lNwqwpV8nZlV9gtdquy
	FuhSh8Gmn9QsBcvfgZVHYResACs+8vNVJ6Ay+ikO9j6w3KWfR0Q0FEEVG7Xni1DbyqbZ08xlpaoCe
	Js92Enqn7qiAtu15eSxAwP1ywjgjtosnV0EE7i66N1aSYD3WLgZoXuynP+hWf50hNILJ+/BXGftD1
	iymQSXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P48-00000005aqV-1lwj;
	Tue, 17 Mar 2026 07:42:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P41-00000005aoD-191A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:42:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-827270d50d4so5073553b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773733324; x=1774338124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=;
        b=NZ4mqTne0r9czJGz5+Z26+xbFd8DSpZ6/WItfszsp2fMnbhL60uGm0KiZ3hxDOaaUb
         g8KNHNJtElSVY58RP3zCfke0rLwZhQyOvQb62cXK0Scf+BdTajDkxl7RrllwiGbsLH9U
         w23EFydO/J8Xva4fQNGhQw73PAM/cmcmh3jA1Di9ZWwv0YZh8XYk5w3eqg5RHAJIVoEP
         FiTiMZByXQJfjiKtiQXK3YSuraift5yQHYg02SzoqyO2Emxc2DxA8OR546W76STKyQhT
         yaYsj/yYgwmQ/71NHcwo695Rp6LlnodayMx9mvh/X4xKuDYuWZjei2pXxjxrsBAc6ogn
         NW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733324; x=1774338124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=;
        b=lp4F+KtxLUVl/DvjQJrNsB7eb0GcoBmfNlO3XgOFfjogdfUn3fKB+cLa03w/XbcohU
         ldKWTKaB0fQqqIHHMlFytEdG6sZxpQ4lwm4cYh52TdEHJYcqQoMk8cZuxOEPEE1Zzu3T
         w9TvDGMhn7TiVICEbZUqwucNoc37YDzlSzCPMPeGQTdaSwU0FqENxCHOYFh/cNPOGjXB
         jTz9caTsV4wwxEiSv3qjASqGUNcUyIv4yJJ+V+LvQxNYTx4rHzlh8lcK+ksZrFXImW7d
         9vUD7grpONpQM+N3HZ0fpQYTeHMM7KcEmKwn2fe257UqAvm3jV11fz0KKCA6/SXs0l+U
         JVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAJf+UkGNCFUf313LlOQqgbzog+CmXoYgJFVB1KIS9t2vI8EDgttaFGDcYPn6BbQse61wJxJf54IemJLdhLOOa@lists.infradead.org
X-Gm-Message-State: AOJu0YzqmMpaX19QMoQvzcf+iRtAhJGLzdHA2mmdLclvkDpW8tazBhj5
	hUa15aGwOrfOPyk5PnpG+sLcvpPf/Y+Em6IoYdhysOJCpvrz+aLU0GRn
X-Gm-Gg: ATEYQzzGMxI3/RYfF5jo/xZVfYj4absnXb8kuANUgYDNBmvk+kNHXQHeOG9Z9kHbXxS
	7UV0/ZJfj5nR0S34QRA6BEQBMardkXjXeqA9F9AuVknCOaCe2pN5MuYeW7iRxYZEkZ/a5Kv+Fym
	n39q2IWZezNWT0PtsbAsrtZNTJ3kolunv/UsESUBOS+sevnOWlI7Ihaf6zv2d0bCjjpffnF4Qer
	0CNN/26OjwUbVuH65vmW13q3wXsZMGUPuEyK/cmNMprE9DdBokvs8gWR5rGGrz5TMIKTohJPkKY
	b5cY6lqsPCMkEeRuosnO3iASi2/OpPCDVjFQMuUvgSQz+ddKHAINy3i+KxCW9YwyQUoXOaNETh1
	av8EQFOmZY5bhGMWb0yo4hUAe/38hZSH+yqcRbryGVmWc88FMjhTTJKqgDKrvf1O2THNvdnMe2f
	W/IsN4Xs1wVVIYlcmeqT1OlWc=
X-Received: by 2002:aa7:88c9:0:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-82a1957f3b6mr14731969b3a.0.1773733324070;
        Tue, 17 Mar 2026 00:42:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736deb4sm15367325b3a.44.2026.03.17.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:42:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:41:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Zhi Li <lizhi2@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <abkEPCRBkQIgx5rx@inochi.infowork>
References: <20260316010041.164360-1-inochiama@gmail.com>
 <20260316010041.164360-2-inochiama@gmail.com>
 <20260316202147.431d9aeb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316202147.431d9aeb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_004205_319481_86D415DF 
X-CRM114-Status: GOOD (  20.85  )
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

On Mon, Mar 16, 2026 at 08:21:47PM -0700, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 09:00:37 +0800 Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> 
> In the previous version the AI reviewer complained that we're not
> adding the new entry to the select at the top of the file. Other
> compatibles appear in 3 places in
> Documentation/devicetree/bindings/net/snps,dwmac.yaml
> 
> Also I asked whether we can drop the "default m"
> 

For the Kconfig, I think it is better to keep the thing the
same as others. And I guess this question may be related to
some compromise that I do not know, and it is a hard thing
for me to answer.

> Did you disagree with those comments or did you miss them?
> stmmac is a strange beast I don't really know what's going on in 
> the binding, so just double checking this is intentional.. 

Oh, I have forgot to reply to the binding.

Currently, I disagree to add something in the select, as a
new binding is always required for a new device. Even if it
is already supported in the existing kernel, the new device
is required to add at least a new compatiable string for it.

Regards,
Inochi

