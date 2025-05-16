Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66571C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DilWklAStkYCxuWzUAJUGcUmzsrF1e73uj4WWbXu4Yo=; b=uywbLXceAZeKv253dxj+E27Hls
	sizknxXEeib1mdc9m8TfN2nuyTj3dIqYw41NfrXexzUB0ocrSXqSTJNzlt1Y+3RlwZrEi+1EwyaLa
	z04hiv0DP0qaPiRX4mIpMlGOlqUD7tm+B9ienzmaoIfZy4mnfh568pjjYYMb3R5A/ZKxozlI43Adg
	mYMu0AJnQ6mI0lV10uxwn3AaM1VXoHCTfp6dEM9iaw/UimKTliV1B21DuZy5oDLPMuqaSrHFUmwqF
	cFJ4tnTlXjG+bnDxKwz8+Ca9UWD2v+8vAiuOeBxP7AMM68QhCW0gxlvuJ10GdEQPuLIFhEmbqvtxH
	IR9JO12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFru5-000000034r5-333C;
	Fri, 16 May 2025 10:02:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrrZ-000000034Wy-2tYW;
	Fri, 16 May 2025 10:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B72C662A07;
	Fri, 16 May 2025 10:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557A3C4CEEB;
	Fri, 16 May 2025 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747389620;
	bh=EvnTkEQU2Ier/kGZtfB/eROe2plClajpDZdWnckjWIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=in/3OQzwUowA5XfCHtWTaQ94tKRGLIvRnkbqr+XW6f0ZLzJfaGmU92+G3GmtrXxgN
	 go+panze8ZYd9tN/Nqwtc/yI78psZtJp0MTApzk03livO6YNUH/pkl6nEzf+Io7v0S
	 I3eWlA49pCRRk/XHS8sgZlP2isNDquCWIxk6H7ndNeAR84tKJHBE1VEJ7z2ws2wtbN
	 Jss04WWNRlxX2YP3zG9tfdjIUhq/t8Nak/UGLJOSDjkE3iqJjTlT6X8QisjKM1UClN
	 ed0jCaWAHl1tp3DOYny4Nip4oztzQ29CZFrL77CaUxPOSxwp9T7T2Zb9b5RFpukNS8
	 BX5BbzxS+ta+Q==
Date: Fri, 16 May 2025 12:00:14 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Laszlo Fiat <laszlo.fiat@proton.me>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <aCcMrtTus-QTNNiu@ryzen>
References: <20250506073934.433176-6-cassel@kernel.org>
 <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
 <aCNSBqWM-HM2vX7K@ryzen>
 <fCMPjWu_crgW5GkH4DJd17WBjnCAsb363N9N_h6ld1i8NqNNGR9PTpQWAO9-kwv4DUL6um48dwP0GJ8GmdL4uQf-WniBepwuxTEhjmbBnug=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fCMPjWu_crgW5GkH4DJd17WBjnCAsb363N9N_h6ld1i8NqNNGR9PTpQWAO9-kwv4DUL6um48dwP0GJ8GmdL4uQf-WniBepwuxTEhjmbBnug=@proton.me>
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

On Thu, May 15, 2025 at 05:33:41PM +0000, Laszlo Fiat wrote:
> I am the one experiencing the issue with my Orange PI 3B (RK3566, 8 GB RAM) and a PLEXTOR PX-256M8PeGN NVMe SSD. 
> 
> I first detected the problem while upgrading from 6.13.8 to 6.14.3, that my system cannot find the NVME SSD which contains the rootfs. After reverting the two patches:
> 
> - ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
> - 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ")
> 
> my system booted fine again. 
> After that I tested the patches sent by Niklas in this thread, which fixed the issue, so I sent Tested-by.
> 
> I did another test Today with 6.15.0-rc6, which in itself does not find my SSD. Niklas asked me to test with these 
> 
> - revert ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect Link Up")
> - revert 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ")
> - apply the following patch:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index b3615d125942..5dee689ecd95 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -692,7 +692,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
>                 if (dw_pcie_link_up(pci))
>                         break;
> 
> -               msleep(LINK_WAIT_SLEEP_MS);
> +               usleep_range(100, 200);
>         }
> 
>         if (retries >= LINK_WAIT_MAX_RETRIES) {
> 
> 
> which restores the original behaviour to wait for link-up, then shorten the time. This resulted again a non booting system, this time with "Phy link never came up" error message.

That message was unexpected.

What I expected to happen was that the link would come up, but by reducing
delay between "link is up" and device is accessed (from 90 ms -> 100 us),
I was that you would see the same problem on "older" kernels as you do with
the "link up IRQ" patches (which originally had no delay, but this series
basically re-added the same delay (PCIE_T_RRS_READY_MS, 100 ms) as we had
before (LINK_WAIT_SLEEP_MS, 90 ms).

But I see the problem with the test code that I asked you to test to verify
that this problem also existed before (if you had a shorter delay).
(By reducing the delay, the LINK_WAIT_MAX_RETRIES also need to be bumped.)

Could you please test:
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index b3615d125942..5dee689ecd95 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -692,7 +692,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
                if (dw_pcie_link_up(pci))
                        break;
 
-               msleep(LINK_WAIT_SLEEP_MS);
+               usleep_range(100, 200);
        }
 
        if (retries >= LINK_WAIT_MAX_RETRIES) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 4dd16aa4b39e..8422661b79d5 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -61,7 +61,7 @@
        set_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
 
 /* Parameters for the waiting for link up routine */
-#define LINK_WAIT_MAX_RETRIES          10
+#define LINK_WAIT_MAX_RETRIES          10000
 #define LINK_WAIT_SLEEP_MS             90
 
 /* Parameters for the waiting for iATU enabled routine */


On top of an old kernel instead?

We expect the link to come up, but that you will not be able to mount rootfs.

If that is the case, we are certain that the this patch series is 100% needed
for your device to have the same functional behavior as before.


Kind regards,
Niklas

