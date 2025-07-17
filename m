Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7475CC83F3B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN4bJ0MLHsMuhB36620IX8nWVKMPLDlQLQ5oOeKTkGg=; b=i3h8NcIVjX9b0NkZKNV0YajmAk
	XhgTn1n8A5t8xcwkxIMJdAftOD0ixqr5G4vQS5NGR1o43J1Eg2JML5q3uOJGcxrWewUGRki0gmK1X
	5LpzXGyHXzGw5Ry4XBALrGBjH3aZrc0gb13M4rXEyydBI/AMdGGFUSG7GmwN6NHNHnfWG76g6wSDl
	8TWPa4f1GmJCvBuyYCxcBgLlxR+NhAFzozfZWfCmmunS6QxeKEkYRjB3Mv4GcsRh1DIDb71IFvTwK
	0/pVAA6ecCViOl79P1DqJSq5BKUnSo4JQUCaxEiXOB79WMvVKGECWC59tB7RmFMJaptzqwYOlK8Cs
	x3C3LPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRK7-0000000AcNL-3f8k;
	Thu, 17 Jul 2025 16:19:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQmA-0000000AWxe-40Jr;
	Thu, 17 Jul 2025 15:44:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23dea2e01e4so13346215ad.1;
        Thu, 17 Jul 2025 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1752767042; x=1753371842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rN4bJ0MLHsMuhB36620IX8nWVKMPLDlQLQ5oOeKTkGg=;
        b=Y5Bp15vgPFOl3f/oHldwOFX7jqvyQzC6tspDP8v+pw9ndZU13t5EZt7nrRpFU5oyRr
         zHN33FjL5nZRX9EiUR1lBIOom65+JOKe/PPZT8waDEdH10Xzx+3c6pgbUFWLhOLc0ODN
         Pces95uo8gAFYPQPt+OYVQcBfqg6rmGN3CYouNquV4CzcmnSVyg0z1GTGXb7db6m6bdt
         avkLf2ikTBQG+cgk4A9JYmkCSm6HfuhEP1B7jIOpQPXego3sJfAHEdnZzun0bmFmbabd
         hKLmttTqVO4YpeL8MJsgcQOovKHySG/v9iXI1ijIUmuy/70ZZz4xKrjVyFv2UjZgds4o
         npzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752767042; x=1753371842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN4bJ0MLHsMuhB36620IX8nWVKMPLDlQLQ5oOeKTkGg=;
        b=kkNJR3Vbw4nk+pzPDvdMYug3zyS9M7I1s+pB0k9uMNyMfTvoo6+syCjBgG2ebGr7X6
         oKWqGKPiSsonZTKPCmtegZxpIcivyqttkju/svbO7vSm5GUpOOjEgy8SVqHcfGGhJbbf
         l1sOCiEoPEdej/K+ynRZWXUlHX+mmWEbUT/UEX+PTZc6sv5euIjzlzYzDG37zTkYUfkj
         Utr2yDuSmlz5TaJHD1JGe6HVSsBVi4GV3PAdiBo8Wkj+Uc3VvGDoR+9CIKLxVbN8dSpW
         i0ZnkeSmtGNG3a28lvUV2ZaZS15MAYIWUZPRXhyJ6VJgn7sWjhGfF7OXa2bEg3ZMY4/n
         d9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxsN2mZ27WgkdAKTNSSmKSHDRcS/3pUvO0505kmBi6LR1haq5frkdRaww5lG9J49W3gWd0LalAsNcge8eE@lists.infradead.org, AJvYcCXTvVDX89QGdYfI7RzKx6/kp4j2wHDwqE5C3dMn0LxWpGHfCTe47r2LiY8XlBnVAiat+1UNqUWGKAxPAXI0j4puBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpjSGYE0u7aS8Lv9QS8mGzE1NURpa1AACYCxXCZVwtj4cVk3Rd
	WdHheNBnPEldLuOzYK2Lui7IVsKlX6OkXozyvngUK8yTPuRfJ2v76wq23i54MDNKMGJ4Fa/n1iG
	HvQXIFtOFWrmKdtadBxhWzEfYAeqAITchg3lq
