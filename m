Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D62606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ghCDdvTP;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCm4NjP2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DALcyRp0vjX3To2DbsLGpJo7XYxiod9b2pPkFTmQfLk=; b=ghCDdvTPhUADCz
	eKO8+qowreep5IMZOTG7WKzx2HRFbsbM2DNYYA2faCqFAuhotAU0TmQtf4A2qYvyeTojt36E1915c
	bIAuZqI5mhBwAjcKqLfRn1/7WNVQka6Ub6Pf7cKJ6u7/f32Q/Z+52YRb1lFSqjSlQdtLHPFF9a9uP
	4DpCSIObA9UV+3SFnG1/gISTG2TQPxiw71+BKVhD31ImGyZIa4k3KEVWxcn43QvghLHipATERhNBS
	QB6s30XoKsZaoq+A12K8UWC31IQTmiKOpXMfqTT2L207bFtp1Q4g6yY7Rf69qpamsM5g7XdcxWCqn
	ZV2iZehs5kO1DStR9Yjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP74d-0000000At2N-2Xgb;
	Thu, 05 Nov 2026 23:40:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP74b-0000000At2D-0CT2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:40:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D15641FCD;
	Thu,  5 Nov 2026 23:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4A31F0089F;
	Thu,  5 Nov 2026 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793922048;
	bh=DALcyRp0vjX3To2DbsLGpJo7XYxiod9b2pPkFTmQfLk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BCm4NjP2zzmaYQx55nDTiQotiZ0+FHR5odVzEn4z99P23s+3u9VzGxonfB4eoH0XA
	 JaF3F08tmQfJK6/YdAkOMkyWnj2v9T5KPud/rUx4E4TG9kMBZE0+A4qYHoIWlzRYsk
	 pYlg00lhrz+D1WXDg+jAanxy3Bodf/rKe8UdAxXevAQVYPDZxNp3TOJzDg2juGV6bS
	 4mwTbwhPXtKAD5OzKhGNKUyM3JW0MM7tIUe7Nkwtzc2BYR+l0piz5q7AspMbKeeKtt
	 XL/i/rnwksQ0EPyJsg4T4nvNjulAUFF3dozdsT33aKtsin6UzrBLNJn09dmFJQmZz1
	 BniPbdkSVVZzw==
Date: Thu, 5 Nov 2026 15:40:47 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tzu-Hao
 Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the
 Axiado AX3005 IRoT
Message-ID: <20261105154047.079c5eae@kernel.org>
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 06:00:56 -0800 Akhila Kavi wrote:
> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
> co-processor next to the application processor. Security protocols such
> as SPDM and PLDM run between the two over MCTP. This series adds a
> transport for that link, so the host side uses ordinary AF_MCTP
> sockets.
> 
> The link is built from two channels of the AX3005 mailbox controller,
> which is already supported (drivers/mailbox/axiado-mailbox.c, in the
> base of this series), and a no-map reserved-memory carve-out. The
> mailbox carries small doorbell and ACK messages. The packets
> themselves go through two windows in the carve-out, one per direction,
> which the IRoT firmware allocates and reports at probe time. Each
> direction has one packet in flight, and every packet is acknowledged
> with a counter.
> 
> Patch 1 adds the devicetree binding and a MAINTAINERS entry.
> Patch 2 adds the driver.

net-next was still closed when you posted this. It only opened after:

https://lore.kernel.org/all/66b35989-9195-4e96-99bb-df383a52aa5d@redhat.com/

