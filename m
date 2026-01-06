Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7357CD0438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 04:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=; b=B2iyY7d13gaF+GC2YnTkygVq2u
	VHkCU5Z1/FhMG+g4tTtPK/8FnksbPIThuLbazxA90kFePsWgt/qNiFwofsS+aVtjDJXznXTKTPXbI
	q2dnWR9IM5X+qaqnPwSOwTqEGauuwX+Yux7yyHDdzm6+dzMz+EwCg4JU+iO1d89EN71yZfpqoWJNX
	+fa+NALB5BijwoXR7RXmXonE3YmcNn9+5efRyRxoJQ5vWWyK5tuB26ORm6RZmrjDhR22zDpYSJ64W
	NIebdn/BXfUiQYXNBq1OEXk0eAt5ow14C5qPj+z2C2P1fhHK1rWy/teqhuyDtH3oBu6gNeznCXrru
	udvYKDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz8B-0000000CQDn-0ouj;
	Tue, 06 Jan 2026 04:57:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz88-0000000CQD9-1B2M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 04:57:17 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7f1243792f2so456650b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 20:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767675435; x=1768280235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
        b=ATmwyOusFRcINW0mRzuO69xiukkFsTYBt+6Nc96Z0K4gqw7UNV8u29H96zoTgQG2kt
         atWPF9OwzUlU/zl7y2EohnWUHBmPwHR0VR8Hv2HcFons9tPq0Op7Oy4CJ/gnt/3s9MLc
         WmzodP3APiVoG/GxxQ2BeUBhn6cguCbvOskg2QEBHJH+hE9ch++QJn8QTOn1mI5FkCQk
         lpKHnHsIfJzMQzXt4MdP0IDXDvAsEhhVkGBmlhvXfAwbsu5uIQUo4kjsbSTilo4ZFBZZ
         9fL4hbDkDazkqOHnukB+lozNLYXx7678pAEbQ1KjQplFW9+m9LAtlWsfrMaLZrov6qXr
         JXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675435; x=1768280235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlNWZ1ASjDiM8/EVArPiKc25ePbXneuyrH70Dm1FmA=;
        b=cq5p2LkfgGkr7JKYp5AexnkuuVxTAcsSlTJ/Y0gG+T/Ro4yvlEeHOuhgGFdnMRVsUR
         E+dzD68AHo45b92+MA0bv30mt6vQ1MPbiZR1PUUzhldmtERv2ytCJsAYEH83v0zWq6S1
         Q3ZDur7feKXXFVwh95Nb7Hd7bLf0+T34uMo4Kmm8RPTiwP7zDgMgr8BeRH/MWNdRDJw8
         Q4hO1IiF8BAiNKqfQldlbx1JsfMhCrYsmqHCuR1PZkMLKlCFmCMa95YlLoEeUD9QUNJ4
         mAiwhqbV1hDn+RvRSxp6XZnIt8V3jceuvLDZO6UR8QKkuqizqS9uds4MBFi8yuc7TzOX
         XJvA==
X-Forwarded-Encrypted: i=1; AJvYcCXuzv8wPCMeCjAD4ZYogn5/EIla6k9kzyGpeyp790XnWi5QdvRcemRYHGgNNw9uh4qqbWAU2mKz7qabGOdtN+k3@lists.infradead.org
X-Gm-Message-State: AOJu0YzOTo5NXwR9P86ImPNyq99LWddqNqQ8Z1XcMz9zQdRHNeh6e7ng
	rXqwwpyr0B8b53WlybPHFWiCzyESasXCPzVY85qHV1imwi9ljbAHuTNL/1/aH1p25Kk=
X-Gm-Gg: AY/fxX4IPJJ36cgVFOKRiQJmvzL6VrG6z597WWDAKo66ak+le6JJif/bITtVMFHOzhw
	uvpL4w/IdTv7hcqfmJ2323of07U9aQbGVbRyGz5cu1mMXRaJ7FI6VG6qJJuI1OJRlR16eDfwe/v
	1orMCxIRgnvZDfSab+Nr9NAMvLQQvgMwwD7fRUdpoNLsnVfN7WyEgd1ysgd4+R661oML24JJdaz
	raRyaY1zFlD4q3DyWkfjM/pSmdnce1vAGMTJFkkw4vElADrWp1DIhcMo39oLqSaOic05ZHBcSSl
	hRd9EAMnfcXQJlmzuIAvY4dojFsO90x9V3KJUlp/0Wf7Qivyn6TN8PB6JeuNuKcQmsVbS9JLoqs
	corfjlHZIzmBffZMg3a4rwOhGuTf5wIdbXu5roCFw1VgH/5E8fGNVcJAKjVu8qEuZ420Oy9gKdb
	CroDOTX0BKR+xXM4QIotDm2A==
X-Google-Smtp-Source: AGHT+IH1HIV++y2p498uUKeXICIqTonP/XkL+xU6dt4xBDj6CXKEeUOGv7lJojUw920KVFSDaG10IA==
X-Received: by 2002:a05:6a00:ad86:b0:7e8:43f5:bd3e with SMTP id d2e1a72fcca58-8187f78d9fdmr1867900b3a.42.1767675434866;
        Mon, 05 Jan 2026 20:57:14 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa1936dsm727051b3a.12.2026.01.05.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 20:57:14 -0800 (PST)
Date: Tue, 6 Jan 2026 10:27:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, dmaengine@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 11/11] cpufreq: s5pv210: Simplify with scoped for each OF
 child loop
Message-ID: <g4k2qdsihxfawfsi5ie3w2fhbsd2x6z5heifkcte75c2w3sjg3@cofrjgaiilta>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-11-24e99c177164@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_205716_354352_F09B7F4D 
X-CRM114-Status: GOOD (  21.34  )
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

On 05-01-26, 14:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.  Note that there is another part of code using "np"
> variable, so scoped loop should not shadow it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Depends on the first patch.
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
> index ba8a1c96427a..e64e84e1ee79 100644
> --- a/drivers/cpufreq/s5pv210-cpufreq.c
> +++ b/drivers/cpufreq/s5pv210-cpufreq.c
> @@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
>  		goto err_clock;
>  	}
>  
> -	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
> -		id = of_alias_get_id(np, "dmc");
> +	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
> +		id = of_alias_get_id(dmc, "dmc");
>  		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
> -			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
> -			of_node_put(np);
> +			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
>  			result = id;
>  			goto err_clk_base;
>  		}
>  
> -		dmc_base[id] = of_iomap(np, 0);
> +		dmc_base[id] = of_iomap(dmc, 0);
>  		if (!dmc_base[id]) {
>  			dev_err(dev, "failed to map dmc%d registers\n", id);
> -			of_node_put(np);
>  			result = -EFAULT;
>  			goto err_dmc;
>  		}
> 

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

