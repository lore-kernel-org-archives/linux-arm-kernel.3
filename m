Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A2CE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fgrv+GN2LBEaeVJ/FTM/TTU+8nfkJLCFn3FWcldv84Y=; b=XFWJxk6suuedluKKG3ehh7h241
	e1/vTvipzhbM9cRoeU1gGJh+W5UyzOcDkap0twjaTF35zO3WPp1x8u+D5UEu1pkEonu1KyCb2AusN
	BGqtscrJ1lX6rjiYhkdMK+RekrKdwM9wsTJ0bcg2E59uSYOyKeaYGraNbUvCObiRaHOy41XLcWqR2
	hQ6KFsdOtQuDoA2bF4biituN5iD7MNmIK4xfDqJfNKGWcbQ9fUMk7k0Mk9JkDawch9Q1ihQTkCyOM
	gVVOR62TgAx3EKUkiSw+9M/v34aKGgKggh7/Fh+9KKpJy2CAmsa60uDkMti4pJ2Jv/EioqBN66TVZ
	ijzefMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJD7f-0000000GP7e-0XSc;
	Thu, 05 Dec 2024 14:46:31 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJD6d-0000000GOxz-1Kzm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:45:28 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-51514257e57so274694e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 06:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733409925; x=1734014725; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fgrv+GN2LBEaeVJ/FTM/TTU+8nfkJLCFn3FWcldv84Y=;
        b=KsRqyo7XfJmqljMigrn6IptP0P/3GLu4txaEPLPCdwSGKZe36dNrlpat+9kN4R8qfw
         +oe1BP5+OO/9xD93FjL5b6QKHE1XVN8HvuxCkLRf6trerRUJVm4lYXGVAmpDZzjDOqR1
         kxioVwZH9nhvPXtDc65MxT5y1tLH+gQOKC1HlRAAJTfakl9ZeZKjoNKchvfmR9M/WTYR
         CDPsc2hEgl7BWwC/oCMHCtd6eWKsjHDt7+Uw06HZ4VmlGvtoFrCv4NoNYhhNwleqUNX2
         oKwEA073Ib8uwlwYmGu4ifnHi1qWrbbPszHsk8emjhgZboVsJgDZNPgfxTO9Sn7/0zPE
         gfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733409925; x=1734014725;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fgrv+GN2LBEaeVJ/FTM/TTU+8nfkJLCFn3FWcldv84Y=;
        b=Y0lIMLUZlhWKkG501x27RGdMtVOGPbXHwlTfRpSQGQxllx6PfPmFYrFOi30KymsSXH
         tWr10bJsUR+bRHsrm6w7YI/dkwZMtuwI5D+vqygY3it7NAI8nBGvc9Ni33WcYDL9g8c8
         T2RyIrh9tg2tScQljfmaVMLgh/uv4A50v8Ejw4++iPaScZYrkQHTxLu/VA/APkKRRTeN
         Y2coAWsrUjn7d9Xaz4UWopMuMxQIHY6UIhsAhyxpLRat+KtdpO8sU5Z615E2NKHffVBb
         ctKwKUk+o39HrdS2/jWchMD18G3v+lJ15AJdXN9PT7mlJtqhuZ9Gxjr7I4V/AwF98Spa
         6aaw==
X-Forwarded-Encrypted: i=1; AJvYcCVG4NSPFc1KciGLRygoqJO143VNuwHKCYSme1I1Cp+iVlwen5pywYo0dHewdT9MFixF79VhNVhDwaO8SabUapP8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4TIRgIFnQvJN/bEnf/4yJh2qjsEUnFFcLgiRlbRtOb9mTcebs
	rF5iaWid4gOWHwsPQ3EKykgiH38zqGrDqhVSwkYMcl0U0QHlUftkxCQ71id0n1Sj0NnlQcANENR
	s1STFSpMHF3NmporyGQA4OQn5qjjexpPMHMHXHw==
X-Gm-Gg: ASbGnctNz6vIin5pKHV2dPwiPdVADYtucJcnaY2n6hrp8fsAtXNOKl8MjlqA3FEcuvz
	CnJIOQxe8KXPhzD0IgGW45aJFwWyqYq5+
X-Google-Smtp-Source: AGHT+IFOiMg1tiV2s1ALxvVSXDETAQk3njW8DcCcpMAV58xChVISoFfkqq0962KUxkCR0Kys6OBR8oG4VmY9Ee3TIiA=
X-Received: by 2002:a05:6122:2a4a:b0:515:f27f:fd6a with SMTP id
 71dfb90a1353d-515f27fff47mr1440208e0c.8.1733409924732; Thu, 05 Dec 2024
 06:45:24 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 5 Dec 2024 20:15:13 +0530
Message-ID: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
Subject: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, netfilter-devel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Johannes Berg <johannes.berg@intel.com>, toke@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, kernel@jfarr.cc, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_064527_420157_D78103D0 
X-CRM114-Status: UNSURE (   5.26  )
X-CRM114-Notice: Please train this message.
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

The arm64 build started failing from Linux next-20241203 tag with gcc-8
due to following build warnings / errors.

First seen on Linux next-20241203 tag
GOOD: Linux next-20241128 tag
BAD: Linux next-20241203 tag and next-20241205 tag

* arm64, build
  - gcc-8-defconfig
  - gcc-8-defconfig-40bc7ee5

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
===========
net/netfilter/ipvs/ip_vs_conn.c: In function 'ip_vs_conn_init':
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_1050' declared with attribute error: clamp() low
limit min greater than high limit max_avail
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:523:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler_types.h:542:2: note: in expansion of macro
'_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
  ^~~~~~~~~~~~~~~~
include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_),
__UNIQUE_ID(h_))
  ^~~~~~~~~~~~
include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
 #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
                            ^~~~~~~~~~~~~~~
net/netfilter/ipvs/ip_vs_conn.c:1498:8: note: in expansion of macro 'clamp'
  max = clamp(max, min, max_avail);
        ^~~~~

Links:
---
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRywrldKTyaXQoT/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26189105/suite/build/test/gcc-8-defconfig/history/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

metadata:
----
  git describe: next-20241203
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRywrldKTyaXQoT/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAOE9K3Dz9gRywrldKTyaXQoT/
  toolchain: gcc-8
  config: gcc-8-defconfig
  arch: arm64

--
Linaro LKFT
https://lkft.linaro.org

