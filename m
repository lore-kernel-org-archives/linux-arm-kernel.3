Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE7BC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4v9HUR4QiLyKVn0obl7xKCuLinaYa+EawIxJ1IBpOY=; b=zYqtUBGSqwoHAD72uB3pdeG3CX
	zVDHkbffBICJ2T6lbcGL4JpUz0/AxeSCJ+i/a7hC442ToYWTtlIivt3izkIJ7KRw5aMGy84ilbolt
	L8AsZNYMgFX4eINhR3+s9iy523S898b/8qFyGPwlfsWHfOhA+2LPIFkmHotbWvbO5dUWHrjOWbBFb
	atcxQgXHWZwcvYlBZTJhcuZTZjsB3+kglcYDC+4MIp6ql5I03l/hQg9H8DaUz4IG4uByAVkhLWdUV
	psF5cDqexloRxLKZnLibYoajUw2A4c5RYvPTg2SnNQSsMB8jpXQFmfyaiH5KexdyO/OJQIIL8hxGY
	JEVLg1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoh5-00000000dE1-0s0G;
	Tue, 25 Aug 2026 10:47:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoh0-00000000dDF-3kXC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:47:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BA971A180A;
	Tue, 25 Aug 2026 10:47:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F6C2604C4;
	Tue, 25 Aug 2026 10:47:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CB5A11C7A063;
	Tue, 25 Aug 2026 12:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787654863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T4v9HUR4QiLyKVn0obl7xKCuLinaYa+EawIxJ1IBpOY=;
	b=fEUqYYfXm9oppt+jjmEP7wX9Bl8FMTarOuLGbtJQhcH9DxMNzKSD3bS2ENvxedOlsS5dgC
	do8BodixuPMNy0OPiyHr99NmlybWnQQdY0OFVtEDNi/L1aNY0pJdHJYgGPt9zg0Cvm15WP
	dfIgzyzUn1dN0DdGPK1lvafARdxcFv/+TxVbTa5fxV5M2yB0cFY+lIqsmKMsL2cJiNvo5c
	qij/Q9fxnVSaNqAkkuFYHXbYVFSjBFhw1vW6B+MSNVMTw+3hlqEJBSgtZZBtPdOUuDcWKk
	ccNLNoREBrsMqMctNYL0WuOV1GahPcnwGWJIcJ0Jx86XlaYa85wM2r/Z9DgJBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 12:47:35 +0200
Message-Id: <DKXYRB39AH7K.3M4RSLMXADERF@bootlin.com>
Subject: Re: [PATCH 0/3] PCI: dra7xx: fix resource leaks in probe error
 paths
Cc: <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Felix Gu" <ustc.gu@gmail.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Sekhar Nori" <nsekhar@ti.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
In-Reply-To: <20260822-dra7xx-v1-0-23e204d5548b@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_034747_618093_7B7786C7 
X-CRM114-Status: UNSURE (   4.01  )
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

On Sat Aug 22, 2026 at 5:07 PM CEST, Felix Gu wrote:
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

All series:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

