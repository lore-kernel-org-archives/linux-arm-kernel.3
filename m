Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc3Ep+dLYrxWDAVE5hbsYpi+HYF3ujM52ZOzbBYhtzI=; b=gQzHdKIBVXYHjaUFIVfBzF3aWr
	vzGArfTl3S4cc50jqzlqsMOJOABYcGmsUPbVGHQ5U9IdITIxBIMfDXzq7ilNwaHgUyE5Nw9QicjVI
	Ku8SjPwIqQaQsCykUViMWtOejQp53ZwYRz8bZXL+8KSV3PojAXbw/Yzqakdy0RaB82drLQgDNEMWd
	xf7xcpt7eqfJZ7bYDVlPpb7C1rtTycoTCsWjn2FgBpgl5RAJ7VH+PMUlTxghPlC9GdpODW6MbnTVD
	D3wKDiqrjwzQPp0gJDDxOP4X5/H2t+HDhxI5FMqKuXZE8w5ZuUuRibdn5a1YiBUcraWlpp5oJpEc2
	LO+oWL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqUa-0000000A8Dd-0THe;
	Tue, 14 Jan 2025 23:38:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqRm-0000000A7dg-1dpE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05CDFA41B9B;
	Tue, 14 Jan 2025 23:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF7C4CEDD;
	Tue, 14 Jan 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736897744;
	bh=mAGMGtQrfQ3/Drlhgn5zGpK+PDYQqfFjj696cQz6oLc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LuMe8JFsedYcMeGaVXORNDg142CfYmNisZhtpqwVCaDZpjyHVd/hXlD/qXvosjt8I
	 A/POYMUWNOMF8A6PZ2mQ4RofXjmzJMKcVB79uodPNCzRZaVJA8fiyr2ll3BZ/4IG7s
	 KWAioX7Zj4HiHYTBKMOL5fz1c5swL5Vp1qad4HzDmQzlszZZ6rg9bBHqZDU0Nai7+S
	 KSwyb2dFL1xQv9w78LBlSTP+dxZlyvM7xUu7ERqFcwUXujEJJCq7kn2iw4ByCVOQNn
	 /CHuc6vQhTEleOA6ddE2V+QDmJN9DnL4YwlxMLHkoWVvOcl/PtRh4JTTjD5ICYGV33
	 1eIaBKz8ypkWQ==
Date: Tue, 14 Jan 2025 15:35:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, Andrew Lunn
 <andrew@lunn.ch>, schung@nuvoton.com, peppe.cavallaro@st.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <20250114153542.29d10a04@kernel.org>
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
	<20250113055434.3377508-4-a0987203069@gmail.com>
	<a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_153546_498929_77F0C44B 
X-CRM114-Status: UNSURE (   6.53  )
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

On Tue, 14 Jan 2025 02:49:31 +0100 Paul Menzel wrote:
> > +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");  
> 
> Maybe Nuvoton can set up a generic address?

FWIW we prefer people to mailing lists in netdev.
Humans tend to have more of a sense of responsibility 
than corporations :S

