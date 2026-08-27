Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401D3C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=; b=2okh0Nk4EP5aBxtoEQ7Vy2WYFl
	CHgvNncTYPoeHncSNDyFJoP8EpQioDKP133RCP8lNVGXmMK1zM5Cwwipwue8BXd5YbrDNq4+/huYR
	xS1DVHxn77yi0KUqEYUHk98Ly7K2VoHNUaX8B2ZpgBtGchBmpkbSrBrt4fu/DVj0s8CgFDXwE6fdY
	vRJSghOfVkGoFvXws2xKgm82woHvC+V3WQSknT+LS5I5fWBmWgwFMUhxWjUsQS2O6FJMDgoxnGBPF
	lbA76bJzU3T64/li0LHsZGPhiXWutupaEGHVHP8JkjSptKys1y287d4LNvymZxSS5b9ZbxW+fshsE
	rUju3L6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbiR-00000004DaF-1N1N;
	Thu, 27 Aug 2026 15:08:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbiP-00000004DZt-0EKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:08:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47fd4531020so1340128f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843306; x=1788448106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=Mzv8wAuF6Qco9W4cXDqsU9LRj8yWfDK/Dnvz3JBJ3mT8BpdAEnlnr0fJ/9etyeFQcZ
         fI0+ph+LhLq6SAp2CIKPIJKtge0V9M6j1Mks6svCMlgrRZ9CFQcqwYBIAnB14Np8jmFE
         Lt6MmbDE7WIPF3GgFpC5ZH1KslmWIlEZICyUAUrAQ6M773XRtuJyGXa9j2rDgfUokTsq
         SdfLTf3sFh7Z+W5wvYtBQh9U+BRiEK15ykZOOPWOBu9a65kwbnPJge1d8ZximviB8553
         qAJDkfNz0p5EW7N5YT5vLB0jczDRkXii/lVDc6LZAcCwDBOAqMjXZjvIOAGitQIjRKAR
         CzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843306; x=1788448106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=k6j6csRnUsrheeMl2RA7aHaosGhbpHhsGIIDjYca/uO+AunTaSDSQNiSS38Spzfl5k
         2yPu8jh70AVd3hcKrDHuJnbD0H197iQzjx20OGXGmKma9kpkB+hLsRDp23xgBGMi5w0D
         VJ4lsS/ghoro0ptLuejK5fB6mGswSpuLUmWi3og8D+nP+Lsyw+43ku1kXGhmOOYaCCKJ
         womdjGJIoLKWIjokPKKtaxRY2Qxt3QMcrxlsVcpOHakf+FgJxc7Ma9r2AT+Sl0r1YW2y
         iU2op/otaE1dsdMa+IMN7VVChMq6yP44fdNDvJMVK5eEN1TqPgFYElh1r8WJtVr268Ia
         5dIg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Z1Yx6U+XPCFpHFTe3tRwVapqg8fbuxcgjS2ZWoR1meoTX5MTkKhOhWO1PRXQTVd82nmGrYOpboTcNEpcDvfN@lists.infradead.org
X-Gm-Message-State: AFuF++kGuqVKpCzThYbLF934Y2nVIsWVsGU3hNddjAbFPzrM+jvQVzET
	V8c7z8QHIzS/uMNVU39NFDHEIrc/kkW0sG8cmVY3VQACLLM+NqvzZY5NHkmwRA==
X-Gm-Gg: AR+sD13x8StPYqprr8eO5zJtEhTC1ztOvOqPzzEMeP//eg1XEB4+wUfKsOd2mPYQf6+
	4AUhXFZCuzfovgnxNUqHfE7RiDzqTp6Y7kh9NN6EyOQMiC7Irx0kw9QiOsOY/Fcd5YcHJ3Z9hXV
	QVtxz0giuwUUgf6KN/dj6r9CVvaskgUHdm+XA8YWCebDbdHbEyXbrTx44mF4cex80bKZqIKr5IN
	1nQBvjXqwas0Po/u4zZKix9KKNj5YOPKD9QEghezk7FcSguGGBSlNpdhhPaq0yY/UcrASNhZf0l
	L3ih4zt7rzJqR6hpLmdzxT54xINj2OBoBVM0q1mMCNboF13cDj3+tqzf0kflyOYWMVDwD3Rkcfn
	Oz//gNpQKW1HmJEmCibBSjFM/k04o27xtEj5GeuFunJ+/iwZbaqJBCQsj8SjkiSlJn99uzQK+Us
	h96u8Dg/73RfYgdJymOgkT8vJA9BpkMMiyGF+WPpTqWK2JvGke4MyXMItQa8PxvEW7HNd4hNG0r
	t6lAnOnRY/UxvU=
X-Received: by 2002:a05:6000:26c4:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482e26bf25amr18874741f8f.3.1787843306015;
        Thu, 27 Aug 2026 08:08:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:25 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] Introduce basic support for MR-NAVQ95
Date: Thu, 27 Aug 2026 08:06:55 -0700
Message-ID: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_080829_124270_4AD983C5 
X-CRM114-Status: GOOD (  15.60  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

---

Changes in v2:

* remove the "pinctrl_usdhc2_100mhz", "pinctrl_usdhc2_200mhz", and
"pinctrl_usdhc1_100mhz" DT nodes as they have the same configuration
as "pinctrl_usdhc2" and "pinctrl_usdhc1", respectively.

* add "bootph-pre-ram" property to all nodes that were included in Elena's
u-boot patches. See [2]. Note that "imx95-u-boot.dtsi" is still required
for the binman node and for the rest of the nodes tagged with
"bootph-pre-ram".

* link to v1: https://lore.kernel.org/imx/20260825120812.2152-1-laurentiumihalcea111@gmail.com/

[2]: https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629002.html

---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 237 ++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0


