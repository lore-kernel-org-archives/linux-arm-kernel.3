Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB85CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=; b=I1QAGGz1ExFKuhO86LSpekc0L0
	LGs+Fl1M0JF8GTTp2XSbBU5Wxmu2ZxPMbtkF7TkRdoH7N8alntRCGB9wtnAQwQHLUwFdeJ58tYksq
	b3wuqbeOyG5sU1oNMiiTqHxYEEPFDh2+ixFTgpiEJpmeN3yBsKheKHKWS2pzC4P7bYxJEcbMQu/du
	v+2SsJUvxw5W8C+arCpx3JFjWvcPrxZQ7lDloYhYzGnFQ6zOgHZQm3KcSswQmOqycytodmCvj79Vc
	xuuLB4Bz2kteAWe779d0iZgS/YfgotLDshp4jMCsA1PCLQRC68Ndy9R/t6kMrUc55/hgMltB/pWys
	ZVRLUgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSPK-00000007Vrg-1iwu;
	Fri, 08 May 2026 21:06:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSPG-00000007Vqw-0rzx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:06:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so2230584a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778274404; cv=none;
        d=google.com; s=arc-20240605;
        b=boamNCxv381zpLH/J1ZCckqLj0fip4ZCHDYmrW1XDIGTr5VxbnQeZMg/xmoZW2fCBz
         Bx4abno8oGI5wOcrsZIbEbx19UhhPxC77dplV7wvhxwh4zU4qktvwl19GaRpk83FWeHF
         wrcOZ3iVDPzY76F+6jLGf2nhCDce8FxLf+qOWCsHCKDOP06fsP34HoDdrv24q4GneWlN
         2khYcZuAOmMxmOKFDOkwSD2sthCUVWHX7jRWSnGjfgq4UN9Zk1HUKpgZyhBWYTv8lwy4
         gf6SrS0rM+F9Pftv0iSFShRK2xqHPloeXGo6pCLzN8DC5Lx7aZbMSQ2vHpuE17CbbKMC
         RoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=;
        fh=Cc+PeEgSMGGRUKg7IoXMz+8lmD3mQyg5I0CxBgha8ME=;
        b=Kl9NgCaDlHPbzkzq3Ti4/op7TcS0L1kGgL7nxVp6u3wsKGw+zWMPSbW5Se8E/G2vmQ
         IXA7eZ34qyKRa/PyH3sVuZXec7aSNkxvVjqJodcXSVamRJK6Jnf9gVZ6UCLOgN71VTPz
         HHpNhTJvUAu2LeCB3fYweYI6v2KjGsCFmm2uRc/yYVQFWoAYBQx7rDZe4F50C84IK3Pr
         rJGXIc3LFj9VFgJDHmnyluYSDU6OpoTx1v93PMxmrQUCu8IiJJvY6ygpeRMsqhLalBOh
         tmPzBbttkiu+/T5HtHLUNaPbtfwXBjV3CIsL1sdfT+fOUoTggRUL++2J+bLLSAs34iRN
         qkyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778274404; x=1778879204; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=;
        b=AhkFJz3irr3NSCUbHD2/XUTKj+3lrPjek+A+JQ0t57ECuwroTzhVM+Yaa9ARGC9ZJL
         XSY4/sOh94G8WvxB4xwJ4u6mxWeNvpzh7xMcwB2OuuZFrvLoQs2IPbJ9HymircVKuq8i
         mw6sXOw0G5v8A6MxVeN8/AJdxkDnxd6JCmDAnnagWNYu+0QZyGmzxYYuXPtmBXNpC8ck
         6H019WTay+EBMbI1EJL14RHFyhi4lT7EGM4ppt35aaO5elBeRRjj+ARCSz7yoE5GCtuY
         nL2QqUVxlPVksl5uV0lkAv8iWVFW9qzZbr+GVoSgQPnXUrWPPFgJQlDLxbJJjLFzFkRU
         LKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274404; x=1778879204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVglEzUYNidpFkHmJ+FSq7gNX4LLvQ3/JxKQt4wn7xY=;
        b=oK3ul4m8ZGGCrVvFKN/1vXaMTBpu1apwDjGZWkVrj81/ZBI5pdMnf038SRpsT5x446
         GhiWqLuz4Uq5Q2/DvmIoJRaw6bmAa7un0PSur9pEsM6+45R+oqB98B6lIAENVSqRilX7
         sXYVxGVaSvTmfvmc67E0PkJZxaLceVFY1X4yrFIlqM9YyD6l+WDYuyC2ZJL0XiZeQNnh
         /7LyrGICZBTCqKj8cIiU6d99K1MmkRt5musrhy9g2iNjFJR1mvXhUqIEQ5YFlYaqT7BK
         fyzuvl2fA2Sp/scHYfH5VRZxjA1Yla2M+u4NmEys+XbPkXcM+m75JlcAZ6z2YMGofhCk
         L2Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/+Nu4Ndm/9Vz04U4XZa32J3Eqkvl8F/PMZt9Sq9TS4gq8+nLVORtg3DwUYZ1dtgLjekjShYTbe2sHZwpOv48Ms@lists.infradead.org
