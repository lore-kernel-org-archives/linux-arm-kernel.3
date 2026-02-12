Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20639EE3695
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=; b=M6P1ZrN6mqEtgDBDI1DQqUkTFT
	E/kgIJWJg7hjpM6oeBP+ExQtlemsPcaNLD+TJdjfpZJT59466nWcVHiwj5gHz73PIPDVED5Yj8sIb
	RskCT2u48/adr/o2vBL3CH4o94TqeYZN2n52uGhcV0s/J5ftmqHAAdcCfmH7nxpOJtMY4jIG+vgqm
	7iHoqZik0/PiLsrTLWGJ5QDKOztx0j9kLeeYXQNAXYzjI7jwBHUYAhA2rbroLX17Y/2J3WWKl7r1r
	PZjdhS9KuHB4vmjMmA2A4AmHqZlzU3WpOnw9oS8m6VSfHYhEbpki/AHAPkCLbCzWc+LMv0Gts37ly
	IE2Kyq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZBn-00000002JEf-1E01;
	Thu, 12 Feb 2026 16:05:11 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZBj-00000002JDi-00sO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:05:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-65a36c8bcabso4530688a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 08:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770912304; cv=none;
        d=google.com; s=arc-20240605;
        b=RzXE6gizhE68eokvt9S5mJpcxayjHb2DXCu4fAWeENuPEiMoWwK3ecKslaKYoAW5vo
         My/fryYe+XiQMpo1RDgYiH6GkLmgpdaiz3diwftpLcbaX1Z36OTll/TGEurnxVX+Aprl
         L9MX5BrPWPVfNxQnix8ViVKknnPjFTl0FOuzb6oeQN7HWKqlFmDCf1VKG42agTm/xfS7
         JXnH/sazHUXHKpqpZrHZzDezNBtdiav0wAEF2myM59EBE7tTiS+D9s0VXjEDeBAk6zsb
         X7x4ruM+WuiDUf2mKuKEoQEBDebPkCG88BRJ+0i8ecjJYlb7zcL5hR+GA054Iq1abtgW
         At5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        fh=q357Pt8HKhyRUN0RWRGrJ19rnFhD0KyiWgdEvVThFLk=;
        b=cf1fyW5gUOlJJJJa+qFjMSjNtAgpAMW2HkJUcdwFKEWb0i8SW87aMZAnxnMWxj2aWn
         tiEyghm/36PBPhNQHrpEstFsvnKozusoFnPsOEc2m/SnERKeg8yuZmKFlZmIAeIk+Rjr
         wciTVTsH4dCn6fySS3YS4TvQ5JGaU50Txtwi8eUlYoVhKVKtahqvcCIKA/toBKtFtF4+
         NHds1Y72qfzoykw3ewUwgRX5AM0VqajJvYeU04PjYpALVQbpgLG36S75RM59SW0DSdHY
         w9MBeew3KHSqQbTVt4HdI3IPQFqTepicZByurVOCsHMEFdhjBVCIZvOcTj9kGKr4WwWm
         wHQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770912304; x=1771517104; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        b=UHZLZknKEXh2q780Q23SHQlJ+ji+2y+kQbZ1hZ+DfX6YladK/QR/3Fo09lQiPANjHl
         za7dHrBzP/mTdcajJDKSQ+Fod8u3a+r0Ulm69c/tdCFJ5/QmSWwMwO2f1b2t+SbyJJaP
         ZMJ17FsbHyq0j1Wlx6OzurJnRu6ogCRWtwlNNt3vUPLOakHFnImiEbMq8Hbx4lbxKzBo
         F1HmF2f3xAkDYD0YMs02tbPo1DBisZDBFL2NCLDwLSY8LQbwmx0l9OpWQ/8mMP664D6l
         iwAqOtIXJckZFI0M1KjMh4ijlyA2IQrndhAbcCTHIlv8r9yZmPyyF5AeILT+1cGDpXch
         WiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770912304; x=1771517104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnpZTRXVw8s2CXHghCnwci/ZkVwlVyjaksQVMB1Lk4o=;
        b=CaEjmT0wcC57UnBkAKs4Xy6QaPW0p/u2TAOZX76QVTs7OTkUpJSUl0B7hOhXKKReMF
         5aqDRfsrCnMTFoA0d0FnEU1XlLq5gBfKGWDdcAUMVKg7KINuqHFkVgdq1p7DsqnL4/O5
         InsEdZ6la47HycTaF7Y+lJgkkTJL653BUpBnyJ1BL66TzW7WNcWPyfwA6PcrT8Bx2wb5
         6N+kAXtyFcTs7x6xIUXQBY/UTFJbwBa1qwKBtJICoxV5rURI7SQsD1seMrdg6iifKXcv
         39soHV+UL+ExeLsuSU51CJ/DS9iK0ntT4OERuggNKPkaAPnccZdEq6opXFDcVsEhyW7y
         O9aA==
