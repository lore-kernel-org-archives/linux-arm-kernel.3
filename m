Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69382C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=; b=oIKiSn9KFBBOae+Qi2xqxLrHjb
	PCk1imgZi7EKXczyQ1OU9/jlrobuMbCuOIFiieCZRO1gg5hKSmSzCttdqOpH7dT2XULFKyXt5HWCb
	nq4hciv3tyP4FfI08q2pnGY4/zST9jUcwV/66iGCwS7wwPHHQc2LnwUM5JCn8ekLM5kAfUmvMnDjr
	NgMHsWS9fd6WrOHWpYyXLz/OfaEacdwj8WyMfLvMHscBy2UD1/hfEYxi4dY2Nl9JPm4WHP8DyHiHr
	4jo4+3wcoJXE6XQRWeo1g/t/8nth4/r/TjEwdY8Ag3TvxfaHX8ey/I76P0bt1oysqMt8lDtCnc7BN
	UT31xgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuX3g-00000000vUr-1NAI;
	Thu, 13 Aug 2026 15:09:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuX3e-00000000vUI-0EtG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:09:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cfff5f88dbso111935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 08:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786633765; cv=none;
        d=google.com; s=arc-20260327;
        b=Zx2F6mGa2H85xLFOQGX5PFP7KiMEhBLwNvpdQH3630/vZLMjVV2oClGorIqr+TBn5I
         FEVItKSgHtj5f9mQjnnm7GloePSiyLsgel1P+NnqC58HIHVM0XnfWu6wYeHW+I23JekG
         876C7jzwlMy5I835uC+s70Ou+7QPJ7faCdpk4MZPJoo+ghyH7zIvkDcv5gptIXXQNPim
         IicSQQBx8mbnJWq2Xl5R4WdNh/qCk/ggrsbXbqFhyaVPWMz5FTcRPTpz56wdKx8u4y6t
         xiyavYgZ442TgPZMNzVEWtF2WhRskuk9ZUhS03nVnOE4Yhz3tZxw8t3ZN/V50suEMj7w
         t+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=;
        fh=B/yRyZ5VV8llI4jKCjWMipK+OgmGpJfrwCx1KPmG8/0=;
        b=gVXuTZYGcQ/gseZSlP6ZtCVcZDqDEKSUNX84Q0f/pEckUYQEe1drBsUpmyhWF4bDsa
         zPLC7lvXBkRH5NOLEwcCNyh0UqbOdaglaKJdtWt11TtxCqj96ykXvo9Tv5IodpT3n661
         W2DV1Mli5vQ/yL5TRIUuihA2xr0WWImMksVIP1PS2FAloZWIK90fWulXJiweZ3EEaCzU
         7BW+tioKrYRqIZXuE4DGW2uhLd6GOfBfF2sZpYkJ+/Wg24VUYkCeEr1/+RR4Lay6A0RE
         UO+7dWiH8+soUpbI4mZSw92/RXdOn0lYVJbOPSbiIutP9WsMQEm4ye9y83973V5iUFfO
         4FUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1786633765; x=1787238565; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=;
        b=JQ3xHUJ2zJ0vhtCEB8xNFR2sXV2+Z+oxGorCkoc4ADFWCn/3t6MpJ6j55hpb6ORSp6
         0Pq+pEJFlqbFhH8dVqaiCRmWKwopVq6nF94J/XWlyDHeKIlrgFkBaUsbZDsIcxuw3YuU
         KokpQ9o+Mxs1seq7emqc4V+UMlIENPFwQrpuqgf64JnX9G3iBoTSdVr0zDrA99IVpijQ
         rK1QGg1xp2R1dushFS5GzlC7W3McDLbQ5izmC7HqOVI344PLx6ojaOLc6ck5N3B3vvGL
         7QosdvWhuD6u+MDBXW0JrR5qY+swZsbTob6SoVs5h3/Ocz3YXsm5nQhxCv4LBhmBsx2h
         0MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633765; x=1787238565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sSfixZQMz0vR8g6mx6GBHkzMd5TjHfFJ5VTa4zkEMgM=;
        b=bY4bianzsRnzC5ZKyHbTiKHVTiZXNXmdSwN51dP9H3eAILidRrXynAHqyeWld2THNY
         +G48+MnT9t3M7/6I379RLGGpX2ir+GlpeDwljwvWtjN2yc43XULI/fEiG3TTgd5W72NJ
         6LwS76PiQgkxlUPRhgy5F8XfymCfQgfBnr2wNMgtJv1B4wFtNoAhp8+o79hIUlCyDrlx
         Selfb+DDcZZNZyGT1ZkWQ01hMOu2ZxZRcixX82EQNiJCb9QKdReCB8yCsnYDUWZVK/Uq
         YlpOKgtUx/7Cxs2UA1cXk5o3WP2w8m3GT5MILIQkCE/519qepQruP2CXI//k8P3OSni8
         TdBw==
