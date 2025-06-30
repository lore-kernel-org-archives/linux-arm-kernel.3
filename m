Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80411C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFjDOLlecrclWt7YJmrrObsIk820FSakImsrzSFHDw8=; b=NImzv2gfT2P0uUyFrwI8+DKi+l
	njfVXvVFUZgaffkPqnPkPGKTzzbsq4GbQ4xcqSRdwdEhP4w5BodqMDvkSZQYNQxhwJkyGvRj15XKO
	Pya9VEpQoNlGCnanMgFD0f+1hxHrtQyhkSeV46aU0hwpxOCwEC7ieNvq816AtpBh60uT7pFmVkQRa
	PQMDjEQZ6MGENszVavG243PrKADDBxy51ey8RElXzMrU2qH4oGr4RMcaLQtCh0lMwmDqGfS+naV20
	VVi9tMsLtts27OgdU04FTWthvXAgE48x7K9+ad/6P47PX3DNar/5J8+y4RY48AH4YQsFLvj7HXvRn
	4dbN/2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW46j-000000011l1-3caA;
	Mon, 30 Jun 2025 02:18:57 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW44P-000000011UR-2nXi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 02:16:35 +0000
Message-ID: <3e7fa26f-16b0-4564-80e8-4f2b5bcae3e9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751249788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFjDOLlecrclWt7YJmrrObsIk820FSakImsrzSFHDw8=;
	b=Y+suG37x8DCkAZOCu1nt4ebEM9AELhOVAXOvGG+LAVn0o4CikCtI+Qx+xhmntwH8tajLPa
	KKWOVmi9CpAO3bTJX1+JFeSKt4bj/zCKrhygkRFCGzGgCjwb8+nVUX5Y+E7O0MvYTWWIwp
	llBFzp9AwtrGI9r9mriTD53Bstw3yi4=
Date: Mon, 30 Jun 2025 10:16:20 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: add support for dwmac 5.20
To: Andrew Lunn <andrew@lunn.ch>, Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250629094425.718-1-jszhang@kernel.org>
 <4d5a599a-60e5-4141-8671-ffcbda3aca02@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <4d5a599a-60e5-4141-8671-ffcbda3aca02@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_191634_215302_0179CE8E 
X-CRM114-Status: GOOD (  16.00  )
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

在 6/30/25 2:26 AM, Andrew Lunn 写道:
> On Sun, Jun 29, 2025 at 05:44:25PM +0800, Jisheng Zhang wrote:
>> The dwmac 5.20 IP can be found on some synaptics SoCs. Add a
>> compatibility flag, and extend coverage of the dwmac-generic driver
>> for the 5.20 IP.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
>> index b9218c07eb6b..cecce6ed9aa6 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
>> @@ -59,6 +59,7 @@ static const struct of_device_id dwmac_generic_match[] = {
>>   	{ .compatible = "snps,dwmac-3.72a"},
>>   	{ .compatible = "snps,dwmac-4.00"},
>>   	{ .compatible = "snps,dwmac-4.10a"},
>> +	{ .compatible = "snps,dwmac-5.20"},
>>   	{ .compatible = "snps,dwmac"},
>>   	{ .compatible = "snps,dwxgmac-2.10"},
>>   	{ .compatible = "snps,dwxgmac"},
> 
> I can see a compatible flag being added. But what about the extending
> the coverage of the dwmac-generic driver part?
I don't think the timing is ripe yet (including the patch itself).
Maybe it would be better to do this when a hardware driver is to
be introduced into the kernel.

Thanks,
Yanteng


