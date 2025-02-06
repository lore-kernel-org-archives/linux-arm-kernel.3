Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D214C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 02:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdGwZSqMLG6HB7z6DCIwBH9sgCuX6xLn9aSU88g46T4=; b=rM3u1jpayPrLWTx+DgHZiK7GYV
	unWpAwUqzedeuVek4zUDHqGcsh+AalcLavdKb95T/Z7TsssvGHcNSaalvHiuJj/fZNjhMz9ndFqH4
	mp0fu3CVbnqs95AsbFu6smTwtzD2aYzbNOpRiQWkfybZc3wag9XZj/dGwXywNhzm7UdVYiTqmxSyw
	TQosvQKUY21JOrloOCI5GKNTZeKqE0UO9U8PyGUSSkaxnzEJpqRtFswb34TyxPPYpozPg367JvBe4
	eWoQ+BBK2wFgL/nP6vNk5N4+/w62hpQIlSIcdQyz4d9iKdzIqS151dehgFH5JFY3DRZPGU9mbyoWQ
	sMFJEoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrYR-000000053H3-0aT4;
	Thu, 06 Feb 2025 02:23:47 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfrWy-0000000535V-1Wei
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 02:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738808537; x=1770344537;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uEkC8AyPD4Fb3fQjLKAq4+ZamiFbVbnCIjXewv18gyk=;
  b=XeEVF0C1S/BPHQZUco4tFg/3VhBOlZIux958+ffj6Iz/ihFDVWm6vAiT
   6/iaooUqL6xpNmriQ5W4RS6TdsrjB7R9/cqrbg1lTSdygzwOa/fufn1P/
   1n39IHUp75Skju+8EOM0wA6POScvbdyay9HKolecPv1ThZKTxM8eHVuSn
   0iX+p5iP09g1wGDAY4L8uQ+JWvdb3KCFo3bgrwXlg+cbsMJOfOVFom3Q0
   eLJIGfCFMfEF13mh5hKQgZTEMlXPJYJklQ88u2Omc0WLEMnRJHVUJ4pz3
   oUl8gdh4YkUwFSnR5UkUEhJRjrLCtM4AblNo1dIXg12VtoGQFMvdO1Yeq
   Q==;
X-CSE-ConnectionGUID: nwn7OxwWTCyDG+ufeVGMVw==
X-CSE-MsgGUID: s3Y14owUQuW4X0RouMIjUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39096056"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39096056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:22:16 -0800
X-CSE-ConnectionGUID: W6Q6U9DXR1edt5B9hcX8PA==
X-CSE-MsgGUID: tg8iji2aSfKqHi2AdolNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="141957433"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.114.122]) ([10.247.114.122])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:22:07 -0800
Message-ID: <f272cb2a-1167-4e34-9209-ffdbbb107bdd@linux.intel.com>
Date: Thu, 6 Feb 2025 10:22:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 4/7] stmmac: intel: configure SerDes according
 to the interface mode
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
 Andrew Halaney <ahalaney@redhat.com>, Serge Semin <fancer.lancer@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-5-yong.liang.choong@linux.intel.com>
 <Z6IDWiRF73sdVWob@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6IDWiRF73sdVWob@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_182216_452465_312F1DD4 
X-CRM114-Status: GOOD (  12.73  )
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



On 4/2/2025 8:08 pm, Russell King (Oracle) wrote:
> On Tue, Feb 04, 2025 at 02:10:17PM +0800, Choong Yong Liang wrote:
>> +	int (*config_serdes)(struct net_device *ndev,
>> +			     void *priv,
>> +			     phy_interface_t interface);
> 
> Since you call this from phylink's mac_finish() method, I would much
> rather the call down into platform code was also called the same so
> we don't end up with a proliferation of methods called from that
> function. As such, please also arrange for it to pass the AN mode as
> well.
> 
> Thanks.
> 

Hi Russell,

Thank you for your feedback on the patch. Based on your suggestion, I have 
updated the code to align with the mac_finish() method and included the AN 
mode as well. The updated function signature is as follows:

int (*mac_finish)(struct net_device *ndev,
                   void *priv,
                   unsigned int mode,
                   phy_interface_t interface);

Could you please confirm if this meets your expectations, or if there are 
any further adjustments needed?

