Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE17CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBCgV3A3dotEW/xOAZnc/54xPJHKSrOOjcbQFzlgGhw=; b=vbnFkmBlNLP4k2XHJBswIp+x5I
	VT3zPAhgv4698FiTz913FAmD8YfhCN5xbUHSskKF54E+tojsqah5YcfipUHuLzgYYuwl80q3WvFMC
	CE/Zaizha/KaRtG5AfMQOzBAabW12BXTWkaELgH/ACwSjGMncjLfqFHLDREHbIHQSNSVfMEItBjpB
	5Kr6cNw0iFHFGPF+xtSvi7BKMuPnkBG4RQF0BGTFCCVAsG+d1M14GvpvVRsaFdbQ/JAjc9UOU+Bdn
	F3oH7Nkn40k80ZQFSe2Mw2YGhdIqoA38qxqwsYxWvr3bL3cQYiQSTZvTCIkVkE5Dzmy2ULz2v6zgO
	yryJCx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNetQ-0000000Epld-2E1X;
	Tue, 17 Dec 2024 21:14:12 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNesK-0000000EpdD-36fe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734469985; x=1766005985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSlut8jUC8sevFzKiIGq9DG8Ecu/yvybyXCy7aSosFQ=;
  b=LE1BJMdXb6rSxRkm8UUhY7NDp94GDubwZHglpnMCaQzPpspb8x0DHH40
   BFh51O3XWVEH4PsfTRAu5fetgnF7z4yPHdNyVOuSUCPf0062LzUXf0Rdu
   A8SCZkOxlNSLcPwd1TIpV/CMz6ZQ4BQLYTJienqPqu2qyry8zzbjPyW6n
   5nRPiZQdyOD+Oda9h3OEEhi8CSOKHkifw1NgslQC+E5dZJvSwdeOEVNwA
   Ia+aG2FS6fbuS4ul66cVG3vMAcPc2CDU3xp1ezyzfX9vwMqjmQdGB+el5
   JESMHOwfGQEffhvSAQxT0rF7yL+F8N/2v5mVpCfj/8VQhMcV1ZiDe5kIc
   Q==;
X-CSE-ConnectionGUID: jw3sHg0GSVCdOtM/ASxsLw==
X-CSE-MsgGUID: gsodhFpuROqpr5ebrOfmvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34640514"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34640514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:13:03 -0800
X-CSE-ConnectionGUID: zNA3MaSrSiiBsrQK8IoBcA==
X-CSE-MsgGUID: TS6rTs+rQfySfEs9bMD6Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98457163"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:12:59 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E9F8C11F89A;
	Tue, 17 Dec 2024 23:12:55 +0200 (EET)
Date: Tue, 17 Dec 2024 21:12:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-crawfish-tiring-792c535301d0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_131304_825633_7D1D541C 
X-CRM114-Status: GOOD (  17.66  )
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

Hi Conor,

On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > D-PHY.
> 
> > Remove the bus-type property from the example.
> 
> Why? What's there to gain from the example being (seemingly?) less
> comprehensive?

As the device has D-PHY, other options are excluded. I.e. that property is
redundant for this device.

> 
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > index 33bedfe41924..e9fa3cfea5d2 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> > @@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: STMicroelectronics STM32 CSI controller
> >  
> >  description:
> > -  The STM32 CSI controller allows connecting a CSI based
> > -  camera to the DCMIPP camera pipeline.
> > +  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI-2
> > +  based camera to the DCMIPP camera pipeline.
> >  
> >  maintainers:
> >    - Alain Volmat <alain.volmat@foss.st.com>
> > @@ -109,7 +109,6 @@ examples:
> >                  endpoint {
> >                      remote-endpoint = <&imx335_ep>;
> >                      data-lanes = <1 2>;
> > -                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> >                  };
> >              };
> >  
> > 

-- 
Kind regards,

Sakari Ailus

