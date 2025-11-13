Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB59CD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz39zWUgWe6lz3NHfDSC8mIp9EXHb7gxRBAo7zC/Js4=; b=o/nfiUXEQ07BotnxJXvOIW5Fxn
	rQJqfNJXzIfq3NhZ13LZaPYJ+jsvwzZyXm11OpuH2y5PpUbX/eG9Nd/VNNUC2Qfo1ZfkbuG45ysb9
	H0hX4wDWUwMmfxOYglYF18shNVxBOdB904DeVsdUd4YDZk6BU1M4/IpYEQg4XUhDGf0oMeybD03Bq
	0b06VfKrqq2qTn2dtBrDD3ZNmfAxNDapXdgZ//2yi/k9fgUYL16V13bH0NWN4lXWitQT/TGgLbR+8
	WX6P9x6WzkV/nAa3sOxpMAIMQnUuYTjg3j91cxaKDnPpz7RKGM7LlxcWmj3Urpv23Oa0oOndNBMeZ
	tyJfALMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTps-0000000ADfX-0MD8;
	Thu, 13 Nov 2025 09:41:48 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTpn-0000000ADex-44kh;
	Thu, 13 Nov 2025 09:41:45 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29764e94b;
	Thu, 13 Nov 2025 17:41:36 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: lorenzo@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	jianhao.xu@seu.edu.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH net] mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
Date: Thu, 13 Nov 2025 09:41:35 +0000
Message-Id: <20251113094135.348383-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aRWF9QJuwGaDlUvT@lore-desk>
References: <aRWF9QJuwGaDlUvT@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a7c97843b03a1kunmfac98f0512a188
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0sYVhhCT09CGEkeGEsYGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk1LSlVKS0tVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=nhOVfDiJ74Sdt0UEx5n9Ip6yX8XSqzU+2fWTnIGT8VBL20byL0rS6xZPJ3l/1QuZdmq9EZLxOIibIuTUmkj/5RbIq557HJaTkbxduMlb3wNgk9noAImuQPqNi1xGQr9pyZDkcpFZ/m7pURVRnmENiuq3g29ZsmS/JWKvmjZLiJ8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=Tz39zWUgWe6lz3NHfDSC8mIp9EXHb7gxRBAo7zC/Js4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_014144_629994_61998B17 
X-CRM114-Status: GOOD (  21.84  )
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

On Thu, Nov 13, 2025 at 08:17:09AM +0100, Lorenzo Bianconi wrote:
> [-- Attachment #1: Type: text/plain, Size: 1475 bytes --]
> 
> > In mt7615_mcu_wtbl_sta_add(), an skb sskb is allocated. If the
> > subsequent call to mt76_connac_mcu_alloc_wtbl_req() fails, the function
> > returns an error without freeing sskb, leading to a memory leak.
> > 
> > Fix this by calling dev_kfree_skb() on sskb in the error handling path
> > to ensure it is properly released.
> > 
> > Fixes: 99c457d902cf9 ("mt76: mt7615: move mt7615_mcu_set_bmc to mt7615_mcu_ops")
> > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > index 4064e193d4de..08ee2e861c4e 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > @@ -874,8 +874,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
> >  	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
> >  						  WTBL_RESET_AND_SET, NULL,
> >  						  &wskb);
> > -	if (IS_ERR(wtbl_hdr))
> > +	if (IS_ERR(wtbl_hdr)) {
> > +		dev_kfree_skb(sskb);
> 
> Hi Zilin,
> 
> I can't see how this is useful since if mt76_connac_mcu_alloc_wtbl_req returns
> an error, wskb will not be allocated.
> 
> Regards,
> Lorenzo

Hi Lorenzo,

Thanks for your review.

You are correct that 'wskb' is not allocated in this error path. 
However, my patch is intended to free 'sskb', which was allocated 
earlier in the function. Without this change, 'sskb' is leaked if
mt76_connac_mcu_alloc_wtbl_req() fails.

This approach is similar to the error handling logic later in the
function, where a failure in sending one skb results in the other one
being freed.

Hope this clarifies.

> >  		return PTR_ERR(wtbl_hdr);
> > +	}
> >  
> >  	if (enable) {
> >  		mt76_connac_mcu_wtbl_generic_tlv(&dev->mt76, wskb, vif, sta,
> > -- 
> > 2.34.1
> > 

Best Regards,
Zilin Guan

