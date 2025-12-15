Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43031D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTjSAZFUzU34s0xIiW5Kc8wqYNk8gMO9/kFOhdCVu34=; b=yRUGwI4pIPHpyH7BxTvemB1Min
	QnpwrjfIPKWJI/R4mnOtuZZ4F7wxmBCI82MYbGhAug+7fY/rGJOCkA9Up+JNX1bRlLArt37KBicWv
	41G2r/diZmWD2A0wi7r3qOdVEHm4ISP6XC0WwAGH8sfOmdKAcVvr8mHUo+bkpexwtEhLKRFAM24qQ
	6czj4+YYfbWfNPGJGdoNvfBAdaBeA+IvmvSu8KdX3UhSXYE1qST2Trv3yVHYu8wzs908fqtsMpubD
	6sW97t2WxtlDn5r6TxVl10sVRF+k5ZhdtuFSZex+3jsNYpCw6OpW9NPVoL7wKxAie55KAfOI9l6NX
	P0NwG3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3PZ-00000003E0W-0NAE;
	Mon, 15 Dec 2025 07:54:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3PX-00000003E0P-3WQh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 07:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBD0660142;
	Mon, 15 Dec 2025 07:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22802C19421;
	Mon, 15 Dec 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765785266;
	bh=v/92elu0+HvI8sObJNUPXdOl7LjF+U9jY1BY0X5X81M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyjrkH6KtnThxV3unDn7bby/GiiSiQSPftVpABjisSWU2uFJUOSoLOiJ1XOF8YjOp
	 I40Nc0tRoSWwyXZw3oFdsyqnAaagma7510sWIAUaNrX4+PjLfSRLD+et/jmtmNvL+p
	 fd4Yahc3vd/qAeYLCUCQr2QPTBPU15ibXG263IfBgtMJdpwq5a9dE2n/RsAVjJh07f
	 tBknFVn5nsVHGveX55SVFDgvPqaXIiTsXroBhscCr8hxdkkc2/x2GJwzqKuPDYEuTo
	 2nEzH829pMn8wb+YSsr4CldmREQ2VzSqT1cZK03HP02QTa8mhN+yfwFBVy6LBXOcO0
	 DVK3rvhjXpeNg==
Date: Mon, 15 Dec 2025 16:54:11 +0900
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <aT--ox375kg2Mzh-@sumit-X1>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
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

On Thu, Dec 11, 2025 at 06:14:54PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> the objective of this series is to make tee driver stop using callbacks
> in struct device_driver. These were superseded by bus methods in 2006
> (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> methods.")) but nobody cared to convert all subsystems accordingly.
> 
> Here the tee drivers are converted. The first commit is somewhat
> unrelated, but simplifies the conversion (and the drivers). It
> introduces driver registration helpers that care about setting the bus
> and owner. (The latter is missing in all drivers, so by using these
> helpers the drivers become more correct.)
> 
> The patches #4 - #17 depend on the first two, so if they should be
> applied to their respective subsystem trees these must contain the first
> two patches first.

Thanks Uwe for your efforts to clean up the boilerplate code for TEE bus
drivers.

> 
> Note that after patch #2 is applied, unconverted drivers provoke a
> warning in driver_register(), so it would be good for the user
> experience if the whole series goes in during a single merge window.

+1

I suggest the whole series goes via the Jens tree since there shouldn't
be any chances for conflict here.

> So
> I guess an immutable branch containing the frist three patches that can
> be merged into the other subsystem trees would be sensible.
> 
> After all patches are applied, tee_bus_type can be made private to
> drivers/tee as it's not used in other places any more.
> 

Feel free to make the tee_bus_type private as the last patch in the series
such that any followup driver follows this clean approach.

-Sumit

> Best regards
> Uwe
> 
> Uwe Kleine-König (17):
>   tee: Add some helpers to reduce boilerplate for tee client drivers
>   tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
>   tee: Adapt documentation to cover recent additions
>   hwrng: optee - Make use of module_tee_client_driver()
>   hwrng: optee - Make use of tee bus methods
>   rtc: optee: Migrate to use tee specific driver registration function
>   rtc: optee: Make use of tee bus methods
>   efi: stmm: Make use of module_tee_client_driver()
>   efi: stmm: Make use of tee bus methods
>   firmware: arm_scmi: optee: Make use of module_tee_client_driver()
>   firmware: arm_scmi: Make use of tee bus methods
>   firmware: tee_bnxt: Make use of module_tee_client_driver()
>   firmware: tee_bnxt: Make use of tee bus methods
>   KEYS: trusted: Migrate to use tee specific driver registration
>     function
>   KEYS: trusted: Make use of tee bus methods
>   tpm/tpm_ftpm_tee: Make use of tee specific driver registration
>   tpm/tpm_ftpm_tee: Make use of tee bus methods
> 
>  Documentation/driver-api/tee.rst             | 18 +----
>  drivers/char/hw_random/optee-rng.c           | 26 ++----
>  drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
>  drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
>  drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
>  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
>  drivers/rtc/rtc-optee.c                      | 27 ++-----
>  drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++
>  include/linux/tee_drv.h                      | 12 +++
>  security/keys/trusted-keys/trusted_tee.c     | 17 ++--
>  10 files changed, 164 insertions(+), 138 deletions(-)
> 
> 
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> -- 
> 2.47.3
> 

