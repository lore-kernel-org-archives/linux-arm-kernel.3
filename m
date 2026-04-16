Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7A6F8A14D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwzf4S6QgG2jfgxSyqcETN1wIIzICofgP6SGF67d4ws=; b=dIL6UUmePt05vPUbJda+KtNEAe
	6Ad2XbQrg1adJYZB6+rwtEoCaBYnBWs/8hpXg2wst2mJifJH209aXiR27SqA1P2v43B3STgdVfidB
	K5WgYkijjHa4CNYfxTxqcDlnRBtZS6msKkKGqkK8a7ii3gqJl5wpnXy58gD4pJlkTvZDYapqJ7+kX
	H7tYgbzyAb/VKaM8V5ZG3WZeqXVek0KOxKKbOlmU556oYukXu9foxqZUx5m5H/Bo1ABez/4Mf1CvI
	Elh6BOkhX4y2oLwS3qgQRkBgZ1y46dyBjTJs7T4UbPP1UJTNm6zT3Vqk175yTjkflL6Gk+9EadCvE
	QmGJm9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJFx-00000002G2Y-1Gih;
	Thu, 16 Apr 2026 09:43:29 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJFu-00000002G22-2E3H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:43:27 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38e7fc3c419so31862301fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 02:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776332604; cv=none;
        d=google.com; s=arc-20240605;
        b=cJwVt+Unxd1jV6ZZ8WKeAe7cS+y7TF1Nn2XO8jXNUahcBDv7WOlRS/3pLGfKqiI62v
         uUiisfM2nIIIlA2+2zIJNYsrqX9Vw5n797xh2mruowwbp9cfyiTsPYH0G1JA4OySzuvm
         RVrIOTULJQ9tw1o44K34q+cpaYSyhzGcPsKV01FAd3yiQ9zulq1l6BeOBvmiKrzCveHc
         tU9X4tAcGV2sn0lA7AIBX276+rB16L6Xk8uMv8UaFT8vJJ316RZS3imVszN7KMJp9SPG
         5pTMBCN/ZIkkaJO+yIVo6kiP0sOaZZT3MrQKLQJcFjsEXLW+lwh/ZHpM0r9pizUVNqjb
         P1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jwzf4S6QgG2jfgxSyqcETN1wIIzICofgP6SGF67d4ws=;
        fh=5Eq0heF2NoN2nCNx2VhNkfVzjMDa6yEL2cqJtfnSfF8=;
        b=OojHv4D8vCRK6+pzuEUmhbif5gjGydcE0Ia3m9y/ds8cPDywB1gvL/toFwxcygaXwF
         p/xjpIRC51rwixDL78D+mpV0AhX46RhHlCzxAdt4iK3l2THmlqEuhICNDfs3XUjx3XBa
         D/f3gIxTgTYyBiqpo1x5x5vtWR/FnhvMQF93JbMc0rYiR8KhEseEFMdKdC0GnMS5lCIk
         Senubid8dqg6M4+YGB8+R9z/4Aldhzeb7vt1dIje9r8IKgS6RsP6N0GfDqMlPzHtUdiV
         KX3Bd5Ex+3E4TaDVJwVOP1NM5AptLE/ngvl6oyVfa/zG62hC5M2Fvoju6oHgtbU2FoXO
         IQtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776332604; x=1776937404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwzf4S6QgG2jfgxSyqcETN1wIIzICofgP6SGF67d4ws=;
        b=eZaKDlV2QrjqYOsHIt2N9AKNJgaIiGlNwdrQeTfDNCnzYHO7exPLQgZYTbCurigLbo
         VYl6K+6S3Fq7K5n5umxUy/OB8La9/W9bMmeZ+TUizjTNK04S538c7ot8C6AWYrifMjlw
         V18IEqD5+s1TUTBnB5R5RFcM4nC+v3UoV1xJHfYsjjL7ZivX3fWcYQRNSTBaTs7L86JN
         Qdx6AZVywhNP8do4mYAJcVFphp3Ng05MZi06KKm9uKn4NiIn51iVsNaKsoYf2S73dpz3
         3eNq+uyMLuZSwOu8Fj9l7F6O9LnE9cjQuCP6mrmcGl/9LbX79ZYh0iXQt0c9Hzi6ASA3
         zK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332604; x=1776937404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwzf4S6QgG2jfgxSyqcETN1wIIzICofgP6SGF67d4ws=;
        b=aDH7wL4NSseKttkMxQkYjKS/TZ9BbPVHQh/D9peyphSuGhgBRJjlk5ACp0UupnMeo6
         VymKW7303sTWr2dwrkHQt3HUi8n1CBfIYgUg2yF+EEdarSemD7qi76fJgMwLDkyiR0Ba
         zWmiudKicfFBoKPSEHA5MTLnaoJwobWQoWqfcJqF4BZs47uCvtUVUW2WAoNwDnbp4Kpt
         S5qLPIc6EpLFw09QNTD8sqN5LC3y7gE8xz0zogELAWriz+TQqOvH51gAlvUwPVFAZFc1
         eNhl5tgMR4bmHOdwYk4CJVsYAS5RkdcKfgF+C49VfTTYWV3YyJMI7r1budAs32I+tQSa
         jJTg==
