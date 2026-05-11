Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3710CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjVhhqtI7XvHvBXt5ZBrdyL+WZE05jLTGWEJNy/AWV4=; b=lS0gZP+5E6JlaviFM/838ukljn
	IrooUWaf068MJb3oOqyIizVpgLuTWeyzeixtud3vn2GFSEne74d1nK0GMreSJkaT3vLAIUs1xFPu7
	J1ux52vBOx2TXOP16/eNqVtG0wGR2rh08s8sv/OaZegv09O9hdB4QAaSP+cUTMgAc8vlsYlLbvzyk
	wV58/jjMpJ6Cej97XxzmnYKrDxPlPDKUD7uQ/s+EbEkzsAQr1XkwtGt6yjMjhgRZ3LnN+7ZFH2vwG
	Yod55L0BeQa1/AY0zwjYD8qkryvpZ/t8jiI38Qc+EM05LS75CfIMqmX3of1oUnEYzYKYyH1F5PGbi
	h/O1nm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQaJ-0000000DidM-33S8;
	Mon, 11 May 2026 13:22:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQaF-0000000DibC-3gvr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:22:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48896199cbaso39532945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778505725; x=1779110525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjVhhqtI7XvHvBXt5ZBrdyL+WZE05jLTGWEJNy/AWV4=;
        b=IdBuABNZ7hMTR2aMrJma8t6lgdOZOEeOXfqDEK1S4/k3knUFD6+/rac3dlbnwhASQm
         M5R5U+mdQvQK6oOIO1ofj93ZyDh+THJn5C0191DDB++rwAsWroNH9iC7fk416JTLwBex
         ztyXxexOUUtOIThevtCB0Bgobnr30nMBTDeVajxjiHmZRmkIMpY8/xcnz2fuAQY55p1s
         l95gJ0JuJhjzEalcmV5aPFlvNjVhGiy9vmZE9B8HgESn8noV+b+D2ABuKBcVVjzuB0bC
         y8tX/PQEBubGVU/xqXtY4LU96FpCKF6jebwx53YavMqz93B0Ss/E5isvnk0Szwkf975E
         3ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505725; x=1779110525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjVhhqtI7XvHvBXt5ZBrdyL+WZE05jLTGWEJNy/AWV4=;
        b=tUvwlgaJpbozhsIjBxEMlCA9WQNLUxT7O7Wc1KTNe1JOPVUbKnsjnAMRralqBiYHX1
         opE7IwwO4pQP1dZT3vaDmz/kDRjsezfyP/DH2yc5vH4/ef2SJFmVl7g/k/AAgsqAt3Id
         y+xlRcHZ4B92+n+Thz5T7kQ+3JyXJdgMsoEUqlnYFMIUEcvNe7ZzfJ7f2k2qbDQhFhfm
         B6+bBtEHbBPeUrFTN+eKdNToBZ681IIh3rrdC8s51UcXGjxLpVfZv7gdsH6APfe34b4v
         mDz42nLzFj6mW9NVo73O5LMuu9kjSjjrLXf1LxAJEyJ8Zk3/yKcLi8Hsaj97pp1VD+oS
         U5MQ==
X-Gm-Message-State: AOJu0YyULk8NA2NIwGYuLsLkk0vVeQbDOoV8noq26erCRZQDGcT3Xgk3
	RB070AdoPhvpOev3SwnjD7A8K/AanB5FlSO2Sl6+G3cl1OgXsl6lUHOl
X-Gm-Gg: Acq92OHOd20nJpym+tgY4cmw/i7tm5A6vvUzS/BwKUifn+2bkS7RMElF4faUFqBJUqT
	ES/ZOE5RunuGhNjcdgRTmTwoSaKsT5PrQXBOfD4IogUQzKzF++t5jpxSMRJ1uFoHLYlriILE4cC
	TD8EPstwmkaFDzaHlVZjReflHFBTfPodBL89M4VaoxeQLYOsbJYRzImAwrI8nHJNxHH1fzzMR9M
	Lc0dH/4XdO3te63RpItt7qbDGgDfIWCOprXS/8GTzOce/xOHryrqCHjV1D337i53LYdaO7FOTeR
	S7erueq1OXYuIliF89hJ3/zD5prWazIc+gr45i08f8Y3yjTGyscHiEApPnF1Wedyx0v8URTU2sz
	enjmMZq5gvOo9daR5GwJpQtl8EgTtw9Y+WD3/Yu8DhI1yf11tEnMgafEKliza43XVKOSlY0nNXO
	i3RqVzJLsUX2WTc6C0Sr7Dni9/rorGVlOKgmPKOskmIs/EpG+mYBIw50vuLN/ndSvdTQzkWMpwg
	Q==
X-Received: by 2002:a05:600c:2ed3:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-48e51f427b3mr251306315e9.15.1778505725311;
        Mon, 11 May 2026 06:22:05 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:34b1:bb7b:f969:515e:9d45? ([2001:871:22a:34b1:bb7b:f969:515e:9d45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fff9ab8sm194958305e9.2.2026.05.11.06.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:22:04 -0700 (PDT)
Message-ID: <c216a62b-1653-43b3-b6a7-dd81af9da626@gmail.com>
Date: Mon, 11 May 2026 15:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_062208_023585_08139F2F 
X-CRM114-Status: GOOD (  12.20  )
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

On 5/11/26 10:02 AM, Nathan Chancellor wrote:
> When KASAN is enabled, such as with allmodconfig, the build fails when
> building the Rust code with:
> 
>   error: kernel-address sanitizer is not supported for this target
> 
>   error: aborting due to 1 previous error
> 
>   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
> 
> The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> saying Rust is supported when it is enabled.
> 
> Cc: stable@vger.kernel.org
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Link: https://github.com/Rust-for-Linux/linux/issues/1234
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Seems fine to me either like this or as Alice mentioned in another reply. 

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Cheers,
Christian

