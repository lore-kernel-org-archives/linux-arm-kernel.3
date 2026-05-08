Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D090CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=; b=J5SwgkwHnBNKtixreA2NhOXjtj
	PYTBqmokdOfAmMEeemgtDi8Px0xdI5HY69iCytLnb/dRdWg/C6UCuOiisipgr0e7g4r2iGMfF9opA
	hEKrrVJIT5/Z/vFAReuPXN4ueJYv/Nb4KWw56E0rU0erF30qT44gYe3/c0dPInw5wcTPlqBaLxI+N
	3jFNLxh4Mlxs1sVToCvr9PdqeZTzopO/mFm+ioZ4rRzY88gEOK6hUSI+qdLAVy9sxiMdIM6V6dijs
	LLBZXkUhpKHArOm20/sumq20AdK2i9hHtPGTsdKLRFyBwAP3gd4kI7oeka0KXVf8tczyXaCv7nuXy
	At0fU9jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSsZ-00000007ZUP-3KI7;
	Fri, 08 May 2026 21:37:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSsX-00000007ZTi-1TXP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:37:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-bcc1459daddso1429266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276219; cv=none;
        d=google.com; s=arc-20240605;
        b=WngMRG3ySbukUkufAD6kvlgWmZISiOMY8XlP+5MHkweezblnqThEXOiLt0QBeyOhAQ
         Xw8cTZoTq4I+IAMUVnqEd/bhmJwe8kKEHTa7tfzh8XYkrEMCd9QzCIqIZeJx8yXlkva+
         rH5n8a52ksujz7pIMu4lJD5NRIXdSpI/BKEOLLOLpdKXDxmZaPK4Tz2NKrQ0ow+OzmlN
         lcP7CtyxIlVqKBr+QJABAzFci9m0P8R0byLw40OE0iYkmwMBrl9WjEcKmSXkeHhskZjE
         /FxCmfzkZ8M/q8u8KJ28Z02beO18AxZVhcfTGL4iMIpl4TC2qXIVSQTeM7I+tocqMw5p
         o0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        fh=81ehMStQ92Jgm2dJ0TRCimqMNTVR52nc11hNDTx8w0E=;
        b=e5ygKR+NJI+9lJQZ4SLVt6DzvxVr1sht6N2QFEZ1HXUygI94Eo9CgqJZYc9xRe7Amb
         +89OrO4QXL/BoIXL1tnb3FpgfiDvf5unLCQ7Pbv1feWFo0fBmYj5dbk6quwqm5KyR0Rc
         Y4XcMwGtn1Ejv8YGsWxWrBnBM+6mZ/dLN4a0VsoZSqlNJtRUxqZ/kzoKRzOTMHhVSkaw
         V2bbfTzJY04S5TmQkQorBw11VzbQbCQOPujPxh6lIvkRAzOs5ChzG2cU46B4B86DCCbD
         YDXer+fPnRjHpWdARdPjiLJ8cumElNhBGm9ULPZw0ML08OM5YamvB6brkluj7y8pYLAL
         nOKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778276219; x=1778881019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        b=lSgXFIcWgdwRcdXhPSQNwr80dJo8NNKPP/AvfKMVbsrvEONabkO2WQTs8Gh1BJfLA2
         R0+58m4iFRuxhC4tabs8NUyC4CxPUoBbr6qTu+DwN4Qx5aUomw2LBHlhQ9F+WYda3nzn
         Ykxm9EkD7YeNkCmPvB86W/HJAPwSYd5u4qiaEJHetTa0ousFXhd6RFtujsKieAbMJBye
         +qYAKaobvBTIr/mxMLpU0p15CgYQi9yMnlTlbL442fZG6s6rUvjQpK/wxAhmM6I/FEt0
         oSc5YCb9cFi5T36yfsT0O0cxiYOH+u9uh2IREsBrmC2mIIbLQhkZ06RyIviCndIIUyRd
         q+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276219; x=1778881019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        b=f8aOZsklWMXOASaKpXs6BvVM2GYAaUTMZ4iI3dibNbLFCUuIi6YP9OVJ1UDnf7QjyF
         Uk3YK3qxUYsPDrNLElwbsdzxI/RQBVxWAL+dmHNzjonzRUfawPI6NYtjzpJfFqdzsWSy
         npm3KE+2osIjT/laZxUONCnzOQaUwl9UDE6fMrH2R89/u0jnw3qfYaPCNlMyUbVxYFn1
         qf1B8oHumB+35eSumavd95P5LkMAl5COyP5fYSMHirjplGHmtNjzhMCPg/+dE16P5CzM
         AVnpvt205NcjSZgzY7EW+Y/F5LHLo1yi/NVAB5q4t3L+RQ+gjN3BmmJKvNDdI1Pz0wnB
         nyWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uWmNTJzi5JpS9UWbV2Owt695LUx7H67dyhTHL5gh23xJguC8ksPw+RBc/ciKDe/l6CL3YKFrj9VaFukkDPkrM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0vigFU1EroMm/Aj+B7RclhBKyXglAMA5q9UQJ0pLQ1W9wG2+S
	OjNckWhtH8ztfoREBNRo+/i9mZiiAf2IZW5eJDE3WkXlzYD5OLcFsqGYtYGsDo+P7ETEbkfDlq/
	KZIsv6zeZVZPSN8S+8ivzq/7vxoOvPv5vorCKIA4NQQ==
