Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F6FCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=; b=m2Ez1cvUBZ7JhV2Zc9cwjIFMhG
	6hsOtzoYi4sBvxNnURKBdmQPmHFZe5bBbQV7t6+KmFNWmkOZS6gNg9ZXjxHoIkLOlidC6fKAwxFOY
	bSgxdxVY2E8L7d5pAqAnpA3t8gZbiqaia0bFx4fVrHpEHMqvr4i6MZis3mDcHHfAOt737T6i7rve6
	CO3Cxrdh7YlqiZeuGHMt4+uBnecCHXhT/vBK8kH7WGlX40ba4WH4RyCbAYcQHCJ0qI7ta+tmaSfTA
	Pvd3rVkZ9OmY5CYCprancRQTY3jHklYxhXVNumHvRPvWkdj3St762AruejFlY1trFmtQvAL4olbx1
	VzU7Peuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSjz-00000007Yh7-0HDV;
	Fri, 08 May 2026 21:28:11 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSjw-00000007YgO-0cYF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:28:09 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso4317889a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275686; cv=none;
        d=google.com; s=arc-20240605;
        b=AbwLFvscnaXorT10DxIu7o402qaN6Lb8WhScsL0mS2mcJLAU0maBuC84rxWahph7rg
         AXnpy7h96nDNpQVnEIeyZz6817cvtWs156/LeZD2OzKchS0bR5SWPyzqOoYo/r8SBLCm
         DLIoZWJFM+Zl6LWm1soANAbO36IwWoh5ZbzrMMhkuvSZ0hB5uiNB5gebL3QVwFr81OKe
         a7TsvZMaDR3UQZZDPw4AiWO7ClAKEOn4u46U2DGELPShaYOiTg/Sx6HIdCq1epIp6nJa
         B5PrhVdMy0S2YB29/M9LmCH1idzy/+KfEODjLfuFxoaZueCusucvW3M1sUCypKa9XJh0
         9ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        fh=bi9XIwsROESdc5V4ApDEWhyKL9af6Uxr9LK4OlDGvhg=;
        b=LmQC9sjKKs2If/N8vfWSUCwTF9BaEFpmErffG+gwx2hFd1B7t+tp8/r3rMN2qkSvUY
         uAQZTNZsLcYs8Q8piMrKOMczz9H8aJZ82v7asD1E8xMpzsVqfhGPmgIT/uEbfoSdyOIP
         755Sah6oU+zajwCPlmGkI3zS9XYNKgg89m7lt1KtGkJhgVt1nFSveyh45meH50lNiAAv
         DM2sSUN2BCgYtL21Dr6FcH8k4yPKKCBbYV57xAMn28LdSmAkTtppyy3qgi1vEmx6fs5+
         MG4pWHUsZI1aOLywEsBAXLVq6cr/dorX98ZUQLgTF1fRU6NqcZ1rqfQbyfOhq/AB5yyG
         xWhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778275686; x=1778880486; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        b=X/W4nB6RrpwFtn6IfGQfeesYih6GEQBQKauW113DgCaqTyOUOElqJRo7PjuANMI/oU
         EprI9t+UqWKfeR5RBSm4rR1IGxorLYyjsT1MEfrhH3BrV4VuVNd6IwnMRXgcQbjYHRBQ
         ke6q7mxRCqO1XUE+vdOCe+9HUP+ZONzViYJtBkzT9ITF07WXYenLvOZIvuTjQwlPL7b8
         1mc00L4tQaVrqixIGbUyj0/m5cAAWxGjLMY9U8P4g0pKU4QAw9omdH9gTpz1/AmC/0Cq
         6M9h3MkUjJ6q06L4uV0+i4/saXlV7C2VphtphntynC0nh2f1R+kLcYC3QzFbBIJmaNNp
         vXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275686; x=1778880486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+9T2opq2Jf9+yahtQzhCStP254LOW+LGHWIgTifG5A=;
        b=m2dEQYgKBxthTLmoc4GlceDJmDgwMZsM5CTNyoR7SXBHVDp8GS2IP3q6YtKKlyiQAA
         k/UUdOUfyaJOzar7K+ShKczQF91qoz2zaWFCxe62FGrLxgVgEU5vgSOLNJHq10vSoGnK
         BhVU6SB8fuh3++R24gmNFa1fj2rpTuoToEPMyFJw7kQnAAr+k2PoSNeo0h34vRre3Y39
         g4Nbqurda++sVhab/PR/94BET2Z1fFz5EfoARwXPBltJd4DSAapf4tqUdsNXlRTaTns3
         eEGDGu69RlspnBWQ/rW31SVHqfuVUVIMuOTs9QvkJIpTuYzXFQb/HcusOKJ8HIwaX8Hm
         BNvw==
X-Forwarded-Encrypted: i=1; AFNElJ9kkWv0VeaTvq6kco92uwkupdkE+nm4juieyGKJmgINjMJtQkjGfDcn1oAzErCOLLHbkxMFpVJLEKwyMnyNx1Gi@lists.infradead.org
X-Gm-Message-State: AOJu0YxSPt9qwdm7poBEeRszEKntB/1nt8hG0JcsD5udCxnY21djVVMp
	moD5Mer87h6JL8yOgHRqMQ2BECxFM5ob7fRmTIvNp/Dd9WvOPIreQDrrdgWS/mtAsNm/Qiq1CAh
	qA8O6JZglOmZzzDGhkUT5mC1xTOgLk4aYDHM0cPPnVg==
