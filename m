Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41135C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=; b=pq277L2feawt2Hl+WeHjGvFoYC
	CXn8DriebzJnU3s231wqOtMWp3M0Jp7J3DOCsMeA3ORxV+lwPBJgOegwk8H+DEsn1ieoEr9MvUC23
	5cJ9JrGrf37hsgq5JnxZb8bEPE8c+yOEf5CvGz9gSOSs/npIzVXtKn4iKxFPm174hfJ/YKatX+6bg
	PTKgW25+lbcen29NzUrZqKIyUWvT34bRDMmVKhxlkx/9i+xE6/PW1HeQSCoj0MOzwniiOIUJVw/5Z
	kmf9GyJjPJcCRJ3HUeROPydv824SB3t/H+vH/pZyzaPMn8ai99PPR4DR5AnJtw0+8rYamCBz1xnfW
	ZyGhvdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaXK-00000004QN5-3euB;
	Tue, 15 Jul 2025 07:57:14 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaSz-00000004PQ8-14OP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 07:52:46 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AB6321245;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=kZ/UclzfjvwSMWC1ieUIfNIBUv1PXi9uLsAsz1QqFi7H3drNqIwxZpSu0DqVWL3EEbsk/5
	KoQ8RAidcHC801777sqHTIaxXRYev/9YGk6WzPauwmEkbtGkQZjWojzJii20tb+dDvt1Q1
	dN1Xa+S7uEB+PwFVRewKt2b/NVBALQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=E6QZLQBM38B5BJa1LG6Argk5RQluHRvajhaIAaujVkj2UsTH89Zi3Bt0tmPWuqtVXKEChg
	7n6XF4k/PbdZfQCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752565962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=kZ/UclzfjvwSMWC1ieUIfNIBUv1PXi9uLsAsz1QqFi7H3drNqIwxZpSu0DqVWL3EEbsk/5
	KoQ8RAidcHC801777sqHTIaxXRYev/9YGk6WzPauwmEkbtGkQZjWojzJii20tb+dDvt1Q1
	dN1Xa+S7uEB+PwFVRewKt2b/NVBALQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752565962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=102czK2bX3cmqlSriVXsJ2M0mtJ3UQcTGi9fuVH3TZI=;
	b=E6QZLQBM38B5BJa1LG6Argk5RQluHRvajhaIAaujVkj2UsTH89Zi3Bt0tmPWuqtVXKEChg
	7n6XF4k/PbdZfQCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1287713A68;
	Tue, 15 Jul 2025 07:52:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nfH5AsoIdmjnSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Jul 2025 07:52:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix HD-audio default kconfigs in arm and mips
Date: Tue, 15 Jul 2025 09:51:20 +0200
Message-ID: <20250715075237.28476-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_005245_439894_48606306 
X-CRM114-Status: GOOD (  10.36  )
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

The upcoming reorganization of HD-audio drivers for 6.17 kernel broght
some changes in Kconfig, and we need to update the default kconfigs in
arm and mips to follow that.

It's for-next branch of sound git tree, to be included in 6.17
kernel.


Takashi

===

Takashi Iwai (2):
  arm: multi_v7_defconfig: Update HD-audio configs
  mips: loongson3_defconfig: Update HD-audio configs

 arch/arm/configs/multi_v7_defconfig   | 5 ++++-
 arch/mips/configs/loongson3_defconfig | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.50.1


