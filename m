Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F78BE95363
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbZ3/1BB0R3fIOnjdn9+/O/4gxYQSf4wBm/5qZB9Ab4=; b=2qOOTQ/sJ1qL5Ytyn78XNxktoN
	ejo2zSWzR1LsLqaNR5rQ/yVK8Jg39wCPsbfp+bzZGWZlQNkLPDQUpwSaBfAGWONiwSgivOMuZ54le
	djO9vppHOufedZmwRwDeMWfO0cVY37sUyame8h0C5ITDRtOa+FxRjF3YmtHRjHq8Nr8qrbRlpQThr
	GZOuYjKvvR1lHwojdhYX87G6FlAJxWp8qAPHbNpnElS9pDnRcAnpwau9+eyxbK+pytdYzKy8weynk
	v9a9pHkaOzKuHLVBfbBicECOVJTKnKtHKa9vHvjSOOqygmLA0y15981VSPYGyNfZ3K8z8wh7IWYlp
	DQHqaAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZNO-00000008EKb-1Fwn;
	Wed, 04 Feb 2026 09:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZNN-00000008EKI-1fXk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 09:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CbZ3/1BB0R3fIOnjdn9+/O/4gxYQSf4wBm/5qZB9Ab4=; b=a1TMSJEoJCtn7zPQJgxzlWNN+i
	IPqPzyo3xJjslQ1Ybhdi6Q7esQbGJMy4uXe5hhpL2NoA9Wx3vJMJX6RnWzVxjVgW7zL2bAIjnCJKl
	cgyDqDGcE4K+AKxH3vk9TNEgf3QT36rIPAruSPQKIKf/ziLIRQtuy8W7y1KdtL4dgps3jhC7e4/+A
	9itgeDavaDzZHLKUyYoEDOL4UB1vRxLCeJzY2BnXG7AFRsHqHVt2MRmU3c4ISNFocjC45Op2j891l
	9zCWKyVwaobCicnSKIwBBqkBW91RcUQt7sOOZjbJO4MsjJuI7UfGtSG8KXNdLy0VXWJqcsUxIW9AE
	3dpXyTEw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZNK-00000000EaS-1mXB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:40:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A7B5C4E423D9;
	Wed,  4 Feb 2026 09:40:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B2EF60745;
	Wed,  4 Feb 2026 09:40:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CB8A119A8891;
	Wed,  4 Feb 2026 10:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770198040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CbZ3/1BB0R3fIOnjdn9+/O/4gxYQSf4wBm/5qZB9Ab4=;
	b=YcEfykjXjfUnEj/V+GCSXXATK+5n6pkoQakgNrClBQ4O24EbmZrdGgjSobKehGYAPt3cyN
	qbm6DNCohk8Z9HgIC7XIt+TWiu1Fsg8V6Rttwpki9Z2F/dD4xG1vaY0n3BH/T5sFCcTATy
	DkbVWks0R8EAvlJgmlCEslxeYQeOV8EHB6lwR1p3hrhTOb9GsJ21btWLIiU7XXGGdAdhKY
	6oJKhtSCIXEWth1iZKyVvv3xjBYRTikTNkRHZaF0uNH09JiKSunVutfwHBr47dhSCxqE/h
	dsn+UYeV74i7kGH8LRrcyUaWgcjnV4sS8x1YZ4hL3v0isvmXXTOb8Ws1J+o8pA==
Message-ID: <8f1d4def-6a15-4573-9ee6-15300a63447a@bootlin.com>
Date: Wed, 4 Feb 2026 10:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: stmmac: rk: replace empty set_to_rmii()
 with supports_rmii
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYxq-00000007hor-3yXt@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vnYxq-00000007hor-3yXt@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094042_514780_64196B19 
X-CRM114-Status: UNSURE (   5.79  )
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

Hi Russell,

On 04/02/2026 10:14, Russell King (Oracle) wrote:
> Rather than providing a now-empty set_to_rmii() method to indicate
> that RMII is supported, switch to setting ops->supports_rmii instead.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


