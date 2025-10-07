Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982C2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdDPwXrUCndSUHvhfKd8OTKngDnEJjImy29CDVr9yNY=; b=DwqfEQ84pP14Y9ntZe1HLYpA7F
	jKdYIvG/mCpg0s0KtbfS7J38D1HJZh/80PRCG8n6+r1pbu35BwFmchIpppr16i2SAnzBXAaVNmZCU
	eh1pUY4iRzfJqRVcKc3UGPiycQa31VJWrVRumd1/4/br1C51ZqgA/fDRBHIYyWZbn2JR3lc5N9N4r
	mcMOiKiNvgFyCJeQ+5f4lbcKLWQQ8rW27jZQBWtarK9hgLq8M+UjfjEfIsNqycrzTMTRM4BuIkxaG
	JzwXmrWmGxYli/vzOQ16soL+AqTeG7ttEXeOetCAptXq5Fy9yShXX3BhRokPXPYTyBTuaoKYD0nKY
	l/i43J5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6HM8-00000002xpp-47xU;
	Tue, 07 Oct 2025 23:44:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6HM6-00000002xop-1IYg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 23:44:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso7481999e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759880667; x=1760485467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdDPwXrUCndSUHvhfKd8OTKngDnEJjImy29CDVr9yNY=;
        b=JzGzK51HyGIefp3XZvOdEzW2Bn7hxM/WcAA5KGzzrJ0QY9OnCg04VCDgwyO5XeFrT4
         KT6EWX4v3W2/FcZBBs0evXwBb+ZXLPXQ2C7GdzzMOqsPf2ypz4Ueu0M28Ftw03CQXWkX
         P59FrDrjIiEd0pSNDxApZqEpU1XpEp+4M9r8tYHYkvkMtpwPSuBQ/+0GgHwplMv86nDB
         N+F5hjDWO4Cyib38l5OlHALGsnhf9XqstM8psPiH7vQNr0x2AThq14UpZdMJP32kApD1
         x8LKK/fsHZ0AKvScWTj4Pnh1b5jahVDNz6Ea5JlI/LLkpM+gWNexeppZe+bidIR4g65b
         fdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759880667; x=1760485467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdDPwXrUCndSUHvhfKd8OTKngDnEJjImy29CDVr9yNY=;
        b=gusa6W+jQBFfqdTPat7wAwLq8EBtQrGUv8vKZKBImeEM/lxYZxalutb/Y8WGKpiQse
         NpblQEZVaXgpIpcCNLTmOjYaBuOQ4pRd4IzQhj90MeB64r6loR3CbWvbxOIWKriDvYAb
         AP9ObNwhzC/b6D39l2lZpIbdlLFx8Fcb1kgMuxcY7/TYnR9K0BqpYuqhxt3jObFfn6Br
         StSFd8/ntJre91k1NH5NqsiJqdsPyj5sn7Z3hXrf6uxdUz95SY2bqAc2/+PoiGh1IRGr
         Ttp36p63h+YZhokQ6Dt5g2/Z8N8+iQKN0toVhEUw+CWe8y39qt7gFYk07OAX0gC2UzPa
         i37A==
X-Forwarded-Encrypted: i=1; AJvYcCVP2aRvyuGflM+sMKPRoNL7tNmGc4GqCtz5dARiR5Ex/MgAzI1b6H7kHGjbGhMZH+75bEnrchxC/Eypi0fBvj14@lists.infradead.org
X-Gm-Message-State: AOJu0YxRRgLigevGJJ7SJ8ImQ05bXgHFLP4pJATQ+h5XLAghZGGtVjDt
	92/Latte6goguGBSFlE+++6ARl9H08bjc1s9AV2G7mjLLIHSXnCffFqCmrAhVLA0y9jEqmt37E+
	XXD62tY3l3cfyrpGbsDsfP88OgQ/MhKIigulXTio4
X-Gm-Gg: ASbGncugqiGcMyTAlept9sGiLGfhbJgdK+Olzrdwnw7IPfyzk5yMCl/lFxU3scSw+Lj
	bnbqiP56h6PNxewavcH1X1FY3VSrJecgM/0Fdgw9h77QmD/zeHiG5Du9h9oqY6uQTKf51LEVg3I
	yyKjvbsJwsVSG+duPbF+G0OI5VyEwA735ZCyGr+KP3v/GLHCXnJvIocakEnV9sQDd4C3zNYeVLh
	4BOugLPCKMTABnkhQSqObFAFhM6i7NvpHTCdH5n07WkNxkxygjXI8Mx40ctsAN+dbY=
X-Google-Smtp-Source: AGHT+IFdQL3eR/SOY67StQecANO2VnRWAmFtiPakOZFHiUlJOwj6Imv4TzH8+nP6L5X2EcxtVc6+58+BQM9eZ3HYWqg=
X-Received: by 2002:a05:6512:4026:b0:57e:c1e6:ba2 with SMTP id
 2adb3069b0e04-5906d77df4dmr344264e87.1.1759880667021; Tue, 07 Oct 2025
 16:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251007094312.590819-1-ulf.hansson@linaro.org>
In-Reply-To: <20251007094312.590819-1-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 7 Oct 2025 16:43:48 -0700
X-Gm-Features: AS18NWCXcm6CMIZDapU-gXtRMN_nrbL2_9een9pVr80YceX_ze5s2D5g_553M3c
Message-ID: <CAGETcx_=_wAdozOvF6KcNiJj4NeGzBy6sXYQsJMLZLFb819Lrw@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: fw_devlink: Don't warn about sync_state() pending
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-pm@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_164430_365242_991CC1FB 
X-CRM114-Status: GOOD (  25.65  )
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

On Tue, Oct 7, 2025 at 2:43=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> Due to the wider deployment of the ->sync_state() support, for PM domains
> for example, we are receiving reports about the sync_state() pending
> message that is being logged in fw_devlink_dev_sync_state(). In particula=
r
> as it's printed at the warning level, which is questionable.
>
> Even if it certainly is useful to know that the ->sync_state() condition
> could not be met, there may be nothing wrong with it. For example, a driv=
er
> may be built as module and are still waiting to be initialized/probed. Fo=
r
> this reason let's move to the info level for now.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Sebin Francis <sebin.francis@ti.com>
> Reported-by: Diederik de Haas <didi.debian@cknow.org>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>
> Changes in v2:
>         - Due to discussions on v1 and because the default Kconfig is to =
use the
>         FW_DEVLINK_SYNC_STATE_STRICT, I suggest that for now it may be be=
st to
>         keep the warning level for the "Timed out.." print and only chang=
e the
>         "sync_state pending..." message.

Acked-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> ---
>  drivers/base/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index d22d6b23e758..c62e428b95b0 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1784,7 +1784,7 @@ static int fw_devlink_dev_sync_state(struct device =
*dev, void *data)
>                 return 0;
>
>         if (fw_devlink_sync_state =3D=3D FW_DEVLINK_SYNC_STATE_STRICT) {
> -               dev_warn(sup, "sync_state() pending due to %s\n",
> +               dev_info(sup, "sync_state() pending due to %s\n",
>                          dev_name(link->consumer));
>                 return 0;
>         }
> --
> 2.43.0
>

