Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26085CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZaN40cf3gaPYVrOntAep/0sU9jdzMlSTIwHDqydOaY=; b=m+9dn2dg7dMrUbS2p9QkzTNwRi
	uOL1aQ5MjudDw0f34HMm6a0e9uSDo1aNyuUqXsSLPcBLhIjol/rKlO13KpHaeDz4+O4vkgZGQOCCC
	tLNemVE4bVu3JrV0bJtnJg97iVv67U8I7NkaRkW/do+gPAvwFIQU5oAAXBzXarVXA9fBzppsF08yb
	WRYAATJ54EWKHToA10njX5Vi/ngjPyPw4+wR57e0MsNBfgVpRm9XxBruCnirGitzbUxHEgzw0S6Z9
	WfyVLAGevGcHhyFodRoSIlRrUcOGiGDdwEjh+D2yin92TeCbJ0/0uA6F5jIXjfQdTBfZugoWgSz2o
	ODM/xgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Rj-00000000VwU-2Ebf;
	Tue, 06 Oct 2026 10:30:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Ri-00000000VwA-2Q3E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:30:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08BB843775
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C3A1F008A5
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791282653;
	bh=5ZaN40cf3gaPYVrOntAep/0sU9jdzMlSTIwHDqydOaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dD0cwu0NaDmzI6FDzUr53SqL2l2laUa5BRdUfSDXpMeJulyDsNvKsVevM17EV3FEd
	 UnKpbzoEAi1KOzIDEnEX7hQZBVO5C3K16NnV0NfEVsa75lDW43NjtZdYPMUCx8kT6T
	 V8dDmhAxtndAcxWds7MxUMrjuRmmQvQuryZPTJHIBHYHLkXZGXoeemLfEexl0uadYO
	 x7OD+ttM+AOxtRzH0yQD4Mh6ONR7x4isxees6zA9pEdZ9XuqQ8uB2KiPLHPnoUTkJP
	 jQfDo++ybon7Jrf/vh/St2hPwor3pVNafuKsj1hcHTvtBSXNJsk2YgzKp/i53Om+GZ
	 xpXvOTPX/BvJQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a6313cb899so3199511fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:30:53 -0700 (PDT)
X-Gm-Message-State: AFq9FYJ9r4PECtfqtpFDwTmnSdXMDdq/GtQTDbKmkjmOmY1vZfZSG3M6
	2tsQHznYvTEYNB8dvxFZ5UDQxGQdm/d3mgJVNNxZ+BS7F4M29J0/YkwEdk6GoBX1sWw/G4bG9u3
	CORJMN5xDEfghHuKUMDt5IpEeVsn45y0=
X-Received: by 2002:a2e:9fca:0:b0:3a9:969e:98a6 with SMTP id
 38308e7fff4ca-3a99af67db3mr1737921fa.25.1791282652577; Tue, 06 Oct 2026
 03:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:30:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
X-Gm-Features: AclHuK_AtwEo8WT_r25jczYf_hFshziwzfIIOr6vEXjFvPYUcVAgc5OmT1Oo8GM
Message-ID: <CAD++jL=gFt9kKZH9T-m8B_pbwRvzc35tTrMn5V238d3528DpUg@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] pmdomain: st: ux500: Implement ux500 power domains
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Frank Li <Frank.Li@nxp.com>, 
	Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Ulf,

On Mon, Sep 21, 2026 at 12:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:

> This series pays off technical debt from the beginning of the device
> tree for ARM initiative in the early 2010s.

I have so many fixes series that need to land for v7.4 that this is
mostly targeted at v7.4 at this point.

However:

> Linus Walleij (18):
>       dt-bindings: power: Convert Ux500 PM domains to schema
>       dt-bindings: arm: ux500: Drop NR_DOMAINS
>       dt-bindings: arm: Add the actual power domains on U8500

What do you think about applying these three patches to the
PM domain tree as a starter for v7.4 if it's not too late?

They are reviewed by binding maintainers and should be
uncontroversial and will make it possible to avoid trouble when
merging more stuff later.

Yours,
Linus Walleij

