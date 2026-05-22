Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA80CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Z6hIMYgqhMrKKBiL1MJIdjEE5Rl1yfiYAVBlDccynQ=; b=lAfkJ5EjS0LkvWXCetUGVbI/4O
	tmgaXL7NldIDoxVJObT8mYYe2MaNUd+9OK5r9VsSO3cU+f9d8d7etaZHY1TzMWDMPSEOS5gp0nj2f
	7EXqrZ40Vt9H51rpWntgOlJFBb15BkUXFH3SZg9TAMlcZ6f9AiWUhItLqqA3UJHXPRSP0i9p1ncmb
	u8fo1TxUJTrNVGgOGUyN3oCX/boE5294dLEGeGxkQ2f2sQDycgGuwLci8xhMy4CM99/Uzu79ff6QU
	Jix09mvq+lPSq64gXgG/nzV1dgsbaAqSQoMUpyPnL0qc+sj+25zwijqDsFi/+kE9QJpUXtzpL21Gq
	Tk/EvgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPZt-0000000Au0h-0MVF;
	Fri, 22 May 2026 13:06:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPZp-0000000Atzi-2huD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:06:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4535421f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779455167; x=1780059967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Z6hIMYgqhMrKKBiL1MJIdjEE5Rl1yfiYAVBlDccynQ=;
        b=ai4Mu040uSSgDrO08UuXkzpaBDxl72ZjMBn7CPP/MRtzpbGkThB89Mmx76fzltR6Rg
         USbk2p5bmjBQEvP32qVHonPUi6XKp3+nFiJuMfQZJf0b3h80xiltnLHY1czvAcBaE/mH
         9UgE/9D35xVlJWWInzwSLmvHxOb+K8bDVDbboqX05FBmX86FYGmJodxIIGU/5Au4ANf5
         Xaa6hr5Z+Wgumxbm/SN8uL4y0twwsn+sAa2tS+hOgOq23sotOhiVgen3KdKqsplYG5vL
         33vrxzTYdYt7LTqOTHfrBhRnOplC1xm7W00JvQvrAb6e9QSaKksOCWwyjdEC+QRKsl9Q
         +Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455167; x=1780059967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z6hIMYgqhMrKKBiL1MJIdjEE5Rl1yfiYAVBlDccynQ=;
        b=QXMAyds04iiKKtBLPtdFBNpNWf29CilpRp1/Kx/MPNScO38YEJeRLOri3rTocYXo/3
         lU5W8Pn7ZTZAspMiZ8PO8npGL7KJPoYsTWNOHDoiucGl/jmkUuP/5WK5wL1LE+V/pEMD
         9gaXRHHaT4/x4kFMgrDoYWhrG/nCDJHrJoatsQpfqLtRNH9y4ZYj0LvZniu/AX6/ipXu
         9WHDlmP1Q6fty/OpQZdBYGRguOIBsN7P783XYtZYVjdxTn3EkKpLWSG6KHr8s1Qc2XzQ
         cPQTuNalnSClQM9JYx13Qo96+n/MzJyGCXLCc1g2QvjkoHxS2wud477VLKEphGCL4wNy
         UGOA==
X-Forwarded-Encrypted: i=1; AFNElJ+9/aF6KCSvK4je2ARbbXlf9GAvyBXjVODOeQTf18lT2IZVTHC7oOI2tCTKTlg3ehlhj5T8HKtnQCnfjtF8mAup@lists.infradead.org
X-Gm-Message-State: AOJu0YyTG1comuPHRCMJPzAqNNyWdyyaMJk+fQD6G5WQQHxBLmoDkKZU
	BdIh4OCl5VkbY1uxIvHKHdPyD7B2JzUjd7yFkuXM1VqBaWMHHVyLzt6FRdytwU1OSMc=
