Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E76D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 10:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=; b=c0SfDe2ex5+ivLNeQNOGvuNxvK
	0WteUu593RqQ4amlwcVB2ImOOYKQMQ34GCBIVJiV8udcCgL2NG8YAj8lD5qOIJpqQaRHy8RK/4uCW
	y++KBF6jaZUu0Cgsffla464gvwcXENwB5yQpnjnxWW4dNXQK2W0j6vHwnCJdthfSBpQv/cfokvkt3
	QP1RfgASkqGV/B+mwdYPx1AeXht/OfthGwheMjMs90cOKvc/w1j10WKqGS5Hkj1iGtUoQvx1ScvFm
	GJbgTULJMJyxGpU3xzKvVr5OWbqg9e6a/IQkNWAazZK+qwMO7weFrnRyLeo6LBZZuqpj27J5baopL
	dF6YOuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRpEw-0000000AnrL-0I7I;
	Sat, 06 Dec 2025 10:10:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRpEt-0000000Anqs-3HYZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 10:10:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477b91680f8so30583255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765015806; x=1765620606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=WAD2RLYwoMGvFYAW5fEnK3geDsxpbil073Vfr2FdSot+MP6rUR209+vzRjqs3O822z
         IDrzx9yg1PWyA7zzRZansb9WIKC5dXe8945lnam5PyP3mDWWLgH407frmO3PRoiFztjh
         ZrPAa5Jr5SlnVSq2g6AMQhcumWEzc9DksP+kwDSzYKmaQdgEgT4g2syilG+LswPdlW/K
         ptLVn5m7ClyE0LPCQf9+XZZ1ODscfrbB4/ChDGGBmxiBxIwOLUrVuSFHwCCsPV+543Fv
         Xc/lAcjxkIzDlLKOZ+mk0Ul4OlHWhzqe42ASrySCzeyd+nLXnN2h6UAPg2bG4jXntlvl
         4UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765015806; x=1765620606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=WF7GL1HEKNSbf7XLPFPkiBhlA5G56CmCk4pyzFQt0OD6QNvOYSSRbNhuFtxxkuySxn
         8FzWvfIgcNTcEzcKtylphC/PhI3ya4f/JQip6H9V/fNjrxsVepNW7kBbboSSYVadBDwl
         bdERU/EGpj82j87Qty2q2H0GM52INtNmhqU2JIcIG4irlzW0QCtASFlyx7A4VBnkswgL
         yGfdVvm5sg0DTfeKuCfvqU/fBQk6FN7Tx8XtYW3KLmTjNXQBgGycNKbFe8aiGY3gRqgH
         NzrPaS4p9axjk8mRQtLKcHQxHp+NBBmjBFaFhVDk7Y9AzLcKHu5kqfzOE0LWcEW8Azkd
         z8NA==
X-Forwarded-Encrypted: i=1; AJvYcCXUp10m0AhjbPDbAyj2wt1VpIra+eV1lInvdbgXhDA7xtAp3ZGix819FJn/VqVVRFh39gQTBnBP1uz15I2nFg08@lists.infradead.org
X-Gm-Message-State: AOJu0YzrurIjAHT+2sahInBj8ZKRPqI4dVPHjTEZaJ+aZooNYpILgeDm
	+jXKre6OJkmjD8IyxEbJwU+cisHjLYENx3qxsYai3U+vT2wv+0o+bdWZbE2odaaUdqQ=
X-Gm-Gg: ASbGncsk2eBXznsE0+txfDG64Nb0vTSihQk4LWuRCY787MaP4lHVuZr8Oxi32QsMXX6
	eVYuS3cO8B2NmAr4KvUB4LgjyOenavpL2bpg2c676/0pZ5Omtx9ZCpjrV1O8wMjxzf//7dVzzyb
	+593WfFbC5aS4ey4ODYmQiSGajtavYcN3XPZjKHdtjZhOiHhvLGL8N0SdpTuKqhSeX7qt5isBN8
	Z5nr92Gfbvw+wLK7UTh+1vTmF1ow0gI6x1Im8jef5B+NCreox6kpM/m8IaELIwVmEAOcrB0pxSq
	6No8c6jravvJsxjWDCO06k6QIn5tbZxfRsUFvoqZmjWO+Vn38XqenjFBowvJ34Eyv6E75D5IL6F
	hclhWQ31nOd3ufAKibL7ZaqYTNNXeNt/bqECHByNUsaiTLmhxo7vxvZGtyJ+fGXnDqwwK79yju9
	mU0+vd0eGzmFMPMPs=
X-Google-Smtp-Source: AGHT+IHCCSKpPzDS66jMH4ALE7X9BZR5z4AUj5KRqSpHUrEc/DwbowSb3EPWCQS5cwLW9Z47DlGV3A==
X-Received: by 2002:a05:600c:1c0c:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47939dfa46dmr19757195e9.11.1765009694011;
        Sat, 06 Dec 2025 00:28:14 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:13 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: rockchip: rkvdec: add support for the VDPU346 variant
Date: Sat,  6 Dec 2025 08:28:05 +0000
Message-Id: <20251206082809.2040679-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_021007_835887_C564EDC4 
X-CRM114-Status: GOOD (  16.60  )
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

This series depends upon Detlev Casanova's current v5 series for VDPU381 and
VDPU383 support [0]. Patch 1 is marked DO-NOT-MERGE as it contains fixups
for minor nits spotted in Detlev's series. I've flagged them on IRC after v2
but the messages may have been missed as they are still present in v5.

Patches 2/3/4 add support for the VDPU346 IP block used for H264, HEVC and
(in future work) VP9 on the RK356X boards. VDPU346 appears to be a close
relation to VDPU381 used with RK3588, except with a single core, output
limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU346
vs 6.1 on VDPU381. To handle differences we declare a new compatible.

The device-tree changes are derived from prior-art in Detlev's patches for
RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
from Piotr Oniszczuk and Diederik de Haas.

The register differences between VDPU346 and VDPU381 appear to be minimal so
we currently and intentionally reuse the VDPU381 h264, hevc, and regs files
to avoid duplicating code. If further register analysis requires separate
files for VDPU346 the refactoring to Detlev's drivers is a little beyond my
current beginner level c skills. As the overall minor changeset to VDPU381
it would be awesome if this series could be absorbed. I had some discussion
with Olivier Crête during VideoLan Dev Days last month that suggested this
might be possible? - hence sending now. If not, I'll wait until Detlev's
series has been merged before sending a next iteration of these patches.

Testing with Jellyfish files of varying bitrates shows that RK356X starts
to experience jerky playback above 10mbps, which seems rather low compared
to RK3588 which can play 300mbps media without issues. The vendor kernel
documents 'advanced' assigned-clock-rates but increasing them does not have
any obvious impact so the difference looks to be something deeper. NB: The
same is also seen with Detlev's patches for RK3576 (max 15mpbs) so further
or follow-up work is likely required. Despite the apparent limitation real-
world media from my collection plays well.

[0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1015221
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk356x.dtsi#L1539

Christian Hewitt (4):
  media: rkvdec: minor fixes for current DETLEV patches
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 ++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |   4 +-
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |   6 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 110 ++++++++++++++++++
 5 files changed, 166 insertions(+), 5 deletions(-)

-- 
2.34.1


