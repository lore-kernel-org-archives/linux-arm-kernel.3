Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897D5CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTcfkOPlIW892EhdMfr5qQk6TfDhlVCXup0babukdvQ=; b=gYcpP2nu+u4nLW5umUKZuW4WwW
	5baN1tiX8CHke+XdqtQj1rHhWvktym0T12UsU3Dqj5YUQWbokuKzZnIk7oHL4Oh3jDZ6mqAmFfJrw
	is6bss1XNExNa51G9qaNNPghuswPnZxl+e+adUff9Q5xxo1R3iIdOd9Z7uZ5+aW382IoGF6btgP5B
	kXA9XLgXyS0R9rcqc5gcALCLO/oW0bQ+zG3M0WEOIKAnRk3ryc+dGnR58/zHm8ZcVMLTN2BieUDrP
	71bQaF+ya9QfgFkDF206BvRR8y0XCTyiloqQ14PS8LOr9RDfoqEBqh6t5ChiUcx9hVfG7rb84ZtMX
	eRnk0LXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlsu-0000000FCGb-3i8i;
	Wed, 03 Jun 2026 13:43:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlsr-0000000FCFp-0zn8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:43:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso27958455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780494227; cv=none;
        d=google.com; s=arc-20240605;
        b=inVtulpP+/evtwrrlWvzKH4yOi1i8jzY6709qIZZFN4I9fVeiyUiGb91Vrah8LaYBr
         Ed6nvnxDRw8YGAwBz6NwsYbzTISwx6tGXS4BHr1Ws83tpsoG7i6V7AdDEIGt7DnMYv/X
         B4j211eycET/qv4DL6KRaJavZ3N2pHF734yOya26xRg6IiN/hh6CO2+tQspm3j0lRYDr
         fhBO9U+h/r9IB9dSNiG9XT6EV1XmGEImTXIICOe1n66GbEKoO07VUNkWfDGQd9nfJ6dH
         OgGvsnJjNA/bWFNQzAQ3wkAYnFsQ7eQY3SU6X6ZHwMNBmlFM4xUiIjPni9rogqTcdTqC
         9toQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VTcfkOPlIW892EhdMfr5qQk6TfDhlVCXup0babukdvQ=;
        fh=RI9RYZybuGTx/djjgZo8OgcOaN8b9IPEJuWBW+BELAU=;
        b=K+I9XhO4RDgzerS7YUIwh/Yodx5eYE1VVT7Y1WMHqnIb8PY71MDMB+sH3TcoRM+Tj8
         EtI00Eig+H5xjMjdj1x1AIviaEgD74/w2E8vDDhkLuaozTyJrPNvzg2GApumQgp/Z0kX
         NGTrj6sZTgt7Cy5mKWOrMkAb0bN4kAM1+o0ap0vcHFaL9+TbhnxD1Se6CjpZvSny8ybo
         wTpJaax0g9Fj5bz21Ov9OI7SmVN8GFD3ptlZWbqr6vB8VpfAfAYOg1vx28NK1sTzq8He
         03wPyUn6GGkRr3wmRzeR2HeicQo8KXLS3RPzrZX8cnd1UoYrSEkeQrKsuhuZyFuEJQrj
         ycDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780494227; x=1781099027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTcfkOPlIW892EhdMfr5qQk6TfDhlVCXup0babukdvQ=;
        b=GkNX8bOcOg3d2krdtEQ+TPNcvT9/OUM7Nj7zm0XDDIBbKaipBpQvGKQjTB7bkrveLe
         A28BnbtV8G9S1mVfl9BbfuXqdTdn+n5Ftpi9UV4QfWPNPie3bSZJXomtZfvyxvnl2WZM
         Vm4CWfs4iL4EhWLlAWK2TZ/geAiS/1rtYYr4QGn812HnskRLAW/lCV1OYBkc4a97tC8W
         6GzkuDNlxunue0c9S/jHPdON6rUStwLGAqzA78NqsmIMbCN663NgnDESMz0a0+Dpf+Uk
         U/Cg8KCmunD4iNqkGXBhdfVLr5St8akMfOc+y1PyBjmpT4VG7QAGi3cQolLqIjXlbtvF
         1WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494227; x=1781099027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTcfkOPlIW892EhdMfr5qQk6TfDhlVCXup0babukdvQ=;
        b=fjVm8fD8yzd5dgs9g1fDt07lUy9vNfNx4MUqpv3lNSo6Npvwsy/QtGA/W0MOPC9D1M
         Le+oiOiYkUsJ3d5TASndyQox5OCdnVsPwgds76Y/dQGzNqq+4k/PyzG5xkw5gmSL4uxK
         6y7t7qHyHIDLZe1cWN2QK3AVbsRH28eqRvBLpjY38oDDTYWlDey+EdxSyFIFEk9Rk7OC
         glInFXFq4bYR7IzprJuJSPs3/VOhiiJQexQiwVRDQPLBw6QYiPhYYrAGNIollPV9lXwW
         ud+OXhayY7niEWLwgJQyYGEEAbt3rVn6MNrsneRf+EijfPAIxqW5CcZgBoCiGooWXnh5
         k9Ow==
