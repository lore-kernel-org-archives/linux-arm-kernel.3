Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA1CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COjWgkw9dDrdv/qXOqDicnzuNLFa/NRxYwpYvY/xWlc=; b=UojV+RUPCC0GjUAhwrwlPa1cYd
	R2DxFy1l19HXoqxO976oSA5CwtFjKfIwVSoodJBuFI8PmkBU27y5Uf3qVgYZweMe4ZLShkdRewMDd
	AH0KoKHlHqbL5kjiRFjbX3jkDOsLqEUCQyodfjowsfWttB0UBy9TjqQjHOne4YuzAhLzqBQe3t8w3
	K6h8n/qapsZmwyLvLiYGNaU0AlbjDqw8kJvrPeQuKsvsyd+8No6ReUfmTmwbN4SLJR/Izva+ELcE/
	hX20GBToIbTJW1zu0qoDj3WP9Zt5hjV2ZpSsdwIXdjUujJfz+onTl5IZxpNeZjPt3ESv8VVyTSyw+
	LXdZS4Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGad-00000009JKC-0XuP;
	Fri, 24 Oct 2025 12:08:15 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGaa-00000009JJp-1QLW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:08:13 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-36f51ac0595so538562fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761307691; x=1761912491; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=COjWgkw9dDrdv/qXOqDicnzuNLFa/NRxYwpYvY/xWlc=;
        b=DbGFq3zzvrUsok8Di+dRnYAxsVvDUix/Qa9xnvfkxoEyKYy7yeV19YjzF3aKgGWgYO
         tlgUlyijeQhjlpLQo9sR4rg0ntbSOpoQryvnc7gLm2ueGbveIh24V6a+nZGtgVnG+B3W
         1HUPXrFfhbWcJ6S67cwFx7vD0CdZ4sq/X1gnSl0UT5xVq1/7QQCZdTSK6uKAqFwKfN/U
         SJThN3NwI0Vzbk3qPRHntDhPhnR9ZveQ2tIvlA4HIMqWXpvy+4Cs43/gupIh4wFOmfyo
         H0OzwXd6c3Hj7P4f/JXv0SSG9xqkzwvXqZ7pd6ZigYIKOS7TXSYvqfJXEPNQZpSK4JmL
         NuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761307691; x=1761912491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COjWgkw9dDrdv/qXOqDicnzuNLFa/NRxYwpYvY/xWlc=;
        b=B1RqCh7dZuEsbqQZp58F9/94oVkKGsaukmyXaKzUWUIE6AZD3to/h3ujp5dOvfIM/n
         depdoFw9OQiQdMNrbazAG76KEV36wBkeYFBmCdR5EO3cDjmXijy7AqrAevhUgszDNuk/
         sQzT56U+/EUrzDIijEKvNftS2dCCNl/ISLuR1e/ZHy0xtQlYw06FzVJYSwOjjXSxByFR
         //mvZiA7WmOctp4ndk2OTna6AzYjDjgGHTNA6kHE3F1/5RRbrrCe3lCd+JKPClxo3sc2
         l6VOcVIvgCD+ZNzshJ8eWWS+ed1y80jUKuVwf0FsMK9En3Fd6rxGIRUPABwrS96Mi9b3
         pdVA==
X-Forwarded-Encrypted: i=1; AJvYcCWCsQJ7M2urs/joxevoumTZtV1pTA336R15vu3anGCdtebdbBekgCvDGEM68eyhbNfgbHgSo1J7TOmITH76cvMK@lists.infradead.org
X-Gm-Message-State: AOJu0YznKHEAjCXW8oeyoPE6zjaFFDoXGLU65zFlXwWamV9AbvAVj6yN
	X03dsHdtjgCFvuFely1iZFz+U1HtuBTLxbRmtPzbPJwcxpqG6RbiWXFjcXEmesR87hjvZ/UIxLE
	LjZBR7q1cAK8rWPEsIeDXynSjVArXflzuzC+bCIIQgA==
X-Gm-Gg: ASbGncuSSXadg+dia5dy1aWh5U5ULjGOYTazQjMLifSW3dAdIykVKqYOgGqsnA0vT0G
	tj+yimAB/Ew0gqUIaRKQOar9daLFF1wY5kR+6U6NOeJXRZWheKI0/jQauVvoX3udXpdtJRD19Cl
	w90m9I0Hd1LBdTfEodsNRy4f3aQulSUP9x9LnKAYxxFB43Y7U6XLFRRTeMzAvCuK3LZTxy2HfUL
	Hvkb9SCdtaTKBpfP4lTRYF7SM5ZUOx9JQ0fg7brCGDBlaj+SSR3F24b3rGH+g9mtHnymQ9N
X-Google-Smtp-Source: AGHT+IFK3AnKwDQRprltuo5XmV2qevB0nUvb+or9PjdKZzh/743jqc+V2+ARd8+ZQ7WpzNC3YOgS1joB5oC1GEn+TyE=
X-Received: by 2002:a05:6871:6907:b0:37a:4e25:be38 with SMTP id
 586e51a60fabf-3c98d0ae92amr11006141fac.24.1761307690791; Fri, 24 Oct 2025
 05:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-6-ivo.ivanov.ivanov1@gmail.com> <20251022-savvy-sly-auk-a60073@kuoka>
In-Reply-To: <20251022-savvy-sly-auk-a60073@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Oct 2025 13:07:59 +0100
X-Gm-Features: AS18NWDM7YGw9UM3N9Wo3yJyRSbUnDcW25LmVLX4EpOUlRGSSHFV5er9HRrrlAA
Message-ID: <CADrjBPpXStuuvbaPZ+knb8fiGQja_hdX42PKfj=bTNCdXPCN9w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: samsung: introduce exynos8890 clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_050812_405711_C6788644 
X-CRM114-Status: GOOD (  21.65  )
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

Hi Ivaylo & Krzysztof,

On Wed, 22 Oct 2025 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Oct 17, 2025 at 07:13:33PM +0300, Ivaylo Ivanov wrote:
> > Introduce a clocks management driver for exynos8890, providing clocks
> > for the peripherals of that SoC.
> >
> > As exynos8890 is the first exynos SoC to feature Hardware Auto Clock
> > Gating (HWACG), it differs from newer SoCs. Q-channel and Q-state bits
> > are separate registers, unlike the CLK_CON_GAT_* ones that feature HWACG
> > bits in the same register that controls manual gating. Hence, don't use
> > the clk-exynos-arm64 helper, but implement logic that enforces manual
> > gating.

For sure it isn't the only upstream SoC with HWACG, gs101 and e850 and
probably lots of Exynos SoCs have it. Whether it is the "first" in
terms of release date of the SoC I don't know (and I'm not sure how
anyone who isn't Samsung would know), unless there is some comment in
downstream code to that effect). Your CMU registers do look like a
different layout though.

Just fyi gs101 also has Q-Channel registers that contain HWACG Enable
bits. The reset state of all these bits on gs101 (both for QCH_CON_XXX
registers, QCH_EN bit and HWACG bit in CLK_CON_GAT_* regs is off). In
my case I suspect the bootloader doesn't initialize any of them
because of the CMUs "global enable override" bits in the CMU_OPTION
register (which is initialized by the bootloader).

>
> Please CC @Peter Griffin in future versions.
>
> How much of this can be shared between this and GS101?
> https://lore.kernel.org/all/20251013-automatic-clocks-v1-0-72851ee00300@linaro.org/
>

It seems from the commit description Ivaylo is still wanting to put
all the gates into manual mode, so is only initializing these
registers to ensure HWACG is disabled. Happy to help review it though.

Thanks,

Peter.

