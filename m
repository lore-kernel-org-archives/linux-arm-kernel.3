Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F29FCA191
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=; b=Ir6QuoHrG+73wuMUs+C+sVrS6H
	/mhqqMsx0NMUzkiqAc1R77cx436kkmK5vPV/WJD7w0P/NVZi575kj7MN07f+w3M8FClnEmwdWcLCw
	MoJiL8YMm/SMGcdMDQlXoW4m3jigDOPrNcMY0zjjV+Tp6OQZrSOJPXQ47S4kRnAUAP1+paiCJTTIk
	GxWN6xqhTMdIG5j5JsDjBpSk8GKiod8eijCwffiGGsIcSvULiTUQCm/wN2FBDi0zGLsn7DxMc52m9
	kugfHrh0sTZDZAZLP7S86fqdmZKMsGLjho9NOOb08kmQpLDhpItM8KB+lbGHtaBH3QiyVtDz50Ttg
	Al8Ri1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj5l-00000008E5F-09IR;
	Mon, 09 Mar 2026 22:28:49 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj5i-00000008E4Z-1iHV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:28:47 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-899d6b7b073so135314606d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773095325; x=1773700125; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
        b=X+vtD3KAc4drwuQDmDfYX24uK7kmtRWt5ggx20w4jufYhb6dQgP95CpCfBBztR99KL
         kCbzLOlxjhWEm543Db7wu47UvSwR0efBbcugyKbpVgXSSQnoKMiyI8To71RSDEt9Ln1c
         SGO2Bgx0SQmyG2PvLwPR6Z0nKLBZXaSBjzgVGWcxiRdmVNdGGkc99Mv4k0A6QpUAIR+B
         tn/oUbiODkOt/rS34zB7hdOPvuvwDMBDHQhVY5whw46nulnEWNNRLH0bnHrWpU60epVd
         rD3uCx2y5YSY0kcejnBmSEIJH+PL8KvtIArxjttUdd/kb5c8j5AcpTFmYb7UTA8Rhb64
         Qwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095325; x=1773700125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uelqhot/SS82mnivEOGwZ5YeQ/ZVb2Ub9laQIz/Sv+M=;
        b=oBu0srEXXd83SVH3RUvoYwwNr2NyoravV28Scpd2VS9cPEaL5dVIXFX+uakK0j5Y60
         TjKcu4sXtZzMDyBFCLw24UaGIYOQjR4CtNCt8SI2hFyAWop5yBYZ8jd4Te7i8zG3VU+S
         z5DTCR+1iqHHIYc7fCqF5vrfuhBYmaNq4R54ZbQmsf1Yikv5ryyfHXi9t7THX0XS5ti/
         WdgDXP8/m+BHkLMz02y2SjsS1z4FTQwu+bVEpkIZSD7khs1O1jIX4DET7DzV4PhoU+8g
         6CeHdZEgpbp+7cxDS9t3wl5iTajd804TaKm2ndqubn9avZV28oPol7A0xNM4ihVT2J3y
         4CVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfdcsb1JaTWEZKkI75eTa3hiENa40lbIVrt51PucX+IfqxGn+eWvBtiBz6JyYihQD8pKg9YqkJJmvg+R4Fy9Gx@lists.infradead.org
X-Gm-Message-State: AOJu0YxLvbq+sSkIpB0LJ9+sXJbm3UTJkiW+UqsniePPz6g9auSXzYKC
	2QQeFsKPiCdYq1A6uFbJyaslRH+IY4LOfShCBMlIlIIhZj5D1NdMfLr2
X-Gm-Gg: ATEYQzyvHZTyk9+dnl/iwLwiklicftFcH9c+OEhCVS+5a1sxk6wV17V5ZXy6A2A3BkD
	0vwlsuKDTWkECShpwZmCwxc4INpPH9TLnQRG9qRevNP1OKnwC1LGagqLKDoQVCgMJe61ubJWpDz
	5MeXU436WQQAl5JagpHUU4fbG4nTkUduiIqYmMDHKlRr/TtcMlRbj+6U3gNGuhElBECW603RHKj
	dWkzpNJdhb+RwC575/Kd7Jy3aTQ6RF4O+ZZDGSC056aEly5AhDsZTEU8ExfGQshcoPLXl+eaIcX
	DsSOURDyGvZhPOniYtPcv5xhfNYU/qKXVGnvEghH/UkEhMlH7dmqeT+eJh3yMi3e67zlHO8T+jn
	5MyE8KJNAyHnv375L8qdsiRb0/3G7bs7dHPiidGswD8sP5lu7pMWhH6wSlYRqKEyjEZOizSROh7
	j7lrH5miTGdZZrT6bAe5zyxWg=
X-Received: by 2002:a05:6214:e4c:b0:897:255:d5c2 with SMTP id 6a1803df08f44-89a30a4d3cdmr192944066d6.26.1773095325119;
        Mon, 09 Mar 2026 15:28:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a1e68esm6918006d6.2.2026.03.09.15.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:28:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:28:08 +0800
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
Message-ID: <aa9JCWpJ_EJbUzXV@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa61v7MQoYq10Jes@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_152846_474791_20479A46 
X-CRM114-Status: GOOD (  16.89  )
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

On Mon, Mar 09, 2026 at 11:57:51AM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 09, 2026 at 08:42:44AM +0800, Inochi Amaoto wrote:
> > +static int spacemit_dwmac_update_irq_config(struct spacmit_dwmac *dwmac,
> > +					    struct stmmac_resources *stmmac_res)
> > +{
> > +	unsigned int mask = CTRL_WAKE_IRQ_EN;
> > +	unsigned int val = stmmac_res->wol_irq >= 0 ? CTRL_WAKE_IRQ_EN : 0;
> 
> This looks like the last thing I can spot that needs to be addressed.
> netdev wants to see "reverse christmas tree" local variable
> declarations.
> 
> Please reverse the order of these two declarations to achieve that.
> 
> With that fixed:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 

Great, after some lookup, I find the variables in function 
spacemit_set_phy_intf_sel() are also needed to reversed.
I will also fix this in the next version.

Regards,
Inochi


