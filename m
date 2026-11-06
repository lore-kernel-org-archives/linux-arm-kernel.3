Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912B606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h0Xg8s9N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sK1wlGG6YmCD8beXerpELaLtfG4Jd+kTnPVd1L2se3g=; b=h0Xg8s9NsDz2rl1GfdFNOFxhal
	0KgU285qtwK2lK1E/tRyzYYFW5q5P6JSQq/PiFyL22IibMUU55cOwgw3oO9uJ175n4M4ON2okTUY3
	1ljhHFHU2xEU0R/xM0ev99bwW18achQaXGP6o5OX6cBgNGuaUMbN419gC3MZzHhDuMjyHl7X76Tlb
	prSm/oWFskhx/MG9pM6Ko8c5mRLSWlUSgm+GESJmcdd3SAQfzbBiibnysJQLvP4RBHykMWTQXq0lB
	a1OaaoLbIA2ixa3hGTVzMo2wRS80luih37xhuswOra+4qrjuOorR3Ef2fr4mDlgJvyDgcH1pM02Br
	sDBEh6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE26-0000000BON1-0n7M;
	Fri, 06 Nov 2026 07:06:42 +0000
Received: from out28-107.mail.aliyun.com ([115.124.28.107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE23-0000000BOLb-16j9;
	Fri, 06 Nov 2026 07:06:41 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1986584|-1;BR=01201311R191S09rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00258762-0.000171821-0.997241;FP=7888863433177527972|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jy2.91t_1793948790;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.91t_1793948790 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:30 +0800
From: Wang Xiaolei <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pinctrl: bcm: Fix fsel_get() and use generic dt_free_map
Date: Fri,  6 Nov 2026 07:06:25 +0000
Message-Id: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_230639_459586_71F5967A 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series contains one fix and two cleanups for the Broadcom pin
controllers.

Patch 1 fixes an off-by-one and out-of-bounds read in the STB pin
controller driver that was added in v6.18. The FSEL register field is
a 1-based function number -- 0 means GPIO, 1..n_funcs select
funcs[0..n_funcs - 1] -- but brcmstb_pinctrl_fsel_get() uses the raw
field value as a 0-based index into funcs[]. Every readback is
therefore shifted by one entry, and the value 8, which
brcmstb_pinctrl_fsel_set() accepts as the eighth alternate function,
reads funcs[8] and trips KASAN when the pin state is printed through
debugfs.

Patches 2 and 3 replace hand-written dt_free_map callbacks with
pinconf_generic_dt_free_map(). Both drivers already call
pinconf_generic_dt_node_to_map_*() for dt_node_to_map and already
select GENERIC_PINCONF, so the generic helper is the matching
counterpart, and the open-coded free loop just duplicates what
pinctrl_utils_free_map() already does. No functional change is
intended for the map types the existing device trees use.

Patch 1 was tested on a Raspberry Pi 5 with KASAN enabled. Before the
change, writing "gpio45 alt8" to pinmux-select and then reading pins
triggers a global-out-of-bounds splat in brcmstb_pctl_pin_dbg_show();
after the change the same sequence reports "function spi_m" without
a warning, and a register field value of 0 reports "gpio".

The series is based on v7.4-rc1 and has no inter-patch dependencies.


Wang Xiaolei (3):
  pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
  pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm2835
  pinctrl: bcm: Use pinconf_generic_dt_free_map in brcmstb

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 16 ++--------------
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 26 +++++++++++---------------
 2 files changed, 13 insertions(+), 29 deletions(-)

-- 
2.34.1


