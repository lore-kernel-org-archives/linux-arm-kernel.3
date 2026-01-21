Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F949D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=; b=xh44s3/5+uW3cpMGvQH+FqQ+m2
	qOI/tr3UqepQz0jB+h/XK9MqOsqbpspyabQeLtEYM8oJ42ot0QOEkzVGU+mQ+30Goq6dB2/Uy7vFe
	bXEHETUOs064HHte8olSQL6pNG1YIlXMUFi+o9sIT1hurp5NNzr8Bizn2EvhyZmxlWtCRkPN3/4bW
	8B7F/E0C+la6PFB/jLNyBFsI7fbMXG/RYADJV+7w6JZMjRlh8KrkLIEyJqwMKZrW4GZpTcMs8LXME
	vqSy4SWKqey8x1S1wCOGN4XObfJBrtRUpnsCAyqIqogRgZc5Q+HLx6h2c4GM+CzdoGj5C8n8WO3vq
	YS19chmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNAd-00000004iZK-32Gq;
	Wed, 21 Jan 2026 01:38:07 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNAb-00000004iYZ-2rTH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:38:06 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-121bf277922so8486558c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 17:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768959484; x=1769564284; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
        b=Sq28s+9cCrzpZNujgGfoc/E+R09zq7UTDoZJJA7uwCI+FpusPDwxLf116O8t7EgPo9
         4GqRIqvutE/3wEJvI/UpblTEoPPaMK15YtRl3CfL52zanTH/vw2EqdSkctXHrEi/eigN
         l+TWvzqVRTlj+8VGj1vBkJE/VYdAvm84bJ6AORW+0D/Ss8lStU5VkBX7ACe2QC4QZCPJ
         s2fDUiGOw5/QuiHqV3tlvE2SnJBdh04tvI2W8iKP1z7N87VUzB9E2GSC3VA2TLrftEgP
         A6HSqZ42AgOeujPY6sRt5kF3LPZzAZwKmO90/R+/ed6xFvX7vozvmhfti2jyE/X77BNa
         bjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959484; x=1769564284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5yAAJyzuotg25Ij3sl9iHvHzE6qHnmlHIRrb6J8qac=;
        b=qHlWYjL9a4VjF+MJcJxFXL9J9pV/DMsq6CaDWTM6n5vryXqGfAO8/NBiFSZAoODm9T
         XRXH6+AN0mLGOwTaCFwf7WE+WlMeUYfshQsLVVU/Kfhre6UVtXCTINcD370Pqt0hznQ1
         +04UmDCC7N8X9QrJyLpYvqxuF7O4M4LbS+MPcsXANOo0B4ZNd485QqYxlCOZenQi4NCS
         LOoAiB3DHPeo9niRMHzh5+1AkEHYIbYymmrlyO9oFuMAn6zaB8tnd2icPyNlPWUpKVzv
         wqf0ik6qoxChtXBBTjAvXYK7E5X0AZFo6EN781YKFQHoyMRN7F4Xthpp/t54tkEGW/AS
         QrBw==
X-Forwarded-Encrypted: i=1; AJvYcCVDhCbP/HkcTOQPc20yDi8N4eIwD854FW2eGFzYy4DGqk8AALS4bgiRYsFjuKH+D0t7FKQupV3aX0vAvz5p2Nv/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+5T2i7sHG5lcasFTkLz2YFtmBPEx9hPifyJNajr7VpnKie/S1
	yotJXgO4I0xZrYQUXdqDvYoKJAFPYdSLpjfhUDxIiTXkz5dUUw56Davj
X-Gm-Gg: AZuq6aICVmnF4uOuX01ARrrrmiPCtkn2KwOPBWv/5xEbqAEaAX93h2DuiJBI91dLDqQ
	LqEWpUZtr5sGtdtrnbd8BFXkDw420ozbaceYQHMoRvcEXOifSh90hr3fXZfFYlxYtBJ1iHcPo6u
	w7tiCiYV5XIzxcc2chMLseDYT5Wu4GIZrbuONWk66J0bFhFaLi5+L6kQzmKa3ijY725mD2oU2bz
	LNT+w/+wA4Db/MqeZ05t8+YvV+F5hPZYkVzA3z/cG14iTnVnEcOGyNx7benknne6JgzQIORkmc4
	FPBjavKWXaePHYsCm82lnIaDpl31ivEdiX8HjluJh0Ul/lWF4pr016IEWZfXsI2VPMupIyzcnuK
	Rv3sOjpkTdUkVgBBYBLDTecvV5F82rJIdm0c+NEtZXPjB3jE5AUr/dh4ilDCiyHpIJ1Ul+tgzeG
	CAHBDdLbUwKg==
X-Received: by 2002:a05:7301:2b84:b0:2b7:f12:9503 with SMTP id 5a478bee46e88-2b70f1295ccmr1043461eec.30.1768959484158;
        Tue, 20 Jan 2026 17:38:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7047b099bsm3361798eec.31.2026.01.20.17.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:38:03 -0800 (PST)
Date: Wed, 21 Jan 2026 09:37:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Boon Khai Ng <boon.khai.ng@altera.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add glue layer for Spacemit K3
 SoC
Message-ID: <aXAtMZJorEBiK2R-@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-4-inochiama@gmail.com>
 <f8e4c5ec-94b1-4da0-8a40-976770514828@lunn.ch>
 <aXACRN7BaumIySp3@inochi.infowork>
 <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5c882e-1632-4623-92d3-8a433c8ccdbb@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_173805_725631_6AB6FE96 
X-CRM114-Status: GOOD (  20.88  )
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

On Wed, Jan 21, 2026 at 02:29:23AM +0100, Andrew Lunn wrote:
> On Wed, Jan 21, 2026 at 06:36:01AM +0800, Inochi Amaoto wrote:
> > On Tue, Jan 20, 2026 at 02:56:26PM +0100, Andrew Lunn wrote:
> > > > +/* Note: the delay step value is at 0.1ps */
> > > > +static const unsigned int k3_delay_step_10x[4] = {
> > > > +	367, 493, 559, 685
> > > > +};
> > > 
> > > Am i reading it correctly that RGMII delays are limited to these four
> > > values?
> > > 
> > > If so, please add this list to the DT binding.
> > > 
> > 
> > No, these value are just adjustment interval, and it is also
> > controlled by another code register, the final delay is calculated
> > by the following formula:
> > 
> > delay = delay_step * delay_code * 0.9;
> > 
> > So the delay configuration needs to be calculated instead of
> > directly assigned.
> 
> O.K.
> 
> So what is the actual range? Can is do 1000ps? 2000ps? 3000ps? Should
> there be a basic range check to avoid dumb typos?

It can have a pretty big ranges, and I was told the total delay is fine
to work between [1200, 2800]. I guess it is fine for us to check the
upper limit?

Regards,
Inochi

