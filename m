Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FF8CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGCE+GIR0LXiwiX5CQOxN7Sufeyaet5NHHzwHWFRcAs=; b=xaVX5gaw/LXx7qVbsENn/zBvWW
	kMr5X7mvOQ1pFZ88T4+q5dAUPC3aJ3qSzpsJPM9mlLckOcYt0kovs9OpHzppXrKupfZX8mwFbBNsb
	pA5rHPwm5OtLZYzDYyr5zp9C7yxa6Jgp7SQvtBOgeB7jojm7BR9K2eky+qvD9f+X45t7WbFgZ3+MU
	AHqpgWvLJOemsX4gNC2tmWcg1uvj1IRSJBaeJl7quuPhP2rHlM6Sog8sENTRI4YuKwllRITKlsMm1
	yPC8cxZeO7288hymExY/GKqjS2wjakS/DNJwlk8qaW8KIBSIwfq3n9FyyUYM3dIm2BZJW/03a2/0w
	1d56DjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWdY-00000005yb3-15hE;
	Mon, 10 Nov 2025 18:29:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWdW-00000005yaT-0ghp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 18:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A4BA43443;
	Mon, 10 Nov 2025 18:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63A2C4CEF5;
	Mon, 10 Nov 2025 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762799345;
	bh=u9Jb89JkKBZeEXePVaq8UqB4TuhULaWnLyCjR38ppvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmdgkZUwBErlZ4R16rraci9mo0wDpQbaUlJ80M2tD0YhX2zZBk4FM55WGhg6jopmP
	 8TLIN7zJLQlkoApbwuqW02D6rWpvDo6pZcGSVwrqJ+OTOOZaFw477qCXI6ekqSD1wk
	 DAtMwRluIYZ2U1Uaz9xCCWzihVzLJH49FMJN77vrbtb4tvcilMbPkfiZng/AERMyb7
	 5pz8cAXv+gchZkSZRd34XnFwevKx+uRiARAzJbM3yYR4oS7zLY5zizhkSURATxvYST
	 1e/WDB6iTHrIsA757VXJ91Xey3mb7tPLIdrc9Hpg+xcEzyEevI13Vnwndb0fU+oeI2
	 8n/sodalpELIA==
Date: Mon, 10 Nov 2025 12:33:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Moritz Fischer <moritz.fischer@ettus.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
	Xin Liu <xin.liu@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Umang Chheda <umang.chheda@oss.qualcomm.com>, Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v17 03/12] power: reset: reboot-mode: Add support for 64
 bit magic
Message-ID: <zejaqakbtufwzlzs7xc7xzxezcylqjkmu4nne2mro4riuhgbkc@hlgu3u2w36bb>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-3-46e085bca4cc@oss.qualcomm.com>
 <20251110134529.uljjqzb3vhda3vya@hu-mojha-hyd.qualcomm.com>
 <gzj4r4elqewjt2gjzhuamslvobz5fgyvt672brwknoozlsplaq@wsebzmi2l6pc>
 <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <681a72ba-d8fb-bfc2-d2bb-d80ac667bc5c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_102906_264847_9EBAF2BA 
X-CRM114-Status: GOOD (  27.05  )
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

On Mon, Nov 10, 2025 at 11:22:40PM +0530, Shivendra Pratap wrote:
> 
> 
> On 11/10/2025 10:00 PM, Bjorn Andersson wrote:
> > On Mon, Nov 10, 2025 at 07:15:29PM +0530, Mukesh Ojha wrote:
> >> On Sun, Nov 09, 2025 at 08:07:16PM +0530, Shivendra Pratap wrote:
> >>> Current reboot-mode supports a single 32-bit argument for any
> >>> supported mode. Some reboot-mode based drivers may require
> >>> passing two independent 32-bit arguments during a reboot
> >>> sequence, for uses-cases, where a mode requires an additional
> >>> argument. Such drivers may not be able to use the reboot-mode
> >>> driver. For example, ARM PSCI vendor-specific resets, need two
> >>> arguments for its operation – reset_type and cookie, to complete
> >>> the reset operation. If a driver wants to implement this
> >>> firmware-based reset, it cannot use reboot-mode framework.
> >>>
> >>> Introduce 64-bit magic values in reboot-mode driver to
> >>> accommodate dual 32-bit arguments when specified via device tree.
> >>> In cases, where no second argument is passed from device tree,
> >>> keep the upper 32-bit of magic un-changed(0) to maintain backward
> >>> compatibility.
> >>>
> >>> Update the current drivers using reboot-mode for a 64-bit magic
> >>> value.
> 
> [SNIP..]
> 
> >>> +	if (magic > U32_MAX)
> >>> +		return -EINVAL;
> >>> +
> >>> +	magic_32 = magic;
> >>> +
> >>>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
> >>>  
> >>>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> >>> -				 syscon_rbm->mask, magic);
> >>> +				 syscon_rbm->mask, magic_32);
> > 
> > As above, if we're no longer silently discarding bits, I think we should
> > compare the magic against syscon_rbm->mask.
> > 
> > No need for a local variable, just type cast after checking the validity.
> 
> Trying to summarize below why we added these check-
> 
> the patch in v11 used typecasting and did not have any of these checks(link below):
> https://lore.kernel.org/all/20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com/
> 
> As per below upstream review, type cast was removed and bound checks were added all-over patchset:
> "As a general rule of thumb, code with casts is poor quality code. Try
> to write the code without casts." - 
> https://lore.kernel.org/all/8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch/
> 
> We can revert to the typecast way. Please suggest.
> 

Okay, I'm okay with Andrew's original request, stick to that for the
nvmem case. Although I don't fancy the name "magic_32", and would prefer
that you just call it "value" or something.


For pon and syscon however, I'm wondering why you have ignored Andrew's
other request from that same email:

"""
You might be able to go further, and validate that magic actually fits
into the field when you consider the << pon->reason_shift.
"""

Writing "if (magic > U32_MAX)" in a snippet of code where magic isn't
allowed to be more than either 32 or 64 is misleading.

For syscon, it's true that the parameter is an unsigned long, but the
actual limit better be based on syscon_rbm->mask.

Regards,
Bjorn

> thanks,
> Shivendra

