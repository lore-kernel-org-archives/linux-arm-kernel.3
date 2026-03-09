Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757BEFCA19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=; b=kRYp5XxP0KxjZKc0t4/wkGWI/h
	G+dNHZENZaYfwyAsVZ7x16n9Rik+BEzhPb0p4KOXckCGyTQ1J9z31HMB+ZD9YIDbT5EREAnLyhKWJ
	MnGM0MmO1gy7k87nF4O4twcqmgD+V3m0jbrVnWVqy4exeDws/qRP4SJ1luiRdNgSPizbpsCTFEDLe
	ngaw1IaVkTVoO20lIyXnWlkxaIy0pxK83CRYndQjpUxOGtoP45tKqBxg/TGKWZpC4xzzZrF8FVP03
	55CvlkGm3ijgUIuY+uZV6Eo7/wfgHnoEHQS/Q+HOap/zvj11wbC0dZzcJPzX2vfHVZUm8Cvi8cMOA
	1FdxsjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj3p-00000008Drs-2WL8;
	Mon, 09 Mar 2026 22:26:49 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj3m-00000008DrA-3ook
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:26:48 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8cd8c6e365eso126964385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773095205; x=1773700005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=;
        b=Sv8W27fNaelMqW3EbQeHaL5PSCKPl7iYzQY/fwXpTBwPEcIasJxZuWisoI9zbqebfn
         yI+Qe4H/5EbEJ7JgggGgRXo7+W/oxA+ihvKICC16kMUJHruG9TPMHhFhMK7f83XoLd1b
         InvpRp8p6PgiVwygaEzTlUPAs3rAtc72lYxANO/hn3T79ZCaTH6xA51cokw7Sti8XqiR
         u39yd1GpCk9gLIXjLOtqxRAVW+5KRniqZKd8eJ55TR/1M9/9ax+ks52jcEC1yohx/O7M
         5z1C3KIdXiY/rzZ9IUaJExvJXuxpXO3CFLLdMVcNoQGS8cRpoweMPJbfj0YPuJdpCDoH
         TGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095205; x=1773700005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=;
        b=m6aRzp/NQItPd/YDI+j4lojVawhYSnOZkmzLeYjKwxXc6If/AJTQ/wEYG9A4ojaxc8
         If5s8wReEGN52Pf+9fkYVsgISEG02vkXiHCFtjrLEhi4sD+fnUVE7bcWdItixDcooAXK
         X+TpUZhaMcnpbd5B6lpewAK+gPxQ6g1p/cdU3yz7hSp+y1o0LrqyB58OggAGi1tAgxpn
         sA/Az9Kgovia4dA7MZZVwgcfmBhAnnfDFil5cv172K1/6I/G6HawThDHachYRbJPfMbx
         fPchYsz7YkV7KG3dnTJ2PZ+NiVbNey09+DAxyM8QNZcjWIXpKwP/JOKgRPSo0v6LN9sY
         ml2w==
X-Forwarded-Encrypted: i=1; AJvYcCX/UgS3jbBD3r3YzPpAacKpGx4ZLAQKcs+Wzw7lai807sU0akkIrngXMbfi9u8kxTxW3g749jvr9E1U5hbltHvf@lists.infradead.org
X-Gm-Message-State: AOJu0YyKVCbPOQ+Wk+iHyShIkH7SBlb4xhXZcz3zQudY9Ypdz9ApTCTI
	RcADlG/ZQBd5/KMa7YwVRozBJqmm5GfnqdLI4Nd5HeM0nu3Ka/8X1VeH
X-Gm-Gg: ATEYQzzoqenH8q+fEJXrbc13AhOAt4n0VE7WExgRFuAh/GQgQooBskBvfOFd+FMkOrH
	xioIPJ9h+M5qkDvTSTAtwBmOrQSCAq7gI8oyL/BFno2HybNmVJ0+oudztZRZtK3l73r2SZGwcMP
	EecroS28S8B8SBEw0t1lA8fVKDrjiReTByoixYesTlHcblF277+hSgUFf5yi5hfrb3ujbYw5y6I
	7xWRlSepm3zer2JByR4IIfnrQUPkl0xAzKd2WZyhkPO7joFXDjR5bTpQ2ZAklKch84/cGcpRWco
	ATradE3BO9D2I1CzJF6W+vU7kS0vWrAKEs63VhbAgC60zgO6XF1C5gADpouc+iMBXoid9b2HE0g
	kv1jCmARf7ADqF1HM3CGE/LCkCIQBr7BcWXyctMrZTkmhs2v0bk7DleCpeHuh83xgMm14auL+AB
	dJAVziKLvkeY4FxuhNX/qz0gArOYvyUsafxw==
X-Received: by 2002:a05:620a:c55:b0:8cb:4289:6c1a with SMTP id af79cd13be357-8cd6d549b1fmr1572894885a.75.1773095205343;
        Mon, 09 Mar 2026 15:26:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd866f7074sm325445485a.6.2026.03.09.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:26:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:26:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aa9I4pIZs5-TDdXo@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa62FTHMOJGhVKTv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa62FTHMOJGhVKTv@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_152646_954442_4627049D 
X-CRM114-Status: GOOD (  12.05  )
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

On Mon, Mar 09, 2026 at 11:59:17AM +0000, Russell King (Oracle) wrote:
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
> 
> One last point, please add another patch which adds a MAINTAINERS entry
> for this file, so you can be Cc'd with future stmmac developments.
> 
> Thanks.
> 

OK, I will add a MAINTAINERS entry for both this file and
binding file.

Regards,
Inochi

