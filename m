Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03862D3B7D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=; b=jQ0iQ+6NF7yVhKYXEMbELfOBrL
	Y2Jcvevb6EQzRNMaRg+mtAYJfZCiLtZZoRwcT5dE2G47OISsA/zAiGSQsWUgUhZ1r3yIVytk+D2A5
	/682QTUmT8HsGtDKuoMk9+8lJSJ6Ly5dy8rQMMd9BBWdURVpnxteoRFRnkupVp1Q+cfTMP3gkpad1
	Ir6drVUNUGw2j+zlfOV55yVXyOHlXBJCfF8yf60rsGiwuDyAvh4lMc9RlWYcM5E7yb9wVvdSTdHZu
	6o6eYCKS0NlMMuqEomAgKSTX1nhXRVcFOP/hQojF3agHObcDk5nF5Ru/2wwNzp5M4kf7bSk7g/f8o
	80LN4Y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqf7-0000000AscK-0bDu;
	Sat, 06 Dec 2025 11:41:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqf4-0000000Asby-0o8g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 11:41:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so4786961a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 03:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765021272; x=1765626072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=HX2tQr7weo3qv4lQw1ihjq98avFff1h9GZuhXjXKeBynYywx+T2eAVUoZ5MLZv27cL
         glUKlUdXpB8EXHQdw1xkECFWmuPxydMkcM8CctiLp1mYO7n+PzjTasnJ91PnXWJ5kYtN
         7sRTvQFU6Yy5sf79MQP1Nca481jXr+YMovkUrNANLofQVv3wtxrWCEwCRsvEh4Y9tSob
         okTTs3a2HNca8U13O1mY/QZPUMKuXFLO0Go0hLFaKZUaM+bfAOheXrWqWyfsyPjHufTU
         p26QUP6a9b5Oqw37F7TL6+HtYhjmde9F+HK6EbJ9JJ2M88HiY5LcNQ04aPmcUy6WAW3g
         mAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765021272; x=1765626072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=It1pQz+HkiJLsN+un0IpJdtYI50zL+8l3pqgOoXTLAT3qCyjdMDokW6OA3Zf5ixT9B
         XNb64nU+m8MsLEp66rczOgpEvl86ksZtvnIcCvIzRfSCAxmdsr4abhIB09VCdHc+eGvW
         cvFAD+ZYvOw78UY5wSXHZ24JIGMVqcnLIFwP5lZydDrcD56s1ykyAH/jC8Uk7QzDd5TS
         qrscINlTyG5H2gB4+vfCMQKXy54ZpB8U+4HB1H9rwuU4llMKwgZYPRKacwpj7GO0Onee
         AU9k754tqKiQdhsIpuKI6cTrnHy6zXzPPMNMtT4tJhMw6cNkuzKtivhDeoBMfleE/dPs
         Gi3A==
X-Forwarded-Encrypted: i=1; AJvYcCVTvtwX/eJca2V5WwlMWthxWvAi998bm/VDJK7Y/pNNTBWAtmhTLBm4orJM/pObM/CDRLbDSd6NkdQg2AEuik99@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc1yX5kOL9G6GN2GR5mq+LtAsnAHjt32XntO27sk1FtSYNoLNR
	IgLkGc98FCBKSi4hgtk1QqwQRl0IPcoEpb+IouqYA6o8yW5kh7vNYJD3zGxtFuOzfXY=
X-Gm-Gg: ASbGncublJSMG0SOrnaRR1Li4DuUqyVM2Jm8Cf7oBD2AeSkCxtNAaqbcvQXWaddBIbs
	4SAULlSE9d/LFiJKUgEGmsaIEl1fF2VQtxfX2ddQPEMtt/DmizWPQWZWF1VcCFJq8veayP85DNb
	Iq/qXp6DrsQznn8GMEEAbRXFfXi+PtJkQXG9O0OKDOtjzFKch9kmxoTxsDhwSucBhkk+KODp1tZ
	+hVNXxPGZ8NgGmNpb41rNRiEmnBWsykG3Ez0+qDpXQMjUH74/MZRxkfNw5UTAvHwdb+IUclrNVp
	FkITRJCxawwwpWAYX9drYHjWz1zwJWefrSNUxn9VFmMMPLBljHjJp4vK3Hz3fQ+VsbjFwElI2dB
	AFqkeBPDq3F+oS/sX3mpAsvF3a5/SYna2uMRPq1YP9/vy26BUqx66ymyOhbkALCpaqWpzpsJYaR
	8FSR2t2orokk8MciY=
X-Google-Smtp-Source: AGHT+IEutgnW3ziDYssPsy/rObFW3KXEtxwegCsIX+tFKBiL4raHPJrNmS+xnXzqQl+ZEEwHsCOK3Q==
X-Received: by 2002:a05:600c:354d:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-47939e4a8e3mr22685325e9.31.1765015323917;
        Sat, 06 Dec 2025 02:02:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310c802bsm126055205e9.6.2025.12.06.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 02:02:03 -0800 (PST)
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
Date: Sat,  6 Dec 2025 10:01:57 +0000
Message-Id: <20251206100158.2041439-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_034114_268705_342A8C8D 
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


