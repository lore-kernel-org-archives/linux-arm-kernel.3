Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F161CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3RISinv/bCM0VNwzTFAkKuvG5MysA9cPKKTeSuSvPc=; b=0gu/1+vWUZmf23r+yC+sDIRoHs
	JPC3KZMlpE4Cw1h6OwQ6NxxY1atGmf8snsASI1NMd9Vsqtv9hPYIjxuJwSBePzV1NeQGEg6zOOzm4
	ksRsayqmgW4zjkQCupXpeVF678pqspRy+BEUA/f8tN0ySnjqzMgHafodfVZBRlt2nJ7JjtT9zsug2
	jKdfkUaN+QKre5hNoSMd9UKaTEqW85RmRiRWYSRsE+4QQxicnoftTyH+C82lSVDxwEOlrFXtTWO2l
	1sM44FH8q25FXgV+MarFiY/kjni1RDqzBD4/lH8ucsWEgUBxedyJYFNszzQIcOtdhb8pWev87W5ZP
	OhssBHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GWs-0000000Cztk-0vMs;
	Mon, 13 Oct 2025 11:15:50 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GWq-0000000CztO-1tyy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:15:49 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-74435335177so75726887b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760354147; x=1760958947; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e3RISinv/bCM0VNwzTFAkKuvG5MysA9cPKKTeSuSvPc=;
        b=EPkrFRZGRHkdw/BH2ru15ADLrVk54FNofrHkS7hMk0ZYzsc7WYakhwz3CeOsRfaI8n
         sMCDi4z+aY+xcIRAXpcRF8gz8nYE7k6vqFlj05uqnz33XSFZn4d9VDpmPwzrZs30NwaS
         5B3WTC9xTwhlOfs0BGOsqaGf/8rT5cUeIp9IfOkMn4TZxspQU7lMQgxlUn11gGJab0We
         R9z/X2GxO2VsvkjMKJGEQvt1mzEHGVP3MRURGt2GT70HWcRen4vzMV5xA/2dzFE91Zmp
         1/SG6oWfZgOgbKusqXe+h64CMuRhxOiHVYL2PelwdAcvYEXf+diP4OohwPO4Zs0eZ3bS
         +acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354147; x=1760958947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3RISinv/bCM0VNwzTFAkKuvG5MysA9cPKKTeSuSvPc=;
        b=Vf/gMHsh3jZY+fEgGH5rxzzJvSoEcZlf8rLRNH4Ylj/4DYUVR3CWauktXyJ3G9GIW6
         8fSlzaSaEEMLB0rWKdStd8l9GrlSku6qZc2ZKxx5IsoMrWcaUmDLEJH2S5DGOgi7yEKj
         LBNoyXMwgQgZ58QKfdn0Y7B6Mg8GdclszEAzH21EwNF1sgNhbzQ+y8qCGEqk4Q+tgLco
         YGqsujp/g6BRCmdENjAVnXYavFT3VpMTV1dexXETa6yV8zfQsZHy33B6PyaguKVPLCWW
         iCpiNaupT0WGFRliQYsvTsikFxDrNeEoU/b0bnwWRvblkhgefxmAO40/nJINsBBTIDTr
         EzHg==
X-Forwarded-Encrypted: i=1; AJvYcCXAyVJToV9HohwfMIxFbLm7EE4z1N04MGxm206vyDfewysNIM239r7zB/9peoDXOb6BowXOhM1m/mPkhjqSSCag@lists.infradead.org
X-Gm-Message-State: AOJu0YznA07ZHhhMvKXypgX7201CCRwVF/E0Z4rxkA7xb+6gPlK2XA+0
	yh5yBl5MmU4L0GBSQF6P80mbngUDRA2Wu1xM3ca9vNyg9TXX6+MIXDHRhNfddMD3LoNa4F8iK1T
	YgdUVoPHP6QR7nvN/t4IOMGGnzq6KfTHTSbYyoBZ7FA==
