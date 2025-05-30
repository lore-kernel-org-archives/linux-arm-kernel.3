Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA24FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 20:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/7Rjw+WopmTa1vaLvNS1VCjRXs+bdi21LWvZ4+BSm4=; b=3QsVSKMmlOorwaAmM9BDt75Emu
	dYBavPdAQa8PDqkHw14kw0D7eZ/C8Wkc04oQWi2njwhpYM5AvmYWNPmqRpa5pJXBgoQeTzRfj3T6s
	5ScW7Fd5resaX5NRtJ5CQJGg0LOu7PnJnAlL5c8T1O/0ZnnGCsyBQWXqIjwPhv3Six4TMlIXR7jQS
	GpubZjUMEPDEn7cHUDJ90Ky0K+ZzQSsLZ/O2IOgD9tN+x47Sk199cysEIXjiEXLxWBpBZh0xXywA5
	bE4Y+STORk/UaWF/XgBjnPt5RfcR4cEFri/FjjmO0UsYF6/OZEyVjegjfTqHNKI+wqSYWBM9SeaLi
	Ke3cNehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL6dN-00000001qJY-1fMd;
	Fri, 30 May 2025 20:47:21 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL6bB-00000001pcU-3pOR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 20:45:08 +0000
Message-ID: <e6f20d3c-65fb-4809-a105-36ad8f2b2645@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748637900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/7Rjw+WopmTa1vaLvNS1VCjRXs+bdi21LWvZ4+BSm4=;
	b=wgTv7ZFzuDrEitYZ5MS8IP+Z11ysmO775gDIsE9WW/aQp24Xv8kAr0htlnYVlgzDMWkUM/
	WypaObQwodd5JfdOeavCTx6Vh+ez9+1uYfsXIcCfsKLmpa622ZEGqjC8gkeYKwH8XDSTIn
	BF4TbEDqLaAkP4lK4Jue+2ttGk1rMNA=
Date: Fri, 30 May 2025 16:44:56 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report
 coalesce parameters in DMAengine flow
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "horms@kernel.org" <horms@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>, "Katakam, Harini" <harini.katakam@amd.com>
References: <20250525102217.1181104-1-suraj.gupta2@amd.com>
 <679d6810-9e76-425c-9d4e-d4b372928cc3@linux.dev>
 <BL3PR12MB6571ABA490895FDB8225CAEBC967A@BL3PR12MB6571.namprd12.prod.outlook.com>
 <d5be7218-8ec1-4208-ac24-94d4831bfdb6@linux.dev>
 <BL3PR12MB6571A48E5FD0092231D0B0A5C961A@BL3PR12MB6571.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <BL3PR12MB6571A48E5FD0092231D0B0A5C961A@BL3PR12MB6571.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_134506_729154_6853BFAD 
X-CRM114-Status: GOOD (  33.55  )
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

