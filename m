Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACD2D43360
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAUOPbJ3bRm/k22zy5CUSLWAw1T4ExN+FFkWUH7eKiU=; b=iK7ltAXfBifJFxKaPKZO/mxFCX
	HNB4lZuMiY0OgD8HHNEza0yzd2q1k5YVVmp+lxXizSzhQ3WUj2Eey3WlMrN2ZgDxfKxyRHgCgQWav
	YXDOYbVVTi0chKCqnj8Uc1NrZZic+tp9jnBiCw63argkPU4fMK5wvSNb7oonZcULpeAbHVHNZFA5n
	Bo4HZyE76KTEP4IPtH6HR4UgXCHa4KZpN5RhgG0zIP71RWebGEDjzPE0elSPnW44/v8wXhgQsKRFx
	JZB1dLihdZ0Xl8yoOX0cj2ivbXWMSMVVqlBu//4L4+pmzR+Z81UxlsfexCPrqmhB0j4Bna1aUFcNp
	Z1EzkIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9377-00000007Dm7-03BQ;
	Thu, 07 Nov 2024 14:03:57 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t92yh-00000007C9N-30Cn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 13:55:17 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so19735611fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 05:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987713; x=1731592513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAUOPbJ3bRm/k22zy5CUSLWAw1T4ExN+FFkWUH7eKiU=;
        b=Naqd8PFG0h501nU+HbL/tpkJr/uTDW5sDBWp3kiAiXCBNZCl8Y2IxbfiewuSK6niSc
         2Fjif+TBtNA2CczWPaOy6tCVwocRf+VaC75UthgffswqFlQCmCxVkquINMXMprt0XPyG
         iZ3tb5s9RkJeQd8VeCGHu6pN7l97nI7d+ZezSGceFh1wOsl7FwbxzJ4vQygIKsYkL2CQ
         Tou910twXL81dO5EkswlxODM8t2EaWmxA4fnYusFtVwYdd38sUoaVBM01+9+VALVQCgt
         tJewTDnl6K1KLMsqJNRRamgKFvAKZVxGIsikE5sHN3WEWHCSnOE/oHabw+KeyqBvpFCe
         /qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987713; x=1731592513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAUOPbJ3bRm/k22zy5CUSLWAw1T4ExN+FFkWUH7eKiU=;
        b=d39xXStNNDUeUu0ZBSyRH9Y6sqGfQLrs7fSrE1zxELs1mE0tc0sX0uRzuxGpHmUly0
         lzvtEdUEMuGzuC7kTvij0Zg1P7Qrwvp+BjmHpxG5+007Je0upEouNmpckPiH6fjvPZdh
         pa1Su1zLZtuPLVDDcVOGiUOcshKZ4cQ82kQW50STpHgs2agJRP5tlfhtpFYrmyzSZebP
         XLi6Xex4LJBd8M2aX9ELS8Ro9Ubqkgb8XDITI2dSOXsLwDP2FK6dP9Ezh7EyxdRMrRoN
         PlUlURGvrW3TVq8PksdQH9cEAm4hYEp9FtVOYhbWip6FLy71bU0iv62B1pUgmEMhVAoB
         vicA==
X-Forwarded-Encrypted: i=1; AJvYcCWiAmJkyVTq04QOBSeJSadp+UTIz74LqxIFiLXz11AnHOqMqQ2zHpbkIxMjaBPGr9jpuNQLF6KmYgqBtO7RbS5P@lists.infradead.org
X-Gm-Message-State: AOJu0YwfsZXE5Fu6AISwU+iMjSCnCkcurXsO6ZhG/n8wHAPUKENS7QC/
	TedOsjT8x+gSSbpB8gU8RqbHLG7kOCX+dZrV8SOlRH/TPt3jo3f1n7DzfkdzwH+lZtGUWZPvKv7
	HGEz3dxYL++GnQvwmDricE+rjI8y81Na+ocuSsA==
X-Google-Smtp-Source: AGHT+IFNavuHzM67z8nD84tGq8SasaggEERCVa8QxVSdpo1jnmEECTHbl3HJt9yjMo5chmDOsynf6pkzaU7GoLeC2Hk=
X-Received: by 2002:a2e:a106:0:b0:2fb:579a:fff with SMTP id
 38308e7fff4ca-2ff1e9044e9mr169261fa.8.1730987712796; Thu, 07 Nov 2024
 05:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org> <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:55:01 +0100
Message-ID: <CACRpkdZ1Pkd_iKDNE+m_R4Anbdv=dcg77oC95yqaAM_dp0BRYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: implement cacheinfo support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_055515_777632_D28C5756 
X-CRM114-Status: GOOD (  10.67  )
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

On Mon, Oct 14, 2024 at 3:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> On ARMv7 / v7m machines read CTR and CLIDR registers to provide
> information regarding the cache topology. Earlier machines should
> describe full cache topology in the device tree.
>
> Note, this follows the ARM64 cacheinfo support and provides only minimal
> support required to bootstrap cache info. All useful properties should
> be decribed in Device Tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It's really neat actually!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

