Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC93D65C48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dt0E/6+ejHTgo150Lc89xpPGXdsq1GIskbS+HNFqx4k=; b=D19JzsCsxUotsowdEkb+WIiCnG
	rfo+w0K1W3nR4oZXHhpgfZlmDbOUXpJpG5BSuEZtf/Z2I40SJG/L22iEXaR/AbPPqKs6t9bdhjTof
	uO/mVn8OlEdyapP3T8n8KfuPnYJ/ZrhCsHIj2CzzNhhLu+6qerj4DTQazswMQW1eMFkBd9IpM12Yt
	MMBBwc6ZQ+KJzOXUN1lyYkqzmy5xJJE1kKnEWpa6Z82u+1DPn093AesKIVP1H4yJz3GzwotAKiZO1
	uldm0c/pi/iMdWwtsJK2mHZVEHRvHYCQwcp7ewZVMwI2s04Ihs5BAN/qMNijHWxqv2nNsPCfbyzHZ
	AduJ2jFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrql-00000006sYI-3qQC;
	Wed, 17 Dec 2025 13:45:55 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrqg-00000006sXZ-39jx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:45:54 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-37b96cbd875so48812051fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765979149; x=1766583949; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dt0E/6+ejHTgo150Lc89xpPGXdsq1GIskbS+HNFqx4k=;
        b=S5rSX4A8Q9L6TrwuXg0tbjtOT2wDadHNefowREEQcOiOCr8PaXq36qMQDHA6GG8hxW
         W3ClsSq+1bJLnXVc2ux3efmbGwBCJ5mTndM1r5b2lKQ1PO1Rkody1IFZeabdv+qaqaeY
         bvWgmw9EYbBvZiuiwxtDnF8SgX1WFfzNaL3M4Oc6gCY92rABnyEofiGxbvVvv5lWkBr7
         7zeb6nRynAohtm3THO8H+4ee+GwgNZKC1T3Fq+Ph9UP4GqPtnumV+UCMZRInndlHfb7l
         jCzVZLGR9NDnS+PSaeQRcPHOxhCAqALkbUGGbacN1vV1wMJZvk7zucSNWNE7w1wSmI3d
         VBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979149; x=1766583949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dt0E/6+ejHTgo150Lc89xpPGXdsq1GIskbS+HNFqx4k=;
        b=bV1dX9MYbg7O8KRpt1dAPOfdlVadRL55hbhcYiexf1bEZJCpRfQVBzuf2FCiA2ea80
         zH6YOrzUlnxZ4NTGjzY7rBl1TxRI1NqZgj0soVpGL8TLWYeOhBG2vdDkVes4MqYOV7UD
         +4GdvRp/QNflhvujysCjMNeEUylWqkj1G8mXBrseF3gnaPpSJ15wlF2Yj07CpoQLfPjK
         If3InywGtsVZFDMRzdaIJFutT8MtMfznVeaLbDFaNrVUvVHt6F7tTQ2FT1uPlra0nB+L
         8Z6lr/cMAHfcbj5ohoBrQK2l8mUnHo0YuKN45D5d870xA+75wxQb0Ppa0Alomq1ZQX9E
         HKwA==
X-Forwarded-Encrypted: i=1; AJvYcCVABy0sLEGYdDXW07a0qF6MZrAXYtDh4CcmTn3CNAFdnjUMbrbqI+dfQkcOYFULn7cTc3y01PDGPl51GZ967J02@lists.infradead.org
X-Gm-Message-State: AOJu0YyFUs9d4FhW1B5KGMLwyi0SvCaqxRaZMddQTSv/Wf5jk8Qxzbwv
	AZplJdUVYYSTVrNsVy5AuWcP3oJVEpJISAwem7O0/1y5vXcSTuVpPDWb2vjWCqdCJ1xQA7EZ+yh
	yNsL8WpLT/3bK5Ccos5QuqhcrRaM6VOhMHwerThmq4Q==
X-Gm-Gg: AY/fxX60zuUzS8U4TYioZ3+r/obbqUdtQIBnHx+jZCFVn2j5OccKu880xWeAlTBitUV
	Gu4y8+ucjxvu1a5t6tlTDk5jdzcJBJD2LwiUIQEHmzPHVChGdb+WICgsVFyAejWhii0Coj+er5T
	/lJpHC5Z1YobQ+VUuYMGsvKGrQTtXdrda0yTKKn6ihM7ropHVeJy6MtSXWmPDzn8/wSdyMDLEqe
	yIlGCy9mie7b28IpT2HL06q8cqjferIRvbGZ3Q9Q7qkNEOEqMPKnTqmWLnH38q0E/LMPGpMwFH/
	5cMjVw==
X-Google-Smtp-Source: AGHT+IExF/Q8NXh7TlarsyYw/vHK3VsdDnOYQrrieIlb5+1W8/+jeDq8koqzdO4UxR+bIVmBM4kl/UassN9xjO2VbIQ=
X-Received: by 2002:a05:651c:544:b0:37f:cb34:2141 with SMTP id
 38308e7fff4ca-37fd08be88fmr52413341fa.31.1765979148511; Wed, 17 Dec 2025
 05:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20251212063509.2002910-1-sai.krishna.potthuri@amd.com>
In-Reply-To: <20251212063509.2002910-1-sai.krishna.potthuri@amd.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Dec 2025 14:45:11 +0100
X-Gm-Features: AQt7F2pjYRm4v2emCNW0rzboNC08S4ZEgHkWublRSmLtXYtHl_cyJpaa9pQrJJA
Message-ID: <CAPDyKFrA7TiqX26BrSKaKeNyq8TRSoMpxvChuE1AhdVShvspGg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-arasan: Increase CD stable timeout to 2 seconds
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, git@amd.com, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_054552_583923_D389BB71 
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

On Fri, 12 Dec 2025 at 07:36, Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:
>
> On Xilinx/AMD platforms, the CD stable bit take slightly longer than
> one second(about an additional 100ms) to assert after a host
> controller reset. Although no functional failure observed with the
> existing one second delay but to ensure reliable initialization, increase
> the CD stable timeout to 2 seconds.
>
> Fixes: e251709aaddb ("mmc: sdhci-of-arasan: Ensure CD logic stabilization before power-up")
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-arasan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index b97d042897ad..ab7f0ffe7b4f 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -99,7 +99,7 @@
>  #define HIWORD_UPDATE(val, mask, shift) \
>                 ((val) << (shift) | (mask) << ((shift) + 16))
>
> -#define CD_STABLE_TIMEOUT_US           1000000
> +#define CD_STABLE_TIMEOUT_US           2000000
>  #define CD_STABLE_MAX_SLEEP_US         10
>
>  /**
> --
> 2.25.1
>

