Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GgzpKZM2;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=V1ickBR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=; b=GgzpKZM2+olKYyktsSjfxZ9qBi
	u/6JQP/W0TKcCwv7/ztcoPp3DXkjD7BmqaJuXKp+E5ZBabmcoiBPzbK/A7VSGQDuoXRKUD2XQg9xH
	6w0sNio3W4Kid5bcyCWRYLiOUD1PzgpzLBODTDWGmcG2P+BpPgOJ/zReApEm5KPWPzJ66nM0xxNHe
	6A/6BtlDgnGhx6VPr7opHYPq1Tkf9ORtlUcD8O4+JuZB3tZ0N6yTB29f0cy71olmMCmMa/p3FKAEG
	qxGF1MurTat5Tj32eEzC1bRXLRjaMlCPaH+ZVygoAKUQif9OqJ4QeaD47G2al8xetSK6yPAmlV0tm
	qnk4oW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkuQ-0000000BZJh-3iZF;
	Fri, 30 Oct 2026 11:36:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkuN-0000000BZIr-2wGg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:36:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so385114a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360190; cv=none;
        d=google.com; s=arc-20260327;
        b=JMenr37fdPiS1n+Deth12LSaIkRwj5t7I9QoTv5tUZrASFG6ZLORG8mYUtEHQbwp8k
         42G142K6SKRZmJbnlit+vR+FQO/2LV7EUKzAzvERiNOtG9kxglSzsGpDs4P+FrGqAntk
         1iXODhug1+HyspGOAHjK83YdNu+D8kdGCF5HjQ9F6TvQIepPOE+tlOYvWyq+7M5gveex
         H7euGJsyg4KtOB5qw3J1poFYYDpf4h2lTAbi2Ebuvv8MilhXK1vNPMpvfevXzp25oRmj
         LB0WDq/OVA288siUFdtKAsAEES3fRyYKtfaQO4/WtUwgZy19L4ONq61XLANEckKtNz5z
         xuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        fh=Pg+5KmlgxawW+pJjw9UZrUPHk+0jF+mQHYj8ePMAvaU=;
        b=Z6ZHwn6zhTRlHNqpfO/Wh1TrcDP6JhmyuI5qw5yScmjR67JOF+d8xh1m/heKCDIRgV
         j7M/CJoLy52U+4VyhyYtGoI7QepkIILBRnWnKzKXRHwtJX1NEnJtHfn0nDeAwEejKCzb
         f8i9DYu6NQ6Y87xdFXIJBtKBDamkdRWpLPHViVPQsoNzlfrWvinPD7PuqlWTIk06ZRb/
         lmMGVvEsJlvnGY3CrJnq9H5mfFSu84J3agTK9QBGT3eDQNHGgE9ZOqzN/AFmXtTtjSwh
         5Fz/Q6TgakZMMRkVkEh8WKjvyf2vb9K78HRC+zioW0yevt+NsF5DVlKPz1DX8PLvdbFw
         1iOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360190; x=1793964990; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        b=V1ickBR3IQwBA5lJ/mu44SbFr/zvMqxGy2SFhB9xy/WKrqjO5RzM2S/7V+mrToIro+
         ehwY9pC/9hVJHs7QimwB+WwlUlgBLUHjf+acyCKWlUnDjljgyW/D2rmZbIHUL4FjCyYD
         EuvjuU+SS02gRJGlMINb50fFdTjCGcZi+mWtJxoxkHTV5x52PVn5u/76hmmONV/V6Zqz
         r3NE2HC60CqVv+ir+PytG/Jx/kwfWhXvEIsbXEX4+MMtMBdqldddL2A0LIIdOoVuDv5C
         DUrk8YSoOH/TZFwNpNtIgggmAYtQvB6f/7+12UEMxSXzpVD60B2EZL/8I6S4/nd6Frk5
         57dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360190; x=1793964990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        b=SqAIz4O4z1Mi6Fk+8sCoynlY7enypq6CBS0XzkVsvadNK/ujGah+CPVZFDOKRkY4Sc
         rZHQQqg2W1j6mkLauHPfq7cjfLIzqcd2gZ8uoKdjVxOazroB1gZvN58XQQP3VNDX3UCb
         L6B+shAV2PeN3NY6ACcQg3QMw9LrIQx9m9ARNWZLQEuT8WDxV/rdHIKtsWv9g3nhyWxG
         8NPHox1DcDaU6m2SxrpuLzJ+QKgZKz+QWLkEBPdKpgTXFq9cE01v5xcdprZ9WjxiKeke
         p9Ku/jiI2Nw2WLPpePF7VFUGy90ZTuTouqyCAbR6FWFRz9O/jWknbqvqlJg9Xxwfx4iA
         w0wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLRwocKrBcp4ZsZrD0c0Nq902tzX3DqZ8V0FrdfONDDMg6hTPUgQDTVN2OOh//o8osOIViidiVyBnWp15Nvjof@lists.infradead.org
X-Gm-Message-State: AFq9FYITUdWb4wU63wsPQUyE7goBRKp6Q3U2ODgMsCCfN7P7QHmcPnZ8
	fk0ttRDFB9LgBd9ntdYqmVW9SEUQbbpaSy9dHUQrLxfDkUeCjxxw2N9EFSKL3pAk4yZA67Qo8d7
	Y0j62pVFyYckw3KXlAGtAiIDMK0snSg9ymY44P14Tqw==
X-Gm-Gg: AYBFou11UBrtyu+6jl+H99Qx2JA6vSDGPWK6oAm+RbHLigikruPqpqKla7A6eZksRQv
	Ji7cAnaLmPQ0Db9PRoCEAHE06722uOIl/qjLH9eqPcaLovX1PqdrirBxdJ0goCgZU7Erba288ED
	NCsFiMs6Z/G6YH1WXlflw9zUAEmDbqi/b38sAmKXHsu/ftfeHgxOgFZi1a09cF54hrLaWo/XJ18
	2yx33vpzNnkg5T7YTgPU8N5cPyxoXw3ljRMBgGDrDxcWPNWjQ/GFizCVFX5OfQU4nrbSieWslNq
	0x9wNTZBAmMokx4G+cLuHJ3sPoMmbnjQ8CC7aBuSp5gNu2ssCQl3zKWRFXv+2BMmKFv/rTYjNu6
	MnuHc7RpJ69DhyaWQ1c/q2ZGwdk+KxIdEOUuySJ1PBBxhTen4iEvJaiybjQ==
X-Received: by 2002:a17:90b:4d83:b0:3ab:d26b:c2e9 with SMTP id
 98e67ed59e1d1-3ae89763ad5mr1536469a91.33.1793360190259; Fri, 30 Oct 2026
 04:36:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:36:18 +0000
X-Gm-Features: AclHuK-U0mC8XWkCgVPn0dV4tOoEVFqDFmKaCqBI68agDhWQD9u0tSx5WY3ydLY
Message-ID: <CAPj87rNJgUPhXtBj6tw7pzeHqmbPwkmVzzc6fT5pj_XxAuss=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE
 overflow on 32-bit
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_043631_760390_DA0B02D3 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On architectures where unsigned long is 32-bit, VOP2_MAX_DCLK_RATE * 8
> is evaluated in 32-bit arithmetic

On architectures where unsigned long is 32-bit, we will never run VOP2
code. I guess Sashiko doesn't realise it's just asked you for a
functionally-correct but completely useless commit.

Reviewed-by: Daniel Stone <daniels@collabora.com>

