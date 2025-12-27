Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE41E92715
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VyBAzRalal+p5EliBFxBewJN0DK+Unjwn6xANRTpk6A=; b=l7fMvwICOXX6i6
	kpC1qd5bD9iwUH/ywTlbCyuuhsOlkpZavIl7jEiUDuqYNoHspHn/NfsXk1K9Vw9f1G5NITtcZX09z
	qbEcY45syFlVDOjS/Y8tPBcbkExgjbQpL1YMgxl1GfP5EVwyzIjcB8UBSMgZ7TsKsVOpDezVGYgeb
	90WHqu0pxQ5TCsUzXC/sdbBWx/rlE0bpKuUomdkDE03t0lMtkXoM1cJXyzt6q+74jS1TrJbgdxeKC
	0SqtEaaNW0Lg4pc37io+i7gMIAGVLiJxCco76DdsMs5ThLfK4F5gr5LBy0gMG2i5pMu9T/h8qkshP
	k6sEC9EBcob4nYmncOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX9u-0000000250u-1cpf;
	Sat, 27 Dec 2025 16:28:50 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZX9a-000000024vM-3Ykl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 16:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766852904; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XvdxblLCrdDbLt1mtdBZhtZlmTuE5nTxppeNyM/oq/GQW0k44V9zEHrARUKYZtyY3H
    wPJ4MLES+X24+Rq67HcWL0ty/mJ5j1oODzVFoGCez2r+LcYvRzE8auhVQLnLjFNBp0rL
    JBnEhnSRavaFagTjG/QCKo9p1Nm/mv4hOabG3gSCnyZh8KwDfoIoUlaH1znx1odngGg8
    jMJYJXf19Etq1qcYEYXe1Q09oouoTdusUvtQ0ebwBRNfPhvv9uDXQ0JOK38rkoQj15Au
    tIgP6LjWySySXRcPrMKWQAWyRcg3/HqAGsbPvYOnVRb+F083f49eO4wDMthEp+zdvy28
    LYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1766852904;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=VyBAzRalal+p5EliBFxBewJN0DK+Unjwn6xANRTpk6A=;
    b=QXPDqgmxv5Thquo5mJi0Zns3kIPz9/t7T5DN2kyyfQxW2X/weWWEo8BS2FXLgiuP5Y
    quVPyqnGma2EA15NWS/Bx4ol7UEi9l7ffOhVLCcm6cirG1y8SXD6SuzfDKqVvUbH1FGF
    A2oywo0Yi0wVOY6j/1Wi1FhM8wta79swyfX6Q/IIvdBIevNiVJ4tPT59shfdq2qZsZ4w
    aYMH3fVKtDSWuvt70E0Ux+cwvBb3YqBTNJ7t3mZn7LLr/PHmuD7WDAQXUQT5l2uFhWfr
    e1swh5bjPUTJXhU1EYLlE8HXMA1fZ3xfDzOm2wSrtoMbXf1DkxPguRTNvPUioBQvTym0
    wbzA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1766852904;
    s=strato-dkim-0002; d=jm0.eu;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=VyBAzRalal+p5EliBFxBewJN0DK+Unjwn6xANRTpk6A=;
    b=T+o7cNI3rAMorQJSGUOR/vT+3hzCGh+tO+7Y+gvAY6iHbtrK3+8IutkH9ip7d1nyxQ
    AgxjzEYsfXlbgW5TIcC7vVRn896qto+Sf0+rCpUmDz7RU8jSMHTuYoads1skFCNZo5LQ
    U9ioAttHgmYdg/5bOkac3rFL62v4x92omCOr5CqkqYMNBlRrIoKT0RL/p3fqXGW3VKBu
    gCb0KcP2N9qXT/9wSWEVvbixwvXUBKERhttB2FUVeo5AdjZbdDDMLDOE8URc6tL3dFOT
    6AdOtmY6nEEqMCvwUxfX7FO2DfJ9YRUOyZ6SPn7C/xDOf2m/C181gnDmnfEywdtXQU+y
    PttA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1766852904;
    s=strato-dkim-0003; d=jm0.eu;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=VyBAzRalal+p5EliBFxBewJN0DK+Unjwn6xANRTpk6A=;
    b=rUHiDWwh+kTD3oR4xdGnTAjOPZ5cDrwBm0tTpCVaOy8xmHy5ZEilzTlUfu4k2gsHpT
    PQGIAvY/kAPFz4xr8ADA==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQvpoIkZXd2bnfIrOV7Mbk="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id z0d4ec1BRGSNtuH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 27 Dec 2025 17:28:23 +0100 (CET)
From: Josua Mayer <josua.mayer@jm0.eu>
Subject: [PATCH 0/3] power: supply: add battery driver for netronix ec
Date: Sat, 27 Dec 2025 17:28:12 +0100
Message-Id: <20251227-kobo-aura-battery-v1-0-328a90ef5122@jm0.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwJUGkC/x3MQQ5AMBBA0avIrE3SVhCuIhYtg4lEZYqQxt01l
 m/xf4RAwhSgzSIIXRzYbwk6z2BY7DYT8pgMRplSG1Pj6p1He4pFZ4+D5MGCKuUGXTajriB1u9D
 E9//s+vf9AFGv+c1jAAAA
X-Change-ID: 20251227-kobo-aura-battery-3e60bc159d16
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua.mayer@jm0.eu>, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_082831_056463_D6F5460C 
X-CRM114-Status: UNSURE (   6.65  )
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

Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
Josua Mayer (3):
      power: supply: add battery driver for netronix ec
      dt-bindings: mfd: netronix,ntxec: add reference to power-supply
      ARM: dts: imx: imx50-kobo-aura: add description for battery

 .../devicetree/bindings/mfd/netronix,ntxec.yaml    |   9 +-
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |   9 ++
 drivers/mfd/ntxec.c                                |   1 +
 drivers/power/supply/Kconfig                       |   9 ++
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/ntxec-battery.c               | 101 +++++++++++++++++++++
 6 files changed, 127 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251227-kobo-aura-battery-3e60bc159d16

Best regards,
-- 
Josua Mayer <josua.mayer@jm0.eu>


