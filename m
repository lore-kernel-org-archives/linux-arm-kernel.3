Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC80C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXx2FL46B7WkOgjg7fh0W46JD/pfi8vbcwWhjWRwOFo=; b=OqaRQMEbFvbSORGOwsBb1wYKkD
	GDY6riCxgOKPHHPypST9a2CPA73vhlaZdLycGc4PtXBq7qLD8AqFuab+8jCyCae0FiDDoSG13HkTS
	8Czk0PI32BfIfr2dDhxVyzGf72rgJ89Xji9p7sMKd0uFn9QgfX0zx7AB/MsyPRBBaq5FbbZp6IFGL
	dF7Jv6LxkLohukpKu88pViNK1AW7bP249wXVVU2LPaRwDoipj1acWlkCWZp3mgDxPBL9QmVocs2qk
	Nhdzp8Q+mnjgboDhCbEm54q5yzYkp157O+3BiWfcVyTwVS/hDR5dHfuGDa/So4h6iL2W3NeqjlLT0
	dITHXoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EJG-0000000DtJW-0b4l;
	Fri, 11 Apr 2025 13:20:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dq3-0000000Do4G-0qd4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:50:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1493788b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744375830; x=1744980630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mXx2FL46B7WkOgjg7fh0W46JD/pfi8vbcwWhjWRwOFo=;
        b=Aj9uCMNZc/m8EUiYfqOGueMNKw73/bZeOwB9mIUC9DBmaHjIPGB0rpPFQq0KVLh4B4
         BWvvGUgIHWADF7FV693dK1TtQ4ifSuaP4/Gjj9UFfXrlsMRfIC4181Uv2ELIJPmBYbZp
         HKCMQEWGf28mRQlD6kUvgJEeQipmlrE689pps+IEyNpkFtbQnC7KXKyMU0AQBxWpa0Kg
         xjHzNHab24XwDGubbMdD6EaVuDHs9TYz8ZcqnbeLGjqIGS9RRm6WXvjVbiQ8OAfBQK2D
         gu/9ZSPa6jXt0KjR1kLyaXzLv/MlX/OXbeo14KRQidnAvf+vo8ULQWNWDCAAMy41V3N5
         X4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375830; x=1744980630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXx2FL46B7WkOgjg7fh0W46JD/pfi8vbcwWhjWRwOFo=;
        b=naCMkXeVnNY2/RJcRbrWaLu6Q8OwwfK8aABWry2kwWp7Ee0wdtXzAVQKmmRnLoP1bX
         bJS5tiov8ZH1SppyU4hqTjdPuMwO+FS/9nSrni+E8MqxX2g3SOYrJSkhJEAVnNyxaMi2
         91Q2CfmYuIIJgFTb/oldzfHlmrDfWVccehzmJMxNefO6II3L3h5cPZC8ciQy8FbKLsqn
         77opBmxlX2EYBDuB72adQJ+RHTYvov/0Ew7h+ld62cG8Ts4DXPNpCmSqxZC/VdtlgA86
         GE+Jaa0i1+GbkXQH9aqjOZ54d12ShI9/ITuE4ilzuhE0u5cja1G8H1bwVOm6016Yvdcx
         Hzlw==
X-Forwarded-Encrypted: i=1; AJvYcCVmWEuanHBThAW1OxokCYmiWb9uHLd1VbgggzZXd6xR9aK8mRffXZKa5S3z84oiX76KHYiSRekNvEs1O+mHai+E@lists.infradead.org
X-Gm-Message-State: AOJu0YyiuuG9CQmIGmh5KqHWMEF22pv8ADChjrwHH6YkfTkbGE/6FgxU
	8oz6rtfQEgoalItzdgIdHDwfyO6y3m7dgerP76dNLZLZxLAAyaDL
