Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4490E9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPZaguxK4uAclO1GJ8sZm5gYxF5BgvNNNwtD4mqwBno=; b=e0RpDKIrsh/xDZ2ADTRCMoM9uQ
	StMmrEZFylXm1xWyq7X1/MmJpSl21DA+iDy/JMPH+NDpFuF48TsjJehmHsmQIYe+yPely/HXjW7nJ
	4SEsg0AJ5zOQqMW3Cn4raTNNR1mNEmwZPVwIY/9Cd+XjyJfq88u7IX1xaer/9jy+uNIjUJxmxALID
	qds2SBgwgkfyutrscnYy9mm4h4X3hZH/Kl7ZekPqnla6mn+8TEJeJFjbOvqmx12ZorjbdNEfxF3HE
	MtMBzoig3j7+3XKzgzDhdzbv3PK3f2zwkfZTB6jZ4aDItnALM5SCUmI3PSiijv+6iRn1daBT6SD72
	TPdQunHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2h5-0000000D1zB-40oS;
	Mon, 02 Mar 2026 12:48:15 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2h3-0000000D1yh-2cTM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:48:14 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a91a5e64eso1652604e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455692; x=1773060492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPZaguxK4uAclO1GJ8sZm5gYxF5BgvNNNwtD4mqwBno=;
        b=MkhTjwlVqiG4ob5QIN2jE9BljLxA3gV16z4RXzp5hEMY7al1nGOGk0zGJpzD3UlDq6
         TnoxPKioH/KI4GuHT4av3RJlWcUAHNc18pvE7+AWOEzmPe4uD/K8REDrdqv/RS7RPJH6
         gmNgkPiYDfZ4s8EC9T5U0Fe9NFrAkBgLLM+laci8fwGdmZpTgTGaDqNTcm0aMy/JU7Dv
         GgBXi3Z6a1OkKIhzTyCltC61H5i16KL6xbQbA4p2PwzGLnUbFuOkxZPoM68NmcAjgLS/
         1mCUee7x0y/y1R4KiE/1i+F90TEoMSKxIdQhq59A92nJhtX0XrL4FdpG/cNICG+7/3bf
         GugA==
X-Forwarded-Encrypted: i=1; AJvYcCVG3kQN5H0LO+FFKezkjynqD+FfOtOnAavbY75t0ZWKwAXgnU+bYXbza4pk1OtRUjlXV+OJ7XHWSXHVmPFDjg/0@lists.infradead.org
X-Gm-Message-State: AOJu0YyIipA4bJ1XYVXcAW/TZrTE6iHFMLckr4ZtUbjFiYqFQwG30E/P
	rYxwqzzhHAmYMvapraiu7sXxpgV5zsjlfQX8BNa+bQlY1/1BVBVlix2Z37I2rs0s
X-Gm-Gg: ATEYQzxOAfn3ZGqlcPvj7Syl10rSbOPiJeuGfBly68WENGRHkQY6w0I8voVJt+Q3/EZ
	ecEr1/MP5m+ed4M1/LsB59sdc7HOUUxY6wNqVIz+efs+fK8EsCOZ5QifTe9Zu4nCfWgH83fjq26
	V/xp8MSxWIsqUMSGvs26QgYjwhwc7+G3aYRWrvWYso5nrgrZfUx9YQJszDU2AvZQOq02hhI+NzC
	HCubTZCRwRdxMq0DaD74Q1uYaEJ3257arXq/t//tuwMqM5NlLaUt87zL7EgESU05F2Jw8G69pAF
	Gw4OjEcxpCzw/WCnYpGyOFZvLXh/8dd5lDHAWfBsO2+2fDpCdZSHwZyAvLsMYObpIkxzIYlXWTv
	vZg0EoUMrVI3OdJmHIK2MBibaNSFohZhDjr83V0qsLDiQe8Y45jgdQ/+wu+BrPq2veBqk2Wu39s
	x7iJC2JBRK2QZ62vU2SeTwuDQzpxzJ8b03CkJOpF8ehs+hYakvNNApQxq295dHWrXLHUKNLfE=
X-Received: by 2002:a05:6122:a07:b0:563:80e6:3b76 with SMTP id 71dfb90a1353d-56aa0a1b4b4mr5182774e0c.7.1772455691949;
        Mon, 02 Mar 2026 04:48:11 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df645b877sm11795763241.8.2026.03.02.04.48.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:48:11 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff2139643aso1037769137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 04:48:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2L1sE3UmmMiUKObaWiRI/6H57OLvlNJLrqfdMKFU4WT7VfW0bQY3WgtmI7LGex66n5RuYI3/AfRQHCEUfyBVQ@lists.infradead.org
X-Received: by 2002:a05:6102:b0f:b0:5ef:24aa:986f with SMTP id
 ada2fe7eead31-5ff32280163mr4813153137.2.1772455690946; Mon, 02 Mar 2026
 04:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-4-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-4-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:48:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
X-Gm-Features: AaiRm50BStTuBuZFtFkMptJqRSM8Fy1hreKbQGIVp2iYFH2DYfQrEyfTQ_vqsrc
Message-ID: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_044813_673289_C6F29B98 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Cristian,

Thanks for your patch!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Move needlessly exposed fields away from scmi_clock_info into the new
> internal struct scmi_clock_desc while keeping exposed only the two new
> min_rate and max_rate fields for each clock.
>
> No functional change.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
>         __le32 rate_high;
>  };
>
> +struct scmi_clock_desc {
> +       u32 id;
> +       bool rate_discrete;
> +       unsigned int num_rates;
> +       u64 rates[SCMI_MAX_NUM_RATES];
> +#define        RATE_MIN        0
> +#define        RATE_MAX        1
> +#define        RATE_STEP       2

Any specific reason you are not using a union here, like in
scmi_clock_info?

> +       struct scmi_clock_info info;
> +};

> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -51,6 +51,8 @@ struct scmi_clock_info {
>         bool rate_ctrl_forbidden;
>         bool parent_ctrl_forbidden;
>         bool extended_config;
> +       u64 min_rate;
> +       u64 max_rate;
>         union {
>                 struct {
>                         int num_rates;

You patch description read like the actual rates would be moved
from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