X-Forwarded-Encrypted: i=1; AJvYcCVUIiqY2fMj5L5RqyGcg/mHNs8AN5pglQtK7p3vomihKUcDVmfxBvLhi/k9nEaVPNL0uVMtZwistEDceJ/Q04YU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm+86nidA+UUKahBRGNPgMoHz1lygciwKrxSkzRsLsss/yyzGG
	RYWsq3q0jqk575n4zMdHoSYi8mkLn6m3FbFvQpMkSD1ZhqmT9BED8RNxxn+XkB/ZRRusLoCTwhL
	I0ualYkgW5B0QeXt3C3Sth5tGOV/3ZdmAq7ULxcBOKrnBWPNYSN9KzQ8=
X-Gm-Gg: AZuq6aJz1j/aQLEatEwCDPu0cpzzPBhpF65NCKZ7gwNje1OX70uhsxkX9C3WJ4ynvP9
	mJEpY6sLshqs2ErZT+6DmAZh0diKCeyFT/F6UeDr+RyeB898GfNtrY9uqU+DvUgUhvwaag3mu++
	GPEaEozvdbkdtTeMT6Loyl1mscDT/dKVUwhFPe6wHZsv7rYsSTQephWbtiTDZOr5vBbc7tqRT/r
	ni892Fx/QUV4Qy6yxulHGcEAkXqIi+j0bc0DHm8blPbyQxW6AVQ/0T1b8cSfLXhCUnxLwIfz1CS
	bbtu+b9fu8d7yfJNTq7m7z9JZbzDlMJWTn7Oj3B4fDd2Nz6CtNc2
X-Received: by 2002:a05:6402:1d51:b0:65a:1d35:8f02 with SMTP id
 4fb4d7f45d1cf-65b96e23776mr1895067a12.33.1770912304279; Thu, 12 Feb 2026
 08:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20260206033034.3031781-1-tzungbi@kernel.org>
In-Reply-To: <20260206033034.3031781-1-tzungbi@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 12 Feb 2026 09:04:52 -0700
X-Gm-Features: AZwV_Qi0tM27XEyjas6LWWUftEIAHKO8h9HFZERbJMTUtDu32gd6K5hxLfiAAy8
Message-ID: <CANLsYkzgNz6qxDDKnKiZE46UJmESnxT1-mnxo1Gtme-1x5MRsg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Unprepare SCP clock during
 system suspend
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_080507_059300_6A9CC1A9 
X-CRM114-Status: GOOD (  29.72  )
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

On Thu, 5 Feb 2026 at 20:31, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> when it needs to communicate with the SCP.  The commit d935187cfb27
> moved the prepare operation to remoteproc's prepare(), keeping the clock
> prepared as long as the SCP is running.
>
> The power consumption due to the prolonged clock preparation can be
> negligible when the system is running, as SCP is designed to be a very
> power efficient processor.
>
> However, the clock remains prepared even when the system enters system
> suspend.  This prevents the underlying clock controller (and potentially
> the parent PLLs) from shutting down, which increases power consumption
> and may block the system from entering deep sleep states.
>
> Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> it was active and re-prepare it in resume() to ensure the clock is
> properly disabled during system suspend, while maintaining the "always
> prepared" semantics while the system is active.  The driver doesn't
> implement .attach() callback, hence it only checks for RPROC_RUNNING.
>
> Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>

I will pick this up when rc1 comes out.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 4651311aeb07..bb6f6a16d895 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1592,12 +1592,51 @@ static const struct of_device_id mtk_scp_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
>
> +static int __maybe_unused scp_suspend(struct device *dev)
> +{
> +       struct mtk_scp *scp = dev_get_drvdata(dev);
> +       struct rproc *rproc = scp->rproc;
> +
> +       /*
> +        * Only unprepare if the SCP is running and holding the clock.
> +        *
> +        * Note: `scp_ops` doesn't implement .attach() callback, hence
> +        * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +        * should also be checked here.
> +        */
> +       if (rproc->state == RPROC_RUNNING)
> +               clk_unprepare(scp->clk);
> +       return 0;
> +}
> +
> +static int __maybe_unused scp_resume(struct device *dev)
> +{
> +       struct mtk_scp *scp = dev_get_drvdata(dev);
> +       struct rproc *rproc = scp->rproc;
> +
> +       /*
> +        * Only prepare if the SCP was running and holding the clock.
> +        *
> +        * Note: `scp_ops` doesn't implement .attach() callback, hence
> +        * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
> +        * should also be checked here.
> +        */
> +       if (rproc->state == RPROC_RUNNING)
> +               return clk_prepare(scp->clk);
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops scp_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
> +};
> +
>  static struct platform_driver mtk_scp_driver = {
>         .probe = scp_probe,
>         .remove = scp_remove,
>         .driver = {
>                 .name = "mtk-scp",
>                 .of_match_table = mtk_scp_of_match,
> +               .pm = &scp_pm_ops,
>         },
>  };
>
> --
> 2.53.0.rc2.204.g2597b5adb4-goog
>

