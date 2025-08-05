Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14B7C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs+bWnDOx/OJlqb35VzN1pjD3ZJ8uXX7M0AUIGNqQOM=; b=tAyTJvjRrTMBYKy+Zi1yURf+Sm
	7fIm6iEdt6CKVTRGMjpZ3tVVlDSUH4F1cWjeVGYABmi+A9vxsjH5t1AiqsJdRVFuiOS3qfxmImSNL
	LJCUetej1DSJLeWBMn3CGkAbhlU7WygJ5NoYNY3EpV+cuPpYlDa9aYAtk5qRJYKWnilGFS7w/nOCg
	yAQLnasJXDTzvEbE7cj6bLqgCdfwX5wGjV5rJT3bikDUF9lGQAVOe2CKh9QiZM4DspmucjPWjhF9K
	KnFabg56pdSuggx4GfQAWEMI0f4j/B0upG2XT7vhBBHjAg2fWRhyEyn3xhplBe/IcX7ZWCoTVhkaV
	7iWGtKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPcV-0000000Ds8z-1pjT;
	Tue, 05 Aug 2025 21:54:55 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujPZr-0000000DrT5-1gDw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:52:12 +0000
Message-ID: <9557ecbe-ea07-45f0-b467-151e61054e02@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754430728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cs+bWnDOx/OJlqb35VzN1pjD3ZJ8uXX7M0AUIGNqQOM=;
	b=aEqUC350CjsrAOmJYdvVHpBrh8GxezYaONvLR0O3149K+tfs3IFcLivu7Yw6GiDN1PucOa
	09DVc1S4nS5ljjCOdLJxqL9Cuy0D8Zgm2u5LlQEX3LP5QVzeHka6aoFue2D4T2oq5hAaZQ
	LUHBbCQUbpyW8sT7sZoJ6qA+xM/rs2k=
Date: Tue, 5 Aug 2025 17:52:04 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 6/7] net: axienet: Rearrange lifetime
 functions
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>,
 Leon Romanovsky <leon@kernel.org>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-7-sean.anderson@linux.dev>
 <69b08e90-ae99-43fd-9779-dd5497a26e1f@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <69b08e90-ae99-43fd-9779-dd5497a26e1f@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_145211_661143_348AA2BF 
X-CRM114-Status: GOOD (  19.03  )
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

On 8/5/25 17:32, Andrew Lunn wrote:
> On Tue, Aug 05, 2025 at 11:34:55AM -0400, Sean Anderson wrote:
>> Rearrange the lifetime functions (probe, remove, etc.) in preparation
>> for the next commit. No functional change intended.
> 
> There is a lot going on in this patch. Can it be broken up a bit more?
>
> The phase "No functional change intended" generally means, its the
> same code, just in a different place in the files. This is not true of
> this patch.

Sorry, at one point that was true and then I made a some edits. I will
update the commit message.

>> +struct axienet_common {
>> +	struct platform_device *pdev;
>> +
>> +	struct clk *axi_clk;
>> +
>> +	struct mutex reset_lock;
> 
>>  static inline void axienet_lock_mii(struct axienet_local *lp)
>>  {
>> -	if (lp->mii_bus)
>> -		mutex_lock(&lp->mii_bus->mdio_lock);
>> +	mutex_lock(&lp->cp->reset_lock);
> 
> This lock is different to the bus lock. This is definitely not a "no
> functional change".
> 
> Please make this lock change a patch of its own, with a good commit
> message which considers the consequences of this change of lock.

OK

>>  		if (!np) {
>> -			dev_err(dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
>> -			ret = -EINVAL;
>> -			goto cleanup_mdio;
>> +			dev_err(dev,
>> +				"pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
>> +			return -EINVAL;
> 
> That looks like a whitespace change. This is a "No functional change
> intended" sort of patch. You can collect all such whitespace changes
> into one patch.

The main purpose of that hunk is to remove the `goto cleanup_mdio`. The
dev_err change is just because I was "in the area".

>>  		}
>>  		lp->pcs_phy = of_mdio_find_device(np);
>> -		np1 = of_find_node_by_name(NULL, "lpu");
>> +		np1 = of_find_node_by_name(NULL, "cpu");
> 
> Interesting. Maybe you should review your own patches.

Will do.

--Sean

