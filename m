Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YkHeO2n8;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vm2eet2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=; b=YkHeO2n84fyR+pU7olaEQEjvjk
	Qzu24eMBkoqh6B0eTdqtPv4FPFuGlrb4X6c/t3ZjbplUCsdeejI/bzrFPepUwSKHsJpJ/ED5Aipo0
	vUArYW4yc8wG6mLyLGLxaqB9ARUVKdBsgMcAIyZXZffo/aTMsjJ6r2QEaLU4vWKbBcN9m5F9qcQAa
	DU3NGbCVMOqj1Ko5Uw9rSCZtTwG3TExaOqhovT/AAo6PexaQncBo5VuWspDuqL9kgJzB32SBXVnJO
	pd6bN3Z0mKSMK63zt7WzNR8PrMoXKnBMQQP2ACXg5KTX7+J+OX6DyRU7mikSzb2aKKxLKulK+GrO5
	ee9N/6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlKh-00000005V7b-27vd;
	Tue, 27 Oct 2026 17:51:35 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlKe-00000005V6O-2IuR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:51:34 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso99705a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123491; x=1793728291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=WdfNjzr+BCcvihwZahqRQFWkkzIyNMdyILKF5maH2Mr3BX0rfkmGW7AzfXz77pD0Jy
         yHyV8dT53VC1CYdMZ3c/eLendR2UIp9K22lbqu1JPDSxHadPx/rjqnT9VOY2/7h7zc/3
         5/mXCf/Dt4ywS/h0GwE30fvcjOyw6IOq/7hiCB/d0e6/7jtkWWCDI4XseL+XCwizocJT
         e7utG3QDvebK8r93F/Eb+MXIkxngv+l8A9tTP3vfisbGicUDaisiRLWmr+yPKa4fRUOH
         fLh8x+XaxRf3JXjrWudtyQAgEisxWQ8DUzdYCTdfwoemczjs/KOxOYXmIWJ+4BbLa2yt
         I8ew==
X-Forwarded-Encrypted: i=1; AKwUvByyP1gFcIqBpNyNipsDfRW+0cy/fnyfE6enQk6tOLB/3D/TSOYxof5dj680pjO+BinsEW9DXu1o9oySraEb8RfV@lists.infradead.org
X-Gm-Message-State: AFq9FYJsrm6WXDNU/XBY8pxBcbSajVT+ZzmWtJxc7Yjw7IfvVCghGLYQ
	FjMMy6J5BDdYca+XZz02UCBpijn++KpgdZ7r9zfXb/l2yslDvAdhb+/cIZKgrBk715/oRe7Ysr8
	aaK7HriePm6R+EbAXN2uut9cp0W1FtRRKDBkFvnZMQxciJQV3l581Z6gIsPtl+ntJ6hE2VxGco8
	k8KjnaJOUakBD2oCfiiLq6UQSjmEi2zmDr5EHzRpHxtTAfBzMEaEa9lOwrZ52hkvYJJ1ysWdBC5
	5rn+XPPSlwDHxHuwP4bEYP6a3/ovw4oT4nshw==
X-Gm-Gg: AYBFou0D2ZqtJuUf5bWnPEZ5pvncc4nsqvngnVJEjVaqZ2JnzUN4Ja5EShkE3RZs6jQ
	+6qvoIICvKuXFo/3CQHpiCEWw6EYp0t6hGRnciI+Fyb85mk/yOTeWqFD56pqVxFaB8AI8UOL+K4
	a0Agzzgb4cXk1snl32fagYGNUDb4dLsUHwRqalKiZfujkYHUnykZyV2utn+rV9NWMB3Ja8PfJMK
	UEa/lKtCgxx+TqshnAyqAYUTlIl7xiRmlg0DS2lRvDLtVBFlChL3yCIrcI46SIo+pzUdXYKwA6Q
	Al4F9Pura28da+neTbylFOqSpsJadRMNqr2hYY3noZDV5vPw61Qu7NzU6s/kHqHZn73RlerIeaX
	ZbMcC8txsQDH5PPHLbhlFZrUE1O3q2hExeGW3abvOOznxr9Cw/yQDIdRqhnFKWSBWyIHVJaTr02
	YDT0dlRqkCth9yXPRcLZMH0VP6rCy95Cpbv64MTGHd
X-Received: by 2002:a17:90a:fd89:b0:3ac:b6eb:e0dd with SMTP id 98e67ed59e1d1-3ae3c222aa8mr2417084a91.50.1793123491388;
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae4085e7ebsm2420536a91.7.2026.10.27.10.51.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-537548b8342so4396001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123490; x=1793728290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=Vm2eet2H7Sann6bZ8q+xfY0RfnREb/NpC0iFTfTxhJ9cfxpSTG3rGtfOvTgLf5gtwK
         JZ0FWV42Z4GJf8XRIhA5fXWrY0HaBIq9qqVOMA0Xz0XhaM3TgYRacachadr81ngnwo+F
         Ga8bSZeLzpQcpQJkaTEyB/JhTrulJhNlqjPQI=
X-Forwarded-Encrypted: i=1; AKwUvByriIBRGL+aFPYTeuR4y9SKXlgkn2fMCZvpQ00A5DevXE3mgdeXGvGOvFW0EknDvWHU2NEv7hmAXGaXGmKUPGcn@lists.infradead.org
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179751cf.0.1793123490135;
        Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179381cf.0.1793123489573;
        Tue, 27 Oct 2026 10:51:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
Date: Tue, 27 Oct 2026 10:51:21 -0700
Message-ID: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_105132_596885_A3F0E8AF 
X-CRM114-Status: GOOD (  13.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds support for the BCM5301x PMUs which are AXI trace
engines present in the chip.

Changes in v2:

- addressed Sashiko's review by adding the appropriate title length and
  group validation

Florian Fainelli (3):
  dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
  perf: Add Broadcom BCM5301X AXI Trace Module counters
  ARM: dts: BCM5301X: Enable AXI PMUs

 .../admin-guide/perf/bcm5301x-axi-pmu.rst     |  92 ++++
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  |  43 ++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi      |  15 +
 drivers/perf/Kconfig                          |  12 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/bcm5301x_axi_pmu.c               | 452 ++++++++++++++++++
 8 files changed, 619 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0


