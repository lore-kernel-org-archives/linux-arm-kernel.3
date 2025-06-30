Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E4C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u38ttXwC7mGcq5PAXdcvrvOILsVsgWF0FCXPjIoHK+w=; b=35HSrfx+EqoAez5A25g8SDiLcL
	u38M2nDQwAr52EhryDwBwnBpaCJ+l5JJzJ9Tzi5R0RY54Kq5D+KwtF2KJEjF+M5++B/gELskKZAsU
	YOuS3XUK8xRXSZFUGrje+p62sVYgr7JEjUd9jHYmccTGQFEyUljOvHMOVvINluLOSMMKWNYMTIRqS
	tIK2ZrMc9nGXUz/Hvj6nOjFKYWZxfUO6wP/ckXeuAvwtHLtw5vwzpJb7dcMK1269AMiIaC5K4CCNo
	Qon+s4LhmnIflDnXofbfE7U8UtSRDeRh3OUDKBnpJDyreaU9u0Nyrx0FDg/eAniBCbZ3eRh9VXhiB
	wdalIEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDoz-00000002Dfn-2nYl;
	Mon, 30 Jun 2025 12:41:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDSB-000000029mX-0hqv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 12:17:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uWDRr-0004km-3r; Mon, 30 Jun 2025 14:17:23 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uWDRq-0066DT-2U;
	Mon, 30 Jun 2025 14:17:22 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uWDRq-009ggO-1c;
	Mon, 30 Jun 2025 14:17:22 +0200
Date: Mon, 30 Jun 2025 14:17:22 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v18 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Message-ID: <20250630121722.wviidlggt7hguyt7@pengutronix.de>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
 <20250619-imx-se-if-v18-3-c98391ba446d@nxp.com>
 <20250625105546.pxuatcnfpe7mssgs@pengutronix.de>
 <AM9PR04MB8604611B8D91B5526C9704E69545A@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <20250627084653.6vgwnm3llf3zknlp@pengutronix.de>
 <b02055bb-0995-4fd8-99f3-4ca5146eedd4@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02055bb-0995-4fd8-99f3-4ca5146eedd4@kontron.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_051743_212665_47BE084B 
X-CRM114-Status: GOOD (  52.38  )
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

Hi Frieder,

On 25-06-30, Frieder Schrempf wrote:
> Hi Marco,
> 
> Am 27.06.25 um 10:46 schrieb Marco Felsch:
> > Hi,
> > 
> > your e-mail configuration mixed my e-mail with your answer, which makes
> > it hard to read. Can you please check the quoting next time :)
> > 
> > On 25-06-27, Pankaj Gupta wrote:
> >>>> Add driver for enabling MU based communication interface to
> >> secure-enclave.
> >>>>
> >>>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are 
> >>>> embedded in the SoC to support the features like HSM, SHE & V2X, using 
> >>>> message based communication interface.
> >>>>
> >>>> The secure enclave FW communicates with Linux over single or multiple 
> >>>> dedicated messaging unit(MU) based interface(s).
> >>>> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> >>
> >>> You write single or multiple MUs are possible. I'm aware that the i.MX93
> >>> has two MUs one for the secure and one for the non-secure world. But I'm
> >>> really concerned about the fact that both MUs can't be used at the same time
> >>> from both world:
> >>
> >> Yes, you are correct.
> >>
> >> Fix is still work in progress.
> > 
> > So after ~6 months no fix is available :(
> > 
> >>> Also how is the secure and non-secure world talking to the ELE if there is
> >>> only one MU as you have written?
> >>
> >> Till the fix is WIP, either Linux or OPTEE can use the ELE, at one point in
> >> time.
> > 
> > That has nothing to do with the fix. The fix is for platforms/SoCs which
> > do have 2-MUs, but you also have written that there are platforms with
> > only 1-MU.
> > 
> > This MU can't be shared between secure and non-secure world.
> > 
> >>> IMHO it makes much more sense to put the complete ELE communication into
> >>> (OP-)TEE and let the secure OS taking care of it. All non-secure world
> >>> requests are passed via (OP-)TEE to the ELE. This involves:
> >>> - eFuse access (done via OP-TEE i.MX specific PTA)
> >>> - ELE 23h59m ping (kernel SMC WDG driver, requires OP-TEE watchdog driver)
> >>> - HW-RNG (kernel OP-TEE HWRNG driver + OP-TEE HWRNG PTA)
> >>
> >> There is a dedicated MU "trusted-MU" for OPTEE-OS. The idea to converge to a
> > 
> > Yes for systems with 2-MUs there is a "trusted-MU" and a
> > "non-trusted-MU". As of now, there is no fix available for using both
> > MUs at the same time. Furhtermore there are platforms/SoCs with only
> > 1-MU, as you have written in your commit message. This 1-MU system can
> > have the MU either trusted or non-trusted.
> > 
> >> single path via OPTEE-OS, is good. But it will impact the performance of the
> >> features at Linux side.
> > 
> > Performance? We are talking about a ping every 23h59m (I still don't
> > know if this is a feature or bug), eFuse write/read, and the HW-RNG
> > which can seed the Linux PRNG.
> > 
> >> Since the fix is still WIP. Let's wait till then.
> > 
> > The fix is for the 2-MUs SoCs but not the 1-MU case.
> > 
> > I would like to have a system design which doesn't differ too much
> > between SoCs which are equipped with the ELE engine.
> 
> Do we really want to depend on OP-TEE to be available for having things
> like OTP fuse access and HWRNG? Personally I'd like to be able to build
> systems with OTP access and HWRNG but without OP-TEE. Requiring OP-TEE
> only to make the ELE available to the kernel in cases where the secure
> world isn't used for anything else seems to be unnecessarily complex.

I understand your point. I don't like pulling in more FW neither but we
need to the face the following facts:

 - OTP eFuse R/W access after doing the LOCK_DOWN fuse is no longer
   possible without OP-TEE. This involves general purpose (GP) eFuses
   too. We faced this limitation in a current project.

 - With new regulations like the EU CRA I think we need some sort of
   secure-enclave anyway.

 - Making it optional cause more paths of potential errors e.g. by not
   including the correct "secure.dtsi". Multiple paths also require more
   maintain- and testing effort. IMHO I do think that one of the paths
   get unmaintened at some point but we would need to keep it for
   backward compatibility.

   Having one implementation eliminates this since.

 - All above points assume that the ELE-FW and -HW is capable of talking
   to both world, which is not the case. As we learned NXP doesn't have
   a fix for the 2-MUs ELE yet and even more important there are 1-MU
   ELE-IPs.

I do see the (minimal) drawback of having +1 FW but I think this is more
an integration problem.
Speaking of FW files, for the new i.MX9* you already have plenty fo
them: bootloader, TF-A, ele-fw, scu-fw (i.MX95). So your integation
needs to handle multiple firmware files already.

> Anyway, I see your point of having a single implementation for the ELE
> API in the "right" place. But as far as I know other platforms like
> STM32MP1 also implement both ways for the HWRNG, secure access via OPTEE
> and non-secure access via kernel directly.

I'm not a STM32MP1 expert but here you have this setup with the
*-scmi.dtsi. So you have two code paths which needs to be maintained and
tested. Also if one customer of yours want to use OP-TEE you need the
integration anyway, so you (Kontron) needs to maintain multiple
configuration as well. I don't see the added value.

I think for STM32MP1 the *-scmi.dtsi support was added later because it
required a lot effort to support it. This is not the case for the i.MX9*
series.

Regards,
  Marco

> Thanks
> Frieder
> 

