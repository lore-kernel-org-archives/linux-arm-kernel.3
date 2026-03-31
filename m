Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0FE1061B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 00:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH+GqxLn/B/4/1q38gHOdZixE7Y6VR++anT+HWisbY4=; b=xiC7QG2jYI+cIuL640QrrFWxC7
	0vdS57uOwWM24btdnF7bzISPVl+55rxpZiWTeTc3So1uyMF+261OEIHvnS1sEcwCwqkjiefD7qbj6
	M1U17yzsgG9ac5EScske82ED51gyjZA7/dFul1fD6EnmzXrOJorLPOEQJjvtqBx0wHeCB0yyK/oEJ
	xcRsojOdNwwElR/+YmxsqV8gsbfTyqHkW/nkShzcAhkO8ecdd/VeFWa1RKqrH7psbxKr9BQpLO022
	PpsbFXu8Dy++n9EVdnXJsXyC+a6ZquHS6ZeprNSXc2sTSPKO6rgo/1S1I6nEMGAs13Gpq2QCcqYgJ
	D8R3+WVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ND3-0000000C5la-49gg;
	Tue, 31 Mar 2026 00:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ND2-0000000C5lQ-3C7I
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 00:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iH+GqxLn/B/4/1q38gHOdZixE7Y6VR++anT+HWisbY4=; b=AA8CBjJGs8s34TIo9RgRw8ntzG
	qu7FvgDH0JcDs+26GDXfN/gUaibMQctlqEjJ7LQuSbxqzRQAO8pQUV4LnX64MW5310MgFcyBdBDW2
	Sx7pltuUlu2Xb9PokWbqSB28z2l8asiSafGXliFZQTLByQ3v8vMdOdyb/Hl0XaF1avJ34h6mwPUDV
	O2sl+QCt2dhzXJg4am+BTaCI08RtWabxSaQMEQy8tpedewvxWkYjDXPuH8nGCvC38NOXKSdHbLBls
	dcqW3i2HVqZGDIeQu4GqgyaZpN0uXqEWscrLA4iZKhRcsBIFxQgQSbHIRxnX34CpBdShMyFAHEaMk
	L6dflT+A==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7NCx-0000000EwI6-3Nga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 00:43:55 +0000
Received: from ubuntu.. (unknown [202.112.113.208])
	by APP-05 (Coremail) with SMTP id zQCowAC3TBCtGMtpnhv_Cw--.47429S2;
	Tue, 31 Mar 2026 08:43:36 +0800 (CST)
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
Date: Tue, 31 Mar 2026 08:43:25 +0800
Message-ID: <20260331004325.3304949-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b44db9e6-f820-439d-a7ed-c1e2514579a8@mleia.com>
References: <b44db9e6-f820-439d-a7ed-c1e2514579a8@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3TBCtGMtpnhv_Cw--.47429S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4ktw18AFWfWw1kWF4DJwb_yoW5Kw4Dp3
	y5GaySkFykGry7K395Za1UAryavw42yw1rGFy2yan0g3Z8XryrAryUKrWj93s8AFWkWF40
	vr1ayF93Xa1kXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8C
	rVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxV
	WUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS
	5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-Originating-IP: [202.112.113.208]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_014352_662885_22C04814 
X-CRM114-Status: GOOD (  33.06  )
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

On 3/30/26 13:04, Vladimir Zapolskiy wrote:
> On 3/30/26 11:16, Ma Ke wrote:
> > lpc_mii_probe() calls of_phy_find_device() to obtain a phy_device
> > pointer. of_phy_find_device() increments the refcount of the device.
> > The current implementation does not decrement the refcount after using
> > the pointer, which leads to a memory leak.
> 
> this is correct, there is an actual detected bug.
> 
> > 
> > Add phy_device_free() to balance the refcount.
> 
> But this does not sound right, you shoud use of_node_put(pldat->phy_node).
> 
> > 
> > Found by code review.
> > 
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > Cc: stable@vger.kernel.org
> > Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
> > ---
> >   drivers/net/ethernet/nxp/lpc_eth.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
> > index 8b9a3e3bba30..8ce7c9bb6dd6 100644
> > --- a/drivers/net/ethernet/nxp/lpc_eth.c
> > +++ b/drivers/net/ethernet/nxp/lpc_eth.c
> > @@ -751,7 +751,7 @@ static void lpc_handle_link_change(struct net_device *ndev)
> >   static int lpc_mii_probe(struct net_device *ndev)
> >   {
> >   	struct netdata_local *pldat = netdev_priv(ndev);
> > -	struct phy_device *phydev;
> > +	struct phy_device *phydev, *phydev_tmp;
> >   
> >   	/* Attach to the PHY */
> >   	if (lpc_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_MII)
> > @@ -760,17 +760,18 @@ static int lpc_mii_probe(struct net_device *ndev)
> >   		netdev_info(ndev, "using RMII interface\n");
> >   
> >   	if (pldat->phy_node)
> > -		phydev =  of_phy_find_device(pldat->phy_node);
> > +		phydev_tmp =  of_phy_find_device(pldat->phy_node);
> >   	else
> > -		phydev = phy_find_first(pldat->mii_bus);
> > -	if (!phydev) {
> > +		phydev_tmp = phy_find_first(pldat->mii_bus);
> > +	if (!phydev_tmp) {
> 
> I didn't get it, why the new phydev_tmp is needed above, please
> restore the original code above.
> 
> >   		netdev_err(ndev, "no PHY found\n");
> >   		return -ENODEV;
> >   	}
> >   
> > -	phydev = phy_connect(ndev, phydev_name(phydev),
> > +	phydev = phy_connect(ndev, phydev_name(phydev_tmp),
> >   			     &lpc_handle_link_change,
> >   			     lpc_phy_interface_mode(&pldat->pdev->dev));
> > +	phy_device_free(phydev_tmp);
> 
> This is plainly wrong and has to be dropped or changed to
> 
> 	if (pldat->phy_node)
> 		of_node_put(pldat->phy_node);
> 
> >   	if (IS_ERR(phydev)) {
> >   		netdev_err(ndev, "Could not attach to PHY\n");
> >   		return PTR_ERR(phydev);
> 
> Is it AI generated fix or what?.. The change looks bad, it introduces
> more severe issues than it fixes.
> 
> If you think you cannot create a proper change, let me know.
> 
> -- 
> Best wishes,
> Vladimir
Thank you very much for your detailed review and guidance.

Now I think your point probably is: you are saying that the real leak is not from of_phy_find_device(), but from the device node pldat->phy_node which was obtained earlier (probably by of_parse_phandle()) and never freed by of_node_put(). And you suggest to add of_node_put(pldat->phy_node) instead of my wrong phy_device_free().

However, I am still a little confused. In lpc_mii_probe(), of_phy_find_device() is called. From my understanding, this function increases the reference count of the device. To balance it, I thought phy_device_free() (which calls put_device()) should be used.

Could you please kindly advise the correct patch? I will follow your guidance and submit a proper fix.

I apologize again for my previous wrong patch. Thank you very much for your help.

Best regards,
Ma Ke





