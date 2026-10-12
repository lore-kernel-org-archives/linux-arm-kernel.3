Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301CFCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 00:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPOSV5t/ZxWgjQDuWW1AglliJhiZsAELK92eDjJeSKY=; b=uBhlZ8o/M8WWd4WYl82hSOrOCx
	UB2fdEGVEaKDRTHFQ8mrvNVRE72gq2T/U1c5XmdhQ4surkKf2PcmB4R2vNOYCMPtW/5VQTRjYNpF3
	d03qW2W8763bk6qvSfD5VXhTkYCJn2BXDqSGfgQHxe+uvB/H21dMMLaMM1jig2//JsmLZuAHA6wrc
	k4AlaNbnCad+2Y0/1TseOfvmr3NBWpBQOa7vJEKeEdr2QaHLELDKDL3eGKZ4LCEfpMKlkcAi0O+Ml
	AoKCh7ekAypn6HmaccJf9hOwcZY4nYa7D0qEAUc2CVWshjEi91T++atVJm5Mj+bRJ5q2dJDIMbvjt
	tc+5t2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4C4-00000009XAD-2oyN;
	Mon, 12 Oct 2026 00:47:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4C2-00000009X9r-3zqX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 00:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD0F412B8;
	Mon, 12 Oct 2026 00:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A050C2BCF5;
	Mon, 12 Oct 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791766026;
	bh=QvXw4q3YNI7WdpHXkrsI3WgjEitXRqf5xOTiIc/VBxQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RmMVVyqGmIehdlDEjcXmU53ULd2LX9rFL2Q+a5M7CQ19rFnpDwdAE6X9DKhEhaXEY
	 gnz5f7OSqUOSWR/ghACJin0k0u3cOapFcOC2ZZF5uN3NPy8EvoHP0A0jpO44MyMW/c
	 Cq3pVTv5BcQf0deeTAB1GbQE6qJLZfdDDrTaheuT6MpbYCWsomvRxabqr9wzR84akM
	 RPWH6YP2ZGNQpotW6rBMQRyX3uNrehCbsCdiExtojUeRvhyikhisnDH+1nvqecjn4s
	 Iue9D8fbtUSIrAjkBoJhIssFhp9l6RCGNnPnxFLHb8NfW1o8+go/0vMnvq7Hms/7tW
	 43UDmvFfY//hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B99CA9ED2;
	Mon, 12 Oct 2026 00:47:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH v2 0/2] watchdog: orion_wdt: stop the watchdog during
 system suspend
Date: Mon, 12 Oct 2026 03:46:55 +0300
Message-Id: <20261012-orion-wdt-suspend-v2-0-f13cf71443ba@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAuzGoC/32NTQ7CIBCFr9LMWgxMDFhX3qPpAstgJzHQQEVNw
 93FHsC81ffyfjbIlJgyXLoNEhXOHEMDPHQwzTbcSbBrDChRK6lQxNQS4uVWkZ95oeCEPHs02lp
 v1Qlab0nk+b1vDmPjmfMa02e/KOrn/lsrSjRpo6eb6Ql7urItx0eBsdb6BdABR9yvAAAA
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=QvXw4q3YNI7WdpHXkrsI3WgjEitXRqf5xOTiIc/VBxQ=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFln9Nj9d6nW/eisXd70bIXfhBj/HwX/dSM3+xUGuDcb/
 OuvCRPqKGFhEONikBVTZJlwSONWxpKrf/09zB/AzGFlAhnCwMUpABNJ5mb4MdX5QmxOiwiTb+H2
 7ZafC8VuWsx7/OaBrBjvrIKUee+tGf4KfRS3/7pjg9gK66t9r5qM/WIO/3K/smnVpLx0sykV0aZ
 8AA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The watchdog keeps counting across system suspend while the userspace
that pings it is frozen, so a Kobol Helios4 (Armada 388) resets 60 s
into s2idle. Patch 2 stops the timer on suspend and restarts it on
resume. Patch 1 fixes the Armada XP pretimeout that Sashiko spotted on
the restart path of v1; the same bug hits every start since
7a6b3d8a432d.

Tested on a Helios4 (v7.2.9). Unpatched, the board resets 60 s into
s2idle. With patch 2:
- watchdog daemon: three 120 s s2idle cycles, no reset;
- systemd RuntimeWatchdogSec=60s: one 120 s s2idle and one 120 s
  standby cycle, no reset;
- the watchdog still fires after resume: freezing the daemon (SIGSTOP)
  after the s2idle cycles reset the board in 61 s, a panic after
  standby in 54 s.
Patch 1 is compile-tested only; I have no Armada XP.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Changes in v2:
- Add patch 1, the Armada XP pretimeout reload (Sashiko).
- Keep pm_sleep_ptr(): it is the pairing for DEFINE_SIMPLE_DEV_PM_OPS()
  (1a3c7bb08826).
- Link to v1: https://lore.kernel.org/r/20261012-orion-wdt-suspend-v1-1-1676cb79e29e@iav.lv

---
Igor Velkov (2):
      watchdog: orion_wdt: load the pretimeout counter on Armada 370/XP start
      watchdog: orion_wdt: stop the watchdog during system suspend

 drivers/watchdog/orion_wdt.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
---
base-commit: 8b5a9f09037e3c372c4e9f2fbda85fcfbf5ea5f0
change-id: 20261012-orion-wdt-suspend-08f276aafa14

Best regards,
-- 
Igor Velkov <iav@iav.lv>



