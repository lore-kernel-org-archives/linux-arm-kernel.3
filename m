Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A98ECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOUisOdkXU0bOduvB/ByBLb4wJp/5x2Vdu+Ct3A15wo=; b=vZcjC2kgQLl9InknP0ZBK+1Jzt
	zvuXa5CAkrMkZjStJq7WXJrqoW34QzmaxzoKC8Hf1hq7PxFZvX7gz03alIz/GvtJwnhJRHcjN0lSw
	rBJTxT9sUjgF95Zgp49IjT7VH5+0TTdW+VD2LrG2CVlL0j5fMsaip1pvD+TXSPiP1Qher9oEA/gyW
	sCfhF1sBe240Z9GmJXHSyk3P6yux0TWW3IZ9KjBueHtlPrT61IPGKd32G4bL4V4JmKO/YwBBxVHZ7
	GsbxUU3TzMOI7Ur87g702Wpt0m2H+sdw4O9SjrioESXc1XaFuOg5ud1M/77JRiGC8dlFkDWYVNMxd
	yaxUFHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE61r-00000001K3i-29gQ;
	Wed, 29 Oct 2025 13:15:55 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE61p-00000001K2f-144j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:15:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-591c74fd958so7971234e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761743751; x=1762348551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOUisOdkXU0bOduvB/ByBLb4wJp/5x2Vdu+Ct3A15wo=;
        b=hU1eBVRsiPn9NvjDajjIe6nFV815St/7p4K0G/DI0aZ8E64oZD8B5aVnIv9AJrq4l7
         WSE+4GPyUsMRgGsEZ9Stmk8PlPGuYYfZZZY7ZcSxfkZW+gs2TympasgHK+yd0ykdJTXW
         fXYxlwkNgbf6MFndkbB7escEZq22DO2UM80NywhJi1/TVueuJudCoHBAGyz2qYw4nFuI
         Sqyub1poXxiLOeQo6srxy7+zZMDQcZzD2xMiwAxdZIurN6kOScdaQNq3Wt9hf3mJl1+K
         w7auBH4swHrIJHNrmjmPldBA62RV9mqvLkZmnzKBj1dbldIMQHTMwVCaTqIZmgMOW4MB
         eN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743751; x=1762348551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOUisOdkXU0bOduvB/ByBLb4wJp/5x2Vdu+Ct3A15wo=;
        b=Eij7hkWilGguFdUcF3YKryVskqEU+nZOdh2bQ4QcHZbNsIxyo+Y70CMZh98XCwKHr2
         wBh7tppIQbQCnmXOxqqd/BQj0m4dYVNMDW0AsCV5G74zv/RKHpoZhlxOccQTKGNRuyPV
         k+WMO0/j8IfTb2kos2w1HMGv9T2kewrgHRE4KcihvjgPYZq/HNzYZI9TKoZjgjTW+1mM
         PYreBFVZTE4ehKJMNUnhhPf4mZxLyC5KcN2MCIicva/NHpmxH02czJSn1NhKjIFA03t9
         H9Vc+YJqbddCpGo+gK+N46qFffgPSBRgr4M2d2vCyeWcd4/aYcTpl+WVQkOKSGty216N
         vsFg==
X-Forwarded-Encrypted: i=1; AJvYcCX5gN/Ye2qpgEKZ1f9p8S8LCpXEk3qZROPECw08ctpkvnYrGNuUmuoOmUNB3Ga/kItCo5Pn9zE8VjJwTprgghX7@lists.infradead.org
X-Gm-Message-State: AOJu0YzmFagVc7sM3l1rYczBMEvZZF8sSFhMyf++A7z5MEeeqHXVvP8v
	KqdQyuFfHGaQ8HiD4bVvFbNegpOa9lh7sAK7iUKug4g02cwCDsdreTdlGkKWtBQzm4IzrSipr7g
	PH5Cmhe0sMJeq6gm79iGbO1PKu0z0HHY7rCc1Mas9mQ==
X-Gm-Gg: ASbGnculF9PFsefnacOmKkP2ThpUs+ZRV2SE0f9Vmmpjb0eaPzuOYwGueV47A1CnvFj
	ePHyIeGgmhNBVn15ChuyY8huFZZY1/lSgOx1fB4eQ0Z+PpnN0FYCcR+p+mV5YOl9lWxVoG7HRi6
	p7D58t/HFAw0VYxMLbubE+qSVBHAEytsH5iZt7pVMqfbQS2anfs+ab+Fv9oxXDzTicjTzBEmcgZ
	+7uwexzBj/wGUtUUlOxkBrsxgqxYxoV24TKJAMiGlW3lEdczsGUr9ROp4yo0jY1Tar4wmFfnHpJ
	PJj36yBKqZuDvJQc5biTEpcxzj0=
X-Google-Smtp-Source: AGHT+IERc+XWdsch1n0sjpOQOzD+cW2IjfHO0Rpz1QeHwY2DnN9gsWkr3+lO2lQRgACmeZoFB2eG85VNyJBLdF9v7Qc=
X-Received: by 2002:a05:6512:e84:b0:593:5066:8e35 with SMTP id
 2adb3069b0e04-59412878b7emr1119097e87.13.1761743750670; Wed, 29 Oct 2025
 06:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com> <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 14:15:37 +0100
X-Gm-Features: AWmQ_bnxen2afRHV8wd2ApkjxBH0TleB__nu5t1NsDGu_HDLvXbdqDWBWRF_WWQ
Message-ID: <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	chaitanya chundru <quic_krichai@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_061553_314702_E8C85602 
X-CRM114-Status: GOOD (  15.71  )
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

On Wed, Oct 29, 2025 at 12:30=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
> Without this the switch will not powered up and we can't use the
> endpoints connected to the switch.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a=
9e436eafa3820bf 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
>  CONFIG_PCI_ENDPOINT=3Dy
>  CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
>  CONFIG_PCI_EPF_TEST=3Dm
> +CONFIG_PCI_PWRCTRL_TC9563=3Dm
>  CONFIG_DEVTMPFS=3Dy
>  CONFIG_DEVTMPFS_MOUNT=3Dy
>  CONFIG_FW_LOADER_USER_HELPER=3Dy
>
> --
> 2.34.1
>

Can't we just do the following in the respective Kconfig entry?

config PCI_PWRCTRL_TC9563
    tristate ...
    default m if ARCH_QCOM

Bart

