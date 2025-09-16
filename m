Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322CCCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+Ij4gEe2LcS6vPzM/CR57NuWgzn7Jx8huZwedt8Tqc=; b=oJO7ast+nLctax/Pki5zfhZNfk
	SJFCjr5cLbW8Htg9PGFwxCDUVfKuITkOGfwohVaqya2CCSsXLIUX2ac61D1TjUJu04m/R2jNIkKpO
	kFisjQuy+APpYSaENvu6NqeOZXGQoyES8pxHEF8ur29TqYcIfdZQsVbYhc1p5sg3TixSaGiDrY10i
	SJc02SzHutNcU9Nxde6LZeGWjwbHfW7bjPCWt4w8x8o8aSY6NPOZ5hakcIqPdIaLDRHOhra2T+rRt
	2sFWIajA002oCOtN8l7R0ItVqaTAbrS/+LN9fN7ELdXSSHS0vTfXvs5+8Fw9F3yHALUID4mPd7bqN
	tj7nkYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOYr-00000006qVc-2jvd;
	Tue, 16 Sep 2025 05:49:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOYo-00000006qUu-38Xq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 05:49:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so3451267f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 22:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758001740; x=1758606540; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Ij4gEe2LcS6vPzM/CR57NuWgzn7Jx8huZwedt8Tqc=;
        b=Wefj4erZWtIl73VejTSw7nKgPzVZK12jk8TCAeCEorsTh0upihsPAQ5O4MjS/39Lmw
         ozPI51bDmHm/vct02grdXulaYo542oI4zOxL/4Bacg4dpwWTl7vzCkwMaknKysOapC48
         vJaRv0wjP2DWJRl0Xt6TlEyC3PXHz8fLLh4+4flw7avJi6Rc3etFZb9f4G0Xn1DJzrRC
         LRHWU/gEt5Awq+sGOiBMLV1gRGKfNYpiavGTVDVePI//Mob7E07TAPNC75NFh/F9N6of
         ESzxO24LTrA2j4lgzWqiGm0TLnmt2MVE9jtTNGwUMv8rOg+APm6Hr76K5UlQfzuHaSnb
         0U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001740; x=1758606540;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2+Ij4gEe2LcS6vPzM/CR57NuWgzn7Jx8huZwedt8Tqc=;
        b=eEcNtUZHjaihd6WBC+j99F7AX3kAZhssFj9x6UY1T3zvX8CgkqSaeS+NOw8Ao7RE6D
         6s24S7jaMyvp6CnLrthNcc8sBoLRV+aGrudHQhrHz63r1fHftb+q6g9DkHI2OTt+DJoc
         MaK155+Knz4Ub3Yd9xHgv6yHjZ61YyETLNqgaxEk9W3rmbxnv5ruqFU3Ocaqf9I+oKpK
         3HU3r6VLetIULW3DhRu1PLP1UWu3mYxmp6afBHgR6HAJZ/JobvS4X1YJoJXZ9pJwkbu6
         sNcz1ay+5QFzxGjAWGu0tqkSP1Bpr1LVKFkfwx9N48itNkYRamykftYxnrUr7SxO6PH7
         lfHg==
X-Forwarded-Encrypted: i=1; AJvYcCViy+gnBVmGBcZ4T/jp1O71zvjzs2AdgFysRYe+vZhCdr+on2BevmS5fZlIqjZbX+ZIRO4QpO3GTJ38ZuOo3Qgs@lists.infradead.org
X-Gm-Message-State: AOJu0YzzupEUyvO/5CtbdQxHkwdaxrOShO5N9axbt7DuPOegcwGnkKTA
	CgqDU8N2z3GQOod5Qax3NdBSYuRKykd1w9ul0hjpbNq7pt8QQeLBxalhuVNwe7PnzY4=
