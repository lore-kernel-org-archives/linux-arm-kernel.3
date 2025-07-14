Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23F3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDmSekQrgZGL8r2lWAymZdEWRY9s0eH9Oe3pP00uIuU=; b=YCKvS5V1wcyDRs1nuB9dPMCFNe
	gVu6oJdEOzxe7ydILEVp+shCIJthLx0zLI7Vny6u32vQQcsCp+ATBWrkJUdeWvBpc4lAdm/ZSicYb
	iL3WJs5ckLMYU+umLYFCBOOZZ7Y24DHcvpU+ZvzDljI1RQECfolaNB4VQ/eIWgQcd5swRr31L3rHu
	sVFLNgcpXkfHg1+WCbgJuozPwqBq0fSQFaIQxUx5chgWBCrkCpSVeLKIoExKm92qHE5CVVMtdqr7s
	Yy7DO7GIjcTuRXB8yd+iahNeyiss8tEjANVJHGgVKoY29+1E4jCK3uotgIuN4pC3l4GXZ1bM0dxRh
	wZfc7a2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDjL-00000001UX5-1w3r;
	Mon, 14 Jul 2025 07:36:07 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDQc-00000001Rjb-3cTC;
	Mon, 14 Jul 2025 07:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752477401; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=uDmSekQrgZGL8r2lWAymZdEWRY9s0eH9Oe3pP00uIuU=;
	b=xNRojos26Gx9aVsOz3LWrULDEDh4JT+oMHqy7it7fSrvTmRpgic+c2sMth+EOEWsODf/xpvF9DMXwiRCyGy85tpe9MZa0dwP43XjqgQOY43eS65LpDaqjOraEcPPjJ4lDawUkT3yOp1tPI1tMuvckjg6W+d+fQOGmtzMoJPYwzw=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WiqeCDu_1752477397 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Jul 2025 15:16:37 +0800
Date: Mon, 14 Jul 2025 15:16:37 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
Message-ID: <aHSu1WVYXZ2N5X8X@U-2FWC9VHC-2323.local>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <20250714060843.4029171-6-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714060843.4029171-6-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_001647_655503_C72640FF 
X-CRM114-Status: GOOD (  20.83  )
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

On Mon, Jul 14, 2025 at 08:08:45AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The EFI rtc driver is used by non-x86 architectures only, and exposes
> the get/set wakeup time functionality provided by the underlying
> platform. This is usually broken on most platforms, and not widely used
> to begin with [if at all], so let's just remove it.

This solves the problem reported in 
https://lore.kernel.org/all/20250710084151.55003-1-feng.tang@linux.alibaba.com/T/#u

Tested-by: Feng Tang <feng.tang@linux.alibaba.com>

Thanks!

- Feng

> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/rtc/rtc-efi.c | 76 +-------------------
>  1 file changed, 2 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
> index fa8bf82df948..b4f44999ef0f 100644
> --- a/drivers/rtc/rtc-efi.c
> +++ b/drivers/rtc/rtc-efi.c
> @@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
>  	return true;
>  }
>  
> -static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> -{
> -	efi_time_t eft;
> -	efi_status_t status;
> -
> -	/*
> -	 * As of EFI v1.10, this call always returns an unsupported status
> -	 */
> -	status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
> -				     (efi_bool_t *)&wkalrm->pending, &eft);
> -
> -	if (status != EFI_SUCCESS)
> -		return -EINVAL;
> -
> -	if (!convert_from_efi_time(&eft, &wkalrm->time))
> -		return -EIO;
> -
> -	return rtc_valid_tm(&wkalrm->time);
> -}
> -
> -static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
> -{
> -	efi_time_t eft;
> -	efi_status_t status;
> -
> -	convert_to_efi_time(&wkalrm->time, &eft);
> -
> -	/*
> -	 * XXX Fixme:
> -	 * As of EFI 0.92 with the firmware I have on my
> -	 * machine this call does not seem to work quite
> -	 * right
> -	 *
> -	 * As of v1.10, this call always returns an unsupported status
> -	 */
> -	status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
> -
> -	dev_warn(dev, "write status is %d\n", (int)status);
> -
> -	return status == EFI_SUCCESS ? 0 : -EINVAL;
> -}
> -
>  static int efi_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	efi_status_t status;
> @@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
>  
>  static int efi_procfs(struct device *dev, struct seq_file *seq)
>  {
> -	efi_time_t        eft, alm;
> +	efi_time_t        eft;
>  	efi_time_cap_t    cap;
> -	efi_bool_t        enabled, pending;
> -	struct rtc_device *rtc = dev_get_drvdata(dev);
>  
>  	memset(&eft, 0, sizeof(eft));
> -	memset(&alm, 0, sizeof(alm));
>  	memset(&cap, 0, sizeof(cap));
>  
>  	efi.get_time(&eft, &cap);
> -	efi.get_wakeup_time(&enabled, &pending, &alm);
>  
>  	seq_printf(seq,
>  		   "Time\t\t: %u:%u:%u.%09u\n"
> @@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
>  		/* XXX fixme: convert to string? */
>  		seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
>  
> -	if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
> -		seq_printf(seq,
> -			   "Alarm Time\t: %u:%u:%u.%09u\n"
> -			   "Alarm Date\t: %u-%u-%u\n"
> -			   "Alarm Daylight\t: %u\n"
> -			   "Enabled\t\t: %s\n"
> -			   "Pending\t\t: %s\n",
> -			   alm.hour, alm.minute, alm.second, alm.nanosecond,
> -			   alm.year, alm.month, alm.day,
> -			   alm.daylight,
> -			   enabled == 1 ? "yes" : "no",
> -			   pending == 1 ? "yes" : "no");
> -
> -		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
> -			seq_puts(seq, "Timezone\t: unspecified\n");
> -		else
> -			/* XXX fixme: convert to string? */
> -			seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
> -	}
> -
>  	/*
>  	 * now prints the capabilities
>  	 */
> @@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
>  static const struct rtc_class_ops efi_rtc_ops = {
>  	.read_time	= efi_read_time,
>  	.set_time	= efi_set_time,
> -	.read_alarm	= efi_read_alarm,
> -	.set_alarm	= efi_set_alarm,
>  	.proc		= efi_procfs,
>  };
>  
> @@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
>  	platform_set_drvdata(dev, rtc);
>  
>  	rtc->ops = &efi_rtc_ops;
> -	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
> -	if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
> -		set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
> -	else
> -		clear_bit(RTC_FEATURE_ALARM, rtc->features);
> +	clear_bit(RTC_FEATURE_ALARM, rtc->features);
>  
>  	device_init_wakeup(&dev->dev, true);
>  
> -- 
> 2.50.0.727.gbf7dc18ff4-goog

