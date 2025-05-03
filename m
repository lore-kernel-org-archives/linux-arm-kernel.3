Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170F6C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EhZYQmX+r04EQqv1jdCLyWcxCvy5C9t7SJ8u+oq+lhE=; b=rM0aDphTb2nFq2
	zzF3zK3K9CbziX29g/SLP021yEi9yzDtKBGsdfmdfn9ZMbuPBouaueWbeVksAP43ukrCypre6nmTf
	veAWJimPPs2s/kOGEc16Tt/gFYpYyB3FBojWEcKXRiEPMxEd16PyFZ+YTFPf1QP6OYx+7acKF24+8
	psIlN02Fuu2jI3f55y0gW8bgw0koK+SsE4aCaI9PjEJw043UYbY+4KyRe/uF8J5FMuoSeXCsVQVZU
	MbIR5uwW/MtGuNErw/trn9c9/NqOc0bbxNW255jivcMDmEUNBjFnNzhmYg2U19Fd9X2QWuIdsEFUL
	QOICeVaSWZYjcwgFld0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBS5-00000003pyw-01b6;
	Sat, 03 May 2025 11:54:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBBQ8-00000003pdo-1ion
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 11:52:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30332dfc820so3587331a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 May 2025 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273159; x=1746877959; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhZYQmX+r04EQqv1jdCLyWcxCvy5C9t7SJ8u+oq+lhE=;
        b=HdPDoTLgCwVIjkFUS7d/RVmqnFqfM/UbvW4UomiKTMGLsxuyRLjf4bPKlwBTRoTHzq
         tFKv45ybaB8V45hCPZ0FvzZ9wJ7zJtwS8y4mcDvqTtYhG6pAl0Ww4apEAW2tGc/ptEmQ
         +IAnaAbNyETfc7RlcYVE5pyOBp1V6SZrVL5oQVkTAYU0J+mEHJ10jgkxHvdKEHJ6zQTL
         Zl3Y4L4i5f7MV8vpoPnXxLJtOMx9bdJ8g91ZoYw4aVjeFXmmQgvlt17NVA0ilaagFYyM
         i9HsnOXy9FcIEXBMbTMWVh6vzEHO991z15V3lha8qqyePcN2E/dMe6ZDJArDjNqw5ohI
         ZSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273159; x=1746877959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhZYQmX+r04EQqv1jdCLyWcxCvy5C9t7SJ8u+oq+lhE=;
        b=JEEeFhmecaxRh5x+XMJc4btTWOAZdO1pBA0l4Og/naRJn+qqLSKycy8z6jJzD4KnVi
         90/IdMRIYIM5MB4dQP9fnuAjjOyE8VwY5uQZiaOusri0poaSf1EWRdjOJmDJuaSypP2w
         is7RR+N1lzBzaEOm4nnABLeNCZM03SV1P7PKhitJidv4O4w0HOnlwwXaZAUtPlbtk6tM
         DnUogabqw5ZHnt98oR+Auzt+w8qYH5Dx1nok1c9td69+lUCAAtIlUVYV6sQlrR2P9bdm
         9hhaugkDQs5E+l50qnjiMWVDDTvpTE66oYkvjxYwh6Okv2wjhw9zpGwFTKX3bp7vIOeI
         GCyw==
X-Forwarded-Encrypted: i=1; AJvYcCUHlR1C0ZmkZqaD8EpcX41OEVPh1LW1l239AqZqJshBUfd/ylzB5zVQJ+z5vZTTA9ftgHrmYWHT/uC1sTNfY39y@lists.infradead.org
X-Gm-Message-State: AOJu0YywdorqS7Xi4m0TNokJoEVrSt/QSCIQMMJwvenne54S4aue9VNX
	Ql8tN4v+CQ/z728nslXLVD8Kd+DxXnlWcLDVXnAh1JlR86ulkQya
