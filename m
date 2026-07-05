Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D703C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfOoMuZEApI7TKZXEN8dHfuOQq4puRHMEr9ArXWgLU4=; b=3uG6kDXOxej56W
	1rZuLVGSn3saw4iTYVY3sFjc45d4FmB3/ZJULi63WFiYOiM5MXrMvm1qsTIhcaGYfktD4Bg4sm3bl
	uVaPzunzSKp55g8k9Xlkzrjj3ZBQXjlW63c+3srP/HMFOYQ/4nH9Gc4ala1cgFgRqFKVPfhHmXNAK
	L6yTzJw4eo3PdWJPs281gHwGDsvnNc1yTgETC2SpdWzQ40DBn17rsEP2qcOp6Jah/0E1VTvlJbqhj
	3nfm3hg27vvQ4kUS6AW6fAbuKdy27sR7nntOZi555uLqCW0n4lSsuZ/jKmwRWOXFa3ExjKqdCnZ0a
	itiIbqMXiVInJam2BE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSID-00000009ajl-444E;
	Sun, 05 Jul 2026 19:14:17 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIB-00000009aj4-3eZV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-476a130c138so2348906f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278854; x=1783883654; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rfOoMuZEApI7TKZXEN8dHfuOQq4puRHMEr9ArXWgLU4=;
        b=kfspWbfIEMtYLfPseyh2vdAlVoHRLs0ber/wjrjmCe1o1z0r5x6lC2To+4eiU79SZp
         NA1z23yLo4L0bgJ92cCEbhaSIaVgoLdDEJ1PnwhaQ+8x6IPBr40cA+YirYENndAAt06K
         pIv/vw6mKPoNo826FwWouToDXcCVe3tmz+bK358jYt7f86gwiliFCSyJ9ZikFbc6MGob
         nZzBT9P2T886yQXCg1/lKNT9RgwBEKfvZcMQVNiTGoYrRpOJV9p/Ue92msV70wUww++w
         j9ubddAOJFWebtJ9qazgav2MxPSkcYC4ig1KWk3AbiZH5rzXl5qGdVueyCs75jpVSHaz
         3jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278854; x=1783883654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rfOoMuZEApI7TKZXEN8dHfuOQq4puRHMEr9ArXWgLU4=;
        b=dOHolTdL55jr0RAX3yh7n4ARO42LGmgoJJEwgYMAwe43Bof7BT9faG4SMUyVwTq8aS
         y9+B9iuGue06XXfZfPPKXI23abPgcmyoBr4Z4uI4XxRKqYdDgYbSCW2HfdYYrNuqeRAM
         qunQH0Ep662A81lcOxk7qleRHCpizlz5oLpDJrrPKv8lg0p5ShdgYnuwa+BziHOcf3zN
         aGa+m+F+/SpJfsIOs3vHtcOonVWx867gA4EjfcEqGF86rTS2HUGK4SYfcJGOExbIHAfM
         ZuQ/0QAr2Uv0eCwO38/SJGIDfcuj0BbPYoUbRaIbW2jtmRpYOWXP/OdO7lKM6R8wsrGG
         sCYg==
X-Forwarded-Encrypted: i=1; AHgh+RpTG+K5+GZ9SvTxGCoFxwvdkvXCpORgv4EZr/bEtgmzudk7BN3e/M3TuLV3rVOsk+2d8NSuiPEFsDlbIom9rRNH@lists.infradead.org
X-Gm-Message-State: AOJu0YyAO8DoDHieifsn1/+Oh0kmUIY70F/EqpCUu/WOgBu3BYDwZ0gl
	j0dxnhmIzccMx2zcGt8/rrs3uMCg7Jtczi8yZFDidmC9StkZ+frRrv4=