X-Gm-Gg: Acq92OGEx11jaCR5GMvk7canQB7uQ+awFl9h5/SD/j5Iwd4Sn2Qqg+eJMaQkqRVSTS0
	doQad8SmaLC4EhVRZQkdYrczO5gsAOdjxy56aatWaUffJ0FPf50b9ZkiADASN7esNnMZhSrbrqV
	KRyU86DlFDCnRfqoVzK9PmJMK0ku7g7GtvjceqCsFAtFXDhkpN8aZfdxqruFSwoW8Y1H9Z+ECbQ
	YAocxHh/sln7KruLhoDd9Sxh65K6rkvgNqnh8cCoybmO6Pl62uzZOSLvbv7Q2aVApW6qVnI9jz3
	z5yNW3j5v+6PrEmqiozIXmp0JvVlQ35ebZq7qmjx6w==
X-Received: by 2002:a17:907:868a:b0:bcb:ea69:39c8 with SMTP id
 a640c23a62f3a-bcbea694c4fmr29891466b.38.1778275686056; Fri, 08 May 2026
 14:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:27:54 +0100
X-Gm-Features: AVHnY4LpLOSjFyVaXAGyH7bOa_gQLppEIJLOzpAApaqZ0siC-A8__fDWDoAHaHo
Message-ID: <CADrjBPry4yQXjc4MLVFvkhHbVCUPmVw5BFLVuMkE21wA2FAdfg@mail.gmail.com>
Subject: Re: [PATCH 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_142808_234537_F28B7200 
X-CRM114-Status: GOOD (  26.47  )
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

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
> a pointer to a `const struct acpm_ops`.
>
> Previously, the operations structure was embedded directly within the
> handle and populated dynamically at runtime via `acpm_setup_ops()`.
> This resulted in mutable function pointers and unnecessary per-instance
> memory overhead.
>
> By defining `exynos_acpm_driver_ops` statically as a `const` structure,
> the function pointers are now safely housed in the read-only `.rodata`
> section. This improves security by preventing function pointer
> overwrites, saves memory, and slightly reduces initialization overhead
> in `acpm_probe()`.
>
> Consequently, update all consumer drivers (clk, mfd) to access the
> operations via the new pointer indirection (`->ops->`). Finally, fix
> the previously empty kernel-doc description for the ops member to
> reflect its new pointer nature.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-acpm.c                     |  8 ++---
>  drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
>  drivers/mfd/sec-acpm.c                             |  6 ++--
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
>  4 files changed, 25 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index 93667777094c..953ca8d5720a 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> -                                             clk->id);
> +       return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> +                                              clk->id);
>  }
>
>  static int acpm_clk_determine_rate(struct clk_hw *hw,
> @@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> -                                             clk->id, rate);
> +       return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> +                                              clk->id, rate);
>  }
>
>  static const struct clk_ops acpm_clk_ops = {
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index da960d3e1145..1a0d98b55439 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -670,30 +670,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
>         return 0;
>  }
>
> -/**
> - * acpm_setup_ops() - setup the operations structures.
> - * @acpm:      pointer to the driver data.
> - */
> -static void acpm_setup_ops(struct acpm_info *acpm)
> -{
> -       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
> -       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
> -
> -       dvfs_ops->set_rate = acpm_dvfs_set_rate;
> -       dvfs_ops->get_rate = acpm_dvfs_get_rate;
> -
> -       pmic_ops->read_reg = acpm_pmic_read_reg;
> -       pmic_ops->bulk_read = acpm_pmic_bulk_read;
> -       pmic_ops->write_reg = acpm_pmic_write_reg;
> -       pmic_ops->bulk_write = acpm_pmic_bulk_write;
> -       pmic_ops->update_reg = acpm_pmic_update_reg;
> -}
> -
>  static void acpm_clk_pdev_unregister(void *data)
>  {
>         platform_device_unregister(data);
>  }
>
> +static const struct acpm_ops exynos_acpm_driver_ops = {
> +       .dvfs = {
> +               .set_rate = acpm_dvfs_set_rate,
> +               .get_rate = acpm_dvfs_get_rate,
> +       },
> +
> +       .pmic = {
> +               .read_reg = acpm_pmic_read_reg,
> +               .bulk_read = acpm_pmic_bulk_read,
> +               .write_reg = acpm_pmic_write_reg,
> +               .bulk_write = acpm_pmic_bulk_write,
> +               .update_reg = acpm_pmic_update_reg,
> +       },
> +};
> +
>  static int acpm_probe(struct platform_device *pdev)
>  {
>         const struct acpm_match_data *match_data;
> @@ -734,7 +730,7 @@ static int acpm_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       acpm_setup_ops(acpm);
> +       acpm->handle.ops = &exynos_acpm_driver_ops;
>
>         platform_set_drvdata(pdev, acpm);
>
> diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> index 9e15b260b8df..3397d13d3b7f 100644
> --- a/drivers/mfd/sec-acpm.c
> +++ b/drivers/mfd/sec-acpm.c
> @@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>         size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
>         const u8 *d = data;
>         const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
> @@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>         const u8 *r = reg_buf;
>         u8 reg;
>
> @@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
>
>         return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
>                                     ctx->shared->speedy_channel, val, mask);
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index b206efa62be6..fbf1829b33db 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -42,10 +42,10 @@ struct acpm_ops {
>
>  /**
>   * struct acpm_handle - Reference to an initialized protocol instance
> - * @ops:
> + * @ops:       pointer to the constant ACPM protocol operations.
>   */
>  struct acpm_handle {
> -       struct acpm_ops ops;
> +       const struct acpm_ops *ops;
>  };
>
>  struct device;
>
> --
> 2.54.0.545.g6539524ca2-goog
>