X-Gm-Message-State: AOJu0YxM3uROHKbcR9BvoGFPwUfFAXwWstj5MMvDSDmU9BaTah/V1zUt
	Wyi3g2psIRauE1FB9IWLLIalqpJFx9ZTKrhv7un/pWU4h5xgTVHJv+aRtfh2QFj1wdHIZn2N1ID
	DcYAmIQYpsXJYwuIJ/vSWaPmyMN+2KepM+fT3484uSA==
X-Gm-Gg: Acq92OEvCNdI42m7Bh3n1PUIRFBlL/JoRbtRZROarovl1800qG+74iN5AiuX3AFzreT
	LMg1uERSC9WFdavD/NeSto2srcOr0ouG72jUPDFjT5F5IZpfVTyd72bQiDTMSvo67D8xPHpcOSU
	JCHtqm4DonBTTCaQDtg7Vv7FUjWr0yh/vGkjOuwlY/Fgvx1NQzpijyMQi4RDJFxJWLXJsDGmgEM
	0n6GxlMVd9YYCDCGkZxa6AFjpr+sBAUS8NbUAtrasdAFVPJhGFyb50AFgCGX1EF40L6s/VkgVQo
	aXyFJrHQrfdt2oa/07h1SOhgNjORQxuCBTalIzyNaBP2B8NPuFcC
X-Received: by 2002:a05:6402:1d4d:b0:678:9584:fb30 with SMTP id
 4fb4d7f45d1cf-67d638a6f0dmr7231282a12.3.1778274404164; Fri, 08 May 2026
 14:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-1-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-1-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:06:32 +0100
