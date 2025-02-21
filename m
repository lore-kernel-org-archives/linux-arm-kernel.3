Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F64C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+x+EaGcFloDpw0PN2mNyGlDOAS7KxkJW3uvqoSqKDms=; b=oOxiRDqBn9fdwEhg9hpChzIK36
	f7wEHDItXElgmQtqoqGdowNheZqKw608ha8qKcCUuhpkrFP8lcIRZmwFaaYlixntn6sccTxxTZqWi
	DoMr9aLL5x50gHl0gKC+ZYR1Kzf8KgtvOxPqMSdWkB0msQZk4YVqQCEfnxgpTDpfwwrN6MxF6TDVp
	Hz4R8JMn5or8TIuLwrqEuUComIQq9tOeKfFGYidNNjEkaaaHtaYKbqzgos/GthJRbKRt7BNWCl1U1
	LpeIl7bC4Et8ULPiQ/hvH5vRbXKrBpq2+FBP4b6mcURBT/38cW138JVFzTam/LzMLPyl/vvbE9ENh
	EM6FJ3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlT8G-00000005eso-3yt8;
	Fri, 21 Feb 2025 13:31:56 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlT6l-00000005eY0-2osM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 13:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740144624; x=1771680624;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yrgPSzS1iVpcnrrmsNx/lFzIbzwcOZjCNokDJvcWQ3s=;
  b=CIf3ZSMX1nmKSHmNXl96Aea/7otTl25rRQTxYIZPQ8fRomVnz4fgX+/P
   p2gB3HhZkqx7Rf5pd4rLkQbFROj4pklqBhMuBxW1m24EyZZ/ilNZSnbsO
   VVXF1FeHCPfMfUQdh+VmbgNrr8ULsnxJvIvgvzy8nedU0J8oqkJ8wWCgq
   aDVulbrDV7qdl/kJywiwOhBy/z42dXOZWKnqVgaWoqAz9Y0UVoan5MuzA
   RYZmQlJxsj5qjHO0JCXDrYi7py03MoVREqD2BK9OeSYmvX2z/PWFAd9uC
   p1ziHL/b4KiLavA5wBfR3coae88WGBDI+KX2nT8cah0XERpBBcZyBWhde
   g==;
X-CSE-ConnectionGUID: uoahPD9aQ9mw081NEMxJxA==
X-CSE-MsgGUID: jcvmdVlWTdyxDjd9VDd8sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58510794"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="58510794"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 05:30:22 -0800
X-CSE-ConnectionGUID: Yyg/CP+UTXO0VBzS4RNfow==
X-CSE-MsgGUID: k5Pn0+0ERjyzbmGZjjCwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120614996"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.60.175]) ([10.247.60.175])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 05:30:11 -0800
Message-ID: <3fbe3955-48b8-449d-93ff-2699a7efcd8d@linux.intel.com>
Date: Fri, 21 Feb 2025 21:30:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v5 1/9] net: ethtool: mm: extract stmmac
 verification logic into common library
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Furong Xu <0x1207@gmail.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250221174249.000000cc@gmail.com> <20250221095651.npjpkoy2y6nehusy@skbuf>
 <20250221182409.00006fd1@gmail.com> <20250221104333.6s7nvn2wwco3axr3@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250221104333.6s7nvn2wwco3axr3@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_053023_718610_6F0205DC 
X-CRM114-Status: GOOD (  16.02  )
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



On 21/2/2025 6:43 pm, Vladimir Oltean wrote:
> On Fri, Feb 21, 2025 at 06:24:09PM +0800, Furong Xu wrote:
>> Your fix is better when link is up/down, so I vote verify_enabled.
> 
> Hmmm... I thought this was a bug in stmmac that was carried over to
> ethtool_mmsv, but it looks like it isn't.
> 
> In fact, looking at the original refactoring patch I had attached in
> this email:
> https://lore.kernel.org/netdev/20241217002254.lyakuia32jbnva46@skbuf/
> 
> these 2 lines in ethtool_mmsv_link_state_handle() didn't exist at all.
> 
> 	} else {
>>>>> 		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
>>>>> 		mmsv->verify_retries = ETHTOOL_MM_MAX_VERIFY_RETRIES;
> 
> 		/* No link or pMAC not enabled */
> 		ethtool_mmsv_configure_pmac(mmsv, false);
> 		ethtool_mmsv_configure_tx(mmsv, false);
> 	}
> 
> Faizal, could you remind me why they were added? I don't see this
> explained in change logs.
> 

Hi Vladimir,

Yeah, it wasn’t there originally. I added that change because it failed the 
link down/link up test.
After a successful verification, if the link partner goes down, the status 
still shows ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED, which isn’t correct—so 
that’s why I added it.

Sorry for not mentioning it earlier. I assumed you’d check the delta 
between the original patch and the upstream one, my bad, should have 
mentioned this logic change.

Should I update it to the latest suggestion?




