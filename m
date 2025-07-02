Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2ECC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WxtPoOJmWkUKOlgrEMmMcJUVOoLpQYZ0JRTr1w8CE0=; b=tsuFk8WYEUrkDtRFnq372lqAX3
	117DtcHFbZVYfZ9BtlYYwIDwbswNNB6fnm9c2gkVhV0/ZJAAXOwRzNm4EoNefUroWnOyRtpHkM4fs
	86QlcdqfW7EjAsITqRLSUbAsh4AwKXoxx5eEwS0Y432L/xtdsRE2+uTB6z8/QgYT3HwF/evlJRrF5
	swefIJn9GXZcXoqiLyfG0nJ108B3TlUe9r3PtN57ahzinruXVxW9c4TXzacK8FGEggVeL/VBiq1lI
	WE3aNQWM4CXDFJkoEfpvXzE6VmPfs9zsp8ICfeWjLmgnCbbW87XfpCfdvlVF9oHOGsDqlhO57SzwO
	/NqiGq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzEU-00000008l0W-0Lo5;
	Wed, 02 Jul 2025 15:18:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyIQ-00000008bke-4Ae0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 14:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2WxtPoOJmWkUKOlgrEMmMcJUVOoLpQYZ0JRTr1w8CE0=; b=cb6BL19+HEjjjNwJcvrlPhoMB0
	omHa1TtOtIYJlXuy5dDw5jaEl51mjhTMmsQNlvsmhm159jI0mYfgZ3TtCHiCRemQnNgErOmVJY7mv
	6eUHMoyWj5SmoeyhrOkFcJVDMZWeGfQQ4IJT+sJeLEoT8MdczNWLFhJsqBQKw7On8k9IatZiA8lnj
	6+SJ0CaEmq3QIflw/B0O8cd5G0Ek+APz71deSQB3WJ0RLQITnsthEhtuDcTSJUbaqSYPpFKtxFtto
	PA3zg3DUxlxfgQGMJI7/h9yAy9URy3DireUjIa6ZUzDZOdk/V7HO+JmcjVDPsvlEWBuo3dHtWwr94
	UhG3VNmA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyIM-00000007RYB-3C3O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:18:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXMS75hxdz6L5GV;
	Wed,  2 Jul 2025 22:17:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D54BF140446;
	Wed,  2 Jul 2025 22:18:25 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 2 Jul
 2025 16:18:24 +0200
Date: Wed, 2 Jul 2025 15:18:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
	<timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v6 00/31] Arm GICv5: Host driver implementation
Message-ID: <20250702151823.00007aec@huawei.com>
In-Reply-To: <86jz4tb14h.wl-maz@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
	<86jz4tb14h.wl-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_151842_915338_1D09FB67 
X-CRM114-Status: GOOD (  19.24  )
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

On Mon, 30 Jun 2025 18:17:02 +0100
Marc Zyngier <maz@kernel.org> wrote:

> On Thu, 26 Jun 2025 11:25:51 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > Implement the irqchip kernel driver for the Arm GICv5 architecture,
> > as described in the GICv5 beta0 specification, available at:
> > 
> > https://developer.arm.com/documentation/aes0070
> > 
> > The GICv5 architecture is composed of multiple components:
> > 
> > - one or more IRS (Interrupt Routing Service)
> > - zero or more ITS (Interrupt Translation Service)
> > - zero or more IWB (Interrupt Wire Bridge)  
> 
> [...]
> 
> I think what is here is pretty solid, and definitely in a better shape
> than the equivalent GICv3 support patches at a similar point in the
> lifetime of the architecture.
> 
> For patches in this series except patch 18:
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> If this goes into 6.17 (which I hope), it'd be good to have this
> series on a stable branch so that we can take the corresponding KVM
> patches[1] independently if they are deemed in a good enough state.
> 
> 	M.
> 
> [1] https://lore.kernel.org/r/20250627100847.1022515-1-sascha.bischoff@arm.com
> 

Agreed. Looks very clean to me.  All the stuff I had was trivial.
I'm only not giving tags (beyond the various field definition patches) because
I don't feel like I have yet spent enough time with the spec yet to be sure about
some aspects (and irq stuff always gives me a headache)  Anyhow for this stuff
my tags are hardly relevant.

As Arnd observed, for now this is very low risk so good to get it into next and
lined up for 6.17 even if a few buglets + fixes surface to go on top.

Jonathan

