Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FE3F9B605
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tn+I0RwhjcyEY1SEHCW91SYXCaTMDaSeSYmqa9W39E8=; b=PqMipGMmRVfJWkhPIMMttpWaH1
	mjZLXpMOwIm0ayYas2sOn2JoPl8k6h5QdE0GX7uwrwmjTR5PEH7rTKUawOoPMjgfoLvR/mmVj8PaN
	bQfDQ9VBvpRolEi8qqDKU/oLhyioy/n0uSrLp7t4UH5vl8L8zoMI9o5T5+4sIGSG+ctPAk3abJXuq
	5Ju+E+nM7POoxEXOm40SLlk6fNSLL0VRbJONr77i8vVScsPtErcUx5Yk145qYujoRk7qdh6TpU5El
	GJrTRC4Tva2tA/bHVi/3hhOeGxsQwzrg3TQTKgIVNSiUG1DEOsGJDXf5bz1OhPUX9M0LULrPQ0lup
	ry2ctp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUNB-00000009uE8-3L2W;
	Wed, 22 Apr 2026 09:59:57 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUN4-00000009uB5-1isg;
	Wed, 22 Apr 2026 09:59:52 +0000
Received: from surface-pro-5 (77.119.189.253.wireless.dyn.drei.com [77.119.189.253])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63M9xVO33161132
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 11:59:37 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63M9xVO33161132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776851977;
	bh=tn+I0RwhjcyEY1SEHCW91SYXCaTMDaSeSYmqa9W39E8=;
	h=From:To:Cc:Subject:Date;
	b=SbodHl7OClX+T7qnFasIRVquRisYzMKFr1cYjbfuJKUHAo4W5Ss0ljghL9+XuwnLh
	 tF5n5+mkSKWQJe4Zo8EgoZUJZwgppp9Amgtq8Vrk/OvmVF2r+UXGWcqo6OY5Fx8d2d
	 jYv9GUCDkwUsZPI9qNKTZRAQzG5t54+bkik3lQVo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v4 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Wed, 22 Apr 2026 11:58:38 +0200
Message-ID: <20260422095840.26139-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_025951_055012_B1E73B8B 
X-CRM114-Status: GOOD (  10.39  )
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

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Supported features:
- 1GB RAM (2GB variants exist)
- 10/100 Ethernet (Internal PHY)
- eMMC and SD card storage
- PWM-based CPU voltage regulation
- UART (Serial console)

Notes:
- The console uses uart_b at 921600 baud.
- Verified memory via /proc/device-tree; U-Boot patches the node.
- Tested on the 2GB RAM plus 16GB eMMC variant. 

Changes in v4:
- Add/Change hardware description to cover letter and dts patch.

Changes in v3:
- Change position of the entry in the amlogic.yaml.
- Change formatting of the Amlogic W150S1 Wi-Fi module comment.
- Fix several formatting issues.

Changes in v2:
- Split dt-bindings and dts changes into separate patches.
- Updated model string to match documented vendor prefix.
- Put vddio_sd states array in a single line.
- Added a comment for the unsupported Amlogic W150S1 Wi-Fi module. 

Christian Stefan Kövér-Draxl (2):
  dt-bindings: arm: amlogic: add support for Amediatech X98Q
  arm64: dts: amlogic: add support for Amediatech X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

-- 
2.53.0


