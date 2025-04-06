Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42E9C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFJzntw16SzoC0742TK/hg9oHHtechyPu4gxi9PpXOk=; b=lRODAwa2Le3XR2vIuZE4YGIweQ
	Q+YnJKt2tafCtf0fa3+ZVm0vIzBm5W9GY+lpA56NHcIj0PBPeKQ+liy8CJ9FlJrkzLvr2nHaIsR/S
	uEfrdTde3F9rc5FTx0t01BD+vv9c2EfjsuzHuskOe9pIcjwQhuXPhnBiP2tY37UY+tPPi/8htm3cj
	BLgrrf1OlIyGJ9bePgQvqjnYgH7Afsbm1DQwam+Qgnmj4rZw0TmQFm49jUuEWIr9TOm7UflhlFGsO
	7Dh4+p9hX00x3pe1xfegavqajA32MY42cN5T6odIQtW+EOp8Dwag1d0xWxf35PlPkbbJz2PwAH3qK
	o930s1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1QhQ-0000000FPZ8-2sqQ;
	Sun, 06 Apr 2025 14:10:12 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Qfg-0000000FPLD-1TJv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:08:25 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-477282401b3so37641201cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743948502; x=1744553302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFJzntw16SzoC0742TK/hg9oHHtechyPu4gxi9PpXOk=;
        b=KxyylIwTXkM1A3mv63CqMoHMRyAa6xT4MCHC3nGizjYyNMfnuOhyJxvQ25MsN5bT5z
         jsPAXdRUCe3iFr3JN14at4bVAsh5/eisdoWl6cS5vwq9Hp/I6vVxQrxHTi/vQA194dcA
         cO5qsZ9VpGEbTtywKk49Qo6QTHB4DHJowPTeVnKv20WvJDcJHTfl5M4M/JGDLREuIL0x
         flbM7PWM1lj0Wb6+VdDkMCPyIpZveyJh80cOnqPkGWFphnSALRHpLq1fb8GlMykz988B
         QeHwio+eRNZfDxXDxdRj+RPZQCm6JhtlE9Y1Z0G7Nq5L2MlyDfFTSnH7sIzguv+uRAuS
         FugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743948502; x=1744553302;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFJzntw16SzoC0742TK/hg9oHHtechyPu4gxi9PpXOk=;
        b=VU9JDxbcnaEe/4qXucFwc2mAyDi06lhrTCj3qqQgQ0uDRcpykQdcjNBst11kxG9kP3
         ReM50PxJKGarLwqUafVgCt/TSNcQ85CHA+JoXGyMV1zMwCk/64VViqEZHCdlNsw09ngF
         G3eLU9D/O6xO6t+/8oNpehk/9L4HtBLdGAp7dstSq/7a8uoowbHvyuPSFekegllCVwhq
         k/H1djmkfXSyX/EnojQxnxopzCpEsgKNwJbfVabGPZd9XqroE0Rb96/cJYyMykrxWACR
         tYU+ca7iZVcs0srEB6qw/4DYxirJzTh/zgOpJhCBpUo7ET6D0vkgEt8ZA9cIWQlxEDkn
         b/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWQKvr/JPW71zYyrQN1vs/46JEX4CMui2Jed2ia2/zrXSqSkMSSwkdo2X1bj6NlpsbnGA71Ii6diytvcg73Mip3@lists.infradead.org
X-Gm-Message-State: AOJu0YzvMe7GiemwVy+RfWlvCird1PJPcnFqsHUOPkAwqgsVKuUoL5Q5
	9yeTh006i5jBRyiqE3a9cWwyP3AhyBf3shpOvXnlsW0w8MTZTaBs
X-Gm-Gg: ASbGncu7ZMMk9aEy6ydomDoaOLadSRHRk9v7RXuR4D5nWFfgS8loyJQDr72MAA/sFUO
	yJ5SP+GmaYIpmwK95A5vsMd+iMs0kllyJJ3H0MQkXcndH0+KxynPwQwB3XyL0aY5TR8TtTO47P4
	Gk/lUhUMzJCfaFf1g0hS1c7BGS6KDC3+ljY5QJNK7L7eSNLC2IDSn+cx98/n0faWJlYRwsI3vme
	7ZneSKKo9t+3GUUaRaW8EMi22SQw1TOzYO5730JqNEwf6n2hL6S6uyEYH4431jdU4zyCOqoikXN
	iaZx9QXgEIN0NzDGaRB7cY5w0RM9drdU4ImT9ZeB+a/DfA==
X-Google-Smtp-Source: AGHT+IEUu/+m+XALAP+13peOc7iFxpgjBuow24PD88ZWu9Elv4WYM7GWKb8VhiqJcp3340l/+Tcpag==
X-Received: by 2002:a05:622a:1a27:b0:476:ac03:3c2a with SMTP id d75a77b69052e-4793110f2e3mr84031561cf.43.1743948502417;
        Sun, 06 Apr 2025 07:08:22 -0700 (PDT)
Received: from [192.168.38.58] ([24.35.8.11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96cf01sm474436585a.55.2025.04.06.07.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 07:08:22 -0700 (PDT)
Message-ID: <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com>
Date: Sun, 6 Apr 2025 10:08:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: chrisi.schrefl@gmail.com
Cc: Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com,
 aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Language: en-US
From: Manish Shakya <msh.shakya@gmail.com>
In-Reply-To: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_070824_392430_BCFB9C76 
X-CRM114-Status: UNSURE (   5.36  )
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

Tested with Beaglebone back with following configs:

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
# CONFIG_RUST_PHYLIB_ABSTRACTIONS is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_RUST_DEBUG_ASSERTIONS=y
CONFIG_RUST_OVERFLOW_CHECKS=y
CONFIG_RUST_BUILD_ASSERT_ALLOW=y


