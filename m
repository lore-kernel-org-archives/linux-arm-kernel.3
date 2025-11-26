Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088FDD11182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=; b=NdoEO6ZIAh6dnmpjMxpe30Gl1E
	a4ITJDz9OxROCks3ArGXnLOWlHdpe/R9ve7ZjZNYDquCodvD9eEJhpjTHAuVHVkvWXP1Y68kfG3Io
	CZy6J/gYEsRmkNhCNFATaNmLlgr8U+llZMpgGviyBA2hznak38XdELMvcVMsM2gAMA9jTHwPhbvML
	WdTl/tpYm4o6WNBm1kpT8p6EdLS/Rt296OiW7jcs1UIKiIBkEAWE1fF/UDHdQsnyLa+DSDqw1VMlD
	tUpbYi79VIJTr8Zcnsmal9G/Q0KNtRWpoUG6rVBNu/vsPgF1nQd18VSyJVsA/xVRMpmgpIrxPianV
	l//0R3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI56-0000000FFSg-0J7n;
	Wed, 26 Nov 2025 16:09:24 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI4z-0000000FFLy-2P4D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:09:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EEA165BEB2;
	Wed, 26 Nov 2025 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=YIebGvX6MVunmhKbKAsNi+PxznaZ+5NUp3zAGhZScxBxELF9R9O/OVfiSeFcMrVt4oYyzc
	PLEvT0/q9Tg4ovZ6aN9p+q+dBAH6COLEF3PAGgCkgyawuYhnfYwaqPXRQaNxt01sFLbZQl
	p0j6zwTzPU6h4wpmKZ4u5ZPF4bxcM6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173341;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=dF+lI1okdyypxFxWlTgyW+nN+tUZZ7lcoWiV/fIqv5ExoMvUOf5y5UOXDR9M9swylj+kqF
	VqZn1UczVZVG4uBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QGiJn3kD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dVva07uz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=QGiJn3kD/FeBxgGWZAJaiznlfqFXD46IMlOmIVJ6sFxJWdTCApBkrTmRMITbEvn9Y9onS0
	WPmKhMPplKRUmBzzz86qW3DtmPOCqqZt/odXRorgfGxlNAYwAAccmK7zAqv0DELSny657N
	d4D6jslbOZc23s5NhS/2WQoV+PmO4fs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=dVva07uzPe/JQfQSPwGdnPsMHm837ZGVVMBumavAiogRp1Tj1Dp7w9fs4n9FnRhcXitdRh
	aB/RULljezUmTABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74F8D3EA65;
	Wed, 26 Nov 2025 16:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OB0hGxwmJ2lnIgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de,
	richard.lyu@suse.com,
	helgaas@kernel.org
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
Subject: [PATCH v3 3/9] sysfb: Add struct sysfb_display_info
Date: Wed, 26 Nov 2025 17:03:20 +0100
Message-ID: <20251126160854.553077-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EEA165BEB2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080917_770414_F15BC353 
X-CRM114-Status: GOOD (  12.60  )
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

Add struct sysfb_display_info to wrap display-related state. For now
it contains only the screen's video mode. Later EDID will be added as
well.

This struct will be helpful for passing display state to sysfb drivers
or from the EFI stub library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/sysfb.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 8527a50a5290..8b37247528bf 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/screen_info.h>
 #include <linux/types.h>
 
 #include <linux/platform_data/simplefb.h>
@@ -60,6 +61,10 @@ struct efifb_dmi_info {
 	int flags;
 };
 
+struct sysfb_display_info {
+	struct screen_info screen;
+};
+
 #ifdef CONFIG_SYSFB
 
 void sysfb_disable(struct device *dev);
-- 
2.51.1


