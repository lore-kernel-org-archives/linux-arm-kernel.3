Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30000C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5+2v1sY4AeVSWaNfB8Ebbw6gwnqPCWWxIR5v90l5No=; b=he8Bju8KNiMxBR+lB9zBBAOIWl
	S1GTEKSNQIXXo+OtYYKYZhtKmRCzHmFYBluDNN61wr9/IShn/CzaxBNHAfq3yMplT9dfBNn16twj9
	mdXGsm/vLkWvCnlF4VAqYx9mjhKpzJLwyqzhuSjvPE2g/gcz0UUiwjNxXn2o1v/EcFLkxgbrIZKQ9
	lSJkxVzWYrMqI3w3uWRY6nbIUt7AYtQjEVtzrLRDSlPeP2fflrXhlr3aUzw6rawk3JulWS/MMeztc
	ViGjbOk7u8ct1QCKaGtV90N5Bhl9FvBH0qrBgeSuzWigd5+qN8aJBFqN0kIEEO/gWn/dJ/iIgbewC
	jxZQAYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCvt-0000000EtAv-2KtT;
	Sat, 01 Aug 2026 16:51:33 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCvr-0000000EtAZ-213N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 16:51:32 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7eb63dbd229so1444454a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785603090; x=1786207890; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5+2v1sY4AeVSWaNfB8Ebbw6gwnqPCWWxIR5v90l5No=;
        b=J8b3R42nsO3SuwyxbspjjxF9xzf1EKeQmCtzfiLAaOZdV//E2MzciE3chNULsT3jPg
         vPbL04cYVLNvx5/4MHJ9D6JqqsgHMovOp41z2ZbXAIofUwvHsEGivzwrWRCVWORsb+rB
         fUvT7cV4qew5rWzUTxWFdEfLLQaB+P9aQkZBd7MCElPSnzYe3IkTwAPhkS2K1W67EJgX
         b7SNGQk5aMOv4toEQFCCQKRatvBg0x+FA8+ZhwgUNLhiEmgxpUyugqsRHwE92EqZYWsI
         qLc+xDko1cp4Eud1OrJ5HHptV0H1/jISuIZcqVJ7Ii5Otjcms1EOFPRpdPVuwSeBiYze
         WMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785603090; x=1786207890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5+2v1sY4AeVSWaNfB8Ebbw6gwnqPCWWxIR5v90l5No=;
        b=cRWsH/ZQh64ud65UhkaW6llVoNASTQKRzvtxdkzW/bzArWwC7JWf6tHI5CUmQu+OiH
         POEgHcmDfTLtpFEt3S/LlQx5x+Ev4WTOcLV16DZSHFez/RmsTsGsvao3Uacog8ZSjWmO
         gl+MMKEg60WPpx9OlQu2jNuGLjZ378gvgMvIQcFGZykSsn+NCQUQy9wEbhoLxPb72SA3
         SnnLhbZvzZTmpxk2fxTqN4ll9DyEYmZYgThUkrlFFNAcaTMdZmzKOoMK9N7bbtO/Axs5
         NgJX8GJPWv7tYX57KOsVAS3s+tUw+1GKPwLUbtHfsMkMelmGhEHPLyJN7ylUW6SBbtdN
         m5Rw==
X-Forwarded-Encrypted: i=1; AHgh+Rooiv/S2T/FYyG9iTmAWRBF+opb4/sHtkio0LaEorPyISjF1bnUX6MCw4VwtQfmrQHCUNS+S8sawSRFC963rJTq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf1o+YsLmx2+Q+sIEZgI6Z5nuN8UcC4XaWFiu8wPHPdy1Ddiw+
	0+ggIQref7vc22Glg0p9mRZ3WR/RW4AfYG9msCzbLDBWOkl6X+mINlO9rtSKTYjUXgc=
