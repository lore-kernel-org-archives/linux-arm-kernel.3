Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A33CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldA8Cq56ir/d+Ws7ka9AVxzOxCQyUGzp7/Z3Z9LemSk=; b=ipqwXIUUQWFrCWpQB8r++S6a0J
	Lwo8hIUGoGtLJTn2XPGOBIpxAeX25Q5oF434G/T91pAwn+fo069GBqrEUrkrM5vcyf69+BWl3F16y
	HH/uYlaWe90alRahY8h0riiz7NgXD0IXsHX2KlWhGUH0MkT1BjzrQATqhxDk7FojY5OKZMXBB30ZT
	iIxqA2z8EdPAoJDLg3lI3WUQMJtb0TN18cHOA8JhUqOvMIWj129OxtusZhFBDE3Gc33XfwOAbI+ho
	2BkkRWF7p1XJf83YtKeJ2Nvzzf7ZRXq7qJqtt92EwAr49twYB8y0qCvGSkFTB99v5fGRx0jGs1JLt
	SU3PXX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05C-00000007XN8-3FsC;
	Mon, 18 Aug 2025 13:39:30 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvaG-00000006yv8-29h2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:51:17 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55C50qHxz9sVk;
	Mon, 18 Aug 2025 10:16:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5xAwfCwBfZs; Mon, 18 Aug 2025 10:16:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55C46fb9z9sVf;
	Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CB4FE8B764;
	Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9jsli9on6cF7; Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C15C8B763;
	Mon, 18 Aug 2025 10:16:16 +0200 (CEST)
Message-ID: <06c3012d-96f1-434a-af17-a1705eede7d6@csgroup.eu>
Date: Mon, 18 Aug 2025 10:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: fsl: qmc: Only set completion interrupt when
 needed
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <badb68a85910e5e6f1094ef3b01805209ac21854.1754993232.git.christophe.leroy@csgroup.eu>
 <20250813120651.27dc8467@bootlin.com> <20250814093443.1506b49f@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250814093443.1506b49f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015116_720612_8318D010 
X-CRM114-Status: GOOD (  20.11  )
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

Hi Hervé,

Le 14/08/2025 à 09:34, Herve Codina a écrit :
> Hi Christophe,
> 
> On Wed, 13 Aug 2025 12:06:51 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
> 
>> Hi Christophe,
>>
>> On Tue, 12 Aug 2025 12:50:55 +0200
>> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>>> When no post-completion processing is expected, don't waste time
>>> handling useless interrupts.
>>>
>>> Only set QMC_BD_[R/T]X_I when a completion function is passed in,
>>> and perform seamless completion on submit for interruptless buffers.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v2: Keep the UB flag to mark not completed buffers and seamlessly flag them as completed during next submit.
>>> ---
>>>   drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
>>>   1 file changed, 33 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
>>> index 36c0ccc06151f..8f76b9a5e385d 100644
>>> --- a/drivers/soc/fsl/qe/qmc.c
>>> +++ b/drivers/soc/fsl/qe/qmc.c
>>> @@ -461,9 +461,16 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>>>   
>>>   	ctrl = qmc_read16(&bd->cbd_sc);
>>>   	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
>>> -		/* We are full ... */
>>> -		ret = -EBUSY;
>>> -		goto end;
>>> +		if (!(ctrl & QMC_BD_TX_I) && bd == chan->txbd_done) {
>>> +			if (ctrl & QMC_BD_TX_W)
>>> +				chan->txbd_done = chan->txbds;
>>> +			else
>>> +				chan->txbd_done++;
>>> +		} else {
>>> +			/* We are full ... */
>>> +			ret = -EBUSY;
>>> +			goto end;
>>> +		}
>>>   	}
>>>   
>>>   	qmc_write16(&bd->cbd_datlen, length);
>>> @@ -475,6 +482,10 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>>>   
>>>   	/* Activate the descriptor */
>>>   	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
>>> +	if (complete)
>>> +		ctrl |= QMC_BD_TX_I;
>>> +	else
>>> +		ctrl &= ~QMC_BD_TX_I;
>>>   	wmb(); /* Be sure to flush the descriptor before control update */
>>>   	qmc_write16(&bd->cbd_sc, ctrl);
>>>     
>>
>> You try to purge one descriptor for which the transfer is done but you do that
>> when you have no more free descriptors.
>>
>> You end up with all descriptor "used". I think a better way to do that is
>> to purge all "done" descriptor configured to work without interrupts until a
>> descriptor with interrupt is found.
> 
> I have looked again at your code and looking for a free descriptor only when it
> is needed is sufficient. You can forget my previous proposal.
> 
> Back to your code, I think you need to be sure that the descriptor you want to
> re-use is really available and so you need to check the 'R' bit to be sure
> that we are not with 'R' = 1 and 'UB' = 1 which means "BD is used, waiting for
> a transfer".
> 

Fixed in v3.

Thanks
Christophe