X-Gm-Gg: AeBDiesm3Uy62jqYqe1rv/iftYox78yenpCZBuPPqdgN6/UuUtYOTMrdGP2uHi/LgSF
	3Yup0Mb0nXfHOTxtKcuzV/BkzAsrOnAtgs/yeo4aM0x695EtmMWCdWVV/Q+CUk7bMczSJRm734f
	FgEr6dP1WPgVl36DQ8Ab+JgYEZ8Qmdtbs/OFWsd+KU+4Vp/JLNanI6g2MdgQRu4Yb7UdE2vdXVc
	SYOGE3ihZDvTBe7/yQMscx2gUz0mdjvMkEJ+9p8R6qemaMRcF/Xb5F4o7qWMJ4LQs1YUMwAIPM7
	rNsPHN5edd/ObuV2qvB6/ERBQLMSls4BoE31CpMrdTyfiO/6HR7p
X-Received: by 2002:a17:907:3c86:b0:bc4:b9d3:1013 with SMTP id
 a640c23a62f3a-bc56ae28594mr895321766b.15.1778276219194; Fri, 08 May 2026
 14:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:36:47 +0100
X-Gm-Features: AVHnY4LevScaePRxr8LSmmB5UEWK-uXM16Hv4m-ApBUuggC82x63FXuRaiJglDQ
Message-ID: <CADrjBPrgkugu_smjW=MH+iDEUTKLaonqkSQBzjUFyKms5p8W0w@mail.gmail.com>
Subject: Re: [PATCH 6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_143701_427373_9036C55E 
X-CRM114-Status: GOOD (  23.20  )
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

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Introduce devm_acpm_get_by_phandle() to standardize how consumer
> drivers acquire a handle to the ACPM IPC interface. Enforce the
> use of the "samsung,acpm-ipc" property name across the SoC and
> simplify the boilerplate code in client drivers.
>
> The first consumer of this helper is the Exynos ACPM Thermal Management
> Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
> register access from the Application Processor (AP) is restricted to the
> interrupt pending (INTPEND) registers for event identification.
> High-level functional tasks, such as sensor initialization, threshold
> programming, and temperature reads, are delegated to the ACPM firmware
> via this IPC interface.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 2cebc5456968..a663e15fbad6 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -857,6 +857,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
>
> +/**
> + * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
> + * "samsung,acpm-ipc" handle.
> + * @dev: consumer device
> + *
> + * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
> + */
> +struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
> +{
> +       struct acpm_handle *handle;
> +       struct device_node *np;
> +
> +       np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
> +       if (!np)
> +               return ERR_PTR(-ENODEV);
> +
> +       handle = devm_acpm_get_by_node(dev, np);
> +       of_node_put(np);
> +
> +       return handle;
> +}
> +EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index 08d9f5c95701..83cbd425b652 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -71,6 +71,7 @@ struct device;
>  #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
>  struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>                                           struct device_node *np);
> +struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
>  #else
>
>  static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
> @@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>  {
>         return ERR_PTR(-ENODEV);
>  }
> +
> +static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
>  #endif
>
>  #endif /* __EXYNOS_ACPM_PROTOCOL_H */
>
> --
> 2.54.0.545.g6539524ca2-goog
>