X-Forwarded-Encrypted: i=1; AFNElJ+3bUXD/MsNgIsJBBI/yyVgKMCu5MANaZ0zABVXEtYy5tAILME81kvfMoyxQPNQkUCPAoEhID3rKnnicL+txtiR@lists.infradead.org
X-Gm-Message-State: AOJu0YwpMIwTxGYkDKM2sBFRkYUlVs/AmFbs79O1pF99+sne/38oJx9W
	VvKeaBHcp1EkJO/qn3sgTpTZvboxyWxNzoxILGmYRKtIuEdyI+mN05GYhph76KklB4SiPLJe+oO
	lbsYQTtTtmhw/jrdryHR5lQ95oezDIwzqDPDipRaNHA==
X-Gm-Gg: Acq92OHiQjEmtzGpksdybAUrj+MSVwHY/cdeJzOnxwmP7mLcdHiQ/UPWZNywKcUiyq/
	/hIqHHb4F2lWO29aSOIHnaZt8BZcVN13Wn9on1NPkC49CvkmE7WPm7DxZmI93+3wX71i8Us4oR7
	1l++/uS5P6vJp0GCmSfsWdwERzNkortSrOtxUJh2NiWjIpzXyb2wQQ6u4COnOSeK898gGlXw8lv
	/pJEEVYjWDFi4OJYCJe4fFe6sn5H0S5iYOf0FnvSmWDGxzHHXmGo9aRnlZbgd5kIqxzjZjoAds6
	RlnuRjDn9yBFRcdqQA==
X-Received: by 2002:a05:600c:4513:b0:48e:7854:1608 with SMTP id
 5b1f17b1804b1-490b5fe9bd8mr58678515e9.25.1780494227210; Wed, 03 Jun 2026
 06:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780409151.git.gregoire.layet@9elements.com>
 <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
 <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
In-Reply-To: <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 3 Jun 2026 15:43:36 +0200
X-Gm-Features: AVHnY4KAjzRL4EZ-_z2w7gIb7xHs465qhHFgOBjhOy8lDYI40Oh9lKfcinUsrDM
Message-ID: <CAFi2wKY7ECbxSbtsO1W9KEKFET67yKg+C64jtQHFY05DRzhfKg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, jacky_chou@aspeedtech.com, 
	yh_chung@aspeedtech.com, ninad@linux.ibm.com, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_064349_639336_3BF97344 
X-CRM114-Status: GOOD (  19.39  )
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

> How virtual is this? Is this directly accessing the hardware via
> shared memory? Or is there software on the BMC which traps these
> reads/writes and responds?

The VUART is virtual because there is no physical UART link between
the host and the BMC.
Instead, the AST2600 exposes a 16550-compatible register set on both
sides (BMC APB and PCIe host MMIO).
The data flows using an internal 16 byte FIFO shared between the two
register views.
So it's hardware emulated and there is no software in the data path.

The AST2600 has four VUARTs, two of which are accessible via PCIe MMIO.
This is based on the following section of the AST2600 datasheet:
III.48 VUART and III.64 PCI2VUART.

Because the silicon presents a standard 16550A interface in hardware,
the existing 8250 driver works without modification.

> But first we need to decide if this is the correct architecture. The
> alternative is rpmsg or virtio.

> Either of these seem like a better way to expose resources of the BMC
> to the host.

For the rest of the driver (shared memory, doorbell and mailbox), you are r=
ight,
it makes more sense to implement rpmsg or virtio than just raw shared
memory binding.
These are software-defined communication channels and not hardware-emulated=
,
so they would fit better as rpmsg or virtio drivers.
I took the SDK driver as a starting point without questioning its structure=
.
I have verified the VUART was working correctly with the shared
memory, doorbell and mailbox setup removed.
I can split this into VUART only and defer the rest for a separate
rpmsg/virtio work.

So I propose for v2:
- Remove the shared memory device, the sysfs doorbell and the mailbox
from this series.
- Retain only the required configuration and initialisation on the BMC
side driver.
  This should mainly be SCU and PCIe device configuration but other
initialisation will be reviewed to determine what is required.
- The shared memory, doorbell and mailbox features could then be
addressed in a separate future series, likely as virtio based driver.

Would that be acceptable?

Thanks,
Gr=C3=A9goire

