Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2598C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lX+j7ZByvLSkPBbGZ8e37EOuRyaPsfVXExUNogWzc3E=; b=dd9+QCVND2ffEOOFrMNjYmW64I
	l+eDJbC4DbK6sMcMSN/azFUGgyaEqfMbQ517aRrj0Nu/lLTTKsG2t/cXIGVX/IvrBNE1gcQO3+JOM
	rSngEYIQLcPlOkyCmm9kD7TDnm6teO9RyNQIULAvT4xweE2lPoQMH4QPujwm9d+JL5tJKot12m40C
	i+G++S0UVbZeTX9imWckJ3mkPMSEhw0aY0SYUPOGupEYIsVWOT3Ktr5LzVkehb6WCGeBxDRPRdqrt
	bRc1ES+DcmtgXIRR11oS/LTMY80SZIu0uxCSf0tN3h8o+HDzYLZmf1Hv7goQU7cXCxomq4MEpYNRY
	r0bsNbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbgk-0000000EmmK-48ml;
	Fri, 21 Mar 2025 12:41:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbf4-0000000EmJm-1WZe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 12:39:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22622ddcc35so10601445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742560781; x=1743165581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lX+j7ZByvLSkPBbGZ8e37EOuRyaPsfVXExUNogWzc3E=;
        b=ddeHTQvC54Wg0UQUl2nwy1dqHd0me3jTl0qWXR+2SI1UcCuXGqv8ETEkRKSwf6KZ/m
         +oms+YnQu8yoZm6gPo2VyU2PAgGoKW/WYASt+/aGvv4Swjehv0ESGtPVi46owegeQ7wD
         eZ3MOTYM3LOxsNExIt0BcX8ZkUFAhttaBFPkbt7WiwA2HRnc6WS8GnpOPuWQEEFwtZie
         PCO/Be9bQAAe6jHmv+dsotCJ/0NU3PXynGrRoeGUX1foE1tn7OHW+JdL4E+3e0ZTVUbI
         UtMKVq3lJdX9xX3MGL41BxAa57SBACDqJleREUe+p6hrWQN8bo/2OmEcdZYpVh7dkLhn
         ABMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560781; x=1743165581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX+j7ZByvLSkPBbGZ8e37EOuRyaPsfVXExUNogWzc3E=;
        b=fnT8dYE+qgoKS/LdgrZZYFqlGJXIdMFnY5jVvPt+FK76z4jVbga1LHSx4HTcyuUPPx
         BHTw/GRNIq/4tF8xzhjpcrVmNDDaxvKWHAQUvSYsl3XjE3GWyDQj0vCM5A02Pmd+NcZ2
         hBiPSfIgR4k5j25junzvXBtqkcEyPO1y7l3ms5056G6rGQCLVEDVXwXyLnZ34FFP5wxT
         jPBywvEnJUYCJE/G7PljTrhv9INDTpq/G5T0TRP+UQ8Hb6weOW9yXg232YNHtUTwHYJv
         ep4rB15My/0FVAZ9eZWZ0VDaumyZ9LuvbWM/LcRWHVTGLYjFWkZl6MHZYU0vsGyaQde4
         ZJOg==
X-Forwarded-Encrypted: i=1; AJvYcCV+QCoDnnBe9orKU/+PbeSHNjoDpOJZisZmMBDBXsRsSi+voo1fjEnL+2yckxlgJXF7FQYDL/IxXERJ1ubNkaCl@lists.infradead.org
X-Gm-Message-State: AOJu0YyB9z5cbzpn2wEUR5c3mjgwHBaBcAJPL6yVrA1w/ljY33YXPata
	l0HbgujUp0cdgGRy9Q236bH1p9PZzixkT0v2Qno2SvyU8w0ZIss9J4kW3D2Q
X-Gm-Gg: ASbGncugZZYXd7M6uF1Nw9ON8zudOXFTC2FUv5txLP6X+JsWkIJ6hriOnOQrWFTd+FK
	Hmb65puYVqos/Er4x0VVyPNSpAyeE2HIakzunnQPy4HqiMBn0bbyG2G7MVgA0IKYAmFZzkAoisZ
	XyF31H6Dux0kSCO/XOkl5b9j0d6U1951qNgncnErSR3Or2TlHeGuUBEpWBjWWWSCF5sk6E1g17c
	sVyViCMypsd2sMC8wf6oznSwrxy34g6oCDpTfuTsQw03vOZhnNqwww1lAtgVUt1A+bCnnQG0kjy
	OwLw9JKyGB2uxPGc7G4i08RBZ3X1dNi0JZoDiVmszPBb3TLCBPhd0sS9+Gfy/4cleGZ0+cLU/PP
	vNP2qGXBT/x3o49bq8/woJGFxc8GXwmH28cziix8Z00n7jolkY+oEvvs8iGQ=
X-Google-Smtp-Source: AGHT+IHId0CD+P7qvQUeVHlIxcs9d9bWCjTq4tyT+oN5nat9T4lYmUbkwkbTDc4O4exXD2ol31Q6kw==
X-Received: by 2002:a05:6a21:6e03:b0:1f5:a577:dd10 with SMTP id adf61e73a8af0-1fe43437119mr6748664637.36.1742560780747;
        Fri, 21 Mar 2025 05:39:40 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5c90sm1815432b3a.51.2025.03.21.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:39:40 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
X-Google-Original-From: Jason Hsu <jason-hsu@quantatw.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jason-hsu@quantatw.com>,
	Jason-Hsu <jasonhell19@gmail.com>
Subject: [PATCH v5 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Fri, 21 Mar 2025 20:37:29 +0800
Message-Id: <20250321123731.1373596-1-jason-hsu@quantatw.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_053942_404021_16B5820D 
X-CRM114-Status: UNSURE (   8.59  )
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

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>

Jason Hsu (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1399 +++++++++++++++++
 3 files changed, 1401 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts


base-commit: b3ee1e4609512dfff642a96b34d7e5dfcdc92d05
-- 
2.34.1


