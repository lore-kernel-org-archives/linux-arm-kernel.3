Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D23CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=; b=ot7eJwx4zJtmdvpYkqDKsJkmup
	8V+jZa0Bqy1ryuSOBUD+X5QxiUKtp37hFiSpOvtmvPY8JcgkdDx9ZNfE/iL+oGK6+17+O1tlmYHwO
	DWlLwG2c3N8Cr41VHoHOBaFStwDLY1ZqEl1bqqjuW+D5B3D/qnmhGTy66S0PgU1OVoYKhnxXuq366
	HhcsDUMOCffK4nKNHKtMzwQNYIby4kiY4Ugstbpcn9qi6su7gjULwytTkzvhP4xG4lbwAaZZpOqwn
	Z6YNwcNcGfnZ8GLzvsPe6C+PReR3rtXbTA/E4RarvgVZ2W04TVYs8+ZyPYQvbTffdVdVk0MFmN2AA
	0LuM3hjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGK-00000002mB7-03zC;
	Fri, 16 Oct 2026 11:38:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGI-00000002m9p-0XeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 11:38:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29628585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150688; x=1792755488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=;
        b=P12RRX8dnasrNoCPTNx6MGtUKmc8/gjCTqeDaCJWRDDxiPLaJu9NMkmyi/3+0szjJ4
         kV3TMjXRmLd9cT9OtzmULsAfBM3sMat6Nsi6aggMtD7O44D3TqFJpXcQAKEH+O0j2s9i
         +zfYeiVSUNeehjJ8MFwi0fVc/JejiK7Qp8glsO6FjHqKPtQNW3EHlKigXdKHqBN6nQbd
         9KDvukwejIV5AYDq680FIDnkHtjwkJcC6bGy6ADfEMxJBoIcBq9rczjF8n/UtWRt/vzj
         Yu2aZCgvArk9+HDlddGsk6v853UPb6eVO9qFQn0BnEOCfYfJ9DeCJxEuFiHqyh4ecyQy
         S9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150688; x=1792755488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=;
        b=Gmf+wp8bA6fOSBKIUp7AY5YgsS5aVSMfUlQrgXS5T3Z2FyIjXBjODMadS3xkDftVeB
         U2TsXlQBrZEF7p7YwvHkX3Wf2ZfZ5WUULAXWg/56Yi4J+onbG9blsudYBwWV54rh1tLQ
         HoCtF/BNLNVfujnc4HTj/mOQbc5v1y0qz43DCL3bM6duePgLhS9Te5F4a9vuVRAFE1Ud
         AMoez8Aq0uzt2KTnnKQkziPlFpATuNQiD6LBYqhOYaS48+q0bJncDbCNgHZ9+VZNB8TP
         rt7pPMrlAKZAooU9dfCCb5vlGc+u3rwEfUegp7ndpEwWYYbkSGkUprZ9z1FcVZBIzRAi
         AlvA==
X-Forwarded-Encrypted: i=1; AKwUvByOePE2uynBVB3vf1tCqnQZhDJiPBteb3rZjFzaEW5ANglPkJ72PMWS+UEG3KiA7bi2OYXHASeXSGuQJllfc31R@lists.infradead.org
X-Gm-Message-State: AFq9FYLEMju8sUtpcNv/p/0hv/fpMVihSQL8Ki19K4PMHSfIIpiwaFy4
	69lL2xd65qLnupWy1PL532fZG5mnkM0LDj6ASNJcxdCP6uHFY/yRPnSu60EwjpVCr+E=
X-Gm-Gg: AYBFou3AlWiRV429Nb5CNI2x64Ey4JOXn1HB8QOddHkqZpJ+SOIoUYqmxNqziLNCLYT
	uMfyGRCL0g5rpRX+XOIVZ20OKdrjevf1STPtRTFOxEdtzTQv1lf0Yfe4PXsiizKiPSTAshx5vOO
	2WY5B72ZFgyxUUMlxvysi9lOcEFVJasc7S2+FD9DWES61VrdidrjUFM1xJNc1UXbBrD7XAFDTqh
	Y2i0oHpBDzJlGiwdEQG44e5hNurRcl9VfC/0Vdws3q4egPIw0EMwNwNjuzVBuZlJGhZbiKEAFIC
	APU9e4WATWGUESr8m5aKXh376MMFd1FeBjcgl0Pp4zsR4FTgdLnbl+z3xSFwQy5DdZGt1KCqwQa
	PkGLaaHKTh9f9074dM6PWaSC31wy5RL1xTj6Lo0TIVQ4FuTeildkk3j+SxkqRhjpkr99SujgGBp
	WFn5p0xxvOojqR+Zwp5s27RwQAwn3fCN70xITrByZ8rvCKS7CMQJgU95z8c3/hv6Z25DQv7tU5q
	mR6KfivcXHnrp49KBKhzcw0CGnwmh9C40oWYOQu/n/J32gbT5oW8Ezivg==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d2482659mr19130645e9.24.1792150687905;
        Fri, 16 Oct 2026 04:38:07 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm156650875e9.9.2026.10.16.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:06 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
Date: Fri, 16 Oct 2026 15:08:43 +0330
Message-Id: <20261016113846.8602-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_043810_182002_2F82141A 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi,

This series improves sun6i-csi capture and bridge.

Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
and height to 16 for NV12_16L16, as its 16x16 tiles require.

Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
same alignment.

Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
posted earlier and carries Paul's Reviewed-by.
Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260527124552.33815-1-arash.golgol@gmail.com/

Tested on LicheePi Zero Dock (Allwinner V3s) with:
  ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
this setup, so I did not test real streaming. I checked that
v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
--list-framesizes report the expected sizes for HM12 (16 aligned) and
NV12 (2 aligned).

Arash Golgol (3):
  media: sun6i-csi: capture: Align size to 16 for NV12_16L16
  media: sun6i-csi: capture: Add enum_framesizes support
  media: sun6i-csi: bridge: Remove duplicate mbus format entries

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
 2 files changed, 39 insertions(+), 18 deletions(-)

-- 
2.34.1


