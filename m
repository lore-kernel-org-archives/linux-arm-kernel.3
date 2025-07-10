Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F00C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=diYctV8795dwcRTJ56xKxfKHkjRulxZrCU7APS6KRf4=; b=nL1MwGKKoHoIPvogtpMTdRvLhx
	WCZG3yIfc32x7XTMyDYSwi7HRxnlox317EvoJ2OxsfkNzW3YwGWr6a8yMHHwdMfemcmcNqkwFVnXN
	9QkWA3IvwproUthdh++K30xZqZaShJrB8mmldZ3bgKeoQwCxWk5wfYACVWKPZQKV7jMqiX+SfPeKF
	sRJEwKrx/WSL5D6u/5IgiePcX4TlkHRLjaYqo8faR26DTLQSsPrkzsb+NCZSJ5iWpu4cPg+VgxaZf
	FYsfSL6JfuqWr/0c8ZrevnWjvP3sWkJ6emGZ9ldMHxNxPkA+Z8j3i32D+JER+BWHttTWGsYOR6pRm
	FjogRM0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrUE-0000000By0o-3pPY;
	Thu, 10 Jul 2025 13:38:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqBU-0000000Bk1l-3lXh;
	Thu, 10 Jul 2025 12:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752149727;
	bh=okGM5S2CahtaEdt4ff44tZZBw38b8T8JSVlEAdE6h5o=;
	h=Date:To:Cc:From:Subject:From;
	b=JEkLxQ3tInZCuAkBThYF1HCzcWwKcjVo6K0vbe7FpwukpdnyLvevyAeqjcjZUO/xy
	 jaFcHxluKNN4/D+M/SRGp2rGceH7BCOWTwIJ9clMpyFOsooDad3waIGmIRvpRfdVkb
	 DxbYhqAQrBSBt7c+01RaCUK8DTMZLDdKWFIQ3Lh3tK16lttvITiSykD0P2wCTeLALq
	 ZF043p7XdB2I16g6p5ORqFqwI/i3fDUlzA2cfV65tqCeuNcCzj14uSTLhh1yao7A0k
	 8+WMnKWanAnz+AfyB9/TJeqEddNW82KTwHw++ec6qpLmGDcbf66MKNxldSudz+XDIG
	 6pj0ix68N7Z8A==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CABD17E0202;
	Thu, 10 Jul 2025 14:15:24 +0200 (CEST)
Message-ID: <acfd5838-d861-4dd9-97c3-99fffc9bfa04@collabora.com>
Date: Thu, 10 Jul 2025 17:45:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-rockchip@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>,
 sebastian.reichel@collabora.com, linux-arm-kernel@lists.infradead.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: rk3288-veyron-jaq: kms_flip@flip-vs-absolute-wf_vblank flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_051529_103818_644B14EB 
X-CRM114-Status: UNSURE (   3.90  )
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

# Board Name: rk3288-veyron-jaq
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@flip-vs-absolute-wf_vblank

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_flip" "--run-subtest" 
"flip-vs-absolute-wf_vblank"
pid: 602
exit status: exit status: 98
stdout:
-------
IGT-Version: 2.1-g26ddb59c1 (arm) (Linux: 6.16.0-rc2-g0594d0b01a7c armv7l)
Using IGT_SRANDOM=1751854095 for randomisation
Opened device: /dev/dri/card1
Using monotonic timestamps
Starting subtest: flip-vs-absolute-wf_vblank
Starting dynamic subtest: A-eDP1
   1366x768: 58 74250 1366 1502 1532 1592 768 776 788 800 0x48 0xa
Expected frametime: 17153us; measured 17157.9us +- 49.751us accuracy 0.87%
Stack trace:
Dynamic subtest A-eDP1: FAIL (0.732s)
Starting dynamic subtest: B-eDP1
   1366x768: 58 74250 1366 1502 1532 1592 768 776 788 800 0x48 0xa
Expected frametime: 17153us; measured 17155.1us +- 28.001us accuracy 0.49%
Event flip: expected 879, counted 880, passrate = 100.00%, encoder type 2
Event vblank: expected 879, counted 880, passrate = 100.00%, encoder type 2
Dynamic subtest B-eDP1: SUCCESS (15.797s)
Subtest flip-vs-absolute-wf_vblank: FAIL (16.557s)
stderr:
-------
(kms_flip:602) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:602) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
Dynamic subtest A-eDP1 failed.
**** DEBUG ****
(kms_flip:602) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1366, 
height=768, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:602) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, 
pitch=5504)
(kms_flip:602) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:602) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1366, 
height=768, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_flip:602) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
pitch=5504)
(kms_flip:602) ioctl_wrappers-DEBUG: Test requirement passed: 
igt_has_fb_modifiers(fd)
(kms_flip:602) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:602) igt_fb-DEBUG: Test requirement passed: 
cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_flip:602) igt_kms-INFO:   1366x768: 58 74250 1366 1502 1532 1592 
768 776 788 800 0x48 0xa
(kms_flip:602) DEBUG: No stale events found
(kms_flip:602) INFO: Expected frametime: 17153us; measured 17157.9us +- 
49.751us accuracy 0.87%
(kms_flip:602) CRITICAL: Test assertion failure function calibrate_ts, 
file ../tests/kms_flip.c:1455:
(kms_flip:602) CRITICAL: Failed assertion: 3 * stddev / mean < 0.005
(kms_flip:602) igt_core-INFO: Stack trace:
****  END  ****

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872339

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

