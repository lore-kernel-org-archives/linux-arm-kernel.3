Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF1AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikLFmXKsca9wmfydpauFYhkGfc0pmf34aJ8RvveDKb8=; b=2NVd4hgwPJDjH8VWRCAvfvjJ2f
	RGG4P/4xAHOHBU0DOk8zCKFODnz0yA2VoP8b7jexeMeEcEWAJeGN3KmCzluXGAGPtdtmjNAOvtnhN
	LT33Atx+aj23RsFqtl7ANr2BwH4BSwjDTbEVzLrMmbQR0EDw7hMt76YCU7E5d+b0aINWM7rSVcmpW
	fkTubjYS7bgzyXfrjXQssa+sJmRXMsI5X0SKRpyXACiKYTTrBGuUAgZ7NVc7bkresM+1kNHcxUEby
	AsJ6hNBaXeVoZ1bhnsxAjRnThHTyZAtvIEY5Tg7cZE4kXEAtz8hajcKm8qHGncHCzfmn6ddI2el7w
	QQvjOf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLvx-0000000EKNg-3Ppt;
	Thu, 16 Jan 2025 09:13:01 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLui-0000000EKDa-0zD9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:11:45 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so7395971fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737018702; x=1737623502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikLFmXKsca9wmfydpauFYhkGfc0pmf34aJ8RvveDKb8=;
        b=Nx2eDjk9XOlPVrLQo54U17xRI3hVwYWBo2zISAYT9f7nbqIv3b2//dJiFEYmxc6XY3
         ygxYRnBPkHDJ2dCMw24+snNuYI4GYbpg4t5/Gvv9HfWSN9Q/iI+Cl5PBK7AczPTSbL7S
         4Bv1OuWvd2yeG+Q9f8804VAykv7WxCYTiQE1DEn9aZ7Wq0A3Cz209wl9SLaNlTpJP1jI
         qzQ8ncYuWan2vHL7rf2dugcp7vRrsYS4r6RX6OyC4QQUkpC0E26+0WoBfdKhhHuaPjOa
         kEGlPHJgVsv0veNwKevX6Qfn/1lBeTbf/7sm4ByXNVDVHoP27vKfsMirvgnrwWHh5Den
         VXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737018702; x=1737623502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikLFmXKsca9wmfydpauFYhkGfc0pmf34aJ8RvveDKb8=;
        b=oDx45uFs7Nx8CMi0+MCwayhjHEQvn3sWweJwtN29exKJ9d2KpjxR+J3KSyY25F5zRb
         AWpPjGLh5BFT1owNM1xepyj7E9ZIcPRAFGjh3vc9dF2Z3md1+OE8RNetLVAIZ9uz3zgf
         5tpqb1QltwlLlAPkSPRhxiDkxod8sHgkDDS9kGvRqaHGO2n5fcKQDucgM4JFtWEn1YTy
         1K1VItlIuqbRQxtnU1aBxvB+gXXijSf/wjiGSEKZFk3hXOjZhciFcxqA0ov9VPZhT/No
         Xy+Qbo8AmdBLX4s6ia76cMq1jVpbCimqzNYL/JwkD1lDsektLCgd7Gxu5G++As5Zjjr9
         IEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFs4+/FPajmp8MxUvmNU0X10CfW2VeRPD6WV05X6DvmbbbC7wUm87cJ19Ak1aNt58DfzhOhT96eXVNeIvlN4Bl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu8F7SQog6AqynwwfXvu3D/WeV0Z8Eiszt0tejsau7tz9aB5hD
	G9NK8Ekm85lRw7S+uRmNOkKReNAssrz+BVZNvFMS0c0ByjumhQWcsBOlsJf0LMBEtaIbMDAN97v
	kH4Zm7CXz1Oa4b5BiDQEBSjQhM/5XU8yVy2gxxQ==
X-Gm-Gg: ASbGncv7xgBdPElCFY1laWV/4nRwQYNu69mIFMuoalIiRVVwX3YJk3h143s9UFOuNKt
	38Hyb5g7X2TVL+yknI1mg+47cVPb0hbsvJhFQ
X-Google-Smtp-Source: AGHT+IGrNyL4WuedbnIHfohMmLOiMsDyLxHxYKbUmK1MCT79/SM2AYsIeC1T5ua5wPDqXM+fDCZ6Rn/6qrHw9NOkVng=
X-Received: by 2002:a05:651c:b0d:b0:306:10d6:28ad with SMTP id
 38308e7fff4ca-30610d62ae0mr55983181fa.8.1737018702223; Thu, 16 Jan 2025
 01:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
In-Reply-To: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jan 2025 10:11:31 +0100
X-Gm-Features: AbW1kvY2Bex2g7NRizUNo-TeBXpa3h2hnqoTmMGAWm_LgIWygats90STWMenwAs
Message-ID: <CACRpkdaEyC_aOLkJDUPw7=0FhBFN4rRfBU4rghm4RfjZhJFP-Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: cacheinfo fix format field mask
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_011144_272684_C8D49704 
X-CRM114-Status: UNSURE (   9.25  )
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

On Wed, Jan 15, 2025 at 12:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Fix C&P error left unnoticed during the reviews. The FORMAT field spans
> over bits 29-31, not 24-27 of the CTR register.
>
> Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764=
d9ee79ed6@samsung.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

