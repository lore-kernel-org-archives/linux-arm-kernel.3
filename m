Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF51FEA7185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg6/qo4RSzChhEAaqABVwolWhwsWHR+Hrc2Y5KLNt5U=; b=vLnYUsiFaHToAgEIREehYAjhXe
	z+vZP5bLQ1i0MbAlzS4wRCxKtUzWJV+cfMeYUz7ByjxWwbDPtk0yYeeLu6CYnx8/PCLi1RSybcEfT
	51yEH2KqfrVIvcg6t6QocJvvnt4J/njVUyHdYXAt1XDaczbyTKCA6nYWj8lYvZzdkgDKzHZ+k9osH
	Eeb8zrJ00RhIl0saXJf19R5PPu2Phjg0J8e5yBuGSpugfwru/jZaMDX4rXxu6oT1z/Q+SJk+ExAtS
	IycdmVQs5ZE5QIVBHGRTmbjyMNrjTzVD/SchSak+q0tVVqf6/LoBcwJ9dI5HveI+kmNWR5ayFn9/9
	j8NSmx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEfGA-00000006Mc5-3jtO;
	Mon, 20 Apr 2026 03:25:18 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEfG6-00000006MbS-2otn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 03:25:17 +0000
Received: from ubuntu.. (unknown [202.112.113.208])
	by APP-05 (Coremail) with SMTP id zQCowADndwt9nOVpj2cbDg--.31217S2;
	Mon, 20 Apr 2026 11:24:54 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: vz@mleia.com
Cc: alexandre.belloni@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	make24@iscas.ac.cn,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	piotr.wojtaszczyk@timesys.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: lpc_eth: Fix a possible memory leak in lpc_mii_probe()
Date: Mon, 20 Apr 2026 11:24:45 +0800
Message-ID: <20260420032445.2209758-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <60dea9e5-9890-49ab-b806-713c388d6e08@mleia.com>
References: <60dea9e5-9890-49ab-b806-713c388d6e08@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADndwt9nOVpj2cbDg--.31217S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF15Cr43Xr48Ar17urWDCFg_yoW7Zr47p3
	yUGa4SkFykGr17Gw4vv3WUAryYvw42yw1rWFyjya45Wrn0qryfAry8trWY9r95CFZ7J3W0
	vryakFZ3ZaykXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [202.112.113.208]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_202515_168093_F33C0740 
X-CRM114-Status: GOOD (  32.04  )
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

