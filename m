Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686CCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BD0XefKDj9yNlwNGnApL1S2MWmUQptL4sGSYMNTzvM=; b=y3QzSkyyJ1JNvIX2fmxMXNtwiA
	yTb6Qo9H98YE+rgR98pT7vPv7XZHlrHR3EhVath4Exj9TNbDrZJesC8JD8dJrhJsn6jxITdPut7eJ
	6s6Ii80uSgD7RdVfQCFTXGLA9Ass1tvu9GlSXmuBZfm/5C3Xgk7hYOdPoT3Arpb152we5gb2DyTAE
	nOFFiLPZAt1cKblNk3CmoWFTL9r5sss3nn61tL2dEkeW6lcpBUkdGeFQWfvlc75bGIgUryyWVwbXf
	+Yk9UkkeyCFcVlrpZ3CAJxt8zRc4MoUTsCXDReIDYNPNdn5KZ5rtn+6iJesAGNpTmZYpYWWcMsGs5
	Ruu5JLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvAe-0000000DEwI-2Q4G;
	Wed, 17 Sep 2025 16:38:16 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvAc-0000000DEtA-08BI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:38:15 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HGbcFp1655272;
	Wed, 17 Sep 2025 11:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758127058;
	bh=6BD0XefKDj9yNlwNGnApL1S2MWmUQptL4sGSYMNTzvM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=q0ERZa5tqZqU4zCPUnv1rj/OdqwUCgq2yIoNfx9SuMVkU4OcYwD5RChM1gSOiaI+8
	 LrbmZdc1KQIlqXwSZbu9NpLP2ShxIdOn0BwI4vqHo/975hH3Odtd+Fg+QrvMp+Wx50
	 JH1pfcoft4byTIaa6aw1dQu6syisj9+1ccjnz7F8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HGbcDA1459556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 11:37:38 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 11:37:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 11:37:37 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HGbafA3364151;
	Wed, 17 Sep 2025 11:37:36 -0500
Message-ID: <65a98655-68a1-4bf9-b139-c4172f48dad4@ti.com>
Date: Wed, 17 Sep 2025 11:37:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/7] Add RPMSG Ethernet Driver
To: MD Danish Anwar <danishanwar@ti.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
	<nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>, Xin Guo <guoxin09@huawei.com>,
        Michael Ellerman
	<mpe@ellerman.id.au>, Fan Gong <gongfan1@huawei.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Lukas Bulwahn
	<lukas.bulwahn@redhat.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
References: <20250911113612.2598643-1-danishanwar@ti.com>
 <8a20160e-1528-4d0e-9347-0561fc3426b4@ti.com>
 <7cd06f8f-bd74-429d-bf2c-71858178950a@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <7cd06f8f-bd74-429d-bf2c-71858178950a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_093814_162747_5A2A17DB 
X-CRM114-Status: GOOD (  20.34  )
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

On 9/17/25 6:44 AM, MD Danish Anwar wrote:
> Hi Andrew,
> 
> On 11/09/25 9:34 pm, Andrew Davis wrote:
>> On 9/11/25 6:36 AM, MD Danish Anwar wrote:
>>> This patch series introduces the RPMSG Ethernet driver, which provides a
>>> virtual Ethernet interface for communication between a host processor and
>>> a remote processor using the RPMSG framework. The driver enables
>>> Ethernet-like packet transmission and reception over shared memory,
>>> facilitating inter-core communication in systems with heterogeneous
>>> processors.
>>>
>>
>> This is neat and all but I have to ask: why? What does this provide
>> that couldn't be done with normal RPMSG messages? Or from a userspace
>> TAP/TUN driver on top of RPMSG?
>>
> 
> This is different from RPMSG because here I am not using RPMSG to do the
> actual TX / RX. RPMSG is only used to share information (tx / rx
> offsets, buffer size, etc) between driver and firmware. The TX / RX
> happens in the shared memory. This implementation uses a shared memory

This is how RPMSG is supposed to be used, it is meant for small messages
and signaling, bulk data should be send out-of-band. We have examples
specifically showing how this should be done when using RPMSG[0], and our
RPMSG backed frameworks do the same (like DSP audio[1] and OpenVX[2]).

> circular buffer with head/tail pointers for efficient data passing
> without copies between cores.
> 
>> This also feels like some odd layering, as RPMSG sits on virtio, and
>> we have virtio-net, couldn't we have a firmware just expose that (or
>> would the firmware be vhost-net..)?
>>
> 
> PMSG sits on virtio, and we do have virtio-net but I am not trying to do
> ethernet communication over RPMSG. RPMSG is only used to exchange
> information between cores regarding the shared memory where the actual
> ethernet communication happens.
> 

Again nothing new here, virtio-net does control plane work though a
message channel but the data plane is done using fast shared memory
vqueues with vhost-net[3]. Using RPMSG would just be an extra unneeded
middle layer and cause you to re-implement what is already done with
virtio-net/vhost-net.

Andrew

[0] https://git.ti.com/cgit/rpmsg/rpmsg_char_zerocopy
[1] https://github.com/TexasInstruments/rpmsg-dma
[2] https://github.com/TexasInstruments/tiovx
[3] https://www.redhat.com/en/blog/deep-dive-virtio-networking-and-vhost-net

>> Andrew
>>
> 
> 


