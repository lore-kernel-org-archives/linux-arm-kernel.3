Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C4CEA813B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXRC/tAwqGKh/o1ifn7jOx1oKAbcp0FPsYzrynQiNbU=; b=X+0wCA/+XJ/7O/vkZVk41LsIoC
	3fbFQOV7QSdF3N1yvvMnjTq9G6Tt1MUs+PGr9RM0EwBYDloQsP9MrzYHYyiAgiKUUCYEv5JZEWaVv
	jPydYkdy9BFNc6kTiMAre28caGjD/7Mws071wrnUJ3qbtLZYy/1BodQDDxv4rpGKi6rbmfbuw/zuD
	NHY4zaKKaW093BZ7VspI9BRFHRzIY0WkSH9iWQ93GKN43gWucnfaA2umapGv75WwnyffA04M5DWgt
	vnFvX3jydzfXdQb+4NOUkis5JUY4/WQQxwUUHHQ872TRyfneb5ku2bCe1wfcASVdDVgbpbHToWxN/
	KRR6RGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq4G-0000000H9ux-38X3;
	Tue, 10 Feb 2026 15:54:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq4E-0000000H9uR-2QUB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 15:54:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-482f454be5bso57610805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 07:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770738860; x=1771343660; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXRC/tAwqGKh/o1ifn7jOx1oKAbcp0FPsYzrynQiNbU=;
        b=X4ejrSaR5+HF7Lkv1IO4ezdg2gyEYMxZW58B94wk0hsHej7wJIceYfW+rll+0r4ROG
         czPLdq5bC2fjvRuOQEN/WsFFnPD0Ene+ABrH1UYVq+PiKpMpsrEPNqs4CEChYTRLbBF1
         mhXLSjyfBNBlWs89uTlFkSWLOKSdwYauTaNMcoYoHSXhUasook4U5nlDxcCqDO1ycVQN
         aTGxKYkefdkX+YWdDd0AjjDxllrcNh5ph9uDXrY3pzrJZkTA8qhF2bcTtlXOHmcYl9Qz
         WFri6aWbnZBbocu7PFgtkq8CZEGkxsvqUEcN12Gy8MjrFNlABK6YEV1w/T5LdomOkxbQ
         2nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770738860; x=1771343660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXRC/tAwqGKh/o1ifn7jOx1oKAbcp0FPsYzrynQiNbU=;
        b=nc8o414SnpcGCirQ7wpQwTTxclwoDwD0lm5tigJeWj6osy5xwiHNaGHdxJBKCHuZvb
         lfzfFr83K2+eUqgLtrm3Suufa7/bH6aKHncrk5joa9qCpG1JSMg2cDO7IBlg+JwwD59C
         79FboMWcembGlEKQ9+J4orfOSGuUKUHAW0igm7T6QByf4i7kTPFI8Z18fBn938kzPgsJ
         D9DhfUTY104MWf0FWNBzCHFlJPLnVeokT+CepQOZjmTjOLx5JZeSFAlx73ZA3/alhFvx
         zYTVFa2RTeENvINdpazct83frtt5Nb4ra59Bvpk68/IHVJoXpSrSuulxwSF3B6NgOtee
         tccw==
X-Forwarded-Encrypted: i=1; AJvYcCUBqxW+VadqGDcMeYCopD3rbzPEffGlZAYJFo5pc6hJsBZwlsv28Ek0kAfmXfh8IV4B9W79cibcA++orVX3uPPm@lists.infradead.org
X-Gm-Message-State: AOJu0YxFggjJmRtAv+YKKAihL53wf/RTt4LSR0wxlkjQ3RtbXKmxAtD9
	22b26ubrhOpgLevt+b+EdHKt3oHVADct9v2Vh/6/fqaFDg4bceojduhUohs1dCILRw==
