Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20605C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HD7CwDSBdI7ApvW9myNSUssqtq9jDio3I05Sz3qKMAk=; b=IoWqFbjYLJzJhKrYm4+glNSHxc
	CmdMYS7AmDs45qwJs8MPe/lvQVoNxpn+baAu2Y4f0aciuN4wF2dReS4Ow4BLjUiFqwoBJdxoHtosX
	vcFJ/8KX2GIBwYpQaGn2ypkT5KbJz6CKYHYztgu58HdhQFT0Mv6n0SoU8kagFcXwxlEvxhy+1RRmm
	FI7bHW8mBi8lG0iUCBX2oFPqFeFB5KfcLhC9CHBD5pyeZ3nR9MPnwGitnzeLefjTyPIbTsnJwSaCn
	FM6Hca2n0Y0njkZYiRpeDDGdB8FyDd8wgPYzwr0sYrbgqtE6k4Xuz1KQuZr4NpBb5Hg0rhz2XxSCi
	3XLBolig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tkh-0000000Frxj-0bkH;
	Fri, 11 Sep 2026 05:24:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tkd-0000000FrxM-3Usv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:24:41 +0000
Received: from francesco-nb (unknown [185.12.129.179])
	by mail11.truemail.it (Postfix) with ESMTPA id 65D9822A64;
	Fri, 11 Sep 2026 07:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789104277;
	bh=HD7CwDSBdI7ApvW9myNSUssqtq9jDio3I05Sz3qKMAk=; h=From:To:Subject;
	b=JbPSjiN/w4LO9ADIbdIKV/vFf+H2SWOFS8oSWFQKzh0kkEmEYcB13lBle3Kq7WHAo
	 WJyVffgJeIcbtVWFM+wZIobEHtAbTcg/S8HA2TI3INwZwmVfSy5lW3CzMUC/NHgima
	 2UpgOO7EcyxRxRlHThqRfxuUGRZXVAZGTPNu45AhJaFILlEemwYWMvsKXLKHTxzEN9
	 Xhl4VaMtisNJTMuLbZPBSv9dodVRnOtylbZSVL/luVqHgE4BHjECsF8DiCD3QsOnpf
	 4ZCAr3TWcncmfn/oMCF4ojhGFOPbtBgCMtkimt3OXaHdqwB8+w9v0Algi1A0PpFMNH
	 Axg//UkbZ0wUg==
Date: Fri, 11 Sep 2026 07:24:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
Message-ID: <20260911052428.GB5377@francesco-nb>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_222440_041074_6F7B744D 
X-CRM114-Status: GOOD (  15.36  )
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

Hello Markus

On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (TI) wrote:
> For IO+DDR the wkup_r5fss0_core0 and the
> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
> setup is done. These are used to read the lpm metadata region in
> which data is stored to resume. This needs to be done before RAM is
> in use to avoid overwriting data.
> 
> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
> ipc-firmware dtsi files and to the lpm metadata region nodes of the
> AM62A and AM62P boards.
> 
> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
> redundant with the dtsi-wide flag and is dropped.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
...

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> index 45ab9d947b3a..8976c0424cd1 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x00 0x9ca08000 0x00 0x1000>;
>  			no-map;
> +			bootph-pre-ram;
>  		};

verdin-am62p has the various bootph tags only in the U-Boot dtsi
(k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced it
is a good idea to just add this single one here.

Francesco


