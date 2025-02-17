Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7798C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oXoBLoBhkmHAsPATjYXnbeVHXKCoJYAoeA07HXhsnTQ=; b=Ee7kOVL3QhAPmNcoW6MTdAmmMo
	VVYbzL8FMCc09xLDkGN4CLJwR4OjFzfKbR+jB02G4xRrex0XVfkz30I0BepaHs+WQa8PJnBiIcASh
	eqQpbaUkVP813jVeGrCYHfwuHRmZ4GDpv4owXdx1FKuA1IwZQl+y6kSIA7pwS0O+SeZI/doURQNHx
	4GqhMR3OFcr7uqktRpWGKpjva2UacRzuVpc56nKcVXDwvATk4ZZKCK4uPemXb9upJDpb/0wLgadaB
	bT2xTuMPhf/q4F+yyDgXgNYsf9ecfDNrwsMtyyxLZX4Olfs6kpuY7uAoaHGT1tcEIVt8jZC/vLWwH
	/NSqXQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ez-00000004ykb-1lbm;
	Mon, 17 Feb 2025 15:03:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2Z9-00000004xaY-1SvO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:57:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43932b9b09aso48629225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 06:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739804266; x=1740409066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXoBLoBhkmHAsPATjYXnbeVHXKCoJYAoeA07HXhsnTQ=;
        b=IZe8PiOC6gq42uoC5m2tEiVJBGU05e1VzugdzkpzCcG6bMpaqFqRINNZ69octbXsSp
         I2APN/MFRYLwkQrQcu1IRDnA/kj/vXAZtQG8fhw4biFAp6VoPYUXI7cXdPas8K1pgH7g
         /8xEgd7xMm+dLtI54L+293qR7kfs7zJoOmcAbI3rPWhOi+4i4tJslYTYIEMEBX1HnSZj
         asXDBaNd3ogZukiI5GiHMLfrC+dKNEOiibHU3xW+DXZzD7taQvI9vBaLBndHko38z3iZ
         KIZtuKsvrBaxJZ9Cffei47DTNLaM7cmvjcHzTuEqGH8e5MZQUQgKVqGU5WqDyZVO7dQy
         v7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804266; x=1740409066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXoBLoBhkmHAsPATjYXnbeVHXKCoJYAoeA07HXhsnTQ=;
        b=dGXDiHVeV+rfEkIVRPqhsOkPb4Chn/Vqrbc+ElHWWx0tkoLG5NTzk2lK6CDBu3KL+g
         9qxvG2PbHQ3MP/oS7NFHC5g0WzuzaaYWb+YMY8nTUfPPb/1LVzTCj2lJH7xFzIrhvttn
         hb/FJUzuvsDgBHISfiA/W3Lb1hQicDjvTBhmeygzUNmW9NB2euP8oHmlWy7lDbKLT6GU
         DDJ5+ytWNYM/qMdHGL0mXOt1+RWHtFoZcnM7HSe0XbOmF+GQ4QaaV7Ues/QTbgzNfMNP
         Ysl/4nATcTU5oApWlWjbbIQFarA6FJuJcpmvDA70Kesr6NB8aUvRCtS6MioFWC4PmL/i
         NRDA==
X-Forwarded-Encrypted: i=1; AJvYcCV07JzhIBXF68UDhE0qmTlW++sJg45/4rh8miI0GVEsryCmBRFc+7dmSZ3vvrJI5mbEGQM0KYFSTAbYspFRZpG5@lists.infradead.org
X-Gm-Message-State: AOJu0YztQkiGAeJ3cwtDnRZCQGNIBnAxdYXSK3sE4Xl78igH8o2smqCp
	IWaPTwtZF99KYmwFzdCE8l8874tpagOBqaqCR/IJ9kBGPoEvAWt1
X-Gm-Gg: ASbGncug+AYaZhdKopjd5ElQWzZmhBGU/ZogN/32qJ7g4uSoXQpXY/LDYBl8CdL16mv
	pz4tyZZMEZRJLoS3/AF2C+73/4RaW6/YITTBbslsvsPIFtibgifxNvexEE4ubIfbGRauaOVacM+
	DvVR4oIkq/HnAaFXU4TsWseupwyCREiDyOOTIWZrhtd88t81ltPHel/F2lEodg+H6pNgyg4sKeO
	e7tpmcx9qK7Hexko3AJQcJxqUS6L1w3DM4aH8TIy0Dx/GTn+MCe2XQZKr/IDPW6i1HPW9Hkk1Lu
	lZQppI2wsAwekcjfOFgDPR1NCB87rO8=
X-Google-Smtp-Source: AGHT+IFXCMAdjJ/GydfAREXf0KPq6/DlSCRVX1j0O/vO0UDb9MfjoWtFC0m9aDzP5dEgyS4d1XL08A==
X-Received: by 2002:a05:600c:19c9:b0:439:5760:39a with SMTP id 5b1f17b1804b1-4396e716e8cmr101394035e9.23.1739804265610;
        Mon, 17 Feb 2025 06:57:45 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12645020f8f.56.2025.02.17.06.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:57:45 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8mm/imx8mp-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:56:39 +0100
Message-ID: <20250217145744.179213-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_065747_396152_B299A818 
X-CRM114-Status: GOOD (  10.25  )
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

This patch series adds a Microphone Jack to the simple-audio-card of the
Verdin iMX8MM and iMX8MP Dahlia carrier board device trees to separate
the microphone and headphone functions.

This resolves the following boot-time kernel log message, which
indicated a conflict when the microphone and headphone functions were
not separated:
  debugfs: File 'Headphone Jack' in directory 'dapm' already present!

Stefan Eichenberger (2):
  arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to
    sound card
  arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to
    sound card

 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.45.2


