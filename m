Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2110C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 02:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViowYAtKnSgIGUsyb3LQAMZn+nH6X/QGE2D/FYlj+/A=; b=f1gZ8RqGDhQe2A6SVIMoehCvOv
	PrFzGBy1TikRy5r9a3dz7VwcNTRFzmy2VSZ6vtn3JZTkFYoqJR0BvBgloE12zJRNmImSX6LMTPYU2
	rm1Tat9dhsh5HhM/kcbeHQWLs5HPul5ZENkawZKyccamnZLc1/dVnTPWJDw/SntENbgZV0xzD3woi
	djSGB+xS1uqLy+ubHSpjzoFHw1rgrWmiQfingSEOCAOcnZABGglxoLdHpiaDvGmdd+O8R7OU8bLnC
	yy3P/MWpVCIwzcTbXILDS4IB7e1oDSEuwkVE9uhxCtxHYd5T0+qrEZIip24C26VVn4EYGFj4BK8qz
	7ByKo88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrX6-0000000536H-28D9;
	Thu, 06 Feb 2025 02:22:24 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrVk-00000005309-1hrE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 02:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738808460; x=1770344460;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zPwqGjttrG32SeOK9jJ5H18H/d8dhdmDbDCuLS50y9c=;
  b=n6FDsaYRfz/QSc36dG77ccf0tjn1CDONtXDDw1mqecBNQmxtfu0Wm8cM
   7dV/QtQ9OPXfj6zQKcCX9wgya0NbnB3DQMMT+aGxVQ0dsMea/Pk913rMT
   isdv2CuM4I3Kj3nqaBo3OQm5Bwtq0i80EP/0uLJhA228/IAXfNOAw9iXv
   pnomcMpOtoaNilMRcyxo2xNwdEgKVwL0MUGj2AYkjHhamv14N/AXGlRE0
   65fF+Wc8zPrrMlPRHt+827gv9o99T+EFZQ3cNKKC9pRbZdTgGlEa3t2Q4
   rmY5wfxV0JP7+ATPs7VlijIEJsbLY42F7eXYee4dIqdWTlfRsNF+IhWy9
   w==;
X-CSE-ConnectionGUID: egqwmYr+RtCAzRQ0DkjCkw==
X-CSE-MsgGUID: X2mxNv8kSzys4OD6SGjJNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39293310"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39293310"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:20:58 -0800
X-CSE-ConnectionGUID: OK8fuaBZQQK2CspFAUPF7g==
X-CSE-MsgGUID: BWMiBxz9QR6bzBug7zF8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="116069233"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.114.122]) ([10.247.114.122])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:20:50 -0800
Message-ID: <b0b9e3d4-5e65-491d-81c1-232520d73ab3@linux.intel.com>
Date: Thu, 6 Feb 2025 10:20:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 4/7] stmmac: intel: configure SerDes according
 to the interface mode
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, Serge Semin <fancer.lancer@gmail.com>,
 x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <71b15c65-4790-50e0-fa96-dbc42c90079f@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <71b15c65-4790-50e0-fa96-dbc42c90079f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_182100_493586_D174D5C5 
X-CRM114-Status: GOOD (  15.90  )
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



On 4/2/2025 4:25 pm, Ilpo Järvinen wrote:
> On Tue, 4 Feb 2025, Choong Yong Liang wrote:
> 
> The logic could be reversed + return immediately to reduce the indentation
> of the block below.
> 
> If you just want to have them initialized, it's enough to use {}, no dummy
> 0 is necessary.
> 
> This looks somewhat ugly. Perhaps it would be better if you make the call
> on main level of the function and use local variables to hold the regs
> array and its number of elements until then.
> 
> It would be even better if you could just store the pointer and # of
> elements into some platform info structure so that it wouldn't need to be
> calculated on the fly here (but I don't know this driver well enough to
> know if that's viable/easy to do).
> 
> Why are these arrays in a header and not in the C file that uses them???
> 

Hi Ilpo,

Thank you for your detailed review and comments on the patch.

I'll reverse the logic in intel_tsn_lane_is_available, define the magic 
number, initialize arrays with {}, refactor intel_config_serdes, and move 
the arrays to the C file.


