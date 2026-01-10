Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B4D277CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 05:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlFjiQzmp7IlwkW2xn04ZW6lb+w8gfgKtbntjCwLDCE=; b=Zr+FIyKLUoN7IssrtcKlEdMZJL
	frh/HXl9LKPvt08yOGfCqqgQJDaRhZ+0jmvJV8NcAfMZgrPITvKlhohL3e2Gk5LUa2XS0+7LAullv
	HBd+L+nlxOKsC2cShMzfSEMnM24XuMKl2NtBtmKnw7E+hzFW/S10x2mc4gJxT/pw0m1IEWBU0CoSX
	esmNyAwQXbFM019qSmHDWCaRQGBCv0aWoDtm/2TG9t+/EmntmLeUl2K01GKCYF17/aNwZ62A/YGh6
	xfMVW8TNJPUBeDjn/RT3dqiDkpPinLVs0iXfq37H2Hw7/SRouggAFwyJnUqn9z6+slD61J3daNyuJ
	6KTGCFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRXd-00000003H6G-1p59;
	Sat, 10 Jan 2026 05:29:37 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRXa-00000003H5v-1OUp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 05:29:35 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7c6cc366884so2611268a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 21:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1768022973; x=1768627773; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlFjiQzmp7IlwkW2xn04ZW6lb+w8gfgKtbntjCwLDCE=;
        b=uzC05WEPalgBfK9mPfP3VIoqbbleu+KLesOV+aLgh1hXmS4eMidWWQw5s3qEnMIBBe
         X6ZbGaxuLA6sU1RBOhncXTtt2zNjU9ZGJBAzQ+Zx5DOT/L1HcVjEpBAq+89oPcsGHcMR
         p0kL2d8jexYSYum38fcE64RhUA1VXEe6wtMj6nz0UdnW2F7Eqvno0SZfjc5JFbi58pJw
         miGc9HoTqqqRX2Aa2yKEvnbhQjLVFDwIlB8xpuCV7J5gVKD4UXw+AWoom1LQi1JDFh2b
         tN1poFS4z6GHIGy1433MWW3BJlp5XrwX0p3xRtmsHzoDWv2tV/+Lzwo+v+K3Q4+SjoNX
         8TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022973; x=1768627773;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlFjiQzmp7IlwkW2xn04ZW6lb+w8gfgKtbntjCwLDCE=;
        b=mHUgs4SrsW7yi4OCJY3uDIs7KxUQ1mb8t0EBhgtbZpwdb47A/K8MIeVk0Vp6wp+DqS
         l+tFYm6SINB6Z9cLua/erc/QtyzsNjUALX3+lRe6smOwLTfN6RBRhgS6ZmYZkrwllhpn
         MsY6ocyiJdvRaQhYhkfTyNOOZObkH/3UTIb7yQia+8RyFfaQW27H7EZ3iNlvgg+G6PzU
         SnQgnrRSsyHsZiZ798BrpkUHntFHzyd3RSnHS0vPDfHN13ZAPrFUOvH3ptyXQ8MuO75a
         dAJnR4VJtEoX5cmMAkumatPn5tLHZ2ViQq1sJ6ADRHY4v5gseu3lqCKgwxjR9rUf8bNd
         pCzw==
X-Forwarded-Encrypted: i=1; AJvYcCXgEklp9aQfgjmZM6e6nMU3fTFghM4XSSbvWTiTYbWbHZYx8AF2t7YkYh/+Atoi2Z97Wck70275CQtvxn13z6iH@lists.infradead.org
X-Gm-Message-State: AOJu0YyWE18KuU4sKRSHZVP90HOan8oDbUx2TR9s2OEfQH6oZi83iy0U
	XHC8bzgn/RrByQkVePJNdiN2k7mq066FR8T6UE+cWNkpVgBW0jKPXsUbTQ+0iKEhbhA=
