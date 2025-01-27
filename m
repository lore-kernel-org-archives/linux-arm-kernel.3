Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E12DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skIdayWsGtfDhykxkY/c0m0d2sHBVaGb3+BX3PRUykM=; b=zp8Jaxp34Gk12lBMZ51jOrx13W
	R7jTIcM8rDHjIry4MF58aE3Bt02HcMnxTeEbZ7oh+B6wtMHyrLxLulpnERKMJ/YNLiiBEuV39ReUj
	elueMADZz88ND/9s6X+mIWy82xOM3G7JkF6/leKQCpronFIGu7eXBmdxlyvLnZTIAJKWmbpNfdgJB
	OoNXnuo5JNu+oaWLVRH9OszKRDqZNNmXlHpXck7zQNwrAeDOhFHg8vxr0AzKlseuYxTikyh2FwbsP
	JzQmbBPaMi/OGMfOZlQ3nBEogk1RK2tjpaes3YS+f6T0q/bTvU5eAdFEBFnlgqvh0JiF0rwuNsRyX
	AqsxJRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTYe-000000030JB-2eWq;
	Mon, 27 Jan 2025 18:10:00 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTXJ-0000000308f-0q5e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 18:08:38 +0000
Message-ID: <4bff9efc-eab6-42a1-a2a6-5d4b3c4dccee@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738001313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skIdayWsGtfDhykxkY/c0m0d2sHBVaGb3+BX3PRUykM=;
	b=tYRysFLPxndKuoa69oKSeNlP7zHJCGIKrn/8f94kYnNXpRG/1RqyBha2Se3VYTk4yOG6hC
	ae+n2I/IiCqODvCIcfexrFrDWqrEX/SvgpRQQJtleE3e9HzFyUQioF/kBuVqQzd6xCC5Ni
	BcPG7OIG8G7Srj8MVU52/dufyPOh+Os=
Date: Tue, 28 Jan 2025 02:07:39 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net v4 1/3] net: stmmac: Limit the number of MTL queues to
 hardware capability
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-2-hayashi.kunihiko@socionext.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250127013820.2941044-2-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_100837_382331_E9C45E7F 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

在 1/27/25 09:38, Kunihiko Hayashi 写道:
> The number of MTL queues to use is specified by the parameter
> "snps,{tx,rx}-queues-to-use" from stmmac_platform layer.
> 
> However, the maximum numbers of queues are constrained by upper limits
> determined by the capability of each hardware feature. It's appropriate
> to limit the values not to exceed the upper limit values and display
> a warning message.
> 
> This only works if the hardware capability has the upper limit values.
> 
> Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,
Yanteng



