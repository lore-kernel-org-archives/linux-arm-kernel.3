Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52B8C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGN46lGiiSn5Nw49WHCV3A8HEoxH39zs+bPdgj/zyCo=; b=NpMZlE0eaz+D/L0eo5kurgHKA4
	eL3bWE+DIzVO9fVIDY4vvAlvQmgfLPIzMqaPOjAlU0Ywi9Cnb0QeoKCgCFY0yuK8gp5BzKANlUXR9
	6bnmEqsAMfgxWPiY8eeDlPyA2NARHTJ7zdaFSzCsTodx5jS41PTwEpJS7Npb8ZYCukqoV8xSDW0Cp
	PWeyBmvw0i8dS45yscemXxuwGGByFWMEIZRLEUnrE7Ve9onPAfOq9S3OzNvTx0OPdJUTWlgXncrSL
	D5Pgo14eXXigFgdhvUT/nj1CK1dQIScaaJeOC0olKi9QIQ4jUqZIt9WMqHC2h+5mtduweCSjLW3KX
	k6sJH4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZnP-00000000y2a-4469;
	Sun, 18 Jan 2026 20:54:51 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZnN-00000000y0Z-1Ro8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:54:51 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-45c92df37fdso1360261b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769688; x=1769374488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGN46lGiiSn5Nw49WHCV3A8HEoxH39zs+bPdgj/zyCo=;
        b=WWAWEH80I1B46kERR13a8tUjjlHEzvcd3WzUzSR0Xmv50wq4R1CPGy1NlY4u/ev1Ot
         Mn6mU6A0VQlRmIGcEOMH4ItmNLSnDZf7IJTBIaIyQGqr5atKE7vn7XNYFIPuKhBZNIXd
         7XIE1kpZyOWf9RleK7Vf6ad3ADPfPr3r9iUIVufZ+e2wQVG2zkhwFTIZvF4XjC6wBlEP
         zkveIl+4mLN3zXWP+BBZI/7NPrpOYOBUc6dWUbAMAI/2nPYd/k4voNQ0Q6ei4hCS7OFS
         lOTKzMAidh2k6TtBjgSV2HL6RJAVmADdPzaHYfFvduNBn9pUvrEQ/znkKAoOiwCUtO7A
         4uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769688; x=1769374488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGN46lGiiSn5Nw49WHCV3A8HEoxH39zs+bPdgj/zyCo=;
        b=GF5evoavag/m1v2QfxLvYxZ3yVN7orEXdcmVRn4IM7yfdSS5NHeIBeNnjdGQ2x4fH9
         SR4a5NtvtNzEqJq2F4QoIp5aODbQ524AzvPAfGkwkmRpAa8JtpRdhFXl+m+KJaDA4mkG
         56sNSmdK+8ikofTsTPxmWIg9nHcW0uPcufXCvrZwdwVYHkkRCIO1WaltuOvyvUeKWpnF
         /OtGTvC0Lhn1csJrvjwrAKypL+yz8fo4ZvWXksbZZ/aZJpIyEXMV173XLsSWrzvXqjmS
         4I6hF1WS3TeUgnRaqH8tLTzAO4vwfXMx3+ZmvQDr7SyUSC3IW9LRHeBBZiicEAjqc3HO
         2unw==
X-Forwarded-Encrypted: i=1; AJvYcCV4VGlsssQjcAWiDYLGPoq1iBzjUosrRQfBWgHVMkNY0phPvzAuD74iYadFfCfknldQ1+muH8nyCdPok2rqykAH@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjunWdv8xpX6Itct1u+zbw1cgFSjnSGPvoPlr35rZh8uCIhF4
	+zyUfWqwcnIfsEhn/4w35vkoLjkoCttfviK0qB91oDzlDtvxJvdqJ0/bBBTUFzu1+2CrN+g2Jp4
	3xM7SiQByasubfVY5fPvN6RLP3KGHtaM=
