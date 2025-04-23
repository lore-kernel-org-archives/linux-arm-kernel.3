Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC3FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XAlKzRIEDmOMNM6L0NhSyuVo569RcMS78YotCgYOSqI=; b=e6g0j/gag/7GyZ
	xnDkJTOjVze4Fr4HdZ+DyoGlz3QGkG/Di6WrRLdjOXZCls0j5T0/j0UpwDgu0kl72HoLxVwVGNx8I
	PXHATMWVrgIF3XYPoB+4mUJeaJx7xPauVfOiZ5ALkWtE4/IuQ+Jtwwny9GzgQsfdsVUlz1HMhRZbF
	SzDGxP4T5h30v3k3YEsjcmeRML89IKnscinczM6MOELCreTH2nYIQm0gWsZ83FuwAlyXRI3RrT8cB
	yWOgDcnIssORcZ9wcb7AVqM2AvOFStfAMTJc0n+/+A/WYq2A4J5/uRPNbgMvfKAhBHB7BUKrwU1MR
	60vvtWNvAdopdgWKp8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fe7-0000000Bivs-2ebW;
	Wed, 23 Apr 2025 19:20:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fc6-0000000BiMH-47cF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:18:32 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22c3407a87aso3048685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435910; x=1746040710; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAlKzRIEDmOMNM6L0NhSyuVo569RcMS78YotCgYOSqI=;
        b=Y24D2DMHHtqPSq3ImOsanRjiCNUJI99lzI5pEnA2uSzxHJORLe0XQiMNKQ4cduKHxC
         02YrRFkLaQ6U8+5f4irie4tLeFLIQs8n3n2t35mr8SCbqFXV6gwRGDczvWbA+2eEI2Gn
         mFWLfcPvdKurNQji9B88J4sVbJftwhk7vazToHA/ucUEM+2ArVkDsoYskRPbTsJ6rJ5i
         qLI8m/WeCcNpfxrsz0u1xOMZLX1RNHfr8TMSIL/70ih/KafbahmHHKlAs6xY0f/a+h3y
         7nCPf/WMZM69r8WI8HkoAXSJZg5uQTa9ZH3BFxnIFm5RWLRpNEcX/yw4LpEA4hIXLwo8
         qXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435910; x=1746040710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAlKzRIEDmOMNM6L0NhSyuVo569RcMS78YotCgYOSqI=;
        b=EAuaNrp625pgbVbwAYvvrLaaLzol6eHYoSG/7a6rwFPzsCvvbiE3iFgMlkTGfJOjsk
         zVr+3M3JBq4CAgzugnvuM5+pd5xg1efjqs2ZBuIJrrMsJWuSwxIIECaanBJjZXkm5I1B
         FPYDR9ohLRB7lUG1rtM7u669Abyx5uqTUuUe2Pp7MeEHBO93jiR6cFbKCK7iYdADaWKY
         9SylDM6qSNiJr70MzC+DR42OTVypJRe5AGN8yEig03QQcmdiseWhgspvCWE/Bqqj3CuW
         VQkZfS0MHEuypdAmutbZ9y6dRVZvlRxNHvlMw37r740JNHhYhWoJ5SM7Spp3/i0zXiI+
         bvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqid9ZmnJLgzOtg5dn9muwK3MFeKsgriWo6k9eqW1vIPHjMZ4b8Qbpo8QSCmo8hDAMsmeZ6ldfqsB8aqLU0lfS@lists.infradead.org
X-Gm-Message-State: AOJu0YwTe/fmJLsh0k6bB0jLuAnGOGW7tKrYOitjJ0oGvy3/lroJxd0d
	ep3xWBg10HCVU5X5EkB5A+2ut/KcR+KPh/CPleBuzcgi3fp765pK
X-Gm-Gg: ASbGnctshloQ0dvti/1I33AddPZDh+dAO7bedYn6aoBQblf8I6fAbzKiThmYXioTB+I
	cp9Iw2hOIs1FoPJph/0y/uBgXx95TgkPvoYiPcOAaqa+0Zbrj7hV9Z/ZnuzrLDVvHo+aYf0HDW7
	k9DJyF9afO1Vs3/xhDd/Ufvm+O1O2RpduyMHqfqx7RW2gQsits75tiHL/Ptu6UpHfBtkXbo6U+H
	OE/iN4jqWZly1RLtrVcjEOu5nfEUFZmXGP7l8Oap9qumAEEd7xtn2VD0nGdMDr/TIiXA+GHvm5I
	GgET4iXBdMlvmCIMhFQvEPcYi9I+eZ2O+cJXjDBO+EJfCK3Jvtce
X-Google-Smtp-Source: AGHT+IFqtVLMUYCI3a91c+3WdvO87nsZUIASaOWcsedUdf92cp9GVuS79Tnp76Wh41NEsYpqtvSNhg==
X-Received: by 2002:a17:902:c40f:b0:227:e74a:a05a with SMTP id d9443c01a7336-22c5361d29emr313472595ad.44.1745435910020;
        Wed, 23 Apr 2025 12:18:30 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] ARM: vt8500: Add runtime SoC version identification
Date: Wed, 23 Apr 2025 23:18:30 +0400
Message-Id: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAY9CWgC/x3MQQ5AMBBA0avIrE1CUYmriAVmMAutTAWJ9O4ay
 7f4/4XAKhygy15QviSIdwllnsG8jW5lFEoGU5imqE2F935i8DOSysWKxMaSbSeqeYEUHcqLPP+
 wH2L8AORdRgRgAAAA
X-Change-ID: 20250423-wmt-soc-driver-de26d67bd4ef
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=1942;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=F8SSjqtBe9E0HYlX9U1a01n/FwOQ8nwnabHjcE9VkKA=;
 b=pisJxblZif4j+2IG4v9/QlR/sxLCnoZAYCaH1elEBlp3VqDubQ8vrbYnb9NfDjmqRfv2Z8mad
 pJpR2Mq4yRzABROxYSU6Yv/472p2j/zknOmwkrYGiD9EqQsIUXyAzAl
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_121831_028186_0CCF6673 
X-CRM114-Status: GOOD (  10.80  )
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
Alexey Charkov (3):
      dt-bindings: soc: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver
      ARM: dts: vt8500: add DT nodes for the system config ID register

 .../devicetree/bindings/soc/vt8500/via,scc-id.yaml |  37 +++++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   5 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/vt8500/Kconfig                         |  20 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 121 +++++++++++++++++++++
 11 files changed, 207 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250423-wmt-soc-driver-de26d67bd4ef

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