X-Gm-Gg: ASbGncvYGVW6GDAZEpzSe9gfsg6cyIumpoAhCXferEQYHvLZC0bZPKifZg6dTNGd33Z
	nvnIz6ogKLkyMXDX6XMY1rxvExBNACmXO3ucIsjyVEIoy/rBew2LpyZaMqLeqCQQdlUMlU354tJ
	o/4cRYrmfB79N5XvOVgj8L0wSLJoTMFBOdpBOkgt2W+Ft3GUkFY5LILIJnRPiFjK0vXlnnC0VqZ
	T/zx/vBfhapTUmc+GYIHRfwq73qZOJiCwA1NS8tG0vgtlL2hvuHV2Ak5HUPw59sv95QySvxGY4k
	SdSYUnJzcgeoXN8PBsPiluCKszmweUPBNcAmFDY=
X-Google-Smtp-Source: AGHT+IHDBvV0qQ07NHfk55qvtex+sgwOy6tRhqXVO4CM20TuwI5QvWlbhrJx+JWvNB7ZbVYZ7Pqf4Q==
X-Received: by 2002:a05:6a00:4644:b0:736:5753:12fd with SMTP id d2e1a72fcca58-73bd1194273mr3931962b3a.4.1744375830033;
        Fri, 11 Apr 2025 05:50:30 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c3:a964:9277:4e8:b712:66e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd71sm1374107b3a.128.2025.04.11.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:50:29 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:50:24 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when
 Cortex-M4 is running and it was started by U-Boot bootaux
Message-ID: <20250411125024.i2pib4hyeq4g6ffw@hiago-nb>
References: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_055031_242933_D5CF4312 
X-CRM114-Status: GOOD (  23.24  )
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

On Fri, Apr 04, 2025 at 11:17:13AM -0300, Hiago De Franco wrote:
> #regzbot introduced: 4f6c983261
> 
> Hi Peng and all,
> 
> Commit 4f6c9832613b ("genpd: imx: scu-pd: initialize is_off according to
> HW state") introduced a regression where the Kernel reboots unexpectedly
> (without any warnings, crashes or errors) when the Cortex-M4 was loaded
> and running by U-Boot, using the bootaux command:
> 
> # load mmc 0:2 ${loadaddr} /home/root/hello_world.bin
> # bootaux ${loadaddr} 0
> # boot
> 
> This is a simple hello world binary that prints a message into the
> M40.UART0 pin (demo from NXP MCUXpresso).
> 
> Before this commit, everything worked as expected, Linux boots fine and
> the HMP core keeps running and printing messages to the UART. After the
> commit, the kernel reboots at the beggining of the boot process. The
> only relevant message is printed by U-Boot after reset:
> 
> "Reset cause: SCFW fault reset"
> 
> This commit was bisectabled, the same device tree, u-boot version, and
> SCFW versions were used. Reverting this commit fixes the issues.
> 
> For testing purposes, I created the following patch which also fixes the
> issue:
> 
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
> index 38f3cdd21042..0477b3fb4991 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -539,6 +539,9 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
>                 return NULL;
>         }
> 
> +       if (strstr("cm40", sc_pd->name) != NULL)
> +               is_off = true;
> +
>         ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
>         if (ret) {
>                 dev_warn(dev, "failed to init pd %s rsrc id %d",
> 
> 
> Test Environment:
> - Hardware: Colibri iMX8DX 1GB with Colbiri Evaluation Board.
> - U-Boot Version: 2024.04
> - U-Boot Build info:
> 	SCFW 83624b99, SECO-FW c9de51c0, IMX-MKIMAGE 4622115c, ATF 7c64d4e
> 
> The issue is not present on: v6.5
> 
> The real root cause is still unclear to me. Anybody has any ideas? I am
> happy to share more details if needed.

Hello everyone, as this introduced a regression, should I send a revert
for 4f6c983261? Or any ideas that might help fix this issue?

> 
> Cheers,
> Hiago.

Cheers,
Hiago.

