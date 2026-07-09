Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE2FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=; b=rn2kiA5bzOkCehc3O/O4YT3CQ2
	Ec4iNtVqq7MW+bMw3n0j1B9txXGL7wubNrw9ha7S0F1hglaCPM0QPLzmLoj+r8ZsxwdVXatCPaPjO
	KV5RNICa9PZs0NWuvlREAi+mYVDt6k+In8ENtOrCGchHs0yJD9gAD4yhQtQq31rhTrrzsaTuy16+o
	v5LrrfdjnK+cX2gUzgOZyJhZrhFTTu/krnX8n9mnxk3OzOQIU2fYGLZKw/T3OoK72CKsnFK4K0Hd8
	dDs2SUL4qD2UONPJzy0sNYps6ReELqMzv4bmt31WAjZXAh/BNLm2P2dYNeh/8GgBK7prqcv5bI1WK
	4Rc+IM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnvX-00000002Q5W-2pJt;
	Thu, 09 Jul 2026 12:32:27 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnvT-00000002Q4I-2xQj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:32:25 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso1086738a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 05:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600342; cv=none;
        d=google.com; s=arc-20260327;
        b=nPxI2cU2zuk0ZNqJ4RwATCZ9JH9ElbBq7Oqw0j7eK5/yhcOSvrI+njjVSLVsFURK9Q
         0MtCxJ6oXHJ76JC8ZJWeyzfciP2uuemTYp/X3a21eYkGOLdepKf+Ju20bl273QeYnXwq
         3Bqv0w3iQImu8uqJfo5QB55Xy1N1dIHaSuWARv+WJLcOkwxxSZnE+nulTg7tRa5oJovR
         II/pIheIFEUhsehN41dqG95XdGjuQs64lHC6VeMft4Cinfsx+M1G2oXTfm79iLxZhMPh
         z93YKms2NCeYIDKgrIeOqB3EKh8ALxLLi4PKuQ2eRvTiEEPzAvx9oav7Fn8OWXLC7vmV
         UFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=;
        fh=BSjuOx6EYlDQDzZhN7zZ4/fQe02OKy2hd5/63Sfvx+0=;
        b=OzNNmO/PeDNxlZnV23o/y02aCi80yslg045o7TgoNh7fZpd2sYgwgJqiSpbdVmS8JV
         VvStRK5GslzZy4cDGCpF4+AJgMgdwNbIbQ2UVBUY/dbsyhh8ystnOtDO1YvcP4k3e2Wv
         CYwLc6xpwGrPGrzmfYBj7m6Rm/5/c6kRQNZQqQmGos69xv+gTrgTvo5ykla/+M1k/7AU
         AyXgeGqOEAa8Civ8ip5b5wWru6iqr7JlSz3CJms+InmeUbEg8+M27vANANbBT8qW8HE4
         UZNbXjo0LIXlGz36RroBYCJwCaV7nuJQFjyXbFeqFovbEVfx+kPqxQ/yGjur28PrlJWE
         UBVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783600342; x=1784205142; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=;
        b=YI8d51r8dEEGtSRQwDgAf+Lby63HbCt7ezPG7NNdfNd8x9Aorm8Dw2H+NVALdd5FyT
         mcvLzPIafF3Y8rBPsvek+liL5tYdLs20KM+SWsIbfLIVTef/Smks4ZKPqouvucYXD8qw
         uwcjRu1oPVMxY31gOZGAIvNk0mYnlx1tGp/qId7tMe+r5lF0gBWdj6AcNsOfU+/yMFpz
         nA6eehdKTJhvuTFWgpWxnHAnV1bIwM1nKnBnx2BpWaScDDtLpw0uAD1sqTrUUo1FwDiE
         QDwfoOJVHryzNpSPmN7b/CShgnf7d4oD0j+y7Epda8lMceKwc7FrFNRl1fEBrjyHmHLY
         5rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600342; x=1784205142;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q6uaaRn1apsA/2p+t1DBPwc+zrUv3t/8R7VmEga46LQ=;
        b=CZJdbnRacG7rJURmYxJj4vmII/DIPOvN7Jz5Lk2CJ9M8bL+FGBzl1myUPcce6Xtmxd
         LDuSkrIk62WJEfZItJkOGypV5a1VLjuWCS3E13p+bvDCQqu2NoFvCBWBWbhUwvMmBeUx
         FatHSqtweSuH7WuutuFjAIsQfkYo6czKMRvGv9e8oGHKMPs5f2MQ6d0vO6z2GoE7malO
         ZXtYCS4odiN9JI9XQ8BUYM//wuvc3a7HkhfjCBgf+BCDLmDTf4benclyUyJeSZlUwK0O
         RIzFqm1NWqp7dwIkrg+okxaW/gfxR4jzOupou+StwdBfRG6ji3NWjsvltRIk+MFfnbYR
         6viQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Fv4pzghF7pGJ0R2qV/WC7sxZW/a0rhIeisZ8X5LNpDz8YOXDcooQFQZmMwK+NKno3DbUSjIIdxVVQkjLMrBOP@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3DjjQ468tGnAVZdRMmsXU3Nb5zIC5BtBxWpxZ7mAHuI+UZhN
	6hbJkAXP8l82Fz/lN/hmjwSsdCAs7PsresN8/OJiN9wWhYMfqrL6AV2v7G1rsdUGu//qNG+y9z8
	+lqx3cv4O7SCBgOt8OVtC06c4b89TU5tYYOBGBvwCPg==
