Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0624D609D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=; b=N8VearK0X6+1bTtFGN6WWTWARQ
	wt+NGBXkx+7K4vsIbbEjbke/YFN0H/UdER/xQh/2+MlzX2PcgaP1AkRcG9F7i9kuhazTiqfSQJB3g
	6QvxKrdaGB8lJ9gQ0be8ci6aVu2QtkUUU6cGvLqAIFY2r9C6cnLHyYltzvzaSN+hVTYaNv2fnOc4G
	5tEX2sZEURVLMonR5oNij/x4UPbdq6Z850nfYbYffJdkoIYv3SflEIe15jvL0uXLTtCz/wUZrkPeR
	G436Ylnj5OpfsldMNbKNl0ytOqRB51Uz0R+rGpTKSayvRbYsi/uOHyBxOWMq/8gz9cqgviZ2DqnOO
	qMkV33bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZoQ-00000005iMA-1g2b;
	Tue, 16 Dec 2025 18:30:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZoN-00000005iLc-1fRL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 18:30:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso43546435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765909813; x=1766514613; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=;
        b=XHptvD5TOCQBfqkP8kuSKUDi7pbXD3U8VdMVZKJRqY9Z+smOc480yNVRZF5b6wlGXi
         zpts2NCGniojiqbi45Eum6x6M9yIaw6G5sn7gDfXH0bqYisD2EsGM7VXEDTj/6adH8Yf
         iBrN7ZQDvbTj5fN7dFtrdgbQJyCI8IHcUFlvphg+tI3L8/bbVAJtQmCkIciOcqEWr0Wa
         8DGfECqbUfkKrsXwkEO3Fe8cOe+VNq//ghfyBHEjAcx37FGxr6CZFsEHPgBc+ymP0jBH
         Kor4LeayTLDW2C/srU3QrUIp3J9kmkjP7DtRXwCJTPrcMm7dP3loTU5mvAInJ+5w6jqE
         lgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765909813; x=1766514613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=;
        b=xJvHZrslMSeeujzLJqwXY+SuEZS8Ge0oJn1gyzFLlpx9tXEhg9mftdulvIaqSDVwpu
         jXGwqqQBTqWILhlvA3oov45+NZp6zkGfrtLTarHVhvqZW2iB/TBx6CG8pUSkS5hUr+i9
         hOVATHKmG1JTBJGKGCz3DCs6REJRzGh+fXKCfQ+eIE0TEe6WVGktYfUhsy6MZr5zDBch
         3ZLqLj2XAfnE8higXwEIr0LaRfRclmgI07tzCnpx3borSe//LO+xUw+N1vgqUvOq7lWA
         jCZVywz5fUKC+uF/PYsPOKn0nucrgTv1NKRrk4h38TZXQZhAbjxnHNgRM9DiTEh9rtM6
         jdGw==
X-Forwarded-Encrypted: i=1; AJvYcCWSej7OpozTrLXvnmU+xySTaMICU0fBPsAdtWZKD9V8fnhJ8JUvyfrsKm9bFYvLrDNgMop8DvGL6m9+5x63mw/O@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa9GXgNe8PMGmSj+Cxw7CEMhnLtcyGt1zV9P815s9KzPe+SBaA
	cDz8bPW60ML42GT+x89xoABIRNJG0AYLfyYOEklGdUcFYdUf3pbrwleLxzxzgDPW1qo=
X-Gm-Gg: AY/fxX6slBPffDXzDd0Mi/KLhL0LKXC7GVYcpczq7gzCPc3CJ3eN306JN5tFb1YC+mr
	Opzfk+NlMfjTAFT37tZ41Jv+5EJGTWcqBM4JGI1coylhT2L6EkfnQY98jeLOnPEd6TKectmxJxi
	YQxJzSmBYgQxKKKlEdjn7owh6/ovK/iQmaLtKtOW4EJcZNicFBYJoNvqrOi054+rKxqVW6VLLa2
	VDO9sRMpS+pDQU9jWjYcCdJrD2XGNXoQ8grgfK43I6u8PUjDg4QNseMqqbVwYtUsk+7e23l9NMo
	2GrPD+QhRksqikZUKXOJV+T4win0zzsg1aUQKJN8lObC7Kp1kymK+9epz59rKpat4ftye8so7wI
	90OyzajYR2VO8+MbFrmNa+029Xp6GFobVjmn8iSU29WsJPK+7UJPX6rMpnNXT9XVYC55JprBD9N
	u6fTLTcvYqddi01Ijw
X-Google-Smtp-Source: AGHT+IF+nY/k4C/6P18u9JysznJj/Z5B3Y6A+1aqCm2cbh7pc65+FeNcv1ODeP4J/8ke38+irCHPGg==
X-Received: by 2002:a05:600c:45c9:b0:479:3a87:2eeb with SMTP id 5b1f17b1804b1-47a8f91515amr130008935e9.37.1765909812657;
        Tue, 16 Dec 2025 10:30:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc23c2b0sm2187435e9.15.2025.12.16.10.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:30:12 -0800 (PST)
Date: Tue, 16 Dec 2025 21:30:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUGlMP7J19L_AHF2@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
 <aUBrV2_Iv4oTPkC4@stanley.mountain>
 <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
 <aUEQkuzSZXFs5nqr@stanley.mountain>
 <aUFvvmDUai9QrhZ2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUFvvmDUai9QrhZ2@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_103015_494440_D0F75BC2 
X-CRM114-Status: GOOD (  16.84  )
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

On Tue, Dec 16, 2025 at 09:42:06AM -0500, Frank Li wrote:
> > >
> > > Why not implement standard phy interface,
> > > phy_set_mode_ext(PHY_MODE_ETHERNET, RGMII);
> > >
> > > For example:  drivers/pci/controller/dwc/pci-imx6.c
> > >
> > > In legency platform, it use syscon to set some registers. It becomes mess
> > > when more platform added.  And it becomes hard to convert because avoid
> > > break compatibltiy now.
> > >
> > > It doesn't become worse since new platforms switched to use standard
> > > inteface, (phy, reset ...).
> > >
> >
> > This happens below that layer, this is just saying where the registers
> > are found.  The GMAC_0_CTRL_STS is just one register in the GPR region,
> > most of the others are unrelated to PHY.
> 
> The other register should work as other function's providor with mfd.
> 

Syscons are a really standard way to do register accesses.  The
pci-imx6.c driver you mentioned earlier does it that way...  The only
thing which my code does differently is I put the offset into the
phandle, but that's not so unusual and it's arguably a cleaner way
because now both the base address and offset are in the same file.

regards,
dan carpenter


