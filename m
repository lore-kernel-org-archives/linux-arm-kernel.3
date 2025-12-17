Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EEAD6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVo0HBOMwKu9ksJmzCZKQPSTIhrU1ZIPJ/ubRTYCNmk=; b=3GnLTPJooE2z/z1xVtDtW0K9kp
	GwyUFa3e5Tu25zyzAMj+SIog8q1gHxY/53GrnVpcvl4V0/ROUb5DyqhcH7bwlirYUaOxYFk55qexh
	VdIxgXwwYDmM/Wrzsolx/YnyTMxzLyfxCS9bpBAtHHhiJG761RUm7FJBv+Hjo3O3Wr9moOD16LzqM
	gnZTtKr1V6RT8zAn/D/H2ra0qOwWXscleekHudhcpLjDqVtM0oGaM12Nbu1iKiHa9fQlidsgfVhvW
	Cn+CF57E9wV5JNPwJQI8P0CUsCTkAME6bi38yRNpYYOsKHtN1cjYWlgjaUC4Q/rRG2mrFfSh82NN0
	K73SF3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoes-00000006d0K-2fBR;
	Wed, 17 Dec 2025 10:21:26 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoef-00000006cmy-3gbD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:21:26 +0000
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7baf61be569so6651216b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 02:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765966872; x=1766571672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVo0HBOMwKu9ksJmzCZKQPSTIhrU1ZIPJ/ubRTYCNmk=;
        b=QIUxaxShl5ZbpsC1UZpPBv5wyji7I5vVUZv6BOEZcE1duc3QjAkj+SCGQLC8nZEulg
         POYdO/QqBKCJhZh6ityrpZ3jzv38ZlpmwPSr7m6uf5wtYF9k/K3B4ypc2ZKvkBfwLABT
         LiXAVWlmkL7FdoyVbUl5whwKGS5Gy5O3FkSI9ttCUCkgjSzh7OtCnobu/vzV9/g2yBrY
         gjMutrXL245XnzwFrQ8gnppyJJpnttCeyy5blnkdwSGqB74YYPhJz6p0DHK+AXjo10C0
         RdidCsBu+zXz7agl5nuxh5VX91BtD4u0+2vOPMvM7rRGlbFBJ9kGSZTYOfusucXoRNfG
         otdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966872; x=1766571672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVo0HBOMwKu9ksJmzCZKQPSTIhrU1ZIPJ/ubRTYCNmk=;
        b=uBe6FZnz8tChG7Xbco8WeVcvmgW9V+ZfZ7NQN1xiw/1qmGzgdnPgwZMvIq064fRYXg
         vIEujyziWqs5x5ymkk78R3zDE/p+WxlSqYrkFXFw0CPhDb9O85gPFxBixXFwhAhVJcx8
         kfgqph3ZTiL10JTSwJLcJ/JvCqOgHw8v6RBclYbMTJ6bT64sUP7MXoUNOJePmYDNAKKt
         sulrCD6u8hpyVZwb1qbBKr/+9ezHw/wovC/KjqEHHcWHVQuggN54geZvFxAsEHohC3Jp
         XJ8jSEOfupbid8Ln8bD1G16TYv2tDFETG2fd5VKgvHwmCtLqWQioodXgo+bSZSfJmuQb
         XjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVice2M1Ql4asoKInUX2WVRgHIl4lbQYWjrhkAKYn/JccomkYX6rRLw9YekbT8I22M8Bnlwf3AByW0ufBp+3t+w@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv5SIgcL6NpicqSSr8QVbiJRUMDDt0J100d07JnEncXBsFLsIY
	3VEW7w47PUTCSvIHQ0H9l+DS6HFN8v/cBwyelLvWAUQTywebs07+ZDC0
X-Gm-Gg: AY/fxX6nCZS6UqLVeAGf2nCibnJ53R4tynH6ogKTcz+OHfhp/FHbJk+St22wkl2pmHm
	pL7BNZCptHwCz79fFku065HYSTBMKKW0kAKiKKBoNWehI/l7pPBiH3dPz8D8fLxAfvu8H0HyEdj
	sBSSEzXbSuZXVJIrmAOkh6f07MeZ7+5IKteMQXH6VmuXMIc5d3jV4RM/4q7fYfd3f2ApqxpJTs9
	m0WFEa71jdvKByPrc83kvhZx13w2LU3syY4ocpmJyIQC+fwM0km0Ert+vS9ygRPToRlqdPbznn/
	PleviBR+avx833wvw4kiamBWJAwIbF6uqzSnA3TCiSgGLQXDyDDI90JDf3IHRijae+b7WpwnhmY
	krMcHh6W5VN0QcwBPO3ZD3CoRPcfQFSTFlOja0VxAFzCyQuqRIrVWXh5tllNifzYKot5bjUFrKA
	5ho5R+exEiBFW9slJJr8ObZJGVXGmmUgqVoOBAJk+uurGY4kI0iLg2bVH4EScDSA3RCA==
X-Google-Smtp-Source: AGHT+IEKnlxl760/suZ89AobjUICKYa4N99bq8z5k3ImT4XOViJUc86UsaA7/A8wEeEcuyACIfLqtA==
X-Received: by 2002:a05:7022:158a:b0:119:e569:f276 with SMTP id a92af1059eb24-11f34c035a0mr13548110c88.31.1765966872169;
        Wed, 17 Dec 2025 02:21:12 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm26457054c88.6.2025.12.17.02.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:21:11 -0800 (PST)
Message-ID: <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
Date: Wed, 17 Dec 2025 02:21:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022113_934081_3A559FDB 
X-CRM114-Status: GOOD (  22.86  )
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

On 12/16/25 06:41, Christian Schrefl wrote:
> On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
>> Hello all,
>>
>>
>> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
>>
>>
>> In short, what is happening is the following:
>>
>>
>> - The kernel boots and outputs via UART when I build the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>
>>
>> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm"
>>
>>
>> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.
>
> I've managed to the get the build setup for qemu-armv7. For some reason
> I could not get past the initrd even on kernels that are supposed to work,
> but I think that is unrelated (and not a kernel issue).

Yep, I just got qemu-arm working to drop into a debug shell for now. I 
have to look into why other things aren't behaving nicely (but that's a 
problem for later me :P). For now, it seems to demonstrate the problem 
nicely:

https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740


> On the linux-next kernel I didn't get any output on the console from qemu so I
> think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.
>
> So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
> do a bit more digging, but I'm not sure how much I'll get done.

Did a little more testing in addition to the testing in the gitlab issue 
mentioned above:

- Removed Rust configs from linux-next/pmos.config -> didn't boot on 
qemu-arm and my phone

- Then I removed Rust dependencies from linux-next/APKBUILD -> didn't 
boot on qemu-arm and my phone

- used linux-stable instead of linux-next -> booted on qemu-arm to a 
debug shell

linux-stable is built via gcc:
https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/linux-stable/APKBUILD#L179

linux-next is built via clang:
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD#L68



>
> Adding the LLVM and ARM lists to this conversation.
>
> Cheers,
> Christian

