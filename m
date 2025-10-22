Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA4BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7yicpS15zPxjlX0KlnUi85k1BzEdOnSdAY4PjiZnyU=; b=EO6YdJgzK5ih0nr0qfYg8em+69
	I42gHiU1w7iNWigRDW6CWuR4SFAfwCsgr5AYLbwPoJh7KgUD9umIvjFBB0i2G6huok0Mrju3dPwNG
	VTxWAUOAYC72GyMsd8nUXBQSJadY9MypCL5Vq81hzMqlo4E4CiUNKy4AApofVm8QVnYbbNxdvJx8T
	NOS/Ufs9pEobAdDIi9g1bmtrJdQhpDeiBXINh7xpipKa5CqFSTqUUNCrgBaOa5pge7gI+H9JK45FU
	A07W+Qfeq4n/ySQ2nGh77KVyI1qHrWmewOLxpHZAMVX8Y6jo5rD18Dc9n0cNf5NjatFaxboXUTPYc
	bQgurZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTGA-00000001sQR-0ydy;
	Wed, 22 Oct 2025 07:27:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTG6-00000001sOr-3cK2;
	Wed, 22 Oct 2025 07:27:48 +0000
X-UUID: 977ce6c8af1811f09f706fa2197c6ceb-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=q7yicpS15zPxjlX0KlnUi85k1BzEdOnSdAY4PjiZnyU=;
	b=Urjm/JVrxPwpPsi3+iWkfHgpZ4SmrjSk/86yvpz26twuB8bOLaGL/rsL/NOSIJfmMokb3JA5bjWcj6pPEFnXR/xJl9avlaSwS72DJtk4RomFh8QSZI5qKwcOvNMW85aS4TzS6CZaib2N1plrHCmxXaTP7SSjBRViBVtJIAL9CqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0e27d089-c775-4137-8eec-0d175d28022a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:2944b43a-b16f-49fc-bb37-560773c432f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 977ce6c8af1811f09f706fa2197c6ceb-20251022
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 367957796; Wed, 22 Oct 2025 00:27:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 15:27:37 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 15:27:36 +0800
From: <xion.wang@mediatek.com>
To: Paul Moore <paul@paul-moore.com>, Stephen Smalley
	<stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] selinux: export current_sid API for use in other kernel modules
Date: Wed, 22 Oct 2025 15:27:17 +0800
Message-ID: <20251022072729.14820-1-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_002746_914976_C128E1D0 
X-CRM114-Status: GOOD (  15.05  )
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

From: Xion Wang <xion.wang@mediatek.com>

We have a kernel driver designed to monitor the status of the Android
userspace watchdog. The implementation works as follows: we modify the
Android userspace watchdog code to periodically send a "kick" signal to
the kernel driver via ioctl, so that the kernel driver can determine
whether the userspace is still responsive. If the kernel driver does not
receive a kick signal from the userspace watchdog within a certain
period, it infers that the userspace is stuck. In this case, the kernel
driver will dump key process information at the kernel level and trigger
a full system reboot.

To ensure that only the legitimate Android userspace watchdog process can
access the ioctl interface and perform the kick operation, and to prevent
malicious or unauthorized processes from spoofing the kick action (which
could compromise system reliability), we want to identify the calling
task by its security identifier (sid). By checking the sid, we can
effectively prevent unauthorized processes from sending kick signals.

Currently, the current_sid() function in the kernel is defined as
static inline and cannot be directly called from modules or drivers. We
propose to export this function, so that the kernel driver can call
current_sid() to obtain the sid of the current process and decide whether
to allow the kick operation.

This change will help enhance system security and robustness by
preventing the watchdog mechanism from being bypassed or abused.

I would like to ask the maintainers if there are any additional security
concerns regarding exporting current_sid() as a public API, or if there
are any alternative or more recommended approaches to achieve this goal.
Any feedback or suggestions would be greatly appreciated.

Xion Wang (1):
  selinux: export current_sid API for use in other kernel modules

 security/selinux/hooks.c          | 11 +++++++++++
 security/selinux/include/objsec.h | 12 ++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.45.2


