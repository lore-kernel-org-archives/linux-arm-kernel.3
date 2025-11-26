Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2AED1119B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hrjCGTokKrR0BnJSuEojRuEu2dsqESmm8qkZ4/vDpA=; b=2de9Ewhc1ZxiBoq9Z5mYd5omhi
	bMnyrLfRvlBAQULVZ+yzV2+lsuijqPEwm5McL99YrJHPu85N3aop93zv7jBJB8FFOqsqI9ykgxzvn
	5VM+iPHUJ4TKf9bpIuDbCqLWBNq6tDyzD4PWBuu19nRoIJO0b/o7XPbABUpNDxyMugX8L7KCZdynp
	e6vs2jr31XVNVs3pYOECd3t2B8z9gysK+PfecBuIvSUXUGVz9Dd+zJOo6Qc3lOq8Ux4PS9Vhdn2+J
	J1sNynBBRJGJGxIE16mSr4viqge3QJcR3l6ByuitVUA07lUUJVNwIKc/aG2e/xylzZfhJFhwrIULB
	CXYfqzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMoy-0000000Fezr-1zHG;
	Wed, 26 Nov 2025 21:13:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOMou-0000000FezS-1ChW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 21:13:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b762de65c07so31781366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764191577; x=1764796377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hrjCGTokKrR0BnJSuEojRuEu2dsqESmm8qkZ4/vDpA=;
        b=HfPayCUQgrm4NSLSfWqjg7iIp9rNsj8xx9NqfIZNEcZqVlPjboidwytoJGblApjUXY
         08Jlnrji4dShLQ+FwC4w/MfTDeZ0tPWwg6IcbM9M1XN1t3QkEIkieoPEfe0YpEUI7Ra+
         e02shNso/Bh5elNsdn1FkqRpbpu/x4kfC4rDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764191577; x=1764796377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hrjCGTokKrR0BnJSuEojRuEu2dsqESmm8qkZ4/vDpA=;
        b=QmOaR+DOHhB6UUMXm9jPym/AV+aCxH7VRMXyTc2adrliZlsgicBpNzvbuwte8gziDp
         vc/jHr/SeQdhJlREptpeXp33ScFSypwCGeVpC68d8tPs3GjCSBKLokDBhz6/tUtG6WZV
         /xtEcMPbjErUUJDhlO8nu8fzR6RxL/AytgKXgzsHJEuxlyxqGRKWkfUYlDbZAeXIg3Ii
         I7BBl7uiOSpDiNXMr4Ehrv5smqXCe3dNcQdJRow8K1Jr2i4yhcNu5dsUSHUkCQSlj2B0
         C2Vw42pl7IVDxRTFsHTUSWLNghUYg/cu8CPJDS2aOc6qUAkUCe2cMg3s8pCF776/UZ/G
         +VjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS9f7a/jYnEl1j5sQb2yoDaqvUmBlyjN3oyIO+Xwe+IlHC+9NFuEihifmsen95CFxf/PDapUyNKOd+NBtULXi3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi9ltzsklOtXaT1qCp7TNNhWoQpxWCAU/LESeYg/amw3sLlLKG
	UqJMaD9NthXzbwqBvYt0jn26bTi92QB2BqmMLGGtJprPNKJorEJJjAqeEkc6+xtNR3Z9ic/YGpW
	xrERinwjXoQ==
X-Gm-Gg: ASbGncsUkOzkbDqLpoPVfdAYBjrAKX16iYCTA7/LMLZYSHp8vKrVND8f+EeBrSNkzKB
	5kqNYbpXAHDkBc0NgSzBEtjmBq9HN/0ch2A5Qc3osP8om72ZAY6R74M7zlJiWthcLuh4WVnxBoq
	eyotV1ospNE5Wb9bFtzkXJXOltmMurrkp81XYbCqQS4krjdujEIhsfeByTASBZiPy8tFbqD0smU
	3ZFrGXrtwp2GuSo7GKBlpa6VuUm4ZNlaM/gpHBsN2YieVTIAmY34fpcQ3uOYkxkDXKmLqiW25Lp
	0MQvedT3CA3cPECO1S6Q0fy833BzG6kRJvl5HQm3UYXIMU1tDbUllSoBemRmAkBNRYls4dyNWWZ
	rwIOgLmLPMOaVETwAcXFdAA2TMPMnUdQeRxSe5+/G4txJJoRk9xozE9fiIFPZvV8MA5WQox2dKs
	wfaNxfdC7q5IfcdcLnhXBmFaz/Cl12WVS/ebiycGhdYeBfxIDYIXTuknAJUclh