>Hello Ma Ke.
>
>On 4/1/26 16:18, Ma Ke wrote:
>> On 3/30/26 13:04, Vladimir Zapolskiy wrote:
>>> On 3/30/26 11:16, Ma Ke wrote:
>>>> lpc_mii_probe() calls of_phy_find_device() to obtain a phy_device
>>>> pointer. of_phy_find_device() increments the refcount of the device.
>>>> The current implementation does not decrement the refcount after using
>>>> the pointer, which leads to a memory leak.
>>>
>>> this is correct, there is an actual detected bug.
>>>
>>>>
>>>> Add phy_device_free() to balance the refcount.
>>>
>>> But this does not sound right, you shoud use of_node_put(pldat->phy_node).
>>>
>>>>
>>>> Found by code review.
>>>>
>>>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
>>>> ---
>>>>    drivers/net/ethernet/nxp/lpc_eth.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
>>>> index 8b9a3e3bba30..8ce7c9bb6dd6 100644
>>>> --- a/drivers/net/ethernet/nxp/lpc_eth.c
>>>> +++ b/drivers/net/ethernet/nxp/lpc_eth.c
>>>> @@ -751,7 +751,7 @@ static void lpc_handle_link_change(struct net_device *ndev)
>>>>    static int lpc_mii_probe(struct net_device *ndev)
>>>>    {
>>>>    	struct netdata_local *pldat = netdev_priv(ndev);
>>>> -	struct phy_device *phydev;
>>>> +	struct phy_device *phydev, *phydev_tmp;
>>>>    
>>>>    	/* Attach to the PHY */
>>>>    	if (lpc_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_MII)
>>>> @@ -760,17 +760,18 @@ static int lpc_mii_probe(struct net_device *ndev)
>>>>    		netdev_info(ndev, "using RMII interface\n");
>>>>    
>>>>    	if (pldat->phy_node)
>>>> -		phydev =  of_phy_find_device(pldat->phy_node);
>>>> +		phydev_tmp =  of_phy_find_device(pldat->phy_node);
>>>>    	else
>>>> -		phydev = phy_find_first(pldat->mii_bus);
>>>> -	if (!phydev) {
>>>> +		phydev_tmp = phy_find_first(pldat->mii_bus);
>>>> +	if (!phydev_tmp) {
>>>
>>> I didn't get it, why the new phydev_tmp is needed above, please
>>> restore the original code above.
>>>
>>>>    		netdev_err(ndev, "no PHY found\n");
>>>>    		return -ENODEV;
>>>>    	}
>>>>    
>>>> -	phydev = phy_connect(ndev, phydev_name(phydev),
>>>> +	phydev = phy_connect(ndev, phydev_name(phydev_tmp),
>>>>    			     &lpc_handle_link_change,
>>>>    			     lpc_phy_interface_mode(&pldat->pdev->dev));
>>>> +	phy_device_free(phydev_tmp);
>>>
>>> This is plainly wrong and has to be dropped or changed to
>>>
>>> 	if (pldat->phy_node)
>>> 		of_node_put(pldat->phy_node);
>>>
>>>>    	if (IS_ERR(phydev)) {
>>>>    		netdev_err(ndev, "Could not attach to PHY\n");
>>>>    		return PTR_ERR(phydev);
>>>
>>> Is it AI generated fix or what?.. The change looks bad, it introduces
>>> more severe issues than it fixes.
>>>
>>> If you think you cannot create a proper change, let me know.
>>>
>> Thank you very much for your detailed review and guidance.
>> 
>> Now I think your point probably is: you are saying that the real leak
>> is not from of_phy_find_device(), but from the device node
>
>I was pretty indelicate in my comment, let's split the change into parts.
>
>1) I still do not understand, why phydev_tmp is introduced, please explain
>or remove this part of the change;
>
>2) phydev = of_phy_find_device() requires phy_device_free(phydev), but
>I do not see why phy_find_first() requires it, while it was added in your
>change.
>
>Let's start from resolving these two points.
>
>> pldat->phy_node which was obtained earlier (probably by
>> of_parse_phandle()) and never freed by of_node_put(). And you suggest
>> to add of_node_put(pldat->phy_node) instead of my wrong
>> phy_device_free().
>> 
>> However, I am still a little confused. In lpc_mii_probe(),
>> of_phy_find_device() is called. From my understanding, this function
>> increases the reference count of the device. To balance it, I thought
>> phy_device_free() (which calls put_device()) should be used.
>> 
>> Could you please kindly advise the correct patch? I will follow your
>> guidance and submit a proper fix.
>> 
>> I apologize again for my previous wrong patch. Thank you very much for
>> your help.
>
> -- 
> Best wishes,
> Vladimir
Hello Vladimir,

Thank you for the detailed explanation and for pointing out my mistakes.

> 1) I still do not understand, why phydev_tmp is introduced, please explain
> or remove this part of the change;

I added phydev_tmp because I thought I needed to keep the original 
phy_device pointer for releasing after phy_connect(). But as you 
implied, it's perhaps unnecessary and only makes the code less 
readable. I will drop this change completely in the next version.

> 2) phydev = of_phy_find_device() requires phy_device_free(phydev), but
> I do not see why phy_find_first() requires it, while it was added in your
> change.

You are absolutely right. I mistakenly assumed that both functions 
return a reference-counted pointer. phy_find_first() does not 
increment the refcount, so calling phy_device_free() on it is wrong 
and dangerous. My patch introduced a new bug there.

Now I understand that only the of_phy_find_device() branch needs a 
corresponding put_device(). I will prepare a corrected patch that only
releases the reference in that specific path (including on the error 
path after phy_connect() failure). I will also look at the phy_node 
reference leak you hinted at.

Thank you again for your guidance. I will send a v2 after fixing it 
properly.

Best regards,
Ma Ke


