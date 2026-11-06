Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC81606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sTmZLnn8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V5Lnobb+4I39QfB84s55NYKIPzzSfTvTzIQ5ko8LurA=; b=sTmZLnn8MecFoU
	jAZermY+4XHGIHDnBgzHUrzXea3Rf5EQlUYOgxgpYOLkhy0YI3URVwO8sk2CX6OPnD55n8QYzHicx
	k2IV4V1Sa77Tk3CNSHluwJ7uOYi02Vcz45ZUwzZ5WhYhCqnvSOQ8sAYDNRGoy5KmhbiX6aeqVtS3l
	RYROfJZ0QhA39tXhVBXbMbjPdVaV9KmRbCFkg5pG9zqA8a0BXJxeaxb2Xj3QZsUFn0IsCTKJNY7CV
	6RiqERzanHSwGcuY1T2TggJjx7b6AZadakBS00l0G7umVPWWuro/+9DmJo9WXjpmwfmTBMCBJrqlw
	7aQ2bhsDsnLaifFnrQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCx2-0000000BIpv-0qqT;
	Fri, 06 Nov 2026 05:57:24 +0000
Received: from hera.efm.de ([2001:67c:2dc4:3::227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCx0-0000000BImk-0B6S;
	Fri, 06 Nov 2026 05:57:23 +0000
Received: from hera.efm.de (localhost [IPv6:::1])
	by hera.efm.de (Postfix) with ESMTPS id 4BCA140C3D59A;
	Fri,  6 Nov 2026 06:57:15 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by hera.efm.de (Postfix) with ESMTP id 30EC6413304F4;
	Fri,  6 Nov 2026 06:57:15 +0100 (CET)
Received: from hera.efm.de ([IPv6:::1])
 by localhost (hera.efm.de [IPv6:::1]) (amavis, port 10026) with ESMTP
 id sFwEJI33bHUb; Fri,  6 Nov 2026 06:57:15 +0100 (CET)
Received: from tpx13-pf5nr32.fritz.box (ip-037-209-109-094.um11.pools.vodafone-ip.de [37.209.109.94])
	(Authenticated sender: ah@foundata.com)
	by hera.efm.de (Postfix) with ESMTPSA id 899CE40C3D59A;
	Fri,  6 Nov 2026 06:57:14 +0100 (CET)
From: Andreas Haerter <ah@foundata.com>
To: cnfourt@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	leon.yen@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	lucid_duck@justthetip.ca,
	matthias.bgg@gmail.com,
	mingyen.hsieh@mediatek.com,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	stable@vger.kernel.org,
	yu-ching.liu@mediatek.com
Subject: Re: [PATCH] wifi: mt76: mt7925: fix NULL dereference in CSA worker
Date: Fri,  6 Nov 2026 06:57:09 +0100
Message-ID: <20261106055710.222567-1-ah@foundata.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025140123.12056-1-cnfourt@gmail.com>
References: <20261025140123.12056-1-cnfourt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_215722_234222_26EA7464 
X-CRM114-Status: GOOD (  11.28  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 10:01:18PM +0800, Gris Ge wrote:
> Reproduced the panic by injecting CSA-less "abort" beacon, works well
> after patched.

I hit the same oops in normal use, with no injected frames, on a
ThinkPad X13 Gen 6 (MT7925, 14c3:7925) running Fedora's
7.2.14-200.fc44.x86_64, not tainted:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  Workqueue: phy0 mt7925_csa_work [mt7925_common]
  RIP: 0010:mt7925_csa_work+0x83/0x160 [mt7925_common]
  RAX: 0000000000000000 RBX: ffff8eeb5bbb3910 RCX: 0000000000000fa0

The code bytes decode to the dev->new_ctx load followed by the read of
def.chan for mt7925_set_roc(), and RCX holds the duration of 4000.

The access point announced a channel switch just after a roam:

  10:58:02.90  associated with the new BSS on 5180 MHz
  10:58:04.05  CTRL-EVENT-STARTED-CHANNEL-SWITCH freq=3D5180 (80 MHz)
  10:58:04.47  oops

It has happened once. Two earlier channel switches on this machine
completed normally, and the log does not show what tore the context
down.

The impact MAY be worth a line in the changelog. The oops lands between
mt792x_mutex_acquire() and the release, so dev->mt76.mutex stays held
for good. WiFi did not come back, and at shutdown wpa_supplicant,
NetworkManager, avahi-daemon and systemd-resolved all survived SIGKILL.
The machine needed a forced power-off, so the stable tag looks right to
me.

I read the patch against master and v7.2.14. The chanctx hunks apply to
v7.2.14 with an offset and mt7925_csa_work() is identical there. I see
no new lock ordering problem.

I have no reproducer, so I cannot offer a Tested-by.

Thanks,
Andreas

--=20
foundata GmbH
Steinh=C3=A4userstr. 20
76135 Karlsruhe


Web: https://foundata.com
Sitz der Gesellschaft: Karlsruhe
Registergericht: Amtsgericht Mannheim, HRB 714807
Gesch=C3=A4ftsf=C3=BChrung: Andreas Haerter
USt-IdNr.: DE284122682

