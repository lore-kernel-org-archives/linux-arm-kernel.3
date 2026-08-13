Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5916C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvZxXgWwlw9mSCW44p+jCE5q4lBZ+vVfSoXZPbAhS0M=; b=4CcRVbY9SlBv+EqhRJFK6n5Wk0
	GkBJZKEelIF1e7DjcxTS1qe/nMlifuOBcNwleFhOr8yQ8vsaRLRfc9eI4ZMAQix78u0N+y/WTxn0W
	+ak23IxJ/BLMzA6Gkj7iZbQ6+/wdDTpRX+sNKsegAUStXxqL+7HtWT4ynynlV/EnSRBqbM7lcJKK1
	DiQKgucnvDYGReKdSErBmnt/BYFQR6ckgttQsq0xkc0iN820VWoRqwEpKDKDlSQi+XUnO5Lg17odC
	7P0GlgLUV4oKu6zxdzB41jVaGaikJo2UzoQdgs4ifUEb862aeZRL90RapNwPNW3Cr5wEwNv84aseH
	urSJ9xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSRX-00000000R57-3MWg;
	Thu, 13 Aug 2026 10:13:47 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSRV-00000000R3t-0V7m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 10:13:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47fe76491b8so151581f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786616023; x=1787220823; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvZxXgWwlw9mSCW44p+jCE5q4lBZ+vVfSoXZPbAhS0M=;
        b=oEJeJqk5xKAjD2uo6LaEG9ffUrlm1dBYqJ9/SB4wN5BfmkWn3mtVi3haPwyhx+/vx9
         dfJgZqkERg7tXxrTk9yF/BRCcvapWvpki4iJ3lz6+Li5CH1+WUzqIBrxib/bKHJn7tPc
         zQwW4jeyInnbX+WYQGyIxFPwTFmlxuAWDsnqeFmbRxc/aSJZlcMixR0cHsR0vXECPHtT
         cAF9LoVU6ocRwC2SR9mTTWp9yJlJscyENEZevDtaHVKVfwsxmp/EE5b6aLl2pgrctiMW
         8WMJaFxsxEop5EMbgVu5O0CRAN0QWH+lgJlJsL4S39vAE9JjRo7tqWyHKRtz9Kf3ivwv
         Vz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616023; x=1787220823;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvZxXgWwlw9mSCW44p+jCE5q4lBZ+vVfSoXZPbAhS0M=;
        b=CYl/T+RCCd+bSzEHBFhhYoQNG7oEF7s6GpEq4PAkOmelCgowwwByrpAmESBHMFb8iW
         elWrQTR57L/WyiLu9aDA/yyp/ouH3x0+noxkSk6zs2r6Ha3MuLsgZr7KVb5lDJEBNaCK
         f6lfdgzWGr2N5srjaEJnTrILuARFwkNDpGBMSKKPJwPiCBMA69EKCRLTAoMLB911JiCZ
         L7BU0ZAhgIhI7X/7gd9K6KLYccHWQauNroYg4TPjcdJvgcJAGXEyLTicWsrfz21rLJ60
         7UF+pKE5NYa0fZak2cC5CAObiyXRbbdoSBcmLG0tZVHe1lzgCjMR0TPCmqYyEZxPrDI6
         pJTA==
X-Forwarded-Encrypted: i=1; AHgh+Roh/up9hH+WUiJULGeBpFVIypUsQKGDbSdRrcG5eRpwnoTMWdQbJac+lyfH3mxUuBmijsGp6DPoGBSVDRlIAO6R@lists.infradead.org
X-Gm-Message-State: AOJu0YwWUjseJ3tUOkmgKkYEIRYixzCq9tchvE8ztO19Eha6BqqsjQqJ
	TieTo4FsCRLUuLxBF8//IE1EziBtl5oQ4GcjvlFxgpUSZEjtiTNxM8jl
