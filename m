Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95201CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAHycA+rCv3IP7skEZFX6/tynpWg60FhTiaPBN0RaDI=; b=OgKM9VcEbgQ+eRnAasjc76RE/n
	Q3qSaj8poDQ7+V3mX7h7y/sbeyth/J5s6BrBDkZljNMzqnJFdYcJDK0b+YvMGz6SnZ+uk/BuwO74C
	41LxahUB2Clq67VGwc5zasOcjx5fVYnrh48L1LwcNm8ksosQwHhdO4K49vCwEo0z091aL/iRqojPZ
	Qu6+YHD5/zBRLjNQ0ULv5jLc1AE0OY6SV94DuwWqXFhwdG05TD3wSWWJ4iV8m1jzhwScw8OnwcXbL
	jGvQt9T8VcQ592kMFUaDlcDQKI+vo16tALKMO4O3mM/GT6ltlbIqqR98YqV4axc6nwT/+9a9uaItO
	OixJttgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsu8-00000007092-3Nwu;
	Fri, 29 May 2026 08:49:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsu5-0000000708U-39rf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:49:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso88051405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780044556; x=1780649356; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAHycA+rCv3IP7skEZFX6/tynpWg60FhTiaPBN0RaDI=;
        b=vib5CelE+q+IcQSDoW2ZXZ660DDXelZvOpov205StSY1pbteyaQFIFDxfVYJNZnRlP
         yqvsoBMwJj1j5hmZtXkx9smIpAUpl+Pcums0zBGp75lsyJROEkS7eVZkQRWks8l3UD8B
         O3s9ukUL8wSMc/jrBHq4xmjjj7kWUvh/zT2REkmDJIMz0tIfGbJF9nAyJ+2LFJDeal7Z
         E82Pde8kXuNDJgFBLwMHr2MRTeq9e3xI8GYXELxhRoPTKTp0hH5VF3fojKzB1vIE2kqI
         mMIEk5j+BYm+p/Mga+++CObwpKqUbCHEpbFPHJWANJgXea8BMiE2vGqZw2g9kRe/Zu6S
         oU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044556; x=1780649356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAHycA+rCv3IP7skEZFX6/tynpWg60FhTiaPBN0RaDI=;
        b=GLl5On4yolU/XRlAW5NRcMVcB5XIDL+C6nPUhSZVhq0tEN9QkDU3Sb2qNgtHHifCo7
         3D40oU+w9SEsHumE03pSPLDJ2SZ+lXvjqV3bk099uSwBRwGM8XDamJdxAM6a34GDIB3Z
         26k25tBc9zNThAnqClG16GSgnju8gZjmn4uFzsizdRGzMkxSEtXclTRHPFrIzV/KRPg+
         cRirLNiZyKLqPwxi7WEe2N2YBKE73BGLUzUg2dvi9iaRcD6dnpYoCe8LdQsfoynAzlSx
         QM+1QzL9rUa71A7zt6K31fkqOzhHSmsvhTTrbEnmmA/zC/QxsrjdW8kOl2sPU0lwFknR
         YB5w==
X-Forwarded-Encrypted: i=1; AFNElJ/WpIC0EblHVgI2gQYUazahAMoJR+/mV9tgb8iwZdIIFAmGmQdyk7DbSCMvPlQZDs9lXxaGmSTu2woLwORTsYvP@lists.infradead.org
X-Gm-Message-State: AOJu0YzkVUBI7DlKVANCOh0X6c0B7a2jdD/ZNHt0bu2RuoskH68AqjYf
	2e726w+CM2rLd68qVcu/y2CdVekQkQbTBIUuBC/+kV/OWVOGJ5NUCiKBRxhbmqjcE3Q=
X-Gm-Gg: Acq92OH4FRlcqjKAK6SZKYSc02v6PP/kSriEmA6o6HAGfmJU2bv+tC4bof5YO+e/CiM
	N/dqF0a92zsxi40q+HpZKuxCK7Pbwc2rppN4N5XH6+ARRABYJ6Fj067IF9O9mF9oVc5NZ3V5Gbh
	/2p4ir6Yemo+PcpbzXGdoVg7kjfRNFBW7ntlhAzxXwnMZ9OU/6kjzrGgUXJdKQP1x8K8bH2l9vj
	cE8z/y7uc3O6wVlIstLXaS337xdMxPXS0f4brvNqxKiD/omwZCVMuhfoKbt4kIwTzkXX1iV4290
	JW3cro17dSJK0Yri0WKf/zccBLT3LzrpRq113R92t+BNV9GDZRYcyO1dDZ7RQJsG5UsHqONfoRM
	H6oek6YXS7Wx/KCgiqvGYfOWeV0EGLn0oBTGFBj0n8WDeBZkiYKgYPDovl4ohZF/UWX4Ikx+Rvw
	8v/28787YmJdXdWI8AgUILpLFVsfM4SyCcMQIAiXL1qpoTSUcIqw==
X-Received: by 2002:a05:600c:4ca3:b0:490:5cd8:d20a with SMTP id 5b1f17b1804b1-4909c082256mr20357415e9.11.1780044555451;
        Fri, 29 May 2026 01:49:15 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c50f6sm2316210f8f.16.2026.05.29.01.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:49:15 -0700 (PDT)
Message-ID: <d3f052be-910e-4705-9390-86580f62289a@linaro.org>
Date: Fri, 29 May 2026 09:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etb10: restore atomic_t for shared reading
 state
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: mike.leach@linaro.org, mathieu.poirier@linaro.org,
 gregkh@linuxfoundation.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, stable@vger.kernel.org, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com
