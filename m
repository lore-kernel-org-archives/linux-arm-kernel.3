Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1829C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=; b=LlsSkwkgV2EJoDXwqtvA2ZUp8z
	2w4UZjKFp3zTwJjoSC5GY8E+WNre6hdlKPi3RWLQ8NcvrrhtW+6G9Y4/9R6Rf2NfabeIktEcachOo
	Ssk/bLTnNt4A0XUJcXUkNdKv+FL+0QIXnyUBoqbJt8Aj1AkbJWlAPSXgW+ID22FUDSYyO9L8gAtD2
	KQAQl+Naknq4MOX8mSbAaMA6fvhKEedesEgKdjGph4fcj2CjESt8xR8KhsI/dT4WGsagqCU6G56t+
	EpJX0pP0wRBV4+21sHoN5p+9GRw0Iaqcc6bsnzb/LpPZwiqs2nsMdRJP5qvIqUDZxRQhetDVVGD3o
	Gvge7m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5kS-0000000159N-2Vck;
	Thu, 22 May 2025 13:14:12 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5iQ-000000014rP-3Rlk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 13:12:08 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c7913bab2cso804049885a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747919525; x=1748524325; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=;
        b=tlxvPaQIDx7fFSxsJiCcMXFp9h0IxaSMmqHuRXiM5GwmsSAq1QsHNJR/I7/J2k7zeY
         LKS/JyPLCXZOWTJfrENptb+T3qQYUcvCi9CpZqSXsznC2xAqlDNXXnfT8LhfrOoZkjw4
         aNfubIcqxlOAfKbHgmReOhuzm3VectgL4Ryue5aC0ntRwdAPGypvRXBL/UIyPDTDoeXS
         61EXFH2iPc7o0Y7nNORF3OIetDrz+UzMzP2EICemz57fySKUhNcLbwJsaTf0egFPk010
         xMjVM/x5Fp7q4Y21cDUr8rMRm1cnW//VKgJD5EZ7ufouSxuT8xYvNASxyWIyg5xP8t4z
         wznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919525; x=1748524325;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=;
        b=AXzqtS2oIi2wLS9PfV6LVZ6bq4AirE8X5MqDowO6bi9hYKhquifn62On7CmaYPSilq
         hyg2Bgz2azt89L5F7Gd6c1qwgvRZAANfCM7djcBYNpDCSGxVqYklMknzQKMvBcZUjcf3
         AqTb6UkX1VxzV7STdcqOXDN2FcB+L5YYmYNq2FVVTOKBW4yYXBdk8B7jA0TUyb4YuaSp
         P1bD6gkGo7DIZaUonAAP8h8XipAWoj6Hv1nrjSayHAGZ6FbuBalZ4Ve495srsLzeIz8U
         z7D4sHoFsbeUauaduARFVMQHfelJsmBQ6B/f5JiH46rnmpslzxs6gZ3nOeQs3tDISdPe
         i9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZdBjkohg9jd4yJO9EE0oqV7v8j/2vy4k87gl/EEuLtNGex7Ji7G5bDVzuzY6RA5qHKHaLDauHJbsGHwhgCPQH@lists.infradead.org
X-Gm-Message-State: AOJu0YwpRveVKOm5WRMyYm08DxyX8eQfdr8SSEPSQ5j3ciH7z8sqDyi2
	lj2iaZtRG6OTYVYRWPCb96yvUDc+IunXcWxBe6zdXoPBB2D58kmSCIcFLNK3g4jGNsH15NjHH1m
	/BTe0gvNAQyfeiwvru6WSRTZU346MFx8yJmerTaGM1Q==
X-Gm-Gg: ASbGncs8xSyqeveZ/n89TrIjMjXuUGTXvycfOHHcAkiNV6oBmlTXIRljVE4hEWkF8RD
	3n+y5kuE3QusbRZTU4Ru29WtObrqjIbTk4tP5rF1OBSuN57vmshoXaq49U47d9+jfyjWc2uwFNU
	PaS7LKW0u7DFDQYx54Spj121AdWlzxF08/lexYcLCCfnsJreOTOmqjzs0nqs3PMHd6RQ==
X-Google-Smtp-Source: AGHT+IFer49uV/0MlFOwzViAxidhmUTCovTOCELPmnDhegazhsSbbMo1dxe+RgiFPEHTV1iqxE1ZvAzIrmUV7Y4BUPA=
X-Received: by 2002:a05:620a:4405:b0:7ca:f3d0:e7c8 with SMTP id
 af79cd13be357-7cd47fed6f9mr3472211685a.52.1747919524812; Thu, 22 May 2025
 06:12:04 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:41:52 +0530
X-Gm-Features: AX0GCFsHvByQyFYjjj2yI43kVVdpVcQ_KO3AH4tPajR5bk66xedIzcAuV4seOEA
Message-ID: <CA+G9fYssasMnOE36xLH5m7ky4fKxbzN7kX5mEE7icnuu+0hGuQ@mail.gmail.com>
Subject: arm64 gcc-8 defconfig call to '__field_overflow' declared with
 attribute error value doesn't fit into mask
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-wireless@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_061206_861892_BBFDEDA6 
X-CRM114-Status: UNSURE (   6.68  )
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

Regressions on arm64 defconfig build failed with gcc-8 on the Linux next
tag next-20250512 and next-20250522.

First seen on the next-20250512
 Good: next-20250509
 Bad:  next-20250512

Regressions found on arm64:
 - build/gcc-8-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: arm64 gcc-8 defconfig call to '__field_overflow'
declared with attribute error value doesn't fit into mask

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
-----
In file included from arch/arm64/include/asm/sysreg.h:1107,
                 from arch/arm64/include/asm/cputype.h:248,
                 from arch/arm64/include/asm/cache.h:43,
                 from include/vdso/cache.h:5,
                 from include/linux/cache.h:6,
                 from include/linux/time.h:5,
                 from include/linux/skbuff.h:15,
                 from include/linux/if_ether.h:19,
                 from include/linux/ieee80211.h:19,
                 from drivers/net/wireless/intel/iwlwifi/iwl-trans.h:10,
                 from drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c:6:
In function 'u32_encode_bits',
    inlined from 'iwl_pcie_ctxt_info_init' at
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c:208:3:
include/linux/bitfield.h:195:3: error: call to '__field_overflow'
declared with attribute error: value doesn't fit into mask
   __field_overflow();     \
   ^~~~~~~~~~~~~~~~~~
include/linux/bitfield.h:215:2: note: in expansion of macro '____MAKE_OP'
  ____MAKE_OP(u##size,u##size,,)
  ^~~~~~~~~~~
include/linux/bitfield.h:218:1: note: in expansion of macro '__MAKE_OP'
 __MAKE_OP(32)
 ^~~~~~~~~

## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28517069/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28517069/suite/build/test/gcc-8-defconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9LbWebbQqL9EYIT8oB7qmNj/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9LbWebbQqL9EYIT8oB7qmNj/config

--
Linaro LKFT
https://lkft.linaro.org

