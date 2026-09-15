Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9419C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=; b=VNUUqxpRxRlQDog89qaoCuZRYz
	Wnr4QXRW+8ONpL5a0m+MK1D8WJSw6xwcTFt1V586waSymOGOPWoa5Vhv0IlVgnBKB/4dIAMysrRki
	BMdAW350JUyOzPw1ABLPDkaM7nRGyWAlS7p/mlyZPcPMOTbgxOzDQB817RTjqed7IwJO0qtfB0iL5
	4XC2suAHyjEAQaDV9j/aESQD8P4UxEUP9tcgxz0UbzS++NNsRkx7hpQyP2Stvq8VtXzMocO0WFFpp
	rxm/bsW4ZR5Zeu4QZtLcK8e6/M1WJrQkKXvBXzVEf8lLDn1HCuOjxre7Yw0yRqnNTn1aMQqnYbW9N
	kqbYDMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UJ4-00000006yO8-2bs6;
	Tue, 15 Sep 2026 14:38:46 +0000
Received: from mail-ed2-x2a.google.com ([2a00:1450:4864:33::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UJ1-00000006yMW-0jR6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:38:45 +0000
Received: by mail-ed2-x2a.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1426514a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483119; cv=none;
        d=google.com; s=arc-20260327;
        b=Myyu6R5QX8ZWBzMuPbQ2HNLag5Km2ol0zWaUq+JMxFKq4h7nPrlkmaB8sMAWz64IQd
         ZTYhltnt47K+EbYZxuvAsw+fZz0QY6t/inaxmhAObzyidShlnlElmb0zqHAtqovvXomj
         bd/uBvDjwvenXbhQCImrEnXMHfeYsSIEc+/6bzks//x1J7QGnlfYX5rdxCNhnxO1yKt1
         gpr5k4ruzdrkTB3BiEIB0br8E5WgflFg7LAxr0gmH4DJgHG68lAvDgQtTFmfvtNObuVI
         TftVItFGvAIhIB+rvJs9U1paa+r7Vwl6uRb/oCFutqt8OzuWdkLF0q03A8xUqKlJDjk8
         t+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        fh=59Oyc0iSLpLfrcOQfjaDdXocMa5MBqFBC2axV9LqPdo=;
        b=fJlWvJbiNKei67T5gTBRgO4E3aXiJbj9od7aEybhOM1Fc+SH3s6oCjGJ8PL77fXym9
         3Ho/bpKKNXegQlr4Ik+i4bsQA50865oTxdzEz0cAJZ27LxDEeZubujVXqiT0kqBbY2GJ
         7/Ckq9YrxlUeJB35L8eq/G3Rzsz+iOW+KkhHTKFQdAZk24UgpLS4qXQwtqQuMvXaUo6x
         RpPxvoNMWQ8xiAo87qeVO8g/n9td51Kzs/o8lz3O3L2O130NjnArPuP5P67pmhAgrUXw
         4nNbDHPW5wMM7+JZmfGEcKGNIncgKoL/fWLTZ5AKXRnWaXo9YDbEYfRn+I6zKcmDavGS
         kDJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483119; x=1790087919; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        b=Groi7SYlq9muxXE0NICBIXeYdBoG0NdGwNOzaDqgGcrLeaw0Fr4juI+0l0NWWWIhEI
         SaOWFktALwKqW0h/+LmZM/QuqgGJfb3tygEn8KZWFNmwzbVKW9n33Do7aP+QMKtOWxyJ
         Ds3XTepnhqLUlDvWdS7kKbBj2hhl3HF4PoRUsjoypGdocU+55mHOta+e8aFaQVG3E73a
         VCKLA+QTPbE/CEOpsdQ7OFDiB3v9S9lShTcr9bKRqSHdQkNmG0Z+T8IMwBOsjWy/G9Bl
         JIpR9OBwZ8BoZw8YbMrr+CiDrxF7yWpV4yMhXC5/PkygL6oU3/OdPW5bCPqwalzm4wdo
         XPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483119; x=1790087919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        b=lvOR4XULWMcKiI/U6aDmF6m7n0BJpy+0h5Qa7qkS4Kj9c92Py3+JWJr7puSPzLoaC8
         YAEemmpSw7SE9PIQT1B/Btf3Dv0T1vY9ZQKgbnWNc/T7TflKhIZf70Bnzcj0i+0oNQnv
         wrmL7XoN34mVyE5mRV2F14PiRwduVHXAbCwpZWw5z01UxYZbZcmsGU19A4LdynhiVny1
         FavQ/w4D0RaRR7IG1RSGTrVNrhtooaBLOO6jIc4oZOzOQdso3oyThynOjJoDtzcqP768
         K7rvcMaMq/OxgdgT/4SvA3TZ0u5rnv1ozKm5GhGxg8EW5TjuSLgVsGznG/69HE8JCHSa
         e2Rw==
X-Forwarded-Encrypted: i=1; AKwUvByZDPBAU2+NwJ0ITWIT4wCp2FxvYIrfaZ8eeFDyVO8P9edzbfecsmrr+zGub9wk6I8684e0Tg42xt7Oh/7fyZXS@lists.infradead.org
X-Gm-Message-State: AFuF++kzFIrvgApVbUbNI22eDB038iuaYu4Ar1wte8mm/rPqayVMhsJQ
	qs9PEA4ios+bV2qa2q5pB/e2KcsF7nZM4zomNAjF9OEZ2cOeXr2Lyy9uum1ccAsbUBwKKCMWYmB
	mS1lmliDAYORI+bd5ymZQbk/NmWMrQY44KVIgIdsU/g==
X-Gm-Gg: AYBFou2hCT0Jfyj6AJaahF+JIIRP5QeuTjJjZ/b3Y3DfoEbOjFeucf3PrFCdyiFhdEv
	pukOu985qGwUZ3zOv4/52PaIBv+22In5yx/DljW7QhwneJWNBmHTZgwvfpG94EehQKuiNLOLhX8
	TjhrUlDU0neDNtmn3eCX6YbJsO/lZ1wC20U8M1vuOTUuQQa7i2ruD0/XAkniR42hdSFPAJ3deE4
	/K0QmENbrqJVw/v6zleaPp3jgZj8BBQUucsg+lh/15nEFysAULsU/l1BnhCWkR9r0qLgUQGCjvT
	4dGsBaneuoL+gKfJ84FylbxSyuhMO0DtJp48OUwFzonntOrgWAJEE8wyKAp1LTY5OLSAHH4JgiI
	aH6zqb3gQ8rwc+w==
X-Received: by 2002:a05:6402:518b:b0:6a7:f7f3:66d4 with SMTP id
 4fb4d7f45d1cf-6a9f63d1831mr4622791a12.24.1789483119518; Tue, 15 Sep 2026
 07:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
 <20260831070309.158069-1-selvarasu.g@samsung.com>
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:38:27 +0100
X-Gm-Features: AcwNN1Xw208DqxP9opmiR8ULGxXcGVSbiimmOgDikZLNDndPPFL37ybJKwgPW5Y
Message-ID: <CADrjBPq9v8brtXt0y-FJhSPMQQirkRLSK4QkcafWO+UdbBH92g@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, pritam.sutar@samsung.com, andre.draszik@linaro.org, 
	kernel@lvkasz.us, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, dh10.jung@samsung.com, 
	akash.m5@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_073843_259854_08B5900C 
X-CRM114-Status: GOOD (  25.88  )
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

On Mon, 31 Aug 2026 at 08:03, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
>
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 8711a3b62c8e..311d1c25eb3e 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
>
>  struct exynos5_usbdrd_phy_drvdata {
>         const struct exynos5_usbdrd_phy_config *phy_cfg;
> +       int n_phy_cfg;
>         const struct exynos5_usbdrd_phy_tuning **phy_tunes;
>         const struct phy_ops *phy_ops;
>         const char * const *clk_names;
> @@ -1164,7 +1165,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
>  {
>         struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
>
> -       if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
> +       if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
>                 return ERR_PTR(-ENODEV);
>
>         return phy_drd->phys[args->args[0]].phy;
> @@ -1993,6 +1994,7 @@ static const char * const exynos5_regulator_names[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
>         .phy_cfg                = phy_cfg_exynos2200,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos2200),
>         .phy_ops                = &exynos2200_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS2200_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2006,6 +2008,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .pmu_offset_usbdrd1_phy = EXYNOS5420_USBDRD1_PHY_CONTROL,
> @@ -2019,6 +2022,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2031,6 +2035,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .pmu_offset_usbdrd1_phy = EXYNOS5433_USBHOST30_PHY_CONTROL,
> @@ -2044,6 +2049,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2056,6 +2062,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos7870,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos7870),
>         .phy_tunes              = exynos7870_tunes,
>         .phy_ops                = &exynos7870_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
> @@ -2069,6 +2076,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos850,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos850),
>         .phy_ops                = &exynos850_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2097,6 +2105,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos850,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos850),
>         .phy_ops                = &exynos850_usbdrd_phy_ops,
>         .phy_tunes              = exynos990_tunes,
>         .pmu_offset_usbdrd0_phy = EXYNOS990_PHY_CTRL_USB20,
> @@ -2629,6 +2638,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
>  static const
>  struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
>         .phy_cfg                = usb31drd_phy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usb31drd_combo_ssphy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB31,
>         .clk_names              = exynos5_clk_names,
> @@ -2659,6 +2669,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
>  static const
>  struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
>         .phy_cfg                = usbdrd_hsphy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usbdrd_combo_hsphy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2687,6 +2698,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2863,6 +2875,7 @@ static const char * const gs101_regulator_names[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
>         .phy_cfg                        = phy_cfg_gs101,
> +       .n_phy_cfg                      = ARRAY_SIZE(phy_cfg_gs101),
>         .phy_tunes                      = gs101_tunes,
>         .phy_ops                        = &gs101_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy         = GS101_PHY_CTRL_USB20,
> @@ -3020,7 +3033,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>
>         dev_vdbg(dev, "Creating usbdrd_phy phy\n");
>
> -       for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
> +       for (i = 0; i < drv_data->n_phy_cfg; i++) {
>                 struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
>
>                 if (IS_ERR(phy))
> --
> 2.17.1
>

