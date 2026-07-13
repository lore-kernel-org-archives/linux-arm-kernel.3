Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D050AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGgu+CaOtcKoy1gxSjcO4Zf6uMbnGEq/XPb9LJCgoJk=; b=anyNDuHuM58Dsd8ne/SVDNL0EG
	9dyELaJFDK75wQfhqdZ8e+XZmD4S2SzRxQn0rilcGYKFrg4+EjcSsHc9tUSuG8bu9KBemiGwDsRSN
	v+RYoeH3fzs8B6tKTr0h4r7nX0u6cuolQux37C679faL95mp8wNVuvSUPhDiodDAYKCQBjfXvnQD3
	5YQqdPSBDXSmhhDna2GMn4Hw8w8Y+MlDGCI2yq64fmTcNURXK9b+B/j82OQSafV54ArOg342KJMAc
	e1w315H0lkChJt+Yf/Z+o39cjNfDH84nGe2nxiMmAgnsIxMK3MMffPlpuxLwjylo/ReNCguYhk1NO
	gPAcic4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ7B-00000009tTZ-3Zvw;
	Mon, 13 Jul 2026 16:02:41 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ77-00000009tS3-0MGg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:02:39 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 910343DFC;
	Mon, 13 Jul 2026 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783958555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGgu+CaOtcKoy1gxSjcO4Zf6uMbnGEq/XPb9LJCgoJk=;
	b=kMVA4bcUNX22GtjClknA4KZ3fswlnAFGsZYKs0uwwH1VrgIL2+ORMYrArV9ujyIHjLC14k
	SGzvcu7HbBhHWN3bF1cRKzrIUtBwRshU0nLnAUSCR4N93D05xfgHrEr3NmSSTo6/qlTgxx
	vtdSZBsuWczRq9NBJphkoevwqZ5skDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783958555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGgu+CaOtcKoy1gxSjcO4Zf6uMbnGEq/XPb9LJCgoJk=;
	b=dcZw7hjAGevDvneRyQ1wY82SJEjy1wW1W8fPidRDgniuImvtEZ/Wrgnx6psFw+vUq4sEPB
	WZrd8C20us+TxLBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FaH+x4J9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1sRd/hFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783958553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGgu+CaOtcKoy1gxSjcO4Zf6uMbnGEq/XPb9LJCgoJk=;
	b=FaH+x4J9MKhf1OgVVyTDE0Yl+c5P1Q7hpBjJ7kAFs0XsGN2gTO5a9BjxDXnL3r/gA5NsRj
	oCLkzRFVhAk5DNDGmMYRazGe7bYWoTpftPK1DWs+1hxSs7mN9y0usho/1Xf2Xuenoev8yW
	CaWVqK+NqdKRwSW1LUsivR1ZB5uBPgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783958553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGgu+CaOtcKoy1gxSjcO4Zf6uMbnGEq/XPb9LJCgoJk=;
	b=1sRd/hFCLT/gl1Z2ed/ali1OABoveak0agl2hPKbpsb6FYMjd5wsFLj8zcpuLkulfyZgfs
	97P2c2Q7xYgWMOCA==
Date: Mon, 13 Jul 2026 18:02:32 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com,
	Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Arm Live Firmware Activation (LFA) support
Message-ID: <alUMGCJzVG6U3Ggm@kunlun.suse.cz>
References: <20260706134455.132091-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.99 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:url,suse.de:dkim,kunlun.suse.cz:helo,kunlun.suse.cz:mid,opencompute.org:url]
X-Spamd-Bar: +++
X-Rspamd-Queue-Id: 910343DFC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_090237_424120_6EF78299 
X-CRM114-Status: GOOD (  42.24  )
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

On Mon, Jul 06, 2026 at 03:44:40PM +0200, Andre Przywara wrote:
> Hi all,
> 
> this is version 3 of the Live Firmware Activation kernel support. The
> device part of the code now relies on Aneesh's SMCCC bus patches[1],
> which solves some problems rather nicely. I also added the formerly
> missing sysfs ABI documentation. Based on v7.2-rc1, plus the first
> two patches from Aneesh's series. More detailed changelog below.
> ==============================
> 
> This series implements the kernel side support of the Arm Live
> Firmware Activation (LFA) specification [2]. LFA enables the activation
> of updated firmware components without requiring a system reboot,
> reducing downtime and allowing quicker deployment of critical bug fixes
> in environments such as data centers and hyperscale systems.
> It requires explicit firmware support, both via an agent running in EL3
> (for instance in TF-A, already merged), but also in the firmware
> component to be activated. TF-RMM recently merged support for this.
> 
> Unlike the usual firmware update process (which may use tools like
> fwupd), LFA focuses solely on the activation of an already updated
> firmware component, called "pending activation" in LFA lingo. This works
> by signalling the LFA agent (part of the EL3 runtime firmware) via an
> SMC call, which then does the heavy lifting of the live update, in
> cooperation with the to-be-updated firmware component.
> 
> Key features of the driver:
> * Detects LFA support in system firmware (EL3).
> * Lists all firmware components that support live activation, identified
>   by their GUID.
> * Exposes component attributes (e.g., activation capability, and
>   activation pending) via sysfs under /sys/firmware/lfa/<GUID>/.
> * Provides interfaces to:
>   - Trigger activation of an updated firmware component.
>   - Cancel an ongoing activation if required.
> A more detailed list of features can be found in patch 2/8.
> Based on v7.2-rc1.
> 
> This work is conceptually similar to Intel’s Platform Firmware Runtime
> Update and telemetry (PFRUT) [3] and TDX module updates [4], but
> targets Arm platforms. The driver has been used to successfully activate
> a Realm Management Monitor (RMM) firmware image in a controlled test
> environment. RMM is analogous to Intel’s TDX module.
> 
> There is effort on similar work from the OCP [5]. Future work may
> include integration with utilities like fwupd to automatically select
> the appropriate driver, based on platform architecture, for Live/Runtime
> firmware updates.
> 
> Please have a look, test and comment!

