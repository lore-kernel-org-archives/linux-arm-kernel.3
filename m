Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE835C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=; b=L9Rd3zJKACDJxQyiTp4U3/t9mX
	0YkaI8uXNgvfnn62HY/YnOqiFmfHNzGuS3O7DGk4DPlUhIzTGjaLoNNL18+E+Cl4VG20MVDAglKJH
	GUCRdfwc4b6vOwFfSGgrmO8N0oiPjYA0lLQanxZxOEnJUXn4bBOK1OxvMfDjtd3KbVsIAdsU+m2KA
	JmrE1jiWHiNRcXkTQGjk+yWpiuKYSilRqVMHtinwxQgtADEdVw1UcwHPar7IKk14NJBPo/YGyh1b0
	NQiOhNb/ca7vfqexIQWVoS/yZ22k1m1Hj/raWHcwRpGO4bHYazv6M6SAn9T102Sd49UFKY8rqQFRh
	EBYmcHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDzm-00000001mLx-0lsU;
	Tue, 04 Aug 2026 12:11:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDzj-00000001mL5-3K6s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:11:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a063d211ebso5656047a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845502; cv=none;
        d=google.com; s=arc-20260327;
        b=IpEwjwM0JStxdldoZQGzDHwo81mvXqkfyiXgLtz+AhkVGdST16kWbNuVzoarAy4n/9
         zdUorz73yxvRocW/YE3mPS7cOD1JBkS1CQqLtH7mZZn2iAFI6jN+9MN3PvEZqigXoM5w
         O6ICAbn7YCDNFl0/1SMb92FVaypHCdQ+RkXtKuOoQ9/vdyNvo2OQGKixN61TFMtqZX/n
         PIUNVsOsjZ9uLobPgr7piQ1k2gC/48monHqdTMptpCtzyprsUpFCtIUHCub958Mz8cS2
         xYfZSxColrPRr65JKOs92gx+4wJf/5Ghi30XJt4qnf3FdidUL0kxVqxFs/ASfiZxL4sM
         riCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        fh=sHCLchZyZiHDeJo4U8C00AkDGUQYT1vtpEiZH/EyELw=;
        b=gp2WW1fM/kublJvo9dyC3J4sAuJ1mB3GrN1cn4n6MeUizL6rABfvZPhnW6yJZOXqOl
         LaVLBh0vtFCxkL6ivEFVlQnRRHpoonzcEqOsIdq66W1iruU+YbM1Ar0ggU0cS/OF26r+
         QBlVS+WyW4CoWUh0uQvdLGKweRp7VK/bF1JLNznE2D2kqjWV3skfIl5Qo1zQa4lyvP7V
         DqT4bYvudgsGiQGj5S+JZ94G1Q4AN0yjgZ3RIJWT8s/jvv0xRnEKDUVeNAhqoDyjmKBC
         E00Tuw4X6nnK4Jnay6p3YRNESeZ2P5qjCs7FwkDTRLMr0qrYjAMKweTaMsTDqcglnlkv
         4Atw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845502; x=1786450302; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        b=qtMq/kTVMhfB3NfLkTS7McgXNAoLLTxJl2Br/MyiY41ZPbPa8DZxZwQRe9mULyKV2O
         LPVe5jhu2JbjB5Pp3xNet1oBPwdrgzzPrLPvykOxqieXietnZmbQNrmlEmJDFfGzt+fp
         LrqPMbeMAca7z/zltZsXfCi2vCpels269ru6+sSMH0XPhnH/dqinudAfBm8V3PvpIIso
         GIP0iyap19gAz9TBeuV7W0zsqYnvMsvN4Q/2MuYg6fNQSw3PStjkq52PT5FoHW+iSe7X
         yrIncwZMVOC3KYp2kMzVUnMdk5QyhRqtO+i2n5beB2JiK2iLM9JWEXgQDOCZiAMsBz5e
         ATag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845502; x=1786450302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0BOXxAbTVuGKMQNaanorzcfB9Bd3BBit6YLVIa3kYc=;
        b=GMbe+Ou/h0U4J9O60VWGOE//RX7XJrlwQkdWv9Xajc+XhvWXisMu5NmKRbtjYMehzI
         w8fTUC0Je7r3LLB+1gsa8RirEbTGuCee74FvzFasPw3Gm+fiApzbPY1U6iShFZQadeR8
         80dzTliakXsdTW/c5sWkWB+BFc+rn8Pk5G9MdwBQyBM5OKY4i1IHBbgpKV6vTWFluvzW
         +KS9SdreV6JDc8ZG3W1Jy+eUIc42AkbjqsmaH0AVoJmvKDiSb/h8jUKMjEgCs879mthM
         DlWLL+oUUPwrlVxWcepWkgSB45jEg7mRGNdslQdgz0iPofKA8xKIqcqf0WzZCginitnS
         YW3g==
