Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3221FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/Kchz6cqAgt51mSUJTXidfDHl03p3nRaQPSxD7M0FU=; b=k2c4PGZb7IW2fWyQFHxOEyd6UR
	aw/jkcHKyB4F+oSvoQLqb27zH4ngN/U6/Y4CXkOVK/T/sgK1kf/fTCGPh7nUqdtW8fbAAondxGhn8
	VQj0Y+Py4LeX1WQo84voS0+0e/JxFbQrXxfJ5Hsfvvc2vV3USsCrBs0SkZD+qnA2fc5AGXa/okVXU
	JJbl/iNYKmWIGQU0Le+0X2REcwgt+xq5QI0Qu9uA3B9g19nmSCdf1GTnjB/a5y5R7fJu7mcpgnbw1
	C/pbm7gIf+vKEXOsy/sZpQaaM1DsaZYdIU7twy8vYJ+gwTaDh2+nQZktHS5BwER7NVFtibnKqA4Gs
	/Sswejdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshir-0000000BFRQ-3KJ3;
	Thu, 13 Mar 2025 12:31:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshcy-0000000BEYl-3tgS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Mar 2025 12:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s/Kchz6cqAgt51mSUJTXidfDHl03p3nRaQPSxD7M0FU=; b=qaF5AiInzryCVawAZF4AC+6ElS
	30Sk4ukMzrWxTQuKKFJv5bRZdaTNpUz/rspo2ZY7xLjSDTWPpfNKSugffZKRwAZdLlEL8BxE7zMm+
	h1gI77mVjMHm6x7lpVfrArACF1n3cQbKSQeC5GEd6ATblXlA58EjY1Mn2Ui+paxx9OdK8jianCxod
	pC7zSW/auiAdb1bLg1rtCJeA3uP5dzxF9kXjBxp0KCjGDobWIfBFj+LUeGaGYaq99F2RhVEmonplq
	t86ZitJcmq2UHqEfWWfRv0oLV+0KQdh8WOIytHn4aap9WfeQ4lMOLc2XLIEw6B/erHXF5CfiSSjeh
	zD/D7ZEA==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshcv-00000002bZb-1hBI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 12:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741868730; x=1773404730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qtso+QylSCMYkJlmOyQHdWoGgp+Hq5bh4XDeml5Lx2c=;
  b=ZzLIZhO4Z13MiwWRzKa8c1nPFHFiZ+R6BkczPETl5nnCBTGskB5a4fk/
   g7PDPeR88gmQ8wJP/7ID14eivDUDfMNj+xjs6weFz+e7HulY073rAM90S
   +SI3Be6Ir1c58rei73pzvWOXIUCaBLeDHEo9un+HoO+MWn4+Iq6lGLuNA
   XqEQ7a9jgspKGs0ux5ktJBBiF1ULqLHYxD/KgOMv+HTECjOZ2HY8eUZqG
   mJxzPEAZRLNFKbHiBtfsZnaJ3MUx4XFCw9oM87IPpj9ENrExRMNt7gsHK
   PIQYz71grLfecAl3SCB9ir/30Y4y7M1f+ob4CtXHBpECuMLpskwwFjtW6
   A==;
X-CSE-ConnectionGUID: 5D5hjQ10Tgi1CRyekKLdTA==
X-CSE-MsgGUID: 0VD9JvmRTQe/U2Pi6BVwbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43113239"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="43113239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:25:22 -0700
X-CSE-ConnectionGUID: KGpsUbEJQs2MVyUdlNP4KA==
X-CSE-MsgGUID: BX9hJvZwTXqJh109+wTkSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="151782413"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 05:25:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 004C311F96E;
	Thu, 13 Mar 2025 14:25:09 +0200 (EET)
Date: Thu, 13 Mar 2025 12:25:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/16] dt-bindings: media: i2c: max96717: add
 support for MAX96793
Message-ID: <Z9LOpR5yiILj6KsT@kekkonen.localdomain>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-7-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-7-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_122530_054419_762161CC 
X-CRM114-Status: GOOD (  17.92  )
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

Hi Cosmin,

On Sun, Mar 09, 2025 at 10:47:58AM +0200, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 31fb62debdc7..02857f0364c4 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -27,6 +27,7 @@ description:
>  
>    MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
>    MAX9295A only supports pixel mode.
> +  MAX96793 also supports GMSL3 mode.

Fits on the previous line. Same goes for some of the commit messages in the
set: the limit is 75 characters per line.

>  
>  properties:
>    compatible:
> @@ -36,6 +37,7 @@ properties:
>        - items:
>            - enum:
>                - maxim,max96717
> +              - maxim,max96793
>            - const: maxim,max96717f
>  
>    '#gpio-cells':

-- 
Regards,

Sakari Ailus

