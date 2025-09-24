Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153F5CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYxSqnIQ3qjG/8iu9AExs5DpSEa0GvyoBl784AP7Qs8=; b=Ybk60YToiZtQ5f/6qrN0AgdtNm
	yIxP773WcTjmVDrqsz/Ijm00ZquJ1GUEFKbqPSZlUjTvV40O2TFb96y+u1ai535W2W3rxmOKf5bNf
	PbBKieEEJN1ETZLX2Buko4TJpqYoVOuXiZ8+84BgkgQ1kaAuDyyCl7itqYFkSZxmvssP77IUB57Mu
	Bj9xMfV4V6dH3t3WLZs/pOsNtInq67g/Vl6T/V9RGZhK7l35aYkrgPa498pSHefqCGAlpxJyBFlur
	+wqC/0Pi8FSoh7bd9r4xaqdrqh7X2x2AB1mJTkYRjuA8bdjP7Z/YN/GLjJPAfIJAuoBTwcdba9rg2
	R4rP6afg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RMJ-00000001Dez-2yHe;
	Wed, 24 Sep 2025 15:24:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RMG-00000001DdS-1YJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:24:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45e03730f83so31193865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758727478; x=1759332278; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fYxSqnIQ3qjG/8iu9AExs5DpSEa0GvyoBl784AP7Qs8=;
        b=xj7zPyAjjfDl3oHJMF9L40z/uNvy9nueT6uLGS+RmWIPXoaHEXhB4d4zCqj4dS4wDE
         rpmgk54MkK/bq8OanoU12Exp3CT42t1V4oVhcdJycErIxCg1eLcHmMSb4FIPyA3DMLlM
         jwukmnF6F2MhWPaTORIvE/CdEIB0MWgzbCZ3xpiPXVKDiWc0A/Bto3vtbBGfO1qReNDH
         Cok0XadPc9GzQYEp1ga32pxsvstfPSlDgJs2+BwqAZCo4Auo2JXHmF3suRJqITvGsLTC
         4zKu9SyISfaZvMWNMUSa9i6a7+o4uVrpUJHHLFk8utlyUs4iG7DL02b+0ftY+Ik2qI0F
         cbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727478; x=1759332278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fYxSqnIQ3qjG/8iu9AExs5DpSEa0GvyoBl784AP7Qs8=;
        b=mQCdwGrQFZv6FrqcIc7v8SYYLKNOcPUzLyWMOWOxrMLrnokVI7349UoaoIZ9bCa3oO
         HW2rpZ0b5sNGj4MRwBVA/9RTKcFKj5hLnFSae0ArCUTkzQFtox7BlQa2HVVZuPwRXCE0
         HePollN543igM5EfIAc96DWbrTtstwLP7uGk/MQyoATHJbvYPqxWIPSHUi4Rmd8J2Deq
         TgBAtNyydWOo9wyTTXopPEWWCq794TSIxNSN2o4j8N7RmPjwlohzlZYbfc3OPoKcuCDz
         O64pHQwJJ4eR8IGjDXy/w/KKwztA5IAckz5wxp5kJXK0NtO+wFR5rdNIyU9BrrhhTNwO
         5iDw==
X-Forwarded-Encrypted: i=1; AJvYcCWhNc1TnR/iRUWuwcbTLpKaDz8kOE8XShEaJ3MVr/XFmLiH8v4dUj3UPJHuHFCnWPrTt359hlaA7CcZLAf9ZeJm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcu+KnIPQBV4A44/T2U9GnR/eWdzYGCJoD3AswtBNgEdSL0Nbw
	wtjqK/uEd3pqw4mu0XKH4iv7KHzG0Dds2YKu2mdTjGs2I+PUulz3ekkk0i+X1mmtSww=
X-Gm-Gg: ASbGncsPfWj2uXpAqtTde4W4VBNCDbP940TgdUXWLDbtka5vjQUhMTPUgAF1yWuRlL1
	Hp/6yIW9zoVOo5H7/eiBgUGjZuknZVw7DUdbkTiG0zVv6+CPTOY9iqYMWxp0Bku8WxuSLhvzsNi
	YiwmQikz+C8gRzf36ZSCfXWe3c1E5LIHNd8Og/DH/NT1R5QkCmP29MwvhUxND06i9FgdqIIeEZ2
	uB3Ag22+ktUZQHNHUOv9+4CsYs5CmXLMmrnj+5ToKD5ZuBoUMKj/ZypK2xJyBNnMKzOpi9eLuAW
	lMXLM6JONDQSp8HPjqSajmsJtc4UOJngEdk3qHB+BsJbQWVbAimPEbti+rGwqyynYBqxW9K7hxO
	LGx+tsCMg4qeC+hQBPHYDPJ78Xw==
X-Google-Smtp-Source: AGHT+IHSVtQc0PcF907T9ysNH9gXQFv1R4nZa4WXYglWRwMrUQrvL7l25ij/5cog4d6UrbB58i1fUQ==
X-Received: by 2002:a05:600c:3583:b0:45b:97e0:22a8 with SMTP id 5b1f17b1804b1-46e329eb144mr2418835e9.22.1758727477928;
        Wed, 24 Sep 2025 08:24:37 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac582sm38510685e9.9.2025.09.24.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:24:37 -0700 (PDT)
Message-ID: <03cbad1f4f311727b4dce9c969404e2bc138c556.camel@linaro.org>
Subject: Re: [PATCH v5 2/5] firmware: exynos-acpm: add DVFS protocol
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
Date: Wed, 24 Sep 2025 16:24:35 +0100
In-Reply-To: <20250924-acpm-clk-v5-2-4cca1fadd00d@linaro.org>
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
	 <20250924-acpm-clk-v5-2-4cca1fadd00d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082440_761053_7F46F18A 
X-CRM114-Status: GOOD (  11.68  )
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

On Wed, 2025-09-24 at 15:11 +0000, Tudor Ambarus wrote:
> Add ACPM DVFS protocol handler. It constructs DVFS messages that
> the APM firmware can understand.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
> ---

[...]

> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/incl=
ude/linux/firmware/samsung/exynos-acpm-protocol.h
> index f628bf1862c25fa018a2fe5e7e123bf05c5254b9..e41055316bb578bb8250a1b11=
77f1059eeeb2611 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -13,6 +13,15 @@
> =C2=A0struct acpm_handle;
> =C2=A0struct device_node;
> =C2=A0
> +struct acpm_dvfs_ops {
> +	int (*set_rate)(const struct acpm_handle *handle,
> +			unsigned int acpm_chan_id, unsigned int clk_id,
> +			unsigned long rate);
> +	unsigned long (*get_rate)(const struct acpm_handle *handle,
> +				=C2=A0 unsigned int acpm_chan_id,
> +				=C2=A0 unsigned int clk_id, u32 dbg_val);

Everything seems self-explanatory except this dbg_val. What are API users m=
eant
to put there? Maybe some kerneldoc could explain it?

Cheers,
Andre'

