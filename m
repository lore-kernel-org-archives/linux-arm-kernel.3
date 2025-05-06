Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A7AC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=; b=CdZEliM9x267DSMyYUkFGlWs6T
	QFq/7g0aB9V5AKn8g4thdWWE0bTGoXfQVQTsBykMM7Q+8cvaEMtJNyzkRIDwNx7l1TUJ+Lk5CsCde
	HZQfSF1wSHC6lOs9wLji13iAkWs7oZ0LM0jeBLpoCGsTmoUjhUaxvDQaclBmOf22lcOJI5QWqS1sY
	iZbgPHbYEJDxy3CXDHFcTFBP/qvbjiNAimaLSDFDKI0jspQz6wep2ZJshdncIrwPbA+ZRxruGNm2i
	/EpwnNSrcjP0XdPc7PB2OVU17PyWT3zFy2WP3+tBfxBq50VqbaZyomfwHPwwbXSe4tuDK0Ls8HkoN
	szUU+18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCG9C-0000000Bfmi-3uzR;
	Tue, 06 May 2025 11:07:38 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEfz-0000000BONr-0N1L;
	Tue, 06 May 2025 09:33:24 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so58366216d6.1;
        Tue, 06 May 2025 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524001; x=1747128801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=;
        b=PO+cPDQIitvM+hg9fjYPEooohO2bqKHpSxjozHVozAQZKeAVNr7myYhz38tMjTEI2k
         gyRw6BYqG9wY+d+WUKDdxlbzmm8AaDd9JPci9EdZwWpTgDEJZSe6cPd+MeaiEfLXJIc7
         367QymMof8uSqiH4OmobcKPB0IUj4YUI9N0I1a8PkRHZ4d1KTHRVLnVSGMNNePMf8Qz4
         nHYImrAkKkoVTQcqsR1aTs4a1K6D9c49evFTdRb89O9kIOaEYhkNe8yzd2+5A6p+OJ/5
         PJvwdejw0OlrozqgW6bNw5ydUTu5AnQbHwHaMG2SYIFHDWQkOhi5UIwKWelVDngjlibX
         9heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524001; x=1747128801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oX660r49SMPlsIsK7beVHLYMkPYM6F+6v7W4PhVK2ks=;
        b=KYvmNR0I7CGnbAEuo7uShpRTOJ+eTiZFjCY+RiI3nUIUG+Est9bRHSV/IGnssnUGal
         XZJUDDEGQjjvcJumrKHAs9NYkJu/592PvejlCx6S63S5Q6BESnwsg3USoCTLvDUfBNaT
         QOXfUgIxvYTVmEHX/vjvwvSZwCMEV2e1nvLhvUP7aMudWKuwFPXOqBaSzN/GLtAMrWfY
         aywBMjRE5QPXg0p+CgNDIegD8qNGx+fGDVABW9HNZuK5H0kklGTEI0BHBZl9lDlrlZxg
         W6/vj0qA2MeablXrGt0bQ/NLbw6OvfyTee1AiK83j4BI+W8lTAiiesQbG+zRLMB9nP+R
         Xp0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEsn4S/p/19MDnKELOIOrGCEgA/zIzWX3PRayzXkdmQVY1Gw6/ypTUe6IOsDsMhVtD/ClU9b2J10+IL1Xj4IdN@lists.infradead.org, AJvYcCWgFgSxFchx/P5oCiEFbyYMki+7/SrZebV3kqxH3Njd4I3vzFnY+icEZZvaejQMbiuUrUwobjFYDxGWJEA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgk2MD4XQfYZuD9blXkWCHYn1mfCgOXjPzFAb/IGiMSuiqJZab
	et2fYweq3Xdoza+t8EdwA1/CaOfRTVFdr+mt/Ob+fZHtb9D0xHfJ
X-Gm-Gg: ASbGncv3aCYPYonrWEpF3aEGaunyWvRqViiUnBIjt8OnbsWXWCLqZyDfid9NY6QnnL1
	JqdRMVRP7PfvSPBdU6yK8xh+vTGOLiqtdLeqMEXu9Fbw1pQy1AtuhspQxsGsT9clYWPCDdTpqlQ
	CqBxt+8sn+1jAH7dWuBy5/I4TJQrM2DOaDm4nhrmIR1DrseI2gMRK9Qu45GCxk5oXTwv+v8N5BT
	n0kulU/oJobdbW++9nisVm1ssGoVubPITIxuJ7TSuNKIigLc2qv2HH4N49wNqbqfQoSaVUw/tv/
	MexDx24g3dfe9wmG
X-Google-Smtp-Source: AGHT+IG0tpbViwqp9IJzfEAZpGJYiDuvgoMTMj0cgQ10I3tT7p2nWJKoF5IKgXDVmrvJ8d3QbJqUDQ==
X-Received: by 2002:a05:6214:20a3:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f51574c329mr249376586d6.13.1746524001422;
        Tue, 06 May 2025 02:33:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f538316c12sm6219536d6.0.2025.05.06.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for SG2042
Date: Tue,  6 May 2025 17:32:50 +0800
Message-ID: <20250506093256.1107770-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023323_124448_B9AC28FE 
X-CRM114-Status: GOOD (  10.16  )
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

The ethernet controller of SG2042 is Synopsys DesignWare IP with
tx clock. Add device id for it.

This patch can only be tested on a SG2042 x4 evb board, as pioneer
does not expose this device.

Inochi Amaoto (4):
  dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042
    dwmac
  net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
  net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
  riscv: dts: sophgo: add ethernet GMAC device for sg2042

 .../devicetree/bindings/net/snps,dwmac.yaml   |  4 ++
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 11 +++-
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 62 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    |  1 +
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  1 +
 5 files changed, 76 insertions(+), 3 deletions(-)

--
2.49.0


