Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F92C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=; b=SlfVKOxBeQJzbsLcCBpNO1fzF5
	F8sP4ql3c7hkHcmx7+J3pilMMFn2NXaB+IlOle8CuBLyN0KTY80xmMg6iq86Lmu+qzzSSfHlFOkjg
	z7TfYMHNV0rJCsJlwuOY7q8QjRx1xWJ6DkgT3/Hk4Zb8cTwud5JFen2Z8qfSo6uvjnNsLkcku7fwI
	IuXOkTH0180ImQOTqDtCxpPDvHQrILGkyAnX+mNzV4tznEyQHlD5qfxP3zl3NrM0aXX7shQjTAINX
	J5nYKsmTNWwkYbHaBiU1lJzXdvlK3k6elHt4nkr/mwZngCGrG4xgQ0o+a6H8CBR2UjlYOMuT25ti6
	TuCpwQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4QPh-00000003SiX-0F71;
	Mon, 14 Apr 2025 20:28:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PNM-00000003Jr4-1UWX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 19:21:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so52703965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658507; x=1745263307; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=;
        b=kyk+0FQdFXVqLYx7GsnXGn0CobC0Bxlu4+vPRW/QzSWxX63/+KkDLB7g4wK2d3U3or
         kfSjgj4a/VnYoXGptXPdFjNhTrzonkPEKRzPqYyvhe/Retcbxovvno4AeKh/XjJLOwjd
         MT/4E88CkA9VhurYJmOQYQYCSlezZbBh5hGc6SHChHDLlnfAUG8mda0b7BKrD6UzbIr7
         XnGzZPzwFyg1lfnFBy7lSk56ZdAFR383Xvx+sAg9DQEJcNJXwteQ3qeG7IJwGfByXTIe
         sYApCsV6ivIoDsGLOLoC/WDc1XPVKd7ovnmC/6k+vwHjg+RP05K37GluIwVaV8SHbaok
         hX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658507; x=1745263307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=;
        b=Q0XNUg4JyfOL8jwLyE9KSPY9TWFEZj/xDfB2oWnSr6Wk6SGEaDpS2Uga+0p82A574k
         8FNAqSEWxhGSPSTUqAbXHhEz6SMNu+eXrCONJRcC5pTNGsVmxZbS6I9aN1Toc+4/HGtu
         aiuDTO+QUyQ5Mwf/2xeTLkejopJOMdsYeM2f1OZJQGkDEiw2iszt2zjLgbanwFC1CQKO
         VmeyFyXKgMafcpPiGiJUFY5JZ8LukO7+n/FCAjpIALTKVlonX88BBJmrOscT6x7YuOr/
         RpeUDF74CYZjXScosmALPt3GfLo+4qPLJUrp60OhDtYZzhcCCE4y6hdyjWue4Gh3PNeQ
         fMOA==
X-Forwarded-Encrypted: i=1; AJvYcCWhh31rpuPAF+zTwPPfamtD+WVeQ5NdWoyH/vwb4HflcpcXi9L+NB2iyQDcKfSrd8TnA9mgE9ZaQRcDCJt4KhnX@lists.infradead.org
X-Gm-Message-State: AOJu0YxPAQ+kgTCHD8kPA1Ze46o50IPT3GVHfYrmMRY3EZLl8ec90wwZ
	Xa6nyEIC0uhGSFx11JPVPCo3kKmc9YOZzWzdhmiCr/c5+fIShGn5
X-Gm-Gg: ASbGnctTbi17PnS3roIpkhMgbjhJJqEYUJEj0Lvx4Y2s72EMkj7QZRu5zLtY+g4D1Wb
	gEeAU/x/RmU+ysKTBwrreiEuq+94fqzkZE1jJ2xWT9ILoMBPM892ogntDt+F2SxZ/8Mowi3en4G
	2jtmI2o8i2LHXBSrX+sIH5CJlWaLa/4mmFc5aU+eWhCgTTJGMEo/iZVRX8HbQYdUsI2HXm+f9pY
	Ci1a6JxYUiVCqHc83LHN51louOBmdrbusN1k4e/mjkslSSAZ9+iN8C6LFslSez+QAgr3j0pa+m7
	AAlrBHlZjBHqW40BOCAPtBFciW2w7GbQSl61e0lkfqOOAzNGLPISuA==
X-Google-Smtp-Source: AGHT+IHrtPJf7tJJ5VJyh1jOHcx4HFwLVSxBmFMH5rzu041anN5yYzVbiM1Y436XhCJ6X/gw2IidJQ==
X-Received: by 2002:a05:600c:1c8e:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-43f3a95c43amr105045055e9.19.1744658506479;
        Mon, 14 Apr 2025 12:21:46 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206269c8sm193445625e9.16.2025.04.14.12.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 12:21:46 -0700 (PDT)
Message-ID: <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
Date: Mon, 14 Apr 2025 21:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_122148_405250_5DBDF1D5 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Miguel,

On 14.04.25 8:14 PM, Miguel Ojeda wrote:
> Hi Jocelyn, Christian,
> 
> I started build-testing arm 32-bit within my other usual routine
> tests, and I hit:
> 
>     ld.lld: error: undefined symbol: __aeabi_uldivmod
>     >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>     >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
> 
> which comes from both these `u64` by `u64`:
> 
>     let out = (self.carry / pow) as u16;
>     self.carry = self.carry % pow;
> 
> Christian: I guess we can offer a set of `div64` functions using the C
> ones, at least for the time being, and eventually wire the actual
> operator with some support from upstream Rust. Or do you have
> something else in mind? (i.e. I think you have been discussing
> intrinsics lately)

I think using the C implementations is fine. Not sure how much the
FFI is going to matter for performance, but it should be rare enough
that is shouldn't matter (and hopefully we will get cross lang LTO 
or something similar at some point).

We could also just implement the intrinsic(s) ourselves, but then 
the u64 divisions would be implicit which is probably undesired.
We could also rename the intrinsics so they are only usable from 
specific crates. 

I think we need the opinion of the some arm people here.

CC Russell King and Linus Walleij.


I'm not sure what could be done in upstream rust to help here
and that would probably need be a very specific features for the
kernel.


Cheers
Chrisitan

