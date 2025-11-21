Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF7CFC279
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=; b=kbv8EFe3AeT5Mn99N0NqAEecxm
	O6CdG55mIvMm1HnWMRdAEEOS/9dz1Psc/TMi0lHcbD3374dGAJnWcsMdJK11c1cej85f7UG62ti1e
	skrWpsrAnVhbT9lsPuATlF6DPonIr/P9SzwO8lZOkQgtBfy3C2a0UvFWLMF9RHlVEMzAMHfwoSsxC
	93MOIarP5xDVIagay1ky3GWpslFbPmLOqYKOPtLsD3jjHbFWdLGhuBbGUCDXEzoplQJ/ugX4Do9UA
	0gmyuw7w9K7fiBd//6HxfQUzhDc+KOltMrh/sXEsLbMAwWaUr63eW9YLVKcjDpYIg+DDwEhYh6Qd1
	EIe/1RDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRcs-00000008T7l-2LmM;
	Fri, 21 Nov 2025 13:56:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRcq-00000008T73-2iqR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Nov 2025 13:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=; b=evhGSDsl7CFXIHT2zhAUcLdxZR
	JTuVF+hJiDfIix6SmBWlU4i4kwrhTyjxAM4vhRWnvVm8cJMD4eFGGb1vbfQQcxx+jucxKfVJeGeQQ
	qebZnhA1te/VAAVpzhZKpgFsxISos6qAQYI8lyNBxkw82uO7PKdQSwUjjNCM6lM0GwkbB1DsIP/oY
	XfdT3/tWc36kUMA7tV8J09Q8TfE0at0QWa9jmPXzpT6XuCzxkBoE0oKswOUJU5oZBkuN6s3X/vtrx
	ze5CSz/9KPSAOVVUwCmkwmCp2tfEpZhzkINBL0JqI5wD4nQZ/wGTrN5pUQiPiVfPSpzVnC1lgNPfq
	DtXE1YQQ==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQlB-0000000Gtvb-0iDW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:01:11 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28247218EA;
	Fri, 21 Nov 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763733391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
	b=iMKPWBQ2/YHLmQOMzgxyhZgL0qVKiRCtXOcpIhrGmp/kgyxlmA98lsYRipa9vkpslgCdGp
	KdwVujc9na0fwt4t97s6rd4OfBWKtXmh/kRfine8gwUkvhtdVbu9uNgzcGm9EhYGSdMrV1
	YEibxSNMD8K3yNpaFCBYQBYvBRpv3Ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763733391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
	b=Abyw+g0jyRAdyZfxtFfsshAV0j5bGUOXfi7JyQENaF5nTh7i2CQVizKVX7OXJuuSarUXYD
	zmJth7/Q/teZsWBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iMKPWBQ2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Abyw+g0j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763733391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
	b=iMKPWBQ2/YHLmQOMzgxyhZgL0qVKiRCtXOcpIhrGmp/kgyxlmA98lsYRipa9vkpslgCdGp
	KdwVujc9na0fwt4t97s6rd4OfBWKtXmh/kRfine8gwUkvhtdVbu9uNgzcGm9EhYGSdMrV1
	YEibxSNMD8K3yNpaFCBYQBYvBRpv3Ss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763733391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2fy6AJV5/LJmpRrj1RphVCyLdSqiM/Tki+XKx37wkHU=;
	b=Abyw+g0jyRAdyZfxtFfsshAV0j5bGUOXfi7JyQENaF5nTh7i2CQVizKVX7OXJuuSarUXYD
	zmJth7/Q/teZsWBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B94E83EA61;
	Fri, 21 Nov 2025 13:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TzTPK45vIGkqdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 13:56:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] arch,sysfb: Move screen and edid info into single place
Date: Fri, 21 Nov 2025 14:36:04 +0100
Message-ID: <20251121135624.494768-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28247218EA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_130109_335222_D1B4AF4A 
X-CRM114-Status: GOOD (  12.89  )
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

Replace screen_info and edid_info with sysfb_primary_device of type
struct sysfb_display_info. Update all users.

Sysfb DRM drivers currently fetch the global edid_info directly, when
they should get that information together with the screen_info from their
device. Wrapping screen_info and edid_info in sysfb_primary_display and
passing this to drivers enables this.

Replacing both with sysfb_primary_display has been motivate by the EFI
stub. EFI wants to transfer EDID via config table in a single entry.
Using struct sysfb_display_info this will become easily possible. Hence
accept some churn in architecture code for the long-term improvements.

Patches 1 and 2 reduce the exposure of screen_info in EFI-related code.

Patch 3 adds struct sysfb_display_info.

Patch 4 replaces scren_info with sysfb_primary_display. This results in
several changes throught the kernel, but is really just a refactoring.

Patch 5 updates sysfb to transfer sysfb_primary_display to the related
drivers.

Patch 6 moves edid_info into sysfb_primary_display. This resolves some
drivers' reference to the global edid_info, but also makes the EDID data
available on non-x86 architectures.

The short-term benefit of this series is in patches 5 and 6. With
sysfb_primary_display in place a follow-up series will improve EFI support
for EDID as outlined in the series at [1] and [2].

[1] https://lore.kernel.org/dri-devel/20251015160816.525825-1-tzimmermann@suse.de/
[2] https://lore.kernel.org/linux-efi/20251119123011.1187249-5-ardb+git@google.com/

Thomas Zimmermann (6):
  efi: earlycon: Reduce number of references to global screen_info
  efi: sysfb_efi: Reduce number of references to global screen_info
  sysfb: Add struct sysfb_display_info
  sysfb: Replace screen_info with sysfb_primary_display
  sysfb: Pass sysfb_primary_display to devices
  sysfb: Move edid_info into sysfb_primary_display

 arch/arm64/kernel/image-vars.h                |  2 +-
 arch/loongarch/kernel/efi.c                   | 11 +--
 arch/loongarch/kernel/image-vars.h            |  2 +-
 arch/riscv/kernel/image-vars.h                |  2 +-
 arch/x86/kernel/kexec-bzimage64.c             |  4 +-
 arch/x86/kernel/setup.c                       | 16 ++--
 arch/x86/video/video-common.c                 |  4 +-
 drivers/firmware/efi/earlycon.c               | 42 +++++-----
 drivers/firmware/efi/efi-init.c               | 14 ++--
 drivers/firmware/efi/libstub/efi-stub-entry.c | 18 +++--
 drivers/firmware/efi/sysfb_efi.c              | 81 ++++++++++---------
 drivers/firmware/sysfb.c                      | 13 +--
 drivers/firmware/sysfb_simplefb.c             |  2 +-
 drivers/gpu/drm/sysfb/efidrm.c                | 14 ++--
 drivers/gpu/drm/sysfb/vesadrm.c               | 14 ++--
 drivers/hv/vmbus_drv.c                        |  6 +-
 drivers/pci/vgaarb.c                          |  4 +-
 drivers/video/Kconfig                         |  1 -
 drivers/video/fbdev/core/fbmon.c              |  8 +-
 drivers/video/fbdev/efifb.c                   | 10 ++-
 drivers/video/fbdev/vesafb.c                  | 10 ++-
 drivers/video/fbdev/vga16fb.c                 |  8 +-
 drivers/video/screen_info_pci.c               |  5 +-
 include/linux/screen_info.h                   |  2 -
 include/linux/sysfb.h                         | 23 ++++--
 include/video/edid.h                          |  4 -
 26 files changed, 177 insertions(+), 143 deletions(-)


base-commit: 57e807d4454add8b60e8807ad1cf812141f34cdb
-- 
2.51.1


