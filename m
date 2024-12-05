Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C267BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNGzfvQhuEu1gaOMEO/yBEPHJg32agZ5235X4zgBXpI=; b=eV1kNmDlrRFwyKh06vEK8qZqOR
	DFpEi6Ve/Ibc5FQE75WnecCCm0zSMX6Er5hUgxPZLClsII3nI3Kr8CFo4NX4GKIPZYLgoaLkFlM/g
	mGCdU4Q32GkaXowcnhWqvaeV5LwTUEVUUcPTl6pF5XouJKlYep7nRZ0dq8HzmGtCO7TYkC+ebTLmx
	xq1x6genKXJ+qcK5fkqa7jjvWjDAlN7fp/pkt7Egnx4nIqUM0CuboMYb2IoTylN6TG36hRu22ZK4q
	Nq6ybITEfTNcxUEmPPL8xxsShdwL4TEuxEQ1rlNtJ0BZLVVYRndqloWIo8eJvf/2xLXhBSFBTskED
	V8ZpS/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDbe-0000000GV4k-1Ey8;
	Thu, 05 Dec 2024 15:17:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDab-0000000GUv3-3MAX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:16:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434a736518eso11979055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733411784; x=1734016584; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NNGzfvQhuEu1gaOMEO/yBEPHJg32agZ5235X4zgBXpI=;
        b=ZszHWqtBY0xmtmhcPr3JbgtrmIQquBAoylUqO29rvF7nEuZTLhdj5x6GeDtvyL2LUB
         u7v6Rph5tmzHNsFVpxt+r91ODTbs3QpQ3U0Eck8n8KXg5ESMlZ9el9FuInfeZQ8jKo+c
         960JbcbuHZFp1tnrRFqQITyri4yJGscfyZ4qQh0hTDSmO2JxekFXGwJKiEhjTA5xvm+y
         ewUANjkmj9lEUmeLo1+IaHHGgshcb0EDSwBy7LNgcAb7AlH8aInqsgeC9oNBrCGJhTXL
         1Q6PcMVqqkEYH/YUrrGnx5IYBTNSB92oBZz01mRtckQ3wrk5sa6t3OCUozrUwLDwgzoC
         x8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411784; x=1734016584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNGzfvQhuEu1gaOMEO/yBEPHJg32agZ5235X4zgBXpI=;
        b=aOIj6utlZKUWbjK7rRcAH4GznhZ2Ws70AhDbxtWEAcGZeJF0p6Scz2/nijPvGooYfA
         5Qs4SjnjMwoPBMFMh06HjvNOAkaFHFO44edN1iKFa2lzU80j2cib3/m+eIkAv8PFdf5H
         7l85/9Z9dnL8KTtP07c6AdNmcvOFO+JX9THGpwq8ZypOnK9+HhhxF5S8SZrS9IvMaAPS
         vcABM9cUQyF/UT96Cnmx82a0nyPXyzOgRUrC061ABYiLDv8Ogi95vLVRUJ5Zis1MPtAe
         KYfbWFmPp/wVxy/oS/NMR/kJLIpL3At3vUV6xOYUaG+N7bmGZ0hwElRZoIdKNsAhjA5S
         Kv/A==
X-Forwarded-Encrypted: i=1; AJvYcCXfPJhbSeE3dfZkumh2RrghN1qYZrW7bGIQSsgLqn7Ev/uxvKwLVF5iBNX5Bc7uVN2EPw9wCi5dJ6BJZQEDfT1T@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/D0onFWTzaBXf0RFNQs0FSRcOG9wfvDZmfVun0GAPD2woeS7E
	8Wi9vHYoezxHF0mZKnc8bgG7iSstiC1wYD11sHzeVZFBDLr57dzrDe8d6Eu+4/I=
X-Gm-Gg: ASbGncvTJNCURJDW/iO94OBCn8ifxhEyzdbwnktP0a/MnugdVCjdZVIzylgojMKGiny
	ewW2FSYsBa7iFy/6Us6h1xHtk79Zv77xTWLSGZHjEb3/ZGPjsdfpL90sa42zWgwpCJMFvtBfObg
	F5e/5EB2u2Qaa8PioaBtJbf26o7vXf/aqrtxXLTZRxtiEc1XlXyAVELo0DxXyGIsjmRvpFDbjge
	VzSpsmZyJ3JiBN6ivr9qJK3tpGpr34lfquUHz087+vfCggprruEreI=
X-Google-Smtp-Source: AGHT+IFSHLZmIu9wSayLDq7ycBQ+roAuUKEE2td9KEmSdlWo6X+wsBQeahWHpQwNkTLYxu/aVfztNQ==
X-Received: by 2002:a05:600c:1989:b0:431:6083:cd30 with SMTP id 5b1f17b1804b1-434d09b2a75mr103448145e9.6.1733411783803;
        Thu, 05 Dec 2024 07:16:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59d651sm2179270f8f.44.2024.12.05.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:16:23 -0800 (PST)
Date: Thu, 5 Dec 2024 18:16:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	David Laight <David.Laight@aculab.com>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	netfilter-devel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Johannes Berg <johannes.berg@intel.com>, toke@kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, kernel@jfarr.cc, kees@kernel.org
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Message-ID: <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_071626_665136_C4CA8B70 
X-CRM114-Status: GOOD (  12.12  )
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

Add David to the CC list.

regards,
dan carpenter

On Thu, Dec 05, 2024 at 08:15:13PM +0530, Naresh Kamboju wrote:
> The arm64 build started failing from Linux next-20241203 tag with gcc-8
> due to following build warnings / errors.
> 
> First seen on Linux next-20241203 tag
> GOOD: Linux next-20241128 tag
> BAD: Linux next-20241203 tag and next-20241205 tag
> 
> * arm64, build
>   - gcc-8-defconfig
>   - gcc-8-defconfig-40bc7ee5
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> ===========
> net/netfilter/ipvs/ip_vs_conn.c: In function 'ip_vs_conn_init':
> include/linux/compiler_types.h:542:38: error: call to
> '__compiletime_assert_1050' declared with attribute error: clamp() low
> limit min greater than high limit max_avail
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> include/linux/compiler_types.h:523:4: note: in definition of macro
> '__compiletime_assert'
>     prefix ## suffix();    \
>     ^~~~~~
> include/linux/compiler_types.h:542:2: note: in expansion of macro
> '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>   ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro
> 'compiletime_assert'
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>   BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
>   ^~~~~~~~~~~~~~~~
> include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
>   __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_),
> __UNIQUE_ID(h_))
>   ^~~~~~~~~~~~
> include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
>  #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
>                             ^~~~~~~~~~~~~~~
> net/netfilter/ipvs/ip_vs_conn.c:1498:8: note: in expansion of macro 'clamp'
>   max = clamp(max, min, max_avail);
>         ^~~~~
> 
> Links:
> ---
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRywrldKTyaXQoT/
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/log
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/details/
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/history/
> 
> Steps to reproduce:
> ------------
> # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
> --kconfig defconfig
> 
> metadata:
> ----
>   git describe: next-20241203
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRywrldKTyaXQoT/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRywrldKTyaXQoT/
>   toolchain: gcc-8
>   config: gcc-8-defconfig
>   arch: arm64
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

