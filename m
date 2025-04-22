Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C629C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=; b=HJcRqCuyb4yJJuVFdzq1Cz3LCs
	MSKHL1DeAjGJOdAgM1v+7xcZ/eRd+6CXyWkAyUmbzv4u5pG183MIRb1CIo2GsnAuJ+SiNOJOAf9Px
	RdtXebuh+Da4b+EJVSN0iFnZL1xV/BB8QaMbz/WmU2t1zK/rDUNMTH6+424KsEAT+sIBY/nUKAQ+M
	O/79z1u59CtC8/gas+TsUH3YP17yYJhrRhZIvsZ5jKOvzfm5L5+Lj0vJxO+CpvJG/tpmO5S8ODM2D
	095ug99QO7QhwoQjMUW0C2e7hhQWI+EPcvZXWemtGiFwDp6hbdhOoyReMHumCPMe8xMDpx0XY8nWm
	Nz/OnuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JYV-00000008L5Y-11LB;
	Tue, 22 Apr 2025 19:45:19 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fnn-00000007mAx-0zdQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:44:52 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e6e1cd3f1c5so3668325276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336690; x=1745941490; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=;
        b=tH0fLnrdQba/crIQfw0LDus24dELqdhbH0Ar0FnxN4UCykLN4mbyg6IWckWNmMDAL/
         xtDXHro7o0K5BvwhflhVQnPRP/FNHc/PnZpRFhXRdWoWv6GPgx5DtMR5MYseLeqsoJWy
         1Ox3vToCBxKwaPM5gfPRfZtoA+Pc6olLdysZzJb0rJdD+xbTqQsUBkXjAa27k8ERdJia
         WKjQKdi8E3uFj5wTeve9c6ki75fIMr5EDo7dbc+zuEaXT1V0vGZNnfdP8SM5/jJ9wpnA
         tX8j/TYVv1VhsKJflTUXqxBWEaL2N6NKfEEc9qEwAC70UbZ8gJ5Eak5Nz40CSTtr7box
         y5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336690; x=1745941490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EFn2W/SBOz4Ss5vMmt0N5F+gg9XTWWc4yKELcXE5FM=;
        b=gTVY8sn2pcdU/kCvlq5V8w6xkx6iNQNULYa62EFkmpxKn1IwZTiNhf0kkiuSKB6WZ8
         VLcZGZChJfNMMYi9CyDfFG9Ea3aGz6R7o2uJC+KUlQryWERiIu0F3RBS8dtZNuJ6hKOQ
         z12zpGRwJ5YCdviv/cAl8hsvyEpyCMxSm1IBVynxlkAfB/XD5tSksmQ0zRKqe3dDC6Hs
         lAmNEEfNoEMWokMQSdSeXaVlx9Dfs5eGkqZJb5wEt0XYPfIkhxumOYEt7n6clLn0okKj
         DA12eOqBSRg8j4oWeFQLYZZ5FU7o+dj/jjHnltnOLMr6NdcIuBtS3YPzOA/mKLdxOqQR
         6dpg==
X-Forwarded-Encrypted: i=1; AJvYcCWfiwkZK/o6V474n8AHcNmLlPz6ZEMHC6/TNh2+tLlTMU5VluPSTAQ7MszNIuEopDw8SvH+V7sz8PPZ0xJNiqji@lists.infradead.org
X-Gm-Message-State: AOJu0YyktIBwgKBGf2HwNhwahzrOZYQqMKMmP2kmcgOfwKIndJpLal4R
	QDdZMtxd+VAMGXSqLJbAzguWLzs++vYANJVskNwLyYmlaV4FiX2xSW21AXtZyGDHgUt6R2BaFVx
	PDNGJMk5GhzTdlRPvQl1biYpTTX30Tf/4d1uzJQ==
X-Gm-Gg: ASbGncvmVfXsj50WZtm1divo+bAXTL4Ol1YKIDK1BKWmUEebJJzIYk9HrQeebXuHlYu
	MAaAI2fZ2bvkNnRXo5bznrjp3xMMalx1lK8ed9teWUAoctoeAq6B4szZnFjWlmJrh+16YwPc+Eb
	RIFBnT4l+B6/fumwfIq2Y2zHA=
X-Google-Smtp-Source: AGHT+IEHc2hJ4Cqc2TLQJORRZ7HSilNpRQ02MgV9r96MtzM1W0JpjGC9ejSda0flvQWdusSoW6gwajxpxPi/3e7ThWA=
X-Received: by 2002:a05:690c:6c0c:b0:6fe:b88e:4d9b with SMTP id
 00721157ae682-706ccdf5d40mr253126207b3.27.1745336689950; Tue, 22 Apr 2025
 08:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250409075550.3413032-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250409075550.3413032-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:14 +0200
X-Gm-Features: ATxdqUFqgpqORv1AG7qmoEJZ9cXTo2y6ysVsgng0e-udR6FloO2w-1bXRpDq70A
Message-ID: <CAPDyKFrNUp93Ouw8MEUNMqgTuYCszT5t6jbJZdRsM2_Ed_peDA@mail.gmail.com>
Subject: Re: [PATCH 0/6] enhance the tuning process reliability for i.MX uSDHC controller
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_084451_280110_4F845AD0 
X-CRM114-Status: GOOD (  13.29  )
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

On Wed, 9 Apr 2025 at 09:54, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This patch series enhances the tuning process reliability for the i.MX
> uSDHC controller by addressing several hardware-specific requirements and
> improving alignment with the i.MX Reference Manual recommendations.
>
> Haibo Chen (4):
>   mmc: sdhci-esdhc-imx: explicitly reset tuning circuit via RSTT bit
>   mmc: sdhci-esdhc-imx: reset async FIFO before sending manual tuning
>     command
>   mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning
>   mmc: sdhci-esdhc-imx: widen auto-tuning window for manual tuning
>
> Luke Wang (2):
>   mmc: sdhci-esdhc-imx: verify tuning control status after configuration
>   mmc: sdhci-esdhc-imx: switch standard tuning to manual tuning
> ---
> This series depends on:
> [PATCH v2] mmc: host: sdhci-esdhc-imx: save tuning value for the card which keep power in suspend
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 86 +++++++++++++++++++++++++-----
>  1 file changed, 74 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>

Applied for next, thanks!

Kind regards
Uffe

