Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95149C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fiWeL9L3vzjEzJOhndbDbRb1dFJewY/aArG0VMN1Lqw=; b=RI5Ais/oU44u+ArXVdZOO0SyPs
	d+QRmfYdpBVkTRNNxj476JK4K9PdJQwSN7Yo4EHgVh3E27CKBjVrt0rwNTlG1uXY277HRgKFTTYFP
	ir3fO3QP0PppvSAbQcGUgjxHTkQaz2204q+tVt6RdTSBKe0ceM9PxSbOFIK87brbUNjawq8eYDi+5
	Tb+kAEAMpUkOd7I7p4V+UXehTCaq4J4C/P8lQG4jSPvdyIoC1Z4JJJ+bk5HnyxpEaueY5S0iwTcpA
	CmF28BS1w5k5hMVlU5+aLpvfkORiOsjG3wyW5xu5UlwInuSOGS2wiUzntZ8hpi4i7GyX9ZHmzAmba
	lidKbjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfsY-0000000At9G-0oCM;
	Thu, 13 Mar 2025 10:33:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfqq-0000000AspW-2PRY;
	Thu, 13 Mar 2025 10:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741861902;
	bh=APrzpYMg+KdEjqb0cZBnXIO6Frgv6XgZNdVuk7y2qgs=;
	h=Date:To:Cc:From:Subject:From;
	b=CUirAxjOH46kwtDn4BQSG+l9klchYnOdr1ojKEikgXWs03pvQxEIbCm6H32AfIpmh
	 P8N3QaW7pivna1OEO3XSVTZAzbw8EQqAG60S9qj/QTHaanwsXMqcwFvbAPMJ590rCN
	 HvNxGxZ3JC7T9VDJP9FwXSDuQVuTX+1XVheAMllbbz0FAwxwOTvX7LohJQmfqPDRRb
	 eqOM31pN/xeMgyzRAkqjNK6N8v9V/8alSRsSPUe4dZvztzXuFh6seWAlyySmijzLEt
	 +FhUuoXJG7zzyHkX4Ip117GgFBSfFh3WlH4lsDUvuumG2sGu2LrhWsx4p7usfqsn1w
	 d3hpu67J2RUHg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5417717E017D;
	Thu, 13 Mar 2025 11:31:39 +0100 (CET)
Message-ID: <63dfd5b7-8a54-44a3-9530-f8dcd77a21d1@collabora.com>
Date: Thu, 13 Mar 2025 16:01:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rockchip: kms_bw@linear-tiling-1-displays-3840x2160p flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_033144_918375_54BD1299 
X-CRM114-Status: UNSURE (   3.42  )
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

Hi Maintainers,

There are some flake test reported for rockchip driver testing in drm-ci.

# Board Name: rk3399-gru-kevin
# Failure Rate: 20
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_bw@linear-tiling-1-displays-3840x2160p