X-Gm-Gg: AY/fxX4ixfodBiTJ44/RQcxGfD6XHNoP1NROEIxywe/AVBiuQcp0kxJSZxOUeRwD0g8
	wIH+vxSprQSwYo/4AkWGX+d3bTX65OmFnb21/W8VeAJv358zAt9WOrH9I9cEKb+0xZq+KbgVaEF
	pjfm4IEJP8XeuVMlu0i1s/tbQhNJ3lHJEORokdbSMiK/lU7+7MKv+za9M9YcieuEjd1ma5W0ivQ
	2cjs/hr16jgGCegr0Rqb5WG8SufDZ6foU3E5UuMO8dI7uR2Ic3pD79jhLiXHMOvL+BExj+eTYw2
	kHDrXdQpY5bGYlpkjIb4KKPHlPOWJ5RtXrbewni6HxrLcpEJPM99GW+em8jcJHH+e09otZrUejE
	cmfkMSsAVipcoXmDnLk86TKeirSm9UQmOJC1CBQA48xsWYsL7+gMORxzJv2KXLKMLUmDmqnRwDK
	Exwb3uFev/1KTLWw+Ted+BHb/73Os=
X-Google-Smtp-Source: AGHT+IF+rY+u/8ehHfLkQtzEF3j/fw7yG+pTiHVN1PaMMLYqRAcZKsLTN52EiJ2K6XREIeyF52RQ1g==
X-Received: by 2002:a05:6830:2b26:b0:7ce:5287:494d with SMTP id 46e09a7af769-7ce52876fc2mr7637362a34.17.1768022972619;
        Fri, 09 Jan 2026 21:29:32 -0800 (PST)
Received: from localhost ([2603:8080:13f0:9470:81ec:8496:ec9e:f028])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47802551sm8635063a34.1.2026.01.09.21.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 21:29:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 23:29:29 -0600
Message-Id: <DFKNU3AVF9EW.3GHYYELNT4V9E@utexas.edu>
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
From: "Taehyun Noh" <taehyun@utexas.edu>
To: "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>
Cc: "Carl Worth" <carl@os.amperecomputing.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <andreyknvl@gmail.com>, <pcc@google.com>, <yeoreum.yun@arm.com>
X-Mailer: aerc 0.20.1
References: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com> <aV_H9h-nSM1HlWnR@willie-the-truck> <aV_7Sm96Zf1Gfg9v@arm.com>
In-Reply-To: <aV_7Sm96Zf1Gfg9v@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_212934_509315_E37F68F6 
X-CRM114-Status: GOOD (  10.99  )
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

Hi,

On Thu Jan 8, 2026 at 12:45 PM CST, Catalin Marinas wrote:
> Reading the Arm ARM section again, I wonder whether always setting TCMA1
> does the trick for the Ampere hardware. With KASAN disabled in the
> kernel, all addresses will star with 0xff... so behave as match-all. We
> do this with KASAN_HW_TAGS enabled but it won't have any effect with
> kasan disabled.

Our team agrees with Catalin=E2=80=99s TCMA1 solution. It disables every ke=
rnel
tag checking but the user address will get tag checked as far as TCO is
clear. Also, Carl=E2=80=99s initial testing confirms that
`mem_access_checked*:k` counters drop with the TCMA1 patch. While we
haven=E2=80=99t run the memcached benchmark yet, we will follow up with tho=
se
results shortly.

Additionally, we=E2=80=99ve observed that Pixel 9 behaves differently; the
kernel does not perform any tag checking when the user process enables
MTE. I=E2=80=99ve tested a simple kernel module that accesses kernel memory=
 on
user ioctl, and measured the MTE perf counters on both AmpereOne and
Pixel 9. Pixel 9 shows no increases in checked access counters, but
AmpereOne shows proportional increases depending on the buffer size that
is accessed inside the kernel module.

We will keep you posted as more data becomes available.

Taehyun