X-Gm-Gg: Acq92OFU7wNTZ2G4okiLi3m6OrDKlYBEnYenc3tmPRvyTqkxAFGq4ozlVZaRFuL5l4G
	FcvrxFPNoxZaNhZ7viZuCiKXvDOxOsPF6Y2MUz2HbOpi3tPCMyeaAlGSdjUBbr5NcffZbBK4kz/
	Xrh0itwLTIGPZxE8Ay1PwH/OAMAGt0obFZlUkdK7+p/S3eFPnjOAogSzwIXIq+SdUVhLCocjF+8
	xMzg6AcbSmoB03S5LbFrs0FqqvUXUXB1veBH4lpMLH0ZqGBm9rpmPLx94ikNyJtHPU71dJAEGYW
	f8nb+mDgcxaf6R6Bk68ekILNDTMHwgTmBfAmcmjzNAHXo/wDklR+7l/9W482FX90eKVJdnltJV6
	OylxzL07FZ26R5pPyOfbcE24g8CU7n/ZLNRu+mFmZuuGhMZxmBoIz/C7C+psgD0+1/kFVSrByUi
	LOOcq6YwhvllP1lP3zw0HZJbM79LQ3LvoGvgZzC5vgPCdoZ31xDGqcjOI=
X-Received: by 2002:a05:6000:2384:b0:441:3144:efc5 with SMTP id ffacd0b85a97d-45eb38e4fd0mr5515739f8f.42.1779455166814;
        Fri, 22 May 2026 06:06:06 -0700 (PDT)
Received: from [192.168.42.79] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm4196400f8f.33.2026.05.22.06.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:06:06 -0700 (PDT)
Message-ID: <a0b17be8-f7dd-4d05-bc6f-28b32d0b0785@suse.com>
Date: Fri, 22 May 2026 15:06:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rahul Bukte <rahul.bukte@sony.com>,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>,
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org,
 Sumit Gupta <sumitg@nvidia.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_060609_717399_DC947EAA 
X-CRM114-Status: GOOD (  28.56  )
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

On 5/18/26 12:19 PM, Shashank Balaji wrote:
> Commit "driver core: platform: set mod_name in driver registration" will set
> struct device_driver's mod_name member for platform driver registration. For a
> driver to be registered with its mod_name set, module_kset needs to be
> initialized, which currently happens in a subsys_initcall in param_sysfs_init().
> The tegra cbb drivers register themselves before module_kset init, in a
> core_initcall. This works currently because lookup_or_create_module_kobject(),
> which dereferences module_kset via kset_find_obj(), is not called if mod_name
> is not set, which is the case now.
> 
> So in preparation for the commit "driver core: platform: set mod_name in driver registration",
> move module_kset init to pure_initcall level, ensuring it happens before tegra
> cbb driver registration.
> 
> Suggested-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Patch 4 depends on this patch
> ---
>  kernel/params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..ac088d4b09a9 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
>  
>  	return 0;
>  }
> -subsys_initcall(param_sysfs_init);
> +pure_initcall(param_sysfs_init);
>  
>  /*
>   * param_sysfs_builtin_init - add sysfs version and parameter
> 

The change looks ok to me functionality-wise. Sysfs is initialized
earlier in do_basic_setup() and other code, such as classes_init(),
calls kset_create_and_add() similarly early.

One minor issue is that pure_initcall() was originally intended for
static variable initialization. The file include/linux/init.h says:

| /*
|  * A "pure" initcall has no dependencies on anything else, and purely
|  * initializes variables that couldn't be statically initialized.
|  *
|  * This only exists for built-in code, not for modules.
|  * Keep main.c:initcall_level_names[] in sync.
|  */
| #define pure_initcall(fn)		__define_initcall(fn, 0)

The patch stretches the intended use of pure_initcall() somewhat in this
regard. However, other code already appears to do the same, so I guess
this is ok.

Additionally, I think it would be good to update the comment preceding
param_sysfs_init(). It currently says:

| /*
|  * param_sysfs_init - create "module" kset
|  *
|  * This must be done before the initramfs is unpacked and
|  * request_module() thus becomes possible, because otherwise the
|  * module load would fail in mod_sysfs_init.
|  */

I suggest changing it to something like follows:

This must be done before any driver registration so that when a driver comes
from a built-in module, the driver core can add the module under /sys/module
and create the associated driver symlinks.

-- 
Thanks,
Petr

