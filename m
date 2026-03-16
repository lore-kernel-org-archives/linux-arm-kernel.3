Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF91EFCBB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=InRSApg/oAsHMCkklXKa7U4eUP4CWL+aPpmu3EyzP5w=; b=MIufSUWuJ9CbYd4M56IY4GM/6C
	uWYbAVUuezSw4D3IgyZwRZLwpAUPttpHOLMieaaO7D2G/qwKWrdVDU6aeETaJYTDnAeFsTc72xvmk
	zhSI0AVYsVf01H14/vwDqQdMsGYZbzJSPhHy67snsdE7xSFCNXGG128KUBvQ8ui943NqyBaJw9oGW
	zGtrZCqOB4l9jvofkPbeo7JT1jUz+Ic+AS9x6HF7FZlXawZc9Ij62DGx3UdSrWAmBMeZjmOO4tQY/
	RdrK4IP7NAGANTnTuPEgTclf6FEKPbxq1cYs2ijk2Qhy70VHpmREjttpPE7unCqC+RRt/Y/PQhM15
	uVYFJtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aG-00000003Qfk-32BS;
	Mon, 16 Mar 2026 06:37:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21aE-00000003Qet-20nA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:37:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b056b7f783so2321595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773643065; x=1774247865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InRSApg/oAsHMCkklXKa7U4eUP4CWL+aPpmu3EyzP5w=;
        b=aIW+sQo9BR3pZIMuOT+hnBBQNUTl2Hd4tWprQHvaBTwfW3gql9LPtRQWa7UiLZW77d
         Dua2kOvuQv9gmTT/1jAEPrT0f4SPATa1TclCkWNpcsiyDevavquHfaE0YWraaif2KBBy
         st3zXAXNfv7fXgTf/0V4fKs0ilA29m67KOvIr8XxfaAF1AqznSUoj75YTXS/fWa41Gqy
         DsyqQQTgqyhLBIhIscrzAi0ASFb5upWT/kBg0rw2tfdliR8eFnMoHptnocp8JkeBkJGx
         DHQuFs4Mho/fJB+PpNzUE5BQvHOGQpJlejzKd1MoZIEcivG752rtexGrPh49ANLzvBFx
         GgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773643065; x=1774247865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InRSApg/oAsHMCkklXKa7U4eUP4CWL+aPpmu3EyzP5w=;
        b=ibbom/XVZ6ivdGiWlezjkJOElEW1Z4IZ7NHzseHWjbtwmNI45X9qRipKpprGY6hCrk
         k+wv+72JXZ828p1BPHStBVodjPhg0daFOjI5KY5SrojHNyNVmdvmPw2sKo+t8yBzNrNO
         NAa8vIond7AV7zonIQD7zvsXWCKtCfvsa6l+BDJoP8wcmly+ohY4vrAThT+LyFvZ1d29
         ekq3CZJHxJ9aWui90RET8+cuBThCcs+Z8HcRuStANlfJmPpIRgEpRnTYhZmNMunlnRCt
         12RZwhZGRvjD6gsMJsC2pUN/7bQ/7UaK+wAUOXa7OZX18N4YvYKvfeKolYa5TsdegHxh
         FPDg==
X-Forwarded-Encrypted: i=1; AJvYcCV91Qv+44858K3/7si/bZJLOHBJ0PMvcUUV7By795d1+L9wEc+E4MugYydkbXnDMin1rNw+OXngPafQ+pK8Rr7u@lists.infradead.org
X-Gm-Message-State: AOJu0YzEIrasy5Kp6VLyt2BaI4UdG9YcNR/3AXSztm2lJz+m0Os8dDtt
	e9iIwXXTbFul+73Tv8H92BvQNGTLc0LVmb5DJV6p9RMNPSF0UZ1lvgkw
X-Gm-Gg: ATEYQzxT8vA3/ByoUFLabB+bo0BjD0BSE4M4h/fSiZIeXI9GFPoFiB27pyPJ4THjc0Y
	nT+CzHXpJVO1eKROkbBFozyDCFwMAZCPfkqFKsGSnSyNV+YZQ12DVY+v7XvD3plqPL8H5LeApWE
	gzShaeY5aXUKLkSw6IdZKywjmGAuSxe9/mB62znxWnVEzld7fmdZuentVQEHKbNV/0r9wzdirRE
	cPTvZjaOVSPKgkOw8DxSLDr3lM6KDmAg+p/aL/N6c81MfLD68GiswQbE/LsBPmFDVWItGWJiciN
	AdsLZiThFy/6/86abuae/u6S54f+mdaVBDBBgnNTXje1ib0NUdagM9iiAOQD5kbTnYD/TNLABVl
	XDYwdl+vEjfBZuHoGq8IYtIAAjCLhnsuE5Y2FB9nBeVQ94MKMr7rhJvbq2Jua3FSvKOunFzkSEO
	St1G1OjrTCkEFiDR7m4uA62uRFU9rU1FrZgbMuXslIN66/M24Y6fsfxSwpIOmDHFC7s49h80UtF
	cwQBpu+RA==
X-Received: by 2002:a17:902:da81:b0:2b0:4c68:283a with SMTP id d9443c01a7336-2b04c6829b2mr51629855ad.6.1773643065161;
        Sun, 15 Mar 2026 23:37:45 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cdf4sm122845295ad.8.2026.03.15.23.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:37:44 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: andi.shyti@kernel.org,
	ychuang3@nuvoton.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zychennvt@gmail.com
Subject: [PATCH v2 0/3] i2c: ma35d1: Add support for MA35D1 I2C controller
Date: Mon, 16 Mar 2026 06:37:23 +0000
Message-Id: <20260316063726.41048-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233746_517517_70476F35 
X-CRM114-Status: GOOD (  13.89  )
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

This series adds support for the I2C controller found in the Nuvoton
MA35D1 SoC. The driver supports controller and optional target mode
and runtime power management.

The implementation has been tested on the Nuvoton MA35D1 SOM board.

Changes in v2:
  - Overall:
    - Rebase on linux-i2c/i2c-next
    - Switched terminology from "master/slave" to "controller/target".
      
  - Patch 1 (dt-bindings):
    - Simplified description and fixed 'reg' size in example.

  - Patch 2 (driver):
    - Modernized using devm_*, generic device properties, and FIELD_PREP/GENMASK.
    - Optimized power management by moving clock control to runtime PM.
    - Simplified code by removing redundant .remove(), .owner, and inlines.
    - Added dev_err_probe() and default bus frequency handling.
    
  - Patch 3 (dts):
    - Moved i2c aliases to board dts and reordered nodes alphabetically.

  -Link to v1: https://lore.kernel.org/r/20260302020822.13936-1-zychennvt@gmail.com

Zi-Yu Chen (3):
  dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
  i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
  arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC

 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      |  63 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  18 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  60 ++
 drivers/i2c/busses/Kconfig                    |  13 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ma35d1.c               | 792 ++++++++++++++++++
 6 files changed, 946 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

-- 
2.34.1


