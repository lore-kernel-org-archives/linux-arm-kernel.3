Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NkgjM/J9Iy/ZQpNJ94vlbj27WexN53OWj0CXa0A7G+Q=; b=e9EULv9a4xZ3Jil4KzyM184Lh9
	WZdRIoWLOsj3bD9jjlYif64WHAIDsUVss4XxG5Z6OUEPxcAn5j4uC8QJW8t08Y/wc5+Eet2eigTCX
	hkj7qlosnzEaNd76DIjHj8WV0wKhjM47Zu7BeOMBLPMMzz5+Lx7/zW2BLkkiOfWD0TKnsUOWiLlIK
	VaoPEY2or+YPmxUqFdQ2FyCEcHjxmErS9Io/AUcA13sYGBcqDnRhTlKpji/N9VhsAcopfrm1H5xk+
	NYQ/zJb/j38XEpBnu0rRU2QET06BJgbJUjJ0g2+eAEFEO54nF8Fjgrw0ALOhT0z439ITKk3kk2o/y
	bYJwAM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dAV-0000000G5C7-165Z;
	Tue, 14 Oct 2025 11:26:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dAS-0000000G5Ad-2Qy8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:26:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so33650035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441170; x=1761045970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkgjM/J9Iy/ZQpNJ94vlbj27WexN53OWj0CXa0A7G+Q=;
        b=eK5zZtChASjX27v8WO7pmleJdHVUDXIfm5F4EaEWyJCR9Ih9/SMsLYhFZ/Jz++U9zN
         9owWgz9GvC5wEj5pdjxP2+7FzdAurOjFcKyjABucj0RFgls+j8dqCdTZ5372L028YmOX
         YnFmEpTJeYcupoSaL82+Zn+z7Jp0Mr1F+XslZDziT6OrcARnU+0cbLUb0Y6yde9Ge9/M
         KvbibzZgKY1cFGvSO3hPkFdcT1Bts55pmGC8rV4LFR6JaN/SU2Q7utlHRbjFQeyxHZHA
         PtnUJBi+p9hdlhDaFcLO8ZD5/0YHPO1xHaQDfG1LKPWPEqFkaWjSVUtL8lorggiUjxT+
         yizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441170; x=1761045970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkgjM/J9Iy/ZQpNJ94vlbj27WexN53OWj0CXa0A7G+Q=;
        b=eRrvAhNWixjyFNDDwWYFOEenZFO8aed03knw4h7MX47LEkww/cCy+TqtVrbDeJ3APh
         b8ikN3xeXyTGmIiQmb44u6UTwWkwRVJTy1zBhb/Y4rpHzMCCWZshPoBJU4S3lD3IeVGT
         kRUW+an4Coc3ISf8zAlxOYlTqCZQurdy//p3sYBb/FZfxBFcQN33VTKE7JhqweeYRr7r
         +WSmlAAyrXhc5Fc8KFVpOzxXsNAfWzQABPxBn/Osznx4Mkox+cNwRgFoUfe1MYnKNCj1
         +e4MUTkaHzbQIckGQgHq9T0Bf0T86kwW0HJS/jrzCyi4YpK2Z6/C6KrxbUlnbGzy9z8/
         UT6g==
X-Forwarded-Encrypted: i=1; AJvYcCXdhfTGTQmADpnV21gOfiTnobX9UJ+uxdECIU+yFLOyHCsF2vyQLwmMQWkRY/D76TYO7VdRovGHsXGEmt9W2FE6@lists.infradead.org
X-Gm-Message-State: AOJu0YxI3Aty8nzMGbc8rytN69HvpxZOLTa8QI1Hxj1ZTx7i0kyd/wWO
	WyGGgILNH1EAYlMBuUVI7O0X965YlpKrSfS7OTBbV8NM7Uw/UwGKmXT2
X-Gm-Gg: ASbGncvzGS02R+j1vWRJzG9aEiL6t/3YdbSJAx2mqt1Ic+JvBdyAluhDCbHH6Gup+UF
	gPEXR3Gzu7anZAZgNffcWM1ssUDG7uF7xVNKNGSPqxGqCCM2JWmMZ5YMvq1/Z9obJSR4Iv1XcrZ
	V4ErV98LGsYCzH3g0q2PQhi2ry0VMMMTd3KKnS2esqvizYHYfP0pK9Ch7Pf/nR/OoUXkwPyZkFd
	ZWOdZGaYjIu0cBCyslYnJB8H096jRF9Lsd4/ESD/slhmmNoi+gJH5dgQPBVwwAgjkgwLr4NezlS
	AOE0qaZ/mtcL0e1FjuZvGMml6f9N8BWA1VELplYO1oxc6u2eCLfZIlWxqPC9bT0xvmKgLZLEO/P
	/DFiOvhLoYVpJVVtAElAKN1Hss5Wnv75q/xaCV4cTNCl7FhMDqN/QX7cOvN+NNIxN7+wr
X-Google-Smtp-Source: AGHT+IFMf6DIq4h/prpv03d57pehdiVcP3X28cHjsLA6mXHmxzjuKa4nBjbv0JtAImSeizIQEmRacg==
X-Received: by 2002:a05:600c:628e:b0:46e:4cd3:7d6e with SMTP id 5b1f17b1804b1-46fa9aa0b49mr152941585e9.9.1760441170197;
        Tue, 14 Oct 2025 04:26:10 -0700 (PDT)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm265829845e9.0.2025.10.14.04.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:26:09 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ivitro@gmail.com
Subject: [PATCH v1 0/2] PCI: j721e: Add voltage regulator support
Date: Tue, 14 Oct 2025 12:25:47 +0100
Message-ID: <20251014112553.398845-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_042612_655064_444F2037 
X-CRM114-Status: GOOD (  10.03  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Some PCIe endpoints or slots connected to the TI J721E PCIe root complex
may require external voltage regulators to provide 1.5V, 3.3V, or 12V
supplies. These regulators depend on the specific board design — for
example, M.2 or miniPCIe connectors often need 3.3V or 1.5V, while
full-size PCIe slots may also require 12V.

This series adds bindings and driver support for these optional regulators.
When present, the driver enables them automatically using
devm_regulator_get_enable_optional(), ensuring proper cleanup on removal.

Tested on a Toradex Aquila AM69 platform with a Wi-Fi PCIe endpoint
requiring 3.3V.

These changes are based on upstream discussion:
https://lore.kernel.org/linux-pci/20231105092908.3792-1-wsa+renesas@sang-engineering.com/

Vitor Soares (2):
  dt-bindings: PCI: ti,j721e-pci-host: Add optional regulator supplies
  PCI: j721e: Add support for optional regulator supplies

 .../devicetree/bindings/pci/ti,j721e-pci-host.yaml | 14 ++++++++++++++
 drivers/pci/controller/cadence/pci-j721e.c         | 13 +++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.51.0


