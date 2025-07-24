Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D3AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+Hc/EJTpAN/zUBy6dWU21PJ3WMLmwKCsM/9bWx/tE4=; b=kcNGhyLc6EXXpKjeQGtMyTsw50
	7tHhEJwlwmcVb5zvmGkK7aJWIJDwks0Il8SZSYS/hiDr2oqSmMEWnolgmDH6Esj2qsLkG3RxhPTcB
	QEvS8MbyEyb2RIErthknGMN2boXGfR3/XpQePyCDPZqoWi+nipPszVnG6ZbYn4pOfr+1VPgr2BkU8
	9eaaZFuF0xlHAQLDp7QyI9Eqrx4RVBRo8U3S6ugrsqKet/Oms3ypF9B+VK1BDAYtQPL4hnEXBv3vk
	fkUHTk2JVCTMJFiWg/6LRMhnAhBxuJGxo/6nAXFFVFS9E68isc1LT7kPTkYFYg8MlkdPPiLjClUKY
	rK/2AMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o8-00000008Dqe-3WOR;
	Thu, 24 Jul 2025 18:36:44 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0Bc-00000008A64-09zU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:56:57 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32b5226e6beso11456371fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753379814; x=1753984614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+Hc/EJTpAN/zUBy6dWU21PJ3WMLmwKCsM/9bWx/tE4=;
        b=NLGE098fRSYQV1nWXM376s+K5mlY5QO3uqqPRYOsMBALhSyIQeoXr/oUX8/aK0sl5/
         TANW2gxn4BB4UzCM5JWjpAXQ257wf+VFJ66cUCaRdaTTSjOuaS5J0NadP4TmQg2QeLeN
         yiuifRf+Rk6+/VWC+eUHALkth9XGKAkyRImNFTRTHpbncb0/BPKE51M12tl2Xs3rogaC
         g/C3Tbt9CoRMeEmjUGU4e3z/siWuFTKqtXVBJvNX/tJgNoftDtR8qh7Zt5YyaMVeofgq
         8fAHoi1xE05UOEU+GpQPuZilU68R/Kzbvln6uMKNG9uPUki8pBFWSdfOn6qpTTgh1wz0
         8QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753379814; x=1753984614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+Hc/EJTpAN/zUBy6dWU21PJ3WMLmwKCsM/9bWx/tE4=;
        b=e7svFG3lT5r6/iKKlXyJfdmuuM/QMofTViKm0QfKv6e8QLXALJORbjHo3C4oP8XrEC
         LsdyDXmDaeLp6IbaorPG30Jeobnas+dXS2bWeYvnpzR71Re/kXpy9V7lbIHU+2vLEhmp
         H82eObaCpPckxLtElRhqtv/0T4omh0q6eZ5F8oBGXB5fWUaQ8wURpDbHW9ybB+YPOuN8
         HTNDK6qWuK0rE60aZTCJMnwEcoPcHFH1RGvz1KmkimglDfwczxejs1w310nJX8YGGYZW
         y17whMackM7jSjfJJDNVcb8to+TJbmmpm5/B1t8EYELY4MASAmW12I2Z+pwtXy702Ysq
         p1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzcysX8hcWcawekm5YVOjj0Sytqmsw+5fOG1oKCQjPdPFEKnfbJAbuMu8VMdR+1Vmcle08Q1zs+kBwu97x3W1v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9qAE+xIjY+2sR3LoODzxYh4yAn9B8/pEJ7pHWkBmjhxmdcTmz
	PXDmSQQ7YQ1rF7qBClsX7PZs3anQyL6Lntxb5sPcY0FhB3dngbDGuTVI
X-Gm-Gg: ASbGncvsPJCzHh5HNrAEyW22AFOX6Ld7lByjtHP30yWz1LfndEL7UEKC/ek0X1QgdGM
	ng8HLFE36P31qhT1PXvIBZKY1jlVGDKLL66U269HgFr/R51xaE+j5zQfiF/XKLaoUUUpnqQD6Vw
	/0YD22/KOcEeYLgIGcS74RO/iutQ7JlqWsX/iAFTVO8mE/6yND293K36riahrucevetOB70GvpP
	awYFv+DMqyI70M+c0XFnOVBn2eixRsWfjiJTssxJzILast3W7oiJ0HwZ9xMLoIbOXagmtQDTxLT
	krEWAgNB7+yJ5q8nmnWK275ZXjvyB97D2pfPow3ycd64HemcNfHgwQKIgOAIyONO/1EkQq97eBw
	pkwFkTp3jK/zTNim/Hj3zH7ji39twBYu1NXUPIRgF
