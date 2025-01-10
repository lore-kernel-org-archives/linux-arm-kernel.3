Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23327E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cInpG6EAfaY5VY8tQjHz4DZH6R2BPS6mz6a1u1Hs0AQ=; b=kSrRoAihnurlxyWjxUAQn6w80T
	ULtE3GgPzynvXTWY4xTSiIt8Cv8MAlrSg8Kw4FIWunQASg4h4Lhqt0/az15FM4kseylrBjQ/5Bqp5
	4Iu6tdu+KhVoxLpD5FyzB5JtImoSyNvozWTCBDRLMq34kbvka1ohhsdeg553v8iRT+iGcHLQCYHmF
	ZL8jRvphLMfEfqvt89+gXLZ7UcoDYzno4YvoWsu4cD74bdDJq/mIycbuf5w/jwRBAb27jYVPgW48V
	/61zRQnYJoLjn0uIMy3Z4TIlU2uA6Ffj5VNDiEjrdJRUnQI6S8zKJ+vW/ZiGTP0DrZseMEXEfmHI4
	i3qvymMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA5q-0000000ETGu-0I4M;
	Fri, 10 Jan 2025 08:10:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWA4c-0000000ET7u-147K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736496534; x=1768032534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vZxoqsAEaUyi0cIZM9avr4/Zblqn0Qq4dg6nBL6UVs=;
  b=mRTHvx70JpPuTWz/ixRCtvsPnreV6sIDW9ed6liH8/YlAeOzFSfhdYhL
   nPk60gqpwc7YuJgHu4/BoEmD4TKiU5e50n86PFSG4IMiqOoQhUsi1i2jE
   V1ya83HmivU3iq2nELwYL8Hc9404rbL7MimX8JRS7NIGcv4hnEu72lamE
   zfL6v6n4/NYri86MGTV3trxkzM7a4gUHZ8kM0jx0boALL9uHnVEB+uPHO
   ptvJm67T1BsIM5lGZRV8hNksx90xnb5R5PFJlvmmpZLOghUgx6dreLY0W
   lM6oXKbD5n1ieywIfZbB5OZANVrEmDEvokitPPEzlkP4+onXousQu8Ni2
   g==;
X-CSE-ConnectionGUID: WFPUyCCwTsWLSdvJx2iQTg==
X-CSE-MsgGUID: PL+RgZiuTCeFfHgh9Qeweg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62154030"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="62154030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:08:53 -0800
X-CSE-ConnectionGUID: guE/BhWbT7q99Q6DlK+Jqg==
X-CSE-MsgGUID: AG7Q+tLwTymHN1MgC8HhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104185433"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:08:50 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2AF3A11F89A;
	Fri, 10 Jan 2025 10:08:47 +0200 (EET)
Date: Fri, 10 Jan 2025 08:08:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/8] media: stm32: csi / dcmipp corrections
Message-ID: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_000854_300685_D7F59B92 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Alain,

On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> Various fixes within the stm32 csi bindings/drivers and
> stm32 dcmipp driver.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Thanks for the update. I tried to apply this but it doesn't, and the
culprit appears to be this line in dcmipp_graph_notify_bound():

	unsigned int ret;

That appears to be a bug as such. The interesting thing is that the patch
changing things around it presumes

	int ret;

so it won't apply. Do you already have a patch that fixes it? It should be
cc'd to stable, too, with a Fixes: tag.

-- 
Regards,

Sakari Ailus

