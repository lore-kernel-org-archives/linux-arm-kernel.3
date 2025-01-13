Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D67C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OE33POUt2+iszfpt20Nqlmknt+0wqjiuw4LPVCBXmGE=; b=LdlnO8W4Oghu4bpYaDigDk0BIL
	dN9EitKEPzi/0u9J7NR9AqRXvc+/4IQkaJkiT0K3R42FP50IBMbN4T1UK7epeVTbPYp3Pluc/F7zy
	p9vgodyzdV0CXVaXos3eWk8GnFCrsQ2V4WNhL5yjKZAIpHwJELkrnfGgsT0m0Obj4H/+QIIldhfsu
	zisYpxxJXmMRdZJ6+32ka7RFmAmZUCcru2ezHFgQYo5JXAQIC3KZJsU2wEoBkkvctzMzsxIF1SdTq
	5bvadWtIzbkNyUKt1kweIkXS6BXgq1v6U2y+GfaOfZGnuH1NJD2DQap88FZwu39/k7IFF6/S5Rg91
	kz5sNo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPv1-00000006LT7-3d8i;
	Mon, 13 Jan 2025 19:16:11 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPsi-00000006KzE-2xG1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:13:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso6784718a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 11:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736795627; x=1737400427; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE33POUt2+iszfpt20Nqlmknt+0wqjiuw4LPVCBXmGE=;
        b=sAUByIheDIofpJuIRCPSuRFzCF+Y8h+uRS3kEqV6O3CJDqQmeu9srzzU/hdaZuJN5o
         Stbv2ctdewgIpenisCdHNFJosmme+dEUVkLyA0iZ+QxXrMaYA1zdqIkur2jOSdXk8AYp
         XdGon16AydsvP5FvZ0wlh+n7semfOv+Ao4c6+E86sEgJNUmXS+gfotSjeqMGX/N8GQci
         dXjVgsim7pahRKYfhsMklmg+AUvXoOC2ZYRayj5NLZmAwhv+WkaO920QR+eEc25LTFla
         8L+BauhlBPRMlfBjlC7F4cdUQDplKJ0ztcWzPLRhgkSdJlDTj8TBuO005KWR7k3+P7JU
         s2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736795627; x=1737400427;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE33POUt2+iszfpt20Nqlmknt+0wqjiuw4LPVCBXmGE=;
        b=bk7RW2Fg8a5noqc5gDy/eA6Zgz4jTKL4Dgz1gjhs2v8OSOFeHMtBcheGsXxjuiT/Ou
         QKZn5uvrbhEX7BDMXDDo9b+9I+xXsRxukjh9em/lPzCFlDDfFwzKKhWuglhyL/IvvdyA
         b+yxjr/fGmGrfIG920jsIpqYPUj+6wkqpTJ7ZYWzfWn8JkR4fJfXWTh3+AP7S7qhMY/d
         iZVGBgo22Oe3TdvfV+2mP7NAs9k3UV1n30URoLa1fVaxVOKSDZ2Q0kfW5yexYWEulj2K
         Qk6Ir3qYxxfnTq9dtZCzWzeeXG48hVThAXu8BBHWax1YnxkRBBtTG0SzYqZDXEwLuDr4
         Ydkw==
X-Forwarded-Encrypted: i=1; AJvYcCWllGCnjv2e2M3ei3B/qD+RCD/lE7AmVNnIjJK33STzt7vIc5J2Sgi4TVdxsDHMw9+LUVGgwicrpdzp8GRtaXN3@lists.infradead.org
X-Gm-Message-State: AOJu0YwfOhgvZOaRlTiPCXskgEiTD+KHHDqSZSBI6i2lyojK3jTceW0i
	gO/2r7aibG4Jcd+mvgdOYRQMsMMkPi2n/7OMSTGjAodh7859/K5Tto7z1VcawD8=
X-Gm-Gg: ASbGncvny+HIfDLsmwiM6PfyJGLES1F6RpxE16ObeFjaDKvZgfshD2zzzEfF+SmZFA7
	V+duSDRFpbDeRLzBFfWUmjNa/uJxRsXD8UGkJmrNkan+87DmmQSZRITqVWtvNDFdt6Q4pqjzxrf
	1GaY0fIJZArp5JGCMhTVUTWQCb6o8uNTOs3FgoRMK7PLNezMKGl+3QsUFCfgVKNTfRZDsOxDAHs
	cMLstC/lmP0gD7CAlnh1G1r7EOEJIrB/UHjShctsJJE3oCO/8A9L+D5H5aywDgSiQOAkDVLMFbo
	uWF/EZjoY8kBFCF1vX5/mXcU3o0xd+NH3ritiEVa
X-Google-Smtp-Source: AGHT+IHCboU7f9NwsTjWB7S/v4RS6GfG3YG/9+YBh8V6k+rI8SG1CJroMnepLppBr6OtsLwC4toMYg==
X-Received: by 2002:a05:6402:254b:b0:5cf:e9d6:cc8a with SMTP id 4fb4d7f45d1cf-5d972e1a09cmr20527141a12.20.1736795626519;
        Mon, 13 Jan 2025 11:13:46 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2d58sm5238605a12.39.2025.01.13.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:13:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 13 Jan 2025 19:13:45 +0000
Subject: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOhlhWcC/x2MQQqAIBAAvxJ7TtA1D/WV6BC6m3uxUIpA/HvSc
 QZmKhTKQgWWoUKmR4qcqYMZB/BxTwcpCZ0BNTptjFU3l+iDYnmVw0nPjMEiM/TgytT1P1u31j6
 1C2T/XAAAAA==
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_111348_802130_83BEC007 
X-CRM114-Status: GOOD (  19.14  )
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

