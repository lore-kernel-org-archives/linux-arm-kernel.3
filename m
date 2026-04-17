Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE05F4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYOW0Q1+IpjwaJO/WtjuDhSG5gnZpYesgmlqbMeuVlo=; b=24/F7LPW4N3d8L1oJRQ/nXcV2X
	sgtUTemtq4uJg1+EUoQSnuj1AWjO+EpMOdHFym+Kzu90OyRgvT43ubjUsVX4fZRZyoOAT1bj9b/ch
	ecdpzCahj5VPlLgPuqLHKLxpU+vhTGeWZqdhBuR6BBkcO7dJoeAkMTmmMYmwemqWzYvom8lyQ6Wa/
	2Byws4Kx9AeRp4E737lE2kzSygfnMBzBQjHIGIaYjU2OEhN01u92uaLPnjpxkdCH/6xyumC2zojyO
	6sa4Dn3iR5erQ73/N2JEXD4VlteRgYfOmB9gpoiWGgZDy8UgySjwPoJkLdO0/pEFnsEilNUsYij3B
	IJ4VRWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhMi-00000003ykL-2ZQj;
	Fri, 17 Apr 2026 11:28:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhMf-00000003yk0-1mIH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:28:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a337552604so582798e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 04:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776425279; cv=none;
        d=google.com; s=arc-20240605;
        b=dv6fSWvhUnQMyQ255SMSPhqPQ5xOPFtLsErfOshsmV2Zxfc8SqN5ttaNzWw85w3zop
         Gf2+bhLPyJWr1SWWnIJd7p34VjHHhbcDW/2fo6IgJDDO4+dnHvEMHTrmJIpba6YroEjg
         9c5tPPYFYQUHRuD0XHnltLkbaW0gqA9Vhs4JI8QigRYjNi3f4/vLHWErLSSLVtp+8ZiH
         KUTzdd+GguG/a2c78FbzxFSXBk7eOmsTieBLi60aiGhfGXaQVarTqm7rIDA29njjHr54
         T0C77sVoNUXQjqVomPh+MkL4Vimsv/Gy0Rhug9qUMSD5QVwmdYFW6gM1iiR9mlA4TXkT
         Ed6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rYOW0Q1+IpjwaJO/WtjuDhSG5gnZpYesgmlqbMeuVlo=;
        fh=pGFNOQiKNIb8PFKPr66CD2vWgJ0pVCg/ISm1iJKqAX8=;
        b=H+spy9lUoV1nH/IpP3i5avhhUq7674S2x3ioSYva97hOn27QtBSzifHZycLfAPBgwk
         tMnS8bDcshdQwWMhhRsbT5QpPMP8H2ncLqHTC2Ay6AF0WneCTJFSnRhYI3+BuOenaO6G
         Ua/yANq96BTQsA+5xrFmqWP1HfTU8/g/AAr+k+ylZAan4dSecPldsdXOj4Jd3/LSEmSf
         JU9I/nrFPThkJujHRcIOLELrGuRKSuhGapSfW35+5mT13A3SN0+dHcYf5bJWClmRTLkV
         scFPPjwdhD7JSQjRi3dGVV2mWABowcnD7dAkRK17nqmcde00RvX3V4Nz2EteplKSKtbN
         1G0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776425279; x=1777030079; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYOW0Q1+IpjwaJO/WtjuDhSG5gnZpYesgmlqbMeuVlo=;
        b=JRM2pQffHRvrcktuK/Y2nsUnEUhTg4JHoahrOQswVmaqmau7nKHJ+YNMCZRt5IR0gJ
         SA75ERrZ9Vm/5FcphuwcDh5I+sQGjHWdISlBBo3JCfqDJ4/A+lkiz8EWG/qubhM+9L/K
         adC3wrkwkatqX5vCpe8KdP5eUEyFxqi6HRU2S691JgR+o1sUHevYxbtesWqW/260+uJZ
         vvwyBHTHmZyhXbvfhDKWFXhxH8e0WfMUEogAx2/WBIehb2caTpJ2jGtiCIQRNGPqLk6E
         E4LSCBPEpfgwxQhzIaimCjBt2KqNTyxORwVTZkYAYS6ufATeeXY0jj1FM/fZlwpzg+8/
         HerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776425279; x=1777030079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYOW0Q1+IpjwaJO/WtjuDhSG5gnZpYesgmlqbMeuVlo=;
        b=kONsnAByWAoj6eJRpW/+xcjoPG1J0UjAZOXIhsLuJZlHnZB6oDbxpgn55M4Ovtk8QT
         FeY4bDU52+9GCIBqUThk89wYdQJ4Uc2dbi6akRF70a0ODMpOrxltCDAm+3SGc4Suugvu
         Z9Sood7vOJYvJFUU23B7qVvcCBbfeTyOGQzIyA57jx5fad6xZBNxBMN4JAfF8xmpHSNK
         9m/Hp5Sy1nM00Xu8wkEbT9tBwerw98PcOsrWL4xqtGJgkHP6UzWQ+r8ZH5akd+7Wo6J0
         dUm8t08sNwuT5a7mGZ0G95yiX0hb2kJqMy65O1whAPSPeZAZcKoPanLlKOZ/oCVN2ZIN
         ARtw==
