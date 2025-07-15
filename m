Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5580C83F38
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=; b=oiCLvu1yxY599X03Mp3iiO0Jiv
	f5a7sZ5k+A2XwjKhIveQnqZbvJh11lkPLRhTAJNZqvO+vcQ9e0uPdZFVZSpsfcU/IuAMD35YrcuvA
	aUFskOHLJwMsPGX2REoR4h+ot3gd2MCeCyiKv5pqYFSSSdndbytDOHzPldqF048Nf3qNCBUIfdcDk
	NycNlWm9YhZrvA869OmepbihDZvqwri3rIe3/+xY5nxKk5XK1ytjrvG9sCUzzy+kFYgbDzHYaVaR2
	EU4jdWd9KW4Oliz4tgjQttSsMqpN1T62Tnao6mz/y/3RCscrSMymbrqb4HyDtlBWY6niyDyW9PWYO
	i+b7Z96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl6u-00000005xu8-2dsn;
	Tue, 15 Jul 2025 19:14:40 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgfi-00000005NRo-1Vyp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:30:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-7115e32802bso42795647b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752589817; x=1753194617; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=;
        b=hZ6ifd8aOft2PsCv9YxNLGJoCaXZ0OrSkY7FVKhVaJ4wrxmlgr5i7XIbGjQf8NeBar
         u1+Zcc12DrcbRe6tusmcTUJJQQh31eXlBc7u3kSXCagjdtjM0ebxR/8oNNIK+ZD7acjs
         MaWiMORxID7iwY0V0ViQGqEV8PKfEo6WEVVWfP6W/CNM/H5nbPIUZM+/UqD9LNb7+J0G
         z4+wk5cJUwIKaWmfKkOrf1mG00Mn90VAgB5xVObAQtvgtRt/36ppDMZPJb/UXa/sVR6t
         dgvu/u7witWza8QkVV6NNydAnwLQvrR6EnnhLZcG4RDVv4joX0ZH7oS+Xjyoy1dahxSQ
         /hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752589817; x=1753194617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+7Su+tXNXtNlViREf/FpByOQe19DRJ2WhD/byKGrG8=;
        b=tI5dVNHdus6RPOKSWR/TeSZXP6WiTOYKXwcE4MuOehZeXVQ3wgS3zyJ9sz9iBf2tYl
         3VkzapQ2vz8mAB7eKZ3G0ZIuueP60ZcVkKax7rH+GenT5epHs+X0wyQBJUB0eX/e2ViP
         N0npLqr9dLc27zZ35AKgSiwiGQQDL73DTVLsuEWqP4M3lQpTHFDdOk3AW2dXPsF3YhfI
         rX9VIh7y68QncYkUhT+TUA5XFOfHCEQoDduu+rQR+8bNKbg5ZFPszdJ1ebWPVbcqoCsF
         iodDSDmUvNw98EE0C0zF62IavoH7Ala3/k/XIOZoDwsPkxXWAJHe/W9Zs19AFKpkxDmH
         KpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM3Tc+iWlG2L8tZvkVQDEd3Ngpb9LVJQhn1TnSlEOiU/KgbhJNIfeiVWRIwIge6kB+WbCd6nN2rKrI7EZ2/aKT@lists.infradead.org
X-Gm-Message-State: AOJu0YyFlL1+oVR70KwCVPDfnc0u+v4qccdnD6S3sZfwFFKD3ie8enMi
	J9q3zuyAxnlYRNA6cwZPySsQzGsNISGtFWzWiXNDv2j6xCinJNrVEvg6m7zDquQ6SwtyQ3utQdK
	B2D3L1ZQ0BKlz6g7tXu5dENgaGHAeizcUW7iPUU8uTQ==
X-Gm-Gg: ASbGncsnotmU6VYBM86ICgZEI72AYLFdO9gUE3grKoRz+LKoHcWI6pdYF+lpStVIIga
	qwUfPKFkZQh8TPPEEJ4I3+9EF5lfD0EGMxy+6OqOkdei1WIPnnIPGui6c3mLBi9i0oXxpgbiFc9
	VRG2iImfCifXFr2TpGipkbERHI/F3K3I0P+Fl/GFUBfauSGoUBNOqa2PBEpNCjgSHONw6XT8q8g
	ydw6xV7
X-Google-Smtp-Source: AGHT+IGBzBhoCXe5OGunO7xvl2ZbN7LRPwWWQsLELIyQWERT2XuyowSM7Ti1rVh+eETJFMAPU2ltq9fvUbOvfY7jIrI=
X-Received: by 2002:a05:690c:9:b0:718:2387:4544 with SMTP id
 00721157ae682-71823874737mr49946387b3.12.1752589816638; Tue, 15 Jul 2025
 07:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com> <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 16:29:40 +0200
X-Gm-Features: Ac12FXwmHbA2nWRNuYQwrZTMO008mwPCFYz6i2upkNA2qncGOOVsk9AzGvxKlLM
Message-ID: <CAPDyKFo77_0n0SefZ0N3osbSM=0tXW_rsjd9P4WaqoZAwyaTGg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] dt-bindings: mmc: sdhci-msm: document the Milos
 SDHCI Controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_073018_399675_8F0A6B7B 
X-CRM114-Status: GOOD (  14.55  )
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

On Sun, 13 Jul 2025 at 10:07, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Document the SDHCI Controller on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 2b2cbce2458b70b96b98c042109b10ead26e2291..6f3fee4929ea827fd75e59f31527f96b79b2cca8 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -42,6 +42,7 @@ properties:
>                - qcom,ipq5424-sdhci
>                - qcom,ipq6018-sdhci
>                - qcom,ipq9574-sdhci
> +              - qcom,milos-sdhci
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,qcs615-sdhci
>
> --
> 2.50.1
>

