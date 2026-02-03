Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57886E8305F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=; b=sLJB7+TtdkWj1TXkZOBjtLFIyb
	M/XYWtNQx5knoG5d1K55Gp0I/p4pexY8M+bLHbsmmDAki97jK6mpCXw9B/gZPxoqniYaTdiH8Hk1i
	bO798zfqPHsRQZTfsyl8l+esjdkxjhHgWn05kxxutAuN6gXyns7vA25ac7zV4SkAuX/0hPzXEKl5y
	ZkVpadz4Dm5A9iCL1mQJTeuzdn/xNesRO8Kb1gMOMpyXfUDRG0flkr4cNbuwPHH4f1hsJ4pOnJYG+
	dm3IWHWs2x5LbetwEDgQ9oaAvldUDDOvWz8+nbWh+uCNiRvbebyjCR7zp7ihPnNixeQHDpR4Oet3s
	CMe4OipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBqr-00000006Jkd-3tKh;
	Tue, 03 Feb 2026 08:33:37 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBqp-00000006Jk8-2lWD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:33:36 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1249b9f5703so7099260c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770107615; cv=none;
        d=google.com; s=arc-20240605;
        b=jf06rkgg6gMZV+C4g3JRTwDUHVfSe0hYF6jd3wG+yTSBWN5eQ5e8l47acoVaDDJh5k
         pw1tYnrsU+vqzLKvLTc9twR58S9gluREWVBmboPKzS0H2DgdhWbZ7F32ShxygZH+ulA4
         lKHNZcSRVYnAKPWIW+jFVa1Bj/IJRloB0Ab9NViznJuCfX2W0OPSiAWTv99LW6goDRHV
         OwICdRQchheXH0BSg6dekqEdtP+uZHXdyCTBLaDRgTYmLm+H1JrLgJSJlmau/xae0W/2
         fNdIDLF7crjL61wqr+KIHw6I2afSVt370BwnejaGMIkBwiP+u/gv+yEz/F449Nhg1Y1a
         Zspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        fh=++H+egQ0HahfWPloRGif7/w+oJfHBOAR+VAuIdtXmFs=;
        b=jl+iOo1SPbJ0DFBVvCAJPxiQk/ihIGAvQdSksShMrzjsoKn7WhJdDZH01EF4P4tz5C
         +d3vtObseu3wfpejdJwAmuPrMmqfoh4pVnymcri/v0PGTt2M8Yt4MiM3rxlpaAHxmHvF
         dNYul6KesSr8TxRp5fBhCvo4e7cZZkKLi6EweiPU5uFhxpT1mieGLkdyvPong3/QhUu9
         FUYDOYshwe7pa6Tr7LaUw1GtXg8alZ4gdlyVsAESBJoBCo47bhboYKHuPODusZxyb20L
         UduGyerMIhsY4ReXvW++SU57Qpk+6LmGkPufEfv7vGpVyTm+kvWlPOshEU7BbtcXrrcg
         9h9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107615; x=1770712415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        b=M3kUGV7ZxNJq1ewJQgIvecS2cGK4imzKkKIP3jSw0toJqRiZfqqXExATPBYyPUKbFU
         RT903USy6tok4CdAPXmbYSkH8to6zW0uCbFf9Ve/aJSPYnc6BxABJDYIscyp9eMALaNE
         UWJdzbqMG0ibHWfetSpAzLrF7ILvqHWIZBspZ/MVjn+1yh9ZvCvlU+lNmptvMpzKQHWh
         81xHReeCrpxob0KKrU18UHjXLfMMxDknZb5empfgr1RjGVlR3epmvTLpiPcz8+MR8V3J
         FYPW+H40E7xkhZyZcn9aLxx1PW3qCBgjFEZkhvX1yy8MQFZL1ipRyur+0rQYBn/lOJQ7
         EhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107615; x=1770712415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        b=upPUqJsTfhp+RVZdWp9zldUmOeawGU2tmez9AMaNcz43A8IWqV2vBN2tQVcJTZRudz
         szGEyOlUTxwSnGFLU0Gz0lAe21X06blnx4q9Y4xGi+tC264puWOOhJwmB/JmFONSrGAr
         Hqm6TOVmmW0tDOHgQE6ROnkK+a8P7jcszhElMsU3ynuIKATRDxCS/Lxzic2a2pKHjelT
         K9OSBLZGLSsxApuzynLfjnLdUYNxPCT8MOUB9Y70vLhmCR/Uz2eZKzNQfGqH3g6pbgcL
         FdCAax0MojhrMndjTvmjyYTImxcNHqOzWub3deX21qrsu6PzVdZbgyfGCl0dQtIIaI0H
         gwig==
X-Forwarded-Encrypted: i=1; AJvYcCXgOInNxgtaUGX6niXDQKfuSo9nss+xy0D0M52rUE6mRaThX5WA0jyCCdamXDWbqGGXv3yDxqQh7pnC3mLtai7Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyioI0Z+U0ckGimdi9ZNMTFqF7Gstjvcu0nFY/dcVDfKTCkXZ5I
	5iCa/+KtibCOVGmMRDHZzsFJLXY4rTIarLuQ9PUQi8E6PWub0/Ny/ffO8xHYKOk/qbv2gSuQxgU
	fbXR3uF67HGdLlPB7diXN2w6uYN7mZDs=
X-Gm-Gg: AZuq6aI7r3vYdlTU2JhqfQsGBRyvnY8My2e5sN/JaxccHHECVfSXATKmuIJEVD3ZOj1
	yiPA17wfCXJyXNfXl1bB1LQZ86Mzh6yx0U/NnuDs9/K8pbr6SRICH/3xi1tgDjdOQTTIcdQLV78
	Uo6LVihgp5I0d31K+CjXtW+/x7adAz9SZ41ZRa29bsLE9Xf5WAas3eogIxG01D1wPQrXiTmtelP
	lDhw0M8ZC6fCoQuA8V0LZ25kr/URwJ2uq6HDilVB/yVuOwqPOvWYd7qudbDSkfi4st4z+B9XbB5
	KxYdr3lfL5VnhP04RN/BKnxJWR5yuq1XIX2Jrb/qeYJYNtSwVSoLAD/0cmwJmudfJo4CQpItqs7
	vsAr3hPSezQ==
X-Received: by 2002:a05:7022:403:b0:119:fac9:ce12 with SMTP id
 a92af1059eb24-125c0f9d262mr7374498c88.13.1770107614645; Tue, 03 Feb 2026
 00:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com> <20260203031345.3850533-4-shengjiu.wang@nxp.com>
In-Reply-To: <20260203031345.3850533-4-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 10:36:16 +0200
X-Gm-Features: AZwV_QiN7aElCqGBVfp3lxdbVrrkTZK84USf8JhpYodb0geCaRz0C4JnQWtK0dQ
Message-ID: <CAEnQRZBkKG61b8ytdGKsRqRsfHZ33Q3y+fK0Pkx1hUnw8bWkUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_003335_697403_1856C5B2 
X-CRM114-Status: GOOD (  11.05  )
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

On Tue, Feb 3, 2026 at 5:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> Add a compatible string, clock mapping table and enable the option
> 'start_before_dma' to support ASRC on the i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

