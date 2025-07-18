Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1145BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 13:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYpcavPW85ROVk3E1axG+f3muOD/wyEeug4NFZEIWg8=; b=eL8ODYWJbD5P1EEVMJljOsl4bE
	kKE+wOm/3u7A60B/gGxVN80Rg/ibKZfXMGcJMRHtLrjxX6AEYr3LmO+mPN8zuasdGeiErIcLgbVAR
	ZHQ0YV3TKk+lET78SuxABwPEmWEQpKIvKFKPhynQXRBjrrJcPqvXc4kgcWmqoxBPFARZXsQDzwEgN
	u4itDlFZmeohl6gOKVw2rHEVKrARjc1PZXcv228hy3SbraZIHn7YqTrh2L8iJGiTPHJRIKhTqgL0s
	WcAlcz4Cf7cYQqCR+GH7yals5oFTP8gkxFGyPMpF2HV63foEvx262A48gvOBe6qPjCC31AdfZIKNa
	PsqG4RYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckii-0000000CeCi-3OjJ;
	Fri, 18 Jul 2025 13:01:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckgF-0000000Cdce-2EuD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 12:59:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73972a54919so2121064b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752843555; x=1753448355; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PYpcavPW85ROVk3E1axG+f3muOD/wyEeug4NFZEIWg8=;
        b=gH1R4NTz4BUShEpeeW/rkHn7+lFnNnv6ksOprVs5Aw2mX7ZMORyzMQ1bGTovhYWNW1
         XlXDL+4mnqEJeBgTMLWeW+swao+ipMyMjWoZCXetxHqvuYS5EAQMAj/nLIc1Q/4FBRHU
         K63DETmT2SphwhOfNES25N+1e1oy72WsgWxxdTbcj9E4eF3YjLP/CHR2k1GVBCwfmFxT
         SLpE0tyPEaNKw9OVFTQkLYGxVTysIGzbER+MnYtw3hT95c8xZxkMv4uFyN+0s4Ksj4ra
         17FADcu3FIo70JGz0x+gL64r+5XJjp1mttwUFSXiV4WXszTHuOGnkjXBUS6dXlSv7ay1
         DRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843555; x=1753448355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYpcavPW85ROVk3E1axG+f3muOD/wyEeug4NFZEIWg8=;
        b=NFm9Us+ZGkJsrDNPDlsiXR1rsigcdRqYSipLcvObE05dR+kPoTxvM25yw+/REiw/4W
         OnhZ48f+0gEoHA9U2FLgByLbrFkyeY+BJAjnL15j+Csu8kapVU1+dFWqSCj44dRguE08
         wJs55NpN4k8UO+uuCgRt6lEOkkw+Ryy/ffHWJF/fezEArxrMVobSyWU8dYOg9Cgj45o6
         OKGGeVB13GXq0TjpPa45Befnp2bQA8Ot5UvX7CtQ8tq2binBjea4XZSwxZbPq4vYjR/x
         eciBH/JC725WQ0YTn983ffWrBxE3AgW+sZ6fvSbOw24/EYujgRTuou35LhjCQYirkfZJ
         rjAA==
X-Forwarded-Encrypted: i=1; AJvYcCXd8OjB8vXB31DsPkDs8mfdcCqbwbMpb5D587oqIYYF/INiWozvoExo0VG/UXH1bhZ1TmyvbvsH0aNn5SvJnNpW@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYjDyBZC6hlbHsgj/CVRqUwiKKVjCmhmfXtBnLVwQo/CXVvkO
	MXVvfBrcHB9dc/u5W39uok/xcjMKiTuVpHgdQLS1K/bnXchEG32yiJcoH8TYkK92raEWSL3I80g
	pNY9TV7TkL7xPuWDnfALDsWDxC9tEToi77Qp+VuvLFQ==
X-Gm-Gg: ASbGncuL2GhSUX6EqJ47eF3S55naMqEhO8qbzavs12wooCPCFC0LTodX5kDE+l0pgAI
	HKVe1Mc9KpCzA1A1zG+4cBrbpy65RB7WTHuyj1nYCjE5qw1BMXrQ4od2bQrOsXXKsMcXevGGpsH
	cPgNkAbTNYbcpp0QkSE7dg+auFAogYFTp0y9IA9dHcrxMxHiiHEhckdD1stNcTwE3MVX/VKaUiT
	J2WmAj5p9LPkyhsJWE=
X-Google-Smtp-Source: AGHT+IHDAc74U25eHKTb9aulfz0KG+bpqSbOJrJeexu2ZAbE44hVvJk6HDFdKtlGLhZcV0OjSUhQj942abhhql0IydM=
X-Received: by 2002:a05:6a00:bd84:b0:748:f74f:6d27 with SMTP id
 d2e1a72fcca58-75725480a1bmr16226717b3a.24.1752843554551; Fri, 18 Jul 2025
 05:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250718094848.587-1-alireza.sanaee@huawei.com> <20250718094848.587-6-alireza.sanaee@huawei.com>
In-Reply-To: <20250718094848.587-6-alireza.sanaee@huawei.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 18 Jul 2025 13:59:03 +0100
X-Gm-Features: Ac12FXxq5RyQqwd6GSdHy6cONAY5fWKaaHEWBZ5tvug2yoehd6FJ-cPiMbA37wc
Message-ID: <CAJ9a7VjdF0a_5gswt5j+LX9_pxK40ODNpYiYUSmYfsWZYA+Wjg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] coresight: Use of_cpu_phandle_to_id for grabbing
 CPU ID
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jonathan.cameron@huawei.com, coresight@lists.linaro.org, 
	dianders@chromium.org, james.clark@linaro.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linuxarm@huawei.com, mark.rutland@arm.com, robh@kernel.org, 
	ruanjinjie@huawei.com, saravanak@google.com, 
	shameerali.kolothum.thodi@huawei.com, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_055915_570790_52324D3F 
X-CRM114-Status: GOOD (  15.93  )
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

On Fri, 18 Jul 2025 at 10:51, Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
>
> Use the newly created API (of_cpu_phandle_to_id) to grab CPU ID.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/hwtracing/coresight/coresight-platform.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 0db64c5f4995..95d46ea08936 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -167,20 +167,7 @@ of_coresight_get_output_ports_node(const struct device_node *node)
>
>  static int of_coresight_get_cpu(struct device *dev)
>  {
> -       int cpu;
> -       struct device_node *dn;
> -
> -       if (!dev->of_node)
> -               return -ENODEV;
> -
> -       dn = of_parse_phandle(dev->of_node, "cpu", 0);
> -       if (!dn)
> -               return -ENODEV;
> -
> -       cpu = of_cpu_node_to_id(dn);
> -       of_node_put(dn);
> -
> -       return cpu;
> +       return of_cpu_phandle_to_id(dev->of_node, NULL, 0);
>  }
>
>  /*
> --
> 2.43.0
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

