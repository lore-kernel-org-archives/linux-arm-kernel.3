Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D887C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYSfrspZpcalFQy7DGPov9HLaRO54OMeKc3JEmAB2IM=; b=OvYu/dhvVYaumGNS864uI7rLtu
	2Rvi7Q6sHGkWc+UfcporPWP+ljhX9S+2qFqoWlLnEiZEEjJPg+IlTGPVFTOW/GMYTfJMzPvbDxfib
	F9W9l+9JDZwF+VrjzWU8PM2/uMqcqcufwZNWU04pGQ6vho6VcRo9GaxTfwIIfHDCk/HuAjkLUmQl1
	BUqzJusn/qK5beqz/RgeUsvl3IlnlVYZvAkNJIPsi+bB2BHUbJ1Bf10720/J0JvFM8kQDXyEQ2OOu
	ecc3QrZqU9SpfTYCGYoV8jzMak9oU/osvc1tX216a/bqEYYcGh/SIXf0gAvLSPocNVEVd0v5/g4Kk
	AnsR3CXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddhA-00000009lKh-0ZPq;
	Thu, 30 Jan 2025 23:11:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddfq-00000009l9A-1fIq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:10:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso9972465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 15:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738278612; x=1738883412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYSfrspZpcalFQy7DGPov9HLaRO54OMeKc3JEmAB2IM=;
        b=kV4qAd/E86z7062geWV4YeRxycH7ZPpe31kB26fQ2ouevHP9oaxx55W/5lDk24b2MY
         UzVP50bl6lMBjRGQToNXSqgm4BUsoaZx28UoGUcJod9xxONhikjUzFfK7EUHgo+ikjoY
         kKgsj4z7AzwBZP4IhkRB6dLpgcxkBd1HEU7mLhECW6e9wnAlYO7KzSRgRcgRQWElbUw3
         7x2CzSK38fBAcU4xKDHoKI8r+sGhS8yp5sjSc70Y/qpfK7P3qO3WRACyAlJfwtOulLUU
         DRzdxgTzGx6d428EKSeBRmTJ3tvqwIUZaN2W8VG1T16G3Z51c77Mkmj/p9nnEfCckCnK
         Vr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278612; x=1738883412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYSfrspZpcalFQy7DGPov9HLaRO54OMeKc3JEmAB2IM=;
        b=NAqICDurbWirZlR/Bca7MYtiXqL0mfGvfAtTfkCL6ITiFXNYn4rFVsTMUBkfAM0/Z5
         cDDUVMxydp0G1DkkXvtbsTy5UN95oNcVNVzkmLUBl8zLK0fKyaaRUga4aabzkiqkoEB2
         N8wpWtVSYjr9BwBR5v3cobJnEAPJulkoJi1nKLRPy5EOqO3PIThPYEVsFmQQDBwXjUNz
         FII+Fwik81DUPpdTRISKWET8U1CLis2rX3U7Xpw/FiCotlAs4dMZnkuj2vNazvh2GdHt
         gPO0bXqoM6wW6dfOurEDNCVHrJaD/H1trKsv9ild0RaVRzRP7SC3lBoByToLeSMPubQ2
         ml2g==
X-Forwarded-Encrypted: i=1; AJvYcCUdLiW+2kU1vfqzlHOc0TVPZlChc9k0Wiq7XYa//Sl2HJHpG8y+FWhjMAXo2W0ouwsfhVJbt7gip1HKU+IJnEpn@lists.infradead.org
X-Gm-Message-State: AOJu0YzIllLIJDoNxwVYTm2X0nTdrGYpGRgydlnFr2HRWz71rePJpnB9
	F24GYKbJzcPulr0Y7792cqTvR9Ge1kBTPyXxveO4qQ61jAQ+BjvE
X-Gm-Gg: ASbGncv90XKvDWZGYIHsMTLSKGOaLRcYatrSMGysUqhOEX9/vdyDciae6w0rOZAqrXl
	P2wGoLVcdsRz1ITSo/HFUoI/bCQv4VWAUBhiPYfe4fGL8NIsY+I6qtWt1Db7n1QbHd+piklwZ7x
	S5dfxOsvGW/vCLB4ra9OIosRVjpDsljQvLH1zj8lZv7DOkc+orDNgxP49pZ7Ryo8Vdx/XFDbGKU
	YaBnNKNz7EDhtKKa9n5pCUjSktTqjuaCWBznZKAtSbZoZRaRhJT2X+E4QfyC76UndjzumcVgd88
	dm1C99Ej15/FKBs19865JHC8wsKa
X-Google-Smtp-Source: AGHT+IGHatIBqExc2QjMBxlMrxHJ7JJTUTvxVUuF1NV9bbMeXjnFByTNOWJSOdIRyooq55YwHK2bRg==
X-Received: by 2002:a05:600c:3d9b:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-438dc3c3554mr87706875e9.15.1738278612188;
        Thu, 30 Jan 2025 15:10:12 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm72338575e9.9.2025.01.30.15.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 15:10:11 -0800 (PST)
Message-ID: <0414bdb1-2258-4164-af60-c40118d0d7f4@gmail.com>
Date: Fri, 31 Jan 2025 00:10:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_151014_442503_7CBD14E8 
X-CRM114-Status: GOOD (  22.21  )
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

On 23.01.25 11:40 PM, Christian Schrefl wrote:
> This commit allows building ARMv7 kernels with Rust support.
> 
> The rust core library expects some __eabi_... functions
> that are not implemented in the kernel.
> Those functions are some float operations and __aeabi_uldivmod.
> For now those are implemented with define_panicking_intrinsics!.
> 
> This is based on the code by Sven Van Asbroeck from the original
> rust branch and inspired by the AArch version by Jamie Cunliffe.
> 
> I have tested the rust samples and a custom simple MMIO module
> on hardware (De1SoC FPGA + Arm A9 CPU).
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
> I've updated my Rust ARMv7 patches. 
> Not much has changed since v2 but I want to send it out again
> before sending it to Russell's ARM patch tracker, since I should
> hopefully have more time to work on this again.
> 
> I'm not sure how exactly the patch tracker works, I assume I
> should just sent it to the tracker once all review comments are 
> addressed and it has sat in the mailing list for some time? 
> 
> I've kept the Tags from v2 since nothing signifficant has changed,
> I hope thats fine with everyone.
> ---

I have now submitted this as:
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9441/1

I hope I've done that correctly.

Cheers
Christian

