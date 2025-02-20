Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73554C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 02:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0wudpkh20USDdbd3K2rVzzmZUhEvQ+LRtExEGEsrxU=; b=BEsgVYqVeU2ejT2amuR5mEciI3
	raBs+G42mq05HEma0q95UMlJSTj0R39KJfoZuJCF3VyGqJhj/pNFTv/skiJXht/CRGKYdENR/qQmI
	2yz+IUV0fVNczVnHshJ44UOKOCHVCOp8HJTPGdN5qgCpfr7HDHHECsFCXqexQ5y0WzGGiIq9h6NoM
	KhirEA5C0p1gfUA7ajEIbK3TxkN1/5w46zd12fqdYLiA1nozQrflhEJPj146C8lVrhhTQHSRcygbe
	oKKNjRxryYYKTNjCIoCQzRiZjB6lHTqEbqVOhbR8zKNkuViO/I5jdNAI8//uGgFJyiVBF7VCUkpsl
	yPhSYagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkw4f-0000000GHwF-0S4l;
	Thu, 20 Feb 2025 02:14:01 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkw3A-0000000GHPJ-1r0w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 02:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740017548; x=1771553548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4GOWM9o6duBwNSk0MN9yfWLhHhK9OLJQXgL3slB8rzo=;
  b=jt9Lj/khmwohdaWC3rsnM/x+5o1XBJGAx5GD0Y6nL9ge6e8Lj/PtUl1N
   c7cd6RxxYt7nvM98zXeJQph9oSn5jTCGl7S3SbIZvGrf2MChtOnHymJNA
   clHKbLcx+4XZjwGTfgbhP8bhWBviY2oJnSJ+YLqN0Bjy3Fr9PnCog6HAC
   jRcolTaO6b6o/IB6k+e6bRtdyldNtCKdEve6avwjZZ5dl2Iqw/lAiuU5w
   IWrKsnVzHvTZLznMeMgvRreYUZTwRYBH9cCSh1RQeptBG7nhxyY7AD5BM
   6iwyZNOxBdUfofA8oatCcpNIHsBktNf4x31bTpca3J55BVsEu+OfQz3vG
   Q==;
X-CSE-ConnectionGUID: UeGaj7YxQDq26XrgJP4qhA==
X-CSE-MsgGUID: EYGyFaDRRLCcFnK5FLE38Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44554545"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="44554545"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:12:24 -0800
X-CSE-ConnectionGUID: YqxEkxR6RByijTI3qHobrg==
X-CSE-MsgGUID: cCeY1AXzS7ODnxJwAyxXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="114738857"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.53.67]) ([10.247.53.67])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 18:12:17 -0800
Message-ID: <be0689a5-2202-4231-9e97-49e9576236a2@linux.intel.com>
Date: Thu, 20 Feb 2025 10:12:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/7] net: pcs: xpcs: re-initiate clause 37
 Auto-negotiation
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
 Heiner Kallweit <hkallweit1@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_181228_686979_1999F712 
X-CRM114-Status: UNSURE (   8.61  )
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



On 6/2/2025 11:30 pm, Russell King (Oracle) wrote:
> Also, if the reset is required, what happens if we're already using
> SGMII, but AN has been disabled temporarily and is then re-enabled?
> Is a reset required?
> 

Hi Russell,

When we use SGMII with XPCS, the AN is disabled and then re-enabled. This 
process does not involve any PCS configuration, so a reset is not required.

I tested it with stmmac (dwmac5) + xpcs + Marvell (88E1510) PHY, and it 
works fine when AN is temporarily disabled and then re-enabled without a reset.

