Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3DACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI8/I+R4XFueGD45Af5il1s/iiz/K+lbIS9vusns7IQ=; b=UTpA18+mIeP4RgmbPmvLq3S8k9
	8JUFCuJ98f557QQCM1cfdu4549lcSs3paUQqQisgs3zqI0yBU1BkCv4yBVMzlDzMiRFiAbO46vjU2
	KNx2bbJAFSu1Ijhzy5yoQPMYUpUzfcpBR3BgP/lpVMQn8v8vBhcpednBvCGBGfpY2lgGp4eias31p
	E2zH3HJVQ/VUhH9gI0oxBb7v7RRYTuKfjouWNd+ydhm2pUDHQMPsWWW0LPFXQwE9GpptsNIIFy6ti
	OpY6GdMPFy6LgteblCxmALa4oVqbcrOSzQkqnDaxfkx+K1vBKF9wB13LigHkI8J2ld46ARYpjDpU6
	Adciek9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfeL-00000004W0a-0UXV;
	Wed, 20 May 2026 12:03:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfeJ-00000004Vzu-0Mtq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zI8/I+R4XFueGD45Af5il1s/iiz/K+lbIS9vusns7IQ=; b=JIB8mYflUs69Rm2FxyOoE7dizW
	P27yRjmYoLFAUDmNx6YXqDPK6jy2juMb6qSeJ179Fj0KJtwja8sUPPoGJVtQOrpbB3ksPDtRdiyq+
	rMJ8mhSebvg+9n94LWJUdoBFTqpQHjodyVNoHf8l+0uFr+D05xCbZFQXAYcTevGXvVcE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wPfeD-003pPn-Kx; Wed, 20 May 2026 14:03:37 +0200
Date: Wed, 20 May 2026 14:03:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ARM: PCI: merge pci_common_init_dev() into
 pci_common_init()
Message-ID: <55b9534c-7b95-438f-aa77-0f34485a3977@lunn.ch>
References: <20260520041343.23040-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520041343.23040-1-enelsonmoore@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_050343_127307_97BEBC22 
X-CRM114-Status: GOOD (  12.61  )
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

On Tue, May 19, 2026 at 09:13:38PM -0700, Ethan Nelson-Moore wrote:
> pci_common_init() is a compatibility wrapper that simply calls
> pci_common_init_dev() with an additional NULL argument. The comment
> above it implies that it should be replaced by pci_common_init_dev(),
> but that has never happened - there are no callers of
> pci_common_init_dev() in the kernel. Make the PCI code more
> straightforward by getting rid of the wrapper function and instead
> removing the device argument from pci_common_init_dev() and renaming it
> to pci_common_init().
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

