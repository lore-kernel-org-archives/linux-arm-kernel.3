Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E9ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rjhO/M0uTmlNPmuFaEm9QTozYRIwsNGmKagEyX9yMU=; b=YXOFaXbKirnTet7O8BQa6VCpJv
	t04wKbOp7BKupSzyy7iJ7iXsmNsysgHb2x9xaKamYL1GVMFdGUHsFUzhjO6BWHm+z726Izy8zkY+7
	t3TuC7zCwhK3+LvdSNXUDiKxO6e5kIZFrJJaR7Qnz/o6qsbscjADHRLpC6b78fE58D+QN7nElwRND
	lKEZnOdWIqWIjvTDtUwaZ/ZqYwFf+/QFhiFzmESa9R5ATkRJqv6+8VhfLkxe3UFeJL+dmEPWgyn2c
	il9FrmyMbNopGoEnFbCmZfRAN87L8ZyiNGlOi3QYmxaK0zr8UNR3O+O5wSk1lhdNFq407pT0rLA71
	iLwBnZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untXj-00000006fmM-0Mik;
	Mon, 18 Aug 2025 06:40:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untU8-00000006eXy-0aQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:36:49 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1374999b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Aug 2025 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755499007; x=1756103807; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rjhO/M0uTmlNPmuFaEm9QTozYRIwsNGmKagEyX9yMU=;
        b=Zc6xl+fdI8qAeKvoyEsNW9MUwUlAHl7aBk2Pj/jh6sfk35Dfsyg2fOPLDy0h7rTbuF
         sh1jWjXS5kIsZbOZw2ND2pBl/YGgwrAdJ4Obg25+egzjTotgE5OLfcYHlhs5Fks0VOvk
         AQLB7KSndbzUeWNc1HR3FCsRKu0ntC13lMexQ1elYnvitHzlh/WcvDi4vTsJPdw4+IMu
         WuG+9mpm8PxvdNZg8ZCUNV4gB8scy6xc/IZZA5tDUUhmPeyA7zoBIAR0K3jLYm7tfe3W
         Zwi3xHDgq251S0Ck7YaqlyfeQJAT8hBWl3QfgNp5CV9bgQD/GqZw6dNZagokJFWvsln6
         FgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499007; x=1756103807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rjhO/M0uTmlNPmuFaEm9QTozYRIwsNGmKagEyX9yMU=;
        b=JriQFkdcI6wgkeVeiyXCTR1pkr9anM0e01nRET5/8qeT9DLaz2DrWknFNq+UytkgwU
         +8rFCriD9uXqrZotg5oVM2TgpWimoTd9jDv3vYF/a8+GUh0acqJTnXgEEdMrrR53q+cD
         4Y7mV4lKXpAtPkCJNoJmci/8ZOF1slp0s8tj509xsklkMn4fNsseQUNPXyQXZJgzIurT
         k2k2KIanMiSytLKEzElL6SuB8/+qeUAK6yFXrPy5vX7EQff0BANcv049H13SCi2F+ndJ
         KB5m22QdmBB6iHBytZyXVo6gTJwneHApXSdKwxVOv/Bo0Or5hKCpfYoHhBp5lTd6g/1/
         1u6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGiWe4TuD3koV5tVxNRma0OTKp6YKUZxTm6Jdd2hjT5AfQbF22xmjL7QRxowcOqfnxRmkarO/C9xmgXVljn24d@lists.infradead.org
X-Gm-Message-State: AOJu0YzjSMO/7hPV7WVe2E6uqOdT4igQHZwyAM29YXaoFv+5rZShDaE1
	92RbuMfLJIvHDMg1Jx92FeGTh/6jKYJYjGG36XC1ckhX9AXIjkC8XwLG2CChU4YCb3M=
X-Gm-Gg: ASbGncvUoOJLIcoZoD8tXR8bev5zi0TRTaGFNQvvx+KBXaJrs6ML/7r+YZoW5ZKZm0n
	2mNioOEiI65Xg77IpCqHN8IQcpe/6eIdvaLCcUPIl+4mVbcBufAhnnk3FhxpinK/5HZe9vNsQP7
	kJvvYQC2Fc1zGduDM9HPXaYU6BqfPm3ip6KZxatypOx5PX+eFhV0/YiI4G6WFfXYxbrqvPAAI1/
	xv65Vne8i216Dyw3DGitRWl7mDMX1k05H2fNYl1xkwxE2pt6OQ6PceZMhERjCf/DXN0X9DsA/8g
	k7X35hEZzUcgE8CviNwa9evdeAQ5QQ4SfQAWQ3Ej+A1CZ2oFNGZ8RM4gwwBvt8HNsrh0hXqG1m2
	OawwZt8E/aSa+xLhnRwvXWxvr
X-Google-Smtp-Source: AGHT+IH8gijQo2HWWMh8yIAt8KnRnmfELcFQEuxNNsjzrP85ncTsOlSt0lA4KoypNRAozLwoHQfe2g==
X-Received: by 2002:a05:6a20:4323:b0:240:50d:4285 with SMTP id adf61e73a8af0-240e63dd588mr12345211637.38.1755499006972;
        Sun, 17 Aug 2025 23:36:46 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d799c8csm7203728a12.55.2025.08.17.23.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:36:46 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:06:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, james.quinlan@broadcom.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scmi: Account for malformed DT in
 scmi_dev_used_by_cpus()
Message-ID: <20250818063644.kbzbj7q7a2s4snur@vireshk-i7>
References: <20250815205714.1545571-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815205714.1545571-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_233648_192145_83E8B2F2 
X-CRM114-Status: GOOD (  23.26  )
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

On 15-08-25, 13:57, Florian Fainelli wrote:
> Broadcom STB platforms were early adopters of the SCMI framework and as
> a result, not all deployed systems have a Device Tree entry where SCMI
> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> CPU Device Tree node(s) referencing protocol 0x13 as their clock
> provider.
> 
> For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
> to continue, and in the event of not having done an early return, we key
> off the documented compatible string and give them a pass to continue to
> use scmi-cpufreq.
> 
> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
> Changes in v2:
> 
> - do not leverage the SCMI quirks framework which in spirit is for
>   dealing with SCMI firmware implementations, this right here,
>   specifically pertains to an older Device Tree. This also makes it
>   easier to backport that change into stable trees where the commit in
>   the Fixes tag is already present. There is no dependency upon the
>   presence of the SCMI quirks framework
> 
>  drivers/cpufreq/scmi-cpufreq.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index ef078426bfd5..9df4d968fdac 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -15,6 +15,7 @@
>  #include <linux/energy_model.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_qos.h>
>  #include <linux/slab.h>
> @@ -424,6 +425,14 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
>  			return true;
>  	}
>  
> +	/* Older Broadcom STB chips had a "clocks" property for CPU node(s)

Incorrect multi-line comment format.

> +	 * that did not match the SCMI performance protocol node, if we got
> +	 * there, it means we had such an older Device Tree, therefore return
> +	 * true to preserve backwards compatibility.
> +	 */

-- 
viresh