11:38:08.782: DEBUG - Begin test kms_bw@linear-tiling-1-displays-3840x2160p
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
11:38:08.782: ERROR - Igt error: Subtest 
linear-tiling-1-displays-3840x2160p failed.
11:38:08.782: ERROR - Igt error: **** DEBUG ****
11:38:08.782: ERROR - Igt error: (kms_bw:1520) DEBUG: Test requirement 
passed: !(pipe >= num_pipes)
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Test 
requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
11:38:08.782: ERROR - Igt error: (kms_bw:1520) DEBUG: Test requirement 
passed: data->output[0]
11:38:08.782: ERROR - Igt error: (kms_bw:1520) DEBUG: Test requirement 
passed: !(physical && pipe >= data->connected_outputs)
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=3840, height=2160, 
format=XR24(0x34325258), modifier=0x0, size=0)
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=15360)
11:38:08.782: ERROR - Igt error: (kms_bw:1520) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
eDP-1: set_pipe(A)
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
eDP-1: Selecting pipe A
11:38:08.782: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
A.0: plane_set_fb(55)
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
A.0: plane_set_size (3840x2160)
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
A.0: fb_set_position(0,0)
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
A.0: fb_set_size(3840x2160)
11:38:08.783: ERROR - Igt error: (kms_bw:1520) INFO: Assigning pipe A to 
output eDP-1 with mode 3840x2160p
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
commit {
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x39/57
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.0, fb 55
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x37/55
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x26/38
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.1, fb 0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.2, fb 0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.3, fb 0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.783: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: B.0, fb 0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: B.1, fb 0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   eDP-1: preparing atomic, pipe: A
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x26/38
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: }
11:38:08.784: ERROR - Igt error: (kms_bw:1520) DEBUG: Test requirement 
passed: !(ret != 0)
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
commit {
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "GAMMA_LUT" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "MODE_ID" to 0x39/57
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "ACTIVE" to 0x1/1
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe A: 
Setting property "VRR_ENABLED" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.0, fb 55
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_W" to 0xf000000/251658240
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "SRC_H" to 0x8700000/141557760
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_W" to 0xf00/3840
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_H" to 0x870/2160
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "FB_ID" to 0x37/55
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "CRTC_ID" to 0x26/38
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.0: 
Setting property "rotation" to 0x1/1
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.1, fb 0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_X" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_Y" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_W" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "SRC_H" to 0x0/0
11:38:08.784: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_W" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_H" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "FB_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.1: 
Setting property "rotation" to 0x1/1
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.2, fb 0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_Y" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_W" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "SRC_H" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_W" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_H" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "FB_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.2: 
Setting property "rotation" to 0x1/1
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: A.3, fb 0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_Y" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_W" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "SRC_H" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_W" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_H" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "FB_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane A.3: 
Setting property "rotation" to 0x1/1
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "GAMMA_LUT" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "MODE_ID" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "ACTIVE" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: Pipe B: 
Setting property "VRR_ENABLED" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: B.0, fb 0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_Y" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_W" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "SRC_H" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_X" to 0x0/0
11:38:08.785: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_W" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_H" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "FB_ID" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.0: 
Setting property "rotation" to 0x1/1
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   populating plane data: B.1, fb 0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_X" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_Y" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_W" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "SRC_H" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_X" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_Y" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_W" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_H" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "FB_ID" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "CRTC_ID" to 0x0/0
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: plane B.1: 
Setting property "rotation" to 0x1/1
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: 
   eDP-1: preparing atomic, pipe: A
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: eDP-1: 
Setting property "CRTC_ID" to 0x26/38
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_kms-DEBUG: display: }
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_pipe_crc-CRITICAL: 
Test assertion failure function igt_pipe_crc_start, file 
../lib/igt_pipe_crc.c:387:
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_pipe_crc-CRITICAL: 
Failed assertion: pipe_crc->crc_fd != -1
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_pipe_crc-CRITICAL: 
Last errno: 5, Input/output error
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO: Stack trace:
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #0 
../lib/igt_core.c:2055 __igt_fail_assert()
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #1 
../lib/igt_pipe_crc.c:433 igt_pipe_crc_get_crcs()
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #2 
../lib/igt_pipe_crc.c:592 igt_pipe_crc_collect_crc()
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #3 
../tests/kms_bw.c:249 run_test_linear_tiling()
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #4 
../tests/kms_bw.c:287 __igt_unique____real_main264()
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #5 
../tests/kms_bw.c:264 main()
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #6 
[__libc_init_first+0x80]
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #7 
[__libc_start_main+0x98]
11:38:08.786: ERROR - Igt error: (kms_bw:1520) igt_core-INFO:   #8 
[_start+0x30]
11:38:08.786: ERROR - Igt error: ****  END  ****
11:38:08.786: ERROR - Test kms_bw@linear-tiling-1-displays-3840x2160p: 
Fail: See "/results/igt.kms_bw@linear-tiling-1-displays-3840x2160p.log"
11:38:08.786: DEBUG - End test kms_bw@linear-tiling-1-displays-3840x2160p

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72651219

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

