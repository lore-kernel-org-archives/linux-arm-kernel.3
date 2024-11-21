Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91111D75BD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGgcMQOyoNutpsDucpx7WNm5gsRWQCIIP5hQUFlLet0=; b=E+uOaG8O5TUbt5
	JGYrMViL0wwKUEkeXmg/q8nEACVA/BQJckrV3eyKLdgVk9rgtN/vQLYacRMiYlQ1OkDoenwmRnjdj
	culJGToJyJ6pZaJ5WoTLLWOz/fxnxh7XGDVj9tT5ij9vMsJwfLWqvu1Y9bGXqfTV2cfwhUVSGItDG
	9TjjHXSZKk/RwS52oTQXsBf5gwY+aJeWDoOrXKrzecwJ1OypX3NxhQg2Qjoj3aHm0baJxmgZOUj86
	7D7PHPGoHXst3fq1RyLifVZd4TBndSMKgvmtcDpsO7DOPnnLafbZ49y2U6pq/F9Z8HCya4o2t0YF4
	/+pTZN2crn+EnHMK+mzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2x9-0000000H9Al-0A15;
	Thu, 21 Nov 2024 08:54:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2wB-0000000H8vQ-0ms9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:53:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3822ba3cdbcso446926f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 00:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732179197; x=1732783997; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGgcMQOyoNutpsDucpx7WNm5gsRWQCIIP5hQUFlLet0=;
        b=rEqmtHL1icOh1pGEV17a5sx4YaaCQGP2hgoJ8pQHSqJQ5u7ardsf2aacDYC1QfI/Y1
         yKz88FgWvNLinR5o/QYAegifrqX3FCb7KTPLZPHRhpeL1R758qGmembrWfAEUnOEUNrA
         DnNzZTtTw+E8UncLqeS1lJnhFza/vSGm/6FFxd3mfBkdAN4txneEeh9RSmDbntrwGLND
         Ex4U2yVv0enFa6xuUHu1uIPcYeTRE3KqTzPkeYy5Agqfi/co3GomeOAX+XlJ3mdOG3Ay
         DQjM3fbCRB5MSQOVr2iQg6JFRU0U1/iJplJyfIgdab4KdxEfrzWH51h2uQJCvF/cHFV6
         3DPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732179197; x=1732783997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGgcMQOyoNutpsDucpx7WNm5gsRWQCIIP5hQUFlLet0=;
        b=QR5Kv3MyTRnELr9y4hGCQtmslv9bI7xjqLyH+FJx02tgGUrRCmHWRhzJh/U5LHJdSo
         qC//PwBjAa1efr3hp6k2AdKQZTWlLqlza3HoRz0kTxb+vU/4fiXV22TWkRSEmui4N0iD
         JEw+62YFJNopD2irFRM4LK5k4BjNj2jcwVy8BaAIsR71v7tFbaY/OmkXHT61vpWWIxf/
         XQXp5U9H2BRB7Txb0Itmdx3JC/7tvzL8kGlNMVwAevqtGVnUDvfnF7OVU3bLN8SKlgzy
         5++ICW+hnW0dwspHBUxpkYrV8Ui6WmpzHcAttxUYDsECqKKytoHXmKrjgU9MJEUv7RZB
         HLIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/iqQgK5u7qgFhHXzfuMYNt9oOGu1MDAlUfX6kvq968CG75lZB9oB5wbdudwuG1LbR2CYrw/00keTMlYejGHvf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqw/4aZaLRmvUPCB1wzldWiel4W/xuKrSJvQR4M3TyeRYhsWM4
	kltbJNW5Y7DzaD01njOK6y7JmRlYcfUTypc64IrX3FUoqqk2tQlLGifLBHCG+m4=
X-Google-Smtp-Source: AGHT+IFAFaehgq7cVhvvJuZ5zckDS9xKRaW5l8I8upDHgvwQgsaiHiJYFMDXc+q7s2hhmQYqh9r+Dw==
X-Received: by 2002:a5d:5849:0:b0:382:4c36:e072 with SMTP id ffacd0b85a97d-38254afab8cmr3715943f8f.30.1732179196734;
        Thu, 21 Nov 2024 00:53:16 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382549111fdsm4219900f8f.58.2024.11.21.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 00:53:16 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v7 0/5] Add Mediatek ISP3.0
Date: Thu, 21 Nov 2024 09:53:14 +0100
Message-Id: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPr0PmcC/4XNwQ6CMAyA4VcxOzszB2zgyfcwHkYp0ihs2XCRE
 N7dwcmYGHv7m/TrzAJ6wsBOu5l5jBTIDin0fsegM8MNOTWpmRQyF1rk3DQN78c7p+B4xgUPT+e
 sH7kRpal0CQYyxdK189jSa5Mv19QdhdH6aXsUi3X734xFirqFdQoEeTzXZnpQ7fEAtmcrG9UHJ
 avflEoBmc6hQgFKyy9qWZY358tdBQwBAAA=
X-Change-ID: 20240704-add-mtk-isp-3-0-support-a08a978cac36
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, 
 Florian Sylvestre <fsylvestre@baylibre.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_005319_238529_13817EAC 
