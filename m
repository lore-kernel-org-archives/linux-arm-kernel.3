Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF69C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPI7DyiaMsXtZMBlYnw4xZXHcDCDrr1uLn4/9aG94Gk=; b=UxsW7IAb2ht0IMoPzF3D4Luq3v
	8I0gO4iMOAJq0LmUx8e80250xSrgDTqvqWrb8N78B6fZiJBbTV44KebwFhq3jWrhJ826RhhCGf79w
	Duc5gWuMxTtWyMvYqy4kR/tnSWV1zF7LyPe7ajPoHOr819AXsiVpMATi3gZWd0bONrOk93NuEK8gz
	QC6gPQG5uE2C+t2aRemhZtf9JepF7lVqN6XH29NzUgGl9kYszKeJxxhEsZo7DtbiJWIybfYgRW37h
	9FoN0+7v5+9xfx4ciWbBBgg4CaWsmASgAWKQx1+oII6HXjjMB1vCxFKIfulBwEqrAlHmCW1+iDLU3
	Fw5t6R/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTcj-000000031Gt-0IsC;
	Mon, 27 Jan 2025 18:14:13 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTbB-0000000311u-0ccy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 18:12:38 +0000
Message-ID: <6f1126a7-b35a-4dc0-9c6e-29cfb6e7a145@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738001549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPI7DyiaMsXtZMBlYnw4xZXHcDCDrr1uLn4/9aG94Gk=;
	b=CiqSOIP2zMnvHhojZE0wozYafwYRLsLp53Zk8ks9+q4BzbF384Ym7hwbVZh6aa1AUSljz6
	g8JWvw5jsSuZ4sbmaTmXHuYWHUSbs0LS85yjm+tHAkCDq68PB9bMv4LJI8Eeqr+R1xvc2L
	j4H0pgnP4vuw6DN2VnLzxxNmPLN6kzs=
Date: Tue, 28 Jan 2025 02:11:36 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net v4 2/3] net: stmmac: Limit FIFO size by hardware
 capability
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
 <20250127013820.2941044-3-hayashi.kunihiko@socionext.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250127013820.2941044-3-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_101237_460093_C0459D8F 
X-CRM114-Status: UNSURE (   9.87  )
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
> Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
> stmmac_platform layer.
> 
> However, these values are constrained by upper limits determined by the
> capabilities of each hardware feature. There is a risk that the upper
> bits will be truncated due to the calculation, so it's appropriate to
> limit them to the upper limit values and display a warning message.
> 
> This only works if the hardware capability has the upper limit values.
> 
> Fixes: e7877f52fd4a ("stmmac: Read tx-fifo-depth and rx-fifo-depth from the devicetree")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng

