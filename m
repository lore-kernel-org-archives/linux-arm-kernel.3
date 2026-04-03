Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99391E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=; b=VjN0XFEjmF7itg/BAQMYJzNel7
	NpgN6aatA0nEbVj4RqV/bV4DZaGHaC7+y3koDBj38yFFTIlUqkHAQPcI7erUAXdNpGJJ4Om6Y1eZk
	K65s73ysGqV1b0ElIl2p9NPoph83LxXOlYsAFZoWJgEnMloWqVsVDJVhFl8/9aE3s23iiskUqMStR
	ZdcbXHkagXgStWvd+VPxzUuXrCTGfWOkh4qWcfJdddJfsTN3Unjm95rEsA8ldjpWFmOXLwmmvVQzY
	sFzXfDnWV9/uOOZskqs34IN0KKDQopXLbWJ7eZvqk/XlKpYCBy+K0OO1Daf/AyBPksSKJHPHmhqvb
	/QxxiQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8flY-00000002ASB-2nUj;
	Fri, 03 Apr 2026 14:44:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8flW-00000002ARO-0IyQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775227493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
	b=Fc+sL1PskOneIYP/Cw8fFlboacmMiHFnwlgxxmGLnqf1fB5SPO+nxE8VoLcdNHv6ZM7pJX
	4WF60Ezs6UlVFeIze7fqrYWLatPo0KIWfptJ9QGuuZD4h0IsHPysdPOHcU3eUOsoKZHAap
	oa+vszsSiNIyjlr/Yv1EBy2q/3ztCk4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-XbatMhi1MzO6Dngf9gBF2g-1; Fri, 03 Apr 2026 10:44:51 -0400
X-MC-Unique: XbatMhi1MzO6Dngf9gBF2g-1
X-Mimecast-MFC-AGG-ID: XbatMhi1MzO6Dngf9gBF2g_1775227491
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89463017976so50706886d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227491; x=1775832291;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
        b=Grg7/meOr0QWDd9QFWp0nYCUzIXZpOl0ZxnDC7tcp0CITptk+7wR2dGUefFy9wBV2s
         hQxufCq9OjWgd3lZlE110CKyqP3llayDVIbV4Dv7TGEicCgN2GwpW3rR+LK4g0+P1d4Y
         aedt1+qBojMSZxzdI1Cpgusj8RKTD0EuyRYsllgimASh6En+x7+DMkdx5tcJk1QDvCM1
         lGXQnAHYlxDaF0BvzSAFVGIwHsfkAGQ3BeKVcGJqGwdkbRvjny2A57jIZR5d+DnUIq1n
         Fng3GL1op3zSG/w/mBOWBLwUTXPlgA1Sj8G60nXYPH+0DZ1fGGygpBt/SZwRr5JKAHCz
         WFXw==
X-Forwarded-Encrypted: i=1; AJvYcCWC2Dqy53ap9eCk+mDsV11A/2FZ9e8TQofyhYt+SJ3ei1v02AbulDHm/CVvuVJcfO8vQXs+gFciz9ofNJKVhQon@lists.infradead.org
X-Gm-Message-State: AOJu0YwpgGLm8xylilI7HkZsqrr5mIRJzzjdz+kaylt8dsDWQY6sytg0
	YSvTWoeSmz/crw8cDNDEeF/6UGmjR/dpG7xWeiyOBCsw8X3n7E7tZnHbDeAgwQ52EK9TGb5q7m6
	EKIsJPxws+XlkNG8e6KSp4JcwGpXc98lPjzx3yVXW8h7LEbgABw9jmQra0WoMZaA5FBph5AzzuK
	ob
X-Gm-Gg: AeBDietHSc3j6QHrrkVJdUKu5hLgfmvygM51NBGdTuO4hx24+0r2OIdc4frSBfDf/8/
	63ynTiU+dk3a+AzCwsUmI4RoPkz6Mt11XL4lqGV10XA70de0smmMekFlkzJlYcsuLQChnL1q//v
	toTKDVfqajQsiM6k2+ugq3FJ5EaE1oR/bHlHweLA7/82irQayS3MeFmc4yxdUVO4G3e1hOXnCZQ
	TSgAhFxKYya4YwKHI9dKJrvwDXFQV56m23SNrbEt5j9s3L+dFjwAO4aGU/aNC2rXbbjWbd9+42s
	QVlPdvc141U4luUU1N+2E+iHhuc0jg8ykD6KZDAesmAd/BGPH7uUihQq7cqNSAV8uY1WPR2kh1y
	wAmrSrrzs6dplD+TcOlYkzlBHDYFkyxWfYj6AGvjlijq3YtdIxsXgCcAa
X-Received: by 2002:a05:6214:2a8c:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a704caf687mr51587026d6.49.1775227491172;
        Fri, 03 Apr 2026 07:44:51 -0700 (PDT)
X-Received: by 2002:a05:6214:2a8c:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a704caf687mr51586656d6.49.1775227490715;
        Fri, 03 Apr 2026 07:44:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm58197296d6.22.2026.04.03.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:44:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:44:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <ac_SX1UJRqiBH2iM@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dfw_8-N8jpf6LdCsDDu-8ZJ5DuCyp-Ymggm-SZ-e6xA_1775227491
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_074454_195549_4B0B3D8F 
X-CRM114-Status: GOOD (  16.04  )
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

Hi Cheng-Yu and Yu-Chun,

On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		return ret;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);

I should have checked Sashiko before I hit send on my last review.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

It suggested the following:

    In the Common Clock Framework, .set_rate executes under the prepare_lock
    mutex, while .enable and .disable execute under the enable_lock spinlock.
    
    Could an interleaved clk_pll_enable() corrupt the hardware state by running
    its seq_power_on sequence concurrently with these multi-step register
    updates? 
    
    There also appears to be a potential race condition later in this function:
    
        if (is_power_on(clkp)) {
            ret = wait_freq_ready(clkp);
            ...
        }
    
    If .disable() powers off the PLL right before wait_freq_ready() is called,
    will wait_freq_ready() poll a disabled PLL and erroneously return
    -ETIMEDOUT? Is a private spinlock needed to serialize these operations?

Brian


