Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61A5C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yBIz96Sge8xLsyvKzIU/Mju4WGlgoGBjmOnxJXAorM=; b=GfEnq02KY0vXm0fJDfoGBjglD7
	4dTQOJacQq9er5CQXvPD3VbRcE5tvuCOLp/sYRTRSzAknb2zX6lKYRsTGzZQ8hLGmFZZAtK67YwE9
	Ij9mc2jNwAHRQl22nWP7TDp6jQvYhMtBBT5edS5ijWxc/V59OUop+8spn48xxUuFcwhoU1/ooNldR
	NHZTcr2ODCOYK5XIp1CpiYd/KndN0Omq2PIzmKLrm4VdeyRlGc4xbqhdhYV0MJQXA9oLhRqya6D2r
	uP265txnJuuXiemweCZJ8uZ6rEAIkO/Y6xlSignT3pOUS+wq9zXSba9O7NkEcDGa3NoL5SKjNn3FB
	s8T++M5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CgH-0000000Ayau-2D3F;
	Wed, 09 Sep 2026 07:25:17 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CgF-0000000AyaL-0vAJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:25:16 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 1C8731D000BF;
	Wed,  9 Sep 2026 03:25:13 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 09 Sep 2026 03:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788938712;
	 x=1789025112; bh=8yBIz96Sge8xLsyvKzIU/Mju4WGlgoGBjmOnxJXAorM=; b=
	Vtmn40urMu5Pd51CdbHxNvwZeBjhqYTEnXoZ2WA5W+U/TwEenxGyCvTsI7GrbdrC
	Gu87LvqSCva5PHTfUpITMsfrnmOYC2PFiA2gLcBtnSfFISpJ6S45Z0g7Py1QVjoE
	Rmo82vidUV9Jdfv5Ng+tHYoJFuGVMQoMPIPDjH2/Qi2pqfSztdDsKWvVpKHBFZWL
	Ckx1Q8wMAsLcgR4lOckRb2UpDdF6FO6SRm3rD1Dw/Xv5NMkyBcMYCGK8pVa0bbaX
	/7KnK8eqKhUNBJVaOefN9SxfqpIAkLGVnbyyb4i+iQ1QnwQIrgKU1nlcHxvhcHzk
	H7qAdAD7WuElB+cxIRUEsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788938712; x=
	1789025112; bh=8yBIz96Sge8xLsyvKzIU/Mju4WGlgoGBjmOnxJXAorM=; b=b
	xS9OajFrUTiBXxsF3Yok7vO+LzepUBM1heHTG5rXLAzWMfu4ZPkxkJLkXtMQmVX6
	YEdpjznDCxHHc8dR6OxFyQAYgruJFU42WS/xAlOeNr9YCJWkTKpfCAban5PXJcGJ
	WW+XictTyB577PW41Dmbsas2L9+w8uIMkf0GoIoMS42jfvt7AYuNbmrGx9yUSFci
	7rpced4j5BEVrlX8055lVBxMrzqNd2LGEwj3e4Edp5mILGAX0HThcMHRbobPlzCq
	KBYy98MGHq7cajMaRbkF43/yYCUgMUXuG1t7Jszr2B+n04uKPN5V3hTFfEqp3QYn
	cJnNG6s+dZ7ckCdEyU78Q==
X-ME-Sender: <xms:1Amhahmn2-PICZGo-IcbDDqsjyZ_-9T3uQL9Sv9QP1n4uU9HZul-jQ>
    <xme:1AmhanpvQfFcXK3Zp-q6uN8qPr3mKd6G1PhQxC_KLq8aMp0pqBtZltI4rn7AQT0EE
    jL4sTFSVE6R315Y_994p5i40I21ZBb9OxskmXGdkv5n4l1z2Q_84GNS>
