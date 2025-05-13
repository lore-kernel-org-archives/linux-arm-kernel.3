Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF4DC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm3KpWP1Rf7uSeuMqKX9HM7cqL/7satZxR0/tskkBws=; b=u6y2bXTljUayrhXOuxaAIOcMq+
	bPRcddzIYcVcSQiV3Vx3SLTmBPPp/FV4iY6gQPkgYHkepRUFklkqd4nnnymHXLCKNPJy7p8hVEiDn
	jv9MQnY8pY5bbz8FU4sI71kAPRmuCESM35MRVKxUA2qBsm4oC7qlEl9bzOSzk7n3BoycqUTY0i1oA
	sYhyMuOdC6qCutcLXji6uCI+pjkMqkKzsImC8w33DZa1T4LgMMyn8DW8YvcdSYOrf0Kj+WuOXCmoa
	94MmPx0piIMg0QVXngjIdqtCfaI1twe1ACmLloNmm3lnGygHBs3v/rX4ek8EtdHztn4JVqZy6wiJV
	WiUeI8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq26-0000000CXbw-2Ba7;
	Tue, 13 May 2025 13:50:58 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEppU-0000000CVax-1IOS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:37:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2221386b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747143475; x=1747748275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm3KpWP1Rf7uSeuMqKX9HM7cqL/7satZxR0/tskkBws=;
        b=Q+y1ho445H0OCIxV+Pmz5Igxys7DWsvdxIbVZHykZSCc2wHIUQ1Y/jnDHeayxAOqyr
         eceLg+Ffg1XY6LhI5A48oiUrvPtdBtNEmMZksiNesiUJufmSdmxCFtF/Wm9BKJY/Q7/C
         9X9tTHIp3jxR2M4t53B6vbK8czw1bYgckHWj9+PPYKD8QXfTzL3K1xjq2gfgtfiNOYNv
         VdrwoORBR1Yt7ixZBwMbJLql4DhYUD4awEeQwFstutzuK9IAeWlMrjAR0jKEo2yzUGpm
         0nl3GIjex3NKd3PoD0g8uxWwPtrKe9BbLkwxKT4reXpP680MyL3AYjqvJYTOHscxdiat
         StFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143475; x=1747748275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm3KpWP1Rf7uSeuMqKX9HM7cqL/7satZxR0/tskkBws=;
        b=r5DPPQ3D4Wk+2nYhhMvLOKB+bc1Q75hWIr92aExfJYrPHFhNgfx9cZWY0cc2+tG4mo
         p3w3bScvzyyP3V7We0T1n+QRmRNSUIMxzR5FDi7pV83G2lQytoJ0HvrjtbMOgfKPOLZo
         KW1YgzddzULbVaEgGBgdH8GDy3esohpXzlGd3rMcYqlUhlgPAW76CxASx99RT3sg0CFy
         nsar1pAhQTc1Mpi4L4AfycuFhDE09oV7S/jNKyLDXvV3HoDwV0gNfjmlUBFAhkaFsLWT
         jcKP/0yBL0WtP3ZEBu3PyJsYtPA7UW7rlt28CFE8TpShCNf6YwEDZMUJmG9UYl5jsXGT
         54uQ==
X-Gm-Message-State: AOJu0YxPYUlQC+H9bkp0vVN+1YUzVEQmp5WPjobrlNvptxD/FaCb1rLx
	4bOcuWmDwRlZvJtcXf96DCD2sWR9pK67RjnrxqN0tdhMQgNS5wwVNgQcRQ==
X-Gm-Gg: ASbGncssUIJ2juEYNMscqnLPhTaodLKGrBRBmMsoDNb8zy6H1XaVraLq9KvWJSTom6l
	MAVNdp42LYz6v1JHzgfKmfYUFwWCPTk+MMWs7GpDuGsjK1NzH5P8DrhVRgb1RltNOt6C3sgV5ZK
	gyc5DlS794f6DcnPQcT9c4ExxhPxV++bIrzRDqCwQcHlbAUtUEG2eZ0qNlBgvtkdjQMsbRNa8Gn
	rYadn2k/Ow0zvtSFo7fUjozLu/TrSlZ1rTbVnhfF3f1v12NTyHdNuFR/POQ784BPtsLDy23IQ76
	EyJl6JpOjATNu7pGx5DBebSUpsZw2iI8rHAbo/uotnzlT/mkjaxh/qyPik2nAM23UKBfBby28zY
	3szC8cYallVLjO5w0kUtjBcvr
X-Google-Smtp-Source: AGHT+IHpuPjA3MNTlH9t6DnGWKdjCy50qsZI97/whW8qfdcp4muFJ2Yu3JwYtRCkGxpO+WcpLld45g==
X-Received: by 2002:a05:6a00:4f8c:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-7423c05f1dcmr25293787b3a.24.1747143475208;
        Tue, 13 May 2025 06:37:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a38bf3sm7972694b3a.133.2025.05.13.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 06:37:54 -0700 (PDT)