X-Forwarded-Encrypted: i=1; AFNElJ/+cx2yTXUfQflng9Vsxmfkf9YTQCm6GP3icEjG4z3fzwNAzKY4/db/5iAfkeiDWF3QaQqqJYsQqjfxUMtK7f5P@lists.infradead.org
X-Gm-Message-State: AOJu0YzoUHsqHSyM+jo5xQY1CQnp9K/0IxpNuzZ38qbmBcW47Qf004OR
	KwWuHhc87EGUUqwg1N+6G4g+HHxyjLvLdeOI3snMske5ghxK6sEbVgly8YIWBGr6habT/V9Cxr8
	+Kj3wt2gLsyDjViIbvIYBMlzWe21bfjEVfT4S0QEsgw==
X-Gm-Gg: AeBDieuwhMjX8Qt6OnzUglqoAVwbVA1WT1NutpXg+3ETFPHX/fC7GeJXJTo4FkF5Cem
	XTgg6baTscn5s68y9l+tdNsJ0J4NglPjgMyU1yy45Onx+D4FOoNKVDtFAPd1bQvrrraK8yxNHGY
	5kxhcAOhNLO97SeBPPDnA5UZUHj4Z7zJHcCNtTUQ6mMpzK5VlODndzwrJbIEFzy1vI/VulHP71D
	og9RYz+sc9YZdi9AUsLqBxbAzBBQyo6E0DK0tUdSBGlg0Yxa1lAx8E2jiADrsP1EBrf3mSR0Bwx
	mbvFXXiBrlIweDPPstaG3N3jgg+0ZA==
X-Received: by 2002:a05:6512:2385:b0:5a3:e7f6:fc1e with SMTP id
 2adb3069b0e04-5a4172fc805mr733517e87.30.1776425278741; Fri, 17 Apr 2026
 04:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Apr 2026 13:27:22 +0200
X-Gm-Features: AQROBzAqQg5sMpRE7NutG6ReoXdRhkBYhSHEGgSBVqcN3w7-ZC_YCfha80lSfvE
Message-ID: <CAPDyKFrPz9gaBBp6xV1=KkoemEfapc0p3POZxuBTvDw7Vamxtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] driver core / pmdomain: Add support for fined
 grained sync_state
To: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_042801_522729_7BE8712D 
X-CRM114-Status: GOOD (  17.74  )
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

+ Danilo (for the driver core changes)

On Fri, 10 Apr 2026 at 12:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Since the introduction [1] of the common sync_state support for pmdomains
> (genpd), we have encountered a lot of various interesting problems. In most
> cases the new behaviour of genpd triggered some weird platform specific bugs.
>
> That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
> remaining limitations that we have found for genpd's sync state support. In
> particular, we discussed the problems we have for the so-called onecell power
> domain providers, where a single provider typically provides multiple
> independent power domains, all with their own set of consumers.
>
> Note that, onecell power domain providers are very common. It's being used by
> many SoCs/platforms/technologies. To name a few:
> SCMI, Qualcomm, NXP, Mediatek, Renesas, TI, etc.
>
> Anyway, in these cases, the generic sync_state mechanism with fw_devlink isn't
> fine grained enough, as we end up waiting for all consumers for all power
> domains before the ->sync_callback gets called for the supplier/provider. In
> other words, we may end up keeping unused power domains powered-on, for no good
> reasons.
>
> The series intends to fix this problem. Please have a look at the commit
> messages for more details and help review/test!
>
> Kind regards
> Ulf Hansson
>
> [1]
> https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
>
> Ulf Hansson (9):
>   driver core: Enable suppliers to implement fine grained sync_state
>     support
>   driver core: Add dev_set_drv_queue_sync_state()
>   pmdomain: core: Move genpd_get_from_provider()
>   pmdomain: core: Add initial fine grained sync_state support
>   pmdomain: core: Extend fine grained sync_state to more onecell
>     providers
>   pmdomain: core: Export a common function for ->queue_sync_state()
>   pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
>   pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
>   pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
>
>  drivers/base/core.c                       |   7 +-
>  drivers/pmdomain/core.c                   | 205 ++++++++++++++++++----
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
>  drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
>  drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
>  include/linux/device.h                    |  12 ++
>  include/linux/device/driver.h             |   7 +
>  include/linux/pm_domain.h                 |   3 +
>  8 files changed, 197 insertions(+), 42 deletions(-)
>
> --
> 2.43.0
>

