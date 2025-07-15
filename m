Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9F5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=; b=inesbCLmZGztmMmR2c5AkZCMzg
	57Saq8X7zBYAMPjCHTzDcMtD33kgNMiF0H2RMDxhCz5LtYtjkRKYR1me1tsAIM6gsoNwDHyWRadpa
	I5RTYVBsZShhkSOK65+oJYHodFnP0Ooh5CXCj3LZn8UIvsXjbfZl64KkV3L/mcKet1ow/i1VinaR8
	KwNIEhvr3TZAGbMdwzHWuWD6gfL9YTtoIZrnWGpitlXXfP0gGW0088YzCa71Di03JP/G93J8FCS8S
	jT6oh14EiOqjbWCtoT0AsnJChxJNRraHGlIjTzVtEggjacZ1mFQ9+z+7k+vQBMj3u4LbiiSLmS8gy
	pURAH0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgvj-00000005Qzf-4712;
	Tue, 15 Jul 2025 14:46:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfcE-00000005Bp4-3qJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:22:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso40019485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1752585757; x=1753190557; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=;
        b=Jou3MRNteBV4z6NZgACLlcYM2yzhJZeOtP6l3tSws0fxqrEal52EGg7mF4oZNji13Y
         gdl0I7JQcqIBju1NNAhz/EuwhU/xDFWWDmq8WCp3HZBcPywKuL0z8jFtYNIaX9PH9qGy
         6Lusts5ly9G3n+6fLAnTxshULrSh50lL7fgQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585757; x=1753190557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61QFwRWr9Ndvk2ttgipTe3LJv9XUBOlZkiPA5AUFmfs=;
        b=n+zPrBJ11XTmu3vCpgHdE+2I4f2IEYuTM9OyzXmRzROz092ztwl+HmY3JqB0jrKJ24
         2Bigm6Iq+FFJUizQjjabDrUMddNV7pc1BGd/oDU+zSbb0TatXb8eHvv+R8py4TYB/EcS
         NMzAk5uWWGf0086qhEezv7AShpmilaoLVhfDnzNmQdDtNpply7wcVuGOkXZL0BiJ1hDc
         3KxCLNnSdB/oTynLuLxLss4SAFd2J9wVCIIuDYWlv5RBLYbAJO6y3a0sklzRW4wyMsPI
         wMfj0S/EiRxW+XkDSkxzPZ62A+s6ZQFnmMbtp8YgmXGfFGHu9bG9OKXz+Q27AtuU3c8j
         hn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1zfpMwHki2/jvhuWaYxchTyOLZkro9evjFHuQqfsjBnkCaUmzLhyVh9R20MxT1AfNlj5J2ddtrlKCb2wAsXsz@lists.infradead.org
X-Gm-Message-State: AOJu0YwX8/llqsgOmJr9ugMI3fchqRmG+rDBw//5av6l1i7zdgI7CzHi
	JrUCcYFLeu/lHVDsHDmYfKrwO4leElO6FtcSSY2rvn1BxPo00YT9kIHGJnbEkAjkhVY=
X-Gm-Gg: ASbGncveR6e490/4YDFsvXc10j9O1MWbFs11obdEqNqZI2EModrwr/ukW8lfNIhyREa
	8PJrlHNPs22D1Z2ynqkZ53kTALxOzxZYrGMIPjG4jVxEcEsj/MB6YfrkIyNIOeZwfwMIhkf/nSb
	1X4iAaE6zg3rODbGqgKWqehACKujpMTWONFfFOFIYqV70jbjAuvXP7yC4D1HC9LVJRZXvD7MVoZ
	Gk4XVr9dM6BiTH7LNRVzpOz8aB57qJnMdxa56mb6RPPdatHs1QB7BlJ38jsP5Ayc/7DVKtA3xZV
	kMS2c9EPo0jCLNCOuPxIX2tFUZ5BKpj7DhYcmkPwAykBtq1F1FlfkmKdaqoJZu5D7F9E6zGOfw/
	5UdY+iqUe+58qUVu5dKVF9ERVVakB1zhrvw==
X-Google-Smtp-Source: AGHT+IGd8c2xyf0Uxkux0OC1AuHlKA+muy38gHZuCpdnRoCjje75nBhjsGOEghV+rD/6jvj+dlKRcA==
X-Received: by 2002:a05:600c:1911:b0:456:1121:3ad8 with SMTP id 5b1f17b1804b1-45611213e56mr119039315e9.10.1752585757203;
        Tue, 15 Jul 2025 06:22:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45624651a09sm31053395e9.12.2025.07.15.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:22:36 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:22:34 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
	deller@gmx.de, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, sven@kernel.org,
	alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 15/15] backlight: Do not include <linux/fb.h> in
 header file
Message-ID: <aHZWGnJ9D72YFgNh@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062238_951325_FB594856 
X-CRM114-Status: GOOD (  18.64  )
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

On Tue, Jul 15, 2025 at 02:24:52PM +0200, Thomas Zimmermann wrote:
> The backlight interfaces don't require anything from <linux/fb.h>, so
> don't include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I like this very much.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I guess also my Acked-by for merging the entire pile through the backlight
subsystem, that's probably the easiest path to land this all.

Cheers, Sima

> ---
>  include/linux/backlight.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 10e626db7eee..f29a9ef1052e 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -10,7 +10,6 @@
>  #define _LINUX_BACKLIGHT_H
>  
>  #include <linux/device.h>
> -#include <linux/fb.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

