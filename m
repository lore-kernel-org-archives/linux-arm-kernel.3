Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4A0C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNkbdlnyVeyiuJl/LuQynlCGcW0q6IqyyAK39bqKDW0=; b=egVT7gSPD0CHiV3EdySWjqs7LC
	DDZV96mDGEGwdAM5R1LJ9J4e98MJqHG7NXrbmsonsmINYaDmZ0nmsF1vorfqD8q1uMwf777JeksQc
	FK0NcsqNDIYr8Y+pSK5LXixdmwaws3RUtjDPgrrq4tJgGQ5bBGPhS3S+8LDNlyBvbwe8ha76x/SrD
	LXYYgjRAGCXrZMhbzvBZf4ovqSOXVtDcKzAlvKpXTnJ/Oj3sSuGutBaGFOll2TQfQON2L1Bz7mZ/G
	15J9HP9TXNt1w1fdIKwQSvDmQxlkRZJqCU0JAgcZhefq3KGNmdQmdWjoiWpoJnQLhWj6B8he4HzzP
	EqdD8UJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBO-000000061Ka-1ZYe;
	Tue, 15 Jul 2025 19:19:18 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiFQ-00000005hpR-440L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752595872; x=1753200672; i=wahrenst@gmx.net;
	bh=BNkbdlnyVeyiuJl/LuQynlCGcW0q6IqyyAK39bqKDW0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aTHCq0loR7lTf6A/gRtkZLhcSQNavRTmkFXg3v6pWeGx3/ioIwz/0WBUnfKNcJJa
	 5BwSzLmDmf5NfWWLuoNHQTXfnGYRaUFMlA9U7oIX0dnpVas5gsP3UUxJ6kedU3d3g
	 v4NjKTsIoTpMG+TFtsLKwo0Igmmw46p89mYkorb6KMz/5o8TeHJnxptascg6np7yx
	 hWvrzFO8WvemgUP40tz8rfzyvusJBnfF0wICC33/l9Ga+eogsSwBqIQfcPHi38MgI
	 8gFEyx9mjE4773wVUHxx9KW07lZUkgL8jbFdiVB+HhIB+BCxRhq8xDTtUEkIy0UyZ
	 lkfco4Yyt6frWc922A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhuU-1uNuja1SJm-009lGU; Tue, 15
 Jul 2025 18:11:12 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 0/3] staging: vchiq_arm: Fix regression & resource leaks
Date: Tue, 15 Jul 2025 18:11:05 +0200
Message-Id: <20250715161108.3411-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PKy6QQQiPNc9emouQ6eND8VzfWe4RvXJHFkgvgTMEmXwQGzhbbO
 Use9zvrBGt9Xavgoj7zAhVL38ZgVqSheiG96hUUY+gKnaOqDh2J1sQr7LlGAikcl7zpVfuY
 niK3P3GUESFe70QX3UH9KUaDv81pePODFUvsb4diEzBPdfEPcDpCS/whmzdR6kjWiEF6Bfc
 Vl5e8stITFkYJcCALQhDw==
UI-OutboundReport: notjunk:1;M01:P0:qxiuRUWcxXE=;tecQpyE9JNfqLLJhruOmqvrrMcU
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_091117_376934_6841D753 
X-CRM114-Status: UNSURE (   8.45  )
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

This small series fixes a regression introduced by recent changes and
possible resource leaks in the VCHIQ driver.

Changes in V2:
- Add Ma=C3=ADra's Reviewed-bys
- Fix Reported address in patch #2

Stefan Wahren (3):
  Revert "staging: vchiq_arm: Improve initial VCHIQ connect"
  Revert "staging: vchiq_arm: Create keep-alive thread during probe"
  staging: vchiq_arm: Make vchiq_shutdown never fail

 .../interface/vchiq_arm/vchiq_arm.c           | 98 +++++++++++--------
 .../interface/vchiq_arm/vchiq_core.c          |  1 -
 .../interface/vchiq_arm/vchiq_core.h          |  2 -
 3 files changed, 56 insertions(+), 45 deletions(-)

=2D-=20
2.34.1


