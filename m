Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465C3C4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7KPqKKtt32qdvy6pdhb4zQY6/OdX+QnrgvqOiCn6pU=; b=crn6w0OLciGFbwHX9Hg5FPKkNO
	Ke1VKEC4Y6DiZcEopM9ILJCqrgKiN7Rc3t4U1rY/LHt3znhgkpecPbVMFEYK5ZhSKfdCjDv0ZjQVV
	xChX/DCA2l6iFgn1nW7kdYDvUetT2sWQ0Ncod90NMls/1hSU56WpSX0qlC4uwxVtLOIOHhqPLmmlZ
	cbV3TwAlYx5iir9/yfTXaDbYZQcCNUUxQXq5krtSz60kJPKcxGT7/6td+yb8olwTO4oH8Q/IQf+IN
	n9FWM8X4RyxuBx4aMwsdL+D7lXA/WDEig5TgqDwyjP3fLgzbp5ac/hiTjTx1U2gTD/MAFktLKIyrh
	zRwzp9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU7w-0000000BY9M-27am;
	Wed, 22 Jul 2026 10:24:36 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU7s-0000000BY7c-3O5n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:24:34 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E47607A0141;
	Wed, 22 Jul 2026 06:24:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 22 Jul 2026 06:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784715871; x=1784802271; bh=d7KPqKKtt3
	2qdvy6pdhb4zQY6/OdX+QnrgvqOiCn6pU=; b=PNyLSZhQMIjX+s9LApIcugWgZr
	8RJto+1uQmDxR+797Ab3+s9DxXNrnriBohsVcUbNlNt5zxa58EOos50Sfzjt+QCQ
	i9BobrwpD2KaffuwlNldy3UNSBn54gLZIpQ3dgKLaSzHD5SPj+q2gudKkjeZBtUN
	C0iggNgeh2Yi0JTPD8HXFuW1F14ML7ScJ9qLeTYP02iAdtJqCRN9XdWIYlNsO5r3
	2CfSMeIzEHN0fqDMyKUdAYiowG+FbeB3cwSuAa+2Yh618Vi0Rma3CZE9LnNOwKo+
	2N9Rn9XvLTdPfVeHAiqFRhxrWf8sDkOWa81z24cmJynGvWi9XERnN57bvciA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784715871; x=1784802271; bh=d7KPqKKtt32qdvy6pdhb4zQY6/OdX+Qnrgv
	qOiCn6pU=; b=fJoKYZRufhJM22N65aLY1OcDi2jgt2GOVNoLtW2Y5P8OmseV9CX
	21or68/LSP8ew/VhK0E9dLYRX8waN6TuXf9yrhBt5nvgjWax7aro6LXa2LfulZCe
	VE6aOwomiDDW0wFOL8UyJTR2WvVwkdwaGI1HxNzb3ALi8QdONQgDKKlW0hA++i5O
	V75Ktx6D3toIGsX/c/cEMXg9hoEV4Le7M0qrTQ7JjwJi3OS4V01LwEjSjibDP3Ib
	FwqUi2WQ84k54RZ99d1h54eIhVhuegYnXZmbjcAMvaf5ikTDZjTDq+ecueNN/Xra
	qqG9zLtqKCTDJDsiUQ7+zmL4/ZBtKxIaXew==
X-ME-Sender: <xms:X5pgavF5VobabwctdUJSi54TqKjyGl9o2CnYAaO663t1gTwWDGJt5g>
    <xme:X5pgao5YWMRe4gcqSrccwNUMWNqCmdbdoDnwAYBB3xz0gM3qK6J9AEE6ab9WkoHUM
    qxGhgvN7fT1E88lXpnAoNPrY7zfXb0ekDPp9-ryImBXm8BlJNDXn8Q>
X-ME-Received: <xmr:X5pgalmBuzOUAsSr08pSRYWf8Ix5ZBubVmKTCVju84RYCxHqqhepqLwgIBYjt1ILTZnE2lgl-DlaOT4-kmREsVjlmCDRn90B2mI>
X-ME-Proxy-Cause: dmFkZTFR4qs4EzJbzKeAVnWQV4FuYpX9MCEikNX0fQpLTgiwJwvXpFXR8ZcfR3FjZgIlXL
    2IYhwWJDSLDALFeP3nrh0kStT1Vg4aX7W4wIo41jab3eEk6zTW8TgM9jk32vgYakBUlw1X
    Uc2Ndl7wl9YUY+E4/SA+lGWFdt2z1K7L+kKb0MxZfJU+I4Fhp3JMttrP8m91O4sJCWRVp9
    mR2Wxtuf3Weeju/eMDM18yXKM0e8BgV9sURH/GO2K1uRsdZ+5MTr5DkanEkjF0Iy43wEK2
    jSk0/t3pZdUO9vv7+2igz0Q7OaGAOrJUFP9BfBhcvtK2IxOCiSXzX/8jg/O4ojVk//7Yoe
    +P6BzpWV27uIv3uUqBYC0rgiqgbB+gg6G3qpp60jLwSUMnO9WpMk6yE7mNQ2lnzl0ht3MK
    kIxt6IuHvNgADyhja2n8talh7Ljyfftj7WLypBp5Af9QFR8FhAugsrqU5e7Ou/EHLaV14V
    CYWeKcIIl/TNYdyQsmnJTeHbNJQITQRoaNd5MAqPbiasCEiS2uO9pkvV+iIUzLSadgTWKb
    T9bL8NMJYlSpuAEdF6in+N0Sww/rE/ITATpEk8td1N7t5C42H6tzSp3HMNzhqVfSHHuIkB
    ZpwkjlI9eWQztJXGRvs/ejpVxlKaXk2JYHSudZA3d2Pq2rh3dVko6V/P2ewA
X-ME-Proxy: <xmx:X5pgaj4KjRmzHlomMjuRDoCLNp5ilCnr1jdvcMPYytOc80-u0DXQAA>
    <xmx:X5pgamTohimYc8LOelQxWT7dkXc6eLarokdnHcxw9AGxtVHuvejuQg>
    <xmx:X5pgahxCbbBCeIOEUlU-ZWOEuBzbPsbPl4SRTEg4iMTkvldRxD1jww>
    <xmx:X5pgauq2ehUIREMCCXcNvG8KjNr1Lm0JDONZupyAOVDoMADKtFNpaw>
    <xmx:X5pgarB-YygeEoIA-CoL5IS75cOnbpXN7sWseERvwmYZNrqhdU1PQ7h0>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 06:24:30 -0400 (EDT)
Date: Wed, 22 Jul 2026 12:24:29 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
Message-ID: <20260722102429.GB4159739@robin.jannau.net>
References: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032432_914027_93244702 
X-CRM114-Status: GOOD (  19.34  )
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

On Mon, Jul 20, 2026 at 09:25:10AM +0200, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
> should use a true u64 instead of unsigned long and "knowning" that this
> only runs on 64 bit machines, but the core code uses ulong everywhere,
> so this should be good enough.

It depends on 'ARCH_APPLE || (COMPILE_TEST && 64BIT)' so it only gets
built for 64-bit architectures so the unsigned long won't cause compiler
warnings/errors.

> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Minor style fixes
> - Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..5ad274a1e6ae 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>  	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999;
>  		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
>  
>  		if (IS_ERR(opp)) {
> 

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

