Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE7ECAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=; b=4rbRlG8dpWZYM5hIjuL52AoYQh
	lIEN6LydIvCNFM2Ql9Vd7Fi7R4C8mE3WvJgk5e9cQn4wRTxyNueiLL1MBOS2o/0+ZEhQ9hSZLLnIh
	YoATPhUsni3rkGHgsjU1RBDCV3Z/EUKc3hKiGj+cB8YBAWrRDVoJ/WhT5U73Ro8IA1USHST4cR4Iw
	oJSGkEtQvALtN78BbCbhIk0Y7Kf3VGser5NzVrr/7K2M3Vg78lzeIDSUf/Y9LzL4zGKUSzcUY9z/t
	OM+EDXVjddxagMNx8eRF5Zd99/oBPMyEPBhjyJ6pfOYAFixVGW/RqLdFJJWCOrPcXaiCuIiaeqB/k
	X46EwUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Y9-00000009mzW-0Wh0;
	Fri, 12 Sep 2025 14:14:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Y5-00000009mvO-2cBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:14:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2445824dc27so16747755ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686488; x=1758291288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=;
        b=ppTMU/p96ZpzwQ/8LXx+bO5v5WPy54l2jxCIf4j02VFCTNjttsia3JqWuzr8PmwjNm
         KTvnCs1aUEOuFnc8whWo2B+q1XlPA2ez31dqcf6Lo6sGshFLkk5nPkUwxLW9gFgoVZrP
         /VMeuJMLntJfk9juBrkRhmy8UTuNd/0aCtJtsUr5kOq3vFB1tsbUvMy1FeO04N2LmhCu
         f/HMspMmsEOezkhwOQV0tZOKOklb27HIJ8pKbN8tXoVyFUCYqLLdd2KBLFJz6Se48+8k
         C2Lta1Hco+vhJJd5PxdoDtDW1Z6V7/y0ivLoLV2tR2HwCzfsmAbdzE2K9k/hPxOgLAUn
         OPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686488; x=1758291288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=;
        b=OmwBYbN+XqbBtBZor+wHIc6GmKHuKx3PezeYJS5BXUYHomIfA/C4Ql7o3XcjyKsW3m
         AjW/ilQNFkAWb00tAF0NZt57cB6u0JHhbe8BjTTcCRgcmEZACQFLM0J25oBUrGklqYPv
         4W+jF7Cw3WKgsW4eQ3ECXy7cm63Avx+ez2SCriTgzEh7+7MMajNp0DCRbCRo8xskDhD8
         P3Byf9V1YQna4/tj870wgU0mFeLCubwbXOTY9t5ug4G56QKjHtLzeVSqyDreoagaJVfE
         wECx+p1gF9FBLcdBp/afbzaLUthA074anI2KHt4Jukx0Ui1Vy7BGF2lvdGaU7Ox3SPgp
         k+pA==
X-Forwarded-Encrypted: i=1; AJvYcCUUguX9l7PBdt/a7CC/vqu2yBzg+dmcP6Veyg2LIyQYP83WNvovA8/FjAEwHraQazCW8+99j+zPb6W01ZNVAe5h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0JqViS6PvrVYx7k9dnJ63dFmzHkUNl08KjOTZFp/rFs497WqB
	TuHCZZg6c/DgxGXls+QeBHoD+AL/UYru2liREMuR7P7LDUXIEDDv2BkQTNfo0IbLpqM=
X-Gm-Gg: ASbGncvz4+AK7J5Uh8CERGytpgMs70ml496f182rU9JUm0HeTuWKNEAdt3U8EexqzRL
	M2wwFvV6d1LjiTAKYFslcBjKSQbRPUOkChtjfThCuGJIfw7v1S0+KNSDts1W1BlEPE+2xQ9C1Vc
	HlTR96Sov/iHbVL0wGR1iiduujpDklHgKR5O9mJ0tP5HGAO1kZslFiw4o4zv2NR7f2PueU/oVNz
	0r3Jti36xLOSswFiQdOEKROuSs9WfSHFgGmy7lYka680e2L1RDG7rirf2izq8W9P87ZWUKxVvJZ
	Lj4MmhS2QlRDtepuln5U3F7TgibKakRu320aN2Va2exVaY6RypKfun+oBizo7WtCokdYs+jXK+y
	hWiEUndIi5/ajB/Ngdr7r/T5jVojNul15IgK00lvhbjskG+FIUJUmKe61k2f3ni2TudUza3DEa7
	GwbZnG5bOme18c4NmjOgK2vShFtGimEJ5yyQ==
X-Google-Smtp-Source: AGHT+IHHdJciNdadW46V/rsCGh0pPpDDjeLfRRykUe33Y24roFNgOG8c9J3Qxo6W5bSrO6GUGaOkXA==
X-Received: by 2002:a17:902:ce89:b0:25c:5747:4491 with SMTP id d9443c01a7336-25d26c4ab81mr39777925ad.46.1757686488456;
        Fri, 12 Sep 2025 07:14:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:650:9892:cdf9:70db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm49226035ad.130.2025.09.12.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:47 -0700 (PDT)
Date: Fri, 12 Sep 2025 08:14:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMQq1SABdOMba_jB@p14s>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
 <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071449_689878_A636FB3A 
X-CRM114-Status: GOOD (  26.05  )
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

On Fri, Sep 12, 2025 at 02:11:20PM +0800, Peng Fan wrote:
> On Thu, Sep 11, 2025 at 01:13:59AM +0000, Peng Fan wrote:
> >Hi Frank,
> >> 
> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred 
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
> 
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.
> 
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
> 
> Mathieu,
> 
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?
>

I think there is enough in this set.  I will look at it next week.
 
> Thanks,
> Peng.
> 
> 
> >
> >Thanks,
> >Peng.
> >
> >> 
> >> Frank
> >> > -	case IMX_RPROC_NONE:
> >> > +	/*
> >> > +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> >> > +	 * dcfg->ops or dcfg->ops->detect_mode, it is state
> >> RPROC_DETACHED.
> >> > +	 */
> >> > +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> >> >  		priv->rproc->state = RPROC_DETACHED;
> >> >  		return 0;
> >> > -	default:
> >> > -		break;
> >> >  	}
> >> >
> >> > -	return 0;
> >> > +	return dcfg->ops->detect_mode(priv->rproc);
> >> >  }
> >> >
> >> >  static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >
> >> > --
> >> > 2.37.1
> >> >

