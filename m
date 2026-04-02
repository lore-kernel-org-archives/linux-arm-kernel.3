Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D1CC6B02
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pssyYGpmcMDITeJql5XIx2lmyOqjHKa/++zlF/mlDic=; b=cnYJhsoCUQHoyQnL6bnk0Pl8JC
	spqkmeeCRinFALHxjHx4l3buFS3k3/HPZ5H+6UDeyRy4gsQCNTybyLxKbNCk67FsJKeB4nM6VUH6j
	60fay8GvJlu9d34rzYtlWN3fBpIpUJ7gLN8fB3Z32T2dCq2R4Eqc/Puoh9MCI5oB0urvaWIicCz2K
	kjIBRNzCesN89hEoTR+PmtJ3R5NSB3ec61ODtK5LWaXzAvN36WNFa1NqLZ8p+CNu/q+9LVPmYp5ja
	ut/GIBPWl/Rs0QYim+4R056H3LeNd1wlSjnG7Vh3qYADhx3Y4OBnjGHZeGKof4Vq0YDuCQzDxqgjq
	LRj1sweg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JX0-00000000PWe-2KsU;
	Thu, 02 Apr 2026 15:00:26 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JWt-00000000PP3-2kFI;
	Thu, 02 Apr 2026 15:00:21 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 7CEE01D00338;
	Thu,  2 Apr 2026 11:00:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 11:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775142015;
	 x=1775228415; bh=pssyYGpmcMDITeJql5XIx2lmyOqjHKa/++zlF/mlDic=; b=
	Emkb4mKQv2pBI4JjvrWZmiej12xItuHlLguR/vqsF4ZTCFG+djscA3RwnCCa6Oqk
	mGq6fP5v8RB+XNo2yCiZtaZyF9pdoImGBOBrlzdZdotMsP1B/W618wH3iVEht3tg
	pfldlySalgH49WUOfN0Q6hTFQQIDgbB1jNhjyb4+dXVIc8J8DXorSY19ghMUps3K
	3kchYP8VyAPPUGc5kXGo6epZiHgin6VNHMLkxVuF4CA7uB91zcKG4uhphBy1PRRo
	ke3mM2WS7CfJWguxEgdXPixE3XPFC8NPXIzBERszpCagJJruBe4okwqe1PQ7n92R
	8onul8jeFbhj4WK4ZTjUjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775142015; x=
	1775228415; bh=pssyYGpmcMDITeJql5XIx2lmyOqjHKa/++zlF/mlDic=; b=C
	xcCtsyCWad0b7tPGSOFsqplJcE+HquTY9fiRDyog1ZnP0RyEOe0OJ81j7OSXV9n3
	kElz8MHnjGtOnS/XPHVSdEtBpBm2GNvdJHYaKSTHocYKAMN1gPR/FCjEfJgtMSWM
	tTxTzGKApYmnDRp0e3PLjH1kiXNDcRE5+G0PmFNSQ6WJFziv7NTfYaWLX7+btrMf
	iNWrMlPa1WnH0g1tycJ35gyJbiWxamhwRlUQ049ufwlYKgMpjxV61BUwkTyufeDB
	aAx7LCLWSOZvQv9sujkCYIkaNj0k+XBWUD9aZl8SQEfEMVq+EyzuOQWGI/W6YgEa
	Z0igxAbFbCfOd1yIruPwg==
X-ME-Sender: <xms:foTOaY4Fm_g3QZ76mmsBynPE7SHBsfNuP_mBmkqQHJ_OxQPDpbq85g>
    <xme:foTOaUvFdT8O7_sqcjzTqLdJltwAxnPTR7_wo2iIgrU1y8ImVSFZ1EZqLeiCs_pWf
    fPxZl6tlHrmjSMnIJiSHdk6bXAxurcbakCjWmAeFw15DH6MBLXwqNPy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlih
    gvugesghhmrghilhdrtghomhdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhr
    tghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhgvnhhhuh
    grtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepfigvihdrlhhiuheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepihhlihgrshdrrghprghlohguihhmrghssehlihhnrghrohdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhm
