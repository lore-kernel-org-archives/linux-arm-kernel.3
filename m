Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFE1BA4qc8eH9yS+1O8NoVG9EEM4bsE8FwqMyw0rNK8=; b=xmXUMKcVgQyPxl6V6Ta4fbz95r
	Of86b7DLflJHLXGdkLPxrqg8nWffrwOkJxCjJ9LEKZnmTavnik91IWpChAAdxZ0v6HSM/iEuXUbqa
	wZDqb+MVdP7NS7KoO0UCEpKgDRpsA+HIkV+cVxFLSUe4e5IRgaTycKFGJnU98f1sAcjlyMFAQSONp
	L300G3eR5bABTxZEmedTmNvb+Cn6Sy1ocNtmEEAScL13E0vWczt8fKm7I1qhMh3D8i6J/GAP90hOB
	peCe08OBgHy1nhTWdifJAjxD8ANm6WLA3pQn8VOdG553ubhghiIrDyjkGB18tY4e6hCEB7N74xWnY
	jseowQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Pn-00000006XIt-1VfB;
	Mon, 17 Aug 2026 16:42:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Pk-00000006XIM-3XyW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:42:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so4377331a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786984939; cv=none;
        d=google.com; s=arc-20260327;
        b=llduO+Cyip9A+qZm1BEMKH80t2LSfZ7n0gTzJHodzYHmsMlQ3Je5llTH7KdPbodcot
         cELeacrbi96aMCU/dakdg3f472Aqvz8grO8jKMprZiDcH+xsMw8dRFI/CHsjoXAaF+zU
         EMzerbMED8/12LfwEPcmx9NkfPLnT+zVLot5m9Np5fvx1o1pvRLIhZV+XcgMLLAZGOFE
         zpiFduMx/OUwGMmi3hdVlj3njgJDcrV2TbIvoThDcTolWHRX7TzjWNJa08rBrxnrZPk0
         MSudyw2tn5Lx023n6nPlN/lXctbCHtl8upJDZklzh3K7iflSRE2HTwa92fTB0tVmzSSL
         Zh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sFE1BA4qc8eH9yS+1O8NoVG9EEM4bsE8FwqMyw0rNK8=;
        fh=o/WJ85lyE6XlhveOemnS5+6LLAvHPJL60Wy3+SOLJag=;
        b=YYaGw3Bp1MTUackwZbsXdtoTpDgAVUmH8qOtuzQ24PXiuTHSeQ5VHOIvxk0u/DNcEy
         5I0SGvCTvaiAQ4qbAWE+d9hRG01Iw8OPo3W0QsdQj6d9XINAot1uDZji5brBFPYOCHj9
         qmPjI26Ny2OM57vL/tiCKNv3pfnSVhAAmABuTC2T1AVy9il+US5ZIdDWOJP9MAdabhoO
         Z2/OgU0se5zEGWY1libfSCqZj9gt+6m/nGN92hZ00cJr3lnofIzVMTodKsi9xxkLhyH/
         gAiYAduTjh8e3+c8RQWIjqo3O2lH3mBw0jIi/CyGn4yfIcVBg3AFmuK0/SY0XaldqwkE
         EQvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786984939; x=1787589739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sFE1BA4qc8eH9yS+1O8NoVG9EEM4bsE8FwqMyw0rNK8=;
        b=wpKrvftYRlp1/UPPniU8lRJ3cK5h9LSYJOZyvEx1pGJwRpQINPRwAl7cFX3vj9Jt+n
         XDbITDbTp2mc3VkNeO1T/qxxoo2An9ZA43SqjApCG9X41LSq1geAhwpZXbGZNqPop8MV
         uK8r4edqAJlNwoSIwbzoqFdw08BQrCgV5cxVoT6z/4F/ccVWwjWgrSPvJzQsqPkAUG9O
         iHe7rMlL32ICrui7+6efaqkP6MzWSnw2OARr2R+ybmAccwVtlVIglZAD1+ATJjDykw2j
         8sRV/90ZciphDxhoaiB8PdLrJ/q5XVkOS6LEBv+ULq2XvTxEJoJp70n7L00jGANuqOZS
         1A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786984939; x=1787589739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFE1BA4qc8eH9yS+1O8NoVG9EEM4bsE8FwqMyw0rNK8=;
        b=BDGmuMwj/WQtYT2Z9iGpf0JprTroW6x9vbR8D9Askwo7QxSZvjtfQOOezgXaiIq4nZ
         VlDAZyV4IEP6YOk0XLjUECu/Jq5Aq+1W0CKhr+fPQI4NAUsAtovUUs5raJEhcpfR1TgV
         TILFwuyB4dvyEZZ6jGOcKwNiF0DaYyJ9Hvb1hggr/6V0IxX8CizH8AeBU+8yWuowmqG/
         LEdqV9KRegGpuoitJFUIscUuGQ4v4dj26lJnB4oci7vhsdNcz6yfGYUpun7ch/7mwDfC
         cqI/0ooJfpnl99JsB+8Krf32OPAyTD43JnetLou0eUN1C8kxuDkVqV1DyxdiCzbPakZr
         HLNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBG0whu55nKrlmHQ3wwMRBvt/u/1JlfgD+1af1WC5tX9khqJcTGQCnlw3ADwFxii8ta852vmcdFm5r30xCtnvB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gRZ4J831Po0wHs9ZqT+78o+W/KYznm+Ph2q+1pPxNmEgVgPj
	Rb9qE7j4orMnKLUkFEwWuNXIlD+uGzZUcAg7Eu5aGw6vYQZW0yS0/lvAIMSc20kGga5TzEGS8t+
	COuG6IYu/O4ZR2r8pJ4L67U3iG6tf4fc4MeQz19CwWw==
