Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7AEE7E0C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osD34MbzJ4JrKQn3MCvbtOMiNFpo9ySJ1s2YZPh08rQ=; b=dISXhs3rXZDHp9VI+11kJfxfRi
	BHZJM4dx1VRF8lI+i8ow8SgD+tEAitiGnhDDMQ9ucA5TT8dTvY3/ZS1nW1h+aFzUdwSmscbOAMkzl
	ZtGf7LQREbTWYOkPu6r8oJDk3ZvA/ZOSMX7oTL1zHLVQzuLtbZCgIP8tR6EKHPaPoBasvhjk7jSRt
	tGBAveWlyfkhbxOxWBCyUgnEtWpfFWkjqMQBseewEcHgLaZo2wiEoS5v8BA87zPJ88rdDwM2gBS95
	kq9iXZu6RCiiGqheGjRfaB4g3zbjd8bsoWiLTLrKkTr8+8bAfbqfSSoPK920p3I21y2PVrGvJxx8h
	wNe+gJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOwa-0000000FGSR-1f4v;
	Mon, 09 Feb 2026 10:56:40 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOwT-0000000FGRV-3tu4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 10:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=osD3
	4MbzJ4JrKQn3MCvbtOMiNFpo9ySJ1s2YZPh08rQ=; b=C6ZryzX3Y5PvV8l1Myip
	t/ZAGbkwv50pNWo+70g/68Dw34JTGRKTYQFAz98W4MwuPXt4QUDNfriFr6PLApvl
	OSoRxNCOmv5CyOTz4jPZ5lDqWUbmiWWuWAJfRxzpRMqFU2IvHTQSKqP0T6GIvADa
	td3CHyEnKzYviQZUcFrPder3/8HF7YtFngtUNngMDzTSEF4r/N5zXom0Xcvdz82g
	s1JaOBy5Y4ezNqrxLlAYGJv+nBvMPhpgWs639uI2GrZK0NlRrMd2z5Riul0gbMVg
	SKKhnQLm3bKUfuBIFNjKVZYgM5aT6W49RSy7yEYbonQLOpqLFPBqMpACFEoDr5cA
	ew==
Received: (qmail 1131709 invoked from network); 9 Feb 2026 11:56:26 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2026 11:56:26 +0100
X-UD-Smtp-Session: l3s3148p1@4MeG/WFKyuwujnuv
Date: Mon, 9 Feb 2026 11:56:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aYm9Waibey1yG1o4@ninjato>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_025634_847740_D0E1E363 
X-CRM114-Status: GOOD (  13.56  )
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

Hi all,

> > > Implement new property arm,no-completion-irq, which sets all SCMI
> > > operation into poll mode. This is meant to work around uncooperative
> > > SCP implementations, which do not generate completion interrupts.
> > > This applies to mbox/shmem based implementations.
> > > 
> > > With this property set, such implementations which do not generate
> > > interrupts can be interacted with, until they are fixed to generate
> > > interrupts properly.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---

...

> > 
> > LGTM.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Is there anything left to do with these patches, or can this now be picked
> up ?

Would love to see this going in. I also work with the firmware which
needs this functionality.

All the best,

   Wolfram


