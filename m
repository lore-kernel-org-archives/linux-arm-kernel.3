Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A482E8537A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Y7rWcWFSVI8FYBYcIVNi2UAFKU/jzneFj/DK/KoBts=; b=l85+tqKLG/LCOtrPesDlGaG2hZ
	DjICxJx8y9/TM9ltBPpCYCP1OFe4ZBki1NRVH5AFhou7Eojwkeaujq9qqzxv3MFsUdAeP2td3EQIi
	bSaQc0cHiiDzY+pIAq88alycX9yWjvR6b2yOLxVH85l6SBuzVRoTYgqi4qyAjdT0h9vZo7mCJ1baw
	B8YFRBL83V/7JUMk7gxLn7bcNwmD+iqN53jKe4XnRPFvPsDbHh/ukPJklDyahCwOMBPaU5Zo+nyRu
	qYUk5zL/yQrAnmb1g2rpgF/YhBIfcp7CiFp+05nzF5apCswQMmJhzIf+54LK+OskWgbiqdpYUkfyL
	PGOAWEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gmo-00000002Ell-0Pqg;
	Fri, 03 Apr 2026 15:50:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gmm-00000002ElZ-2v5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 15:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6F1C60121;
	Fri,  3 Apr 2026 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5ACC4CEF7;
	Fri,  3 Apr 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775231415;
	bh=prDkm53R9Cx3R2od50UsMKn7PCFX4EJS2fF/vGLBeYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5GZrzydQ2eNeHFUBs9hO1fUN+M1I8zyAlUGnlyzZGlI8bmoj9tvyC9z2wahuOdQ5
	 LXXGDAmcQAlHqZUETS8/fFbv54dKFLy3/k9ZNFt21WfWTtsp4Ra500/Z5Syi0vUr/z
	 rPw3ckbhNW0C8/WtfFCND8YxyvTtgarI7GCHgPMwYS4qcjsPNz5Ju5OA/e2G8nScau
	 V/l3tkNRyj3mAq1yc/hhlQKYkPKFTr8N2gmfO1H6sf09bUz6DMGAEUbbnXNun1w88e
	 OdOXkB3nNsLjjdeAnCG4pJGmh6673d7Fd3Q0Y9feSbMVZe8LXj6reXhdH8xKg5tH8h
	 Oy2mPR9IEGiYg==
Date: Fri, 3 Apr 2026 17:50:06 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
Message-ID: <ac/hru3IIiU0+Lp9@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
 <da6f4566-a719-409b-80a9-40ca89e3e721@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da6f4566-a719-409b-80a9-40ca89e3e721@oss.qualcomm.com>
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

