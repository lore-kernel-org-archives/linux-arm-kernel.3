Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BD1F8A141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FF2Hu3tsfPgmUysXQRYTdoXImMRnS5VAm2iqlazCptQ=; b=d6aIbxw4ZLaQ3fjkh5YUrBk+EC
	zF/JcpiRe2LZVVlxg3Iow9CzIfQ5lLrwab8XhFuxiiisWvF/SNC2T3YrCs8X+6hJsH8NomOkYpBhy
	b9KC3BEA6ODlgCjQ5fVhR2Xy8/j2frGvEXtw1dpDVJNoanTUkcAJw+rd3ZY5TES2TMbw2EHG1o1Xk
	2C3OPZdx6+4epZAKa26qReRFFLIDMq2QldZ1+Y17RBP8QQ+gOVeBCuMZfg0Hle8hYZkDhwjLr8deD
	b4JMU4CJavW4MZSxWGzCaU4UjVH5woE5Jx6O8S/ozGoGQlNr7RsdZ5RLv/al0DDxUDhxaUj3/Row0
	aMSZVb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHzx-00000002AeG-3fdY;
	Thu, 16 Apr 2026 08:22:53 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHzu-00000002Adw-20Wd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 08:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776327771; x=1807863771;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FF2Hu3tsfPgmUysXQRYTdoXImMRnS5VAm2iqlazCptQ=;
  b=jJGyYBCLLFO+yr5bLaykkCKzvnM/s4/nCfNOs8yPEpvv66YO3b0lHlBR
   j2Or1A39lWm09iwpHjRcVyLyELx2tDNQBpMmlhfIJVwDj0pFqVs9IFn9o
   8f8A8jFwzarUlYtsB9KmqPN4ITdaCn/R2HDRHwiEGt8EdEz2YlWW5w3Lc
   +nQrBU4vT11IaDqerv1FcTr5+44HGBgeqsegkzvbYbocGk6n0UpRUg2S6
   MwX5u5GUL4sGMQHmjJKQ96SqokBc5zDGWMoLcYBZzNVBUCOy99hwPMLXD
   3DPs79rBN2OGRWGdsmfcZ1bjtA4P6ycpF+Ng9fqBTCWNXZ7YKOQSjsMDn
   A==;
X-CSE-ConnectionGUID: 2f/clOH/Q0azmdMFpNdZXQ==
X-CSE-MsgGUID: ZNJQtkcdTVWoMjpUX1LXyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87622379"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="87622379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:22:49 -0700
X-CSE-ConnectionGUID: ahImSsagQhGSPzyuUq/DjQ==
X-CSE-MsgGUID: 0Khl595iR0GlOcxcYe+M1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230598180"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 01:22:49 -0700
Received: from [10.107.24.239] (soc-5CG20645H5.clients.intel.com [10.107.24.239])
	by linux.intel.com (Postfix) with ESMTP id 29CC120B5713;
	Thu, 16 Apr 2026 01:22:44 -0700 (PDT)
Message-ID: <bacbe354-c202-4690-8e06-91f0244567ed@linux.intel.com>
Date: Thu, 16 Apr 2026 16:22:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net,v2 1/1] net: stmmac: Update default_an_inband before
 passing value to phylink_config
To: Paolo Abeni <pabeni@redhat.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 ovidiu.panait.rb@renesas.com, vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yoong.siang.song@intel.com, hong.aun.looi@intel.com, khai.wen.tan@intel.com
References: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
 <72d1b0b7-c8df-463e-a2d9-bf5ff04ba33c@redhat.com>
Content-Language: en-US
From: KhaiWenTan <khai.wen.tan@linux.intel.com>
In-Reply-To: <72d1b0b7-c8df-463e-a2d9-bf5ff04ba33c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_012250_595221_B2CCD00C 
X-CRM114-Status: UNSURE (   8.46  )
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

On 4/16/2026 4:12 PM, Paolo Abeni wrote:

> On 4/13/26 4:03 AM, KhaiWenTan wrote:
>> get_interfaces() will update both the plat->phy_interfaces and
>> mdio_bus_data->default_an_inband based on reading a SERDES register. As
>> get_interfaces() will be called after default_an_inband had already been
>> read, dwmac-intel regressed as a result with incorrect default_an_inband
>> value in phylink_config.
>>
>> Therefore, we moved the priv->plat->get_interfaces() to be executed first
>> before assigning mdio_bus_data->default_an_inband to
>> config->default_an_inband to ensure default_an_inband is in correct value.
>>
>> Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
>> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>
> Since Jakub sent the net-next PR and forwarded the trees, this patch
> does not apply anymore. Please rebase and repost. You can retain
> Russell's reviewed-by tag.
>
> Thanks,
>
> Paolo

Thank you Paolo, will be rebasing the patch and update a v3.


