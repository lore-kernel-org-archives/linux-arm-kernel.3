Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6242AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=; b=fq8xTtt5nfimjnBKNZNXLw+WGM
	JFsVhfqM3IBYCfICiMrKyum9Iy65PVjV4nl5czaQ/87EfgC9AK0RZoRkwJUDzXM8Kpj7YLqaXntB3
	I8ewTmIufUtBdTJuqJSg65MwBAaK4zG1296VMN+IToblcHuKYl6zjrYsk+G6yhVJV0KqNs1UEyfCT
	thP66N5Z9Gx9VXXO9ijMjjJEdU3r/bS8nO0gLRAu1QUbq3iPlNO6yUz+9kDSTVSiLwVt6KHxVk83A
	mJPHNb35KRnqp5fd7f+ixWcT1GRlTtCaLXCBXVfPhBT0GxVeWLs4+V0Z8jVTquW3usxRJs1R7LmaZ
	KMJNRLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyJ-0000000EI2O-3sCD;
	Fri, 04 Jul 2025 11:52:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdpr-0000000E69K-3Rub
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 10:40:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso516216b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751625603; x=1752230403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=;
        b=RwniW9vxb5Y4cO4RlwuedOFToFyZGKMoC9g1LLLHGVZj2XaiwKA+8VMp9EjhTN98Hi
         v0CKmvVLy9DItOWGsM6NjE5kSwRlw7P7CdkCs3zl0moxlZfm2MZ6lUWTH96iA2xGF9nC
         RdOIiLUYNyaUABN9NlZ9IHTwIDYlfDZD62+JMD8xvxTbG3fMDiP82o6w6HrGAHUWVrIq
         Vl4HhxYtM+WpvPKeY5ZjVtFgmtWzv4Xra07lwpGJxWmfNhRLHvj1XISFohcbRZz8XgtB
         6yF/Pkeqpf4huzuZdaDSigORdDVUknkkG8s4KIaLWGyZhlkeGaqhvxyf6T1DJ4FQTdmH
         StXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625603; x=1752230403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=;
        b=Oi3RtMyGGBRPV7r8GjFnZ2B9mf7dsJMYgjkSXZsrmFMxseV2/VFflXUlp88oB6UlEr
         FEoBye6dOqSYGJZiTB/rrrLcY/8Y1EPXEAF9snU7zXeCS1Sq8t4Ks8MxH4Tb8s80TkxR
         9h52GGdeMFH3bUlplghmlz/aJE7Rqm1Mf8cDMZpazbcJ1x67Pe/BYiqQjDX31sWCwncp
         t1ctSn4alj5ZOZLi9SU+Pf5GK4oZ2tZHe4wy4Gn5JvMOwYDak6tx4Vhrti24XcWiHx/p
         PNDIME0RfvR/ZqS2zzVRSxmCS9A9Ddz7umZ9l+ON48ZALUK2wxk4uwc+5js6wpFQCbI9
         Xotg==
X-Forwarded-Encrypted: i=1; AJvYcCWGAesp9wG7vV9OEABclw+D+dFoR4NeRwVInMOIniS+d0hBgA+kjuFhx1WrEc38YbL08u1Jp91w92glFq8zChvn@lists.infradead.org
X-Gm-Message-State: AOJu0YzVA1qS8NRoB/BG1zIiaq/NXsgD1yXQXzVww9qBGAnkueTZKogT
	9jwqlHzmJv89yboKhgfRQlvKv4ej3mIbixcoWXAO6TzQkIneFhOAqjCyrdd96yFVh8OqEuivzbH
	/NhdRkdofm5jvDWdmpYWgWAPTDoOyXejVd6zKszPaRQ==
X-Gm-Gg: ASbGncubChpV2yZatdaYwsyoah/l8yjJoy7tlo+zHqpxYJUhU0pZDgMZwI8wpRSS8Pb
	JKY+l37zjU4an5cjM+WG0CyKCoch4JGVEoRClIIONDtovq7JA78phZjLi9+uFis6yzFFpeo/L4y
	wrf6piaMNQwiM1mRzUwO7GC238xIUdpipsDrcOcmbHNU9p961659+CY9IVsxNLM4AsdRSzEJgZV
	h6X
X-Google-Smtp-Source: AGHT+IGBs9C/a1h9wEnSJ4u2whXXZ8h6N1fXxSXBnoBq+aBJJFdxWz87n4GrI9gt5Rt5fyk2gdtaErEvJ5wxodxEPAg=
X-Received: by 2002:a05:6a21:328a:b0:21d:fd1:9be with SMTP id
 adf61e73a8af0-226095a50bemr2186092637.12.1751625603014; Fri, 04 Jul 2025
 03:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-25-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-25-ulf.hansson@linaro.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 4 Jul 2025 16:09:27 +0530
X-Gm-Features: Ac12FXzyhceuDUHxAgg09E47FfPnvNTySeb2d62SyjDeeom2LGwO1x_uyESViw4
Message-ID: <CA+Oz1=aU=2KFEsJNmO6LHjE0Wsdyor7Z4Yr30nLwRkAGm=ZO6w@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_034003_893384_D3E389E8 
X-CRM114-Status: GOOD (  12.62  )
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

On Tue, Jul 1, 2025 at 5:23=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> The recent updates to the genpd core, can entirely manage the sync_state
> support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
> our ->power_off() callback from being invoked, until all of our consumers
> are ready for it.
>
> Let's therefore drop the sync_state support for the
> cpuidle-riscv-sbi-domain as it has become redundant.
>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xi=
linx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>

LGTM

Reviewed-by: Rahul Pathak <rpathak@ventanamicro.com>

