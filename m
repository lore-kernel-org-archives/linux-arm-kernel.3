Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA81C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9pTlITFfm2eSqIVFTYtqUHfSyQN2eyQgRK0LFUEALg=; b=lXZ4RO1GA6Gs/XTC8iZSBB2jR7
	BTSeZwFcwGi17u/KGvrwM48NMDB+KhVb3F7yuDtuflIbazcfpYdOcX0veAOJlWVfKLTFvj8SHJmJX
	JBKLgqfqcB+ni4qLj0StRabcmvS57m3mHmuxGjg/s8Mty6H1qrDQwaCt78o20IYMYRUcvSd9+EkSo
	g6Sd4/zZL8oagX8FJINZcZyty3wAToe+FAz2DgHBpBJfnnvNtlAPCJ9yiYlrhsFbVTcpRW+yUfjTW
	Z5nldiUTVthBf8ZJaeeWanxXqjUOL2AKn+C0tOFACq74J7ozywBny1X9dyZFl95MtBhv3qPseksmE
	WIN80nAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPfV-0000000DsZD-0sFV;
	Tue, 05 Aug 2025 21:58:01 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPcu-0000000DsH7-42by
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754430920; x=1785966920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/K5gkGPUVp2DBi4KKVQbUk/OVqba8EVQEdmuAN63as=;
  b=QYK98g+ZapRRfuyZRQ/29iJuMn5dg1riRtMdwz9672WGTxpUnjiF8UXn
   8IzpXQQRJGB4ptdE8aoIY5iSQqXuO9euLt+g6Ae8cuarfI3fQYTULYElw
   Ci4g74IGmhxTnGVy66SHOKS1bS7D/tYBgOgc5ngoBzS0XpNNR7CRqwnwc
   At+AXKt67rID3Z0cBSHGJVOndQ4SgHAE+fnmEgWnnk/X1FPNL5As2AxUL
   cQKiXENo3XGr9fKPcpxp2HdbXZNOBFgJzhwa6lxKMCbmjJ7oe6iSk/md+
   o7BYAe3JnN0dNn9UkmoGEFY/nCC60ASE6+glvsNh/0gZRjRyWDKc9E7Fv
   w==;
X-CSE-ConnectionGUID: MkKqCoHuSBaC8RBw/jQlpQ==
X-CSE-MsgGUID: dt8ZGnuvS36DISPQcX7CHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74318755"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74318755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:55:14 -0700
X-CSE-ConnectionGUID: h7wGwCTwTGO4NE8ICxCugQ==
X-CSE-MsgGUID: AbNEH4ZZSMSRzb7kVk5p+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164942184"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 14:55:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujPcd-00000003rWR-0d6e;
	Wed, 06 Aug 2025 00:55:03 +0300
Date: Wed, 6 Aug 2025 00:55:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <aJJ9ttmL7wiw41fY@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
 <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_145521_006045_1462422B 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:
> Add an equivalent of list_first_entry_or_null() to obtain the last element
> of a list.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