devm_blk_crypto_profile_init() registers a cleanup handler to run when
the associated (platform-) device is being released. For UFS, the
crypto private data and pointers are stored as part of the ufs_hba's
data structure 'struct ufs_hba::crypto_profile'. This structure is
allocated as part of the underlying ufshd allocation.

During driver release or during error handling in ufshcd_pltfrm_init(),
this structure is released as part of ufshcd_dealloc_host() before the
(platform-) device associated with the crypto call above is released.
Once this device is released, the crypto cleanup code will run, using
the just-released 'struct ufs_hba::crypto_profile'. This causes a
use-after-free situation:

    exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed -11
    exynos-ufshc 14700000.ufs: probe with driver exynos-ufshc failed with error -11
    Unable to handle kernel paging request at virtual address 01adafad6dadad88
    Mem abort info:
      ESR = 0x0000000096000004
      EC = 0x25: DABT (current EL), IL = 32 bits
      SET = 0, FnV = 0
      EA = 0, S1PTW = 0
      FSC = 0x04: level 0 translation fault
    Data abort info:
      ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
      CM = 0, WnR = 0, TnD = 0, TagAccess = 0
      GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
    [01adafad6dadad88] address between user and kernel address ranges
    Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
    Modules linked in:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.13.0-rc5-next-20250106+ #70
    Tainted: [W]=WARN
    Hardware name: Oriole (DT)
    pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : kfree+0x60/0x2d8
    lr : kvfree+0x44/0x60
    sp : ffff80008009ba80
    x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffbcc6591e0130
    x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffbcc659539d80
    x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffbcc65714b22c
    x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 0000000000000000
    x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffbcc657a027f4
    x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffbcc6579fb194
    x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffbcc65714b22c
    x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff80008009b940
    x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff22e006f54f40
    x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc1ffc0000000
    Call trace:
     kfree+0x60/0x2d8 (P)
     kvfree+0x44/0x60
     blk_crypto_profile_destroy_callback+0x28/0x70
     devm_action_release+0x1c/0x30
     release_nodes+0x6c/0x108
     devres_release_all+0x98/0x100
     device_unbind_cleanup+0x20/0x70
     really_probe+0x218/0x2d0

In other words, the initialisation code flow is:

  platform-device probe
    ufshcd_pltfrm_init()
      ufshcd_alloc_host()
        scsi_host_alloc()
          allocation of struct ufs_hba
          creation of scsi-host devices
    devm_blk_crypto_profile_init()
      devm registration of cleanup handler using platform-device

and during error handling of ufshcd_pltfrm_init() or during driver
removal:

  ufshcd_dealloc_host()
    scsi_host_put()
      put_device(scsi-host)
        release of struct ufs_hba
  put_device(platform-device)
    crypto cleanup handler

To fix this use-after free, register the crypto cleanup handler against
the scsi-host device instead, so that it runs before release of struct
ufs_hba.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
In my case, as per above trace I initially encountered an error in
ufshcd_verify_dev_init(), which made me notice this problem. For
reproducing, it'd be possible to change that function to just return an
error.

Other approaches for solving this issue I see are the following, but I
believe this one here is the cleanest:

* turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
  pointer, in which case it doesn't matter if cleanup runs after
  scsi_host_put()
* add an explicit devm_blk_crypto_profile_deinit() to be called by API
  users when necessary, e.g. before ufshcd_dealloc_host() in this case
---
 drivers/ufs/core/ufshcd-crypto.c | 2 +-
 drivers/ufs/host/ufs-exynos.c    | 3 ++-
 drivers/ufs/host/ufs-qcom.c      | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
index 694ff7578fc1..cb9db79ca185 100644
--- a/drivers/ufs/core/ufshcd-crypto.c
+++ b/drivers/ufs/core/ufshcd-crypto.c
@@ -177,7 +177,7 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 
 	/* The actual number of configurations supported is (CFGC+1) */
 	err = devm_blk_crypto_profile_init(
-			hba->dev, &hba->crypto_profile,
+			&hba->host->shost_gendev, &hba->crypto_profile,
 			hba->crypto_capabilities.config_count + 1);
 	if (err)
 		goto out;
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 13dd5dfc03eb..6874c769b697 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1312,7 +1312,8 @@ static void exynos_ufs_fmp_init(struct ufs_hba *hba, struct exynos_ufs *ufs)
 	}
 
 	/* Advertise crypto capabilities to the block layer. */
-	err = devm_blk_crypto_profile_init(hba->dev, profile, 0);
+	err = devm_blk_crypto_profile_init(&hba->host->shost_gendev,
+					   profile, 0);
 	if (err) {
 		/* Only ENOMEM should be possible here. */
 		dev_err(hba->dev, "Failed to initialize crypto profile: %d\n",
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b9f6efa047..d0a1e0f20a2f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -141,7 +141,8 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	caps.reg_val = cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
 
 	/* The number of keyslots supported is (CFGC+1) */
-	err = devm_blk_crypto_profile_init(dev, profile, caps.config_count + 1);
+	err = devm_blk_crypto_profile_init(&hba->host->shost_gendev, profile,
+					   caps.config_count + 1);
 	if (err)
 		return err;
 

---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20250113-ufshcd-fix-52409f2d32ff

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


