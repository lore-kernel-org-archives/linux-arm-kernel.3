Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEA8CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 04:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=; b=e4Q9WOy5T1Mr1zLvrmznB6Gsfw
	xCv7V2PkrsGJi0BsTYAUGmsRzX3rECDA6BHCLe/xql479cXH7KEujO4ELyOA2/abwgpHEU2eLzfVP
	kUhpaYvd36MATyNKnEUrFu5qDleLRgGhbdTts5qHghRxukjMtMEmkJAWJAmRxu7dMBwE9cHPbfG8V
	IgYoGp8vOHiwdU3hisCKaNcU4FkHzz36T0CPsNlereNF6njsPm8oI0eTjkxXjAP2mS9WP5nLzlijW
	oTgTBLsUfhzglC0ndG0pEbCvHOrDftAYbUaU2XkH0FnXZ2JGYtZmR3ft69BuDycAPodjgyIvnyAEW
	4f0CDqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4BAr-00000009bYs-1lin;
	Thu, 02 Oct 2025 04:44:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4BAn-00000009bXt-3mIp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 04:44:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3e44f22f15so84003566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759380248; x=1759985048; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=;
        b=h/pQCb76u/nV9hNe6D9XR9qTeR16BZrXdz9MorDH9la9qM3jjZ0NINMjJPUxEeoKX1
         85Cj9N3LgxWsPmKYBuU0+IAECqRf5GgtultUCwHQw35m08echzNR2lv85iJ0lTG1NIa1
         AhGLSyJ8NKonjA0Cm+bAjohKF7OLWqkZ3taNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759380248; x=1759985048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0fNSbqDx3tVEU1b17OFCmGZksGRf1kldhowSTR+Zaw=;
        b=QjsPwiobIY9YMBjt38gHbsWlkuxHzL2o8NP1QD78pLctqeGn3APYzQUiBxFUbSoDdL
         cK9va/nqurmcO/sQGt9K72fK5OTaWp8TDxt1VJeCXyAqTrZE20UEJ7afyHX966yh7uGj
         s7+1iBGZW60kSxiOitpO3kXBLKFOJ1bd9nVQX7R0vmNslX2UoNBmydww+pZ2HVhNDa+r
         6Pr5KgI+lVU1nyZOtY1zH14sPZ/m8CjCBZPfOFgs2LiKmeQCuMZXvpX4X6svmZvIdq+Y
         DBOXPfdZtu62e8+8/KWSz0bOTUSYED6pV/hX70GMHYVTfM0Bo9TSVAnKW1XS3lb85QS1
         EAyw==
X-Forwarded-Encrypted: i=1; AJvYcCU1JA5N7BEsZZwPZ52P/cUQNf/Vm2dvLag94Okwh7HkR2UyZP5T45ZTj8cR/hLXNP4x2xDIczfSz+aTyxukJoro@lists.infradead.org
X-Gm-Message-State: AOJu0YxwC4oySi6uQvYEcwr8qTIkZDVvR9yKcLw3fwchh6JADVfuNdHf
	mC/SiCJSe+Nz/vSCCUAfOYBqdNKP3fwoasqAs2KumkQAHUz3KP15AiF4pAV536X4oe5+B1l2eqi
	t/6SaoKc=
X-Gm-Gg: ASbGncthyGsIxakFwPNBwmQTBkElR+0LUVwdX3Ij13BntSjBcfok82FmX8y9BR+JjKn
	2kULWVRzXVTEhhGIcYi7EzIgCUy7cSYGuMaUvlNCHfveQXVGndDvDf9vJvtPVgsvXCALf1JaSZK
	Npx8RBd8t9JMPZ4Wk9/6sUXxh9WJj9zQDCxF89w/y4Q8zo4zxrXIabKw5ucSTHw2dAjaRKSPSfM
	1B4c2vTceDKfObWtGsHANNgO+fbLF/OZXWRSCRA+ISry3UEA+KWxWyKRTwUSnIxsIi8A+biymSn
	14aSkcdtF8r4UxpUzhPGSa91rcUnVYVefi3atfxvLMDTLLffHmG63ekWyrQpWwc7lSqIdFdSPqX
	EnMI3l7iYVaWjR9g0B/duufxsv831h8BY7VuO0kvUcGcqLuzMAsPDmjIO7k3C6IUiA/AplkVQJP
	G8qYMPFs60RIeeKDcmb352ei038wcg92U=
X-Google-Smtp-Source: AGHT+IGdi3dZWE3PnPZVLXIsFzG+zkyGpxBN+ZffXNJ79Q1uOsJazAq8xch+eymnmI9I5QKY9f2xHA==
X-Received: by 2002:a17:907:3e11:b0:b3d:5088:214e with SMTP id a640c23a62f3a-b46e81a9f22mr726189366b.64.1759380247763;
        Wed, 01 Oct 2025 21:44:07 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4dfbfsm114467366b.68.2025.10.01.21.44.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 21:44:05 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3ee18913c0so111069366b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 21:44:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEqVsiiyggrTu1Z9MVWTRNvHHSb0o5TQpEhDqQMIhRL/90GIbxIbL5HMr+osEor+HBIOGcF/N0wUyWzP35u7N+@lists.infradead.org
X-Received: by 2002:a17:907:94d3:b0:b41:660:13b8 with SMTP id
 a640c23a62f3a-b46e6033460mr793566766b.31.1759380245436; Wed, 01 Oct 2025
 21:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
In-Reply-To: <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Oct 2025 21:43:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
X-Gm-Features: AS18NWC9nGx06gJW3k-2RDQkrnMZn65NQh3fTzpBmyJVcPDayBtYzYYuTR5Us6o
Message-ID: <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_214410_168381_C0D9543B 
X-CRM114-Status: GOOD (  13.98  )
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

On Wed, 1 Oct 2025 at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18

Bah. I've merged this, but this causes build failures on arm64.

I only noticed after already having pushed it out.

> SeonGu Kang (1):
>       arm64: dts: axis: Add ARTPEC-8 Grizzly dts support

Doing a basic allmodconfig build, I get a

  In file included from arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts:12
  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi:12:10: fatal error:
dt-bindings/clock/axis,artpec8-clk.h: No such file or directory
     12 | #include <dt-bindings/clock/axis,artpec8-clk.h>
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

and sure enough, no such file exists. It looks like it was never added
by commit 639f8e36baf1 ("arm64: dts: exynos: axis: Add initial
ARTPEC-8 SoC support")

That commit came in through the Soc tree and in that tree it came in
through the 'samsung-dt64-6.18' branch.

Pls fix.  My arm64 tree builds otherwise, but I have to disable that
whole ARTPEC mess just to even check.

It appears that there's some serious lack of sanity checking in the
arm64 dts land. I _think_ that file ends up coming in through a
different branch, but this damn well should not have been merged AT
ALL in a branch that didn't have all the prerequisites.

Yes, this is annoying.

         Linus