X-ME-Proxy-Cause: dmFkZTGtkK4eRTPbNq9kxrVdvLkFgfnmkz7Xk/TDqbWVPMamecVVhZJMCvxjCz+mhHjn8w
    bEAIBRkask7XU8RAMAjchTBr50Ev0jxgBpxEfTFAdlgDJexCPwrtx90CKNyzOHLofrFSmM
    XJT4WKeF17DY6Wx70aHu9ZJhFnH7pY7bp4rS7TWk5L0kfyVq5Rb7gC0F7ew8qyYWWbUsrZ
    9FrSJKCS5ZO95z0xxgZAgnpa+csZCANG/EiBTsMCkTAkxxv34ZcLjMJ7rdvLWc1anve9Fm
    gB10i697Hx2LIbOmChDt3xF8l6LRi5jRoncs7UZ/fow+K2sPaPtJtOa4owaOvLshXqTlNG
    wmHW3ZX0K2BAIz+8jhojT4c8XUib9X0E6WVS6SP9vtOao0cxWtYB1Z+R0CsXH+j8Y7EIey
    3oqIaeDEbFxBYN44BYD0o1h2HnBNHpB59osObPRICG03RpCJYm+lFy/VkmZYJxQcBSSnvN
    ldgHRttO/T7BETW9+FLK5t0isMymedluuVHRAWUbg+TXDm0X1xnRYihAd6q4CxXuDq40zX
    GqeEGojBNaDDMHR9ebl/2wNc20cEW2xtw5W6ofmYglK1ni0ozImvSPgQ19BEmsGtzjgJvs
    9koy3B9Kh74ueD8S+JvjaDxTEO/bIE1VvvB/RNj45uuIy1ljgdN3aBf2qirg
X-ME-Proxy: <xmx:1QmhaiB99jAKTlaXvIBv5AKHXA_Qinhjju6T-q3nNOHAprPpbuix-Q>
    <xmx:1Qmhahe8anSG_aL2BCP7XUoIj6D51_40ofETC7ywImwQlHWr-f3guw>
    <xmx:1Qmhap3vIk_uK_wXhsFQ14eL9S-EZcwxSUazWn8Y2_JPR6NFf0ATcw>
    <xmx:1QmhagjKhDFFWHMRymAKP58jbqO0ZiD7SXDCQuPyCOAs1odD8TdbtA>
    <xmx:2AmhandJy17muZ2myo2uVyJYTvP9PdesPqnNpg1S2_S7qUGSe1e52isW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1C00E32A007E; Wed,  9 Sep 2026 03:25:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMXrPpDe2nhJ
Date: Wed, 09 Sep 2026 09:24:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: "Nicolas Pitre" <npitre@baylibre.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <ff220a24-edae-4b75-9873-1a58f5948a01@app.fastmail.com>
In-Reply-To: <20260909064443.90544-1-kmehltretter@gmail.com>
References: <20260909064443.90544-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: dma-mapping: split cache maintenance at highmem boundary
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_002515_763852_4B210035 
X-CRM114-Status: GOOD (  13.92  )
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

On Wed, Sep 9, 2026, at 08:44, Karl Mehltretter wrote:
> dma_cache_maint_page() processes highmem pages one at a time, but passes
> the complete remaining range to a cache operation when the current page
> is lowmem. If a physically contiguous range starts in lowmem and crosses
> into highmem, the operation continues beyond high_memory through virtual
> addresses which do not map the highmem pages.
>
> On a Raspberry Pi 400 running an ARM32 LPAE kernel, an 8 KiB scatterlist
> entry crossing this boundary caused a deterministic data abort at f0000000
> in v7_dma_clean_range().
>
> Limit the crossing lowmem iteration to the end of its page. Subsequent
> iterations advance page by page until the existing highmem path takes
> over. Keep the bulk operation for ranges contained in lowmem.
>
> Fixes: 43377453af83 ("[ARM] introduce dma_cache_maint_page()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Hi Karl,

I can see how the fix addresses the problem, but I don't yet see
how you can arrive in this situation. What type of memory allocation
can produce a physically contiguous page range from multiple
zones?

      Arnd

