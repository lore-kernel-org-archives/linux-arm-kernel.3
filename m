Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8325CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 23:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG18q78ZVkG4W76knSsJW1ICQmeXz/fQ1c5jpSC+ai8=; b=nGJTn1nzr0ebJM35rVovJhHt+F
	dLlMTFGkgIvAQ9lCdL5WpY+pSgFWyn7OWZejefV6YpH2zRDcVmSnnOUSFHotctHF/tUjX+APdGYkI
	tCeg9PS6RFmP5RJ15txCcu+98IXeCUM/hJE44OD8Owmz5SttWq6iOYhtOqJvhgLW0OJDUjAAje2LD
	didU7QR8SSbnCAjbae/ywNkvq1HB4Y0xSa/+sXHhu93zVtItTPqcfPtRFvNdJp1HR8ZeAbcVpUfW7
	hzeK4MieJnGfXCEINR6Y1NyGBm3be2+ExtlHTNEYeKIF2Mu+O7MwZK9GyEvaAMsWYmXL4Bmd5X+3x
	/1yBjFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgd5-0000000A86h-1Cnu;
	Mon, 25 Aug 2025 23:29:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqgaL-0000000A7zZ-1eij
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 23:26:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3c7aa4ce823so1513679f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 16:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756164403; x=1756769203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG18q78ZVkG4W76knSsJW1ICQmeXz/fQ1c5jpSC+ai8=;
        b=fM6HqdWSeKP9wv8Xo0jH35FNHhWG81sqqMqxk+uyrUcb3VZ18bHLsXd+JDA0TemaaY
         l0PZRminto+mDDRSBUSXUdsHFl2IZ4CXAfi+/GiJBqDVXovfhJUQNpKmPEBYSnANX7fL
         eehpWQyjqg7bpVT261Z9guy+uI7RxujIo6dvTxAjJXIBI8PmPn0iAMSHYMQAgEQghF5n
         Ar7BD2LSCxCxUrqOryUEq5PFRwyOEEUqrT1SaiVKeqxrD453Ethh5eMk1Ln/On3oTdtr
         8Um+Ne6EEOSdZ4K7v2NjAxITluQwMZU8ROThl4ptZRK5fyTdZ2uHaaradJMPy2ftNYK0
         ud0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756164403; x=1756769203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JG18q78ZVkG4W76knSsJW1ICQmeXz/fQ1c5jpSC+ai8=;
        b=Hb881wAXTa7/rErZO2gO3w5j9g/wdWAs9R8cVS3ORMX3W1pGLWo0k/tecu0syMBHKF
         NUFOnm+niPP3euQGvT0ygCfG/vOTB7bffLrJjf+TGj8NP+3E9meukT1lqMq4Navk/i8B
         OodXggJ0wTehgGx7GfLZw+c3rGo/YzxLt6BUIuZ9MlltXaerxwwzXnyl3tW/2FtIi7tN
         NSAKvH9/f9Qyrq14DWHJ/jvZziQT67UjJ9zprieNod31IQuhzXKC0esPOcAiwUmzv4Bk
         AkNxngt2l3zTstbrC78uaoyiadSmbapFbCFyQXYizJn79ZbKBDbX1nwslec7J0/4aaXD
         AQrA==
X-Forwarded-Encrypted: i=1; AJvYcCXieWVaDrNP6cB3aiY1JubMHQwzRC3uM1cFihiOrMZctA0cocDKN0B0rSRLzg7ne6cyiAwUhQ4V+Kzh3hUaTeJ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4i/6+A38iTNPPVkcPDECveLdIAvOTKbBA/JHJ5rFQakI4SbJK
	eL/Mgh2Zxu6soCqGSiOPA9DRwwgy+jMhcLt2taAtMj+fVPsSi4pXt7BemBdnxRhvw/ICJqMIEMy
	YV8szt3uwOfhZalwdP4cOMiesHkjY0vQ=
X-Gm-Gg: ASbGncuCfgN9bgmTGQvcO/jmWSjPB/rt9DLqjOkDxf0RtcLWqDTsgoM+g+YWWoWYoGQ
	ML9dfMvq6imImtd+e4orfVaizOhXzjN+QAIhymWX7kZ1piiLVxbNOko5jM4URcPH+itk8wEoXtg
	Du7yKXisrUWj4goxdCKmiogTZkd4FRhOB2MZT6bpuaHsQ1mdFHUKS3rwR/uvZ11vDxAXhG6dYo/
	jZLGTYHhW1Q/BeeTJdGoCwJEJyNcMzeyc+BY6lC4uPXr7vTfKA1uWVhqm8IVCayI5H0wyqIRq7g
	EHknCM4=