X-Gm-Gg: AfdE7ckVEW434s+s7PMNhxP6JjpFWTVXStePniBhWSUZnFrnnJlG6x08wddXX2N3ftc
	445fx+t1JFZrx4Xcg6VCSWek7mO4KHfgm+xbgSdiC7jGXt1c/KXaSQJ9PqUBs2xb/7RtfRM6I81
	PJ3AyVEX3kOHaghJnCa2pr3F2d9vT4VpKKRlwFHMFPWoE2Je7LGFDA8XUVhu66nBm33e3uzpbIr
	lCijv3boGBlgvzq8IUBadvGK6fUfEXYVIa12f91R8NdQzO+XWe//h6MrdyCA0FCcUmvX2CHlupv
	MvBJFqWKLClLZyg+Rc1USYh492nHG5qmWx6bqxlEwsj5WtXySiA/7qBx6vMpmsB+JMDhj1z2NJ1
	8Lq32XRg6RbbMqZK64rrPGObHVEYyZR347ehRqVU=
X-Received: by 2002:a05:6820:1628:b0:6a1:18fc:519f with SMTP id
 006d021491bc7-6a36d6d6ec2mr5214376eaf.0.1783600342380; Thu, 09 Jul 2026
 05:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk> <ak5mPxUdp2pzCMt5@pathway.suse.cz>
In-Reply-To: <ak5mPxUdp2pzCMt5@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 13:32:10 +0100
X-Gm-Features: AUfX_myRkAQr3RlL8KDtHhqAkW7mutgbWnQw5V1Od8NNNQcLPSvfj_bgH0j4NKw
Message-ID: <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of printk_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_053223_912602_9F668E8C 
X-CRM114-Status: GOOD (  34.02  )
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

Hi Petr,

On Wed, 8 Jul 2026 at 16:01, Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2026-06-30 17:35:58, Andrew Murray wrote:
> > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > are two distinct mechanisms for providing similar functionality which add a
> > delay prior to each printed printk message.
> >
> > boot_delay provides a kernel parameter for delaying printk output from
> > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > configurable only via sysctl and thus is only used post boot.
> >
> > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > to preserve functionality, we'll also extend printk_delay such that it can
> > additionally configured via an early kernel parameter.
> >
> > Behavior change:
> >
> > The delay enabled by both "boot_delay" and "printk_delay" continues
> > working even in SYSTEM_RUNNING state. It must be explicitly stopped
> > by setting printk_delay=0 via sysctl.
> >
> > The delay is skipped when the message is suppressed in all system
> > states. It used to skipped only for the boot_delay.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> Looks good to me:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Note that Sashiko AI warns about possible problems with negative
> printk_delay values, see
> https://sashiko.dev/#/patchset/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b%40thegoodpenguin.co.uk
>
> But they should be handled in both the early parameter
> and sysctl interface by the "10 * 1000" and "&ten_thousand"
> limits.

Yes, that was my also view.


>
> The only potential problem might be a warning about possible
> "sign" mismatch from the compiler. But I do not see any
> even with make W=2.

I suspect this will come up everytime a change is made in this area,
or perhaps some W=2 errors will pop up via kernelci or similar. I
propose updating the patch as follows:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5278d9cb19e4..fbb67f10c21e 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1338,10 +1338,13 @@ static inline void early_boot_delay_msec(void)

 static int __init printk_delay_setup(char *str)
 {
-       get_option(&str, &printk_delay_msec);
-       if (printk_delay_msec > 10 * 1000)
-               printk_delay_msec = 0;
+       int printk_delay_val = 0;

+       get_option(&str, &printk_delay_val);
+       if (printk_delay_val < 0 || printk_delay_val > 10 * 1000)
+               return 0;
+
+       printk_delay_msec = (unsigned int)printk_delay_val;
        printk_delay_calculate();

        return 0;
diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
index f15732e93c2e..f256fc05faaf 100644
--- a/kernel/printk/sysctl.c
+++ b/kernel/printk/sysctl.c
@@ -46,7 +46,7 @@ static const struct ctl_table printk_sysctls[] = {
                .data           = &printk_delay_msec,
                .maxlen         = sizeof(int),
                .mode           = 0644,
-               .proc_handler   = proc_dointvec_minmax,
+               .proc_handler   = proc_douintvec_minmax,
                .extra1         = SYSCTL_ZERO,
                .extra2         = (void *)&ten_thousand,
        },

This makes the cast explict, verifies the range before casting (I
guess a range of negative values could result in a postive value
within the 10,000 range) and also uses the correct proc_handler.

This has the side effect of not showing the following pr_debug for the
lpj calculation when a delay is not set. Though loops_per_msec is only
used during boot, so I don't think there is any loss here.

        pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
                "HZ: %d, loops_per_msec: %llu\n",
                printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);

Can I keep your Reviewed-By with these changes?

Thanks,

Andrew Murray

>
> Best Regards,
> Petr