X-Gm-Gg: ASbGncuNFMYVddtcFSQjoytPF7AkW9IYZDxkmfg2t2PUkEstQQ4I9w5o1ounaaO1XIi
	EzieI9FttXWivcLzKpqrtGHkCQGo2KiTQLRXd6EVWq9i2M9Xg3dFAmwH1TjKvliktAfmUc7fDKP
	Nu8PS+YE6Lmwo6cAidvkJwXGg4ETUgNOLzDLbsA7g8b5zik5ojjmi8fmUnIfhkfJe2JsmkpS2w8
	yWO8yd/THEoev0iYa2PgQm7gG+uwLdfjrJOLYO3oU08PsDF+CTNHOdbhWXvSQ/eUsmHA5eFi5o8
	K5xotC8erTGH39t8xaqHnRb/Jm61egKNI37XvnBO1RrJzaqhrQznfhK6vI0j3A75GmSqh+AGRWy
	88HgC3TirOtZxGyTQZbRjPC9b+Z4o6ygcE6JzcrMxFSiFux0AtEVES35At9rnXAsbRcmn
X-Google-Smtp-Source: AGHT+IF7x+pGpXf85Vy38ChqF7Pkim2OKEyjFcqs8YYGtgVmrGA1ZIZ90uccF0N4NZf54XR53W2Dfw==
X-Received: by 2002:a05:6000:3113:b0:3e2:ac0:8c55 with SMTP id ffacd0b85a97d-3e765a3e423mr13059397f8f.55.1758001740531;
        Mon, 15 Sep 2025 22:49:00 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786ceasm20896593f8f.16.2025.09.15.22.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 22:48:59 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 06:48:59 +0100
Message-Id: <DCTZLTRX455M.95MSJULLX6VC@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <tglx@linutronix.de>, <andersson@kernel.org>,
 <pmladek@suse.com>, <rdunlap@infradead.org>, <corbet@lwn.net>,
 <david@redhat.com>, <mhocko@suse.com>, <tudor.ambarus@linaro.org>,
 <mukesh.ojha@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-hardening@vger.kernel.org>, <jonechou@google.com>,
 <rostedt@goodmis.org>, <linux-doc@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Eugen Hristev" <eugen.hristev@linaro.org>
X-Mailer: aerc 0.20.0
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-16-eugen.hristev@linaro.org>
In-Reply-To: <20250912150855.2901211-16-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_224902_824573_44DAEEDE 
X-CRM114-Status: GOOD (  13.74  )
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

On Fri Sep 12, 2025 at 4:08 PM BST, Eugen Hristev wrote:

[..]

> --- /dev/null
> +++ b/mm/kmemdump/kinfo.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *
> + * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> + * Copyright 2021 Google LLC
> + * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
> + */
> +#include <linux/platform_device.h>
> +#include <linux/kallsyms.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/kmemdump.h>
> +#include <linux/module.h>
> +#include <linux/utsname.h>

Could you please check if the headers are sorted here
and in all other patches in this series?

Also module.h is duplicated.

[..]

> +static int build_info_set(const char *str, const struct kernel_param *kp=
)
> +{
> +	struct kernel_all_info *all_info =3D kinfo->all_info_addr;

here ^^

> +	size_t build_info_size;
> +
> +	if (kinfo->all_info_addr =3D=3D 0 || kinfo->all_info_size =3D=3D 0)
> +		return -ENAVAIL;
> +
> +	all_info =3D (struct kernel_all_info *)kinfo->all_info_addr;

Maybe assignment of all_info on declaration in the beginning of this functi=
on
is not needed then?

> +	build_info_size =3D sizeof(all_info->info.build_info);
> +
> +	memcpy(&all_info->info.build_info, str, min(build_info_size - 1,
> +						    strlen(str)));
> +	update_kernel_all_info(all_info);
> +
> +	if (strlen(str) > build_info_size) {
> +		pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s=
'\n",
> +			__func__, build_info_size, str);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}

[...]

Best regards,
Alexey

