Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B1DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iITGMV0gO5Id3+bInnoeulTIm6b1QnDINC/KY0kqRYA=; b=DadIENrksTW4He3CqWB7eFEbYe
	u5nuOocLVLRiQqnnz4pnvU6ibntGOl2B6rNpYaGs6T0LOBRtiPrCC9t3gHfeXcukx0KZf8B6D3Hnx
	/lpX80hFAovPPTFezOQsv/Bvv7P+T4Vv/5QT4fMIQM3R0IGaXR20zncep/oM469uiIjUCsshCvJei
	9ZVoFmpbeRoujqkfBFyEo4oAkOXI2kMXBhDvxSeiU1aRtoYPzJRW0M54+0GcoOIUaYWsPDY7NTODq
	h6QVjZ2YxFaJm+E0o18F/JR2opLLzJV3H3Af4RO+s2nmdkltmoBKlbHExAP2FjgxVx3RPczyStOxL
	DzDjpxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjrE-0000000GKgZ-1T45;
	Tue, 12 May 2026 09:56:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjrB-0000000GKfr-2GMO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778579813; x=1810115813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7nkYh6Qbf7lvqDosOSN3tJA/nJuPw0T3/Hd/H6IZ6/k=;
  b=ktH/Mo1+KW6pfJv5rw2gJWStmN5ZWBNQjbh3Ld0IHU7EdwTihqFCdk7N
   c3nhRwOB7EN3w1i2FnqXHXJasa7sIaV4o1xuBBY0jei2nTcNbC5+HiuZ7
   FRmoyEELBgaGEGYeczTU7JvkWjL3Ad+Bs/+OAvWFEFJgB2u14U4MYjx0U
   WiQfwo5bzgo6sTOA4znAQZE1tJ7YKNgO0hSPC+5IpmzFsRTFqxuSJFVEL
   iaIWUb8IY7IQOH86KnQAXMjHJWckrkqmG1xU79+Hfo1naKpsQXJeSpN6Q
   T+9dh01kPFr34tKz6Jnrn9iBdv7U7ibK05CdY18gTKuTbDHD0iAhEvoC+
   w==;
X-CSE-ConnectionGUID: J3uHyACQST6Daok8jNAfVw==
X-CSE-MsgGUID: yCzirzG2SqKAi3857ifdoA==
X-IronPort-AV: E=Sophos;i="6.23,230,1770620400"; 
   d="scan'208";a="57384159"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 02:56:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 02:56:50 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 02:56:47 -0700
Date: Tue, 12 May 2026 11:56:46 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, "Steen
 Hegelund" <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, "Herve
 Codina" <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v4 00/13] net: lan966x: add support for PCIe FDMA
Message-ID: <20260512095646.bnrgbo6ffjk4nv5g@DEN-DL-M70577.microsemi.net>
References: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
 <20260511192018.49dfcd7b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260511192018.49dfcd7b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_025653_684096_FDAAFEFC 
X-CRM114-Status: GOOD (  14.88  )
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

> On Fri, 8 May 2026 09:35:24 +0200 Daniel Machon wrote:
> > When lan966x operates as a PCIe endpoint, the driver currently uses
> > register-based I/O for frame injection and extraction. This approach is
> > functional but slow, topping out at around 33 Mbps on an Intel x86 host
> > with a lan966x PCIe card.
> 
> Looks like sashiko-bot responded but only CCed bpf@
> Please let us know if all the issues are false positives,
> I'm going to assume for now that at least one of the issues
> is real :)

I ran through all the issues from sashiko-gemini (sashiko-nipa only reported low
severity issues).

Most of them are false-positives, some are pre-existing and some are purely
theoretical. I have experimented a little with fixing some of the theoretical,
but subsequent local sashiko runs seem to just find new ones indefinitely ;)

IMHO, like Paolo commented on v3, I think these can safely be postponed to
future follow-ups, if need be.

Let me know what you think.

/Daniel