X-Gm-Gg: ASbGncsEMHqGgfxnSeCPzQEQaHWAzzK8mUlZ2uYPkbJbzmgduIUZGZF6ArvbvVxqHLA
	QZG8JeB3nFWkgLO7849DC549uxYiU7b1euUKs0KKOGfBa23oUZJ6pUnh3xLN46sByK2vmGQdlIe
	1+GhfvLCq01+n9g0oincFwAOduhLMooj5do6v3qdMHT+26885deqbGK7E5Vsfd0iu9a3L+IZ6OP
	BOeDSVGqvppBa2GshyXsZm4cpApIO1O
X-Google-Smtp-Source: AGHT+IHA1ZrKnYuPXE4GXLTfL1TF9TCNgu66q+ocBubO7yF3+9AbPVtS6s8vpRxMX8NX3hB8Al+UyUorAl8wjgpvBEM=
X-Received: by 2002:a17:902:ebcb:b0:234:f200:51a1 with SMTP id
 d9443c01a7336-23e2566a7bfmr87576115ad.9.1752767042136; Thu, 17 Jul 2025
 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
In-Reply-To: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jul 2025 17:43:51 +0200
X-Gm-Features: Ac12FXxyJdrkT0-Udvls8NBCEN5HDOxcf-2RPU7Aaa4UPg2Q8zxybsDbpxTtPl4
Message-ID: <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize measurement accuracy
To: chuan.liu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_084402_992901_D9E6CCCC 
X-CRM114-Status: GOOD (  14.65  )
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

Hello,

thank you for this patch!

On Thu, Jul 17, 2025 at 5:08=E2=80=AFAM Chuan Liu via B4 Relay
<devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The cycle count register has a 20-bit effective width, but the driver
> only utilizes 16 bits. This reduces the sampling window when measuring
> high-frequency clocks, resulting in (slightly) degraded measurement
> accuracy.
I checked the Meson8 downstream code [0] and it uses 0x000FFFFF to
mask the register value -> this means that old SoCs also have a 20-bit
wide width.

[...]
> Here are the test comparisons based on C3:
[...]
> Here are the test comparisons based on C3:
I have tested this patch with Meson8b based Odroid-C1:
pre-optimization:
# time cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep -v "  0  =
"
  clock                     rate    precision
---------------------------------------------
 clk81                 159372396    +/-5208Hz
 a9_clk_div16           24000000    +/-3125Hz
 rtc_osc_clk_out           31250    +/-3125Hz
 hdmi_ch0_tmds         146399038    +/-4807Hz
 sar_adc                 1140625    +/-3125Hz
 sdhc_rx                94443750    +/-3125Hz
 sdhc_sd                94443750    +/-3125Hz
 pwm_d                 849921875    +/-31250Hz
 pwm_c                 849921875    +/-31250Hz

real    0m0.102s
user    0m0.005s
sys     0m0.069s


post-optimization:
# time cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep -v "  0  =
"
  clock                     rate    precision
---------------------------------------------
 clk81                 159373438    +/-1562Hz
 a9_clk_div16           12000000    +/-1562Hz
 rtc_osc_clk_out           32813    +/-1562Hz
 hdmi_ch0_tmds         146398438    +/-1562Hz
 sar_adc                 1143750    +/-1562Hz
 sdhc_rx                94443750    +/-1562Hz
 sdhc_sd                94443750    +/-1562Hz
 pwm_d                 849992188    +/-1562Hz
 pwm_c                 849992188    +/-1562Hz

real    0m0.173s
user    0m0.008s
sys     0m0.109s

So there's also an improvement in accuracy. The only downside I'm
seeing is that it takes 75% extra time for the measurement. For me
this is irrelevant since we use this for debugging.

[...]
> +       /*
> +        * HACK: The input clock signal path from gate (Controlled by MSR=
_RUN)
> +        * to internal sampling circuit in clk-measure has a propagation =
delay
> +        * requirement: 24 clock cycles must elapse after mux selection b=
efore
> +        * sampling.
> +        *
> +        * For a 30kHz measurement clock, this translates to an 800=CE=BC=
s delay:
> +        * 800us =3D 24 / 30000Hz.
> +        */
> +       fsleep(800);
What is needed to make this not a HACK anymore? Is there a register
that we can poll for the number of clock cycles that have passed?


Best regards,
Martin

