Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E374CC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=; b=j1XJQhc7ZQ1iDO
	NGV/A5J2ztdcFpxXRRTSO2/mixcsji3ydrQyzRXCTcSULq3YuYCJ5rlnexaL/eEfKC6egLWJzcyYQ
	+tgkM4P5ZdauETqLse+69U/ji++n9NsArODrq2pOECO04PPHPGYpb+mIK5LwvjbZBoFaknZcWJNiO
	GmC7LebtnKIwpOzuT79rBTjGeSm0MGDxzwwfbKC0cyPgcBtmeY9pCXhS4wf64fnPXMiFveL1dqmrH
	mxzkrZzadgPMYaKmpsyrnfxnFrjqE64AE8ysR70hztMBCmNchrcUDlU0z2o9Jb+hRTxRuTdWlersH
	FeJnQUQoDVPJ5hlmefyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJVZ-000000045u9-146S;
	Sat, 15 Aug 2026 18:53:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJVV-000000045to-3jcU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:53:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cecdc24b1cso4044755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786820004; x=1787424804; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=;
        b=SHTd4bmEUl+TGuBrqLbQjVP0SrzjreWMn/oSKq+Szc0QE42/tYkq+mF/2LMSMVMSwK
         FfMLQMH4isrqXEgl3SgSjNLb5+73A8JVRRq3y82fCn+7MMYX7JVGggQfkUyET+yrPwBC
         A/nq7EAvXsQvTJX1m7DpULgnZyj77YCKpYIQBGC6QBOF4n95khtreQM+DND7QpIrYEPu
         WgemBcqkKVz0rbSnyVvEQaOss3JF9dR3O3ApPvOj+Wx7oQqwqsin0O2R7uRn9WS75Ay2
         oFLlhThftNXv6Nj+zjgxjcqNv8BON++z6eS70RhkiTLK+z+2YFSedbxPRrx6pYOj9JQu
         HOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786820004; x=1787424804;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lO/GAhuRx9Cc4gcz82C8v7OvrP0NnD7lPKYMhoj69UQ=;
        b=XSjwyJIXPNp2heWrIrQrb6L6li1Rs8vxwobRtj37Kf4CpkbbZE4JKveyLCu5J73RoS
         y1xpOQHwZL+larwACfjL7F0dRKdcgiH8vwu9DLM3mQi0TJGLr23CHshgDgg/64BLgNDj
         1BXI4IdBSNqR+k9ZWjia9UO74ceqcgwx6KtOAfkHEWrTqna+MPOGTpooxjHGRvsQodiH
         6m1CSAJw8xOQTO7MrGO+xb7sdQYanSDoufjk9bbTe52iwPtcnqwYrtXO0UxBMXxFpLrt
         WQzVCMGGAYif74f/t8AXVuM9lRYSx8WpzUcSrDZTLjjPImkWZZNOEFISVJ6KZgzLp+Jf
         xfTA==
X-Forwarded-Encrypted: i=1; AHgh+RpFOT8xhXIPk29gOVSl+TCqMEWKdyL3EN1rMVBAC76YYGrN2d7E8VK1j9d5RQs4iWZihLFdqS0NKprFQsc899Qw@lists.infradead.org
X-Gm-Message-State: AOJu0YyHEXBPIr0UIJtKy2M2OX7QON9XvdYdMVuJLxhyZ+Fl16x3ZCTg
	DtQv4eKjFWgh8cx7O+fOdN0fPb5LY+WVvJrGAw1cayXjWpMeAigN7PQV
X-Gm-Gg: AR+sD10BaoyZVtypeUkOLcRB+GMR7Zixap68A10cL1DreOeaz+SXfF7pLIjxLzpyQGx
	kiy2s2S/rIp3CwrgXMeY6e4xraAoUQxMJ3CSrf1eydRXJxOgmEykwfKvZVUvGmMNqgwKOFuR9Dk
	CiDUsjzAcXWqxzg9raact5Q7JkTCnJ6/GjxdGVEl69eO4sDMoiUFLbcOGEySq8FK5emm5cO5fxA
	JVlQC77XihGK+QH2xtGGENr7qfYsLwSokH6UsaFXv0z5N1rnr1ozcVSvw4toxhpCIFVwqGZMpDQ
	V60ZSZuwd2dKWUW4tUE1ALcRs15EY2Hg5qSoznpz6NX7P0eeHurpnmyOk4Az+Z6eyodKZMJrJTj
	12XcAWRWDNlPJXsSs9UtuaCtOD0X7xHuJ/Gli1CWvHAwLlBoqy+q1aLGxsz/yhumbVTHeOBEzSR
	k7XRbzYkJpirpmaJx3xo2mxvDEz6GXap003DsYWwnakGTif7UKT49qYaCvn3lrtbZIEbpqR9IC
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr10888735a91.0.1786820004479;
        Sat, 15 Aug 2026 11:53:24 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e5cdfsm19289125eec.12.2026.08.15.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 11:53:23 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Sun, 16 Aug 2026 00:22:58 +0530
Message-Id: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ7CIBCFr9LM2jFAFVtX3sN0QWBoJ/bHACE2T
 e8u9gAuv5f3vrdBpMAU4V5tEChz5GUuoE4V2MHMPSG7wqCE0qKRNSbGF60xLTOho2xTGFHTpVV
 SeaqvDsryHcjz57A+u8IDl35Yj5Msf+l/X5YoUXthTHNzrfHNo58Mj2e7TNDt+/4FBDY0ILYAA
 AA=
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786819992; l=1571;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=0c/4L0Z1jAiqA034Ce5L4JKC6XAPputkHsDsi5EHESo=;
 b=Xo7ghDZ+X1o+TnmeQEkuJZN6NrHvhgHnyur8at9eZMwocYxHxuO7WdyBo/0kHttqh2kI5sB9B
 wNTP2VQC5xaD1B1e9GKqh8f+zHrc8argj11FZAjtRZ/76JO2F8Q/JAX
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_115325_973697_30150403 
X-CRM114-Status: UNSURE (   9.60  )
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

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 100 insertions(+), 35 deletions(-)
---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav


