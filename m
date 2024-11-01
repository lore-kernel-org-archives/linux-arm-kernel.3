Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AA9E6B24D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyPmo8da7gVQeFsoekZ63qpPCKXE92H2RSDUtfff7nM=; b=DqhTo5Ts7+fo6JB8NKTYB+j9Aj
	3J02Vz0yMoE/Z4q7QDm+vBLUGEoSYz5YP2vSGohPB+fcovbpCvf/wovXMZ0hABAlyb+5DMxc94RfU
	FLVDEp/O8Wn+JGlQeVvnvrRl/s6wC1fLtCWJs2rMAm54jglAHdzL2lyIysVqoocdG6ubyqDzapQc8
	xxnnA7ek9hu23cXiS4+8Qra4gRQgXJt53zhBskqDdQlSXa4oBuuqkDX/LoOji49D+Nmy2wQc1KcUQ
	pUdCobdZwTBiWU7GyptGr9iQ/TYpZLeAcg5RZUsWaQHZCZPq+jjBdu/34Dlb/kICHL4dN7s869mWB
	SvNn4uDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qZW-00000006w0W-38Mq;
	Fri, 01 Nov 2024 12:16:10 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qHB-00000006pUC-2jf4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 11:57:15 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6ea11b32ab4so13419607b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462232; x=1731067032; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AyPmo8da7gVQeFsoekZ63qpPCKXE92H2RSDUtfff7nM=;
        b=gEBsGU55Uz8ZWPGVR8AzC2GEIQ6OvI2o4ojxz4TyeWBHUrOTdSGiBdX31uLADaqFz6
         MP13v8qxYOkvSOHNZnZdw4BAaO26HCayE+U2P/vkgMtOJRcLGLRiDzpIIm07BlNVRNvC
         qJI+2+s0qjpfZrFawNQNLUYXq7RkEDppJj82D9XMCa/4MV2z3Dlqvmo7CcvNkNYMtn9y
         lVenMiyBuz4M0PCPKYvvH6CdkH1jWUtn3kjyDGLcJcsdzFH3h0AwbX6kDMIsXmnvAVCR
         0q5qQznvbyG/h6G+DPMEF5G4DrrqdbSq4Htwy5ssf7DNe62sUl8L7BHDUjxvewpkAzCG
         kRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462232; x=1731067032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyPmo8da7gVQeFsoekZ63qpPCKXE92H2RSDUtfff7nM=;
        b=PiTH5H1JosW3LL414WWpcQ4BJJbDacxKg2jt38jhnzVl32h0fChmcrbnzrtt5QxfrT
         SqxE3r/U8uY0x0x2EHxc38rVzdlpxbnwZGaI0PxMGmfYn4Q0Fyv/fPeLYjZfLW7HvCZD
         OmJ29t1pjk5Xq2A/eJDk20dAJ95iWx7wkjIZggAUbzLTA3f+9pzGi3iHIrqqQeMtstfT
         YTJcS+InRFXQKaDLvY9r/omeBl+fosApasigsoky0l97OYEzRs52h2BVMEt1pltFQXCU
         og+wJTw9KpH+oJUBIofgp60QHALhFEEf0E9x1Lrp5vcD/WCaxawvCoSVAbvVOYZUsO3c
         5T/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv0K5h5GnVt5J2idW7D1uhw8htZnO9YKkCLDMwfMbvauk2QuPiTiqPQX/2Dq9BH/xbngxl57lp41HIlQ93B64p@lists.infradead.org
X-Gm-Message-State: AOJu0YymMwDwq8vZFMCeS5OsjbfKXY6jDWHLZqgz1/FvWc0Z6vMSGPIK
	pj0gOYc7Agym2jE98+UWF7PGywRDeOtVuWQ4uj3O51ewXLBZYBRfeSZIQQbdZ6aagSoKAACPs6l
	PDn9qX4tWbWoDB63vuzKoM4h/zQor/vlaJ5jY5Q==
X-Google-Smtp-Source: AGHT+IGjFViHhhsIEjWSeBRVVF02vu14Au/x1uufAjiQ0eyy+Lk2WKoLfjrFanaJSgIrSL/w8V1/5Fi83AtDrIju8t8=
X-Received: by 2002:a05:690c:d18:b0:6db:d02f:b2c4 with SMTP id
 00721157ae682-6ea64308628mr27197277b3.7.1730462231906; Fri, 01 Nov 2024
 04:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241101101252.1448466-1-peng.fan@oss.nxp.com>
In-Reply-To: <20241101101252.1448466-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Nov 2024 12:56:36 +0100
Message-ID: <CAPDyKFqmeCCkv5Yr0K9P9eToYTYsQmQUYmbbJvoOJ0O5t5tsjQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx93-blk-ctrl: correct remove path
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"open list:GENERIC PM DOMAINS" <linux-pm@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_045713_721741_161906B5 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, 1 Nov 2024 at 11:02, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The check condition should be 'i < bc->onecell_data.num_domains', not
> 'bc->onecell_data.num_domains' which will make the look never finish
> and cause kernel panic.
>
> Also disable runtime to address
> "imx93-blk-ctrl 4ac10000.system-controller: Unbalanced pm_runtime_enable!"
>
> Fixes: e9aa77d413c9 ("soc: imx: add i.MX93 media blk ctrl driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> index 904ffa55b8f4..b10348ac10f0 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -313,7 +313,9 @@ static void imx93_blk_ctrl_remove(struct platform_device *pdev)
>
>         of_genpd_del_provider(pdev->dev.of_node);
>
> -       for (i = 0; bc->onecell_data.num_domains; i++) {
> +       pm_runtime_disable(&pdev->dev);
> +
> +       for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx93_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> --
> 2.37.1
>

