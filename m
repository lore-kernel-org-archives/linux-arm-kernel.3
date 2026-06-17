Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C8FCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in6v/D5VjOzgXD0ii8FaFVUqT/tjHQnth/1Ddc5jt18=; b=dyfpTcPqz8pykMmkpUeuA51UCv
	odpQtLXnbc74oCu3FPu2vRar4v3r8BZaaYRhj95vygzokaOiqtulb+Q10DICXMpoRJyPctLk1nhCw
	SxZKCD4YTcD5x/UZZFtSO47rv5ssE66fun95WYpw4c6jhvxSoZhJB7tlD6AcHaXY6StpaLFmzE387
	pfBs/UYIelAD3/9ccseb5eQ9lDcZkGMhryEEjOOjAXE5tSr1p0iRPCwCiXC+pwFuRaYKcxrXsbs4l
	j/pADKcFXFYeF23gX0Q1kdwlRd6UGzE3DsrtgUHsBTpTyUVexnMS+ur1DqAlxb4+0MSlJRsViK7XN
	FYmo29uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwuW-00000000JkW-1w99;
	Wed, 17 Jun 2026 20:30:56 +0000
Received: from ferryfair.com ([103.227.96.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZwuT-00000000Jjv-1z7q;
	Wed, 17 Jun 2026 20:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ferryfair.com; s=s1; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Sender:Reply-To:
	Resent-From:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=in6v/D5VjOzgXD0ii8FaFVUqT/tjHQnth/1Ddc5jt18=; b=cCW+gpnRN8wByqDmLtBwriTtmD
	5ND0NQHms/y2miLe1wn01ntL7WHiTyqFI+50RGRMcC0nuZBXTdx+BG8OyjVggSlfwFTqfygtfd/IR
	kaFba6jKpSDg7lXPJPFgAjHnSVhQ/vGwAIRqU98kah1ZhqTtukNAXpzqnIV6ddkUkY9qwgT4qzI6g
	ONJztK/vpZWHy3Jr+dXlndDCcI6p7IQ+yKS4mYmQ9Z3ZPut02lXuhOM3+RK5jlCb6se5liMSy03Wq
	fvgwY3fcJKBjribsp1xGKZyNFu+sOWC5KetLxVQN9TbLwqNlu4h28hMbn/eeYmLQYNTo4I3HVjlc/
	7IJTKZ9g==;
Received: from console.gl-inet.com ([192.168.0.1] helo=slick.ferryfair.com)
	by ferryfair.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <gowtham@ferryfair.com>)
	id 1wZwu2-000000007Jp-27RB;
	Thu, 18 Jun 2026 02:00:26 +0530
Date: Thu, 18 Jun 2026 02:00:25 +0530
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
Message-ID: <20260618020025.2739cb96@slick.ferryfair.com>
In-Reply-To: <20260617050627.4d01ed54@slick.ferryfair.com>
References: <20260614015620.20432-1-gowtham@ferryfair.com>
	<84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
	<b2d8cb85-5529-4a4c-a233-64ca7a436f0b@linaro.org>
	<20260617050627.4d01ed54@slick.ferryfair.com>
Organization: FerryFair
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/RqLM/5A=AsV1+l9kUQ52pza"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_133053_828107_7E11FD6C 
X-CRM114-Status: GOOD (  40.24  )
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

--MP_/RqLM/5A=AsV1+l9kUQ52pza
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ronald,
I see you submitted the patch. Last couple of days I've been fixing the
etherenet of my BPiCM4+Waveshare-io-base-b due to which I couldn't test
your patch any sooner. Now I got my ethernet working but now I couldn't
reproduce the issue *without* either of our patches!!!

Anyway it's proper to initialize PCIe with RESET Active but I think
meson_pcie_assert_reset(mp) will give sufficient time to PCIe devices
to complete the reset cycle.

---
 drivers/pci/controller/dwc/pci-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c
b/drivers/pci/controller/dwc/pci-meson.c index 0694084f612..c28ab40c9ff
100644 --- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -308,8 +308,8 @@ static int meson_pcie_start_link(struct dw_pcie
*pci) {
 	struct meson_pcie *mp = to_meson_pcie(pci);
 
-	meson_pcie_ltssm_enable(mp);
 	meson_pcie_assert_reset(mp);
+	meson_pcie_ltssm_enable(mp);
 
 	return 0;
 }
-- 
---
 drivers/pci/controller/dwc/pci-meson.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c
b/drivers/pci/controller/dwc/pci-meson.c index c28ab40c9ff..2ef75157530
100644 --- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -308,7 +308,6 @@ static int meson_pcie_start_link(struct dw_pcie
*pci) {
 	struct meson_pcie *mp = to_meson_pcie(pci);
 
-	meson_pcie_assert_reset(mp);
 	meson_pcie_ltssm_enable(mp);
 
 	return 0;
@@ -362,6 +361,8 @@ static int meson_pcie_host_init(struct dw_pcie_rp
*pp) 
 	pp->bridge->ops = &meson_pci_ops;
 
+	meson_pcie_assert_reset(mp);
+
 	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
-- 

...Gowtham


On Wed, 17 Jun 2026 05:06:27 +0530
gowtham <gowtham@ferryfair.com> wrote:

> Hi,
> 
> As Neil suggested I moved the PCIe reset to init; I've updated the tag
> at
> https://github.com/GowthamKudupudi/linux/tree/meson-pcie-warm-reset-linux-7.0.y
> 
> Ronald, yes, I do think its proper to initialize PCIe with RESET
> Active. Anyway we need the reset *cycle*. Please submit your patch as
> well.
> 
> Thank you!
> 
> ...Gowtham
> 
> On Tue, 16 Jun 2026 08:06:02 +0200
> neil.armstrong@linaro.org wrote:
> 
> > On 6/15/26 12:34, Ronald Claveau wrote:  
> > > On 6/14/26 3:56 AM, Gowtham Kudupudi wrote:    
> > >> On warm reboot, the PCIe controller's LTSSM starts link training
> > >> immediately if PERST# is already deasserted from the previous
> > >> boot. The driver then pulses PERST# for only 500us, which is too
> > >> short to properly reset the endpoint device that has already
> > >> started training.
> > >>
> > >> Fix by moving the PERST# assert/deassert pulse BEFORE enabling
> > >> LTSSM, so the endpoint gets a clean reset cycle before link
> > >> training begins.
> > >>
> > >> This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
> > >> Cold boot worked because POR held PERST# low; warm reboot did
> > >> not. The fix was confirmed on a Banana Pi CM4 with Waveshare IO
> > >> base board.
> > >>
> > >> Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
> > >> ---
> > >>   drivers/pci/controller/dwc/pci-meson.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/pci/controller/dwc/pci-meson.c
> > >> b/drivers/pci/controller/dwc/pci-meson.c index
> > >> 5f8e2f4b3c12..3a7e9f1d5b8c 100644 ---
> > >> a/drivers/pci/controller/dwc/pci-meson.c +++
> > >> b/drivers/pci/controller/dwc/pci-meson.c @@ -310,8 +310,8 @@
> > >> static int meson_pcie_start_link(struct dw_pcie *pci) {
> > >>   	struct meson_pcie *mp = to_meson_pcie(pci);
> > >>   
> > >> +	meson_pcie_assert_reset(mp);
> > >>   	meson_pcie_ltssm_enable(mp);
> > >> -	meson_pcie_assert_reset(mp);    
> > 
> > I think this change is valid, other controllers resets PERST
> > in the host init callback, so either this or move to the
> > init callback.
> > 
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >   
> > >>   
> > >>   	return 0;
> > >>   }    
> > > 
> > > Hi Gowtham,
> > > 
> > > I have a patch [1] that I haven't submitted yet.
> > > This might be related to your issue, what do you think ?    
> > 
> > Ronald, This fix is valid, it's definitely better to probe the
> > driver with PERST asserted, please send it.
> > 
> > Neil
> >   
> > > 
> > > [1]
> > > https://github.com/rclaveau-tech/linux-khadas/commit/bee0a02d9756
> > >   
> >   
> 


--MP_/RqLM/5A=AsV1+l9kUQ52pza
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-PCI-meson-Fix-PERST-timing-by-asserting-reset-before.patch

From 852811b11795ee389ea6a953ed0db69b76722469 Mon Sep 17 00:00:00 2001
From: Gowtham Kudupudi <gowtham@ferryfair.com>
Date: Sun, 14 Jun 2026 09:41:01 +0530
Subject: [PATCH 1/2] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable

On warm reboot, the PCIe controller's LTSSM starts link training
immediately if PERST# is already deasserted from the previous boot.
The driver then pulses PERST# for only 500us, which is too short to
properly reset the endpoint device that has already started training.

Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
so the endpoint gets a clean reset cycle before link training begins.

This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
Cold boot worked because POR held PERST# low; warm reboot did not.
The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.

Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612..c28ab40c9ff 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -308,8 +308,8 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
 {
 	struct meson_pcie *mp = to_meson_pcie(pci);
 
-	meson_pcie_ltssm_enable(mp);
 	meson_pcie_assert_reset(mp);
+	meson_pcie_ltssm_enable(mp);
 
 	return 0;
 }
-- 
2.54.0


--MP_/RqLM/5A=AsV1+l9kUQ52pza
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0002-PCI-meson-pcie-reset-moved-to-meson_pcie_host_init.patch

From 1bcf2c787d72b2c25852cc598b1201510b4132b0 Mon Sep 17 00:00:00 2001
From: Gowtham Kudupudi <gowtham@ferryfair.com>
Date: Wed, 17 Jun 2026 04:29:45 +0530
Subject: [PATCH 2/2] PCI: meson: pcie reset moved to meson_pcie_host_init

As per the Neil's suggestion, inititial PCIe reset is moved to init
to make it proper.

Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index c28ab40c9ff..2ef75157530 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -308,7 +308,6 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
 {
 	struct meson_pcie *mp = to_meson_pcie(pci);
 
-	meson_pcie_assert_reset(mp);
 	meson_pcie_ltssm_enable(mp);
 
 	return 0;
@@ -362,6 +361,8 @@ static int meson_pcie_host_init(struct dw_pcie_rp *pp)
 
 	pp->bridge->ops = &meson_pci_ops;
 
+	meson_pcie_assert_reset(mp);
+
 	meson_set_max_payload(mp, MAX_PAYLOAD_SIZE);
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
-- 
2.54.0


--MP_/RqLM/5A=AsV1+l9kUQ52pza--

