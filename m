Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B78CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP1xYRFn9L2tLIdTryxjblP9c+avAGhHub41HiA5F0c=; b=ZTebMxfsLcWdEbx1SHs/r0zk3S
	nk/OEeAdmIm1qvgIQ5vmDmdw1wzad1tCJRrPQY2UhEcBGK9obz2gjLQTgr/RuJfBM8MZqht8vGSEG
	lYH5M/AE4Ozd+84QDp4nHwoD7DHG2wyGnNkp5KfbNPUGNeokfbim52QSk8mJVUDAuFaAcUrM7j0IO
	FPZXn2CkQG9MACH1oi7p3gApxtUvCMk/OFScm8aGip2IZuVbGhUAoEfmxohlLzem7g4HuH2ry7ifo
	9besPIeFXxQh/5CFvpygDI/akxeK8gIsIzfk4w9bCeGyyIIkPZf9+KfeBizHiKjiUULtOZ8kQdqAK
	QFFWivnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLuC-0000000HMl8-1UUw;
	Thu, 16 Jul 2026 13:13:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLu9-0000000HMkS-0kjv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:13:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so12876465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784207611; x=1784812411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HP1xYRFn9L2tLIdTryxjblP9c+avAGhHub41HiA5F0c=;
        b=DWDGT1aKBYrMnEEV8Hlmhc8bZyRPtLrMOeZ7PLa2XIWFVm/BJiH0Oxmjjjrgykq/3Y
         B7EJUlGsPB4rc1snBtdJ0jH7wR2oSGhREhZxuF2TOEQI6CQ1kx6MiFnHvjnsPaseMrqn
         JVkjIUybKMObWq+CoyH90WXE+LHw6x7swvoV11LiiMw2rvK1DNE2CnD3BC1sRcTsIudY
         bdMUyUSedRGx+/vc3HlPggFRFIuaa5t/y5VA/AqmRKOvmr2LXexcdC/yobGDkM6WJy1+
         Iiy50yUI567EmQFLNI6tClWIBnKzTYh81lfeYi790hcNk9XLPWd1sjGb2LaXBg5bJwnC
         lqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784207611; x=1784812411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HP1xYRFn9L2tLIdTryxjblP9c+avAGhHub41HiA5F0c=;
        b=i1KmD3TgIyTQwVATcHdY8k4TA8hTA6AmlbeKFjZ38cri48qjIn29ZaLj8tOtA0/Hgm
         B+KaZ3wZiG6rlVDPBUnSPVqK7LaJn67qhS3+XtfTIFwLssDwZoYGqUWMZknZUEasHZYA
         ValnTu5jZV08CivKp46HMHJh1sYZskWdIjSpG6uRkSmS8QhXwpvs1PdcCx32rSRAKAwL
         ddJnAX8GHG1lrSwU8k4nrOPz+pO7t3qmwrWHutmPPsS4OowNHUDA/ZuWiLEzlltd821e
         7DZBnPEqc+2t6v72wc53F23CjtdiQojk1+6Wm4QR29Ubo3zJmyPazmbkcWYakRiQcAVP
         +/qg==
X-Forwarded-Encrypted: i=1; AHgh+RqbXVQWvS9j8nKXAgcwjqWJdb39uphT4slCPfgdgBDb0DRCvEMtU9XLObL9ycLzEL5LmIzYSQMPxmh3jTpcE67v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb66JI4nCnC0TAfYaETGk4LoqHU7c57WIv1bNvq3PZQkmzejAg
	dWm31Py5zgQoLK5pGZVQzcIwqwvE3uflwbECCxYVHpdMyoxR6hrek+tes6CR3lkn0+I=
X-Gm-Gg: AfdE7ckr4Gcy6NIJq2pAB2qKNBHx6Eh16mTEFSraHPljfabXsaB96ONdmH3LEWS3Bse
	J2WOTT9f7xKzRT7kTGqturFHY9GuYzQ4G1/oazf8kSrCR+WCSY3IDH1QL7Nq0tUM1kAnIEvjqAi
	l/cEptz9YC0TAg1X28vqYzerUN/k2qC9T19EqYb57FAog1XiZQ2lSmWijZ+nGaFtMkEn1scCj3t
	aamvWIG+aeJQS8SyBnDlAyWUPj26iSlZxgJtWlflZ4WKdaR6h832lEnw5sEFYVRF37HqQmFF7ss
	H/7Zy17SG4Qng6Cwgu6HkOl9GuAxiJeqLLLtAij+P/867NpNxXD8BNmzcriq3rYNTL0YRxSxwIB
	FjLHFzZD7zYsLbYyYSMcUVkoN7LK1W91rNUBeZgekvjV0Z0uMgIzcP+tN8pV9uE7/zZ4PIVxxIe
	LGbeCr
X-Received: by 2002:a05:600c:4ed2:b0:495:3c8c:c16a with SMTP id 5b1f17b1804b1-49541248d08mr37275695e9.0.1784207611203;
        Thu, 16 Jul 2026 06:13:31 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c7006dfsm90819375e9.1.2026.07.16.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:13:29 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:13:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 2/6] printk: add bounds checking to boot_delay
Message-ID: <aljY9xfK-TcU_Fpf@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-2-574547b8f71b@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-2-574547b8f71b@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_061333_237696_03DBE11E 
X-CRM114-Status: GOOD (  23.37  )
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

On Sun 2026-07-12 11:20:33, Andrew Murray wrote:
> As the boot_delay kernel parameter represents a duration in
> milliseconds, let's set its type to be unsigned int and add
> bounds checking.
> 
> Please note that the existing pr_debug will only be displayed
> when boot_delay is non-zero:
> 
>  pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
>           "HZ: %d, loops_per_msec: %llu\n",
>           printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> ---
>  kernel/printk/printk.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 31aabdf8248cc39c54ee11685d4a37deac1c174c..8be562c9be277670ba3209ed1f810fc87175848a 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1291,19 +1291,22 @@ static bool suppress_message_printing(int level)
>  
>  #ifdef CONFIG_BOOT_PRINTK_DELAY
>  
> -static int boot_delay; /* msecs delay after each printk during bootup */
> +static unsigned int boot_delay; /* msecs delay after each printk during bootup */
>  static unsigned long long loops_per_msec;	/* based on boot_delay */
>  
>  static int __init boot_delay_setup(char *str)
>  {
>  	unsigned long lpj;
> +	int boot_delay_val;

As Sashiko AI pointed out [1], the variable should get initialized:

	int boot_delay_val = 0;

get_option() keeps the original (random) value, for example, when the given
string is empty.

[1] https://sashiko.dev/#/patchset/20260712-printkcleanup-v3-0-574547b8f71b%40thegoodpenguin.co.uk

>  	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
>  	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
>  
> -	get_option(&str, &boot_delay);
> -	if (boot_delay > 10 * 1000)
> -		boot_delay = 0;
> +	get_option(&str, &boot_delay_val);
> +	if (boot_delay_val < 0 || boot_delay_val > 10 * 1000)
> +		return 0;
> +
> +	boot_delay = (unsigned int)boot_delay_val;
>  
>  	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
>  		"HZ: %d, loops_per_msec: %llu\n",

The problem gets fixed in 4th patch. But should fix it here as well
to do not break bisection. Also later changes might get reverted from
other reasons, ...

With the initialized variable:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

