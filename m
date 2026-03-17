Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB46FED9E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6Hb7BcaYQNjNPxmuk7crQ1Z5IKhXmZJCGDppOYxgfA=; b=17BtGbfJNH6ByttprhCHMgEr6h
	6WsELpJqjRwsVDa1PMabusrUyDqJs8gJVCuv+/zEhlA5uCbzshARLeWbYWKkeF0HeZTbn4KJ/9Wlo
	E4UDs/yCNY0eJ9J2f2sXknwPhVWFxGW7pOx7aKFqKa1phs9Gih98KA6pSVOjImor47MrOQRIT9FF2
	L5nNy16FvWAfI5txlhUeisOA0x7pzcdh3Zt0qqgnZPwGreDdcWjXDyhuD/IWm+lPQgdcfaj6eTlQz
	VNKYGduV2426hqrGDPFGWJO3LrdmEjAR9690PnIZDosZ2h4GIFbpFwBmgmbuV4JD2MOt9BoPAkN3C
	VgLGrx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WVM-00000006kg8-0faA;
	Tue, 17 Mar 2026 15:38:48 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WVJ-00000006kfS-33f0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773761925; x=1805297925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x1gSLvzKsw5RxCMGtUcdm7YX+5lOyd2zRpU8JHZgXO4=;
  b=KznEi7AgxtQ4H60054SYV3FbBXkoyJIxcocYYK4FXeFTEkLkzkeH5qXu
   wYd9bDs7icfUcB5tlx453Ab8MfMOV+bmJc9cS5O8+6ZcRIy58DGAxI10P
   TqGFe067JseMExqCso9HctM/+agGUUxyH9SASeNH+BWl2+ZkrSBwzMoEQ
   sG6e/zXLfPcgEypOAn2oE7tjcBxhBDc+xVF370B3BXYP7CUQMRxmUQmmc
   BqG7ogDtFCfv1ojVzdmd+NviONP9equi1x90RRmf/hEt+sSyJRtcCHctv
   58TbyVZwaJMxHIp3LVlzta49PHyxZ8EwmyvERxcfM4L3RPoRsx2QZG8ry
   g==;
X-CSE-ConnectionGUID: l9Ala15OTU6hzleLC0+Tig==
X-CSE-MsgGUID: mC/3+LWWSD67QDfprPMjFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74830538"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74830538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:38:43 -0700
X-CSE-ConnectionGUID: +Eu8r4TETdWrWgU4PeUEew==
X-CSE-MsgGUID: tDIkp/UlRNmQmrlTxCG9kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226989411"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 08:38:40 -0700
Date: Tue, 17 Mar 2026 17:38:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
Message-ID: <abl1fPQEDE38KZQN@ashevche-desk.local>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <940ff48bd53e35e19a4cda081170d9198c20675e.1773757772.git.dan.carpenter@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_083845_815372_F6A978A7 
X-CRM114-Status: GOOD (  12.32  )
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

On Tue, Mar 17, 2026 at 05:40:27PM +0300, Dan Carpenter wrote:
> The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> reading or writing to the pin.  In SCMI, the parameter is represented by
> two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
> 
> Add a function to translate it to either INPUT or OUTPUT depending on
> whether it is called from a _get or _set() operation.

In three consecutive patches against the same file you have three (!) different
prefixes. Please, align with what is being used most in the driver and/or subsystem
(the driver seems has no consensus with itself, so subsystem then, something like
 "pinctrl: scmi: ").

-- 
With Best Regards,
Andy Shevchenko