Message-ID: <64390424-5c79-4354-a08b-b6ff7638903e@roeck-us.net>
Date: Tue, 13 May 2025 06:37:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
To: Sangwook Shin <sw617.shin@samsung.com>, krzk@kernel.org,
 alim.akhtar@samsung.com, wim@linux-watchdog.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kyunghwan Seo <khwan.seo@samsung.com>
References: <20250513094711.2691059-1-sw617.shin@samsung.com>
 <CGME20250513095656epcas2p258caa7e4c94ff04ccce72f51b2ba81f4@epcas2p2.samsung.com>
 <20250513094711.2691059-2-sw617.shin@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250513094711.2691059-2-sw617.shin@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_063756_358949_F8C54CDD 
X-CRM114-Status: GOOD (  28.95  )
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

On 5/13/25 02:47, Sangwook Shin wrote:
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
> 
> cat /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_timeout
> 3665038
> 
> [    0.208763][    T1] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
> [    0.208767][    T1] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
> [    0.208799][    T1] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
> [    0.208969][    T1] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled
> 
> If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk flags, then
> it will operation with 32-bit counter. If not, with 16-bit counter like previous.
> 
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
> ---
>   drivers/watchdog/s3c2410_wdt.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index bdd81d8074b2..a13768a11f20 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,6 +34,7 @@
>   #define S3C2410_WTCLRINT	0x0c
>   
>   #define S3C2410_WTCNT_MAXCNT	0xffff
> +#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
>   
>   #define S3C2410_WTCON_RSTEN		BIT(0)
>   #define S3C2410_WTCON_INTEN		BIT(2)
> @@ -119,6 +120,10 @@
>    * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
>    * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
>    * Debug mode is determined by the DBGACK CPU signal.
> + *
> + * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers. With these
> + * 32-bit registers, larger values to be set, which means that larger timeouts
> + * value can be set.
>    */
>   #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
>   #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
> @@ -126,6 +131,7 @@
>   #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
>   #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
>   #define QUIRK_HAS_DBGACK_BIT			BIT(5)
> +#define QUIRK_HAS_32BIT_MAXCNT			BIT(6)
>   
>   /* These quirks require that we have a PMU register map */
>   #define QUIRKS_HAVE_PMUREG \
> @@ -378,9 +384,13 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
>   static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
>   {
>   	const unsigned long freq = s3c2410wdt_get_freq(wdt);
> +	unsigned long max_cnt = S3C2410_WTCNT_MAXCNT;
> +
> +	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
> +		max_cnt = S3C2410_WTCNT_MAXCNT_32;
>   
> -	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
> -				       / S3C2410_WTCON_MAXDIV);
> +	return max_cnt * (S3C2410_WTCON_PRESCALE_MAX + 1)
> +				* S3C2410_WTCON_MAXDIV / freq;

This will overflow if the build is a 32-bit build with sizeof(long) == 4.
The previous calculation did not have that problem. If there was a secondary
reason to change the calculation, please submit a second patch with that change
and explanation on its own.

Thanks,
Guenter

>   }
>   
>   static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> @@ -534,9 +544,10 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>   {
>   	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
>   	unsigned long freq = s3c2410wdt_get_freq(wdt);
> -	unsigned int count;
> +	unsigned long count;
>   	unsigned int divisor = 1;
>   	unsigned long wtcon;
> +	unsigned int max_cnt = S3C2410_WTCNT_MAXCNT;
>   
>   	if (timeout < 1)
>   		return -EINVAL;
> @@ -544,7 +555,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>   	freq = DIV_ROUND_UP(freq, 128);
>   	count = timeout * freq;
>   
> -	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
> +	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
>   		count, timeout, freq);
>   
>   	/* if the count is bigger than the watchdog register,
> @@ -552,16 +563,19 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>   	   actually make this value
>   	*/
>   
> -	if (count >= 0x10000) {
> -		divisor = DIV_ROUND_UP(count, 0xffff);
> +	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
> +		max_cnt = S3C2410_WTCNT_MAXCNT_32;
> +

I think it would make sense to store max_cnt in struct s3c2410_wdt instead
of recalculating it repeatedly during runtime.

> +	if (count > max_cnt) {
> +		divisor = DIV_ROUND_UP(count, max_cnt);
>   
> -		if (divisor > 0x100) {
> +		if (divisor > (S3C2410_WTCON_PRESCALE_MAX + 1)) {

That is another change that seems unrelated to this patch. Note that inner
the ( ) s unnecessary.

>   			dev_err(wdt->dev, "timeout %d too big\n", timeout);
>   			return -EINVAL;
>   		}
>   	}
>   
> -	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
> +	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
>   		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
>   
>   	count = DIV_ROUND_UP(count, divisor);


