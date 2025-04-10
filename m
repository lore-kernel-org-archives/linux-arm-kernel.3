Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA67C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=; b=Jv8RnEhOIuSeXBYMeJFkZLxUR1
	sEaVe4L9Ur2vFzHMGk4z+ndr3gCFwyvctg5wqaldfnDKYQRBGIypko+J11vKKsu/3mTGW+ewA2+Ii
	aG5Kzo7EogrYeuoU2tULXYACsYEVCY4PSGyCoqGVSi6qKs/2RvITJyL8Yd5G2vKO5G5ZEa8kSG5r+
	6HjwUUKE/Z/SiMXXVVX9p2tfg/jFjUMEiV1renTLxoLVmml8n0AcrBxi3OcJbJaXU6mz2QuLNw77m
	zHWe1sDSdzxk66QdrQviyMzB+v3TqyopPrchE4v1Kgb6kBOcAm+gUBuUGkxKZoRzKVOkE2r/gcWQV
	ihtGaNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sWU-0000000AmAY-20hJ;
	Thu, 10 Apr 2025 14:04:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sTc-0000000AlcD-1NZN;
	Thu, 10 Apr 2025 14:01:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-736c1138ae5so793509b3a.3;
        Thu, 10 Apr 2025 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744293715; x=1744898515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=;
        b=GxwWI30mDq660hUkMs+vHEfilmDY67WsbRpnqN1j0jQV+ZTzP/xCHyd2MTFFtzhwvV
         mxBheoe8dSfDz0GUu1Rif9GJZnzwI4bxkx2rgB1kVSnOCgz4gV8rTsdQ2W817eoSav5P
         2DUJELpABVpLJ29govkLjzjLiGdRdLB8gntKq+8mSegQLdjpYFDxKchd6YpgihcYySi7
         TWNsAtBPi19zebmEWmrMba+6utjjOKSUSQlm3XiLdRDucvBePGC4VHOu6g9F6W2cDZIw
         DO/nbJNbmW425fMdGkbmx1Xt8crBooeA8ltCAFrPjBuHonyjG8ptoBE8HHJ7AX//+EZY
         jBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293715; x=1744898515;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=;
        b=jq7YodOSwkFf59IWtpci+EnT5eE7RauQeCoeKKSfSdi2pfoiA2zZCikeE/IY79CKth
         2QSIx3N1PyVoVUY6YsVyZaODAzz1/iEhG8VKMR/SbmTAgZodGdriv64KnGPM3lpv9IdE
         cyAoOsXZMWCdLflUHt7FDv4Jc9DdP4kqSJATZCq+3w4t0MBzcA+pEu6RpjDw7ej7v6A+
         E3XnLzyAEqzz/33jH5Ao23vZZkd2jJpSo0Q7sQUGtaoDB2RsMXbFKSlesqTqzhTxjtaG
         r3xmOih8NEdHt17R/rbPglWtKoJJjRERj0en3fXr/n5w3ap9N+XXJDFcv5EjSmyUWbxX
         yINg==
X-Forwarded-Encrypted: i=1; AJvYcCWfJT1d6t8FcwAv9AACOhP9ovgvMBnhNHmkg4ZvSEfXIh4Y0+jlH1FTo0Xctlmkj0rhkyKOuAo9cNpu8RQPY9Wc@lists.infradead.org, AJvYcCWfLx+yz8czx48vpR1JhLDy4ojJfcZS3g22qdpY1oyk0UAOf/vAwwt2oj5oZ6Mwr/8VrmcDUzvUxxXZHH4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8r6fFo7SKwJtApWq92jodss+jpiFS5DPtFXbSreVo0YuxSjF4
	YH+MlraifxLXaZvVw6AnRHwVj89ryJ0/v1d+MaAmHHz6h0ArWwaz
X-Gm-Gg: ASbGncuHT69KC6VBcaX4HUsJV2b4McW71ozGncHMU5RkluM2gCflFOehvFQ8Vqvkv+k
	9CDEbmnc3Goz7fdesca7+JulerH2Xh7l/Oct/vd2KHyU+2iZAy4JmESC0NDyKqoYj5HL/Lu9fnt
	L4X5QsFEaYCdjk0eoxYtNSmJcmb7PESp9BR9X3Vjd4CjLHYoERq0vv+jx1/8dCauxQZTAyXG6l4
	D/Axuv4nDihZrIU1re8ryuQ1oK1sB5qV2wGBC/kHEPB0TgZxc6hLbg+59NphG8mFNywVMUYnk0O
	/+BQqqiyTzDmXJm2A2hKxvMOwNMVmLtW452Gfhxx/CeaSCxRXdJfHryrXfkG2yB+7ptpGhaISku
	1ielCcqaEx2K+TIcKqIigMQw=
X-Google-Smtp-Source: AGHT+IHBTE6t3tMPyBmMiDGR0D6P+It1/bo69iX0No3GsbY7YKBIFvGuQ1V6G4gotfqVUWbx+i87Xg==
X-Received: by 2002:a05:6a00:8c9:b0:736:a973:748 with SMTP id d2e1a72fcca58-73bbf01e262mr3359584b3a.22.1744293714003;
        Thu, 10 Apr 2025 07:01:54 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3824asm3362820b3a.103.2025.04.10.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:01:53 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:01:38 +0900 (JST)
Message-Id: <20250410.230138.20974725432146108.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2025040954-prenatal-enamel-373f@gregkh>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
	<20250409065802.136971-5-fujita.tomonori@gmail.com>
	<2025040954-prenatal-enamel-373f@gregkh>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_070156_371628_E107BF47 
X-CRM114-Status: GOOD (  17.35  )
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

On Wed, 9 Apr 2025 09:38:53 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
>> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
>> for x86_64/arm64/riscv.
>> 
>> The current Rust code simply wraps BUG() macro but doesn't provide the
>> proper debug information. The BUG/WARN feature can only be used from
>> assembly.
>> 
>> This uses the assembly code exported by the C side via ARCH_WARN_ASM
>> macro. To avoid duplicating the assembly code, this approach follows
>> the same strategy as the static branch code: it generates the assembly
>> code for Rust using the C preprocessor at compile time.
>> 
>> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
>> generate the assembly code; objtool's reachable anotation code. It's
>> used for only architectures that use objtool.
>> 
>> For now, Loongarch and arm32 just use a wrapper for WARN macro.
>> 
>> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
>> BUG/WARN functions implemented in C works.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> I don't object to this change, but I would STRONGLY recommend never
> using this in any driver if at all possible.  Only use this if the
> system is in such a state that the only way out is to reboot the kernel,
> which is what both WARN() and BUG() will do.

Totally agree.

As stated in the commit log, BUG() is already used in multiple
locations within the Rust abstractions.

I'm not trying to introduce BUG() or WARN() as new features. This
patchset aims to improve the information provided by BUG() and WARN().