X-Gm-Gg: ASbGncsmE1hHdvGGs4x1w8yo+JucJ+rjp6YHMC2to8WURjX57rfh6Kd3CqgbhHvYknU
	AIykWEOJwfMJW4y9VpOvOuhXpsQhJUUM6G3xG1bRv20QqAdta7Vvs13ApzD7zs4XtlxxXiAkO+u
	GlJpZygVA0v5l1Nc0Y5WzZxNxXQO0r7ZpCkhOK2LzZfHsu4ngLNSZK5z+xHUzO9fo4ju0hXtbgl
	9dDl8Ug5rpTcZSnD5FaRn8YBummaC+y4WQiklEMlAhAjsivAz9mUKQh4yJbdBVS3tuM/Z3/J+kb
	AfopPqE6Goa5ZLe+JiusbVfIiGFlxuGH4sTydQuiI1mstmJuK+e6u1y1v+Sq22k=
X-Google-Smtp-Source: AGHT+IHFHk8s6a5Cg3iIWh+D6msUX9GSdN/ACGW3B3fZ40cQA50LpyO0Tx+KlvYC3RLD5dJjv/eqrQ==
X-Received: by 2002:a17:90b:2e10:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-30a5ae10bd9mr3677751a91.8.1746273159442;
        Sat, 03 May 2025 04:52:39 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:39 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v3 0/3] ARM: vt8500: Add runtime SoC version identification
Date: Sat, 03 May 2025 15:52:30 +0400
Message-Id: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4DFmgC/3XMQQ6CMBCF4auQrq0pQ6HElfcwLqAzwCRCTUuqh
 nB3CxtNjMv3ku9fRCDPFMQpW4SnyIHdlEZxyIQdmqknyZi2AAWl0lDIxzjL4KxEz5G8RIIKK9O
 ipk4kdPfU8XMPXq5pDxxm5197P+bb+zcVc6lki3XbFVBCbuHcjw3fjtaNYktF+PBS/XJIvLbG6
 AZrjdp883Vd31vJNk/rAAAA
X-Change-ID: 20250423-wmt-soc-driver-de26d67bd4ef
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=2463;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=9N1YOzjWc2JYx9i3bv5RKM9YYgAkxPqGjPDJBcM4dMo=;
 b=YJ365m45ZFzk/XRDnRbc5C3qDvVokAY0rKHB03vmDIFVdd/eLQDsuKvu+pnUAkYV2NFE1L4ZY
 z9zwrqhp+bdA8wpGdeGSUnz0EcS1b4ESjVq8KEe31cOdybT9Shuq6+I
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_045240_458503_1E8EDC99 
X-CRM114-Status: GOOD (  13.75  )
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

VIA/WonderMedia SoCs have a chip ID register, which is helpful for
selecting support for correct sets of hardware quirks at runtime, add
code for it.

This will enable the use of SOC bus match tables in individual drivers,
allowing for finer grained feature selection where device trees might
not provide full information about what the hardware expects (such as
with non-user-visible SoC revisions having different behavior within
the same user-visible SoC version).

This series intentionally omits the updates to MAINTAINERS, as there
are multiple VT8500 related submissions this cycle which may go via
different trees (and cause pain in sequencing the merges). It will be
updated separately in a single pass to cover everything VT8500 related.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Now moved the binding under hwinfo for real. Sorry for the noise
- Link to v2: https://lore.kernel.org/r/20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com

Changes in v2:
- Moved the DT binding under hwinfo directory
- Changed the compatible string to be based on SoC version
- Reworked the driver into a platform one, and switched to devm_ functions
  (all of the above - thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com

---
Alexey Charkov (3):
      dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver
      ARM: dts: vt8500: add DT nodes for the system config ID register

 .../bindings/hwinfo/via,vt8500-scc-id.yaml         |  37 ++++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   5 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/vt8500/Kconfig                         |  20 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 125 +++++++++++++++++++++
 11 files changed, 211 insertions(+)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250423-wmt-soc-driver-de26d67bd4ef

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