X-Gm-Gg: AR+sD139etaYTcVNhI4ubAby8btiqnfC8vW9JHcb94spvmDZujC7KPToWrwBnCbc/nL
	IC6/AcKCopfuWaln2mZhNVJyx+Gl0w1clpr3ILH+nJ5rQnWzQ28T7BFDHusNrEj6A2g8y+Kyv3O
	b/0BbIIzmI9zjBETjHR7CEIaArDbTeVDNZ5R2Yaf1mDzSoWqSB2Wih7y+EVEgOpg3iwrq1nQE0H
	UssWRu3YNc4o0zSS6yc7lDJ9cNydK1T2Sn5U0+5S2NE8AHoYq3wXh8ocq5HXBR4vpnxBErEKq+C
	/dvgrjFMnni41kfNc7Xjcdfu0inAIdGNKfYcRSwMiSpHAw+uHNY49s+df9O7CKJ7MSUpzdye8x5
	H5SA=
X-Received: by 2002:a17:906:f8d7:b0:c16:3187:997e with SMTP id
 a640c23a62f3a-c2188470cffmr67703166b.7.1786984938812; Mon, 17 Aug 2026
 09:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260813-imx_mbox_rproc-v6-1-6903a93b0456@linutronix.de>
In-Reply-To: <20260813-imx_mbox_rproc-v6-1-6903a93b0456@linutronix.de>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 17 Aug 2026 10:42:07 -0600
X-Gm-Features: AcwNN1Vjq0Onmo-OSIhb_VOVbnbnVIcFYknOXymgNiBmv90p3xsOtJFiD6hsF8A
Message-ID: <CANLsYkwc_0v-edkEd4ztbMTvkk6rWQQE1UDN5_1oraePtOvaEQ@mail.gmail.com>
Subject: Re: [PATCH REPOST REPOST v6] remoteproc: imx_rproc: Invoke the
 callback directly
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Peng Fan <peng.fan@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_094220_938509_2A678141 
X-CRM114-Status: GOOD (  40.18  )
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

I'll pick this up when RC1 comes out.

Thanks,
Mathieu

