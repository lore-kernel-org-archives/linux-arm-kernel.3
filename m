Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GCK1JKe2ZK0bAyJjP9ZoAIohmsbMcH2iCBmdiLRqWmo=; b=Ar7mT8GdzwC6pv
	qLilCOqtJXWUMXrQqts9yJjqDUeJfci85zJL4ab9GO4PeMkbCs9hwULtxHWi+JuovtnVaUvaxxGLi
	N+/wrb3NvjcBJJujDirL4TATlbKWm0ML7SWqRaCqkn5eTwFxXwt6Vkhy5LOhKisUJztSw6j/yM85j
	9/gFdBpkFTLbkvyGq1vkXenV0JaGWenchE6x1NhjkHi23sPCAyEsQ4iX6IFj8HIAVe6gq9NFxbrHL
	3Ss8mLu0eVJebjv75SJwmTjka6WJQE1MnbmzAtrIivJUC2/VkIzcDDwKpV6T3etGefQdPU9g6Vay6
	PRyKSWZ4x8o40lb0+8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabHY-0000000AMH6-1fOL;
	Wed, 22 Jan 2025 14:00:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGE-0000000ALsr-30uv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:59:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3862d6d5765so3994168f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 05:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554352; x=1738159152; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GCK1JKe2ZK0bAyJjP9ZoAIohmsbMcH2iCBmdiLRqWmo=;
        b=XlBQILRHUtECpJR0t4Sb8egMRot3cx5E05jRfHcjxPBB3QcMOYojFYauna9VgyScnz
         RVMjI595SYXaMvtvKmU4PZOYgIh+p7lvQfeszixn2PBeQVHOZmrQ+u5zRjpoH9BVM7u4
         Dnwr6Mn7gejAJxAtwuuoO8TZWFJTkjrRtqUFEz/kzWl/TW+QqmX6uN40lfX6vfMM5VZ7
         zKdBlDNCbgZjkTVY0cZmo1gsil5EPFzDvAXE+EmkZMu4LF1E65SqazWVMlrL8kfne1pm
         QJZS5bfjN4iXmcvqBs9Tf0o4ZAz/BdJKGdXJLxF9QhfcUZ7tcO9WfVVCPpWOm7ICeroQ
         ah2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554352; x=1738159152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCK1JKe2ZK0bAyJjP9ZoAIohmsbMcH2iCBmdiLRqWmo=;
        b=MN6rM2fh0uE/ICCmL+0HLz2bQPn18bST52FXBNNlNjCbZXr2vRm0zwzT1s3kMNvOyV
         5jrFWWB/vDthPyL0LRD/PHil3OQgwz8Sn4gC3nWQL9YhUFWSQwDbRrt2toS/tYexUmKg
         VDl3nqpWyIrJeQP3I+2hoq+/lD5kU84h/HogzYQLxUK1N464wif3o6PJ8TrU3ZGdOb4X
         BWDZmY3u0icBuuTlHuGDaGSqsgcxX67ggjJsrao0y9FcFjyTeLeUoF49ZfujyJq6diIf
         h0fq/NgYOpCuK5luoI+0kblRdapUj7amswbg3eJJYhOJzq7WQ3HR6c1BOJaVZaF1w7/A
         00Ow==
X-Forwarded-Encrypted: i=1; AJvYcCViZRRe8gsEead+JMwgEOy014Tlk8fZoCj59qICqnuTcBxXD0t4tS/Cg6VJWV4hT4ldJhmG/Z9+jmxOKGVo8Clt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx6zYu5uClzh9IE/zrMnNzatYrgJhhFxbASgfOGkxU5BATBPUj
	uaj3otYZatLsIoHHHrzyDlARhsLrr1ZD1HEcdEwpl5gmMlyMDOnsoaKH5B4X5nU=
X-Gm-Gg: ASbGnctjpRj6m1VqBrUBEuza4OZwjtQCgmvGGswMN4yzIROi2UFNXG1uxJOczTNtDmf
	j+tTRskopwltqnTfwTwLJtt/XfZQ9w5Np+Q27tRzOTI6nd6rCUVntfQlGT5dr8H0xg9ffYdHXvj
	z8xQnSaHqtAX5ciwD5jsSCeJjxF7su72OP+b7l8rZeNSyAdIWQTiFPeyzoUZuHd+h3izNyHpMCA
	kXLv9xMxeNHo4brULPGD5mdYKeVajPrDyYceMQdJMb3mF2fl1JF5hXdHDcqMLjS9QnCoJDW+dTg
	yuG38o65yc9yGcIaoWeN/vban1h4qj+cUv39eEPHsWGoQp7MIcO9LYVmUTkmPmQTErog7NXqQQU
	=
