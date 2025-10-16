Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B23CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqFJNhUJg1qnI/xkgkILNM+TjzTwU9ayVr2PWAsWxpM=; b=ad26HjQV28rjyEEny+t92qHXLG
	eZdH69I6ZiWOJp0Iud3vy+9vlvgRaYqwvFekyQPT6kzgNVScmUr+FHQTCJzcSt0xQap+VWk7Cn8xA
	1ducjuIoPuTfQ8t+I0grsM7qH0cPvZfFe4VSq88Pf04cTrouCVR3fa4UMtwBFaIrnAk1wYZ2eDpGQ
	bN1uIM5gDuVZwsND39a47dJ4zkZv8sKZdETt9UvgORbF32S/lWgNSWSEyOpcw0GurlItskuyfGBnw
	93R5zu58dA4a+PRygsOarokmURCBXptQsKdPHPXjF/tT7UubG7TqQ6qpTYp0s49yMdpDUhhTABgiG
	Dlh8dhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QP9-00000005Jv4-2NZt;
	Thu, 16 Oct 2025 16:00:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QP1-00000005JoI-3YbE;
	Thu, 16 Oct 2025 16:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E9C843A98;
	Thu, 16 Oct 2025 16:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF95C4CEF1;
	Thu, 16 Oct 2025 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630431;
	bh=nORpSP6NrI6Qmuqm66M/ilyzrD8flM0QSTQ4gbzBGi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6erMQRwckQ6A4zou04gI0aaPdOBZOubgDi7fAVY6xKulEcsY1GWnGPpOOaMHwnXX
	 GkX9JWq2f1Htn1vUgbbi18LINXvee8aLd41Y8Sk6x9VzCvIRXEwHS7nHlNatdxhSMD
	 8PhOhXvxuUlUOm4z1Md06yNnNcrfyqxbuOxzctZ7W9zwuBnaYKl8+8NCiw5nWDBoUJ
	 9R89LQBk9cOsZHe1nCBEFiELV/oBteEcH8bbV5N+UgQHpTd6bpXclhtkVS11Hubxa4
	 2OGv3/98XaU8adyPEQBuCToDHaxJSQO0OZnCNh9NnywXTahukgnoFuPiZ8Ad1qLsoV
	 FH3/olxFBwC/Q==
Date: Thu, 16 Oct 2025 17:00:26 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 12/13] net: airoha: ppe: Do not use magic
 numbers in airoha_ppe_foe_get_entry_locked()
Message-ID: <aPEWmlok8qlV8UCY@horms.kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-12-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-12-ea6e7e9acbdb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090031_908619_A78155D1 
X-CRM114-Status: UNSURE (   8.38  )
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

On Thu, Oct 16, 2025 at 12:28:26PM +0200, Lorenzo Bianconi wrote:
> Explicit the size of entries pointed by hwe pointer in
> airoha_ppe_foe_get_entry_locked routine
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


