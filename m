Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BE8E9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKGyp8s3LE1JmIfK18k1FgBCswdFGrMicty7Hm94jsw=; b=jY51CtBcVW4KRfn6h4DZgo32G+
	ZgvUpT3uWfMviTQuhx88fypQ0qjuk4GYRF13oukqdCxkJ/prRVfJzBQHehycn64stUMDBsnPdduxu
	JbEvIc48rE3DtC+WqzzdI94DLvDs514DCTQ7eIH6Sk+Nx0nVlEp7hMT2+cfQIE9eLpW+9qF26jNv7
	CG9eeLzQmQ+qJyqMoNgikRLcASM259mOg60k+BipRgj9/mgB1+4NJg04eWrAzuirSdeW4oJmO/Ypf
	C/9Dq7QZbMmaRJKZLOYhJqHvENvxC+md0AugD7D6vlEbotQVcmJnokOkrYidmx8xx/77LnERv/G4J
	59kV7k5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt86u-0000000Bj8m-1Bg1;
	Thu, 19 Feb 2026 17:46:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt86t-0000000Bj8W-0MBR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F298F60130
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 17:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E485C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771523200;
	bh=bEt+rV/VqBPD8HBT63k2KfFNDvbW36w+6DShtPFW7yg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kaRlwAaA0wwb719iLtJ0v/ZmWcE4QbWFcMGrU/WADo82mMM2OLxH6XssCugxJEZXT
	 SGFX/6cLTXPOgkBXCfwhDHiI/ffpHjgmbW++b3XQvX7pcUYva8e5gpKLdtN52HvazW
	 v7gEiNN2EeKXsgprvwRbc4ZKnCKGCvGqfBoR7wkSUofQ90I22LQhVk1px6tNBfpuBh
	 tHIokH0HYHhwvtj3pvLe9o+39MGNGQxGCtRapWyGyTIna7Cd7kmLF/li2dcsUMtrBQ
	 0MilShOZSJhvni6J+N/KHMcE7zw03w25FCDs6qpHbcpwZrgLfwNQYURp3eigGthHkN
	 S+qvFxE0A1h9w==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797de0727a4so12256907b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 09:46:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrFCfikD3Y/JYtTBtTWwMiARGdPhCj0q4hVn+hnlUgMXD4MOAJiB/CuzsexzoYmzZXc9N/NfDsIOKnjUgFPzpv@lists.infradead.org
X-Gm-Message-State: AOJu0YxVjfEKhZtb5Tt1ecJoj44yphjZO/XPIhTzLiK6vjzx4ACEWn7G
	BhCyVsn/iXIGoLOi/B6zI9Ykx6iJ8DW7a3AmrGvipiuSzWJhIR6ASjXoVoIV0vvS+9QaGst052p
	s2Rzp7iqzZrEK+oO5a4xT+Aps0Afw1O0=
X-Received: by 2002:a05:690c:4c01:b0:795:28b6:e3e3 with SMTP id
 00721157ae682-797f71e8683mr50043137b3.22.1771523199942; Thu, 19 Feb 2026
 09:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:46:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLmya-Ti=6QizctfDXgrJN-7X-vvEo81JeJgw67HO=q4+w@mail.gmail.com>
X-Gm-Features: AaiRm50yzujcUw5_2MMotXUmHWFgY-mI9O6itNPoCdO0GZal3r7WKmHY0BJYOss
Message-ID: <CAD++jLmya-Ti=6QizctfDXgrJN-7X-vvEo81JeJgw67HO=q4+w@mail.gmail.com>
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

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

