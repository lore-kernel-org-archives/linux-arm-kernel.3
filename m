Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4F6CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 02:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCpmwOBMO2WUkTkzHq+nS/FnpxquV63bE+Zm5s0BjQ8=; b=ibyKC4A0OtHhPCf26d9KpaSd5Z
	hHndwjpojrpYDrZtsd2kUAShNn80M6MJ6rXpAOC9b2gFHlUzkKsSrM7L9f4tvhkMhwRVMseQ2oBXt
	j4hUATEehDrC0184QonaLNKqIC6IBEkldL3gWRS2jGSjgW8YUkYUz24PgSEvRYMfdAOex7JWPausr
	148xdGEG6Ry9QEsElM4tDuQPskb4dBKJ0Ad4Z4cea4L/Ebq2W5USR5RqA8h5/4UV0VIqXmVbBAX+s
	6WSs7socTaiXMWky5of5fI1xvck1QPIqrrmJqDo3CrGeHXd7PhulTFU9uLsyz1Me1gKxvyRvL/tRq
	80wj4dfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcjQ-0000000FFmm-2RGJ;
	Tue, 12 May 2026 02:20:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcjN-0000000FFmR-2fNs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 02:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C564F40316;
	Tue, 12 May 2026 02:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FEFC2BCF5;
	Tue, 12 May 2026 02:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552420;
	bh=qCpmwOBMO2WUkTkzHq+nS/FnpxquV63bE+Zm5s0BjQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qGxfJUCl4H7hCiKozqcohLBmSz2UGHjAUAnhFnbCkokN/8U5+DNCy3gkdREIPy5lT
	 FcuKyjngJ4CLIq0CowDYsBvmOjYrJRSQ/fcF4fZheIk5E9BeebiHbOg+5bpzhegKpM
	 /KDCxxemrJV0rjqXJnckd7dkSlKt6+E3hdojzLsWWTFF3wj41TvRqlfubpWfGfinyI
	 2GEAYue+fArQRJQBENFSnlCcU0Qmx+0fd3NtT7Lj5QnSadh4lBHWrnX2s18U4nAv+O
	 YWfd8QL3KimEIygt1/6FVwEaPCoANw85ANpVmOXB/P/sdTA6ocdQxV68U16KQQaVlQ
	 BVg7iY1KhqMkA==
Date: Mon, 11 May 2026 19:20:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen
 Hegelund <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
 "Alexei Starovoitov" <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, "Jesper Dangaard Brouer" <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Herve Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v4 00/13] net: lan966x: add support for PCIe
 FDMA
Message-ID: <20260511192018.49dfcd7b@kernel.org>
In-Reply-To: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
References: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_192021_702622_15C612C2 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, 8 May 2026 09:35:24 +0200 Daniel Machon wrote:
> When lan966x operates as a PCIe endpoint, the driver currently uses
> register-based I/O for frame injection and extraction. This approach is
> functional but slow, topping out at around 33 Mbps on an Intel x86 host
> with a lan966x PCIe card.

Looks like sashiko-bot responded but only CCed bpf@
Please let us know if all the issues are false positives,
I'm going to assume for now that at least one of the issues
is real :)