X-ME-Proxy: <xmx:foTOaQDgmwNtb_d4pYFIDoo1CNK_HkrBIx2bnzxua9Ubpn-pkWS5Aw>
    <xmx:foTOad9x5xOAq8wlo-iVzSKVbQXvcB5bEsoVBAaM3TSZyL34wd15fQ>
    <xmx:foTOaST8XhWPRBAMq1wJvzYiMwtgZG2XOBcrN8e9eNNOYcm4DwBVHA>
    <xmx:foTOaT7iy3G9XhuHXObB1084AYWscFLTcO4XzqiJYBJtrX3l2Saj-Q>
    <xmx:f4TOacnM7-O8MPwR8jWy0xn0FAt4orE8mfhFCSjxO3ToReT2gITeUJro>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 38C8970006A; Thu,  2 Apr 2026 11:00:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ATYY62_w4Fts
Date: Thu, 02 Apr 2026 16:59:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, longli@microsoft.com,
 "Helge Deller" <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Message-Id: <d3d7c545-3b07-4881-a16d-45b6f039de19@app.fastmail.com>
In-Reply-To: <3e466158-c2e5-4e23-934f-dcdbb71ad41f@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-4-tzimmermann@suse.de>
 <78f76717-8f1e-41d6-92f7-261df96b84b6@app.fastmail.com>
 <3e466158-c2e5-4e23-934f-dcdbb71ad41f@suse.de>
Subject: Re: [PATCH 3/8] firmware: sysfb: Make CONFIG_SYSFB a user-selectable option
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_080020_048131_FD5EA05B 
X-CRM114-Status: GOOD (  21.49  )
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

On Thu, Apr 2, 2026, at 16:10, Thomas Zimmermann wrote:
> Am 02.04.26 um 15:08 schrieb Arnd Bergmann:
>> On Thu, Apr 2, 2026, at 11:09, Thomas Zimmermann wrote:
>> I don't really like this part of the series and would prefer
>> to keep CONFIG_SYSFB hidden as much as possible as an x86
>> (and EFI) specific implementation detail, with the hope
>> of eventually seperating out the x86 bits from the EFI ones.
>
> You mean, you want to use the EFI-provided framebuffers without the 
> intermediate step of going through sysfb_primary_display?
>
> In that case, CONFIG_SYSFB would become an x86-internal thing, right?

The part that is still needed from sysfb is the arbitration
between DRM_EFI and the PCI device driver for the same hardware,
so I think some part of sysfb is clearly needed, in particular
the sysfb_disable() function that removes the EFI framebuffer
when there is a conflicting simpledrm or hardware specific
driver.

The parts that I want to keep out of that is anything
related to the x86 boot protocol, non-EFI framebuffers,
text console, and kexec handoff, which we don't need on
non-x86 UEFI systems.

I don't mind the idea of having a sysfb_primary_display
in the EFI code if that helps keep EFI sane on x86,
but it would be good to make that local to
drivers/firmware/efi and (eventually) detached from
include/uapi/linux/screen_info.h.

>> In general, I am always in favor of properly using Kconfig
>> dependencies over 'select' statements, for the same reasons
>> you describe, but I don't want the the x86 logic for
>> the legacy VESA and VGA console handling to leak into more
>> architectures than necessary.
>>
>> Do you think we could instead move the sysfb_init()
>> function into the same two places that contain the
>> sysfb_primary_display definition (arch/x86/kernel/setup.c,
>> drivers/firmware/efi/efi-init.c) and simplify the efi version
>> to take out the x86 bits? That would reduce the rest
>> of sysfb-primary.c to the logic to unregister the device,
>> and that could then be selected by both x86 and EFI.
>
> No, I'm more than happy that sysfb finally consolidates all the 
> init-framebuffer setup and detection that floated around in the kernel. 
> I would not want it to be duplicated again.
>
> For now, we could certainly keep CONFIG_SYSFB hidden and autoselected. 
> Although I think this will require soem sort of solution at a later point.

Can you clarify which problem you are trying to solve
with that?

     Arnd

