Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA68C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irguAO0XpAT+14tChPGnCDgWtK2s76ssvgYxloSKHw4=; b=lRodmszT4TIepP+qdQ48R19Er3
	p5AWfc3anUhzKVRi47On3hMnhP2al9b8TcVOeQVkmCw1MKiCrmHkGm3v5BtNW4jxlD0dkE5j+80/2
	29t5WtJORHYGxu/Qw7XGL6aL9srpxq5S07ElZP26iZYfS3+QAxVl7S10DkvHcy1BmjmZJ70hggtBE
	njw458BrRWsCaDNP4xk+MBN+a65hMwdUWRIMIBptGXBylHvdbV/PhuSc4hSYa2uJpkacMh4B/xC0s
	p8gAyPhyUaql4dRNXmaFF/zJGW9LMTeMOcTu3gELd4yhrPufdMzISaN5XCgNaLxKBjV/gv1yeuIvV
	IMGYGCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZprd-0000000Bgdr-2Gmu;
	Thu, 10 Jul 2025 11:54:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoi2-0000000BVp8-0Mea;
	Thu, 10 Jul 2025 10:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752144056;
	bh=AWumJfF2mpoZuN4/hlJ970rZCmguvf8nWjFfyYovaEQ=;
	h=Date:To:Cc:From:Subject:From;
	b=qTuhLJAOx+z+BpPVfzdyzX1jmv28d2FCry4EagnZL76nFH9FF/htslzcF7xtmyuWc
	 aGsY4Xty3esYxLkr73wpvL1d/2TMhHVkiWBYjoLddjsPB8T4wBobavQ8JKEYpve+pP
	 GArYIaioVH3MyKkjO4o93ubqBvsPQKmLggN/hO7E7zkAM5G1V/t+I4zVE/shBdrJJu
	 I39L56dn4DLBWMO6iwJIG7SB3skk43t+dgAIkyl5PqCT3V+drBn0+tQuw95Uj5YEW0
	 rl3sAStBdq0xwmcSAVEvTsvzPUJcNxu2fY+AOLmZwsKNdlSCUx6QxTn1G5SrzYqnqk
	 jpmheV8LNbpVA==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F37EA17E0489;
	Thu, 10 Jul 2025 12:40:52 +0200 (CEST)
Message-ID: <ad9ce463-c803-4502-ae89-381a6b6eb19f@collabora.com>
Date: Thu, 10 Jul 2025 16:10:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rk3399-gru-kevin: kms_color@legacy-gamma flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_034058_282933_5C561CF2 
X-CRM114-Status: UNSURE (   3.80  )
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
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_color@legacy-gamma

(kms_color:1399) CRITICAL: Test assertion failure function 
run_gamma_degamma_tests_for_pipe, file ../tests/kms_color.c:787:
(kms_color:1399) CRITICAL: Failed assertion: test_t(data, data->primary)
Dynamic subtest pipe-A-eDP-1 failed.
**** DEBUG ****
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: !(pipe >= 
display->n_pipes || !display->pipes[pipe].enabled)
(kms_color:1399) igt_pipe_crc-DEBUG: Test requirement passed: dir >= 0
(kms_color:1399) igt_pipe_crc-DEBUG: Test requirement passed: 
fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
(kms_color:1399) DEBUG: Test requirement passed: pipe->n_planes >= 0
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_color:1399) DEBUG: Test requirement passed: 
pipe_output_combo_valid(data, p)
(kms_color:1399) DEBUG: Test requirement passed: legacy_lut_size > 0
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(A)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe A
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=9600)
(kms_color:1399) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=2400, 
height=1600, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_color:1399) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=9600)
(kms_color:1399) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(59)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 0
(kms_color:1399) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
59, src (0, 0), mode 2400x1600
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 1
(kms_color:1399) igt_kms-DEBUG: display:     SetPlane pipe A, plane 1, 
disabling
(kms_color:1399) igt_kms-DEBUG: display:     SetProp plane A.1 
"rotation" to 0x1/1
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 2
(kms_color:1399) igt_kms-DEBUG: display:     SetPlane pipe A, plane 2, 
disabling
(kms_color:1399) igt_kms-DEBUG: display:     SetProp plane A.2 
"rotation" to 0x1/1
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe A, plane 3
(kms_color:1399) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
(kms_color:1399) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe B, plane 0
(kms_color:1399) igt_kms-DEBUG: display:     SetCrtc pipe B, disabling
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     Fixing up initial rotation 
pipe B, plane 1
(kms_color:1399) igt_kms-DEBUG: display:     SetCursor pipe B, disabling
(kms_color:1399) igt_kms-DEBUG: display:     MoveCursor pipe B, (0, 0)
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(58)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
58, src (0, 0), mode 2400x1600
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(58)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(2400x1600)
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     eDP-1: SetCrtc pipe A, fb 
58, src (0, 0), mode 2400x1600
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_pipe_crc-DEBUG: CRC mismatch at index 0: 0x780 != 
0xcc65
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_fb(0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: plane_set_size (0x0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_color:1399) igt_kms-DEBUG: display: A.0: fb_set_size(0x0)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_color:1399) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_color:1399) igt_kms-DEBUG: display: commit {
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display:     SetCrtc pipe A, disabling
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 
&& plane_idx < pipe->n_planes
(kms_color:1399) igt_kms-DEBUG: display: }
(kms_color:1399) CRITICAL: Test assertion failure function 
run_gamma_degamma_tests_for_pipe, file ../tests/kms_color.c:787:
(kms_color:1399) CRITICAL: Failed assertion: test_t(data, data->primary)
(kms_color:1399) igt_core-INFO: Stack trace:
(kms_color:1399) igt_core-INFO:   #0 ../lib/igt_core.c:2075 
__igt_fail_assert()
(kms_color:1399) igt_core-INFO:   #1 ../tests/kms_color.c:785 
run_tests_for_pipe()
(kms_color:1399) igt_core-INFO:   #2 ../tests/kms_color.c:1182 
__igt_unique____real_main1169()
(kms_color:1399) igt_core-INFO:   #3 ../tests/kms_color.c:1169 main()
(kms_color:1399) igt_core-INFO:   #4 [__libc_init_first+0x80]
(kms_color:1399) igt_core-INFO:   #5 [__libc_start_main+0x98]
(kms_color:1399) igt_core-INFO:   #6 [_start+0x30]

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79896647

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

