Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE20C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AWLz/nx/HKW4l1MsmrOvAL31GIJPVq9zkyA7xVp6kj4=; b=y6a0+gwa4Sfqok
	gv2OklGTLb6K0X08J36MOW5LagxjzenvP4+srGrLugxrSw1rahAhL4kJIWtv2ODnjmsx1udpIvHDh
	Nq5z2uuhmORI26ApwWPI1Fs5/UQebn0PB2KU1rh7dNrXzFHJQm8Z7jJzP/xfPj31LYXqs+SNfvd4J
	3wLM5aVOf4gddNl19uLWlbfslDj0iyt2MMeE4E6/0K+LsIUSE3A50dvNNnc7vv+UwdU312yIBXPPW
	FDexztmKbsmzb3IlfrUMC6+6wC2HJMNjtxAdcZ7poD0K+5sWuw84FP5r2p5BGXv25JV1fjxpL5gB4
	29f6rPKuwZTAQg4g9mjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBFq-00000002K5g-43dv;
	Wed, 26 Aug 2026 10:53:14 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzBFl-00000002K3F-1PqS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 10:53:12 +0000
Received: by chaosmail.tech (Postfix) id BC8521CB862;
	Wed, 26 Aug 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787741582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AWLz/nx/HKW4l1MsmrOvAL31GIJPVq9zkyA7xVp6kj4=;
	b=P0tonfCEY8CQIPzuHFbedZAz1sASaNl7V2heq5flYm92JTd3od0V5E+qhkNifvm89W7ha7
	hQ2v74ZBSqOSUAFmDZATgsfcOXpNdkno9CjF+SwoN8c+uJUljtdvbY4ysspCs6vdNrSNF5
	xJefk9dYJgUC/w3JqmyyeSyOt0t3+M4=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v6 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Date: Wed, 26 Aug 2026 12:52:56 +0200
Message-Id: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Pz07EIBAG8FfZcBYDDAOtJ9/DeODPYDG63ZTaa
 DZ9d2E9iLHHL8zvm+HKCi2ZCns4XdlCWy55Ptdg7k4sTO78QjzHmpkSygirkK/5ErkLBFyMwie
 0ghKOrM5fFkr589b19PyTy4d/pbC2gjYx5bLOy9dt2Sbb3FHvJrngFupLBCNhcI/1krm8u/x2v
 1KYWCvfVM9tz1XlEjSOaH00gIccfvkgZM/rx/gAoJKi4HQKh1z33PRct+PHAdFLFKPUhxw7rv5
 sx8pBaU0RfAyQ/vF9378BW0gRn7UBAAA=
X-Change-ID: 20260725-tipd-ace3-090bf570ef59
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Alyssa Milburn <amilburn@zall.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787741581; l=2748;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=+Nm/GOdv7sAy5pNIxnamaskmo0BNDubXQZQmnNJ/oU4=;
 b=5v4h96Y8mqlUwq5S3dXU0kOJBkEhi7ujShT5XKrhHBAv/bKLjugB087hLtxVsF1llNGcVS4re
 p0GXWVOH2uMCuvMt+tr60XAlXRFteswN9aSXD8Gf2zZhv1gsoCvvijt
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_035309_857894_032BFFD2 
X-CRM114-Status: GOOD (  10.62  )
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

Add support for sn201202x (a.k.a ACE3), an Apple-specific tps6598x
variant that wraps the tps6598x core register set with a SPMI based
regmap-like protocol, first appearing in Apple M3 devices. This series
first makes the core parts bus-agnostic, and then adds the new SPMI
interface as a custom regmap implementation.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v6:
- Fix rebase issues
- Link to v5: https://patch.msgid.link/20260821-tipd-ace3-v5-0-3244ed3bdc3f@chaosmail.tech

Changes in v5:
- Rebase on usb-next
- Link to v4: https://patch.msgid.link/20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech

Changes in v4:
- Unexport variant data
- One more debugfs-safety fix
- Link to v3: https://patch.msgid.link/20260801-tipd-ace3-v3-0-8332f2eca4fc@chaosmail.tech

Changes in v3:
- Restore accidentally deleted static
- Fix building with tracepoints
- Sleep the device on failed probe
- Link to v2: https://patch.msgid.link/20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech

Changes in v2:
- Use a -core module instead of building everything twice
- Fix completion handling
- Make regmaps debugfs-safe
- Link to v1: https://patch.msgid.link/20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech

---
Alyssa Milburn (1):
      usb: typec: tipd: Factor out i2c specifics

Sasha Finkelstein (2):
      dt-bindings: usb: tps6598x: Add sn201202x/ACE3
      usb: typec: tipd: Add sn201202x support

 Documentation/devicetree/bindings/usb/apple,sn201202x.yaml |  78 +++++++++++++++++++++++++++++++
 MAINTAINERS                                                |   2 +
 drivers/usb/typec/Makefile                                 |   1 +
 drivers/usb/typec/tipd/Kconfig                             |  20 +++++++-
 drivers/usb/typec/tipd/Makefile                            |  14 ++++--
 drivers/usb/typec/tipd/core.c                              | 247 +++++++++++++++++++++++--------------------------------------------------------------------------
 drivers/usb/typec/tipd/i2c.c                               | 107 ++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/spmi.c                              | 300 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tipd/tps6598x.h                          | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 705 insertions(+), 196 deletions(-)
---
base-commit: 3d9eeb336131bc5a174367c384fa00c15c8744fd
change-id: 20260725-tipd-ace3-090bf570ef59

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


