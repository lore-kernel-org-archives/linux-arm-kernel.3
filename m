Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FCAC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JLyUxHiWG+Qb25pc2VnBWbaaEbMsWfKxOQ5/RWGEgSw=; b=Py2vesr5Kqhqc6oexV38ClMJQ7
	78R4TzkWHQ2rSTZYECsa+6chGJHo4dd0oVq/pKE22NAX+lNQ6nJw8bqJecxC8oVZUy0KmeXnePZvO
	6GEf9S2KV7Le0+stSx5brSG1klNS8ok1hf/BWVSST3ykzDFCu927Pm+JcTSnLT16B5+lxguxzGVze
	b1PyFY6kOyMixkOzh64P5Rvf2RZJEEqu1Hh7NFCI1+X+K060PnVSBO2WTWbVt/Qu5tq+F0yAauXPr
	DQJzz0vLn89iCI6XKJRGH+wdRdRne6Hr3ytBTNTQ+ZpZ1ZaQmQFSRvFT+0sKk34XMtTjoW4S+q/9S
	VFAC5T6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s4e-0000000Agu7-1LiK;
	Thu, 10 Apr 2025 13:36:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2O-0000000AgOf-2Xqq;
	Thu, 10 Apr 2025 13:33:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-227d6b530d8so7155375ad.3;
        Thu, 10 Apr 2025 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292028; x=1744896828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLyUxHiWG+Qb25pc2VnBWbaaEbMsWfKxOQ5/RWGEgSw=;
        b=I1awk4DDIRualUxXwO3wuAYVa+P180XSYJAcKXBtEm+PQ/+i4Tud8StQwiqdESALLh
         ZVs0zPdUuEUZJRI8Mpuusms/lkeymdEdCDZrR/VnBP7iipT8tWM3+lQUB+DSqiNYn/7J
         Z///gEHIaUJ+Hh+zuOmVAeymyoDEy6ujwaxZn14iM0YgokrD5qCd9hby9DQiY4qEHnO1
         ZkPCrKTEY1s6cCs3rPoz71bZHlGKMFaVs+WR9fE/OsCZ+26VAiH30lsv+QnWDLvDR1gQ
         ucXTH/xKTkp+ubKS/E0z7GKmQXlS+QXC8577d25PUaYS91IIP7KCC8pzghlvAL+DRiNJ
         8n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292028; x=1744896828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLyUxHiWG+Qb25pc2VnBWbaaEbMsWfKxOQ5/RWGEgSw=;
        b=q6tpeG2jTr4+rEysPBFc5k6eDxoNn5UvHA8aCj+mluD3eaEauNgx5FhX6dJERPbZSf
         WTwruVmWCPoKBKWdgyxCQ7JQtIwXo+Piog/uxB9/ZEOtHPDsGfvdlIhqjwfRtrU/lz0q
         6SfqkR0sfUvxQwgj3OwS3GgD+jURhheiW3m4xNsWxmtuX3GNocoOhHQ+imaIEU0+Sik0
         5a4y4DCbqHKkjL41z/JmJ8KFokY2INfgePd1KveTzkMAv/+AKiiVJEPWmOnLdd69+la1
         4pXY65QoMGx1+V3tzgvjQPehkgJEbWp6SkDlvDXtPNcGbY75KxfLBKdi5t0lfwZdZqtB
         QtEA==
X-Forwarded-Encrypted: i=1; AJvYcCURRDkNVo0gd9fSXkVRGjlwEVgoZCnjBPCUhyWtwq3hW2eUwbfadh0B+v2WpRTu4+xv5JvWARLoNlnznITA@lists.infradead.org, AJvYcCVszH+/QLQZSI/h6Bvw48zMjVg6KCW+wuQBt1EDD/bmMgE5YnTQkkL9eG2OeNXsO3Sn3vU+GQ2PbUpQ@lists.infradead.org, AJvYcCX2McIFNgYZ5sq0QfEuLs7ff++FH66SLbbU8otJGlWwFPJh3mwl/QZwhIHMEgkplWvq0Lim+5QSJ1oU4/3C8khU8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiJHyM1UTfdwOvVI0ZAdxMQ/CT8ponuMiwS1WqwSssZjX7KSFu
	ob4Jwe1+H3hgR+3DdcE8F2dKTix2BtJYDsLkFwnLvORBpv/9SQy1Qzw1Hg==
X-Gm-Gg: ASbGncvH0msBdTc0Jtiq9jwZeHpD1psKwnA11xOeJWVTXDtHE3/XmlKgXOLV0TEdzvR
	g9OcWIwPpfKI0wH2dMgTeEJJG5egg7ToASsFwcUbAM2Udnl3hbohztcheoShy4LnLP78b280oCv
	1cGc/QjyDpMK9QEScb3i7gYOGfi36pUu2bC1ruuv4hxQbs0y7eluBbwO/inaCLku88IB4GgOgVv
	Vx181uJhWpPhMKZtG5YoknnyFQVsMZLKzSEkcS7awXvJdLlufUV3iFiOchGyyE50OirHQB6GiNN
	9yINOtBCbVaTSwbwlX/hcMTBzF0tG2vdr+qlFCKPnYBmdniPUd4iZrE=
X-Google-Smtp-Source: AGHT+IGKx5ChlwcV+OyphM7aWOQy1ODyOjgSEu2ev4g++EZQWZ+gpROGMOj8P4ESA2R8jvzGplRRiw==
X-Received: by 2002:a17:902:ea0e:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22b42c511bcmr35919265ad.49.1744292027773;
        Thu, 10 Apr 2025 06:33:47 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:33:47 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/6] Messon: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:15 +0530
Message-ID: <20250410133332.294556-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063348_646301_8A7042BC 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi All,

Use dev_err_probe() for phy resources to indicate the deferral
reason when waiting for the resource to come up.

Note: The following patch for RTC:

phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe

has not been tested as I do not have access to the Amlogic AGX hardware.
However, I have made improvements to this change based on my understanding
of other code.

Thanks
-Anand

Anand Moon (6):
  phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling
    with dev_err_probe()
  phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-axg-pcie: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie
    probe

 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c      | 10 +++-------
 .../phy/amlogic/phy-meson-axg-mipi-pcie-analog.c   | 10 +++-------
 drivers/phy/amlogic/phy-meson-axg-pcie.c           | 14 +++++---------
 drivers/phy/amlogic/phy-meson-g12a-usb2.c          | 10 +++-------
 drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 11 +++--------
 5 files changed, 17 insertions(+), 38 deletions(-)


base-commit: 3b07108ada81a8ebcebf1fe61367b4e436c895bd
-- 
2.49.0