On 5/30/25 06:18, Gupta, Suraj wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Thursday, May 29, 2025 9:48 PM
>> To: Gupta, Suraj <Suraj.Gupta2@amd.com>; andrew+netdev@lunn.ch;
>> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
>> pabeni@redhat.com; vkoul@kernel.org; Simek, Michal <michal.simek@amd.com>;
>> Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; horms@kernel.org
>> Cc: netdev@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; Katakam, Harini
>> <harini.katakam@amd.com>
>> Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report coalesce
>> parameters in DMAengine flow
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> On 5/28/25 08:00, Gupta, Suraj wrote:
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >
>> >> -----Original Message-----
>> >> From: Sean Anderson <sean.anderson@linux.dev>
>> >> Sent: Tuesday, May 27, 2025 9:47 PM
>> >> To: Gupta, Suraj <Suraj.Gupta2@amd.com>; andrew+netdev@lunn.ch;
>> >> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
>> >> pabeni@redhat.com; vkoul@kernel.org; Simek, Michal
>> >> <michal.simek@amd.com>; Pandey, Radhey Shyam
>> >> <radhey.shyam.pandey@amd.com>; horms@kernel.org
>> >> Cc: netdev@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> >> linux- kernel@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>;
>> >> Katakam, Harini <harini.katakam@amd.com>
>> >> Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and
>> >> report coalesce parameters in DMAengine flow
>> >>
>> >> Caution: This message originated from an External Source. Use proper
>> >> caution when opening attachments, clicking links, or responding.
>> >>
>> >>
>> >> On 5/25/25 06:22, Suraj Gupta wrote:
>> >> > Add support to configure / report interrupt coalesce count and
>> >> > delay via ethtool in DMAEngine flow.
>> >> > Netperf numbers are not good when using non-dmaengine default
>> >> > values, so tuned coalesce count and delay and defined separate
>> >> > default values in dmaengine flow.
>> >> >
>> >> > Netperf numbers and CPU utilisation change in DMAengine flow after
>> >> > introducing coalescing with default parameters:
>> >> > coalesce parameters:
>> >> >    Transfer type        Before(w/o coalescing)  After(with coalescing)
>> >> > TCP Tx, CPU utilisation%      925, 27                 941, 22
>> >> > TCP Rx, CPU utilisation%      607, 32                 741, 36
>> >> > UDP Tx, CPU utilisation%      857, 31                 960, 28
>> >> > UDP Rx, CPU utilisation%      762, 26                 783, 18
>> >> >
>> >> > Above numbers are observed with 4x Cortex-a53.
>> >>
>> >> How does this affect latency? I would expect these RX settings to
>> >> increase latency around 5-10x. I only use these settings with DIM
>> >> since it will disable coalescing during periods of light load for better latency.
>> >>
>> >> (of course the way to fix this in general is RSS or some other method
>> >> involving multiple queues).
>> >>
>> >
>> > I took values before NAPI addition in legacy flow (rx_threshold: 24, rx_usec: 50) as
>> reference. But netperf numbers were low with them, so tried tuning both and
>> selected the pair which gives good numbers.
>>
>> Yeah, but the reason is that you are trading latency for throughput.
>> There is only one queue, so when the interface is saturated you will not get good
>> latency anyway (since latency-sensitive packets will get head-of-line blocked). But
>> when activity is sparse you can good latency if there is no coalescing. So I think
>> coalescing should only be used when there is a lot of traffic. Hence why I only
>> adjusted the settings once I implemented DIM. I think you should be able to
>> implement it by calling net_dim from axienet_dma_rx_cb, but it will not be as efficient
>> without NAPI.
>>
> 
> Ok, got it. I'll keep default values used before NAPI in legacy flow (coalesce count: 24, delay: 50) for both Tx and Rx and remove perf comparisons.

Those settings are actually probably even worse for latency. I'd leave
the settings at 0/0 (coalescing disabled) to match the existing
behavior. I think the perf comparisons are helpful, especially for
people who know they are going to be throughput-limited.

My main point is that I think extending the dmaengine API to allow for
DIM will have practical benefits in reduced latency.

>> Actually, if you are looking into improving performance, I think lack of NAPI is
>> probably the biggest limitation with the dmaengine backend.
>>
> Yes, I agree. NAPI for DMAEngine implementation is underway and will be sent to mainline soon.

Looking forward to it.