On Fri, Apr 03, 2026 at 12:05:27AM +0530, Shivendra Pratap wrote:
> 
> 
> On 01-04-2026 20:07, Lorenzo Pieralisi wrote:
> > On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
> > > 
> > > 
> > > On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
> > > > On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
> > > > > PSCI supports different types of resets like COLD reset, ARCH WARM
> 
> [snip..]
> 
> > > > > + * Predefined reboot-modes are defined as per the values
> > > > > + * of enum reboot_mode defined in the kernel: reboot.c.
> > > > > + */
> > > > > +static struct mode_info psci_resets[] = {
> > > > > +	{ .mode = "warm", .magic = REBOOT_WARM},
> > > > > +	{ .mode = "soft", .magic = REBOOT_SOFT},
> > > > > +	{ .mode = "cold", .magic = REBOOT_COLD},
> > 
> > These strings match the command userspace issue right ? I think that we
> > should make them match the corresponding PSCI reset types, the list above
> > maps command to reboot_mode values and those can belong to any reboot
> > mode driver to be honest they don't make much sense in a PSCI reboot
> > mode driver only.
> > 
> > It is a question for everyone here: would it make sense to make these
> > predefined resets a set of strings, eg:
> > 
> > psci-system-reset
> > psci-system-reset2-arch-warm-reset
> > 
> > and then vendor resets:
> > 
> > psci-system-reset2-vendor-reset
> 
> Can you share bit more details on this? We are already defining the string
> from userspace in the struct - eg: ".mode = "warm".

"warm","soft","cold" are not strictly speaking PSCI concepts and mean nothing
well defined to user space and even if they did, they would not belong in
the PSCI reboot mode driver but in generic code.

Spelling out what a reset is might help instead, again, this is just my
opinion, I don't know how the semantics of resets have been handled thus
far.

If userspace issues a LINUX_REBOOT_CMD_RESTART2 with arg, say,
"psci-system-reset2-arch-warm-reset" it is pretty clear what it wants
to do in PSCI.

Again, it is a suggestion, comments welcome.

> yes we can move away from enum reboot_mode and use custom psci defines one -
> Ack.
> 
> > 
> 
> [snip ..]
> 
> > > > > +
> > > > > +/*
> > > > > + * arg1 is reset_type(Low 32 bit of magic).
> > > > > + * arg2 is cookie(High 32 bit of magic).
> > > > > + * If reset_type is 0, cookie will be used to decide the reset command.
> > > > > + */
> > > > > +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
> > > > > +{
> > > > > +	u32 reset_type = REBOOT_MODE_ARG1(magic);
> > > > > +	u32 cookie = REBOOT_MODE_ARG2(magic);
> > > > > +
> > > > > +	if (reset_type == 0) {
> > > > > +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
> > > > > +			psci_set_reset_cmd(true, 0, 0);
> > > > > +		else
> > > > > +			psci_set_reset_cmd(false, 0, 0);
> > > > > +	} else {
> > > > > +		psci_set_reset_cmd(true, reset_type, cookie);
> > > > > +	}
> > > > 
> > > > I don't think that psci_set_reset_cmd() has the right interface (and this
> > > > nested if is too complicated for my taste). All we need to pass is reset-type
> > > > and cookie (and if the reset is one of the predefined ones, reset-type is 0
> > > > and cookie is the REBOOT_* cookie).
> > > > 
> > > > Then the PSCI firmware driver will take the action according to what
> > > > resets are available.
> > > > 
> > > > How does it sound ?
> > > 
> > > So we mean these checks will move to the psci driver? Sorry for re-iterating
> > > the question.
> > 
> > Given what I say above, I believe that something we can do is mapping the magic
> > to an enum like:
> > 
> > PSCI_SYSTEM_RESET
> > PSCI_SYSTEM_RESET2_ARCH_SYSTEM_WARM_RESET
> > PSCI_SYSTEM_RESET2_VENDOR_RESET
> > 
> > and can add a probe function into PSCI driver similar to psci_has_osi_support() but
> > to probe for SYSTEM_RESET2 and initialize the predefined strings accordingly,
> > depending on its presence.
> 
> Not able to get it cleanly.
> 
> 1. Will move away from reboot_mode enum for pre-defined modes and define new
> enum defining these modes- fine.
> 2. get SYSTEM_RESET2 is supported from psci exported function -- fine, but
> how we use it here now, as we do not want to send the reset_cmd from
> psci_set_reset_cmd now?

You do keep psci_set_reset_cmd() but all it is used for is setting a struct
shared with the PSCI driver where you initialize the enum above, possibly
with a cookie if it is a vendor reset.

> 3. For pre-defined modes, warm/soft or cold - reset_type and cookie, both
> are zero, sys_reset2 or sys_reset2 decides the ARCH reset vs cold reset.
> 4. For vendor-rest , we use sys_reset2 with reset_type and cookie.

Yes.

> All above is done in reboot_notifier call at psci-reboot-mode.
> --
> 
> Now in the final restart_notifier->psci_sys_reset --
> 
> If panic is in progress, we do not use any of the cmd based reset params and
> go with the legacy reset. So we need to preserve the values that were set
> from psci-reboot-mode.
> 
> Did not understand the proposed suggestion in above usecase. Need more input
> on this.

I explained above. The reboot mode driver sets the command to carry out
depending on the string coming from user space and whether PSCI supports
SYSTEM_RESET2 or not.

> --
> 
> One other option is to have a restart_notifier in psci-reboot-mode, with
> lesser priority than psci_sys_rest and then handle all the case including
> panic and sys_reset2.

No.

Thanks,
Lorenzo