X-Gm-Gg: AfdE7ck1In5Ap0FXIopPsGgMo8vyuZuKCpEqDCkdGh38gRHtlxZ7tA93vt0qs4slTET
	+hDmrzX78KouF+vPowEmoUkCSdfmuNeRWknOHiEnBiRkWTybk13yisVs3SVDkffwPHTmWwtkhPP
	9b3vpJGQDxKVAVhM7+ZI9CYP7sVhyuc/aZeLmphj2KLsh0pPqFMP6+3Vp9WuR/gp0Gk/gl5RCoo
	USk7UC4B0LJ7MUDnFW2OfnN1Hl9lx3uuXnrqaL4KhwErPbmFUmFbxNtxPQkqZtUSC5g7OGoOgky
	r0b8+Zm0d7/wEvUreVxrXyg9mpY0Tm3QAN7g09a6WndlFA2uRZexJ+EkV119qL+qvQe5kE5eq0T
	GLFkEpcQwgdJf9k17sx5ks7vQHRlkx5z2VfcIHh+3yEMlJun0u7TQD8R2CMANjnfjBuhb5Omxya
	CGhDSrsd5fIxXYqrs=
X-Received: by 2002:a05:6000:469a:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47aad6435e9mr5514134f8f.29.1783278853423;
        Sun, 05 Jul 2026 12:14:13 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:13 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [RFC PATCH 00/13] Enable LPAC on a7xx series GPUs
Date: Sun, 05 Jul 2026 21:13:34 +0200
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtIN63gq4iHtosacbUk3RDG3
 t2qx+/y/ysYq7DBqVtBeRGTV25wuw7SPeQbo4zN0FPvydOAI1tSKVUWxhwmxmcJCediVTlMeBw
 oOL+Pjg4RWqQoX+X9G5wvf9scH5zqtwrb9gEd3ZUqggAAAA==
X-Change-ID: 20260603-descriptive-name-lpac-upstream-730a164b105b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=2538;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8dMwcHoLl0Z1JzcMDPMcwAdi90HhpnlCPh0AzVY5gFw=;
 b=Q83mQkQCI/ZbHgZyMczAaUD07W0pExCURYUI+AfeuCtFffXnVzp1aiJOAaTDPf13rw1Fzn+7X
 WRuPw2v96y4CWwkfRLibXR6NQ9DulNdUY/gYM6XuxmEibN0Vv7DXr+i
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121415_960327_983FFFB4 
X-CRM114-Status: GOOD (  10.95  )
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

This series enables LPAC on a7xx GPUs

Currently hangcheck and recovery are broken as the patches to make them
work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/

The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
to work correctly.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Anna Maniscalco (13):
      iommu: arm-smmu-qcom: Configure lpac device with split address space
      drm/msm: add support for lpac_domain in msm_mmu
      drm/msm: look for lpac from dts
      arm64: dts: qcom: sm8650: move smmu sid 1 to new lpac device
      firmware: qcom: scm: Configure LPAC aperture
      DEBUGGING: print contextbank and other ttbrs on fault
      iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac
      HACK: use cb1 address in lpac dtb node
      temp: add LPAC regs
      drm/msm: initialize LPAC ring
      drm/msm: Add LPAC submitqueue
      drm/msm: set ctxbank and asid based on ring
      drm/msm: add lpac ring to devcoredump

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  12 +-
 drivers/firmware/qcom/qcom_scm.c              |  18 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 191 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  79 +++++++----
 drivers/gpu/drm/msm/msm_gem_submit.c          |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  29 +++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  17 ++-
 drivers/gpu/drm/msm/msm_iommu.c               | 158 ++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h                 |   7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  11 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  14 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  37 ++++-
 include/linux/adreno-smmu-priv.h              |   2 +
 include/linux/firmware/qcom/qcom_scm.h        |   1 +
 include/uapi/drm/msm_drm.h                    |   2 +
 19 files changed, 492 insertions(+), 103 deletions(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260603-descriptive-name-lpac-upstream-730a164b105b

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>


