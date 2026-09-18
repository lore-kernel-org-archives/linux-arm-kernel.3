Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B341EC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBmuyDYC6BL0NuO22P/UKnyiVKMdfpL2R0mfPFPf/BQ=; b=jSg+aXKIeOPnNdvpDkFaCyhvm1
	hP9ZkKJzTqnkgYawZHiGosk0gOuvUEdQkSThg2kl6scXHP2Nyz8ViUFW7DfGq4FOtbtyTFtJLMNuh
	i/0FMtr36oU2anSs+KQHNHsXdNiADRafTug+ix1YhzubbOHP0915oaCTYgIBsVV7OH30GfY1D0SSv
	WoY1CtAmvwrLIPKCWLLZfJwhWyE1m0y140DRTgQr/MZfKIR7ZX/JOol8crAkFkJm2SkcKZp3BA9/o
	idhYtMq8MPm1qxWRkjYXOSzC1IAfzjKfqkqfqHov1f5oP9AqBBhQT+kvi0lzu7ODOWihhcL05rs3c
	7NKRBuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SlA-0000000DfBG-2fbT;
	Fri, 18 Sep 2026 07:11:48 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sl7-0000000DfAe-0WpY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=aBmuyDYC6BL0NuO22P/UKnyiVKMdfpL2R0mfPFPf/BQ=;
	b=gxOCxE8sPuNKysXsbS8wQRqJ9f+QjQpyHrOrdCDl8Ov3ZIhrUFtKok2X5Zxagr
	BeGM2ed0XtxHyPPWez4vSLRjhSSlfKeSJK+W1y4utwprJu87rWIRk4wopUndl/4Z
	PCUpZ7SAtAna82fL8jlCahXOqn1RahLRZPuHlGDJFE1jQ=
Message-ID: <6b00a649-8672-47c2-ab31-8b7d68ce1dcc@126.com>
Date: Fri, 18 Sep 2026 15:10:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: fix the invalid VID programmed by VLAN
 perfect filtering
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260917122245.1338365-1-xiaolinkui@126.com>
 <b521308c-34b8-40dc-831a-757a163902d6@bootlin.com>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <b521308c-34b8-40dc-831a-757a163902d6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3H6z146xqSl3ZBQ--.23835S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrJF15tF45Xw45Jw1rXrb_yoW8AFyxpa
	y3uFnakayqqr1fXFsFqF18X34jqw4fAr45KrZ8tFWUAw15C3saqFW8Ka95urW8ZF9Ygr1j
	ywsFy343GayvqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4Vb9UUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlRb70mqs4-Z0FQAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_001145_536885_EF7AD0FF 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Maxime,

On 2026/9/17 23:57, Maxime Chevallier wrote:
> Hi,
> 
> +Ovidiu
> 
> On 9/17/26 14:22, Linkui Xiao wrote:
>> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>>
>> for_each_set_bit() leaves its iterator equal to the bitmap size once the
>> loop terminates, so the 'vid' read after the loop in stmmac_vlan_update()
>> is always VLAN_N_VID (4096) and never the last VLAN ID that was found.
>>
>> Cores that do not support VLAN hash filtering (dma_cap.vlhash == 0) fall
>> back to the single VID perfect match filter and hand that value straight
>> to the MAC. vlan_update_hash() therefore programs MAC_VLAN_Tag with
>> VID 4096, a value that can never match an incoming 802.1Q tag, so the
>> perfect filter ends up discarding all VLAN tagged traffic. Both
>> stmmac_test_vlanfilt_perfect() and stmmac_test_dvlanfilt_perfect() walk
>> this path and fail as a result.
>>
>> Remember the VID while iterating so that the last active VLAN ID is the
>> one passed to the perfect match filter. When hash filtering is available
>> 'hash' is non-zero as soon as at least one VID is active, so
>> vlan_update_hash() keeps ignoring 'pmatch' and nothing changes there.
>>
>> Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> Thank you for proposing this fix, however this code is currently being removed :
> 
> https://lore.kernel.org/r/20260908164309.59282-1-ovidiu.panait.rb@renesas.com
> 
> So no need for this patch :)

Thanks for the heads-up. I'll drop this patch then.

Ovidiu, I'll keep an eye on your series. If the fallback path
still needs a valid VID after the removal, feel free to ping me.

Thanks,
Linkui
> 
> Maxime