X-Google-Smtp-Source: AGHT+IH1DfEr+Lu3NtBpYyp3/OYkyFwA5ty+ZQKhZUgugEu1nKOFeJs8vUUL857y82BshZV21sS4nTMdByEDq1urCgs=
X-Received: by 2002:a05:6000:4383:b0:3b7:882c:790 with SMTP id
 ffacd0b85a97d-3c5dc73625cmr10812283f8f.37.1756164403017; Mon, 25 Aug 2025
 16:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041526.467434-1-CFSworks@gmail.com> <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
 <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com>
 <CAMj1kXF00Y0=67apXVbOC+rpbEEvyEovFYf4r_edr6mXjrj0+A@mail.gmail.com>
 <CAH5Ym4h+2w6aayzsVu__3qu3-6ETq1HK7u18yGzOrRqZ--2H9w@mail.gmail.com>
 <874itx14l5.wl-maz@kernel.org> <CAH5Ym4iqvQuO6JxO-jypTp05Ug_2vDokCDoBgGB+cOzgmTQpkQ@mail.gmail.com>
 <871poz2299.wl-maz@kernel.org>
In-Reply-To: <871poz2299.wl-maz@kernel.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Mon, 25 Aug 2025 16:26:31 -0700
X-Gm-Features: Ac12FXymuHj_F3D9l2e_hmE46sF5hQJvepyvPpmnqbK0RbrKURVSn9TFQXq54tw
Message-ID: <CAH5Ym4hgOCMggPTmdmmEObupzbHm+w6=J_7u+skOxRHE3Z9VnQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
To: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Baruch Siach <baruch@tkos.co.il>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_162645_436538_E2C7F302 
X-CRM114-Status: GOOD (  25.20  )
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

On Mon, Aug 25, 2025 at 2:12=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
> > So: where do the terms P4D, PUD, and PMD fit in here? And which one's
> > our missing fencepost?
> > PGD ----> ??? ----> ??? ----> ??? ----> ??? ----> PTE (|| low VA bits
> > =3D final PA)
>
> I'm struggling to see what you consider a problem, really. For me, the
> original mistake is that you seem to have started off the LSBs of the
> VA, instead of the MSBs.

Right; I did my example MMU walk in reverse to start with the levels
that are never folded and work my way up to the PGD level, since I was
trying to deduce PTRS_PER_PGD, essentially.

As for the ultimate source of my confusion, it's best explained in
this paragraph from the paging documentation [0] (emphasis my own):

The entry part of the name is a bit confusing because while in Linux 1.0
this did refer to a single page table entry in the single top level page ta=
ble,
it was retrofitted to be an array of mapping elements when two-level page
tables were first introduced, ***so the pte is the lowermost page table, no=
t
a page table entry.***

As I see it, this creates a habit of using the names for the table
entries and the tables themselves interchangeably. Kernel folk who
don't work on the MM subsystem much (like myself) don't share this
habit. So when I say something like "an 'array of PGDs' is nonsense,"
I mean "an 'array of top-level page tables' is an oxymoron: if there's
an array of them, they aren't top-level." But someone more seasoned
like you thinks I'm saying "array of PGD entries" and asks "What's the
problem? That's, tautologically, what the PGD is..."

It's absolutely on me for not thinking to RTFM earlier. Thank you for
your patience. In my defense, I don't think there's any way I could
have known that "PTE" was a misnomer. The RISC-V team added a few
helpful comments in their pgtable*.h that probably helps people
encountering these MM terms for the first time through those files.
I'm considering sending a patch to clarify the comments on the ARM64
#defines similarly.

I've included a glossary of terms [1] in case this confusion comes up
again with somebody else.

> I find it much easier to reason about a start level (anywhere from -1
> to 2, depending on the page size and the number of VA bits), and the
> walk to always finish at level 3. The x86 naming is just compatibility
> cruft that I tend to ignore.

Indeed, I think this is probably what most seasoned ARM people do.
People who are first mentally visualizing the tree -- and specifically
Linux's intent with the tree -- will probably still be relying on the
PxD terms to bootstrap their understanding, however.

Thank you once again for your patience,
Sam

[0]: https://docs.kernel.org/mm/page_tables.html
[1]:
"PTE"
A newcomer probably thinks: "Page Table Entry, the final descriptor at
the end of an MMU walk."
Actual meaning: Bottom-most translation table *OR* an entry of that
table. It was once an initialism, but it's taken on a meaning of its
own.

"PGD"
A newcomer probably thinks: "Page Global Directory, or the pointer
thereto -- the thing you find in TTBRn_ELx"
Actual meaning: Page Global Directory or the pointer thereto *OR* Page
Global Descriptor: an entry of the Page Global Directory, which
encodes a pointer to the P4DIR if 5-level translation is enabled, or a
lower PxDIR if not.

#define PTRS_PER_PTE
A newcomer probably thinks: "Number of frames pointed from a single
Page Table Entry (so... er... 1???)"
Actual meaning: Number of entries in the "PTE," the final translation table=
.

#define PGDIR_SIZE
A newcomer probably thinks: "Number of bytes of VM represented by one
PGDIR." (or even "Number of bytes the top-level page table occupies in
memory.")
Actual meaning: Number of bytes of VM represented by *one entry* of
the PGDIR. The 'DIR' is a misnomer here.

#define PGD_SIZE
Actual meaning: Number of bytes the top-level page table occupies in
memory. Defined separately from PAGE_SIZE because it may be smaller
(never larger).

