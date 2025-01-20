Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91E4C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuIlwQIppzZiZANUiNYhJ9syYVM/GdZezT8FryIqca8=; b=yOuOJaSAuApv9pN7UwrjMdl2EP
	F24+2Xyj37Yx7gZ2+/D6zEDIO9sQbfyfEa4k6fuAN83ZA5pT9fc9AFa82eEUQ5kzUEo+ffwy1s4id
	TjMSZ0+vxook4ENPZdbAgBrlphF+1WwIpJYVtRZ9WDMfsOgsU2XfLVr/Edc1ob7/FkS8AgK5vvtbr
	LXAaR1xjYm2KBqsC7RWlxO3KseTfqCNjqjIlZpqqHJD2IudyL0Yvc6mHFRN9CIWYWiGEuZa0O+rOH
	i9yvfirN/HSQue6tZZ4c5WbfTb9abmvxLNiP2RmxTueAFAf/qACSAyihEb53/zdcoqYhxBJmg1VOE
	BhAOphag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmBP-00000004v9A-2Iyh;
	Mon, 20 Jan 2025 07:26:51 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZm9t-00000004uxZ-3ajb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 07:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737357918; x=1768893918;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k4ykqooUPTL/roXw/fFpliH2XGWlf7OfDPK35rRh9HA=;
  b=gwFzZ0xGrisqzAUV46O6E6HlP5vhOaYO20xNEbsYVVJO3ioCJ0FhCfUX
   kBRaM8al/tHyA/n//i3XeMoisYHpozRS8KhsK2CQp0Whe1ESFtl3BvRCH
   m1LFbt50o/TuPb3EE8h+CLz/B+TGm31uilsGmbmd+CKsGm/p3Ec2URFWk
   MLHaZptVmb9sja5zeiRiM8lNHyZ6gzvFDfGKWAfUrM3eBwHpzyVUuyZKv
   +k5t+yKncg4eq9U+5smkt6UR1TPS5jwRw7PDfjx1q6PwqL5a+hF4xVQkw
   lQ0wMfDBVXC/EV/v5+TjwDpIklYX1AyujhH9WRNo+F7D7Yn2NJVHBJS7z
   w==;
X-CSE-ConnectionGUID: yynRHwRAQlqszJLW/zWo6Q==
X-CSE-MsgGUID: 5KPpPopaQ2uyeYst810uZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37601865"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37601865"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 23:25:12 -0800
X-CSE-ConnectionGUID: vyQrnkD1RKuZNocxarZucg==
X-CSE-MsgGUID: 4NfaGBcnSKmXfEo/7NNF7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106224522"
Received: from unknown (HELO [10.107.2.109]) ([10.107.2.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 23:25:02 -0800
Message-ID: <20fa0b55-405c-4b7c-8c10-1f8d71c956b9@linux.intel.com>
Date: Mon, 20 Jan 2025 15:24:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 4/4] igc: Add launch time support to XDP ZC
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Topel <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Mina Almasry <almasrymina@google.com>,
 Daniel Jurgens <danielj@nvidia.com>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Mykola Lysenko <mykolal@fb.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, intel-wired-lan@lists.osuosl.org,
 xdp-hints@xdp-project.net
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <84770113-2546-4035-8bd4-bf9cedcfb00f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_232518_242009_F5447ABF 
X-CRM114-Status: UNSURE (   8.69  )
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



On 20/1/2025 2:25 pm, Abdul Rahim, Faizal wrote:
> 
> To be cautious, could we perform a stress test by sending a higher number 
> of packets with launch time? For example, we could send 200 packets, each 
> configured with a launch time, and verify that the driver continues to 
> function correctly afterward.
> 
I agree on this point. Could you perform the same stress test on the STMMAC 
driver as well?

