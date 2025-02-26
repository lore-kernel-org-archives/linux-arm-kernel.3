Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9DFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V7vkfh4ddTTsMmNol3nhPNfYX8H1c5FYy0uhOqg4mVE=; b=FYSRN+GIjATnGb0l0AEGoegdpQ
	gaHAA3Fa0XOM2hQDz2Gn34T5vUQIF4niXwiefp2YaJfIQa73KDrdT3+f2bLflhHz9K6PHslz20t+t
	tKhLbee5IO6yO/Ckw5A+ptnWQgXmAV8U2MaI+oBfeYBy14Xs6coRjL3QAEYuj3JwF+xDqDU/4iYwS
	Gu5HhK9aRbQQGaSJWDHKiveVjW7xj10FO+dqxbdkwamXlV6v2hcB1a/EQAf99ZgG6U9rDxtF03w4u
	sdhK8/afn7nYOxEclPJVK6yqqADHCla2/eCZ7OwRgG9NHz9o3PugkTLNIykREEP70HdUPmn6vCtZd
	Y+nF+D3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKnZ-00000004crB-0BM8;
	Wed, 26 Feb 2025 17:02:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKfu-00000004bHK-2Mv8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:54:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38f29a1a93bso5753737f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588861; x=1741193661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7vkfh4ddTTsMmNol3nhPNfYX8H1c5FYy0uhOqg4mVE=;
        b=MDTXrM1ZVeBEiTor+57zmwBM8XKWE+dTLWRgU4s40RDamMy0QiAQn7jIIGaDY4EQKg
         kS1EZOks/6XNjVBxK4krR7KF6idjj1mx/Ep+JWeSILhnGwVl8FAI9F7Tmkas+A4Ktwdy
         tnj2BMXIdDXQD+mvmR+RfWOfzPzRYOYojH+rbp2oieM89T2K50NxRTRxV5qGzif/QPsf
         qmgfw7/HCde4TomfDxULq+0hllMiy4F6/whcc8TkXIBpuVYAxFOfKzqgxCVrraMEBaXC
         6XxmKmFwgXVAk0hqcXlKHy6KMuvZ9R7SqmKy0LzlNS7xYUvt4f9ssJCOFwRLTncsEvIO
         dQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588861; x=1741193661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7vkfh4ddTTsMmNol3nhPNfYX8H1c5FYy0uhOqg4mVE=;
        b=NjmIpILjrL4OkDPPAJhL1OM2zu0FaIN1ePfxk6B9+aAvc7hQwgYvYb49xAPiL94qWQ
         0LJNzj799zZ6RJH7T7LhlaMY2h176pWFmH/sN4EXqFd6ua9xDv0uoJmjqeM0QI0/X7PX
         Aeg9GkH1KsI6zWj2uvlO1F1uOJcnzZoNFVmhh4/w5Ztaz8B6oNh9VD8CjA11ttHmJ28y
         IsAXwqH4/d4QHQit+Vu6GMy1Y68r/g9PbFMx91oET3MXIzDdvpXN4EHnNHDFwoF0ZFJI
         YqE5zuyIxJ0VofGMCqjcuaGMH7eK6ZmbqraXcxEa3Gwj7/eIxw9SRwIEAFn3VAlYucBU
         eItg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0gGwG9uuBU2Orz1frvNZCy46rLhAcS/3bk32vd6/cLVyeRfuKll+ZIuN23P54/dBdpOCtgdbMg3GKLsWZ6Br@lists.infradead.org
X-Gm-Message-State: AOJu0Yz80dFBoxUsjaHu54F+dfj14ICEj7v7SUFFufnBrxWWz7e8xuOW
	10n3Fz64LGX4i/MdMGKvbnPgEFjTE8qSbXStf+7FtOvsPFvJCEGz
X-Gm-Gg: ASbGnct1pHrKpwtMG+vPr21LF4v5YV+PcOrbLtTr5UbxyXNtEMSrvDNfN5CyOARWVhq
	hm+c/2Y4tJBo6Z4OmcPwi+FZwj9LAMO+IYT2rPhYKlTI0+yeALKLEKlLKFmX5GYRRHNH8sM7Arl
	Ri051FMktI8TG8BuuXb/5DSyZSuib1zPp0RMR+Lr3lx5hU11IGCW/exydy5TjfhAZFetjMeMWA3
	L3uaXtSL5XjioRp3PuAUi960XQoizNG6u+R9wxNESuE4v3oc2YypU712IwXRTBVD7rT47YnuQhz
	iHcnP0uGoH8lBtjBQeQDfa513O9qz7ejBsH7VdI35MsFcFu6FI9YeKak5QCNiVVe
X-Google-Smtp-Source: AGHT+IFkEUgrTUm48/FTrUcUruOOa4wlLyjFj2y//pjXXddwMb+aMzVxF/jrzVCXgJFveDwHMDYHJg==
X-Received: by 2002:a05:6000:2c2:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-390d4f8b6a7mr3152525f8f.34.1740588860292;
        Wed, 26 Feb 2025 08:54:20 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:19 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] imx8mp: add support for the IMX AIPSTZ bridge
Date: Wed, 26 Feb 2025 11:53:09 -0500
Message-Id: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085422_608105_D61E7878 
X-CRM114-Status: GOOD (  17.31  )
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

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

At the moment, we only want to apply a default, more relaxed
configuration, which is why the number of access controller cells
is 0.

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
---

Laurentiu Mihalcea (5):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 86 +++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |  3 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  9 +-
 drivers/bus/Kconfig                           |  6 ++
 drivers/bus/Makefile                          |  1 +
 drivers/bus/imx-aipstz.c                      | 92 +++++++++++++++++++
 6 files changed, 194 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1


