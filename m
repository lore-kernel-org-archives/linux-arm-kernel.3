Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7084FD41141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUL6Odvz2BGJmEiErMIp7g1YPSC3jt6JjrwwVLc52zk=; b=r/CjCfnQPsxDL4jxjiPjHFDVHq
	5Cn27M830wo5NjSjB9ERH8BcSkGS2/6iB4NF7HgiWye6IOe+m+sL5W3PS9tDnOfZ3jFG4bs8uJWnx
	aEsLyM3iyJOtltUvW0NWFqart2G9AZLbDygJ33FVWtEFNeWA0pfRbCDxmwDon+WIGtO6yEHPBQgyk
	EQR9le6tfMN+Rwo0+Wc34Z/ayLge9am4Yjg02khnRJsPtxiGNeY9WE2hOeEF8IGvSjFTIU+sWTl9G
	kDQC2Kv+IhDgCy6eIjBIi46KcEOvgjPoKgFxYoBlmnI1wzb9iZXzsPe15A0MebrPH2NrBjgMwmxti
	GhzrrwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIwE-0000000C0rh-3YDV;
	Thu, 15 Jan 2026 08:42:43 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIwA-0000000C0qr-3eKu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:42:42 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-11f3a10dcbbso625425c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768466558; x=1769071358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUL6Odvz2BGJmEiErMIp7g1YPSC3jt6JjrwwVLc52zk=;
        b=jXGMjT74YTRchTsW02HFCsqT9UTzKrDMMWPaHPAAelCDLgx+py5Q0XlfBzm8+c5UmP
         +Ywpp1HDP9pt44iELcUYs/Qx6z7ogZ3zg8KpNLU1ukAfORIBmEHUG6JAdAnfvQEXYcAM
         p/56k00Af/jy+paDMFspRBbRoMeGLnQXIA8XY1x5l6+imGOdn4cQmKTunx6iUIlRjCQ7
         4hsJkEMTadf4WRWdrq5DJWG0dIdud3k9H3i9z4QIxOfg/fnBWBd2kd+VNNt0/F3OjY8R
         0uf83ahtI9eUtnoSRvXM8wRbm1/wytK2vfioAQ+gXPE7bf0Mz7dOm8v59ot/F9IHdnz+
         B3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466558; x=1769071358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VUL6Odvz2BGJmEiErMIp7g1YPSC3jt6JjrwwVLc52zk=;
        b=Iv4vcNgYmEO+K3xaWlggzapIC3BEUm/UpPKuDfOig/v/HuDaWD2hGhTWuyEqpA+k3s
         rdF2YO0lyZely4YmSBfRRMzqTsS+9DhpODrhmJQgP/ilixocUGm4ueCl3br7wJVevoPq
         REs58T7SelbmZuhwDc81FpOa20BSpfIPQkidiCMOaFMoM8AsgJ6geHv0wkiGQk7uoWWd
         FBpLsJgxWR44zBmKLMSvR+C/W/LVpFEU79Mk6wY6kqlGx0FxlhsZGAZ9zULWvHa3zULP
         8dNU+ID4aH2rjCmKtOhFY1oB86tOCjbo5K7q1Ru3MfxusquUQfiGY/LzC1etLvhu3SfU
         9IbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9NJ2yAlCoStSFh06vkBSbpSOq412Zph9s7JA2eOii8J/gCxbDd7119djq7qN4abmm8655rlgW0Ans6cOFBCb@lists.infradead.org
X-Gm-Message-State: AOJu0YwU9zn2Cu+SZ7iaeiOsejnpmGrKxyhsxWYTZiTMdyF7Fu2yP43l
	BJamuMCR628BicDQpoIlq4mSXcOCzrV7DHMrU0SM9Gz/Nlm7nNALHVSGSe53AG1Ftm1A0epbh8S
	oRPIQTz8jOQAd0Xwi8kzet+Qd87exUQE=
X-Gm-Gg: AY/fxX6uyMh9RuldBDu/iLj6Z4MEeMcUmzAmqpJCBiL8hyuiOgmAC9kG+4UljaxxSQD
	hUjNmNePFdI+IOT5vsWQXDAthHbjTrt6+X1UytprFKzyNWKIBWVXtPneBdKLx2DsOnAD+rmMNaV
	cI8LGqpu+HYtN1D9PmAR0WGiUCZcj1cylrCp6EfzcpNTCDZYUzBzquAjks/9jnRtvVhBf2Icld3
	1n7d6jmR0s4HtmuAuF2P4D8YPzybusXu9iDMfnxxuK6K+eTmXURbgMYUc9vPfhKN6fb9pwtn5ao
	E2bO5TkMOlymKL76bzkCjqKcZsdI9l4MMundls7rcaBvyai/l8JDrb2TfG+EjP6EFw6tkL/+y0P
	O0rcddSAXnHmX0OWZ+OC5
X-Received: by 2002:a05:701b:231a:b0:11d:f440:b757 with SMTP id
 a92af1059eb24-12336a8ac7cmr5154017c88.26.1768466557874; Thu, 15 Jan 2026
 00:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20260114-mxsdma-module-v1-0-9b2a9eaa4226@nxp.com> <20260114-mxsdma-module-v1-3-9b2a9eaa4226@nxp.com>
In-Reply-To: <20260114-mxsdma-module-v1-3-9b2a9eaa4226@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 15 Jan 2026 10:45:18 +0200
X-Gm-Features: AZwV_Qi-TQ7lJMIQ3JWU_HIrOBnLtQtdsWIBSjxYFap9Y2nvd_jWRPWPx5vtGmI
Message-ID: <CAEnQRZBe5Q2Ejbf_-+Mo8zTc=mSDgpXuXbh3NVHcwjooggD0Ow@mail.gmail.com>
Subject: Re: [PATCH 03/13] dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_004238_908019_24DFE23B 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 15, 2026 at 12:34=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Propagate the return value of of_dma_controller_register() in probe()
> instead of ignoring it.
>
> Fixes: a580b8c5429a6 ("dmaengine: mxs-dma: add dma support for i.MX23/28"=
)
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I think you can send this as an independent patch or at least put it
first in the series as it is a bugfix.