On Thu, 13 Aug 2026 at 02:22, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> The imx-mailbox driver moved the callback invocation into the threaded
> IRQ handler. This means the callback is invoked in preemptible context
> and there is no need to schedule the kworker for the
> imx_rproc_notified_idr_cb() invocation.
>
> This was tested with the rpmsg-tty driver on imx93.
>
> Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
> callback directly.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> The imx's remoteproc driver uses a kworker from its mailbox callback to
> complete the request. The reason is that the imx mailbox driver invokes
> the callback from its interrupt handler and the remoteproc callback (at
> least the rpmsg-tty) requires a preemptible context.
>
> This works but is problematic in a PREEMPT_RT environment where the
> latency of the invocation is important. By scheduling a kworker the
> high task priority from the threaded handler is lost and the kworker
> competes for CPU ressources with every SCHED_OTHER task in the system.
> This can lead to long delays on a busy system with other RT threads
> which are less important than the completion of this request.
>
> Looking over other mailbox driver, like the arm_mhu for instance, they
> use a threaded interrupt handler to invoke the callback. This avoids the
> kworker detour.
>
> The here suggested change utilises a threaded interrupt to invoke the
> callback. The primary handler mask the interrupt source so that the
> handler can run without getting interrupted by the interrupt again.
> Doing so avoids marking the interrupt IRQF_ONESHOT so that in a
> shared-interrupt environment the other interrupt can still fire while
> the first is masked.
>
> The first four patches are result of the sashiko review. Does not look
> critical.
>
> This change was tested on a im93 board with rpmsg-tty driver.
>
> v5=E2=80=A6v6: https://patch.msgid.link/20260721-imx_mbox_rproc-v5-1-6386=
a2cf8524@linutronix.de
>   - Repost. Adding Greg and akpm, hoping someone will apply it.
>
> v4=E2=80=A6v5: https://lore.kernel.org/all/20260703-imx_mbox_rproc-v4-1-6=
7b10560a861@linutronix.de/
>   - Repost
>
> v3=E2=80=A6v4: https://lore.kernel.org/r/20260617-imx_mbox_rproc-v3-0-779=
48112defc@linutronix.de
>   - The mailbox bits are part of v7.2-rc1. This is just a repost of the
>     imx_rproc driver which is left.
>
> v2=E2=80=A6v3: https://lore.kernel.org/r/20260603-imx_mbox_rproc-v2-0-a00=
59dc3b69a@linutronix.de
>   - Forward the error in imx_mu_generic_tx() to the caller (new patch
>     #1)
>   - Extend the patch description a bit for for "Start splitting the IRQ
>     handler" to briefly explain why callbacks are moved to the threaded
>     handler.
>   - Drop imx_mu_con_priv::pending. The primary handler wakes its
>     threaded handler. Once the handler is woken, the pending flag must
>     be set and there is no need to set/ clear it.
>   - Avoid the double clk_disable_unprepare() if
>     devm_mbox_controller_register() fails.
>
> v1=E2=80=A6v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8f=
fc36e11e5@linutronix.de
>   - Using correct register to enable RXDB event.
>   - Update commit description for the "threaded interrupt", "unmasks the
>     interrupt" =3D> "masks the interrupt event".
>   - Add a shutdown field so that the interrupt does not unmask the
>     interrupt if it has been already disabled because the channel is
>     about to be shutdown.  A possible race mentioned by sashiko.
>   - Use devm_pm_runtime_enable(). This should avoid a possible race
>     sashiko mentioned.
>   - Use devm_of_platform_populate().
> ---
>  drivers/remoteproc/imx_rproc.c | 33 +--------------------------------
>  1 file changed, 1 insertion(+), 32 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 7662ebd9d2f49..e18ae33a5cf85 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -24,7 +24,6 @@
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/scmi_imx_protocol.h>
> -#include <linux/workqueue.h>
>
>  #include "imx_rproc.h"
>  #include "remoteproc_internal.h"
> @@ -115,8 +114,6 @@ struct imx_rproc {
>         struct mbox_client              cl;
>         struct mbox_chan                *tx_ch;
>         struct mbox_chan                *rx_ch;
> -       struct work_struct              rproc_work;
> -       struct workqueue_struct         *workqueue;
>         void __iomem                    *rsc_table;
>         struct imx_sc_ipc               *ipc_handle;
>         struct notifier_block           rproc_nb;
> @@ -892,21 +889,11 @@ static int imx_rproc_notified_idr_cb(int id, void *=
ptr, void *data)
>         return 0;
>  }
>
> -static void imx_rproc_vq_work(struct work_struct *work)
> -{
> -       struct imx_rproc *priv =3D container_of(work, struct imx_rproc,
> -                                             rproc_work);
> -       struct rproc *rproc =3D priv->rproc;
> -
> -       idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc)=
;
> -}
> -
>  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>  {
>         struct rproc *rproc =3D dev_get_drvdata(cl->dev);
> -       struct imx_rproc *priv =3D rproc->priv;
>
> -       queue_work(priv->workqueue, &priv->rproc_work);
> +       idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc)=
;
>  }
>
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> @@ -1271,13 +1258,6 @@ static int imx_rproc_sys_off_handler(struct sys_of=
f_data *data)
>         return NOTIFY_DONE;
>  }
>
> -static void imx_rproc_destroy_workqueue(void *data)
> -{
> -       struct workqueue_struct *workqueue =3D data;
> -
> -       destroy_workqueue(workqueue);
> -}
> -
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -1305,17 +1285,6 @@ static int imx_rproc_probe(struct platform_device =
*pdev)
>                 priv->ops =3D dcfg->ops;
>
>         dev_set_drvdata(dev, rproc);
> -       priv->workqueue =3D create_workqueue(dev_name(dev));
> -       if (!priv->workqueue) {
> -               dev_err(dev, "cannot create workqueue\n");
> -               return -ENOMEM;
> -       }
> -
> -       ret =3D devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue=
, priv->workqueue);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "Failed to add devm destro=
y workqueue action\n");
> -
> -       INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>
>         ret =3D imx_rproc_xtr_mbox_init(rproc, true);
>         if (ret)
>
> ---
> base-commit: 2ee859ebf156157609f71060ae472711c8cbc326
> change-id: 20260529-imx_mbox_rproc-7d512f5a6f78
>
> Best regards,
> --
> Sebastian Andrzej Siewior <bigeasy@linutronix.de>

