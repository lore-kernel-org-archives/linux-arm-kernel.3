Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6EFC56207
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyD3MC/LYtqqEnSjFEabCt1+8sKgizIUqavkWxkyS9A=; b=ABmHDPZOhUej32DCcniBxugK/3
	JaidZ219RnpSXPL+XbglGf3Cqlt40b/2/89Ji+BgvokpGV+f1G7QsJxGHsB7NdI2yTc+LDxTljINo
	mSAhCYBofqtJjODqXw+5p5PbEbWO+RqHPw817cMJT9c9/NY3Wnu/C+fz6bjUKEBSEDz6QuTgfF8+V
	JKyxX+FDWtNeIzB+LNr+3Xp6otSE1ennE+/T/+LlA/PS2RHWAPNV4CAAJdeqXlKzpqPWZXrVgjCqU
	UtNyqU/1DFfxRn4WkyPpGIy5Tqrj/PuCMKoRbeJAUxOngBiLu0bsS8X0CgFVu9zW3yKIwcT7IF/MX
	qUzfJ5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzxO-000000064d6-1wz2;
	Thu, 06 Aug 2026 15:24:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzwu-000000064b3-0otp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:24:29 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1013311a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786029839; x=1786634639; darn=lists.infradead.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyD3MC/LYtqqEnSjFEabCt1+8sKgizIUqavkWxkyS9A=;
        b=DGne33Bc6m15jL3lDXcbCgRJEdUgQ2Ac1VUONxEs/CvG64TthKXgvSHXNwdkqp2FxN
         A47hsiIY0LlAhwLQegONPi889t6rn1Urzi6Zpo5zjN2+I5AwuZ0EZBhERKueBnfSiYhn
         tkKYKDYPjnxSGqtQ37amLn6JmQbQdGo9el4gyUjB40FLbixLY3A50fYYmFhYpEnkodlh
         Bn624+3dTfMFi/vrKHvYt+o+gBhhIU0s8hJ4wCe2xKhZwzSAqz5o7P9MoKmQgcku2vg6
         mksJtj5lrhYS6ELnHeRAFzDAnGCA2RMfxVKWzna70FSs+tlmTDTbgBPdwq7iflRduEH2
         Q0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786029839; x=1786634639;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JyD3MC/LYtqqEnSjFEabCt1+8sKgizIUqavkWxkyS9A=;
        b=RRg9O3pEvdrUiMYiN9zCMvzL8/JteyzgpJPZZsxuhlAUY/3+7VYSnBX6m1nUBy3rWl
         kg3Sudv62D2XntJK5ONjfS8OC650cjkG+FPvI+qWBDGDNVTO0sSEaGB/KWYDWrW5OEGD
         mxzHAi4TTkHQJZUHWNTuKZ1bCeOGiAs60mmmZEfiNZWfJoi6omwg5g7JpMcxcq69XSRg
         emu6keLUhz5nRFDtadIOe63u31wP4UHH4fMf+sSUxpk7A6sYx9r8b0KgdaYWwl1AtaZW
         CXmj9bxuAxc9t6KQARPC+cL5AZfY8OSO+uATjWSqdOaOtLaXqHyM9i+eVSf2ztfAx+2s
         4DeA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1va1RlgQN9d847Ef/zhkQ5y0AtjfO1OCeMjwseAV4GrDYgHrekPgBMjQATQVuT0q3FbowVpAIKzJ+H7T/zDfy@lists.infradead.org
X-Gm-Message-State: AOJu0Yza4jCuEnV39PMK/aMzR9aNux7ZzHmFbrOSzhhLKCtGkYwpOV1W
	9GirUlG70jfLgNUWm2rzItwbrNsPCgDpVSJVVLZxWI/VbA9oFxytM9Py
X-Gm-Gg: AR+sD13gVBzsN3XSncXbQUwJGxnQWpgFu8Pcadf6CPyfbXvLlzjNWTkbnxF6OlyxYn1
	LNcPclLznnq7Mt6r+1oMd3NSkY+f+OoKWMOqTlej/X+BI3PB+CkldrlJ1EOnyMIO8+hbsIR7QNp
	5TW4BCfbO/EJGpzDBD0ifpOQv+oPEjhlx7DX/TdXYO92rt3GY5NhCr9XS+vML7umdJkXdk7VpTW
	jeOdC/qx8I6uzP/3/YWi4MW8lwvSnrR1cqVcNLmkNmSO2S8Jvfjy+AljOrbA8mmg2E/Pgf8h54D
	1LqiSMXt1SOuZzCCZuH/LRfvE4eMk/rpPBq10P7drqZAZc+S8QOnuQNjFxQKqXAfItX7KeH+4Yx
	HcdvyehcAodV6Tf9D3y6R27qVt5KJcWOsaXTQKk+Jkcuhrmva2+5LrR5lsNlH2Pnyb+Euo+6B89
	ait0CVOWCBSUS1TWXtzzapH/57tuVEzz56jnCWLiSE2QSwnmlaRWGg0YeTbV2tvbsLlZD99zHpY
	jdHkCGP+73T6+YoKF3IGvpRtdWXuw==
X-Received: by 2002:a17:90b:4ccc:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-3908982a10emr2522273a91.19.1786029838637;
        Thu, 06 Aug 2026 08:23:58 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f5c9a5sm1696416a91.15.2026.08.06.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:23:58 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: hujy652@gmail.com,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH net v3 1/2] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
Date: Thu,  6 Aug 2026 23:23:50 +0800
Message-ID: <20260806152350.555-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724172040.1653-1-hujy652@gmail.com>
References: <20260724172040.1653-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-References: <20260724172040.1653-1-hujy652@gmail.com>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_082400_258395_412F5756 
X-CRM114-Status: GOOD (  24.16  )
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

On Sat, Jul 25, 2026 at 01:20:39AM +0800, Zhi-Jun You wrote:
> Currently WED v3 tx wdma ring, ring reset happens in a separate code
> block unconditionally.
> 
> Moreover, v3 has double the size of wdma_desc and has different init
> values. mtk_wed_ring_reset doens't deal with that and would corrupt the
> wdma_desc.
> 
> Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
> WED v3.

Commenting on Sashiko's report:
https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com

> 
> Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> ---
> Changes in v3:
> - new patch addressing WED v3 ring reset issue raised by Sashiko
> - Link to the review: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 10d9beaae372..7d2775a97fa0 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
>  
> -	if (reset)
> +	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
>  		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
>  
>  	if (!idx)  {

-This is a pre-existing issue, but while reviewing the WDMA ring reset logic,
 I noticed what looks like reversed logic in mtk_wdma_rx_reset():
 drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wdma_rx_reset() {
 	...
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
 		if (dev->rx_wdma[i].desc)
 			continue;
 		wdma_w32(dev,
 			 MTK_WDMA_RING_RX(i) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	}
 	...
 }
 Does the if (dev->rx_wdma[i].desc) continue; check skip the CPU_IDX reset for
 active rings?
 When a WDMA RX reset occurs (e.g., during recovery from a hang), the hardware
 index is reset to 0, but the CPU_IDX register won't be reset for active rings
 since they have a non-NULL desc.
 Could this desynchronize the driver and hardware, leading to a permanent stall
 of the WDMA RX rings and network traffic failure?
 - ACK I will add a patch addressing this.

 Best regards,
 Zhi-Jun
> -- 
> 2.47.3
> 