X-CRM114-Status: GOOD (  19.84  )
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

This series adds the support of the Mediatek ISP3.0 found on some
Mediatek SoCs such as the mt8365. The driver is divided into 2 parts:

* SENINF: the sensor interface
* CAMSV: this driver provides a path to bypass the SoC ISP so that image
  data coming from the SENINF can go directly into memory without any
  image processing. This allows the use of an external ISP or camera
  sensor directly.

The SENINF driver is based on previous work done by Louis Kuo available
as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/

Changes in v7:
- fix several comments from Laurent Pinchart and CK about style issues,
  such as: sort Kconfig and Makefile alphabetically, remove unneeded headers,
  use 80 char limits ...
- add back I/O accessors around readl/writel
- use enable_streams/disable_streams instead of s_stream
- use v4l2_subdev_init_finalize and don't store active format
- remove mtk_camsv30_regs.h file to merge it inside mtk_camsv30_hw.c
- adding reviewed-by tag from robh and angelo
- implement .has_pad_interdep callback to fix multistream error
- fix mtk_seninf_get_clk_divider to give the correct pad number. This
  caused an issue for multi camera
- use hardware FBC (framce buffer control) instead of dummy buffer to
  deal with underrruns
- simplify directory architecture and remove isp_30, camsv and seninf
  directories

- Link to v6: https://lore.kernel.org/r/20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com

Changes in v6:
- remove unneeded "link" tag from commits

bindings:
- remove labels from example node
- remove complexity for phy and phy-name properties

driver:
- fix some comments from CK :
  - remove unneeded variables
  - rename irqlock to buf_list_lock for clarity
  - remove unneeded lock/unlock around hw_enable/hw_disable

- Link to v5: https://lore.kernel.org/r/20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com

Changes on v5:
drivers:
- rebase on 6.10-rc1
- fix various comments from all reviews (mostly style issues and minor
  code refactor)
- add a function to calculate the clock divider for the master sensor
  clock: NOTE: setting this register seems to have no effect at all,
  currently checking with mediatek apps engineer (OOO until 17/04)

bindings:
- camsv: update description
- seninf: fix phy definition and example indentation
- use generic name for node example

dts:
- sort nodes by addresses
- use lower case for hexadecimal

Changes in v4:
- fix suspend/resume deadlock
- fix various locking issues reported by Laurent Pinchart on v3
- run LOCKDEP
- add missing include reported by kernel-test-robot for non mediatek arch and COMPILE_TEST=y
- use atomic poll inside mtk_camsv30_setup
- drop second lane support as it was not used
- remove useless members in structs
- fix media entity initialization
- initialize correct pad for camsv video device
- add isp support in mt8365.dtsi
- rebase on 6.7

Changes in v3:
- fix a lot of formatting issues/coding style issues found in camsv/seninf reported by Angelo on v2
- fix camsv/seninf binding file error reported by Rob

Changes in v2:
- renamed clock `cam_seninf` to `camsys`
- renamed clock `top_mux_seninf` to `top_mux`
- moved phy properties from port nodes to top level
- remove patternProperties
- specify power management dependency in the cover letter description to fix
  missing include in dt-binding example
- change '$ref' properties on some endpoint nodes from
  '$ref: video-interfaces.yaml#' to '$ref: /schemas/graph.yaml#/$defs/endpoint-base'
 where applicable

Best
Julien Stephan

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (1):
      arm64: dts: mediatek: mt8365: Add support for camera

Louis Kuo (2):
      dt-bindings: media: add mediatek ISP3.0 sensor interface
      media: platform: mediatek: isp: add mediatek ISP3.0 sensor interface

Phi-bang Nguyen (2):
      dt-bindings: media: add mediatek ISP3.0 camsv
      media: platform: mediatek: isp: add mediatek ISP3.0 camsv

 .../bindings/media/mediatek,mt8365-camsv.yaml      |  109 ++
 .../bindings/media/mediatek,mt8365-seninf.yaml     |  259 ++++
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |  125 ++
 drivers/media/platform/mediatek/Kconfig            |    1 +
 drivers/media/platform/mediatek/Makefile           |    1 +
 drivers/media/platform/mediatek/isp/Kconfig        |   35 +
 drivers/media/platform/mediatek/isp/Makefile       |    9 +
 drivers/media/platform/mediatek/isp/mtk_camsv.c    |  275 ++++
 drivers/media/platform/mediatek/isp/mtk_camsv.h    |  170 ++
 .../media/platform/mediatek/isp/mtk_camsv30_hw.c   |  539 +++++++
 .../media/platform/mediatek/isp/mtk_camsv_video.c  |  701 +++++++++
 drivers/media/platform/mediatek/isp/mtk_seninf.c   | 1636 ++++++++++++++++++++
 .../media/platform/mediatek/isp/mtk_seninf_reg.h   |  114 ++
 14 files changed, 3983 insertions(+)
---
base-commit: 00873e6fe91b77e9bbc82012fe6103080066fbfc
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