X-Google-Smtp-Source: AGHT+IHWF3nO5p5fYa1wUcc11MSGstbqFgrOBJA9XIo/6RP2eDA4+qf2JAiaGGM9QBwZIAEKJMGZEg==
X-Received: by 2002:a5d:5f4e:0:b0:38a:9f27:82f2 with SMTP id ffacd0b85a97d-38bf59eff10mr21554379f8f.49.1737554352559;
        Wed, 22 Jan 2025 05:59:12 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v8 0/5] Add Mediatek ISP3.0
Date: Wed, 22 Jan 2025 14:59:09 +0100
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK35kGcC/4XO0Q6CIBSA4VdxXEcDRJCueo/WBR4wWaUOzOWc7
 x540VrLxd1/tvMdZhSsdzagQzYjb0cXXNfGKHcZgka3F4udiY0YYZxIwrE2Bt+HK3ahxzkmODz
 6vvMD1qTUSpagIRcobvfe1u65yqdz7MaFofPTemgs0vS/ORYxqhrSKywweqz0dHOVt3vo7iixo
 /igmNqmRAzIJQdlCQjJflDyTVHK6DYl068IN6AEJYKqL2pZlhe+U5X4VwEAAA==
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
X-CRM114-CacheID: sfid-20250122_055915_027445_B5C050E9 
X-CRM114-Status: GOOD (  22.22  )
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

Changes in v8:
For the whole series:
- rebase  on v6.13-rc1 --> drop iommu_present and use device_iommu_mapped instead
- apply new trailers
- fix several coding style issues reported by Laurent and CK
- fix warnings and errors reported by media-ci:
  https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/66966282/artifacts/report.htm

Camsv bindings:
- sort header alphabetically

Seninf driver:
- remove test pattern generator, as it was legacy untested code
- use v4l2_subdev_enable_streams/v4l2_subdev_disable_streams instead of
  v4l2_subdev_call(s_stream)
- simplify mtk_seninf_v4l2_register: correctly split the media device
  and seninf subdev initialization. Create an seninf_subdev_init
function and drop mtk_seninf_media_init which was confusing
- Fix several style issues

Camsv driver:
- remove the "30" suffix: renaming camsv30 to camsv (file name and
  function name)
- add comment to properly describe the fbc mechanism
- reduce spin_lock region in isp_irq_camsv function
- remove pm operation from mtk_camsv_fbc_inc
- call mtk_camsv_fbc_inc at the beginning of streaming or only when
  streaming: buf_queue touch the hw only if streaming
- remove op_lock and rely on the video device lock
- implement .link_validate() and drop mtk_cam_verify_format
- use video_device_pipeline_start instead of media_pipeline_start
- remove useless stream_count counter
- add various defines for constants
- merge content of mtk_camsv.c into mtk_camsv_video.c as suggested by CK
- merge mtk_cam_mbus_formats and mtk_cam_format_info intpo a single
  struct, and extend it with fields to remove the fmt_to_sparams() function.

- Link to v7: https://lore.kernel.org/r/20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com

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
 drivers/media/platform/mediatek/isp/Kconfig        |   36 +
 drivers/media/platform/mediatek/isp/Makefile       |    8 +
 drivers/media/platform/mediatek/isp/mtk_camsv.h    |  152 ++
 drivers/media/platform/mediatek/isp/mtk_camsv_hw.c |  440 ++++++
 drivers/media/platform/mediatek/isp/mtk_camsv_hw.h |   19 +
 .../media/platform/mediatek/isp/mtk_camsv_reg.h    |   90 ++
 .../media/platform/mediatek/isp/mtk_camsv_video.c  | 1017 ++++++++++++++
 drivers/media/platform/mediatek/isp/mtk_seninf.c   | 1454 ++++++++++++++++++++
 .../media/platform/mediatek/isp/mtk_seninf_reg.h   |  114 ++
 15 files changed, 3834 insertions(+)
---
base-commit: 414788dae5ac03f80234629c6d140a38fb1fbf9d
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


