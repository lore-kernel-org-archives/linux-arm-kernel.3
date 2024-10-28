Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A854D3E2BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2LfEYca0SVAQ5XFZmx5kmUvCRKMJSdnjq6kZ9JePCA=; b=m4MrcQVg0q/GuD0Otxuqopg+ow
	o45ShCvcot7AyGCG2+0QOj/ROqBg0kwYBmDlA3Oo0eo80MP2zzhJBY9OtzlLNmKEbMg57DEBD7t+F
	3CBu92NRzHV5d3Fe/YTM0YAbUeHf9Onmscovy9wSPHvmsHpLPKwFQ4EWxHue7RTZiZ7l0/SlpqAKL
	xqrx3BsB94LEFm+PTZC8V5RYecTlsOpzpXAPnwVcN0/yhYPw+HjLff6FpORQy1gkybDv/h0O7563S
	9gddldIjVbpShddMQxWPD9c0IIHS0NuQTV7nNXIopU+HdPqu7zH/ZSVL2L94yT9OCNV1jvdVkudIp
	xWBvXXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5VeS-0000000C2Me-465u;
	Mon, 28 Oct 2024 19:43:45 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uw9-0000000Busy-3h72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:57:59 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5ebc0dbc65dso2776311eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730141876; x=1730746676; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2LfEYca0SVAQ5XFZmx5kmUvCRKMJSdnjq6kZ9JePCA=;
        b=Ug/JaATmQW53rxr60UjtgkiSrGglfAH0TsSfFiItB3vLH2E6SHn+5QZb2X8ViMvto3
         Sas+9kqGq/czJHdd8YwA6OccPAZbQcAOU1KWboKLOtuBBJ1WG6loYznDPHZvNCJ3PSL4
         +o+KGLQWX1j3l8x0z6AANQ6rXDFz7PNvFjcHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141876; x=1730746676;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2LfEYca0SVAQ5XFZmx5kmUvCRKMJSdnjq6kZ9JePCA=;
        b=bAD4uKXlYbuNWobqk0JDQZGyoP5Fk7AvEz1gcMg0g8ySXC0C7aWW7lf8POskLPCHZd
         pjDtrQR/8bB13Bb3BdWxpVFCnvWd9grCUFrlnQ4xvW+HPoXkMUQ0F5u1y1O/a7kP4PyW
         hY2aJz6J2ASkL/bbrxFITu2EU0Iet//3PVZi4z4KlKIRDzbqIS4sTIdbdj0i2cmcjDTc
         nEsJgLNoEJ9CFU2fdq9z6AJ7jKKkmD2NdfguA3jVwQqYnSp3FIPw6H1o42+dmkb6o7M0
         GHdsyJ19CCu5bgzockA9h7dYbGEe/6B30QLk7EOc+vDUsElUKbAljqEDbtUsRvL7LQ10
         oygA==
X-Forwarded-Encrypted: i=1; AJvYcCW4GPvx7ASwdFmzK7jiH+HFeZXml25tPNDtoYIIjo4KqyU2CMYgyg2nN+pDmW5sRSo0ZYsw+Dxb8Ov+Tib+0wmk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy70+RWh45p/hytLd7VDxwrUkS7+HWdhetdU9j3jK9piR7g0muw
	T/cjQLmB8wysi4FT0CnWxRiCFX95mYQt0rZCc6oaubqnHLekg+5LR0ozhUnFyhVSvGax8khJTq+
	HXMdgYSM98XRvETNU85RJPoblKcS6TRuRRrdZ
X-Google-Smtp-Source: AGHT+IFvmYBtQn6VF/6ueDr0Mul6XafO9LMXlXZyFfebnMWZxAt0RxG3GM+9mJwqrZJNTpm99hm2yO6Tjm648OHps4A=
X-Received: by 2002:a05:6358:41a1:b0:1c3:92d9:db9a with SMTP id
 e5c5f4694b2df-1c3f9dfc925mr362147255d.10.1730141875928; Mon, 28 Oct 2024
 11:57:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Oct 2024 14:57:55 -0400
MIME-Version: 1.0
In-Reply-To: <20241028-arm-psci-system_reset2-vendor-reboots-v7-3-a4c40b0ebc54@quicinc.com>
References: <20241028-arm-psci-system_reset2-vendor-reboots-v7-0-a4c40b0ebc54@quicinc.com>
 <20241028-arm-psci-system_reset2-vendor-reboots-v7-3-a4c40b0ebc54@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 28 Oct 2024 14:57:55 -0400
Message-ID: <CAE-0n52buO+oJfesc+025hogm7BygMp4dO6b2_6aAoXVKRBs7w@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] firmware: psci: Read and use vendor reset types
To: Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_115757_943087_872E056D 
X-CRM114-Status: GOOD (  15.38  )
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

Quoting Elliot Berman (2024-10-28 11:44:57)
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 2328ca58bba6..2d7b6efc8743 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -79,6 +79,14 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
>  static u32 psci_cpu_suspend_feature;
>  static bool psci_system_reset2_supported;
>
> +struct psci_reset_param {
> +       const char *mode;
> +       u32 reset_type;
> +       u32 cookie;
> +};
> +static struct psci_reset_param *psci_reset_params;
> +static size_t num_psci_reset_params;

These two can be __ro_after_init

> +
>  static inline bool psci_has_ext_power_state(void)
>  {
>         return psci_cpu_suspend_feature &
> @@ -305,9 +313,38 @@ static int get_set_conduit_method(const struct device_node *np)
>         return 0;
>  }
>
> +static void psci_vendor_system_reset2(unsigned long action, void *data)

Can 'data' simply be 'const char *cmd' instead?

And can 'action' be dropped? It isn't used in this function.

> +{
> +       const char *cmd = data;
> +       unsigned long ret;
> +       size_t i;
> +
> +       for (i = 0; i < num_psci_reset_params; i++) {
> +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +                                            psci_reset_params[i].reset_type,
> +                                            psci_reset_params[i].cookie, 0);
> +                       /*
> +                        * if vendor reset fails, log it and fall back to
> +                        * architecture reset types
> +                        */
> +                       pr_err("failed to perform reset \"%s\": %ld\n", cmd,
> +                              (long)ret);

			return?

because we're not going to try another one, right?