X-Gm-Gg: AR+sD10B5NwjUyj141L25HeOIUsyvipGzgtPe+w6fqqeOjhGSJR1ehQfDmFLYuqYsUq
	RXvAXOP/9jw/SrDiWrL2L+hZb/n5J7fyPOV7/0jMNdApf2enZbNDsoJVbWg7MXVGAo1k3HRwW+j
	1O8+Zf8YKvbsLXkIHeBfCBBoko3rmz+rQvFT0BhrxGAdh7iTzpssCcaTG65GZ7WB+bfCOkZmrBS
	8gzWbILCQmi/B6EGU9E+7RY9+05Bjv0nccetWcZVWLs0momUx/CVmkSVw8J/6BPNQfKjr0hxIhY
	HkK/KFD2jBkmhbO5EPfWeZilv0vGFHIqJnMlnTP0ECEVptqpa9x3tRDS+3ETuzWmcnpM/Up5J0V
	HE2OUOI8ixCPrEr+fxyGSZBPYQMaCYtO8wFQ7dsZ1Gqi2jH3ltRfAsRuSH4NPMFmqwbxMJ7bx+X
	ocoKSsr6hVQdOBW1zfPpFxvfQJwYhfjRYicK2CazG4kdh7eZnU1RFGV0SLVExwg5EPl/suf83xG
	90FQRBuQketir1xpvAbLOM2yaUJCeiQmjTF095xUtdG0/11GTx1ezGOKewUmo/uVGt/9KfGVS8F
	ZMby
X-Received: by 2002:a05:600c:b93:b0:499:59da:12b9 with SMTP id 5b1f17b1804b1-499825cefdcmr25741845e9.0.1786616022989;
        Thu, 13 Aug 2026 03:13:42 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C009377EE8DF6D0A1C2.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:9377:ee8d:f6d0:a1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981abd6desm59541945e9.0.2026.08.13.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:13:42 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/rockchip: vop2: Scale the AXI clock to the bandwidth the mode needs
Date: Thu, 13 Aug 2026 12:13:00 +0200
Message-ID: <20260813101307.10945-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813100027.349761F000E9@smtp.kernel.org>
References: <20260813094614.9072-1-royalnet026@gmail.com> <20260813100027.349761F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_031345_211463_8FCB24A7 
X-CRM114-Status: GOOD (  17.85  )
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

The review bot found three things on v2 and all three are right. I am
answering rather than sending a v3 straight away, because the fix for
the two High ones is a single change that touches a file shared by
every Rockchip SoC, and I would rather ask about that than guess.

Both High findings come from the same shortcut. v2 keeps the
requirement in a global atomic state object, which I still think is the
right container, but it applies the rate from vop2_crtc_atomic_enable()
and _disable() rather than from the commit tail:

  - Out of order commits. Two non-blocking commits on different CRTCs
    share only the private object, and nothing orders them, so a commit
    that took its snapshot before another CRTC raised the rate can land
    after it and lower it again.

  - Multi-CRTC disable. atomic_disable() runs once per CRTC, and the
    first one already sees a state in which every participating CRTC is
    off, so the rate drops while the others are still scanning out and
    waiting for dsp_hold_completion.

vc4 solves both of these for its core clock, and what I did was take
half of that pattern instead of all of it:

  - vc4_atomic_commit_setup() records a pending commit per channel in
    the private state and the next commit waits on it with
    drm_crtc_commit_wait(). That is the ordering v2 has no equivalent
    of.

  - vc4_atomic_commit_tail() holds max(old, new) for the length of the
    commit and only drops to the new rate after
    drm_atomic_helper_wait_for_flip_done(). That is exactly the window
    the second finding describes.

Hence the question. Doing the same in rockchip means adding both
.atomic_commit_setup and .atomic_commit_tail to
rockchip_mode_config_helpers in rockchip_drm_fb.c, which today carries
only .atomic_commit_tail = drm_atomic_helper_commit_tail_rpm and is
shared by every SoC this driver supports, VOP as well as VOP2. The
commit tail would be a thin wrapper around the rpm helper with the
clock work on either side of it, and both hooks would do nothing on
anything that is not RK3588.

Is that acceptable, or would you rather this stayed inside vop2 in some
other shape? I am happy to write it either way, but I would rather find
that out before than after.

The Medium finding needs no discussion: if
drm_atomic_private_obj_init() fails, the jump to err_crtcs does not
undo rockchip_rgb_init(). It is also new in this patch, since before it
nothing after rockchip_rgb_init() could fail, so it is mine and it will
be fixed in the next version whatever shape the rest takes.

Igor

