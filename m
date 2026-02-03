Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F31E6E809
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=; b=E45Sog0jEtap1CmKokKY5OJII/
	G3wFjtPyb3c5JsiWyxxHAI3QbuncbrVLkyFCIa+36y67BzPUZN7WepnOhX7k/kwBHg9gsqaWTfyI0
	arEGL69c2TlraSAboaDMR1Y/TOiprgov5MODhkoMPiCWAIKQdcmOU0m6a6nrOT3Dw6hT6VNCBHXuD
	e+vV7XBdXUGA74GG+WhKIaBsTuiZXzkxHejfw1vm0f/tbWqmbc8jRHenoq3nn021mwZjePxl1c0R+
	WC3ladyOWMimflSaEDiJ9faZU3ZzBTauqXfz1mX2ZrP/L/JDVRtLZOQ+6ARJAGNcBLMz+tVMi+03I
	f/18fcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEFS-00000006Vxo-06cX;
	Tue, 03 Feb 2026 11:07:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEFO-00000006Vwf-3Erj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:07:08 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso8278528e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 03:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770116825; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoCBr5CZZhHmdtfSac3D1GWs3symWg/wL45I8B4YqnxsigsGR2r4ANRMd3n1sSp8wG
         J0lUqYojzC/BTh/+Adg3VGYKn+hmjuc8rGIZiys7O/J3cJ6ZZ/uMwUbg3U+PRJTmi3Ee
         WVWNPP/+vEBQ9Hl1LhWrZ1EWJEiYxoVJ94GN0xfIGOed1MbJUaWvvgApMVut2avKVClZ
         9tw9XDLHJe874dpXGk6gDUWXnB6qMvy/Djh9v4uiwvXLJg0vbTP3LYhy2GxwY7Va+xvW
         MI8ySZWfu6zC6LgpjaXNiC1vCmMSP83K/8C8GU4IFQ1mvNKMaKapenskE+TwOlUl6Lm6
         OcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=;
        fh=gjsZ/3GagvKq+rtBgfycw0N2y3x+fuB5UPq8YWuAHHc=;
        b=XSwYZ3A/ss1iPoPuuHhkvOoEgZVC5kO+kg1fyR8gw9qbrfF/D5cxMCgkhnEij/looc
         OkgUkMkimGB95f07z48ICuppbKQXS8sWoATC+j2CeLY2WKU1XY7TVcokvQXi4SIMakkg
         fgggb5D0Vb1ENrK5t6RBMGFSiLoLRSOQ8Zfw81uSRXHyk73kvrOZfbwMpp1iQnDwy+AR
         AFUwsJ/eFL43+nq/cdK2ke9jdKFBBTHnO6iUk8ZIlb46pq0gM1XwCiW6Nmh7W++6lqM8
         JviX76o0WX1TZ1AjAWy77PVBv6XUnH+rloJEjHF9uZe66KjLqAr6SoJhQAl6Y6UpQlf+
         avLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770116825; x=1770721625; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=;
        b=GBVRI4D+cyiv6agsMzHYfyqmSF0VRNG1ZPKS8PNyF2VztZSA7j992lDj0Yfnylmzfe
         3QHg7xga86Y4Nemm4Mq4qTPedVrd7lp3msyV+faRf93xPxc7vTn5Vj0L/b/mzV7tNd4m
         49QzD8EWBN1ksJ6hvPBuBjLt6ORcf2ZoQn2ntH4/LnVstGwfy3sCr+7wKJwHiodlYHEi
         WkarHmThBnA9mMg1g2OtFULXd/I4nopA5r8q/tl2rU/x/b4JXj+u+ad1LGFvtgYCserx
         0c33ug42kjLupk3w/UAlveIzGxul6IdCa+e/71K4C/R5GNMUEha/rqdrjm6DDtsRyajM
         Vpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116825; x=1770721625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=;
        b=ml+rCT/DIOgLbwADJtBiSr3sDATLLgqUIaStWg4swZFDJEuEOqYBy8HWGMX8QFMRiA
         L2io/RtmvXeM1tyS2kW81oWzfdPo9EFFonm0UKWdbkmGSF0mVzBBhPyWYyUVDuHgTrmG
         O9s2AH/1dN/tLSM/gTPWdhubWx65U09VmdutCPk2UvSP4IY0uZyzanXOzsEFnLOMLkH+
         PLqbYUjeSxwmEvMKgzx9+v7SnAio6tdabQBXP/t8ghkN9nXn6VYedJQ9qMYankouR4LB
         baAjLhh608vwlhGbWWfmRIsRZ1CmrEY9xB0RaxbFnMKlG4vPZq5Qz3xj8llPJUlgwexY
         dF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoB21cBGnZZgg2EgiJEVbjh+W2Ip2m0RtOfbzP8hAicsrds67g9d2gyeRauXBFZeRS52WP8OExxEOySqlTttiu@lists.infradead.org