References: <20260528165201.319452-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260528165201.319452-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014917_830561_C9FB583C 
X-CRM114-Status: GOOD (  29.25  )
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



On 28/05/2026 5:52 pm, Runyu Xiao wrote:
> The etb10 miscdevice uses drvdata->reading as a shared exclusivity gate
> for userspace buffer access. etb_open() claims that gate with
> local_cmpxchg(), and etb_release() clears it with local_set().
> 
> That gate is shared per-device state rather than CPU-local state. A
> running system can reach it whenever /dev/<etb> is opened, closed, and
> reopened by different tasks while the device remains registered, so the
> same drvdata->reading variable may be claimed on one CPU and later
> cleared on another.
> 
> This code used to use atomic_t for the same gate, but commit
> 27b10da8fff2 ("coresight: etb10: moving to local atomic operations")
> changed it to local_t even though the access pattern remained cross-task
> and cross-CPU. Restore atomic_t together with atomic_cmpxchg() and
> atomic_set() so the exclusivity gate again uses a primitive intended
> for shared state.
> 
> The issue was found on Linux v6.18.21 by our static analysis tool while
> scanning surviving local_t-on-shared-state sites, and then manually
> reviewed against the live etb10 file-op path.
> 
> It was runtime-validated with a reproducible QEMU no-device KCSAN PoC
> that kept the same report-local contract:
> 
>    1. use one shared struct etb_drvdata carrier and its
>       drvdata->reading gate;
>    2. call etb_open() and etb_release() sequentially on that gate to
>       confirm the original claim/clear path;
>    3. bind the open side to CPU0 and the release side to CPU1 for the
>       same gate to show cross-CPU ownership;
>    4. run bound workers that repeatedly race etb_open() and
>       etb_release() on the same gate until KCSAN reports a target hit.
> 
> The harness recorded:
> 
>    L1 passed open=1 release=1
>    reading_after_open=1 reading_after_release=0
>    L2 passed open_cpu=0 release_cpu=1
>    cross_cpu_release=1 reading_after=0 open_ret=0
> 
> Representative KCSAN excerpt from the no-device validation run:
> 
>    BUG: KCSAN: data-race in etb_open.constprop.0.isra.0 [vuln_msv]
> 
>    write to 0xffffffffc0003810 of 4 bytes by task 216 on cpu 1:
>     etb_open.constprop.0.isra.0+0x38/0x80 [vuln_msv]
>     l3_worker_thread_fn+0x4f/0xf0 [vuln_msv]
>     kthread+0x17e/0x1c0
>     ret_from_fork+0x22/0x30
> 
>    read to 0xffffffffc0003810 of 4 bytes by task 215 on cpu 0:
>     etb_open.constprop.0.isra.0+0x18/0x80 [vuln_msv]
>     l3_worker_thread_fn+0x4f/0xf0 [vuln_msv]
>     kthread+0x17e/0x1c0
>     ret_from_fork+0x22/0x30
> 
>    value changed: 0x00000000 -> 0x00000001
> 
>    Reported by Kernel Concurrency Sanitizer on:
>    CPU: 0 PID: 215 Comm: etb10_l3_a Tainted: G           O       6.1.66 #2
> 
> This no-device harness is not a real ETB10 hardware end-to-end run, but
> it preserves the same shared drvdata->reading gate and the same
> etb_open()/etb_release() claim/clear contract. No real ETB10 hardware
> was available for runtime testing.
> 
> Build-tested with:
>    make olddefconfig
>    make -j"$(nproc)" drivers/hwtracing/coresight/coresight-etb10.o
> 
> Fixes: 27b10da8fff2 ("coresight: etb10: moving to local atomic operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
>   drivers/hwtracing/coresight/coresight-etb10.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 35db1b6093d1..98269ea6f7ae 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -85,7 +85,7 @@ struct etb_drvdata {
>   	struct coresight_device	*csdev;
>   	struct miscdevice	miscdev;
>   	raw_spinlock_t		spinlock;
> -	local_t			reading;
> +	atomic_t		reading;
>   	pid_t			pid;
>   	u8			*buf;
>   	u32			buffer_depth;
> @@ -603,7 +603,7 @@ static int etb_open(struct inode *inode, struct file *file)
>   	struct etb_drvdata *drvdata = container_of(file->private_data,
>   						   struct etb_drvdata, miscdev);
>   
> -	if (local_cmpxchg(&drvdata->reading, 0, 1))
> +	if (atomic_cmpxchg(&drvdata->reading, 0, 1))
>   		return -EBUSY;
>   
>   	dev_dbg(&drvdata->csdev->dev, "%s: successfully opened\n", __func__);
> @@ -641,7 +641,7 @@ static int etb_release(struct inode *inode, struct file *file)
>   {
>   	struct etb_drvdata *drvdata = container_of(file->private_data,
>   						   struct etb_drvdata, miscdev);
> -	local_set(&drvdata->reading, 0);
> +	atomic_set(&drvdata->reading, 0);
>   
>   	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
>   	return 0;


Reviewed-by: James Clark <james.clark@linaro.org>

Semi-related to this change, etb_read() doesn't have any lock when 
reading drvdata->buffer_dept or drvdata->buf. It locks in etb_dump(), 
but then unlocks before actually calling copy_to_user().

Seems like concurrent calls to etb_read() might end up with corrupt 
data, although I'm not sure if that would ever happen in practice 
because it only allows one open file handle.


