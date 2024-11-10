Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1F5D12D59
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 23:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUFXILVcRL5dH5y0Ihu2hvUs7pMYlPM0BSJjf7eAZJk=; b=TftuC1Jd0sUXub13OBQYrO4hEo
	P0NSqgbmtFMvM9LE3yit+V4tdJBs2JdfBRtmfyImpqUuvYCxtKDKpwKK0pwd/4WlzHcaAKt9HOjlm
	u1DAlW7ZTLKcShscUGvsOabHlx++iWFcoyXYDJTTPanvYqMNpqNwqS4m4f5eyUbdU82h+rYCVl6GJ
	cONQMOZNJ+Gxeyp3+fdgr3q+VV2Dbm5e62TImHd1bKg9YY0F08mNj64DJrldIuYMDtbyrR8r5+nzQ
	T1KGfpagOkgEm/ObiFx1cnYD6lNLyJ+bdo73AQ+GOfuNcvDDXagczayqiPmJXkenCgX9rIXok24yh
	aqQzDiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAHDN-0000000Fsvs-0woL;
	Sun, 10 Nov 2024 23:19:29 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAHBb-0000000Fscn-1a8R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 23:17:40 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so30967301fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 15:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731280657; x=1731885457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUFXILVcRL5dH5y0Ihu2hvUs7pMYlPM0BSJjf7eAZJk=;
        b=VriC0ZEBPFInhbJ8rCc+RMlimf0U5G+L/rmxc0H9+JGvF2/ni5CqZxR+ogz7PxpPdc
         tA3Q4UVrEnAuyHWyS1DkXei8Wxo12Z10bJZ+BEVz9+MulzYdIQsgpFahfpq0iRbJP6S5
         k7R6zjEszxnisoCvs63OcqZDr5YLKySA3KuW5Xocwu35BvrRVWItr1wE+ra6AoKq87Kq
         NeQcG2cl5b8HzIDnvPTt4pYs/bG9Aod+Owx/CVzhr3IbQDdH6NnSZ2Y2GIgDwO/mhyi/
         6d3rRIl1/X14+ZhFDgAxJVfC6QpjDxbSPZAJ2lqgy0Ld9Y2wlP7To+3Gn4KLKO+mVWp0
         F+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731280657; x=1731885457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUFXILVcRL5dH5y0Ihu2hvUs7pMYlPM0BSJjf7eAZJk=;
        b=VXhqhMCGn8XcGF0ovrdrSvB42qlo5UTerW0yU5fI6lYxcuLkbr5ZbaxzJPmMAOQaum
         z+qYQf9jnafjrgceZnmPr+ughbne7pNQ/pt4MIpzOQXwcsFM6Johw4d9buxC4JM6X7W/
         DWGj0mBGDLxUPhTWhsWWjcw0Nir7+BI82YUdXDG3SroCCL3F0nMMdidRDdI84l0f+OkS
         8Pe0YXKVqfH4JvUxKFNJzhZA/sFzvUHvf02YbWSjvlsb3XLmAjk1dVOHC0FgVzCgKl3H
         CTEBg4i0Ap4Rv3bJCeeAxD+qf0cy9KhUfyuAxBJ5dc09Vvg2MoLkVIRuxAxKfVuDYw71
         FAhA==
X-Forwarded-Encrypted: i=1; AJvYcCUZF0nRe1TDjfkfWHpBie8Sngn/ep7EcAw7T8T1VwfkuRhxzYZ+07SL9OWKBfx6CQkGubRqhod8tTNDpe6a2CS5@lists.infradead.org
X-Gm-Message-State: AOJu0YwpYIYB0sKoKN2pvc/KN6IquBneAisjozICPAvBvzq46cbFfR5w
	colg5Ozo2nW95y0FvExMtslsKWyV6Xdy2pEy4zgBqWTDn9kbj5L+ugiVEGcLeZjgKnA4kepql8u
	BZNOjzdl3AAFpemm3IY7I+NXSnH4CXpM+wKmXcA==
X-Google-Smtp-Source: AGHT+IF91VKcTlaDZ/IlEkHiUobN6Q91eUFpAI0Oz/DTPRczlHHFK0uOIyphMgpgrxVRx+pP8vFbImKcEfUD64jrngE=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr39330571fa.22.1731280656618; Sun, 10 Nov 2024
 15:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20241108-fix-kcfi-bug-v1-1-f8497c4bccae@linaro.org> <20241109043138.GA1649953@thelio-3990X>
In-Reply-To: <20241109043138.GA1649953@thelio-3990X>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Nov 2024 00:17:25 +0100
Message-ID: <CACRpkdbBJsRQB3mhN4hqjFpa1S2YP6Eou+jS-BCfzL0OvQPsPg@mail.gmail.com>
Subject: Re: [PATCH] ARM: cfi: Fix compilation corner case
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_151739_461399_BE1DBE09 
X-CRM114-Status: UNSURE (   9.93  )
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

On Sat, Nov 9, 2024 at 5:31=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:

> Regardless of the commit message nits, this seems like the right thing
> to do.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks Nathan, I dropped all the annoying complaints about
pickiness in the commit message (after all, compilers should be picky,
it's a defining trait...) and put the patch into Russell's arfmlpatch track=
er.

Yours,
Linus Walleij

