Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882CEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNgkV292MAez/Ftrvz5rqrrsIqnUNqRnV30Y0Cya1t4=; b=hGrlLpsOiV98fSB/8mBGtUijgb
	kC+QONgUyFC4Pn2dr/uqso4MhmG2DUCxwHV1qAPNACsyTqKFDxq+GLpC24MxkIbim0x7IfgTufIEf
	7jlOmxwBRF9hCuTdn9S1yk8hHYevcRFRCDGf+IpLa/bB2CWGiJJJwM1UYaHmE5VH0as2YGSpJpksB
	WifFoBRbsS/7o4zUKxjJ7tt3BvJddwAL5j6+/6HdvOTWFon8y2AAGRJNNONhF41ioUtm5t7O6ryLW
	5SGbA2KmgJ8vlprmBXIjFsVtlu2HfRuDG4SNEWOY17rUdDIysMDCaJkiI1aBqH28r+DScefYS2tvL
	M39NtJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Xt7-0000000Frp0-0nHH;
	Sun, 06 Apr 2025 21:50:45 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1XrJ-0000000Frgb-0CiJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 21:48:54 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8f94c2698so19554136d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743976132; x=1744580932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNgkV292MAez/Ftrvz5rqrrsIqnUNqRnV30Y0Cya1t4=;
        b=f41tIumo9HzY513hWCHyhPI5Ui4NNc81lnTxylcfrbzq/dRD6GxBmaBN1Hbqn6dEs5
         +hKfRvNlonI4dhFyGPTDuNWremq14SJ0jIba0TWIidpc0Tu6D0EWNt43JR7w4QiGyPKO
         XFMPPlEz/yVsh+w2MkMdX2llEJqei2OMFR3y9/mkjJCZpFUY/Zb9Ff9lc14WzRnRhgwH
         +8qJsp4TotW6ZayERzu9PsIGUADnASTXoxVpUAYtzBOo2RgwerDvmbu0QsBORYsHT6IF
         nYxBRqXtuORO7uiJ2/eHB2h6LKcFLWT83RMHI+dNNgjon/2/L1X3QYPfzGgWR6XYyaMX
         PXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743976132; x=1744580932;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNgkV292MAez/Ftrvz5rqrrsIqnUNqRnV30Y0Cya1t4=;
        b=MeSUyycFS5Rg1zfHKPDPN3IIkQrIiK9qpeHoYGn8VcLxEZbKouSy8OMkwWgfXoZR6B
         8/0WoJ849WB327MMJiyOeSyN0jiSWqDfpz4W0E061cZrPQOG6AZ8O9uiMEvF5diQjZgd
         18DXKuzm591oaqaPN3pdrkWVzuIHqc81Uwa62cU3ptQuUixpBwJLfj+Zho/qU4G3IWOX
         E6JktNcM/3WITUu69Je/VBTZrjoXHvrSp35ka1aYSVrXuY05ciYeJUHN5lFDkQWUPVWe
         uEjybFcyuvGxSE6NR3NYOiS9KfSfABn9giQuZWFlMGMcGyEU4/V73PCD2LYwJdEr6vws
         cnCg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfvMq3ZCZLASdD2fBShIYjDXlbG1vqFCxWSk18xn8fr9JKKG6N1yPlYHC0C52YF/VowpO3VsE6hxc3lhFkuBF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9W6zjgdXUZVoN8NejWwSenP0nwi0XS9oEAF9NJhbZMVrOl0OZ
	zgKT7aQTYAH1XPKTfnhfp27kWOuOA6Bj4xeScjM79NBFF2cqPHYF
X-Gm-Gg: ASbGnctrTWgECHV9Lrdqz4xSv+QTXU1zVshnATn5Ev32BF1yay1ZIcjCqMioPNbpPAy
	AUfad6lxizSRsc4E+iTPxq6my3J+lPAXw2/Ey86gnTSiu7SmHX4NcGXx8FvoVMxjnRRkW2SAwM9
	fK/fVgUKehhzJ+18+9HTHcfKr22KaOtAg2PIAFPVWcpm9xmaVxzGk5Bn+8DpvRtOsgoMPw/9NME
	wi4A862IG2Ccp+JiZ9rjw5OGXC4FPMEFWmG+7iz2Pov8PX6vg93ZqDrjuNu08kKI0FmcuyRZUSb
	2uMIgNZcjVDtYl/1SqD5m7zWfOuqpO0vEVfAKe2S3BlFIQ==
X-Google-Smtp-Source: AGHT+IEo/vvFQikPb5wxHN+5EYi3j68mWX6w5dxqxY4oIDDLekC3VENJPnI/ETKSgmdjhcKRZswhKQ==
X-Received: by 2002:a05:6214:e86:b0:6e8:fa72:be51 with SMTP id 6a1803df08f44-6f05850ca4bmr173026176d6.19.1743976131657;
        Sun, 06 Apr 2025 14:48:51 -0700 (PDT)
Received: from [192.168.38.58] ([24.35.8.11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75b747sm510189385a.36.2025.04.06.14.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 14:48:51 -0700 (PDT)
Message-ID: <10600492-5f89-4c1b-a8a4-0396af93f264@gmail.com>
Date: Sun, 6 Apr 2025 17:48:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: chrisi.schrefl@gmail.com
Cc: Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com,
 aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, stappers@stappers.nl, thesven73@gmail.com,
 tmgross@umich.edu
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Language: en-US
From: Manish Shakya <msh.shakya@gmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_144853_098052_462679A1 
X-CRM114-Status: UNSURE (   7.90  )
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

I followed the Documentation/rust/testing.rs document to test more. It 
seems that only the KUnit test is possible, while the other two tests 
are not feasible in a cross-compilation setup. What other tests need to 
be performed?

The KUnit test passed.

[    1.162374] # rust_doctests_kernel: pass:128 fail:0 skip:0 total:128
[    1.162388] # Totals: pass:128 fail:0 skip:0 total:128
[    1.162401] ok 1 rust_doctests_kernel

Here is my current setup:
# zcat /proc/config.gz | grep RUST
CONFIG_RUSTC_VERSION=108600
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_RUSTC_LLVM_VERSION=190107
CONFIG_RUST=y
CONFIG_RUSTC_VERSION_TEXT="rustc 1.86.0 (05f9846f8 2025-03-31)"
CONFIG_HAVE_RUST=y
# CONFIG_RUST_FW_LOADER_ABSTRACTIONS is not set
CONFIG_TRUSTED_FOUNDATIONS=y
# CONFIG_BLK_DEV_RUST_NULL is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SAMPLES_RUST=y
CONFIG_SAMPLE_RUST_MINIMAL=y
CONFIG_SAMPLE_RUST_PRINT=y
CONFIG_SAMPLE_RUST_HOSTPROGS=y
CONFIG_RUST_DEBUG_ASSERTIONS=y
CONFIG_RUST_OVERFLOW_CHECKS=y
# CONFIG_RUST_BUILD_ASSERT_ALLOW is not set
CONFIG_RUST_KERNEL_DOCTESTS=y

# cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 2 (v7l)
BogoMIPS        : 298.84
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls 
vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc08
CPU revision    : 2

Hardware        : Generic AM33XX (Flattened Device Tree)
Revision        : 0000
Serial          : 4014BBBK0948