X-Gm-Gg: AY/fxX5IHYkrIr75lKyQ8ZqXXIr15QDOCKUQpp26xmo7HArOaXwQLoFtKLGWfJX/3rP
	JFNfHUEpSxaEu8GdpfjlcdKFo1TqZ9YVZVEI6zklSBnuKAvQ19WQUls8A0WH69hepNWNm4oQ3UK
	Gy9KJ5l68ozyqR+YLdfQ7ORf4G0OFY87e/fB0hiS9zLv9VAoyfhUGvC5vhmBgzS0ygyaZzLH0eQ
	8OviaDTftnnMf0i/UnglLXqsOeltuXTCTBwLU1tpM1ArcSPih/ZtQ7SjAjWJ8zwpOlGOdD+VhYV
	HYb+7WM=
X-Received: by 2002:a05:6808:f91:b0:45c:7b2c:10ca with SMTP id
 5614622812f47-45c9beb8758mr4712801b6e.13.1768769688407; Sun, 18 Jan 2026
 12:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
In-Reply-To: <20251216-imx7ulp_mailbox-v1-1-66b5bbcd3005@nxp.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:54:37 -0600
X-Gm-Features: AZwV_QhIxbEz92mLErTU5GwUSqKCCNXMoI5nHSsvKDXWYHWqLAJqWsOFKMlpZco
Message-ID: <CABb+yY3SAUiw=_Pa7RQqfaP7LsX5cS2OprEAq9HRY1inebjCaA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: imx: Skip the suspend flag for i.MX7ULP
To: Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, peng.fan@nxp.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125449_387479_7DC8C2B8 
X-CRM114-Status: GOOD (  23.65  )
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

On Tue, Dec 16, 2025 at 1:59=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> In current imx-mailbox driver, the MU IRQ is configured with
> 'IRQF_NO_SUSPEND' flag set. So during linux suspend/resume flow,
> the MU IRQ is always enabled. With commit 892cb524ae8a ("mailbox: imx:
> fix wakeup failure from freeze mode"), if the MU IRQ is triggered after
> the priv->suspended flag has been set, the system suspend will be
> aborted.
>
> On i.MX7ULP platform, certain drivers that depend on rpmsg may need
> to send rpmsg request and receive an acknowledgment from the remote
> core during the late_suspend stage. Early suspend abort is not
> expected, and the i.MX7ULP already has additional hardware and
> software to make sure the system can be wakeup from freeze mode
> correctly when MU IRQ is trigger.
>
> Skip the 'suspend' flag handling logic on i.MX7ULP to avoid the
> early abort when doing suspend.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/mailbox/imx-mailbox.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 6778afc64a048c70a3afbdf44783ede0d1626937..003f9236c35e0943441b5e3cb=
01569451d7d0a96 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -122,6 +122,7 @@ struct imx_mu_dcfg {
>         u32     xRR;            /* Receive Register0 */
>         u32     xSR[IMX_MU_xSR_MAX];    /* Status Registers */
>         u32     xCR[IMX_MU_xCR_MAX];    /* Control Registers */
> +       bool    skip_suspend_flag;
>  };
>
>  #define IMX_MU_xSR_GIPn(type, x) (type & IMX_MU_V2 ? BIT(x) : BIT(28 + (=
3 - (x))))
> @@ -988,6 +989,7 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx7ulp =
=3D {
>         .xRR    =3D 0x40,
>         .xSR    =3D {0x60, 0x60, 0x60, 0x60},
>         .xCR    =3D {0x64, 0x64, 0x64, 0x64, 0x64},
> +       .skip_suspend_flag =3D true,
>  };
>
>  static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp =3D {
> @@ -1071,7 +1073,8 @@ static int __maybe_unused imx_mu_suspend_noirq(stru=
ct device *dev)
>                         priv->xcr[i] =3D imx_mu_read(priv, priv->dcfg->xC=
R[i]);
>         }
>
> -       priv->suspend =3D true;
> +       if (!priv->dcfg->skip_suspend_flag)
> +               priv->suspend =3D true;
>
>         return 0;
>  }
> @@ -1094,7 +1097,8 @@ static int __maybe_unused imx_mu_resume_noirq(struc=
t device *dev)
>                         imx_mu_write(priv, priv->xcr[i], priv->dcfg->xCR[=
i]);
>         }
>
> -       priv->suspend =3D false;
> +       if (!priv->dcfg->skip_suspend_flag)
> +               priv->suspend =3D false;
>
>         return 0;
>  }
>
> ---
> base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
> change-id: 20251216-imx7ulp_mailbox-9dd35bb9b94d
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>
Applied to mailbox/for-next.
Thanks.

