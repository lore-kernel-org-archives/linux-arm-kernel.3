Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A49CD5E38D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=; b=oX/iAXpLXTzhFldoIw8PNDreXW
	bcQ2a86iBR4zkdYR9eca3pZrZCJvJogStpwo0/b6o9Qd4DM93HEK/SzTdNDxKYuQJ/CSksj7dP3oW
	L+bVr8r/8lOmq1dXJmAYPsQ68AsDSufCUvLhD8yzpE6LjlOaLIOYO0NPQ0Fa1GplXH8apOTfiFRVJ
	wqRhvYrBI/XWMnvyoXAZajQVerOCSzQrsA5h7GtrDNC9bUGxwOaspavyo9WZg/m4FbcpC5jtT2o25
	zoXY/uGcJujZVB+I2R5rMfWqj86zFNt4UIWuPpPt7h4p/ZNtmtoa+BoCrjbJYNPbl2lwAaR7WKQqH
	zOYVqOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWFT-00000005MG0-0ZWg;
	Tue, 16 Dec 2025 14:41:59 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVWFQ-00000005MFZ-3nFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 14:41:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b728a43e410so737252466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 06:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896115; x=1766500915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=;
        b=bgjp59tjPfjOQuqep+E75tyYxxz267vsauVu6LD1RMR2QJCgt20C6HTV7aiBnala2A
         geQg/0+xvtHe5WEKrGSGl2w85uglP5fjywZ/5uZX7+OKm9b+/koaA7n8uS6uSiVrBkhV
         +0zynYaOhWGaZGjuqLQTt2xFFuOyz+yjutvfT2TcA3hjp8E5g0mWzfzd1F0vxnu9BDZ6
         BJbdiEd0+uN7707h+mgr9kDFJ1O15+0YghxtRqWiFYxKuAkfNizjCWBrTwyLhwPqytdv
         yb1ZFltUvqhFu9I4o2GejbSxl4Ocf+w89dHjKA+ZIdIInt1ZC9mRoP3TEyauqm/8WbGN
         QQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896115; x=1766500915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=;
        b=Wr0qqavQ0yF24q3tKTtg/ljp74kRMvBSxNQZetymgdonqL/dlC2aRU/xUGElugdQQl
         3bH3T5Bfu865MgZ6LX0EcbcFSNioZchsceX/xM33v7N0cQgIMiyNTNRRxPNMq2zLJwHj
         N4RjF4GgoQpYiEGMmRBiZyDOlUFBIdLnLTHtEKTgfGmObXd3qBK7iFUJ7s5R8EfYvyca
         6LfQmiGyW3X3Q96eYi1YVnfkm/M5IIo1+Gw8AMeH14qOkxZh9q83OpOG+VMlLK0QkbSq
         6jmOIxMxyq7idEvb33HTRZ7KZ3+sX6FyWLaGRCrF83awN8VyRclB2OdqMsGSCS+5T5mW
         FcBA==
X-Forwarded-Encrypted: i=1; AJvYcCUmIQh09rD8Qz8qYuixGwNhF3G6GIJp9BwbAXF2HUhZIaflgH5obEOrGXgTh6HJ4DRCre9QV4bxuuF+YivJbo8C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz89G+9KEiVUIAbXQBqwx3Nf5nMxOJSDrfvpuHov3B8TWs0jk+r
	XUHzsJMnZIypxijkJLY2ZJtBJhGm3jR4hXlfg7i/akC5Zqn9tsdN2ao8
X-Gm-Gg: AY/fxX6rLIunBGTPpmNcKQMogDaEYGrqzkStafzvz/N9Ouc25uLpXLpF8StrY8gnIh6
	ZYjw5TiZZFT0UScV78r1YmxXXT8to7ftZKbV5zjfpIJysMaR1p4+s5wXKRwLpZwU85KM4Ypn/Sy
	Dnxfm9Jdblm4a2AWIsDvtWzDCGoxDW33tfesSI2Qfpti7qu9PPIGFYBEWK1+qfyxd5UJsk8UfMr
	RFkLUYNVzTj6hc5AtrzYPq8viZ5F/269+1sLO62cA1JDUhwSTX2rka9Bu2gInj4+s5UZUDlrBQK
	8EZNM0Ba+3KEwsYXWYwonuQIMAa82IkT1wkdUX4DwnpykeTg3LeCNdRQ9aP2HAw3+LMSdfzhXIq
	GMtVLBPpQVaxSPv0r7Wzlspa0JPREHxc5EWgoq4o4630Ik+aK2mIymuPxyt4t4zd4a51Edt9MGl
	hmWn7ZTY/ksO2w92qNRN6oSe4=
X-Google-Smtp-Source: AGHT+IG2eeJsem6ZFRGiTw+NwisDAZ+3SHIeXNcmnaxykLecsCuhc1aufmqpuqSo8Y4ftNwLIvjHPA==
X-Received: by 2002:a17:906:4fc8:b0:b79:f984:1557 with SMTP id a640c23a62f3a-b7d23c5bf6fmr1614360966b.46.1765896114506;
        Tue, 16 Dec 2025 06:41:54 -0800 (PST)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ebaebsm1717413666b.21.2025.12.16.06.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:41:54 -0800 (PST)
Message-ID: <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Date: Tue, 16 Dec 2025 15:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Rudraksha Gupta <guptarud@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_064156_958357_0D9528AE 
X-CRM114-Status: GOOD (  19.24  )
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

On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
> Hello all,
> 
> 
> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
> 
> 
> In short, what is happening is the following:
> 
> 
> - The kernel boots and outputs via UART when I build the kernel with the following:
> 
> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
> 
> 
> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
> 
> make LLVM=1 ARCH="$arm"
> 
> 
> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.


I've managed to the get the build setup for qemu-armv7. For some reason
I could not get past the initrd even on kernels that are supposed to work,
but I think that is unrelated (and not a kernel issue).
On the linux-next kernel I didn't get any output on the console from qemu so I
think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.

So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
do a bit more digging, but I'm not sure how much I'll get done.

Adding the LLVM and ARM lists to this conversation.

Cheers,
Christian

