Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4085EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdXg7yR+M+U9WUTeE6CUFRCpZIOkk5VxyErXmmsFQ4Q=; b=dgIDZryiM/FyXwAYBFOqyD1hJW
	N7/732pWInlKHZkOllgw0A+6dKxEKAR/NlSfjcwqrsEmveJtLtK5s7IBhQRIQ6bEyijo+R1NGmM3M
	33KeaB52uHQhZ/QBEN+0N45Zdl1oW21kFhTgBoZyoHIoxpgR0dNY+IERyqibNFMiGOqvm10/Lymhu
	zKdOvFKnfUCUZsYVq7I5WHdaDTEluedK9gnDseJfMddMhkz5yt4JMqQMDZRX1OSYDaG3CkIDfi3Wq
	hsgAduF1yuWrLE9WQWRLRwmbfwrNlXcbJUMHIQNYqHAuYrp5NtRs4nyV/iF6NGMAadnP5QH2eQTRj
	pF5YmITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCZx-00000009357-2YN0;
	Wed, 29 Jul 2026 22:16:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCZv-0000000934h-0Azu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785363403; x=1816899403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3JRQnveXzP6UUjUquq9YW29KWaKGru+yPHH4nB42m0=;
  b=En3vxeByBzvlcGcGTOmQ6UyEv6GBpoZxcge5v+IuJmMh03zcAqBvftFv
   bNmelifaDhXjYaucCsq896pWpg/kFsaBenBIMqI29bPy4cs61nvrqLlfa
   uTvw04/G1NvjQtTXBQY7TMlH6gFbpir0NaoT3iBQm/1z64Doi0VL3feIz
   1W7zbpU4nOHs4Q8EaSc69YFgc95GA9lNz1/ZH93LGxzfJcXoM1/ZADLWY
   +oONlXiNrVdLd/UTyaMZabIgbx8AcPCpQXTCCp+Pszs7MdWLL7D7ZF1XV
   xO/mg0LDQ3MEt91iuZueRy5WBPfASiEaNzv0YqUBQuJPiJDvplDVPuM9G
   A==;
X-CSE-ConnectionGUID: RvRgFSxCRLKhluqYxYYJzA==
X-CSE-MsgGUID: XE30NzHJSZaCeP2wvgFICQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85854182"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85854182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:16:42 -0700
X-CSE-ConnectionGUID: jEFDDnlUTqCiqv9htaeRcA==
X-CSE-MsgGUID: MeOVygYKT06ki+q1aZl5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="283470014"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.90])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:16:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A490D11F8BD;
	Thu, 30 Jul 2026 01:16:38 +0300 (EEST)
Date: Thu, 30 Jul 2026 01:16:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, hverkuil@kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, krzk+dt@kernel.org, martink@posteo.de,
	mchehab@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	sebastian.krzyszkowiak@puri.sm,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Message-ID: <amp7xqJGfhOeKaoU@kekkonen.localdomain>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115553.92564-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712115553.92564-1-mitltlatltl@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_151643_098541_37615787 
X-CRM114-Status: GOOD (  19.74  )
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

Hi Pengyu,

On Sun, Jul 12, 2026 at 07:55:53PM +0800, Pengyu Luo wrote:
> hi846_write_reg_16() does not clear a positive *err value on success.
> pm_runtime_get_if_in_use() returns a positive value when the device
> is already in use. When hi846_set_ctrl() passes &ret holding this
> positive value) to hi846_write_reg_16(), the function returns with ret
> as is, the positive value propagates back as a return code, which
> callers interpret as an error.
> 
> Fix this by resetting *err to 0 only when it is positive.
> 
> Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index a3f77b8434ca..7f069aca0fce 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
>  	if (*err < 0)
>  		return;
>  
> +	*err = 0;

This should be first (or at least before non-fix patches) in the set.

Can you also add Cc: stable, please?

> +
>  	put_unaligned_be16(reg, buf);
>  	put_unaligned_be16(val, buf + 2);
>  	ret = i2c_master_send(client, buf, sizeof(buf));

-- 
Regards,

Sakari Ailus