X-Google-Smtp-Source: AGHT+IFN4Xrrwc5r0VQkcaQC/psZUUhsAWA2bd+XSOCuqzO1usstf65IZl+/xhZAoKMELAzl9zDBaw==
X-Received: by 2002:a2e:9cc2:0:b0:32b:3104:f89c with SMTP id 38308e7fff4ca-330dfe3cf57mr22675651fa.29.1753379813377;
        Thu, 24 Jul 2025 10:56:53 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-331e08e98aesm4007631fa.54.2025.07.24.10.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 10:56:52 -0700 (PDT)
Date: Thu, 24 Jul 2025 20:56:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: xgmac: Correct supported speed
 modes
Message-ID: <tcebsuesjejtk3vmzx77yuo7zil2xciucnnrakubrslwvnndas@utvi4r7ob3xa>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
 <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
 <4df7133e-5dcd-4d3d-9a58-d09ad5fd7ec3@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4df7133e-5dcd-4d3d-9a58-d09ad5fd7ec3@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_105656_077473_187F6C71 
X-CRM114-Status: GOOD (  23.79  )
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

Hi Rohan

On Thu, Jul 24, 2025 at 09:48:29PM +0530, G Thomas, Rohan wrote:
> On 7/17/2025 5:17 PM, Serge Semin wrote:
> > DW XGMAC IP-core of v2.x and older don't support 10/100Mbps modes
> > neither in the XGMII nor in the GMII interfaces. That's why I dropped
> > the 10/100Mbps link capabilities retaining 1G, 2.5G and 10G speeds
> > only (the only speeds supported for DW XGMAC 1.20a/2.11a Tx in the
> > MAC_Tx_Configuration.SS register field). Although I should have
> > dropped the MAC_5000FD too since it has been supported since v3.0
> > IP-core version. My bad.(
> > 
> > Starting from DW XGMAC v3.00a IP-core the list of the supported speeds
> > has been extended to: 10/100Mbps (MII), 1G/2.5G (GMII), 2.5G/5G/10G
> > (XGMII). Thus the more appropriate fix here should take into account
> > the IP-core version. Like this:
> > 	if (dma_cap->mbps_1000 && MAC_Version.SNPSVER >= 0x30)
> > 		dma_cap->mbps_10_100 = 1;
> > 
> > Then you can use the mbps_1000 and mbps_10_100 flags to set the proper
> > MAC-capabilities to hw->link.caps in the dwxgmac2_setup() method. I
> > would have added the XGMII 2.5G/5G MAC-capabilities setting up to the
> > dwxgmac2_setup() method too for the v3.x IP-cores and newer.
> 
> Hi Serge,
> 
> From the databook, I noticed the condition:
> (DWCXG_XGMII_GMII == 1) && <DWC-XGMAC-V2_20 feature authorized>
> which seems to suggest that 10/100 Mbps support was introduced starting
> from version 2.20.
> 
> Am I interpreting this correctly, or is this feature only fully
> supported from v3.00 onwards.

Hm. Interesting discovery. I've got only DW XGMAC v1.20a, v2.11a,
v3.01a and v3.20a databooks at hands. So I can't prove for sure your
inference. But the DW XGMAC v3.01a doc indeed states that
DWCXG_FDUPLX_ONLY parameter is enabled if:
(DWCXG_XGMII_GMII == 1) && <DWC-XGMAC-V2_20 feature authorized>
which implies that the parameter was originally introduced in v2.20a
IP-core.

So to speak you might be right. Perhaps it will be more correct to set
dma_cap->mbps_10_100 for v2.20a (SNPSVER = 0x22) IP-cores too
especially seeing another parameter DWCXG_MII_SUPPORT depends on
SNPS_RSVDPARAM_16 which also depends on DWC-XGMAC-V2_20.

-Serge(y)

> 
> Best Regards,
> Rohan

