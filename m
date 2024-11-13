Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9E6D637AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWdraMTVeNIM4NSlaCzFrild4p5shHOr4URPUgblrBo=; b=oS/Omp/qj8w2gwdMdeM1PT3haW
	KJKnvcqcXaVXDkCu/yL9SSnfy5In2+Q2WgBRWul51QHOgZEQmfMCSHbX6oaWPqJW6OiqrZTVaW238
	0ZKZe73dB29WEZN/xjuSjHqY4TBSZ23eIIWDWQ8rrLCiLRWylp1OSnZ+wc4ZhnIlhsedE8eInmDGg
	Z+DzziqdbnDo3HSzKSpF97bi4qu22lMYW/ALr4uAb4it5YWq+GZ3b8RjVZRB8SG2JPuBuUNFhB9T3
	tFDGGFb6GMqd86eAxK7vApETjWYKj1fvApjGOuA7m3VWbTm8SZAsLc+HJu9iu9eqvAlF/QzB58Nxz
	zDBhLP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBK0W-00000007yCI-1nvV;
	Wed, 13 Nov 2024 20:30:32 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJy4-00000007y3F-1j5j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 20:28:40 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 53CA788FFC;
	Wed, 13 Nov 2024 21:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731529678;
	bh=lWdraMTVeNIM4NSlaCzFrild4p5shHOr4URPUgblrBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ydVeEGP6ZxJfQzdHvT7d6DrPLkYX+Vzax5Cvb1wmTPw+P7jCNGkr3Ibr4dYtXrQi9
	 gce+/El8k/r3LAuvjxwypqNxPxFPy73+MJXNvST7S78jCN1EqLE8vCBg+SXow4lqln
	 RbmPLzChD5dya9jGH3NKcT6mIHqG8jl3LAW+KV8ygyBtQRTcdA1l9LPkdoI7MjBtZo
	 /pSP8c1GhvRtTA83TVwnOS99bNxLUjaHSytLUsLaQij32YEjAmdevwkhHY/IbKq6Fb
	 RVQTaBD+UQBrW2QGbwuAxs9hv5eDFTLcy8GcuolrTunvnCOZh/+GAGHrEMDXJkA5QQ
	 W1deQGy2iu25w==
Message-ID: <14d05680-3112-4ad6-9d4c-e892359fc9d4@denx.de>
Date: Wed, 13 Nov 2024 20:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: "Gajjar, Parth" <parth.gajjar@amd.com>,
 "Sagar, Vishal" <vishal.sagar@amd.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 "Simek, Michal" <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
 <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
 <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
 <638cdca0-05ba-4b2b-8a92-3041247c2c7f@denx.de>
 <PH7PR12MB69557B0065EE5D4E51EE13FF995A2@PH7PR12MB6955.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <PH7PR12MB69557B0065EE5D4E51EE13FF995A2@PH7PR12MB6955.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_122800_654322_18F3621E 
X-CRM114-Status: GOOD (  12.00  )
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

On 11/13/24 2:32 PM, Gajjar, Parth wrote:
> Hi Marek,

Hi,

> We tried running kmscube application with lima driver and it is working fine.
> Attaching application logs and boot logs.
> 
> We are using our 6.6 kernel.
> Meanwhile we will also check with upstream kernel.

Is this the heavily patched kernel version from
https://github.com/Xilinx/linux-xlnx branch xlnx/xlnx_rebase_v6.6_LTS
with
  865 files changed, 216895 insertions(+), 8276 deletions(-)
or an actual stock 6.6.40 ?

> Is it maybe possible some newer blob(s) enable both PP0 and PP1 internally to work around this clocking issue in Linux ?

The blobs I use are 2019.1 , so what about this question ^ ?