X-Gm-Gg: AR+sD10A6NtK+A7f3XA1J7KGzG25MdH/4+SM9ycOjqmMrs6Bfs4rbL2JfTAIS7dHRB3
	DQ/AQNp4rf4R7i/J0Z5hU0C/7ehXAkek7E24m3LilhriR6bn9eYbL7aNAbiN36DyHhZBdsXSr6i
	5zb9kbmH56oKAQyBW1eTw6BNQWCrZVvZTOoEU+vkL1KrqC/v5ZC3li+YTvtDBk8WnlkfYvUhrit
	aLiNmzQzqQFUC0lsJtGkhPj4gdU1wBQsI2VmxMlShnDHsNHTDX7bVnbzDc4zea5voZiOdKMWFjV
	Nex5fra0la3qOIHfu+WIqKpQ1I3LQMsIo2rFrzrGWfD5ncdMbXo53mJt5jCj7tvFOr902p7bxAQ
	b9nnh47zyJqzTBbiG7N55r/hLGb1MGpHZ06+8c8IwEzatbgw7bARPjOLsQ0CULsih0jv1dQp3N1
	jPywog6MioCmcVV6mFgt6Lu5q6sFDB1kMWVgrfZoWFfqtqcFkLf8o8+2q0/AGEOtaHZEPIGb1BV
	dXBN/q+k8xKPO4owIJKyX7yGgtERNJeaW1OjuI=
X-Received: by 2002:a05:6830:7107:b0:7e9:b4ea:2ef3 with SMTP id 46e09a7af769-7f1973ad4a9mr3229106a34.13.1785603090388;
        Sat, 01 Aug 2026 09:51:30 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed970adsm3586102a34.8.2026.08.01.09.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 09:51:29 -0700 (PDT)
Message-ID: <674b473d-49b4-4e15-97df-337991f98e04@baylibre.com>
Date: Sat, 1 Aug 2026 11:51:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] iio: adc: xilinx-xadc: Correct Write edge in CFG
To: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
 <20260729125455.95893-7-DileepKumar.Nagavarapu@amd.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260729125455.95893-7-DileepKumar.Nagavarapu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_095131_530768_E0D27774 
X-CRM114-Status: GOOD (  19.49  )
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

On 7/29/26 7:54 AM, Dileep Kumar Nagavarapu wrote:
> UG585 states about the PS-XADC interface configuration steps,
> REDGE is 1 and WEDGE is 0, this is consistent with the XADCIF_CFG
> register default value.
> 
> Current driver set WEDGE which is inconsistent with TRM, this patch
> fix the WEDGE parameter setting.
> 
> Signed-off-by: Conall O'Griofa <conall.ogriofa@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
> ---
>  drivers/iio/adc/xilinx-xadc-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-platform.c b/drivers/iio/adc/xilinx-xadc-platform.c
> index bd033315c72f..b113f904b8fa 100644
> --- a/drivers/iio/adc/xilinx-xadc-platform.c
> +++ b/drivers/iio/adc/xilinx-xadc-platform.c
> @@ -346,7 +346,7 @@ static int xadc_zynq_setup(struct platform_device *pdev, struct iio_dev *indio_d
>  	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTSTS, ~0);
>  	xadc_write_reg(xadc, XADC_ZYNQ_REG_INTMSK, xadc->zynq_intmask);
>  	xadc_write_reg(xadc, XADC_ZYNQ_REG_CFG, XADC_ZYNQ_CFG_ENABLE | XADC_ZYNQ_CFG_REDGE |
> -			       XADC_ZYNQ_CFG_WEDGE | tck_div | XADC_ZYNQ_CFG_IGAP(igap));
> +			       tck_div | XADC_ZYNQ_CFG_IGAP(igap));
>  
>  	if (pcap_rate > XADC_ZYNQ_PCAP_RATE_MAX_HZ) {
>  		ret = clk_set_rate(xadc->clk, pcap_rate);

This sounds like a fix, so should have Fixes: tag and be the first
patch in the series.

Also would be good to know if this is causing actual problems or
not so we know if it needs to be backported or not.

