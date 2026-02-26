Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3CBFD9E20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 23:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v5avoGOleuykikPyFzz717Uwgm0oyh5TKNI4z15XhE=; b=e6MG/Hws2UPF6H8q0ugyY9sJ21
	NuRV48AuyaxF19HmA0MmBZeTkTmoY6A6scDbwpJZqwBrny9LXlR+vo/ppyhMAZdTUwQecxzGgIrR5
	lpxTxzGyG/N2g1XhQw53dPw7ydrAtfUvMEUYZztZi66rtyuUtLzReut96Nmf3KTj3uKAnIKsrgiaZ
	oMCGqLf2mVufNYEfD5VQYM20dUeEeiZoxSKHSld7tRAlcR1B/VdGZuaLDOwo+GOx+ELsskDFFdsvy
	pBJGsu8zcCsL7BjDSM44zif89ynl7A5BNoy1L9ib5GEcPakkRXe6G6koH2Q6A7nOIrMhVUvsVzfQg
	v9s2SpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvkP1-00000007Kuj-0qFg;
	Thu, 26 Feb 2026 23:04:15 +0000
Received: from mout-b-107.mailbox.org ([2001:67c:2050:102:465::107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvkOz-00000007KtV-0W2r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 23:04:14 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4fMRpq6JCKzDryh;
	Fri, 27 Feb 2026 00:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1772147043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7v5avoGOleuykikPyFzz717Uwgm0oyh5TKNI4z15XhE=;
	b=o2DpK13tVS01D5w7H1q7+YcyRyDt3lQULFhP/3N/Jqyz6v88rH863uQvftAv/Kyzew+w7i
	XaiFvQxO1EUB+rAfWo5+PsKp/DY5ctsCOHKu4gQnuvQ4A132k+HY9Q3bNaMUQvzvhz4Tfq
	MkFq53mX4CkODLV4OxmGnwqlRx946yUyoNlFd8sb11JWHS4+igW60SHg6S9WKw9VSW774i
	yW5HefTqzlxAJzY9IzUHkGYqDf58drb5T7n1pQSJhIquDilfsSq2tLvdIkhEq8CqowaphZ
	r+51dVZxMcNE7hfdZpIOBqQ3DjRUL93O1aeWHHfyqPynTFBF5EjHPGnVq/oWRw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
Message-ID: <eb249987-55b6-45ff-9cca-3ed198ba84cd@mandelbit.com>
Date: Fri, 27 Feb 2026 00:03:58 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] spi: stm32: fix missing pointer assignment in case of dma
 chaining
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clement LE GOFFIC <clement.legoffic@foss.st.com>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
 <d14f3943-b97a-4940-95dd-39c6fc240130@mandelbit.com>
 <aaB4z_A4aTqirDGb@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Organization: Mandelbit SRL
In-Reply-To: <aaB4z_A4aTqirDGb@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4fMRpq6JCKzDryh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_150413_344541_48BCC541 
X-CRM114-Status: GOOD (  18.55  )
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

On 26/02/2026 17:46, Alain Volmat wrote:
> Hi,
> 
> On Tue, Feb 24, 2026 at 04:25:14PM +0100, Antonio Quartulli wrote:
>> Hi,
>>
>> On 24/02/2026 16:09, Alain Volmat wrote:
>>> Commit c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
>>> introduced a regression since dma descriptors generated as part of the
>>> stm32_spi_prepare_rx_dma_mdma_chaining function are not well propagated
>>> to the caller function, leading to mdma-dma chaining being no more
>>> functional.
>>>
>>> Fixes: c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
>>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>>> ---
>>>    drivers/spi/spi-stm32.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
>>> index b99de8c4cc99..33f211e159ef 100644
>>> --- a/drivers/spi/spi-stm32.c
>>> +++ b/drivers/spi/spi-stm32.c
>>> @@ -1625,6 +1625,9 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>>>    		return -EINVAL;
>>>    	}
>>> +	*rx_mdma_desc = _mdma_desc;
>>> +	*rx_dma_desc = _dma_desc;
>>> +
>>
>> Thanks for catching this!
>>
>> Indeed my fix lost the pointer-to-pointer logic, which was needed to pass
>> back the computed values.
>>
>> This patch looks good, but at this point I think you can also remove the
>> lines:
>>
>> 	_dma_desc = NULL;
>>
>> in the error paths above? Setting them to NULL makes no sense as they are
>> not going anywhere.
> 
> I agree that those lines can be removed. However my feeling is that this
> is not part of this fix since this is more about removing useless lines.
> If this is ok for you I will propose another patch on top of the current
> one for that purpose and without the Fixes on it.

I agree.

This fix gets my

Acked-by: Antonio Quartulli <antonio@mandelbit.com>

However, I'd let Mark (the maintainer) decide.

Regards,


-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com