X-Forwarded-Encrypted: i=1; AHgh+RqDkZmfsO6cd/Th50XWXHO/7KkWdTJFKx/JGItJSrKYEfLeP04YI75o+1qQJ4zs2MFfBQbuQXv9+bjj42jlsimv@lists.infradead.org
X-Gm-Message-State: AOJu0YyGC55yDuihj7fK7grBvc9zevgxXI3fsQ7b35XXgZLincr1Jqxg
	o3wXc1VEbQHEai26O/Sbvag8v9tBvhNLlzKhgCFwmT879XR86gjt0q57ma7ELgaaPCY/EBGA6UG
	trHLZ1W73EfS7U80xR1PQZkATQISuHOUyLKkBnz2ykQ==
X-Gm-Gg: AR+sD137Wp5CmCw1hC8tGXgui5MZObb4dXswblQiL/kotg0jkmcmxJDG8Cgeyveiaes
	W1JDq4S5a96hWMIZFedPgLVu8k+NSc0Jyr3/CePvbRvrgcNozFvWAFNud0aaRhk8W2XXCuAImf9
	NurThI2cskPEA1bp51D7JOIVYtmFo//y2wZpbfDEwUcmyR1OcUUxHQLv7h0nVdNN14gG1ScuhJ0
	zMEWBlWAOlalvY+WiO1CuhecA9KXrGdXIk4+7ihtEzaXcikmbwsM97BjqHFVAq5dOYGXzSCzv0K
	UoJQz6m5vJCdCGQhSGpfydE7TjjbeeMBTu5zpMgfBWXfoYqSx+PP/9SusJ5Iy7qgHlqz50mbDqL
	zC9A=
X-Received: by 2002:a05:6402:a51b:10b0:6a0:c826:6494 with SMTP id
 4fb4d7f45d1cf-6a0c82665a7mr6874744a12.17.1785845501833; Tue, 04 Aug 2026
 05:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-6-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:11:28 +0100
X-Gm-Features: AUfX_mxMUwqUomM84AsdgBn375nan6j7Xy_5FQP7ITXDD-yyX2SPy00_MokSRL4
Message-ID: <CADrjBPouUvFVLDWwDDS=+1EBfqSqUz1HLKcLPLRyjB++vBy88Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_051143_852910_28CFA3BC 
X-CRM114-Status: GOOD (  14.74  )
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

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>
>   [required-blank-lines] child node must be preceded by a blank line
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index edc38f2d1183..bfceea5486f4 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -39,12 +39,15 @@ cluster0 {
>                                 core0 {
>                                         cpu =3D <&cpu0>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu1>;
>                                 };
> +
>                                 core2 {
>                                         cpu =3D <&cpu2>;
>                                 };
> +
>                                 core3 {
>                                         cpu =3D <&cpu3>;
>                                 };
> @@ -54,6 +57,7 @@ cluster1 {
>                                 core0 {
>                                         cpu =3D <&cpu4>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu5>;
>                                 };
> @@ -63,6 +67,7 @@ cluster2 {
>                                 core0 {
>                                         cpu =3D <&cpu6>;
>                                 };
> +
>                                 core1 {
>                                         cpu =3D <&cpu7>;
>                                 };
> @@ -1681,9 +1686,9 @@ usbdrd31: usb@11110000 {
>                         compatible =3D "google,gs101-dwusb3";
>                         ranges =3D <0x0 0x11110000 0x10000>;
>                         clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_=
CLK_EARLY>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31=
DRD_SUSPEND_CLK_26>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_A=
CLK>,
> -                               <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_P=
CLK>;
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB3=
1DRD_SUSPEND_CLK_26>,
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_=
ACLK>,
> +                                <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_=
PCLK>;
>                         clock-names =3D "bus_early", "susp_clk", "link_ac=
lk", "link_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>
> --
> 2.53.0
>

