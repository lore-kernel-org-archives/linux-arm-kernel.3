Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE418C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=; b=uAcRrH9gT0VluUoCHU5YGEAbbX
	1xEwlQJHjfw9MOgTQwaWQ9z9L6+TG7Bw7pV0ZBon9c85/bVe1TzIILuUQr8qqpc8idzLfb7KrfNkI
	ImuIMHJA4R7cNHWjE15Sjfu1JsrAjWDmWC7ho4ZyP/+F+3YIBB7O07M4tDE84CBiJKKFdy2EfN5RN
	zDaoP77nYAPjbItpab6SaPhiX2N1McyKLk/nERW2IXmrMhfTLQkkT9/FgiJhX6VtQnEu8PBXOCuGx
	4+1ILukD/UDlVimZEPoxOKcD6gvmEPjvuegN2Vqf3f3LsPPSo0WdOrvnCHiH4fznYPlX6nWN6uPM8
	Jh4xq5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetvk-0000000F9Pt-37qQ;
	Mon, 03 Feb 2025 10:43:52 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgv-0000000F7Ou-190C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:34 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 610D72115F;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=0BPqwhReali1Kgk7afvprXocp6uKtXGAQkkNI1/z8YmSYQ35wCmTZt3HR1PYS6vKwsyexa
	R+c7ILz5W2lUey79wvlICZWkzhJu2QmldUsExeHjFVdbHCGRS7Iw+cGThkG6dzrvsbfqHs
	2C1bdH3XmIbpBOJyGrLEz3+KwFwdTuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=wAJdm17yhyvmcwtOZrS8YS3iUlSSp2l0LNgy9HpwoYgJp+SP3Kdiy3uYDrRkHrY+bSQCZi
	AT6hyF3IZXg8CLAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=KLkKU5Ea/cSCNQW9X7kyEccU2O7llJyKJFia/W8NxVjKDyApnmWvZ+30MNuoUXLonTKq2q
	q4awUEPEBFG+XBxhmzIBTBE9hVaYV8tGYp/w1GqhDdUw11PP70kCz2HOOTnPDZZfF08dt5
	L4NJCfi+ity91EWMTxSD2XsNrZY1oyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IlAMf3ARU8tF/BLlDqHKclMei8bgjGPPqVfDVtV7W/k=;
	b=EWzRnuZByfyd4DujPbuL7CxpPZZ4Sw4AkoF/qIW4cv8HmZTcigz/kAZeEWaN8Q1GlHUsDd
	qRKNRGNknVaEIbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 094ED13A96;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NOSxAEeaoGfwcwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 03 Feb 2025 10:28:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux@armlinux.org.uk,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] arm: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 11:26:34 +0100
Message-ID: <20250203102818.56747-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,samsung.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_022833_457326_1BF5CDD2 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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

Several source files for ARM do not require <linux/fb.h>. Remove the
include statements.

Thomas Zimmermann (2):
  ARM: spitz: Do not include <linux/fb.h>
  ARM: s3c: Do not include <linux/fb.h>

 arch/arm/mach-pxa/spitz.h                  | 1 -
 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 3 files changed, 3 deletions(-)

-- 
2.48.1