X-Google-Smtp-Source: AGHT+IFOKeMz22AfR+P7N0EGoBQ+LZWzvRXLmrQrLNVuvfa/ZCLRFSukmG0jsM74/3MHhjwMwdUcIg==
X-Received: by 2002:a17:907:3e86:b0:b73:74b4:f236 with SMTP id a640c23a62f3a-b76c563c190mr870362066b.46.1764191577117;
        Wed, 26 Nov 2025 13:12:57 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ce15e7sm2004319466b.8.2025.11.26.13.12.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 13:12:55 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so461836a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 13:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJCWZ/wNjM4HMRTYS4pxXyEWeiREf0NDg1cdpO2142orchBm53sTo6NcgpA/+/+XTfJR3zbD9Ou5FZb4pxZyvr@lists.infradead.org
X-Received: by 2002:a05:6402:5192:b0:640:d061:e6b1 with SMTP id
 4fb4d7f45d1cf-645eb23b736mr8204227a12.10.1764191575057; Wed, 26 Nov 2025
 13:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com> <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
In-Reply-To: <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Nov 2025 13:12:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
X-Gm-Features: AWmQ_bmijlsSBxI6qiVA8VQBddyswwSNhEs1F3E3qSXMF5yTCuTDAsS8SQqTKN0
Message-ID: <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: Zizhi Wo <wozizhi@huaweicloud.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: jack@suse.com, brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	yangerkun@huawei.com, wangkefeng.wang@huawei.com, pangliyuan1@huawei.com, 
	xieyuanbin1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_131300_351333_E77AC2D2 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, 26 Nov 2025 at 02:27, Zizhi Wo <wozizhi@huaweicloud.com> wrote:
>
> =E5=9C=A8 2025/11/26 17:05, Zizhi Wo =E5=86=99=E9=81=93:
> > We're running into the following issue on an ARM32 platform with the li=
nux
> > 5.10 kernel:
> >
> > During the execution of hash_name()->load_unaligned_zeropad(), a potent=
ial
> > memory access beyond the PAGE boundary may occur.

That is correct.

However:

> >                This triggers a page fault,
> > which leads to a call to do_page_fault()->mmap_read_trylock().

That should *not* happen.  For kernel addresses, mmap_read_trylock()
should never trigger, much less the full mmap_read_lock().

See for example the x86 fault handling in  handle_page_fault():

        if (unlikely(fault_in_kernel_space(address))) {
                do_kern_addr_fault(regs, error_code, address);

and the kernel address case never triggers the mmap lock, because
while faults on kernel addresses can happen for various reasons, they
are never memory mappings.

I'm seeing similar logic in the arm tree, although the check is
different. do_translation_fault() checks for TASK_SIZE.

        if (addr < TASK_SIZE)
                return do_page_fault(addr, fsr, regs);

but it appears that there are paths to do_page_fault() that do not
have this check, ie that do_DataAbort() function does

        if (!inf->fn(addr, fsr & ~FSR_LNX_PF, regs))
                return;


and It's not immediately obvious, but that can call do_page_fault()
too though the fsr_info[] and ifsr_info[] arrays in
arch/arm/mm/fsr-2level.c.

The arm64 case looks like it might have similar issues, but while I'm
more familiar with arm than I _used_ to be, I do not know the
low-level exception handling code at all, so I'm just adding Russell,
Catalin and Will to the participants.

Catalin, Will - the arm64 case uses

        if (is_ttbr0_addr(addr))
                return do_page_fault(far, esr, regs);

instead, but like the 32-bit code that is only triggered for
do_translation_fault().  That may all be ok, because the other cases
seem to be "there is a TLB entry, but we lack privileges", so maybe
will never trigger for a kernel access to a kernel area because they
either do not exist, or we have permissions?

Anyway, possibly a few of those 'do_page_fault' entries should be
'do_translation_fault'? It certainly seems that way at least on 32-bit
arm.

Over to more competent people. Russell?

              Linus

