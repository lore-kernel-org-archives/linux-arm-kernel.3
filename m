Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A2C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e9pPG4Wf1yh7F8qunxHTq9ZSs1j7gC+eK1D84kln+0=; b=cqgij/TWc131rxU4KqrR/ozbMM
	bZYunFfnpxVBXeMEHaTBQ2njO4lS/AxJF3KJtlKdxa06NBsJR1mFybdd7pa9dykuYsJertQZvKpbi
	XCcJAdqL++sWNOPTEJ3wdjX40ftxkj5EyzT/w7E3kcYBZkLHMCUJHurEYxc3h3KnQ7oo14c9eplBC
	Jf4Zc2jAvJqqT9i++bEkkHXDkhE+mboHBJyzsLLDvshwBnmo0n4Ec1s9pTTYHIXDJycf1sb56foAu
	2UddBAB1t2da5n1Zzkz+vX+W8nUh+xrP/thueLXYkPMaKRP7bRHN4vfutPH5uS2wfKRsvqya37Emr
	tZ46zSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuIz-0000000HFPl-0wkN;
	Tue, 25 Feb 2025 12:44:57 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtfg-0000000H8vg-3vfQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A29296126B;
	Tue, 25 Feb 2025 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C04CC4CEDD;
	Tue, 25 Feb 2025 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740485060;
	bh=DUVqD32OXugfWSlqDcu3F8T+9NzMtljQrPVD82q8AAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZaGHlupbAt1P6YPlW0z2FHCs6uBsNeY7opWdS3UwkOP91znt7ISv0xL5CsKX9x47
	 h4Aqg5PTuJb3Fx8NyEMf2VnUjAkjmIRDAWiCUZyyA5l3YtKGgCOpEwUeEvMz0KJ40G
	 qc2sEITJjBmZSqeBbbMtYNjQcWBWzV/tuzA+iSixDqPBuyO/iJ8g7iPoID/Oq1i/HI
	 s3+R2ycQIHpw5bsIae8Dd2kyUG/Qs3dbx5I66PhMjBq4cp7pkFKtR0IO5sUiC11oqu
	 3HDKPNJiKx4Y6XcZPbn6pYNDiDjQSR35v1NcKTaoPToAPvcKJPD6hJ/nk7HtmJcRfe
	 yaPEDE3Qy9+UQ==
Date: Tue, 25 Feb 2025 13:04:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wbg@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 5/8] pwm: stm32-lp: add support for stm32mp25
Message-ID: <20250225-psychedelic-iguana-of-education-d5fff7@krzk-bin>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250224180150.3689638-6-fabrice.gasnier@foss.st.com>
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

On Mon, Feb 24, 2025 at 07:01:47PM +0100, Fabrice Gasnier wrote:
>  	}
>  
>  	return pinctrl_pm_select_sleep_state(dev);
> @@ -246,6 +413,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stm32_pwm_lp_pm_ops, stm32_pwm_lp_suspend,
>  
>  static const struct of_device_id stm32_pwm_lp_of_match[] = {
>  	{ .compatible = "st,stm32-pwm-lp", },
> +	{ .compatible = "st,stm32mp25-pwm-lp", },

No driver data suggests device is backwards compatible. Commit msg
suggests not, so that's confusing.

Best regards,
Krzysztof


