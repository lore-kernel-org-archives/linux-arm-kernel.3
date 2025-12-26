Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B530AE8FDA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v1SWATMi/WZTvokTUVbPMD00PD6v87hkU1tyoacWxTk=; b=MAjEuBbZJpO5/YWZmst81pKyoh
	Qh8h66fWX/+KwOFA2LpjT4eLehvnY86V5nV5CF7VQMK+0tASECE8O0XWZVUZTh9B3K0aBy3SGvIV4
	PIjVassOjC0P4P5TJvc0BPKel/ZUeqGvBIYqd2Ay7IHc9ZmZiiEq1FCrUuyzCkQE2i5qur0Gc/gZr
	R+o8OArUHN83leJ+YxltgLnHvLpzS50q0rdG0wR8KmWPJiBVa4vLsLbifY7zwMHnhH9sN/STBxQS2
	TFBirNZvZnvSJPhzYNgCXEKbwpGez1QPvAzc+M5FevqMw+pm+lAYC+0yJXUV7giYqZxmdtYfHLoL9
	pjRg2bEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ62x-000000018qC-3uLc;
	Fri, 26 Dec 2025 11:31:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ62u-000000018ov-36xq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 11:31:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fbc305882so3483122f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 03:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748706; x=1767353506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1SWATMi/WZTvokTUVbPMD00PD6v87hkU1tyoacWxTk=;
        b=aZQSc9mQSHHfHAkBQAWX/cU1H7z2Ey/o5zAwuhleEKJFZBFi7SnOu6BVaLqb6PMdU4
         Mp6N74MYmrOxWoe2S1RMTXNdBtM9jnWnC0wyCdvwOCOyEtdLENHcV4DXSETVYvi4V3BZ
         3ZsuRKfPKradW4xOjiSwHxcjTt1XZ/AYnvBP7Vycx89EW22ykNP1JCLs37GFgelkfm3b
         b4Qovkq5xZMpWrgS6PPtWI3f7lMvzEPk1xsR52VBZRx2enA/fNAmIBjD8qP9qbcPjGr4
         jH29DRfnRjHlWcx4UGdb2yMF8roIuNGP+0KrJKLHNa97GjFRkKlgxIlFhiYwGjwcu7Tg
         7g5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748706; x=1767353506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1SWATMi/WZTvokTUVbPMD00PD6v87hkU1tyoacWxTk=;
        b=Wh3K+4zRkvJRkoBoK0ujJ5V96KY5l5bftA0W0HkS4O5BPopw1YbwgyXlHaD7VBb4K/
         H+v9it/nbh6AkcMSz7VrTk27S95VUAi0XbkYC70ZdxGC6/j3G7X3XbnA8uJfgWKmkAJy
         cKx4h55lJshJatrg29HDx8Ypiup6hH2+oCiVVwindX/QBw7m2KQw4eaaSzfRexu2BUA7
         8MdgelCIaseT8fZb2lX7Gx33gs5HZdml/w7RV+u3zGkSIyqrhb9mICvR0sdpVT20/JHk
         8k/eVpuAHS3fYUm05ReEZ9bPtixG18gxW/qZeNhNZWqwlj/tfq967yAr99Au1j+vgx+5
         DRgg==
X-Forwarded-Encrypted: i=1; AJvYcCUIYl4AdNuwOcBQW5sktbhvh17RZ9UIBUJTpYko0H3hm9nnp4rdKMJ881sOEgdjisYNhUutFwU3nRuFWDzWJ95h@lists.infradead.org
X-Gm-Message-State: AOJu0YzkzWnvCp1tZRLEFOhhSsHT7+K/0YpyA+LY7DeovIGV6uwZR8vs
	XLPGTff83lULWUMOVtCGclQMEnB+CvV97vXQk4fQqxAJeCd0jdgahCNo
X-Gm-Gg: AY/fxX4mzn2x2Y7NdXX5jTq7fzyr7fXFD5YnmCgVMOGhgACdjWjMdmhhDwBKSK14is+
	ooe3sQ1q419f3IaiXBbRJsfyFTqy7XhvlSWltgzZ+/JkXMIZGSvL+R01bi74iW24jmQ3wgGGsTN
	V4FT4KO37CtzQ3UuWttJTxZh5dXpPPxZX8mEzLETeND7wpXjdWRNdO8u2b8+kqcqiCV6cKRaoOs
	YLSeah/o7ebF+jIoXoe7AZXa14f+Vh0UpwP32ciE+c0tRD3cEhDmdYeNrYn/B1o/1aKNAl+YaAa
	HXenLpj9Ycrtvcu7+RMYmk61cGw0VrpA6/bQgvlz9f7CFOz8TbCu+8BD4ZKNCMKKaT+HA2CeCwI
	/HsungPsjS9uB8Xu3PTt59K/ivUCcLxJRWQ7krGjK5vh3Y5KJGP2irEuHKhGR6uDUJSOWCJljod
	vT25EuSK25rhcEb8o=
X-Google-Smtp-Source: AGHT+IFygpIY6yusxcHbmhs8BhJBr7U4UWeqoVUdejtLxA2a55s8mJN5G64VtQqtq7oKUer6tKeXIg==
X-Received: by 2002:a05:6000:400f:b0:431:752:672b with SMTP id ffacd0b85a97d-4324e4c8fd0mr26427791f8f.14.1766748706064;
        Fri, 26 Dec 2025 03:31:46 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:45 -0800 (PST)
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
Subject: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the VDPU346 variant
Date: Fri, 26 Dec 2025 11:31:37 +0000
Message-Id: <20251226113140.573759-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_033148_825305_BE492E49 
X-CRM114-Status: GOOD (  16.27  )
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

This series depends upon Detlev Casanova's current v7 series for VDPU381 and
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
However with my current Linux 6.19-rc2 test branch [3] I'm now able to play
Jellyfish H264 and HEVC test media over 100mbps.

Changes since v1:
- Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
- Adapt to variant/capability changes in Detlev's v7 series
- Add bindings ack from Rob
- Add rkvdec ack from Nicolas
- Rebase against Linux 6.19-rc2

[0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1034794
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
2.34.1


