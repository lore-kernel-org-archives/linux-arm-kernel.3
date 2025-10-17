Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C636CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pm4SvBhyBXqqMBUE8P86/UF8WP0RkuXkSVtcysJBKDc=; b=4YpD8ExD5gZXdk1hxdC0HNje+J
	xpsAarvwAq+S3Krxrm/5fp6ZXA8W2gJR+ELRRnzMTjj1C6gTSYCUaBzNsYzUWmLgD+HTWrZqhJNc4
	YGRi7FoCefS9sCicD254BdjX4MtmJkQJ+0TIn58DZWe39xJpIIXjxAJU7PZ8YBmNtHwAcTWeUfKcI
	IcYSMUi6BnvcnAr+G0cTVeXy4mpEde5e/gjpOuwmoAjmn6pAuCjzRLzS8f7y/EVj/vx6wGPuM6oL4
	EhOEs/NJv5FKsty+M8IX4RC17jrBZXYtJA/1E3hQUBgUSxyMjtBjuvielWa5e7TOxiDZEp9mpUJJ0
	VGliaPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jTE-00000007nE6-2PYQ;
	Fri, 17 Oct 2025 12:22:08 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jTB-00000007nDB-2Bez
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:22:07 +0000
Message-ID: <83ffc316-6711-4ae4-ad10-917f678de331@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760703720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pm4SvBhyBXqqMBUE8P86/UF8WP0RkuXkSVtcysJBKDc=;
	b=stBFIijknAIaQCktEObO1xPMD1ChASDC9VZojqVyFVrqnsIFbs9oq/ezFB8rp7D4w1ms5a
	Vbg5rmvsgtccQsQwbkSfu2j94pn4HRe+HSNysIhQlWvpzgObZQbA2RgkztsgdXWT/rNVjG
	GeBghovGgUutRQLjuvLSY6O44YANHWM=
Date: Fri, 17 Oct 2025 13:21:54 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthew Gerlach <matthew.gerlach@altera.com>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <d7bbb7dd-ddc6-43d6-b234-53213bde71bd@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_052205_969239_B19B8625 
X-CRM114-Status: GOOD (  14.37  )
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

On 17/10/2025 08:36, G Thomas, Rohan wrote:
> Hi All,
> 
> On 10/17/2025 11:41 AM, Rohan G Thomas via B4 Relay wrote:
>> +    sdu_len = skb->len;
>>       /* Check if VLAN can be inserted by HW */
>>       has_vlan = stmmac_vlan_insert(priv, skb, tx_q);
>> +    if (has_vlan)
>> +        sdu_len += VLAN_HLEN;
>> +
>> +    if (priv->est && priv->est->enable &&
>> +        priv->est->max_sdu[queue] &&
>> +        skb->len > priv->est->max_sdu[queue]){
> 
> I just noticed an issue with the reworked fix after sending the patch.
> The condition should be: sdu_len > priv->est->max_sdu[queue]
> 
> I’ll send a corrected version, and will wait for any additional comments
> in the meantime.

Well, even though it's a copy of original code, it would be good to
improve some formatting and add a space at the end of if statement to
make it look like 'if () {'>
>> +        priv->xstats.max_sdu_txq_drop[queue]++;
>> +        goto max_sdu_err;
>> +    }
>>       entry = tx_q->cur_tx;
>>       first_entry = entry;
>>
> 
> Best Regards,
> Rohan
> 


