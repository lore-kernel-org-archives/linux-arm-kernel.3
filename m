Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2B1C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 00:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgZHADWpXS9kOhNwmKYW4eHLUxKCVK4/x85xToQp0Vk=; b=MHWivvM2J43TvPryFGNNsx9GbH
	Lc43b7fWWywDLFlkM7nKui2kVVJ9twYZx23N/7mXHNiBdLjfkvfCHdIfx4LtHeJOtDdYo6lYr3KhZ
	ldFhRyz91Wd9xJeV6z1cTmjBqfp42F4/BgJxMyUC6c/IRs0XfyCMWGgj06x5Gv/9qgCkaEQTk+I8w
	p39qkIPErkA0/0VdKtztlHqgTpnY86c9vz3iI8Ocgvm+AsoM98JF1Oi9NEw1TSIz2c1kEhSFMVtiA
	ottL9bGsh+6c4Zw7y9qj9tQzGFABq1QkaiiwXp8jQ4cAaDhm5SWKbb/GJqeKE8sSgyFRwNKKooToH
	8XG5Aa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NE6-00000005e96-1ofH;
	Mon, 07 Sep 2026 00:28:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NE3-00000005e8d-45Pm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 00:28:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1948040f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 17:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788740919; x=1789345719; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MgZHADWpXS9kOhNwmKYW4eHLUxKCVK4/x85xToQp0Vk=;
        b=cUhSfY0K4UA0POZn2QRJaGixELcM1zSdhfrJ9r/KQeK8AbaiaULfTTnpjcjBTwvUJy
         hiwe8KzgQtzUp7vU6BvdheBzQg3KYSxjYQX476EhEDdt6j5YEVfA9RBWynS3iQfQcoNH
         ZcS7wCrVFtV20r2kZC49pOaoOYM+bBa+FijQFM/atd4sVuJFdfHXR5ZJ22nfxkQOgNwq
         840Abj5/JZfb0e0LvJ55T44i5wvdvfOysm1J5p0w9DOgEGHnra6aEKG3WOqs/OWrTeSz
         0mR1vJBJNPFx3BsAt/P2iTrWsptZUWdf30JW7zuARDH+d2SGLbh1Ah+R/ZCcW2uaYJV4
         l0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788740919; x=1789345719;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgZHADWpXS9kOhNwmKYW4eHLUxKCVK4/x85xToQp0Vk=;
        b=NzOu84wudDc8zz7nr0FjIl5/tsL0weVVKTLXlhKEoMokguwmTVtwT+kWYM+MCMdxHM
         kzznEuPr33I47XjVXmnqAKL8xhm8FM6iDfT9HihqdG7WHUYiMeaYt7BxpMYFcOksasgW
         ejlqgP4i3GWt65B7XHAY0eGU46r6b13gNNFl1Fo0oMN7B0JkGu8WM9AIg3og3nGwH/nq
         23/hPqsjGlnzV6O9jBYVYlCfK/6j5XWna+/rm3P7YU5upjlORZ/eWB6mJjgwiYVUnD2y
         KNNjShtBcxfYPWERpJogARECjswLzn1YyZqFfyuTd+C26izFHypsF+b4bBPG7FQrFXAZ
         bOsw==
X-Forwarded-Encrypted: i=1; AKwUvByz6izDLb4cZNfGxCPdwERIHH6U/E3rx9f1Y4XLJY3rBPS86W4BR4ayF/OeG5VHGCX6SUE7GYN/WU0Jwfe5Iw/T@lists.infradead.org
X-Gm-Message-State: AFuF++mfjczPI/+mFglFg+x8BFnLqHX87shlMX2wM0ASNInlaEmZswrk
	A+o6UpbaOGHA1I6eqPSVsmYaAEcQzfTJ5/YzbgMg1Thpu5TxtnWnFvCyS4+1/M4Xd/A=
