Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=; b=0bLJXkAel1ugnfgj45ehsmwIdp
	ETN0uAzJ5RN6iPp1HczbPM/rPMSpaujX2W3yZ5Klt1oT2exvdCeuU70TWMsixE0J+19PoZj7z8Jc2
	LpMp4irZJuBKCiezj/LGNd9wMcrDi4POktW3vEzAhDqJhvKoAZHm1PDJwQatDxsuHLUifqouDnHVQ
	ZeLKv+sYhsWLLVXxXtl9huQh5OsEdscQNrHk650f5pH1i5Lvmd7/b9oBgTndw39k3sK7qj/LdGZRh
	SD4u8I+96JfwfWeSL+OKmJhYXzLdmbcV3U+w3Hp9VL9TAEB7yUdP8AKrsDy86nyruEfO3atdPtHu3
	EcIs5z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhhH-00000003rBf-0lgu;
	Wed, 05 Feb 2025 15:52:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhfs-00000003quJ-3Ox0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:50:49 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso878642e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 07:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738770646; x=1739375446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=;
        b=Vk4e2CsQxPFJnJUw3H8hHr/LweuYWyLrW/m/MQM+YoyphQKFjw8njYSh5y5CpezBu/
         25zu3ANaueR/jeSwXLGLWNgYRA9R3F4w/GDWa9LlCRt0wKxQUSHDSEmTFGtemv5teh3E
         pHoItkGA5ujp9N4pOWb+oHQRHceyZDPizaYqPMn0VsgPmkgkno5IDsvtTCj/ZEGVWxWP
         eVIq+2lrDb2RzZEUswvNUnLDUOYmVJ8GHtu+bMqtGfjfISL3lRbO53aEJVca2ka1Y/1z
         7CUVFHpLr+IS9nW5xyOmf8Ll9AO9OGjcE/qX+gfnr6/oGFrhZ4DQ8LCvsH/9dp14Cb9c
         VpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770646; x=1739375446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=;
        b=YpUC3U7uEDMz5aWm+Yt2HsmM87SoCHxy4SNND8L5RgrURyJbsNnuF968cyD68fuJtA
         3GP1H9/eDbFKMwP+VNR2u9nUkaiawgv/v9xrHcRS1vWdgdFl4lTl2djf6FbcgnVSryzk
         9qwuwGmeOzDooerdWGGaAt9PrWgpq5q/dl0GZdz2cuzSTJCzG3qoXT6455nsSUxHH2QL
         BpxCmLFIWOgADlnOUQE2CmLpjR9Tro7Q6Y9pl0Xys+0wshWUHwF3LNDe8IDtzC5ILB/z
         bjQ9NjMnrjRKL/A2Zz9WkeSU5/SCaqJDmZ5DxWs0U+its4rmtoUbGjymBWbOMpbS6yJt
         9HKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4agGHazn3YAGLyL6HwE8m7GVdN+QYylNzGvBwVIsMruYqPiAR5jS5/Q7OwUbAMogHF1J414eF/EljaXJMAAxo@lists.infradead.org
X-Gm-Message-State: AOJu0YxAMM0eX432FGv37px2oXHB+lD0hLeTZZ7Qzs7ikPZAgHwZ/boL
	5IyHTbA5t+BtPhStUrkX2E+6p5sCgRHiriBRWrnUvykDismA0sopHEDyHwbOXVHx8v8ZEWuwDNW
	AKW7FVz4hsR478k6nHKSC+zamgsY=
X-Gm-Gg: ASbGncutz9pmxTXd5JJ7Z3p4B0rglSPnOuWwVwwE6E04fuWlTA/tZj/fPfDUUWmaoOW
	NKGS7XPWqignySyjqKwQorUf/WtXfVAEiXHZoldBeb0ysQRRyFQ/98JZqhPLutn0Bms5ZUfRF+L
	0ai9cjp8PmHHHZz5KEWu29R4Ss+n4=
X-Google-Smtp-Source: AGHT+IFDxYIl5oogc4aOzvhvY0HAoYIntif84wA755oePAmAkgyhvnAbag537ru1gnMM2wW5pU4RYFXtdOqt55rYnMU=
X-Received: by 2002:a05:6512:3c8f:b0:543:bb69:c635 with SMTP id
 2adb3069b0e04-54405836109mr1109351e87.15.1738770645990; Wed, 05 Feb 2025
 07:50:45 -0800 (PST)
MIME-Version: 1.0
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
In-Reply-To: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Feb 2025 12:50:34 -0300
X-Gm-Features: AWEUYZlFLXiepv_yE9yXJ9KlWCIpZy_t6h9dHVFhvb1GQAbeKkvQGMigDUgxkZw
Message-ID: <CAOMZO5Ar_-_H+Kwv_=ScoABqLzfEHX=3=JxrpPfiD2QmDt4=QQ@mail.gmail.com>
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Brown <broonie@kernel.org>, soc@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_075048_846652_3FC1BF10 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, Feb 5, 2025 at 11:52=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
>
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

