Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7272DC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glcWwuAzt8vXaIVcCfbsDd8hWx5GOfxvsNItjmFdoCs=; b=spbun9oz/RJWuNrtTBBXnD9+la
	MQAVgQp9UVPc9nipek4tAyHnpJ1hNVmkXUwqiGirCiJe0zY40fujwEDqAqVUcdu96xs+3N7qIAs5m
	nuJt3xz+qq4vbBicASZVbSbeQcFRTy0kxHJSy8f0bvPjQhPAm0rCFk4Y8JHI62Ao5ylNTA16fig4u
	MA619wEylWWEZy+ENJSsJPDlIgxlzej6y05tQvRLQ1niJiER8bks3DxoIaUO21xaOIIzu88TPbsiU
	vlFctY+2vxcHfZf8gXcUc9GCTj2+1taj+Oun5AakkgXhBBc1kCrv4QoqqVZSZ79uIEUTsmTJVUjQb
	Twv99slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woELg-00000001zZG-3QwC;
	Mon, 27 Jul 2026 05:58:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woELe-00000001zYo-1SSA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 05:57:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so16795475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 22:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785131876; x=1785736676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glcWwuAzt8vXaIVcCfbsDd8hWx5GOfxvsNItjmFdoCs=;
        b=RGmAW0W9ClO1efXbE3zzfLEVSjB0bJQMq9uisFAEWS8sU0JAjTSWMR73a2htGmVan+
         yc9jr8B3S6qxJuOTsEdhARfRaY8vDm9GxMzaylzN26lOsOAMI6LRFHVPI4+tQwUKBwn4
         EGj7SphvsJfHXdRmwsQWnBIbNGLyFt+5X2RUFzee3rQF7SKJtiYkp8WjPyAoUKVkCXYK
         svQ0TKgNKmsvKzF4gJgTqawXduptGUR2CjnMVZBl5/XFAkgioyNlEVBVl1lrUZb+sfuS
         LtpIbAOWGFBcD0Ue9cseDNfvlzB+k6PEQcX4zfv/Q4PFOeOMiv4HsJz82llsv6FjEWEG
         E4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131876; x=1785736676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glcWwuAzt8vXaIVcCfbsDd8hWx5GOfxvsNItjmFdoCs=;
        b=I7T5V3GdDV0iFqBtPPEXrl3/bKzHrd94YpD02g9EKBzTUrvzOLjA0bFGItKWKV2vHM
         jVfvgxkqnP/1LijVn9JT7ih87eZC7h9NzCYd77pc6U1qdaNrelo+mgLmLeumcoBCuh5y
         gWpkZFic805st+MY1reokGdJaaTRUtmtxV36WE06PR+PdkMNyOVBTkBcIFmbJb5ijhBK
         YyWQeBvIalXf93P7OinWcgfNi97aNE/asnEvz6mOTijKkWZWStyB8YxaefFjPRs+Obp2
         /2TErIZZfOjKHH7XZoAFyOdd0oB7Vm9w+eh+rpHG0o3khf3INSmfXLEpOVXG77GPQEzR
         SKIg==
X-Forwarded-Encrypted: i=1; AHgh+RpatgpECY6XePlksDAQLQy3x8TmCTIe9UvjAHLocQJ5FAzXTUY/xRqErvuuqgLcq5AavAIQ55ZIq2hdEGli6vtl@lists.infradead.org
X-Gm-Message-State: AOJu0YxkFnb7mUt2vYZEOiuUwTh5SxgtqKoFsgKWGJ/VS/+wHvdaqIXC
	CKfScSHX3Sm4uqdON0kwVYFXFKLoMQHr5zpoQ0gAzdq4c+O2HtTAqWyx
X-Gm-Gg: AR+sD13bsOVw77Tl850zZNnkCe78L8eBAMwsIfNN9sU+V+KuF8IPGIRU4zEor5RU+iz
	z3dknIqtryBRmqDKPdx9UhA134iEQoo10vFJK57LakdbOYYRSvCa27ALmrvgYVuf0oSpIoEtrEL
	IjnHocXif6ARnFGmk9Apak3mABe9/gsspzXObsKSzJEayt0wEkfzT3d9iJqG954UEgNYgTSZTBI
	hbGgxxWy9aICx250iuMA16b0lYYHgFglCh5Q6DjiuIyVy6GEmYNdXACMhcGd4Ouab5AHShrcTlu
	0aPrTq7leniifAc90YaWYjdzWaK/QoQnTM45bQVFTu6OnFD226WwMOgOqUQpAb+y9v3rHi/ILwK
	1anqTnSBfVp2GoTeD2d3qk51iSZNVEJTKwV/ibw7mkBVimfboEqg5c32mdNiMYes2QV3BlvrVSW
	Jfc+pk/P8Fkl9iqWQNC0G2qZCLG5aK0niUcYf6lBmPvSEj9z17mk0erQ==
X-Received: by 2002:a05:600c:a0d:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-496b571dd8fmr84504225e9.26.1785131875644;
        Sun, 26 Jul 2026 22:57:55 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957e334f63sm172689365e9.1.2026.07.26.22.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:57:55 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: andrew@lunn.ch
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dev.taqnialabs@gmail.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH] net: stmmac: enable MAC rx/tx after DMA start
Date: Mon, 27 Jul 2026 05:57:15 +0000
Message-ID: <20260727055715.4430-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ee639271-60dd-49f7-9e77-0ae47841754d@lunn.ch>
References: <ee639271-60dd-49f7-9e77-0ae47841754d@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_225758_418000_A70AD2C2 
X-CRM114-Status: GOOD (  12.27  )
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

On Sun, Jul 26, 2026 at 18:15:20 +0000, Andrew Lunn wrote:
> There should be a function which is the opposite of stmmac_hw_setup(),
> which tears it down. What order are things done there? tear down is
> generally done in the opposite order to setup, so does the "Disable
> the MAC Rx/Tx" also need to move?

I have not seen the FIFO stall in the teardown in my testing,
but the MAC Rx/Tx should be disabled before the DMA engine is stopped.
For the normal path (__stmmac_release), phylink_stop() is called first
which triggers stmmac_mac_link_down() -> stmmac_mac_set(false), so the
MAC is already disabled before stmmac_stop_all_dma(). The teardown
order is already correct there.

> Same comment for the opposite of stmmac_xdp_open().

Currently, stmmac_xdp_release() does:

    stmmac_stop_all_dma(priv);
    ...
    stmmac_mac_set(priv, priv->ioaddr, false);

The ordering is not followed here,  I'll make it follow the similar
ordering to (__stmmac_release) in v2.

Thanks,
Abid