X-Forwarded-Encrypted: i=1; AFNElJ/alppAmDCT0HvMF59d/e33xkNfeihOHtOeO4wVLbzIH0F1gR0QeptUFTVZod9fsHttncUt+V2ObzqibubM3C0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ThhpIspv3w9ppZVL6OOm2ghkszXJ4mAN++mvLzatbHeiveFd
	8YiYjKHdkL3yr/JjEtpcsM1o9+9GEUI1a8SwkdIO7/9iktW3BVVRbTfO2uEhbUzyAXQLzl2poPe
	v/z5Q9YRaIiUBM2/6IXl1B+Bny31beVQE/3gxVXTWep6G03yVhV6T
X-Gm-Gg: AeBDievC76HQFvLm9Gtc5dR/NYkGNIdhepSRl8pD1wNTjcdhSDQGht8kV7ZhXqE0LQl
	GVBcfvcRCPbIB9uW1Zp0iTibnOxRetWrsk2Vc30BByxYHggcVqECkdKSAOAvHX19VLLEmIYrh9s
	LWo8gMOmV5dJdfAwRjTC2c2GWE9rMIGGsQ0R8oTSFMQLd1Gz1x2L2k0A7IRWPTjqiHXTiXQhLHN
	Acg6kyBLyaB03bOUG/4XdJG/tpDD/L+Xn/Y2FYaq7UsWeVZ9eLbFilTRK2F8Gvkosv5ljSZgTqX
	DEaWEsZW8KZIxym3M9c=
X-Received: by 2002:ac2:4855:0:b0:5a3:f309:42bc with SMTP id
 2adb3069b0e04-5a3f30942c8mr5012628e87.35.1776332603751; Thu, 16 Apr 2026
 02:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org> <CAMuHMdWHnANr4R+AW5-xHrm=D4SJLuKVF5mq3PFkbevcTz5qWw@mail.gmail.com>
In-Reply-To: <CAMuHMdWHnANr4R+AW5-xHrm=D4SJLuKVF5mq3PFkbevcTz5qWw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Apr 2026 11:42:47 +0200
X-Gm-Features: AQROBzByupCgfYQNSB5KjMp-9WACrVqsXB76aGpaQekAwhIX9pEpFrllJozXBsw
Message-ID: <CAPDyKFpxooSD=k2jtMgMqTDP+ovmqZWoo_VBsKfpce3vRaZfSg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] driver core / pmdomain: Add support for fined
 grained sync_state
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_024326_592269_68737F1D 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, 16 Apr 2026 at 11:15, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Fri, 10 Apr 2026 at 12:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > Since the introduction [1] of the common sync_state support for pmdomains
> > (genpd), we have encountered a lot of various interesting problems. In most
> > cases the new behaviour of genpd triggered some weird platform specific bugs.
> >
> > That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
> > remaining limitations that we have found for genpd's sync state support. In
> > particular, we discussed the problems we have for the so-called onecell power
> > domain providers, where a single provider typically provides multiple
> > independent power domains, all with their own set of consumers.
> >
> > Note that, onecell power domain providers are very common. It's being used by
> > many SoCs/platforms/technologies. To name a few:
> > SCMI, Qualcomm, NXP, Mediatek, Renesas, TI, etc.
> >
> > Anyway, in these cases, the generic sync_state mechanism with fw_devlink isn't
> > fine grained enough, as we end up waiting for all consumers for all power
> > domains before the ->sync_callback gets called for the supplier/provider. In
> > other words, we may end up keeping unused power domains powered-on, for no good
> > reasons.
> >
> > The series intends to fix this problem. Please have a look at the commit
> > messages for more details and help review/test!
>
> Thanks for the update!
>
> At first glance, the only real change compared to v1 seems to be
> the removal of printing
>
>     pr_info("%s:%s con=%s\n", __func__, dev_name(dev),
>             dev_name(consumer));
>
> Right?

Correct! I forgot to include a version history, sorry.

Besides the removed print, I have just added your tags and updated the
commit message in patch9.

FYI, my plan is to queue this as soon as v7.1-rc1 is available.

Kind regards
Uffe

