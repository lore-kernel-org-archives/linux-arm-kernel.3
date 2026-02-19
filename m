Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36245E9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fawmIe+rhe9aGrLMog46POKPpyzeT/ZK6Mr9j1owxx4=; b=Fo2Su+dfFMqrpFuo4KnkWkm3kF
	dR82pXcytv1xwbnM6NZ4/yW+//AYXOV8HAH4cnrF/AO4nXcjrpzITKVYAL+2JlKTadAmscEBOLP9v
	6i4Xe5k6LHZJvkiEB+mPNu0Wh/Ono8sddTXhaylBs8fOqSpwI6QZjSyw7mqp7eALbiCNcvsTsXutx
	U3m6imIZE9EGYdBn8fSw4Ip9pwZHW5sTQbuBtjQSMKj1g/8800RV7WARqpMnK7DYwFATmcBIE58Z8
	XEG5iFbYGBMjv32P+IMqC9w+c86NRAPlJols3tfFBpwhlRllMd0WHDUPVZEX+ALXZmHjS79vI8evD
	5VHHORoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt86V-0000000Bj65-47Tx;
	Thu, 19 Feb 2026 17:46:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt86T-0000000Bj5i-3N41
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AE4040B0A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 17:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6923AC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523176;
	bh=f5bKib08Aelu/tvyN2OpMLabpE2DF2AGEf938W3+7fc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rZZQdBcT7j9eBprbwxI+aVm0pq/sg2rDYJvPAHs2E80yHi+RTrBpyditYlCsfR7pR
	 4KJ+02HPrMy2T4LWm84ErcbcMksGoOIBZqT/izuueznhVLcPO4htBR++dG/nhCW/XP
	 4Dgu3T8UImUuXAETFnlobMaAOJTsBseBmKzXQKFHvc0iaRBAvvSUzC42Qo96yFtVTU
	 TLTPW2F415Boq7iDAVr+UIScrmMYFchEwdl0/yv+l1AgekHvBM4+Go/aXPmWpgWnch
	 0/ai0RIudDqSPSVSaSWJ+/82eRjzW4E6vd0Rv9LZr/cZozYxymJsijPB8SsHEZSpp+
	 zXwog2BJfsxgQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797d509a2f5so14152517b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 09:46:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsQAHjo0y8sX4QTAhzyqQCBORsMk8mlI3Jrzhqp4sYt6IYS5kx6Ng0VYp49ZsBKdZR1GewxrIKoMvA+gjqMO5+@lists.infradead.org
X-Gm-Message-State: AOJu0YxVmj0bI0/k4KE1t0rYVXx5oE9d+l3yDWiQsB6a9lh5G5a5jDfk
	DEVVLFTm4XEEdxiWugLKlQYhQACyXgXrKk7WG26Qdds6hoHNDh5pHEg9EmzZNo353DE7lhG/+UA
	B2AChQ2taDjFw/rPeAM3SfWvivAB1iw4=
X-Received: by 2002:a05:690c:4c01:b0:795:28b6:e3e3 with SMTP id
 00721157ae682-797f71e8683mr50035087b3.22.1771523175664; Thu, 19 Feb 2026
 09:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:46:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLm=kRiQGCgvkv7T4saL_mMYA7ZiiY3sRWEQ-O1hVAHWKA@mail.gmail.com>
X-Gm-Features: AaiRm50WBg8Zv1RrDI4CCOgl08KjzL5jVITvp_mw_PPt4tuCUVJOIqQjfRmbLvw
Message-ID: <CAD++jLm=kRiQGCgvkv7T4saL_mMYA7ZiiY3sRWEQ-O1hVAHWKA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_094617_886721_D2141624 
X-CRM114-Status: UNSURE (   8.19  )
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

On Tue, Feb 17, 2026 at 10:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Krzysztof Kozlowski (3):
>       soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for Nvidia Tegra
>       ARM: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC
>       arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

