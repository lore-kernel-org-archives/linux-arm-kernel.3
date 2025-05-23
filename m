Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E0AC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhEtoDJFgqNSJbdEuU9qcTn/W9vRw2JPWBizPEbsfUA=; b=nUv5cPODcEBJS45i86cBAoc2Ol
	qN2Rqet4nQFR62tT+4EhlxnjiU10gaQFoGspbapA9kv5fOVkm8w0O+EAyvz8tLzGYeJVxFb9AC/lT
	4qeMjakCUrLNBSYxDKn8Qwub0Kda6+naR1cczP2tkAaSiSpcUVWEl0CPToD1fJmUt+i4nUory1eZ7
	PpLzVvQazWVmxRwaYOL5uK1SHnGQBRQqVQpDyQLEwKf3jOtFWpOv6Fwg7N2MEGyDAeRayc9VQd+FI
	A6J0nVY6LXoRDiAXlMCYyrDs3fgi5y/ob7MqfVUaxcg865oRyimQC4jJSYrG4S3BecIq8icr5HK8+
	bIr38wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXzA-00000004mw3-2ffq;
	Fri, 23 May 2025 19:23:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXtR-00000004mJt-0xHH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:17:22 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso277509b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748027840; x=1748632640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhEtoDJFgqNSJbdEuU9qcTn/W9vRw2JPWBizPEbsfUA=;
        b=hE9aoKr3RAOi8JiFC38GgQC8eYYglNpgSF6BQ+GTpybDuZOxpG3ADlNC3fWfntR8xT
         AO/403UfrSIaYGyMnuDJEfYwqJ0LdO+XJ1KzBXQWjU0nLWJpOBrVq8XikP8EzshLH+8z
         WKhJQJ5NGzojtgsi8nSCOrPKmLtIcoWc+9X1jdd8//W65lHAZJ5xQW24qzJxlsjfWfL8
         bWqGtAOqAtikqEKFW2xUY7xV7GFVjulFF9yWUa3eh34F/4AERxmUDlgyCzialdf8wQZH
         Y37m/qsugcwyF+61WQfgUMVfeefjn87PIA/n7SeSAdgo/bZ/y3zbh7NpvmpDzDV/VKiv
         WvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027840; x=1748632640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhEtoDJFgqNSJbdEuU9qcTn/W9vRw2JPWBizPEbsfUA=;
        b=vgBHoJ6nTN4KdGvhlOvHuMpTJUWV84WKdZAq2gP732+EhR8tRoiHvJiqyj9dVYJ6TG
         BeEiu0UZr175iYl+6giLkdymWM6FGx8cqUbtEy7EIGnxenFOqKgNPaf423DqEqx54Q5n
         W8yUMaY3I5ttv8b8rGNDwLA2jQgdu1V8/dMm/11hWcbU5PZYcM3/KNo/Jx+HGzOjjGaj
         Iax+ipFrKkNe1sL2LfnHk30Xpm9Yt/YpzVX5Nu7esvWbKSeiRDHlu5oS7VL2RNhuzNT2
         lQotMEhBYdn8sm7hAMJ+Cp2rNEt9zCk+WUWmgsTMknHjpBNrSOwsIPEKttANrOOgQlrB
         Y25Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxKgAgKYXAdtMIRpbSy5NdbC07QYLUZcKdfVpVEGh1tRSahlCNUKgWyuDzMIF45+XwcjMGd/uNiM34ABDgmUSU@lists.infradead.org
X-Gm-Message-State: AOJu0YwPwleRaf+HL6ba1vRDLXjVtp3bwrvWoOqDI4Ek7LtSNquUUCjf
	o/lumRKS+7VM1x66ODGLLoKjE4S9oVSCcUDEAwM6Gi9JssQW8Edp2nJs
X-Gm-Gg: ASbGncvfFHfjxVZaYE2SSPrOAgyPMpsxO0s8iHpPe8dXTWAR+oZS3F7Envo/j370qjf
	r4ykdINjGqaHHZA9FmDtVmAB+qaclCWYvQiQCNuMqZNq9a/jLiGb5hnj7KJTIG6hw+yfL3wJXIk
	iW3BCsmRav9TUOY17UVexu05PuainbYpnoNCmCXgvZ8DhV8m32XV7fK0vWAiHPa3/xgqMr+sL+3
	/CG3qX6Nr9+KBRymaYgpwE+bDHvgMIB/v2ljLDwhFpHfHOnPCWDnOIfZuOrD5IQovWEqsyrdc9B
	lILrK+v/n+BhahO8Rez8FMYCxmd+V1L2vLYCWOYB5IR0el7X/g==
X-Google-Smtp-Source: AGHT+IEy3i3+lFOy6NK8IpvlSKcpSA+dK81IKK+t2Fb56IqXUml/sv8htV/OjA+M+GMx2IQe7GLtuQ==
X-Received: by 2002:a05:6a21:7702:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2188c2678b1mr659033637.13.1748027839737;
        Fri, 23 May 2025 12:17:19 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e5867sm13118261b3a.1.2025.05.23.12.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:17:18 -0700 (PDT)
Date: Fri, 23 May 2025 16:17:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
References: <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
 <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_121721_265080_2CA8C6C2 
X-CRM114-Status: GOOD (  28.17  )
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

Hi Ulf,

On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> You should not provide any flag (or attach_data to
> dev_pm_domain_attach_list()) at all. In other words just call
> dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> drivers/remoteproc/imx_dsp_rproc.c does it.
> 
> In this way, the device_link is created by making the platform->dev
> the consumer and by keeping the supplier-devices (corresponding to the
> genpds) in RPM_SUSPENDED state.
> 
> The PM domains (genpds) are then left in their current state, which
> should allow us to call dev_pm_genpd_is_on() for the corresponding
> supplier-devices, to figure out whether the bootloader turned them on
> or not, I think.
> 
> Moreover, to make sure the genpds are turned on when needed, we also
> need to call pm_runtime_enable(platform->dev) and
> pm_runtime_get_sync(platform->dev). The easiest approach is probably
> to do that during ->probe() - and then as an improvement on top you
> may want to implement more fine-grained support for runtime PM.
> 
> [...]
> 
> Kind regards
> Uffe

I did some tests here and I might be missing something. I used the
dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:

@@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
        if (dev->pm_domain)
                return 0;

        ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+       printk("hfranco: returned pd devs is %d", ret);
+       for (int i = 0; i < ret; i++) {
+               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
+               printk("hfranco: returned value is %d", test);
+       }
        return ret < 0 ? ret : 0;
 }

This was a quick test to check the returned value, and it always return
1 for both pds, even if I did not boot the remote core.

So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
it and passed NULL to dev_pm_domain_attach_list(). Booting the kernel
now it correctly reports 0 for both pds, however when I start the
remote core with a hello world firmware and boot the kernel, the CPU
resets with a fault reset ("Reset cause: SCFW fault reset").

I added both pm functions to probe, just to test:

@@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
                goto err_put_clk;
        }

+       pm_runtime_enable(dev);
+       pm_runtime_get_sync(dev);
+
        return 0

Now the kernel boot with the remote core running, but it still returns
0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
or without the remote core running.

I tried to move pm_runtime_get_sync() to .prepare function but it make
the kernel not boot anymore (with the SCU fault reset).

Do you have any suggestions? Am I doing something wrong with these PDs?

Best regards,
Hiago.

