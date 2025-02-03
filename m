Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF7C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TG035qf5hgwodwjUHDhhBSDdIdIQUf7YWtjtAtFWOU=; b=1aASCZgcy515tHrmjMVgEGA+se
	J+B1Ul7IQzDc/dA7BQgTkJdS5clGiW55lwtY/0mNQ9rCA9F25pDpSFPb0TzTL7TqI42uy+ClI2+6Z
	bKzFPIkLWQmQuaQ8E3DUZfP6r83+erKs71gWzi9o/RFPjgUcxxmip05IqUKvFn8HdP7Qb9KxKZTna
	yQ/uvTBLxvduqy79G4MmVBa9lX3/6Yh72I9LzlrJwkuQD/+JDume1c39sv9kJcHRcCRuIEmpFuDOF
	t2N9OfqYdQEDrMtJtvqm52kpOtG1SrtjkGuM7tjkfs6IsM1gEUlxRI4p/o/HniqHohC5voZe9jg5U
	7ATbUsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4bQ-0000000GlFp-0ZUt;
	Mon, 03 Feb 2025 22:07:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4a5-0000000Gl7k-3mB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 22:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E82685C5D5D;
	Mon,  3 Feb 2025 22:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF91C4CED2;
	Mon,  3 Feb 2025 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620372;
	bh=yzyPuuX2I9mlAd8wRAXfCiQT5z1CNGqnwskd/rkgtMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DPdXEuIw9QSyalNNyNjvv0XnpXXT0IqYas4P/nhGlrVRWsP4nTb8KYoNaYGYSxUsl
	 TeL7MI6sihNDnf2Az3fWZOkz28xm/43DHoKN/1xukR5ZkJ1QYiOGo9UodinK8o9Q4m
	 mHgWYffCmXMrWCzQyxGA4qBgvsA6XA+r+Zsny+GIfc8HqrgIVjTJn5eifr0L66cOmJ
	 dIG0GjgKiFTV7dwqSU+U93IwBfmT9VmtAfw9b6rfQCGPEw2WyzxXxKS5h4Shq5EKFp
	 1BMIih6q+UVPnT/QekmCcjKzgjVwixFXRmZ9WQurhZKSMuEWd4oJhUa8DVATYeVRBs
	 M0XTJmnfkqffg==
Date: Mon, 3 Feb 2025 14:06:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Message-ID: <20250203140610.4a0bbad4@kernel.org>
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_140613_982752_EBE21E7E 
X-CRM114-Status: UNSURE (   8.57  )
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

On Mon,  3 Feb 2025 13:41:57 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

The tree is open when we say that it's open, you posted this 9 hours
before the announcement:

https://lore.kernel.org/all/20250203065423.03f4cec4@kernel.org/

Sorry but keeping this in the queue would be unfair to people who
follow the rules.
-- 
pw-bot: defer

