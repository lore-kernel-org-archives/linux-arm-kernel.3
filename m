Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD863C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXQoocgfizkpU9Nm1Zjh50U6LWogcq7si/7CJqUeXKk=; b=Ec9rWZVzmPjxpgpeg2PPExD+tI
	slmNZsVbpoOe0cSSc/i3+9fj4xaV0h2ABXEBzthaSTgp2xvgdY+PEoDb3kH5sqUWDJcKYBZyvKT/6
	YPiUskVvw5ls8YNc+RBIZwuz+x8MfwfI4foPNn1TmhgZy18xwZpEEm4JJWp9L+awGhQewFvHXfZJq
	rB0g/76GhLgh4bAkAnZMajoN+bNa/bWrZpVH07t8qaISsc2lR1jUL4zxW/D/iJzoaxq/KJHmyQegq
	QygNatWLRkH85an1Y02fNsDeaPs4STTR69EI//1vOWOlWHA/nCVBXkbDI6UobS9fKcJhmMotbv5jo
	pt7ZlXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsSK-00000002MCM-2LoX;
	Fri, 02 May 2025 15:37:40 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAs8l-00000002JGE-0S4F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:17:28 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e730ea57804so2953206276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746199045; x=1746803845; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VXQoocgfizkpU9Nm1Zjh50U6LWogcq7si/7CJqUeXKk=;
        b=UrY19CExYe9xGi96L6YQFy1n0MMXMR8HkvAbmYLwRcSk6GKl7RHX76lkuy1kYgICVP
         K4pzxlOUffhYeH11aq7+Px55YWx3VQELLrrICyq89CXNWqOi6W6XjNmJW0wI/ITGCJRY
         FxyREEz8ixQTRuaHaxttDKJpRrTNClfbeMwT84lb+DF9liiezsHwO41WgU3NF5yzl2TX
         cJQAGOx/XNoJEsmpjnk//tPEaEinJGVoZYxwkolJRm2Q+DLXUDE72pSMCpIbcp4QITfP
         jwLA8Pm7BOxd2p5PjwncNOSG2J3plWmAL2lnBRXfOpzD9pO2WqKPqv3CcplMZ/9+fXcR
         eqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199045; x=1746803845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXQoocgfizkpU9Nm1Zjh50U6LWogcq7si/7CJqUeXKk=;
        b=UpXXI6RCcyQqBKWK1DWEfCZR1oDWSVV07Gh7IXZPs+PWQBdA92pYgIqkBy9nemzEMi
         zyjXJeDYZzBT7ySbHd9aHP0GvXVo434qMKj6uktfzIO1g4sPytN4jaURBnndf+4K4KoF
         j2jHa0+aEpv1QRzuUykhKai5r6AaV/kgDSh7Wlj7XOjj1u8voxlmRJ818IJhHeBNUOYX
         nFU6AtvNGSewm815tAaCkpN4yFgFiZ+s7gQLopHy/dX8/yYbMTTeDCxyvR5wwYsjvDCa
         Xm+n1VKIgsADoYJPqgLGXk59EtrDZ+/GvInY3SXbHoYF7WqV1Xkr/61+z8X2OAWTi/Sn
         sd8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2ksK3LI4QNEb3+ilteVtEp+qp9q9C9zC7qpwANiizwJ56GIb0fYg3hRLGQ4YQK6cEdPYlVIkYjYeMMyj0HCl2@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ+AmJLREx/iOXnUtGbou8fqKzMIIObVrNhusTWyTspFWnNjgc
	XDMlGiy/2w+LNVm5vUxpTHs0Zh9qlWqGU8VWJp0GktfJse2eK37yTq58kq37RPGNKJ8o+U6/gna
	DkUnFU5po7s0bmTVyPNP8TemzXptNbd+Jt6fytQ==
X-Gm-Gg: ASbGncvpN6PoxbNNt6hyBry9p8A1b6E6AJwYYBqtSV2obFrP1NJWrYn6YQ+NWO12h2f
	/Xw1b1gWIN25kcel+SlItLHpOUTHAl7B90Xtr04ZQrFokB3zR5FOKqVqcLE3tXP93+X9DgnCcTT
	Hp0/Pq/QyDUAbWYfy+t6FAd7U=
X-Google-Smtp-Source: AGHT+IGOJ8Eir9GxuesZHcEuIu1ZjHJGGsWPS/EU0OhDLRhyf0gUO15gbaMUnY4Y3NvLRwmdo2aOggOJtMXJXT6u/NE=
X-Received: by 2002:a05:6902:274a:b0:e73:1749:ed9c with SMTP id
 3f1490d57ef6-e7564d4eae9mr5266817276.24.1746199045400; Fri, 02 May 2025
 08:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250502140119.2578909-1-sudeep.holla@arm.com>
In-Reply-To: <20250502140119.2578909-1-sudeep.holla@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 2 May 2025 17:16:48 +0200
X-Gm-Features: ATxdqUGHsKjN1SkITjGe8n04FhBneRxtxXjAJhE7PE4nZsGHUusZ-4S_tfwcPqw
Message-ID: <CAPDyKFobCehWO2jo2H2wMx40NLggoFOnhWKCuqcMURTLgiK1ug@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Avoid initializing faux device if no DT
 idle states are present
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_081727_145825_055C9567 
X-CRM114-Status: GOOD (  27.36  )
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

On Fri, 2 May 2025 at 16:01, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Commit af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> transitioned the PSCI cpuidle driver from using a platform device to the
> faux device framework. However, unlike platform devices, the faux device
> infrastructure logs an error when the probe function fails, even if the
> failure is intentional or expected.
>
> To prevent unnecessary error logs, we can skip creating the faux device
> entirely if there are no PSCI idle states defined in the device tree.
> Introduce a check for DT idle states during initialization and avoid
> setting up the device if none are found.
>
> This ensures cleaner logs and avoids misleading probe failure messages
> when PSCI idle support is intentionally not described in DT.
>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Fixes: af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/r/cf4e70e4-9fe5-4697-8744-8c12c41b5ff9@nvidia.com
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, please pick this one.

BTW, I was not cced the original offending commit and it was funneld
via Rafael's tree. No worries this time, but probably easier to stick
with my pmdomain tree future wise, to avoid any churns. This is also
reflected in MAINTAINERS.

Kind regards
Uffe

> ---
>  drivers/cpuidle/cpuidle-psci.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index ee35ac816321..40f378c1dc9f 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -438,10 +438,29 @@ static struct faux_device_ops psci_cpuidle_ops = {
>         .probe = psci_cpuidle_probe,
>  };
>
> +static bool __init dt_idle_state_present(void)
> +{
> +       struct device_node *cpu_node __free(device_node);
> +       struct device_node *state_node __free(device_node);
> +
> +       cpu_node = of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
> +       if (!cpu_node)
> +               return false;
> +
> +       state_node = of_get_cpu_state_node(cpu_node, 0);
> +       if (!state_node)
> +               return false;
> +
> +       return !!of_match_node(psci_idle_state_match, state_node);
> +}
> +
>  static int __init psci_idle_init(void)
>  {
>         struct faux_device *fdev;
>
> +       if (!dt_idle_state_present())
> +               return 0;
> +
>         fdev = faux_device_create("psci-cpuidle", NULL, &psci_cpuidle_ops);
>         if (!fdev) {
>                 pr_err("Failed to create psci-cpuidle device\n");
> --
> 2.34.1
>