Hello,

booting a kernel with v2 of this patchset applied the module does not
get autoloaded. Loading it manually I get

[ 1972.957282] [   T5195] Arm LFA: Live Firmware Activation: detected v1.0
[ 1972.958620] [   T5195] Arm LFA: registered LFA ACPI notification

Is this expected?

I would expect the driver to load automatically.

I do not see anything in the v3 changelog obviously addressing
autoloading but changing to using a bus might affect that.

I will try to update to v3 later.

Thanks

Michal


> 
> Best regards,
> Salman and Andre
> 
> Changes in v3:
> - change node name in DT binding example
> - move SMCCC function identifiers into generic SMCCC header
> - rework to use the new SMCCC bus instead of a using a faux device
> - add missing workqueue cleanup in probe() routine
> - squash former patch v2 3/8 into base patch
> - use get_image_name() more consistently
> - also consider -LFA_BUSY return in activate call
> 
> Changes in v2:
> - restrict build to arm64 (the LFA spec only supports AArch64)
> - rename and extend central data structure to fw_image
> - use separate GPR register sets for some SMC calls
> - provide wrapper for error messages to prevent out-of-bound access
> - return GUID in the "name" sysfs file when image is unknown
> - fix wrong attribute in pending version number show function
> - add missing include files and order them properly
> - fix memory leaks in error cleanup paths
> - handle lifetime using embedded kobjects and a kset
> - drop global lfa_lock, use kset list lock and kobject refcount instead
> - add DT binding documentation
> - add timeout and watchdog re-arming (contributed by Veda)
> - relax timeout period and do not block while waiting
> - register ACPI notification (contributed by Veda) and DT interrupt 
> - refactor ACPI notification code to allow sharing with DT code
> - use faux device instead of platform driver
> - add auto_activate file to control automatic activation
> - introduce rwsem mutex to prevent using stale sequence ID
> - use labels and goto instead of infinite loop when retrying activation
> - initialise workqueue only once (thanks to Nirmoy)
> - various cleanups on reported messages and code formatting
> - rebase on top of v7.0-rc1
> 
> Changes in v1:
> - Updated SMCCC version 1.1 to 1.2 per the LFA specification requirement.
> - Changed "image_props" array to a linked list to support the dynamic
>   removal and addition of firmware images.
> - Added code to refresh firmware images following a successful activation.
> - Added a work_queue to handle the removal of firmware image attribute
>   from it's respective kobject "_store" handle.
> - Refactored prime and activate into separate functions.
> - Kernel config for LFA now defaults to "y" i.e. included by default.
> - Added individual kernel attribute files removal when removing the
>   respective kobjects using kobject_put().
> - mutex_lock added to activate_fw_image() and prime_fw_image() calls.
> - Renamed create_fw_inventory to update_fw_image_node.
> - Renamed create_fw_images_tree to update_fw_images_tree.
> - Added two more attributes due to specs update from bet0 to bet1:
>   current_version: For retrieval of the current firmware's version info.
>   pending_version: For retrieval of the pending firmware's version info.
> - Minor changes such as, improved firmware image names, and code comments.
> - do...while loops refactored to for(;;) loops.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260611130429.295516-1-aneesh.kumar@kernel.org/
> [2] https://developer.arm.com/documentation/den0147/latest/
> [3] https://lore.kernel.org/all/cover.1631025237.git.yu.c.chen@intel.com/
> [4] https://lore.kernel.org/all/20250523095322.88774-1-chao.gao@intel.com/
> [5] https://www.opencompute.org/documents/hyperscale-cpu-impactless-firmware-updates-requirements-specification-v0-7-9-29-2025-pdf
> 
> Andre Przywara (5):
>   dt-bindings: arm: Add Live Firmware Activation
>   firmware: smccc: lfa: Add auto_activate sysfs file
>   firmware: smccc: lfa: Register DT interrupt
>   firmware: smccc: lfa: introduce SMC access lock
>   firmware: smccc: lfa: add sysfs ABI documentation
> 
> Salman Nabi (1):
>   firmware: smccc: Add support for Live Firmware Activation (LFA)
> 
> Vedashree Vidwans (2):
>   firmware: smccc: lfa: Add timeout and trigger watchdog
>   firmware: smccc: lfa: Register ACPI notification
> 
>  Documentation/ABI/testing/sysfs-firmware-lfa  | 106 ++
>  .../devicetree/bindings/arm/arm,lfa.yaml      |  45 +
>  drivers/firmware/smccc/Kconfig                |  10 +
>  drivers/firmware/smccc/Makefile               |   1 +
>  drivers/firmware/smccc/lfa_fw.c               | 988 ++++++++++++++++++
>  drivers/firmware/smccc/smccc.c                |   5 +
>  include/linux/arm-smccc.h                     |  15 +
>  7 files changed, 1170 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-lfa
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>  create mode 100644 drivers/firmware/smccc/lfa_fw.c
> 
> 
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> prerequisite-patch-id: 64fa2209c9eee2084861ba13f0bdfdac312b19b0
> prerequisite-patch-id: fe1ca1a9aeb94623c79bf66366c76bfb8645b581
> -- 
> 2.43.0
> 
> 