X-Gm-Gg: ASbGncucdQba9TCGGdoow4yIzpyF+r/4OYTpN/UZ4uKM2Ko82UUHJwXO57CQZM2+Ecv
	G9STayqRvSCqjErisz0vSpNOI02Cb/joJzT1jS5C0l4NHwqlVV8knChcbGz+rZvU3h0Il4Av9e7
	jTqRKwz1XIC6ZAKb5ZbTiu/x/UyE6Rn6oP8QQ795med30b/pmAhIuUJo/0lkwfGzczdxerc3kzw
	y8G+0p0GDHJqhB6koq44ZHIEZEo8JANDD6d4xL/ye2irfTdLHYE
X-Google-Smtp-Source: AGHT+IHvEZE1RemEWZANjQdcYRJnmpKPuha5Rfx9EE12zd+TvLMKMu2rY0U/r/AG1D8YeV+4gOIdtjWRgw0qDfDMQ+4=
X-Received: by 2002:a53:bc0e:0:b0:635:2bc3:cb6f with SMTP id
 956f58d0204a3-63cbe0f580amr16932597d50.15.1760354147075; Mon, 13 Oct 2025
 04:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
In-Reply-To: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Oct 2025 13:15:11 +0200
X-Gm-Features: AS18NWDCZqKnJMG4N6L-Bv935qiWkmNc8DmpQMLFdUi5NIh87a_dGMaIYkUOIBo
Message-ID: <CAPDyKFrD9wJqu59HXJEnReCk0o74Ag+p987V6z53or0DxQiu0w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_041548_520764_B0EDFA76 
X-CRM114-Status: GOOD (  27.63  )
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

On Mon, 22 Sept 2025 at 04:21, Peng Fan <peng.fan@nxp.com> wrote:
>
> To i.MX95, USB2 and USB3 are in HSIOMIX domain, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. So when in system-suspend state, USB2/USB3 could wakeup
> the system even the USB2/USB3 HSIOMIX power domain is turned off. This
> means USB2/USB3 has out-of-band wakeup capability to wakeup system from
> suspended state.
>
> Without this patchset, if USB2/USB3 are configured with wakeup enabled,
> the HSIOMIX power domain will not be turned off. This leads to more
> power consumed in system suspend state.
>
> This patchset introduces device_set_out_band_wakeup and
> device_out_band_wakeup two APIs to set out-of-band and query the flag.
> In genpd_finish_suspend, there is a check, if out-of-band is set,
> it will continue to turn off the power domain. In genpd resume flow,
> there is a similar check to turn on the power domain.
>
> Patch 1,2 introduces device_set_out_band_wakeup and
> device_out_band_wakeup
> Patch 3 and 4 are drivers changes to use device_out_band_wakeup
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> This is pick up of [1]
> This V2 patchset
> - includes usb driver changes to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Changes in v4:
> - Split device_set_out_band_wakeup API and pmdomain changes into patch 1
>   and 2 and clear the flag in device_prepare (from Ulf)
> - Add R-b in patch 2
> - Move the call of device_set_out_band_wakeup to system suspend
>   callback in patch 3 and 4. (from Ulf)
> - For patch 3,4, I still keep the Tags, since compared with V3, it is quite
>   small changes.
> - Link to v3: https://lore.kernel.org/r/20250902-pm-v3-0-ffadbb454cdc@nxp.com
>
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       PM: wakeup: Add out-of-band system wakeup support for devices
>       PM: domains: Allow power-off for out-of-band wakeup-capable devices
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/base/power/main.c          |  1 +
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c | 11 ++++++++++-
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  9 +++++++--
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  8 files changed, 44 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
> change-id: 20250919-pm-v4-1879568de500
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

I have now queued this series (including the acked usb patches) via my
pmdomain tree for next. Please let me know if it's preferred to route
the usb patches via another tree, so I can share an immutable branch
instead.

Kind regards
Uffe