X-Gm-Gg: AYBFou3M6vZ8pPfIe2wqsM79UaKgqzd6Fz4reHs1St8u5Y9MLlTqDxMTe8G/anQHD90
	AQK7NFY5kZZ/LpXeYn4SRJIpu57SLnBAaAzg80mWLSATAdHICdzZ+m3C6t4G4KTHnrM3c/fZTLY
	7AcXpfH30tUg00id72g6M7MjvS8EXMuWKTe6RvuR3N0y+pZYeJfctcqzaNyVbqFxil7/Ku7MYPK
	U+oNEi8YZZkVEZlqiQKKV9gcumPbZba/NzvYsyTS8EpbP1C9XlmBqVJ6O5/2j3FaoG+dZkMR6ZO
	aL/u0DWRjC0JHsUFW1I7RzhjHtwbBPLL9KkFpDeaew1OVokvzfGJQ86nzrYIkySrboIWBI+AjFi
	gd9UKekxsEDlYZUzbJfnJxFbucrO2hdPUvZLXZk+qotwRyW8i5iNsayKpx05VKXx8XfOYLR1dfW
	oq8q6pYO9diuqw7odqvuAjjVMmLxIwrnsqYm6O/deAhJ8VwVNX5gfpF4LUrwNz6XYDfQUXJUXQs
	WOv71jxTP1BvXO17YfSay9YM5togwBwrGvGF18jUDrn5+JJkjtSf3DMF2Ry
X-Received: by 2002:a05:6000:4710:b0:485:8a47:5b83 with SMTP id ffacd0b85a97d-4858a475c60mr16910358f8f.32.1788740918931;
        Sun, 06 Sep 2026 17:28:38 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bc74298sm21639306f8f.6.2026.09.06.17.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 17:28:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 01:28:36 +0100
Message-Id: <DL8NQGNAVSYK.18TYE03LPQSW5@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>, <semen.protsenko@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <peter.griffin@linaro.org>
Cc: <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <thomas_turner@talktalk.net>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to
 Exynos850
X-Mailer: aerc 0.21.0
References: <20260905170914.1640-1-tturner@lineageos.org>
 <20260905170914.1640-3-tturner@lineageos.org>
In-Reply-To: <20260905170914.1640-3-tturner@lineageos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_172844_045145_16787D1F 
X-CRM114-Status: GOOD (  18.63  )
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

On Sat Sep 5, 2026 at 6:09 PM BST, Thomas Turner wrote:
> Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
> for temperature throttling, DVFS, power domains, governor support,

One of the sensors exposed via ACPM is "linked" to the GPU/G3D as far as
I know. The driver part was sent already and three sensors work there
(two cpu clusters and GPU).

I've never tested yet the DVFS of G3D via ACPM. Maybe it is worth a try
on A21s. But it should work the same way as clusters clocks.

> boosting and voltage control. Once PMIC is properly implemented, support
> will hopefully increase. However, the panfrost driver probes, the
> Mali-G52 GPU initializes and the core clock is set-up.
>
> Testing for this patch was done on a device not currently supported by
> linux, the Galaxy A21s. After enabling this node for that device
> locally, I was able to test and confirm basic GPU functionality. As of
> now, this patch has no users which have tested GPU capabilities and so
> the node has been set to "disabled".
>
> Here are some logs I pulled:
>
> panfrost 11500000.gpu: clock rate =3D 377000000
> panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,0000=
0400
> panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x=
00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
> panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> OpenGL core profile vendor: Mesa
> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL core profile shading language version: 1.40
> OpenGL compatibility profile vendor: Mesa
> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL compatibility profile shading language version: 1.40
> OpenGL ES profile vendor: Mesa
> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>

So, I've got A21s and installed pmOS to test all that.
My logs are slightly different but graphics is definitely alive:
[    0.200787] [drm] Initialized simpledrm 1.0.0 for fa000000.framebuffer o=
n minor 0
[    0.215130] Console: switching to colour frame buffer device 90x100
[    0.225540] simple-framebuffer fa000000.framebuffer: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    0.226134] panfrost 11500000.gpu: clock rate =3D 377000000
[    0.230960] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x=
0 status 0x0
[    0.230981] panfrost 11500000.gpu: features: 00000000,00000df7, issues: =
00000000,00000400
[    0.230991] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x0000=
0000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    0.231002] panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
[    0.232329] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
[    0.232726] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 1

Also, when this is applied with status=3D"okay" on Winlink board then
panfrost itself seems to be alive and drm initialises despite missing
regulator as indicated in my other email in v2 of this series, hence:

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>

Thanks for working on this.
Best regareds,
Alexey