>> >> > Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
>> >> > ---
>> >> > This patch depend on following AXI DMA dmengine driver changes sent
>> >> > to dmaengine mailing list as pre-requisit series:
>> >> > https://lore.kernel.org/all/20250525101617.1168991-1-suraj.gupta2@amd.
>> >> > com/
>> >> > ---
>> >> >  drivers/net/ethernet/xilinx/xilinx_axienet.h  |  6 +++
>> >> > .../net/ethernet/xilinx/xilinx_axienet_main.c | 53
>> >> > +++++++++++++++++++
>> >> >  2 files changed, 59 insertions(+)
>> >> >
>> >> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> >> > b/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> >> > index 5ff742103beb..cdf6cbb6f2fd 100644
>> >> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> >> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
>> >> > @@ -126,6 +126,12 @@
>> >> >  #define XAXIDMA_DFT_TX_USEC          50
>> >> >  #define XAXIDMA_DFT_RX_USEC          16
>> >> >
>> >> > +/* Default TX/RX Threshold and delay timer values for SGDMA mode
>> >> > +with
>> >> DMAEngine */
>> >> > +#define XAXIDMAENGINE_DFT_TX_THRESHOLD       16
>> >> > +#define XAXIDMAENGINE_DFT_TX_USEC    5
>> >> > +#define XAXIDMAENGINE_DFT_RX_THRESHOLD       24
>> >> > +#define XAXIDMAENGINE_DFT_RX_USEC    16
>> >> > +
>> >> >  #define XAXIDMA_BD_CTRL_TXSOF_MASK   0x08000000 /* First tx packet
>> */
>> >> >  #define XAXIDMA_BD_CTRL_TXEOF_MASK   0x04000000 /* Last tx packet
>> */
>> >> >  #define XAXIDMA_BD_CTRL_ALL_MASK     0x0C000000 /* All control bits */
>> >> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> >> > b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> >> > index 1b7a653c1f4e..f9c7d90d4ecb 100644
>> >> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> >> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>> >> > @@ -1505,6 +1505,7 @@ static int axienet_init_dmaengine(struct
>> >> > net_device *ndev)  {
>> >> >       struct axienet_local *lp = netdev_priv(ndev);
>> >> >       struct skbuf_dma_descriptor *skbuf_dma;
>> >> > +     struct dma_slave_config tx_config, rx_config;
>> >> >       int i, ret;
>> >> >
>> >> >       lp->tx_chan = dma_request_chan(lp->dev, "tx_chan0"); @@
>> >> > -1520,6
>> >> > +1521,22 @@ static int axienet_init_dmaengine(struct net_device
>> >> > +*ndev)
>> >> >               goto err_dma_release_tx;
>> >> >       }
>> >> >
>> >> > +     tx_config.coalesce_cnt = XAXIDMAENGINE_DFT_TX_THRESHOLD;
>> >> > +     tx_config.coalesce_usecs = XAXIDMAENGINE_DFT_TX_USEC;
>> >> > +     rx_config.coalesce_cnt = XAXIDMAENGINE_DFT_RX_THRESHOLD;
>> >> > +     rx_config.coalesce_usecs =  XAXIDMAENGINE_DFT_RX_USEC;
>> >>
>> >> I think it would be clearer to just do something like
>> >>
>> >>         struct dma_slave_config tx_config = {
>> >>                 .coalesce_cnt = 16,
>> >>                 .coalesce_usecs = 5,
>> >>         };
>> >>
>> >> since these are only used once. And this ensures that you initialize the whole
>> struct.
>> >>
>> >> But what tree are you using? I don't see these members on net-next or
>> dmaengine.
>> >
>> > These changes are proposed in separate series in dmaengine
>> https://lore.kernel.org/all/20250525101617.1168991-2-suraj.gupta2@amd.com/ and I
>> described it here below my SOB.
>>
>> I think you should post those patches with this series to allow them to be reviewed
>> appropriately.
>>
>> --Sean
> 
> DMAengine series functionality depends on commit
> (https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/commit/drivers/dma/xilinx?h=next&id=7e01511443c30a55a5ae78d3debd46d4d872517e)
> in dmaengine which is currently not there in net-next. So I sent that
> to dmaengine only. Please let me know if any way to send as single
> series.

It looks like this won't cause any conflicts, so I think you can just
send the whole series with a note in the cover letter like

| This series depends on commit 7e01511443c3 ("dmaengine: xilinx_dma:
| Set dma_device directions") currently in dmaengine/next.

--Sean

