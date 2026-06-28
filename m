Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1765C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zB2RgA4LcSFDTrHCUEiIFGumRAW+eppHEw/DC5yOWko=; b=CoCT25pSgoQvSQpZAj16UOi1Sj
	wJyKFJCrwgtUZUnXoGCSycT66OgdCofnTT/TCQTXYjpAnMHQEb360Xl6Fp/aeuiiZ601s/efsK3UO
	kz8mop9sU4AUh66M6DqGbN5XtOtKswmzqADosef5q6IUb7Ke71F9lt48uEnyvfWihkAE6YTledywU
	RlEGpNOVhFuKNEMlY8N9y1p8tQhbpJT8ub5clvlIZ5XoqR96yzNQFHz+oauHfAD/FkfjNuQpn1YTC
	QeWT/CVSvsPHSfvewx5zOuJgb5cObOFloGG4o5iXqJzjrEbzu4H0xg7pZ/AHE/t/Enwy3hnJqrYY4
	JpxyBzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwYB-0000000DNOW-0f9P;
	Sun, 28 Jun 2026 20:56:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdwY8-0000000DNNZ-2AjZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:56:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4926ee9e8d9so10733545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680178; x=1783284978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zB2RgA4LcSFDTrHCUEiIFGumRAW+eppHEw/DC5yOWko=;
        b=F7SIbLNtXIXtfqLURJpEreCupo6n6Met3Qa2EL7dkmMs0cEQKUqnBLu9SWN7+gLgUm
         uQOmEEMQ78He/xSa5njizrn9PM6cgKqVUV+FS/hI90VxbGmsd0swZYacYyBiTkVbiTmo
         OdTXFeyRTPo2kjtgzaE0NRjK6584x0ByLEEs6uWBc+4afAHa7hyvoPHI+IJX2OvAPZnz
         Z2VUZ+7a81mA1Qd0F7vPFtJyEGKnPmK0MDXKa1ygJfHTZX8rMEA+edeTsX6wAKjpHNA/
         bbrwEcsAcMDpJn4k7qgfyfC2G/2sFKv+hsUFwIjDj/3d/CbrtRA5hAX0wLIdV6NZpKC8
         achQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680178; x=1783284978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB2RgA4LcSFDTrHCUEiIFGumRAW+eppHEw/DC5yOWko=;
        b=sFyHRTDmR7pcp37h69k5/HjsM5pzbN27KGgWd4czTdINsI2WsjcNGbqMgXf6m2/fjb
         6NFQ5FyxQCYHH/X88AbCM4zTThGID++cije87uqIjl/3Kwge7oyAiVYvicuV9+ZWbPis
         bCSrON3bMe5CeCFddaWyDYEkgPpvN6cSwGjLq1cgrG4lzUKX34UdYaV3739TMuUbLvDq
         QzmRRDQIaix+c8CbrU30w9mlUTUWcTlUcO86fzRZvaKWGleEpoHGhZjtwmDrmMPaOY1J
         uTI68/9vAgayYBTRI0hHFogrvSDE5+M+h+6B54l5F0R2SbVuXXlDbJma+t+TEcq80qgK
         zDSA==
X-Forwarded-Encrypted: i=1; AHgh+RphAZHKoqfofPgvihdAaTqZ+y9mB/QsV4Hn8DbrVgj7o553Hqdxvqs3EsZUHplHU/s4OIJnTWAAe5zyBakGd41J@lists.infradead.org
X-Gm-Message-State: AOJu0YyrEccA13jywenta2m9azjb3fUaW3wrjb1Rd+PQKXbfu9w44F6P
	tKC2C5cmQQ/QBcQ1PbW4n9hyxBPVe41CFfa2d8lWZ9vy+NAJo47f1U21
X-Gm-Gg: AfdE7cmLVbvvItRmuX2IkFlywffdrXB3FgdYvr9QJ5wtL4oycDLSQ7JDVviQKEFxuQf
	8VDfIHgnEQc+lFm3YjgBcq3EDDKhJ8BrSiQGgzSBoQJ6zMybS7mtVwqVB5io0ow83pI/kZLMPIx
	6+ETWgWJSyiLifG1SzgS3P3+O9OavFYhmwhTaZQolP+A5IQFxdlWQr/2UaNney5ZzfhpPgI5uoF
	IoHJ8BoituyMi+5eb/5Xx0Srw6YgvEhuMe2rw54Wi1CkWu3dlrMYyZzQWhdQKlR2zQcZ784dl0a
	uK3cM7ZKh8oRTVHuFckWR+4P5pTYfz6Q4qgM4rXcEmjAly0+FKQwf1k5EFlDkKTCA0xEAwdCOKB
	57iI/+3wpgqAA5I1tExRB6h80Oncwnnv0c1iUsnBvpzMoQB5VTjyaMfWC5nIHMcmRdxnmuCW5zc
	BtkcnF7t3sZlPvBnr+3miuxfLRCXgJGLgAkcR90jhHZa1y3guNdFoLhXBpXuloQ0tjC3btlHqKM
	739LDEr4HuqzJn7ddcWvedddg==
X-Received: by 2002:a05:6000:4022:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-4731e798941mr3474546f8f.3.1782680178221;
        Sun, 28 Jun 2026 13:56:18 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f86c34d76sm19448910f8f.3.2026.06.28.13.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 13:56:17 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: am62p5-var-som-symphony: align DTS with hardware revision
Date: Sun, 28 Jun 2026 22:56:04 +0200
Message-ID: <cover.1782680023.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_135620_591918_B8AF545D 
X-CRM114-Status: UNSURE (   8.75  )
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

This series updates the device tree description for the Variscite
VAR-SOM-AM62P and Symphony carrier board to better reflect the current
board configuration.

It aligns the Ethernet PHY description, updates the audio codec
configuration, and adds the touchscreen and TPM devices together with
their required board-level resources.

v1->v2:
 - Remove unused eth property
 - Remove wrong dmic property
 - Fix commit message

Stefano Radaelli (4):
  arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
  arm64: dts: ti: var-som-am62p: update audio codec configuration
  arm64: dts: am62p5-var-som-symphony: add touchscreen support
  arm64: dts: am62p5-var-som-symphony: add TPM support

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 43 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 35 +++++++++++++--
 2 files changed, 74 insertions(+), 4 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.47.3


