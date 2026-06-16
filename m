Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BCCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 23:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTB6pD/Rh+YCgLCuyfdBhlLO7UlS80+QRuqfydwqgQU=; b=0mtdoocsEr91/Av8hueEMLgoVk
	fE8KtxgKS179b5j+zoy8wb4OQ/yaY2u8sCXmFGLTbNjCL0E2I/bVdzyRRZh8G4XjDt9/vsS1l/Dqw
	JQjJikFJ20DQkhOr0QubSbKowt973CyBOHSwUfXOKZ4MBsqYSoMGUTnzOT499Tu/IVeR8MP8SbRM9
	IVy2K5ZomgKd6MfUa4em/N6FRxvo58hzTpqsKXoV23dhYSkwtxuYSVhv7tKRS8qU/XcsHeiuyhUpw
	T1KzZm+8nWmI9B02g+rT3AjCKn1ogaDz3Htxx/LCk2jXP7WhKT8wN2lyh1BbwfMB57cYDjTTgerOa
	KyXt3DcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZdL2-0000000GPP7-0rHE;
	Tue, 16 Jun 2026 23:37:00 +0000
Received: from ferryfair.com ([103.227.96.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZdKz-0000000GPOS-0caI;
	Tue, 16 Jun 2026 23:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ferryfair.com; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Resent-From:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CTB6pD/Rh+YCgLCuyfdBhlLO7UlS80+QRuqfydwqgQU=; b=UnEgpZoC5dz9U1YgwmBnPxd1UB
	yFkVwKvyyuyBzlWw+0jdGnadCjgr5hAUOztDxYZXed60pOtz2eVf/VgzGd0qvHtnUzMNueGU6DVea
	m+gmEk0MYeCCrFjnDHqItOJ07Et66OgRMnYruNfCfkpCtlg2InT5nRB6vivY4yGMmRzaNILHCiFF7
	lOulZ6KA6nLittyLjx86DwTUraZq4uf9fOBRZ985TV75AxNIRXu5jXfvapUUP2hWcR587KT9B4tj8
	TCCLJYZuCIsDZ2PFDYtqYHeWcfdfKY1K2NTIrv0AdjKo+CM8yCpDrewTslVm5ycwEu8W+etRVXMbx
	Le2BSXYA==;
Received: from console.gl-inet.com ([192.168.0.1] helo=slick.ferryfair.com)
	by ferryfair.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <gowtham@ferryfair.com>)
	id 1wZdKW-000000001ZV-08Pg;
	Wed, 17 Jun 2026 05:06:28 +0530
Date: Wed, 17 Jun 2026 05:06:27 +0530
From: gowtham <gowtham@ferryfair.com>
To: neil.armstrong@linaro.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, robh@kernel.org,
 bhelgaas@google.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, yue.wang@Amlogic.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
Message-ID: <20260617050627.4d01ed54@slick.ferryfair.com>
In-Reply-To: <b2d8cb85-5529-4a4c-a233-64ca7a436f0b@linaro.org>
References: <20260614015620.20432-1-gowtham@ferryfair.com>
	<84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
	<b2d8cb85-5529-4a4c-a233-64ca7a436f0b@linaro.org>
Organization: FerryFair
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_163657_202749_AF7095B3 
X-CRM114-Status: GOOD (  25.98  )
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

Hi,

As Neil suggested I moved the PCIe reset to init; I've updated the tag
at
https://github.com/GowthamKudupudi/linux/tree/meson-pcie-warm-reset-linux-7.0.y

Ronald, yes, I do think its proper to initialize PCIe with RESET Active.
Anyway we need the reset *cycle*. Please submit your patch as well.

Thank you!

...Gowtham

On Tue, 16 Jun 2026 08:06:02 +0200
neil.armstrong@linaro.org wrote:

> On 6/15/26 12:34, Ronald Claveau wrote:
> > On 6/14/26 3:56 AM, Gowtham Kudupudi wrote:  
> >> On warm reboot, the PCIe controller's LTSSM starts link training
> >> immediately if PERST# is already deasserted from the previous boot.
> >> The driver then pulses PERST# for only 500us, which is too short to
> >> properly reset the endpoint device that has already started
> >> training.
> >>
> >> Fix by moving the PERST# assert/deassert pulse BEFORE enabling
> >> LTSSM, so the endpoint gets a clean reset cycle before link
> >> training begins.
> >>
> >> This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
> >> Cold boot worked because POR held PERST# low; warm reboot did not.
> >> The fix was confirmed on a Banana Pi CM4 with Waveshare IO base
> >> board.
> >>
> >> Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
> >> ---
> >>   drivers/pci/controller/dwc/pci-meson.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pci/controller/dwc/pci-meson.c
> >> b/drivers/pci/controller/dwc/pci-meson.c index
> >> 5f8e2f4b3c12..3a7e9f1d5b8c 100644 ---
> >> a/drivers/pci/controller/dwc/pci-meson.c +++
> >> b/drivers/pci/controller/dwc/pci-meson.c @@ -310,8 +310,8 @@
> >> static int meson_pcie_start_link(struct dw_pcie *pci) {
> >>   	struct meson_pcie *mp = to_meson_pcie(pci);
> >>   
> >> +	meson_pcie_assert_reset(mp);
> >>   	meson_pcie_ltssm_enable(mp);
> >> -	meson_pcie_assert_reset(mp);  
> 
> I think this change is valid, other controllers resets PERST
> in the host init callback, so either this or move to the
> init callback.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> >>   
> >>   	return 0;
> >>   }  
> > 
> > Hi Gowtham,
> > 
> > I have a patch [1] that I haven't submitted yet.
> > This might be related to your issue, what do you think ?  
> 
> Ronald, This fix is valid, it's definitely better to probe the
> driver with PERST asserted, please send it.
> 
> Neil
> 
> > 
> > [1]
> > https://github.com/rclaveau-tech/linux-khadas/commit/bee0a02d9756 
> 


