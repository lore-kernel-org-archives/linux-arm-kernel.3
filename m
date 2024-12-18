Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451FDE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/YYiE8DrfDSJmT0Dm8s6zXYaOz1sPe9FboUtUKQues=; b=tUO0Bd1CVP+RQ10lpGEGzdGOkw
	0HS71z/C2gFSFq2d4ey9hOTA7U7qwJCKsS/5uKSdVG903tDveG72WF77PeAKAMiqxI+Pl7y1sDM3f
	2D6MH8PVm/3jq7gahnWX+m8atKd+3LD8KtLMuaosWsHXopYMnUYDMlqXL8dC3Ao3VUwi/tugGwuWs
	JXGKA+lJlZjtj+9HmKd895jyCRqkX4Vt5jXkaY07I3ISefJR0XASf7ghSpt/3QcE5rW6UM3Fp120T
	gTJA4TvxrSbnWGQDcJfyKEj0DiiapveJFJy/dnsLzfM5mkO43YIzN7M2Uw/pqQK9Rm+d/WiRE8j+/
	7fyB7Lhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrxU-0000000GP1i-2j7O;
	Wed, 18 Dec 2024 11:11:16 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrvJ-0000000GObV-2DxI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:09:02 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3eb8db8ae9aso2805455b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520140; x=1735124940; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4/YYiE8DrfDSJmT0Dm8s6zXYaOz1sPe9FboUtUKQues=;
        b=u5QhXbh0OM1z7Q62jVTjBoJvGStIiG2BWgT6LCBwYtmitp4t/KaFr1/xWG8vpUWpap
         01gUfqEp255akKjdO73MmfUFV36NODeIHexRfWGnTbp+WYFhh4umXHfyF7r/SL1URhr1
         FX92BcatwnXEvxujLD1lgXCHD9EjSFLQyQhqDFq9ntyyztH909+s6gZQtQidjHpsU2WW
         f4YsCHIghPrVQqLegxeKTqp+DKFvVtnhPWJbvdxgl1Eb5XtmLFDgIFqPuzsnfLmbKGcf
         FWCHqFxE3+x7Amu5HgOuuYG23Y20LAm72CptK2PX2uVLABHW3oDWDZ8KGSTh+GfoeKcD
         HY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520140; x=1735124940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/YYiE8DrfDSJmT0Dm8s6zXYaOz1sPe9FboUtUKQues=;
        b=uvVsiZi7pDh2jLhvc+kTGJgizhrRB6hSBo1JeLfInm26jpiXkcAVndz/mdpiQaTrZB
         J3Is6vbhz65nhs3o8kZlBRybGDCVSyDkVz27g6i9Fa3hXTE7LRndFacJJYBZeQnme3KU
         W61mxfMNw0q4MUsufUvjeEMlxg9lghWOKmg6EbYnvsB5vkmmlEeQhTZwk8pVZaF0gunH
         iJ0/GXv5Goj8s9FpMBXl6Aikk2lRrAhsvtG6hr6lGY9B4fRubavZaft+JL/WcbaiVEbG
         bKXet/bovE9LVZhzNGotkz+qHm1fr4X7Q6sS58B1DQOOPFDsR87K1vaUerqLBxfTan/f
         uENw==
X-Forwarded-Encrypted: i=1; AJvYcCW3iNsfEXd24NoDZ+earEtN7NrLJtXDqxaQ+QioTihXp55Umc+VHYragl1Sd5F6bTxAQKzPksDPTIE8ftUcFHKV@lists.infradead.org
X-Gm-Message-State: AOJu0YzmvF977AnnffnpJmD6ap4E37ii5M5Pf923pNaekW7FgF5dBIEy
	FrbFDnjv7Roi8Y6/YNVIBujbPDgSxhMDHwREle89wTDXSeit1gkoxBxwmS4EbcaT6vw0TnkcsNp
	vGadegoeZdbUuhJqmAOsTvwgAL5Q4zORSYH7YEw==
X-Gm-Gg: ASbGncsDgG1ExMvx9Alnj1fhAqeURIYCc1G97679EXVT86mMtKv0vqu5teDsrT2ScRS
	bDtEXGdqdvxhxM5nDgwRR7Tk9NkJIDy0JUu74n8s=
X-Google-Smtp-Source: AGHT+IEFgoxKdoJisFUM5ICD9pBhU+fG3s7zPXYhJrT/VXlT7HQqFQRQC9gMDg4S88yvTnHjNPAX6OW7RBGF95100H4=
X-Received: by 2002:a05:6808:10d5:b0:3e6:580b:d7d0 with SMTP id
 5614622812f47-3eccbf9189dmr1697114b6e.19.1734520139785; Wed, 18 Dec 2024
 03:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org> <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 11:08:48 +0000
Message-ID: <CADrjBPr82hvSSyULxi0k08ts2d1vO41qXvmr08+9wP-MB9fhvQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_030901_585454_3510BB5B 
X-CRM114-Status: UNSURE (   8.02  )
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

Hi Tudor,

On Tue, 17 Dec 2024 at 09:40, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Add entry for the Samsung Exynos mailbox driver.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