X-Gm-Message-State: AOJu0YyPlTcCmWjlHBPetXSN3ZC43eMjqz2sdydQK+jdr0p86E0ooy0/
	iN8sEA/AiKkDEwjQb8/c3MGQAFyeGPb+sOMAFpSlI8i0/gtqW1wIvsP+hZ88IoGCU7y3BURQeRR
	kgDws2itDrKO6fKfuqahAdzUoGvr3wHMRTGeRY3Yncg==
X-Gm-Gg: AZuq6aLtuHwOfbTpVMXp1HvOr2oSSCcGjoDhffu6EKGo2SLrnWKXHQMgcSEet9jamDt
	N8wKNY4Pqi1XXI3B1aWvuzSCdS59k+Uwc+SDQ1G5LwNfrwsoTmKIlkVcb9yNX67Pf5S7xYrVhFM
	/sx7eyXZnMNTbeb20Wmprqd6D1j2anNUkPxW9sgGQ0XVF3rPUeAYWaTkHEU0Ijx5scPma6C5ZGR
	Xx0B41erNuxm2RNnd0JRnr1lWdyZ6nvojyNP+9hlffYiTZWD5xjdJeIHmAUDrE+L+oxk5Cs
X-Received: by 2002:a05:6512:10c2:b0:59d:a4ed:1aee with SMTP id
 2adb3069b0e04-59e16424bf4mr4915624e87.40.1770116824273; Tue, 03 Feb 2026
 03:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20260202074730.738760-1-xu.yang_2@nxp.com>
In-Reply-To: <20260202074730.738760-1-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Feb 2026 12:06:28 +0100
X-Gm-Features: AZwV_Qh2hAOTL2iZXhJf4HtRUDzm3SZegUCoMSRIOsgW54neZTtXwIBhuC9chV8
Message-ID: <CAPDyKFpqfo1R8Qkq284L9DTURjZnvm_n8W3a6KQTomg7A-M_Ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: imx8mp-blk-ctrl: set awake path for
 power_dev if attached device needs wakeup
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_030706_845838_836C4FBE 
X-CRM114-Status: GOOD (  29.28  )
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

On Mon, 2 Feb 2026 at 08:46, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Current design will power off all dependent GPC power domains in
> imx8mp_blk_ctrl_suspend(), even though the user device has enabled
> wakeup capability. The result is that wakeup function never works
> for such device.
>
> An example will be USB wakeup on i.MX8MP. PHY device '382f0040.usb-phy'
> is attached to power domain 'hsioblk-usb-phy2' which is spawned by hsio
> block control. A virtual power domain device 'genpd:3:32f10000.blk-ctrl'
> is created to build connection with 'hsioblk-usb-phy2' and it depends on
> GPC power domain 'usb-otg2'. If device '382f0040.usb-phy' enable wakeup,
> only power domain 'hsioblk-usb-phy2' keeps on during system suspend,
> power domain 'usb-otg2' is off all the time. So the wakeup event can't
> happen.
>
> Let's propagate wakeup path to virtual power domain device so the wakeup
> event can happen properly.
>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 34576be606e3..f3bfd6d22722 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -804,12 +804,20 @@ static int imx8mp_blk_ctrl_suspend(struct device *dev)
>
>         for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
> +               struct pm_domain_data *pdd;
>
>                 ret = pm_runtime_get_sync(domain->power_dev);
>                 if (ret < 0) {
>                         pm_runtime_put_noidle(domain->power_dev);
>                         goto out_fail;
>                 }
> +
> +               list_for_each_entry(pdd, &domain->genpd.dev_list, list_node) {
> +                       if (device_awake_path(pdd->dev)) {
> +                               device_set_awake_path(domain->power_dev);
> +                               break;
> +                       }
> +               }

This is really messy in my opinion. Ideally the above should not be
used by a genpd provider as it's internal data structures are managed
by genpd itself.

If I understand correctly, this problem boils down to the fact that we
should have tried harder to model child/parent domains, rather than
using runtime PM to manage the parent domains. I understand there are
problems with that, due to specific power on/off sequences we have for
imx power-domains, but I wonder if those could be managed better by
using genpd on/off notifiers?

Anyway, that said. Rather than walking through the list of devices as
above, I suggest that you use the ->power_off() callback for the
corresponding genpd(s) to dev in combination with a genpd power on/off
notifier for the corresponding genpd that the power_dev is attached
to.

More precisely, if the "child domain(s)" that corresponds to "dev" has
not been powered-off (because device_awake_path() is set for some
device) during system suspend, the power-off notifier should return
NOTIFY_BAD to prevent the "parent domain" that corresponds to
power_dev from being powered-off.

Would that work, you think?

Kind regards
Uffe

