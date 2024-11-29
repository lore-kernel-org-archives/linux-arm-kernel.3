Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9D0D6EBF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiIfkNNTfG2wLwCrL8SHt4I5iayU11reYKOyFG1OMt8=; b=gVuTCM0fwMRaSf+sst/1ZVoMp1
	RzFXuKqr5rRcHaGrnKAH8PJ3pnDGDWRhyVt8gZYUlZohGmDHlaKR0n0CzmybEdipqPD6MBgWY4FnN
	lnoxJoreUsS1vyg1X5JzOcASRNwkUrFuqvnV8juZuL0rTgdWuaF727mfkJUxj3woaeF+6kn7V57sv
	+oermnrsOhvGcfSqO1mT2rQhg317LNNIr3fAX30+J/tNEdGBvvEob7E2utcaitVOy7nd0bw+M9D4r
	6wWl7R2v//CN5C6gIMvYXufFhMQZQ8MjI82a5FrQT9ztgyN7+mKBGxwZon6I5GbaOG0hBGLhNqDV4
	cZPEJO1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxDp-0000000HJlp-2OLL;
	Fri, 29 Nov 2024 09:23:33 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxCq-0000000HJeL-29Do
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:22:33 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2967af48248so935203fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732872151; x=1733476951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiIfkNNTfG2wLwCrL8SHt4I5iayU11reYKOyFG1OMt8=;
        b=VAhey4tKqqca3isrFu8vWwtwGE7W2b0xaRPoVcOCFBxn+4OtyKmf3hB1zk8GrIK+Ai
         eYWR9x8T0gyHoCREUM9tU9Pg1IZItlKDqH1UL3POWRG4o7Sx+okIsLI+tZsEHiIF7kLc
         g186mWlf1zlPYNk0jZ4+4Ncpo3+9uOxmjZXw7bFRNtDbp0YUV43pVGq4V4k6APKis3mF
         XUhla+4R/R8GwQLSmJQRLz+H0nItRRexiPA63V8I6LG8DQaM9v14II5MzyiqrW2I1rlt
         RC4F0O3Kzmwpa1J9xrJGXNWx0PHx3DFy3MCDHvtaqbu0PnsahpCWGLtWkGqvPp0S/hUh
         l4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872151; x=1733476951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiIfkNNTfG2wLwCrL8SHt4I5iayU11reYKOyFG1OMt8=;
        b=pfyixJvCYGoOM/oP9qIhtiTzUvOkHk5qVFTWWgxenQreq8z3suDzKhxhSm0yQMG0Ih
         61c6jk9LJxZQSvzObFUaGDGfhRC5zZ+VLZD56Ox6L2nDrzs0xaJFTX9IcM/UY0hBSstt
         T7cYaYtc3KgBn78OhhwP95Z8hdzTXaWc8c439cNfrj7zE6Feu/GMnxo4vXNWAoIyKq9A
         RwArzMB3M0C3SZiM3sx7SnT/5dGqSl1N6d1r/eKtAgsX/d2EKA02xXlbG0s56GMgQiKX
         JwjXOu/0nGZ19rS3EYAy7ufn6ZdzanizcBoB8j2FL/EiA841sibzK3koGDrzweLhrfce
         vcxg==
X-Forwarded-Encrypted: i=1; AJvYcCWrm6R5+WT2TazM6mdUetPqqrCuPWXlBLnhcTapQzhMf6aIMhIp+42qSgWvOF3845kuqsjIYFeqyrBWqT0QA5gD@lists.infradead.org
X-Gm-Message-State: AOJu0YyaYDL+jACo343eMEx4deZj1/3PXdyBGEehFzTbf6AlgnC68yF9
	xDf92xH7U1QR/e3L82TJ+iuc+te8LiGGRm5zxy8OgAcGhbV4D6ogtm3C3y6yClCiYCuTlFpfGko
	qdUL7pT8+o6tEMO4XQGSn+X1kYVdAvhDRUYJg7w==
X-Gm-Gg: ASbGncsFYmXuj7lE8a1gVLJkVgwOUPImBjf/mVplERY3ndDxv4hEGGfond9aaZB5cpD
	Knfw/p3ldf9Fv7Q5YemvbDwemVSizSWbS
X-Google-Smtp-Source: AGHT+IFjSIqaNaKVZ3/NuPe/UxWWplbF+FKubgmNFJXh3rXD7HgOiYLcq/AbS7MVH0EyqYNXM/cmA1yMxrA0FbnycFY=
X-Received: by 2002:a05:6870:7d13:b0:278:2c82:e056 with SMTP id
 586e51a60fabf-29dc4199014mr6752255fac.23.1732872151330; Fri, 29 Nov 2024
 01:22:31 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-5-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-5-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:22:20 +0000
Message-ID: <CADrjBPqUUXxjKapaSdWQz2PL8MsYVr74HCP_OqZZSG4w58_U1Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_012232_589350_4C1B486F 
X-CRM114-Status: GOOD (  15.59  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> This code's intention is to configure lane0 and lane2 tunings, but for
> lane2 there is a typo and it ends up tuning something else.
>
> Fix the typo, as it doesn't appear to make sense to apply different
> tunings for lane0 vs lane2.
>
> The same typo appears to exist in the bootloader, hence we restore the
> original value in the typo'd registers as well. This can be removed
> once / if the bootloader is updated.
>
> Note that this is incorrect in the downstream driver as well - the
> values had been copied from there.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Validated that a super-speed USB link is established between Pixel 6
phone and my laptop with this patch applied and that adb works.

regards,

Peter

