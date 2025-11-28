Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61529D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzKpKMMMYM2pI49ja+jfT8txEh3DHJG7XSC4smzte7U=; b=KT5AI4mu4l5iJys2yG2fQwc53b
	gCgYpnBOEiddhp26IBUk07RrIsySHVV42uFVwlDcjvDr5dc36uQZYg+hMY6a2DZDzrafOokKdxR+U
	nIpQuZLUdk69uw2BaPMYpISi5wQ7kXA0tXBhhi5cOhZMqL9/exgduiUS6PA1B2k9cCyxoooI5Gmi5
	WvwXaR7lmL5u14QERkA0NNDpvbVomPXkzosi30tfKGkorMKR5+Ld+AS/FSRZm1q+4swvRlRYejqdC
	CZDzMPWGON2ApPoMPNSHljjQIqIZ2I7vXPwtNDmwlVWF+2PzoaDWw+7uw3Bvj3p5jwvPaw3uF4va1
	5tShwNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP25W-00000000iSF-1e5T;
	Fri, 28 Nov 2025 17:16:54 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP25S-00000000iRp-2zGN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:16:52 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CED5B92009C; Fri, 28 Nov 2025 18:16:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id BFC7492009B;
	Fri, 28 Nov 2025 17:16:47 +0000 (GMT)
Date: Fri, 28 Nov 2025 17:16:47 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
cc: Manivannan Sadhasivam <mani@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
    Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    Krzysztof Kozlowski <krzk@kernel.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, 
    Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
In-Reply-To: <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com>
Message-ID: <alpine.DEB.2.21.2511281714030.36486@angie.orcam.me.uk>
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org> <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org> <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk> <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
 <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk> <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_091650_938405_A32C7E18 
X-CRM114-Status: GOOD (  11.03  )
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

On Fri, 28 Nov 2025, Krishna Chaitanya Chundru wrote:

> >   I have no slightest idea why it should cause a regression such as this,
> > it seems totally unrelated.  Yet it's 100% reproducible.  Could this be
> > because it's the only device in the system that actually uses PCI/e port
> > I/O?
> Hi Maciej, Can you try attached patch and let me know if that is helping you
> or not. - Krishna Chaitanya.

 No change, it's still broken, sorry.

  Maciej

