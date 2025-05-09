Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5AEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=; b=b1T66QWH4SbVcLX0mye126kKbU
	/uqmFn/CZoLfTqmXvS7cnWYEvcCFCXkuL1uDCqlY0pR626FegPe1KBJRdmPwAqrl4qlGIdtIA8jiI
	PcbcaIZoMuIhzCQvs4L03/96s4MOWmskS2dWelBj/TPi5VT+ku06AahviQ8BrB8zRUMOfPQac+4NJ
	7hcLNwcV3kE4fi9LIb0U6DT9JArQIKWgRoEaVskG5EG0HfwmZXGJ2n585lrlpV8uQbvixvJ1sqABi
	Adu6O+0aSgOmY8HjL9oMJtkWPelRy8keTm4Yjguynqw84JFtxQQ8fPo+vf17eJDkljlwX6AtX01uk
	8Bf0K0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJma-000000033c4-3P1p;
	Fri, 09 May 2025 09:12:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJ9O-00000002vwp-01ZG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:32:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0be50048eso1088770f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746779528; x=1747384328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=;
        b=ZuBu78EPezi2QLGkZdE0XU3He/UHH51huThNBMA+vR4uAhpVN37pabtvZfDN8s0Wj7
         9Q+nMTruWNKUW8K1rUTt2/KFhT2Hj1co1FtDxx7CHvXoyVsUwhJSVoAU/DHl5R2g2QnP
         vbOGaCWy+LDeu5Qz5mIBBADygKrA/0u5qEftGjKq0zTTO124+Z+1CKLlR9FCfLUc8Yje
         sBsGnTOJ6AEfUPsNve4XUg7vBgcYk480f4S6Bxp27paOxQ19SDW6qdGke/20CDXYmRg7
         zZUVtxwfWqyadjzE6LstUxeKy3iC0ImeahDzj+doU5xDOScVzGVHKxeAnhthGl45huSm
         M/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746779528; x=1747384328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiF1pbiit8RXJodj15L4E9c2gnVhsdzQP7MvMTnz+gk=;
        b=oYTn5vUH8cmE6kdbaWdTW4pbPRNkYRt1BznVduhJz6nPrpm0jP+V3xLQDso0ozDmET
         whxxnVZ468AkhxbSK4D8H++AzieLGN0DkEwxIZIrSK3ry2nP/w+MlpC/twwTRZ5jOlvE
         V+CIcN4tw86RwYgLmYKcYiHCdqh414RkSWVmMEVEUKAX+bBqMOGdGHRG7yC/MdJDmVNR
         IxwqDWFAb1BBDfgIYZ2khiNi8Wbym1y18bbbfSC+L0JDh2CzM32DRYXX+I2qEIzUh02s
         uiSj4DqKu51Eh7aDtlTHVQEqhECtH8ni0lOgYdf11o9jfuvZmTMvh/UEbAD1awgZegqI
         s2WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZY2apBz73qqfu0rENbMaUdwWmuNsbpcXpol9T9I2vAkoZHBgzQXN0zYawzFuWV8B8RLhydqpveW2WvJ3yjzKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YypWNXrTVl9N45K+f4Mlg1TD9COAnnZw0jGn65o3NuRphkH/j78
	kXGFSaeeKP33TJE509IKRTIUbS8KDr2+vG49rRVqWGg6QUJaE9Ve/shEGjRbbI8=
X-Gm-Gg: ASbGncuyGZx4LXjB/69A6sm5VfIihARbMJrGDFYQSyhXYNFj5WTf0ZGQbpUM9QoPdJz
	y7xTKibrXd9hnmELv2m9+CAySP7DbEqGejGO4vIx3I042MYYyw2Afed6zZNBJ4wk+KoDC8ccq4Z
	V62bgvqZsVMYKNOUHELYPgSHgn/71JUfKfLvA9fQAv+rHUvxkA9SK1rDH4io2FiFSd5X/T3DyIV
	JnPGmInBcK0d+AyydRMqmpvTiw0+RGx+BEfpHiO8+CaGmA1QhuBSmhb99PaLynDbC+xLzwLDt/q
	sqMVTfG2rVyJ8Vh+R/Q2gYk45SBI3h5M50kOk/iSJSpkQY4Vm+r2d/zd
X-Google-Smtp-Source: AGHT+IGo7ag956w5i3W9+O4Hysr5DbRbNHyxYYXKoci+clSYLagmnbvGr8QjyCHV5wNtMeLk2ElqtQ==
X-Received: by 2002:a05:6000:2485:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a1f64328bbmr2116798f8f.13.1746779527863;
        Fri, 09 May 2025 01:32:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4bbf0sm2480709f8f.82.2025.05.09.01.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:32:07 -0700 (PDT)
Date: Fri, 9 May 2025 11:32:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/3] memory: Add STM32 Octo Memory Manager driver
Message-ID: <aB29hOrv0nU73RCn@stanley.mountain>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_013210_058090_B995B963 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Apr 28, 2025 at 10:58:31AM +0200, Patrice Chotard wrote:
> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		if (enable) {
> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
> +			if (ret) {
> +				dev_err(dev, "Can not enable clock\n");
> +				goto clk_error;
> +			}
> +		} else {
> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +		}
> +	}
> +
> +	return 0;
> +
> +clk_error:
> +	while (i--)
> +		clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +
> +	return ret;
> +}
> +
> +static int stm32_omm_disable_child(struct device *dev)
> +{
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *reset;
> +	int ret;
> +	u8 i;
> +
> +	ret = stm32_omm_toggle_child_clock(dev, true);
> +	if (!ret)
            ^^^^
I'm pretty sure this was intended to be if (ret) and the ! is a typo.

> +		return ret;

If it's not a typo please write this as:

	if (!ret)
		return 0;

regards,
dan carpenter

> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
> +		reset = omm->child_reset[i];
> +		ret = reset_control_acquire(reset);
> +		if (ret) {
> +			stm32_omm_toggle_child_clock(dev, false);
> +			dev_err(dev, "Can not acquire resset %d\n", ret);
> +			return ret;
> +		}
> +
> +		reset_control_assert(reset);
> +		udelay(2);
> +		reset_control_deassert(reset);
> +
> +		reset_control_release(reset);
> +	}
> +
> +	return stm32_omm_toggle_child_clock(dev, false);
> +}


