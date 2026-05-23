Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6E5CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 02:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4HbN/Zm5NwpqBSXqKBpQ21+E30whduckc6SCmpCLzE=; b=t7kn5KuwWNni0dAydH9WxT9kTb
	aOZ3ihU3PRD/aG4nDHKQz0Q8aYybBbFChW8SqsORqXu8749KGkyXjg8IarcBxmQWnpC2dZgTa0hae
	hNlZ+uQjYZNxmdS6DMx/Tj/KJ2pRj4NBeFNMFGe57MtXTLEHyubQ3h912QjWFvEEOxWGl5PAZgrgC
	R1Jg6q7VJnCIhx5vA+tljwkGgDOBtmHKr5wGtjWkuAHpMYc2gEF9gZ18bjIMIhZlgaBnjheih48Yl
	nJJ0pKlojRpz0l0YLE0XPAqmZGow3VQDI88aAi/ZZJjjY3LSwu0Q8KwhS34v+588CJdGizaBX0Hk7
	b5B1qQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbgf-0000000CUgG-0T3w;
	Sat, 23 May 2026 02:02:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQbge-0000000CUg1-1fCs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 02:02:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8722860136;
	Sat, 23 May 2026 02:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4871F000E9;
	Sat, 23 May 2026 02:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779501719;
	bh=E4HbN/Zm5NwpqBSXqKBpQ21+E30whduckc6SCmpCLzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=POFxUF9RQV3lNgBwJeeqntDwAJP08HxOSPylrRoqiYNK43RreGrQrodnBjYfiBhNL
	 piYXxG4wkS1rzlvMMdw2qVZM7v69CuwPKxwzPY8ZIuBxQKDtM1+ftMIKv7Rv0mXMSM
	 yV4PRg9Hy2+aHfqdwUJvBaJ/kbThv89i5CxrEIhMRJUoF2t1VmOmFp5Zkf1PTucDPQ
	 06LXn2DOsuki8zM7AFa50FXCmPAQInkrVi5sMaVDwpusYr439aSLgUwcrmJRqTVmrm
	 6fh8gSrdtn+yYoTGm21A9nKTO7T9zFdzgnWDfSjRD22cvrNDvxOlw2igZ2eP/oguFV
	 9OLL7cruxqLIw==
Date: Fri, 22 May 2026 19:01:57 -0700
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
Subject: Re: [PATCH net-next v5 12/13] misc: lan966x-pci: dts: extend cpu
 reg to cover PCIE DBI space
Message-ID: <20260522190157.02e1e3ff@kernel.org>
In-Reply-To: <20260520-lan966x-pci-fdma-v5-12-ca56197ae05b@microchip.com>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
	<20260520-lan966x-pci-fdma-v5-12-ca56197ae05b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 20 May 2026 10:12:24 +0200 Daniel Machon wrote:
> The ATU outbound windows used by the FDMA engine are programmed through
> registers at offset 0x400000+, which falls outside the current cpu reg
> mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
> to cover the full PCIE DBI and iATU register space.

Are we supposed to take these to net-next ?

