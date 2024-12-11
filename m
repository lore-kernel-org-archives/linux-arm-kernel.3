Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9E8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShXp0MbnAr4ggsRDnYhR5uR6lsM/ajKdCXbVIq5oTug=; b=umZXlsQwmha3eMfKttvJl4Kymp
	FL1PkIlSos0PTwirSFzxzLmDl258O4PNacyq+SBPmVtVpt2diPQ7qorIICZG2teWLSrS2Ud7QO/mm
	3kiWpL5p+vzKxv1822X5IUQEuY9A+VsHXhFNBdVZZxQLYUzU6K/LR0TNGP3vQVwge58VROqnN4BHU
	swac7OqVI1fdVZdtXFWbNmEox0eDiy1hRoQ36XHi/C5oSHJ0e7/po8FHomweISKzf1cReSFBbYx6h
	6tbrrsJ7nkCH4WWN/7d43H8y6qvJzq/EPrWEt/P55TrqIV5rnrOAoSuZKYEdBmn/Rihvkh7TXFlO2
	qAWakckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVxz-0000000GRld-0QhT;
	Wed, 11 Dec 2024 23:18:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVwu-0000000GRbj-1k8p;
	Wed, 11 Dec 2024 23:16:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-725ef0397aeso7139b3a.2;
        Wed, 11 Dec 2024 15:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733959015; x=1734563815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShXp0MbnAr4ggsRDnYhR5uR6lsM/ajKdCXbVIq5oTug=;
        b=bW3P2gHnl8RrY0M9uzM92GW+HMopYq41zUfXTZ14c0qk9GHgAucXivEGdweLmMR7c9
         uliN81jWriuP9mj0cVGi0imCqbgV6dhMAYMmue4KKU7d2BQ8pldPta9d/oOUL2pULBpZ
         g33oCiu6YgR9s42khKk12WTp96O3br+WvBXAXy7C1LZ+pxU/5d09ZxjIXbpBuANyWKxv
         zem+9M8prEaqrAfSS3spJz1qTPuOTOG2zhMCXRSXbMpsF+CAPl3Le372C8zZXfNpmRQp
         v8zJGCXpynb5VtEoVo1awPXm34w2rzQYyn4uIfmREjEMT76f7ddcHJKqtpNNCDQ1BWKs
         8Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959015; x=1734563815;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ShXp0MbnAr4ggsRDnYhR5uR6lsM/ajKdCXbVIq5oTug=;
        b=RYJyQa08Oton9mT+M41fEsZbhCMREMXdlEkVJTBRN8tnYyqBJVODbH5ubZWOs4UoU/
         zOio5tet0JlpaX26Db2GljnVSPzvQCRbBaipWf72/vlKb4iwl2b5jm6cJzm3gLylFuw2
         ZSKG7cTsSbhMpHlV9mgg+Zapuu39yjq/I+Z8YGQonZyspN89vCSW6CuQlbRlhy8TnhW4
         w5zZ+w4f3XW7h8fnvW7Q1Ww0tswXkp1f9C7QnHq03SbI+w1gP2sFbPqCuuCN9aqqrOc0
         tOddyVDMvQZkrndYfZregLVQrnvfKhtsA+nJ18EOsUJX3DPfHRpl/LsO7Ajue7BpBG79
         wVKA==
X-Forwarded-Encrypted: i=1; AJvYcCWh0cZQr5hr/4G6WB4vsf2ysWg6R1MKEeVNb0F+TU0GFGEZ1rAKbYRMv/8FN81AbcUEm+AqXy+MDlqKb6Y=@lists.infradead.org, AJvYcCXtYiB7FzQKC9xCqO08OH405A7LL4XrDuUbEnZ9cUU9EncqvaaoLQN4cgFUYhiaQhEkKwIH2I7OSZ7URardJX9l@lists.infradead.org
X-Gm-Message-State: AOJu0YxBAeXX6VSvCi5s3bk+BqZEiE6taF22KmYTLmgY7gGut2ON0lan
	H+RL9wysZyjJ8QcbcqUk/hxGAoIb3eMMw7pG0r604DyJ3FCTLQfP
X-Gm-Gg: ASbGncsGxaJtARFN7TLv7Bvnd/J0wpTb/39Me5jT0QRIs/+U4exOD+Jav7+bIvP8sYi
	0ygXZcF1D6ljRU83Wbxk359HrflU1brqDNNWfkm5sdvemVhJ/szrUtbzQSQ7BghnF/KzMbRsxZC
	io90H6uAvlwJ4EBmn4csBUXBxneIjT24Ol2VbnbT697rH7b0zlM+hA6HfAoLRB0wT9+ORCj7tsW
	42OW/wYBiVYDHxlG09g1sB02EHDvpBrEhKTtlgTRAs2EJXAdhc4XGuGoHD60fj2/4ZqfkyAlVBq
	sVyCDvPqiV7I9foA99Hrz+Vjj0jUj02swewH
X-Google-Smtp-Source: AGHT+IHiOZwkIkfA6zUyxiG0lm10+eI/mHdViFN+Pz4GPmJYmGkPLqez5E4FZA5uA6Zaeh8N3oG8TQ==
X-Received: by 2002:a05:6a00:92a6:b0:725:f18a:da42 with SMTP id d2e1a72fcca58-728fa9bf4abmr1705891b3a.2.1733959015026;
        Wed, 11 Dec 2024 15:16:55 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cf238777sm8304590b3a.47.2024.12.11.15.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:16:54 -0800 (PST)
Date: Thu, 12 Dec 2024 08:16:39 +0900 (JST)
Message-Id: <20241212.081639.1353664129364117890.fujita.tomonori@gmail.com>
To: chenhuacai@kernel.org
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn,
 yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v1 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for
 BUG/WARN asm code sharing with Rust
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
	<20241210001802.228725-5-fujita.tomonori@gmail.com>
	<CAAhV-H7BxE7xeA982Pr4PFxgfNpgXs6H4OZ2LydmYAtYjvYNaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_151656_454538_55B57DC5 
X-CRM114-Status: UNSURE (   9.31  )
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

On Wed, 11 Dec 2024 16:41:42 +0800
Huacai Chen <chenhuacai@kernel.org> wrote:

>> +#ifdef CONFIG_DEBUG_BUGVERBOSE
>> +#define __BUG_LOCATION_STRING(file, line)              \
>> +               ".long " file "- .;"                    \
>> +               ".short " line ";"
>> +#else
>> +#define __BUG_LOCATION_STRING(_file, _line)
>> +#endif
> Can we use file and line instead of _file and _line, which is the same
> as the CONFIG_DEBUG_BUGVERBOSE case?

Of course, I'll fix in v2. I should have done that.

>> +
>> +#define __BUG_ENTRY_STRING(file, line, flags)          \
>> +               __stringify(__BUG_ENTRY_START)          \
>> +               __BUG_LOCATION_STRING(file, line)       \
>> +               ".short " flags ";"                     \
>> +               __stringify(__BUG_ENTRY_END)
>> +
>> +#define ARCH_WARN_ASM(file, line, flags, size)         \
>> +       __BUG_ENTRY_STRING(file, line, flags)           \
>> +       __stringify(break BRK_BUG) ";"
>> +
> Can we use the same indentation in this file?

Oops, I'll fix in v2.

Thanks!