X-Gm-Features: AVHnY4I7v4dFHshHkQJXBZtedPzM4Yzg9hY4ruRsq52W36WQVSQVrcE_u_ZOUqo
Message-ID: <CADrjBPp9SSiS7ub+gtU0gRtPEg3jCy3-m8nDGPXmY6qibA3TkQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] firmware: samsung: acpm: Consolidate transfer
 initialization helper
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
X-CRM114-CacheID: sfid-20260508_140646_314661_E0675C4A 
X-CRM114-Status: GOOD (  27.48  )
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
> Both the DVFS and PMIC ACPM sub-drivers implement similar local helper
> functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to initialize the
> acpm_xfer structure before sending an IPC message.
>
> Move this logic into a single centralized helper, acpm_set_xfer(),
> in the core ACPM driver to reduce boilerplate, eliminate code
> duplication, and prepare for the upcoming ACPM TMU helper sub-driver
> which will also utilize this method.
>
> Note that there is no change in underlying functionality. While the old
> acpm_pmic_set_xfer() unconditionally assigned the RX buffer parameters
> (xfer->rxd and xfer->rxcnt), the new unified helper introduces a
> 'response' boolean. All updated PMIC call sites now explicitly pass
> 'true' for this argument. This ensures the unified helper takes the
> 'if (response)' branch, performing the exact same assignments and
> preserving the original PMIC behavior.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm-dvfs.c | 20 ++------------------
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 20 +++++---------------
>  drivers/firmware/samsung/exynos-acpm.c      | 26 ++++++++++++++++++++++++++
>  drivers/firmware/samsung/exynos-acpm.h      |  2 ++
>  4 files changed, 35 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index fdea7aa24ca0..7266312ef5a6 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -21,22 +21,6 @@
>  #define ACPM_DVFS_FREQ_REQ             0
>  #define ACPM_DVFS_FREQ_GET             1
>
> -static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
> -                              unsigned int acpm_chan_id, bool response)
> -{
> -       xfer->acpm_chan_id = acpm_chan_id;
> -       xfer->txcnt = cmdlen;
> -       xfer->txd = cmd;
> -
> -       if (response) {
> -               xfer->rxcnt = cmdlen;
> -               xfer->rxd = cmd;
> -       } else {
> -               xfer->rxcnt = 0;
> -               xfer->rxd = NULL;
> -       }
> -}
> -
>  static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
>                                         unsigned long rate)
>  {
> @@ -54,7 +38,7 @@ int acpm_dvfs_set_rate(struct acpm_handle *handle,
>         u32 cmd[4];
>
>         acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
> -       acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
>
>         return acpm_do_xfer(handle, &xfer);
>  }
> @@ -74,7 +58,7 @@ unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
>         int ret;
>
>         acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
> -       acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 0c50993cc9a8..f032f2c69685 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
>         return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
>  }
>
> -static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
> -                              unsigned int acpm_chan_id)
> -{
> -       xfer->txd = cmd;
> -       xfer->rxd = cmd;
> -       xfer->txcnt = cmdlen;
> -       xfer->rxcnt = cmdlen;
> -       xfer->acpm_chan_id = acpm_chan_id;
> -}
> -
>  static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
>  {
>         cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
> @@ -86,7 +76,7 @@ int acpm_pmic_read_reg(struct acpm_handle *handle,
>         int ret;
>
>         acpm_pmic_init_read_cmd(cmd, type, reg, chan);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -119,7 +109,7 @@ int acpm_pmic_bulk_read(struct acpm_handle *handle,
>                 return -EINVAL;
>
>         acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -159,7 +149,7 @@ int acpm_pmic_write_reg(struct acpm_handle *handle,
>         int ret;
>
>         acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -199,7 +189,7 @@ int acpm_pmic_bulk_write(struct acpm_handle *handle,
>                 return -EINVAL;
>
>         acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> @@ -229,7 +219,7 @@ int acpm_pmic_update_reg(struct acpm_handle *handle,
>         int ret;
>
>         acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
> -       acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
> +       acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>
>         ret = acpm_do_xfer(handle, &xfer);
>         if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index a2cac913b2bd..88a06842753d 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -517,6 +517,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
>         return acpm_wait_for_message_response(achan, xfer);
>  }
>
> +/**
> + * acpm_set_xfer() - initialize an ACPM IPC transfer structure.
> + * @xfer:      pointer to the ACPM transfer structure that is being initialized.
> + * @cmd:       pointer to the buffer containing the command to be transmitted
> + *              to the ACPM firmware.
> + * @cmdcnt:    length of the command in 32-bit words.
> + * @acpm_chan_id: mailbox channel identifier.
> + * @response:  boolean flag indicating whether the kernel expects the ACPM
> + *              firmware to send a reply to this specific command.
> + */
> +void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
> +                  unsigned int acpm_chan_id, bool response)
> +{
> +       xfer->acpm_chan_id = acpm_chan_id;
> +       xfer->txcnt = cmdcnt;
> +       xfer->txd = cmd;
> +
> +       if (response) {
> +               xfer->rxcnt = cmdcnt;
> +               xfer->rxd = cmd;
> +       } else {
> +               xfer->rxcnt = 0;
> +               xfer->rxd = NULL;
> +       }
> +}
> +
>  /**
>   * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
>   * TX/RX queues.
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 5df8354dc96c..708f6b0102ac 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -17,6 +17,8 @@ struct acpm_xfer {
>
>  struct acpm_handle;
>
> +void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
> +                  unsigned int acpm_chan_id, bool response);
>  int acpm_do_xfer(struct acpm_handle *handle,
>                  const struct acpm_xfer *xfer);
>
>
> --
> 2.54.0.545.g6539524ca2-goog
>

