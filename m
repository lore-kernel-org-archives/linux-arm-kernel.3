Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2F8FB44C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rynsA0E05m2lNvLZf1WIv6OBgnvIOBBfv84eGevzkvc=; b=zBqbRwkJcxnRr6NEr18M5bgrrx
	/9K9SHV5c7SKDxJ9XneZq/nmCiGC4dsHW0WQJLByO/G0FNa6Lu4XDpKouJ/5NIHVdjjye2dmiTd3b
	Q3P2zn+KXbiEWbq8ywULeO+6Eo5/AGVC3zbgf6dynjZDLUULV34M/q4M4/f6pexBTgbfAsrIJHwEX
	E5nIhwwdZ6rSMUgqa5C6LlFQNINMX2nSRkaQVrbZosuasggo1Td3GrFD05VnR9RJ8fVLkGPZN+MkU
	CN2q0tcpicJ036tjxN/UBCzYCbHgA7mEsm2RpZfo6DWOlivnD0+PgrP5WVL/3A5Z3cMNTq7psfOuf
	eJ+4hleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAOr-0000000CjOA-0kLU;
	Fri, 24 Apr 2026 06:52:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAOo-0000000CjMf-3VXu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 342FF43650
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E73C2BCC4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013546;
	bh=nRJOP0j3XKc9GVJLe/zZOWTB37EaZHVbmNEGogY9PsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hOikG9eJKV2Lv8Rn+NieIPb+7w1cDLf8PS6wRdE54D5aD2/+gorw7crcQ4FmNz+dI
	 nupGE8B+R+42EF8fNFIeMq1Yh2/tmh4o0DadhfLyWfaWLdHrUl9dSPwfzF2KLuDPB5
	 QlivInoNaJtf9dPB7M+ImQk2qFDMiKOfP5zRsZL0Dv/e7ucSxMMBpqjjABN6K0DNzM
	 boOZTAqEkVYPS+8xVBolHlGHnsUVktNvZKkNqppALex7Z4Fn6MhlbJOXHwfwLxGfKj
	 aKmm6LyN4hjAswhJdKAoiEQ1DBEN2oByvgCrBo6FDCiuR46LeRbhBfvi43MSDOdia2
	 vZJcr5arrmrMQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so62688091fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9H2DamJuZhp13nM7nX2o9stT88v2U9O+wg/Lsf2etMnQXqY3edOP5CBOA7RD5QadD8ledzbtLMt9Pf5B6X1Lid@lists.infradead.org
X-Gm-Message-State: AOJu0YwS//wvCyrm0dYQuRx3A26o3OXYNq7Zsf2dnQZJv+wAkYpo+Ltn
	tQ4lSBW47PRAaP9vz9K6m4A3iU9yrwKoQ2sfw23jxpDeVaOsfoWoV50V/7z4vbIwE+vDH8x124G
	Tgcj+S8ZUPvj29d9wa2iG8n/BNEQ3/lo=
X-Received: by 2002:a05:6512:2308:b0:5a4:74e:5f89 with SMTP id
 2adb3069b0e04-5a4172e1c0emr9146746e87.26.1777013544781; Thu, 23 Apr 2026
 23:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-defconfig-v1-0-a46918286451@oss.qualcomm.com> <20260412-defconfig-v1-1-a46918286451@oss.qualcomm.com>
In-Reply-To: <20260412-defconfig-v1-1-a46918286451@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:52:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=ajhfHfsbQUDyepOaRviuPCjdeHdXKzvk4Yc8m5BSDQ@mail.gmail.com>
X-Gm-Features: AQROBzBYgKSFBKf2d7KO64mzd1gjg_XRv4U5aJq5vG1so1gyNy_IrLTtK12mfak
Message-ID: <CAD++jLk=ajhfHfsbQUDyepOaRviuPCjdeHdXKzvk4Yc8m5BSDQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: defconfig: Move entries to match savedefconfig
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_235226_911998_57F87B08 
X-CRM114-Status: UNSURE (   9.45  )
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

On Sun, Apr 12, 2026 at 6:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Only re-shuffle entries to match savedefconfig, without removing any
> symbols.  This helps in reviewing defconfig when comparing with
> savedefconfig and looking for obsolete symbols.  No impact on
> include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