X-Gm-Gg: AZuq6aL6dbKPfks6+o12l3IhCx/RmGDEjGHhFAa2POhbdFDnhRz2FSXsRB3N/rmF0PU
	ubyPfXiNfsPgcONjuGevK7i2fv009CFYZI2DazsC8rwD22lscaYG8ZTAF+YtcJXmuZPu0JtiEHz
	8SvUNwaDLiNahtk7iakXEB+9DbL5vxZreMGL/9q28x8+PnpSzb3GeygFJs0aOcpQf+GOpmZ3pmv
	f+LCJYSc71c+YN++YUvOetEVF6Q0XhhD7OgCwlt/voFSb0mgvVsiToFid6VKMMJWN3/l5pAd49Z
	H6SsVwa/iDe23s57WwK+5NRQK3EWreefc2KbjDBveWoOycf4fN9fBPMgts3etjVZlP5KXVcKUFr
	Lcqz4UhWv71ZREfuiHOoV11YVGcHkk13wU/56eWuRJcLXBDDR/zweuxtqwxfxxJGvbwisTSw4du
	JI2w5lTwLTsyc2sbDv2sSosoaj2TKr3yzxOx+23sJN3761C8F0XPL/5ZsS1xdneV5YJd0=
X-Received: by 2002:a05:600c:3b8b:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-48350511771mr44119235e9.5.1770738860235;
        Tue, 10 Feb 2026 07:54:20 -0800 (PST)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm71526575e9.7.2026.02.10.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:54:19 -0800 (PST)
Date: Tue, 10 Feb 2026 15:54:16 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 15/30] tracing: selftests: Add trace remote tests
Message-ID: <aYtUqOw8SdX7gqZT@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
 <20260131132848.254084-16-vdonnefort@google.com>
 <20260205124208.2ed7cff8@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205124208.2ed7cff8@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_075422_654274_CA5424C9 
X-CRM114-Status: GOOD (  20.30  )
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

On Thu, Feb 05, 2026 at 12:42:08PM -0500, Steven Rostedt wrote:
> On Sat, 31 Jan 2026 13:28:33 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Exercise the tracefs interface for trace remote with a set of tests to
> > check:
> > 
> >   * loading/unloading (unloading.tc)
> >   * reset (reset.tc)
> >   * size changes (buffer_size.tc)
> >   * consuming read (trace_pipe.tc)
> >   * non-consuming read (trace.tc)
> > 
> > Cc: Shuah Khan <skhan@linuxfoundation.org>
> > Cc: linux-kselftest@vger.kernel.org
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> This still fails:
> 
> === Ftrace unit tests ===
> [1] Test trace remote buffer size	[PASS]
> [2] Test hypervisor trace buffer size	[UNSUPPORTED]
> [3] Test hypervisor trace buffer reset	[UNSUPPORTED]
> [4] Test hypervisor consuming trace read	[UNSUPPORTED]
> [5] Test hypervisor non-consuming trace read	[UNSUPPORTED]
> [6] Test hypervisor trace buffer unloading	[UNSUPPORTED]
> [7] Test trace remote reset	[PASS]
> [8] Test trace remote consuming read	[FAIL]
> [9] Test trace remote non-consuming read	[FAIL]
> [10] Test trace remote unloading	[PASS]
> 
> I added this patch and the two failed tests now pass:
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
> index 081133ec45ff..dfc954a6a380 100644
> --- a/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
> @@ -106,8 +106,10 @@ test_trace()
>      echo 0 > trace
>  
>      for cpu in $(get_cpu_ids); do
> -        echo 0 > /sys/devices/system/cpu/cpu$cpu/online
> -        break
> +        if [ -f /sys/devices/system/cpu/cpu$cpu/online ]; then
> +            echo 0 > /sys/devices/system/cpu/cpu$cpu/online
> +            break
> +        fi

Hum weird, I have changed it in v11 to 

echo 0 > /sys/devices/system/cpu/cpu$cpu/online || return 0

That doesn't work? Because I would simply stop the test there if we can't
offline the CPU.


>      done
>  
>      for i in $(seq 1 8); do
> diff --git a/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
> index d28eaee10c7c..146f0a9fe311 100644
> --- a/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
> +++ b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
> @@ -102,8 +102,10 @@ test_trace_pipe()
>      echo 0 > trace
>  
>      for cpu in $(get_cpu_ids); do
> -        echo 0 > /sys/devices/system/cpu/cpu$cpu/online
> -        break
> +        if [ -f /sys/devices/system/cpu/cpu$cpu/online ]; then
> +            echo 0 > /sys/devices/system/cpu/cpu$cpu/online
> +            break
> +        fi
>      done
>  
>      for i in $(seq 1 8); do
> 
> -- Steve