X-Forwarded-Encrypted: i=1; AHgh+RpoPbpLDUqJLeR0Vsm3+ESCX6b5/lwab2rdpoescarytBPtTr7OKaizgWkPdO46at52jb0KLxYTMnrIVeEw3wQE@lists.infradead.org
X-Gm-Message-State: AOJu0YwNDTHlC9zb0WgDEsKuMpXGyWQ/7jE3MK9TGvAjiMGEPlZGHqE4
	TOviOEzus9fIYkvNaqOPLMUCOQ3K5uK70Q6tHqxoF0CmCMrSTolNOmutHkw8U+Lhvrtj82pXgF4
	CMsch4UWI9Zoav5ZmZHS9yl2CIIYa/Ta42Truu+wVlw==
X-Gm-Gg: AR+sD11mpoRf8/HzKBXL3zpHb1dl0DHV0+nTUSSb4+OqSkQPK9Xt9qqORDQvmtRp/7S
	ZrLlSNyai2pobVAICnf2M6daOMq2N9TOtdSsbCv1Xc7c6k4eeZt8Be3Clz+8Cpe8+C3VCbmVhkl
	rhcg7y64hI7ZwVVkEG54L+BbCYYcpiV6+hEH6vYrkjvKVhKiXpaCf1F5IrV2sE04PZy3XkVof3w
	BVOrmvTaLJLx+z6hbamvpLjPEcu+aE0hUhs9bUWODSho43f/lzFRR/bKSMikK2Smg9bAzM+r7Cr
	fBfqAuc58/Gkw/jJITp2o+chtuRwYPP4V8idQ6bAqLVF
X-Received: by 2002:a17:903:2987:b0:2ca:619f:9733 with SMTP id
 d9443c01a7336-2d37e9ae9a8mr80628175ad.17.1786633765124; Thu, 13 Aug 2026
 08:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
In-Reply-To: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Aug 2026 16:09:12 +0100
X-Gm-Features: AUfX_mwnT8mSX1TxP1zLMIDeonWHO5mTijXRqqeOSADs0LdjYAmb4n0gllJsz2E
Message-ID: <CAPj87rMNdbzebt0ovJcymRtBNunnQaVx_=aSUbcrXNTEZOPz9g@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Add SCDC information to connector debugfs
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_080926_103614_B24D4A53 
X-CRM114-Status: GOOD (  10.42  )
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

Hi Nicolas,

On Fri, 24 Jul 2026 at 15:23, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> HDMI uses the DDC I2C bus for communicating various bits of link status
> out of band with the actual HDMI video signal. This information can be
> useful for debugging issues like questionable cables sabotaged by feline
> teeth, Enthusiast Grade cables made of cow fencing wire, and other such
> problems that ruin one's media viewing plans.
>
> Consequently, this series exposes various bits of pertinent information
> from the SCDC protocol in an HDMI connector's debugfs. To continually
> poll the link status, userspace can poll the debugfs file.

Pushed now; thanks everyone for review and testing.

To ssh://ssh.gitlab.freedesktop.org/drm/misc/kernel.git
   0d46312808f32..9b388fc3d0e63  drm-misc-next -> drm-misc-next

Cheers,
Daniel

