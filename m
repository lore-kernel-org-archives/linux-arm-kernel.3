Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B9AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGNVNUN3+kMS8Pk+lW7Mu54XMRd7ahgEZfB5hqHxV0Y=; b=LJJrxfM2kDTn7eea4Ov8t7iptr
	yRy2QnSnj5DbV2Jx09fFx/qoOb/nXM4WHEr+98knsVqnt81b7NhCHjjACAzF2yodHKP8jPSCNqGlD
	KcymE9fCzG2BPW8UJuseZlRWa99BQbaKj34PCjocwCxuBvpGcYSpAD30q6uxcPekkIZqoc1Orpr6M
	9tQZOu09B/u44dwumvYC44wjwqMnjYHWOYEt0WWQlXYw3l5hriL/wjeSRRi/M61XfWJ9O4yR+Ccbi
	QopK5LycY2BvMZAAUYWFMRJATzFgPgxu55kVP3fvLAC67vqGZezc4XPresfADZaert/h+GG0bUZnL
	7Uxcu0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaG8w-0000000FD6X-27m6;
	Fri, 11 Jul 2025 15:58:34 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFrm-0000000FAXO-1fVW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1752248445; x=1752853245; i=wahrenst@gmx.net;
	bh=WGNVNUN3+kMS8Pk+lW7Mu54XMRd7ahgEZfB5hqHxV0Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nzxg9ninBUFzYbR1TH8e6+EAfPKMV/Uhv82VcSh/5QUfrYRj7+9gQf/NBQK7Zb+z
	 fhgt3JBW7ss70598RJAregIsmF0o4WuUV9sF+njOaxqgxCybKyumpxp7vXcMhCQ1W
	 8yTB9rmvhiUKc3W9K/TzyWVMkymso2A6HuvFIdd6FGwQI109BULVM7YjubOHllF/1
	 DwCocmTBwYNk1j9kSVZ7NkMZ+Kz4SboJ+ieRM7lwS2r0ugryguUOBwSTfFRk1Eesk
	 WsnjW5hna1KUXnToVTvSS3dmc3TjU0jz20BY8WukKX8IoZtLUbZsH3GLhBUbCVm/m
	 l52CPj1D/1PZjAb5EQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO2E-1uyY330ijY-00nS1L; Fri, 11
 Jul 2025 17:40:45 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	linux-staging@lists.linux.dev,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/3] staging: vchiq_arm: Fix regression & resource leaks
Date: Fri, 11 Jul 2025 17:40:28 +0200
Message-Id: <20250711154031.24178-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3ghwf+cpjS3W+KSJ4b7WqI74pMZ1vtdWImtjwkzcC46u3Lbt5Ee
 WR+WDDkZIdn5WMil2zCWJjfamo3qnY0mWyru01i/2NWJE3bQ9uJGl8MMm768jxrUrieMEaa
 TB5v1LEO92S6JO07pBjDwjEOWrEVouBHoQnUhgV1DRxMLvMsyhFwv/ceLBUAsZJX6gmm6/L
 cJ1UMOgHZaIgcqSgHBOvA==
UI-OutboundReport: notjunk:1;M01:P0:Ga+hzia5/XA=;AgynK4QR2nNeD3nQ6EDOF8uDqbD
 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
 uSzLSpeuWX1ILxJaimKolEY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084050_804096_00F49B3C 
X-CRM114-Status: UNSURE (   8.10  )
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


