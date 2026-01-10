Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CFBD277D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 05:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M1cLpdxtlbi2JaCKFB9k+hFNl0clCCKVFpwvaiNr7xQ=; b=nE0kq4efCmVyDUVQUTDwx/XsJW
	GBuGWPFTzJEkBWlUbkty+S4BNlaycYh9DNW++CqFwkag/6rQUO4Bcs2u/06tyDJu+wAsXs+H4XEgq
	Idwh06NtvHTbw8jf2PJIo1/niRqBDcTtBtHM5Uv2N+mc4WJsUrmHO2C5PGJBZi7nV9jLD11T3yYe+
	v+pGPvKbsG7eZ8/X/gooL4+ZbtdHjQlSMfVm+WbqZUN+v07xONPymjcYrMGVjvxsfs3f0ml6EMkUU
	ukKoYwBYmj8Ph6LJVnauluIyIL39aXlcJWj/mZNV2GamSGkA5s5avpa0HIU0ik4jtVL9pMZmHNAK+
	+CEgnAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRfP-00000003HKM-1c6o;
	Sat, 10 Jan 2026 05:37:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRfL-00000003HJB-3bW4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 05:37:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1785447f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 21:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768023453; x=1768628253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1cLpdxtlbi2JaCKFB9k+hFNl0clCCKVFpwvaiNr7xQ=;
        b=czgXwIZET6Uz7OId2ddf+r5hTzKb9C4a2m/bP4/zQB1WI4IYgOjHXsE4HDUrE5AP+Y
         Bfq4lcUicUfsMFfD7/0O9HLw/UIPVsbegVdS1N0pGeU9BCfoND1pWZ88c7tgv+IxHONE
         OJH6bAhDCHbyJ1K5W2ouV97j6Alse6OCP/cLxyuUXGMC+GeKwtiMShjXXmUFWRwWnuyt
         nE+kxrJLdrFQHXRZSLlnqANndxRL4W+r6VwsoB+eko6TJvDbRswykC0mb+aPSPxP+26j
         RGrJCSd+IRJqsnImmA/19jJfDNqWnNoiaUD2am9et90KfiFdCa5Jg7gJvOSgjKXwx5FX
         zgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768023453; x=1768628253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1cLpdxtlbi2JaCKFB9k+hFNl0clCCKVFpwvaiNr7xQ=;
        b=FPqkf+I4JpFIB8piAsEQc+u/ud0QIBehQdmE+rfmXg9foSpoMhYuofOIm4MxmbD4RJ
         a6DwrZxwf1yZ6rBpqc5/JvhfdtBYZREDuRfsuU5k3n0TG3djRukSbO+SslsrbKs1BTpz
         iTuSS5sirxDq5uLlGglJPH2SXKeesZmF3oigXUaQtwh0yB/ly3R9IlbB+IplZMPQ3OQO
         DJsHBsg84L6MCvUGpCZGDi/gHxaXdb1XfQEQNYbhJ01ZztqITeIp1xa6yUNxPf7tMs61
         kxGdAPZQLLvFZBLHRohUEckDdgjKAZvg9hrX9g3j0sB3p844g1aN5bi7lEAyxfFVxq7F
         eFVA==
X-Forwarded-Encrypted: i=1; AJvYcCWqS7i2oqeDg2WAfmj4Iw8JscQ6+QTthRWG1yZ0ndIAKjS/angReHGlF+sknu/mbSDd7vK/8eSxgSlIhXf8bMDu@lists.infradead.org
X-Gm-Message-State: AOJu0YxlnO4dTAjnx9ubv00kMKPiBvbcOT0vJZ1EXQE9jZwqBQmJsXpG
	rDcZ4CQvemFTz0N2Bhxr447qt51B8rebzV/IKZsf5Mdks/a+fZjTh0hi
X-Gm-Gg: AY/fxX7xi2HqeJ9y2C9aOD+FUatx+Tky281ZaZq6c45RwnkYKJa1TcyB9zxxo2nT+jl
	uqUriwHSg/uJZf2AHDVdy+yvcuXgC0MydlpvlMOZPVCRVTgeIWspgKEXowjYQpHaRyvCQjFTxvy
	a0xhiebMShwDY4sBr+LWXX/0ubUrqR6Td/D4EDTyQw0rk3D/+Uti/0sXSWvOf9AI4IjoJniU6/A
	7sKY9nn0ec10STh+ZUUgzIV3opXrJlCdHopCoN2uG/3m/10I+qvu6DYLoOpm5JYvDqVDlPli3HE
	8ODWc6XmU/cuTrNiFC3HLk+kYR5yLkEgqIpi3r/ovVvajuJjMlLxM7iP0TdyoxJleEQxU3MPL31
	KkZ74oW6QUPbBKQa2D1l0r4vAZ8ErQC3Bmt66AAKs7wMz+/1IP1oKo7oK0Tq5g/rHKLPnDkJVwW
	TkMJzFPsHGns4vhf8=
X-Google-Smtp-Source: AGHT+IHqz2oFkcgw1N0DW7nQfkfUSHeBgK9Y/qbS9vSjvgU/OqcgBea5+ijbS7zgou3BC4qfPLuZbA==
X-Received: by 2002:a05:6000:420c:b0:42f:bad7:af76 with SMTP id ffacd0b85a97d-432c3775a39mr15366785f8f.15.1768023453015;
        Fri, 09 Jan 2026 21:37:33 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm25973825f8f.3.2026.01.09.21.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:37:32 -0800 (PST)
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
Subject: [PATCH v3 0/3] media: rockchip: rkvdec: add support for the VDPU346 variant
Date: Sat, 10 Jan 2026 05:37:24 +0000
Message-ID: <20260110053727.2295260-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_213735_919942_EFC2A7AC 
X-CRM114-Status: GOOD (  17.10  )
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

This series depends upon Detlev Casanova's current v8 series for VDPU381 and
VDPU383 support [0]. It adds support for the VDPU346 IP block used for H264,
HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to be a
close relation to VDPU381 used with RK3588, except with a single core, output
limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU346
vs 6.1 on VDPU381. To handle differences we declare a new compatible.

The device-tree changes are derived from prior-art in Detlev's patches for
RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
from Piotr Oniszczuk and Diederik de Haas.

The register differences between VDPU346 and VDPU381 appear to be minimal so
we currently and intentionally reuse the VDPU381 h264, hevc, and regs files
to avoid duplicating code. There is some evidence of buffer size changes in
testing which still need to be explored. If further register analysis needs
separate files for VDPU346 the refactoring will be beyond my current n00b
coding skills and I will either need some coaching or would be happy to pass
the series over to a more experienced developer.

NB: Testing with the v1 series showed lower mbps bitrate performance. This
appears to be resolved though it's unclear to me whether this results from
kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2].
However with my current Linux 6.19-rc4 test branch [3] I'm now able to play
Jellyfish H264 and HEVC test media over 100mbps.

Changes since v2:
- Use correct .max_width/.max_height from TRM (Diederik De Haas)
- Add Tested-by from Dang Huynh

Changes since v1:
- Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
- Adapt to variant/capability changes in Detlev's v7 series
- Add bindings ack from Rob
- Add rkvdec ack from Nicolas
- Rebase against Linux 6.19-rc2

[0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1040540
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk356x.dtsi#L1539
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3
[3] https://github.com/chewitt/linux/commits/rockchip-6.19.y

Christian Hewitt (3):
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
 3 files changed, 154 insertions(+)

-- 
2.43.0

