Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=; b=Fc4QM/Vl5VGGx/9AfurXmclUss
	i8A96JOHuWTzdRp90RpYkCiQKE7jZwnaLNtNZaEmiPqK779dBQJ1yrsWuYrxJqErUTAj+JJjqBhaf
	TzBeRLON5mVH5tBViO4u5CZ2q0hUdiB0rkNfaqIgTcIXcWhy/kCKIG/MW0UjEyOgcE3A1ThNt/BCA
	Ds7jicqihhJg66hY5HfjcxbZvrKWMW5wLoBoyr8aT53spbkfGxAiGYacpKatNH+x+Vzdflqfy5F2r
	I8AMdDe8WDwpK824QbwpjeSw2nsoEwZKW+gL6YcXETaHkfVQW5e87eF/MmxfyLpQChIFxKtPlpupS
	ahDPHsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMjO-00000003Z9U-2d1E;
	Fri, 09 May 2025 12:21:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLbk-00000003OEr-3IhL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:09:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ace333d5f7bso339578866b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746788975; x=1747393775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
        b=j1mwVy+t98SkdNX13GUOjfRssDXUo5/3x9VBPB2hpyQOkcUx6ooI1JEdhH9HDrul7k
         E2jd4jmXh6jeLmYXAEvMVWwnz1NTU8bAO3KTPutZxHP+M85BcO1KtZw1rFGPRlL0bN7/
         N3/50XSazmcmQ2s23iriw0xHo3KX4AVIDINdbLJRwOcuPy40c/4sTwXz2t7PlBvikPGL
         tPugX7mnbjr4+DSywFzWYSRBUX3Dlx5PdAduV5L/D7jJGenYLTimyrhCcOPbxk37Yreq
         jUIQufFyrlZzCZsho5jZBGbVksW37Pl1wYoYmRzgwTHNMKEpMk38rD2qScMDm5/8mq3P
         WUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788975; x=1747393775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvCseEsNXn2YDR22ofVS1EjuRoUQXxujlI0mWYKfm9A=;
        b=VzBIxywa4WojeDhUEH0e9m9dP7kAkueJvoBHz97zN0XQDnlrhPNHRbXjOwgjKKkTKi
         Xv11NsQiFtaWsKiVnES/wOUqzpmZ/9kjVYpzg5PjU5x9wDAkg90Eo8CNB5mUUiQCiCCD
         INK2W7p19OeH/tMVEsGen5Mr/WeH7hrC3d61IN1ECwBDmY9OBBrX+/TrPqr1XKqOyQB/
         jYYz+m2Qg28omRXOQAey/czcbg95ybFxb6Xl5iJNeQNsV0EXJ3I+Dg4SWPJLJ0YhQiIi
         8wOFF96rhGi/NORD4BFpUZFbmYvIU3Fe+73giz/cst681tWUZObY/lBKarXvQ+NdIg2B
         MNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNm72h0PEoVq9fXA7XWzDOc9xGt4u9/Viqpv1oHM2xvA6LUzFL0rEDTGySkDfA7r1WtwNRX1f4nnMU66xeIh40@lists.infradead.org
X-Gm-Message-State: AOJu0YwuSU0ZTO0UCHjhFLu9deU8Ozq7AsBICPT1GMJ+YmcxjkuocHfd
	GeXXPpcplmMklouNCsyby9dUR3/bzSTTZxlLb3esUQuQt8i/LV4n8Uq1JA0nkIsRdpmzzOzAdUM
	9wGgjl5K5hB4MTv0wMebQPEX8waEQpbl1lx7lyA==
X-Gm-Gg: ASbGncta2zV8dG/a7aFHKdVe2J8s1DYOPrsIQ4izd0jMKplKtb96xSwUwuVPwb7mx96
	5v9LPRKH4G7fHwPOHRKiO2CWzzSbDwCjzgRwuXAtGIl02KEHOSJlkwzXgkjfqJ0nDoJJZsSgL1j
	Gflrat63q2R6PETpRqzk6l0TVUnKrmPhLddK5tU0RgZ2Ck+aw0md0ozw==
X-Google-Smtp-Source: AGHT+IHolmFqWEGC4AyYal+IeZ3IwV5YHOWUsjQ6qySOfZum5CD2COEsMayA91FRo6y4k+ibRc9NvWuirdTrS8RhJ24=
X-Received: by 2002:a17:907:724f:b0:acb:5343:e75 with SMTP id
 a640c23a62f3a-ad2190afc7amr206746066b.34.1746788973864; Fri, 09 May 2025
 04:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr> <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr> <20250508123046.GA3706@willie-the-truck>
In-Reply-To: <20250508123046.GA3706@willie-the-truck>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 9 May 2025 13:09:22 +0200
X-Gm-Features: AX0GCFtetDfDezkP8vUdVhHiVYD6YKsFtOYLD7hY4r0bKx1J-4Tcdfpu2fXv07A
Message-ID: <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
To: Will Deacon <will@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Ryan Roberts <ryan.roberts@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Matthew Wilcox <willy@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040937_071793_FDEAA155 
X-CRM114-Status: GOOD (  37.94  )
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

Hi Will,

On Thu, May 8, 2025 at 2:30=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> Hi folks,
>
> On Mon, May 05, 2025 at 06:08:50PM +0200, Alexandre Ghiti wrote:
> > On 29/04/2025 16:09, Ryan Roberts wrote:
> > > On 07/04/2025 13:04, Alexandre Ghiti wrote:
> > > > Can someone from arm64 review this? I think it's preferable to shar=
e the same
> > > > implementation between riscv and arm64.
> > > I've been thinking about this for a while and had some conversations =
internally.
> > > This patchset has both pros and cons.
> > >
> > > In the pros column, it increases code reuse in an area that has had q=
uite of few
> > > bugs popping up lately; so this would bring more eyes and hopefully h=
igher
> > > quality in the long run.
> > >
> > > But in the cons column, we have seen HW errata in similar areas in th=
e past and
> > > I'm nervous that by hoisting this code to mm, we make it harder to wo=
rkaround
> > > any future errata. Additionally I can imagine that this change could =
make it
> > > harder to support future Arm architecture enhancements.
> > >
> > > I appreciate the cons are not strong *technical* arguments but nevert=
heless they
> > > are winning out in this case; My opinion is that we should keep the a=
rm64
> > > implementations of huge_pte_ (and contpte_ too - I know you have a se=
parate
> > > series for this) private to arm64.
> > >
> > > Sorry about that.
> > >
> > > > The end goal is the support of mTHP using svnapot on riscv, which w=
e want soon,
> > > > so if that patchset does not gain any traction, I'll just copy/past=
e the arm64
> > > > implementation into riscv.
> > > This copy/paste approach would be my preference.
> >
> >
> > I have to admit that I disagree with this approach, the riscv and arm64
> > implementations are *exactly* the same so it sounds weird to duplicate =
code,
> > the pros you mention outweigh the cons.
> >
> > Unless I'm missing something about the erratas? To me, that's easily fi=
xed
> > by providing arch specific overrides no? Can you describe what sort of
> > erratas would not fit then?
>
> If we start with the common implementation you have here, nothing
> prevents us from forking the code in future if the architectures diverge
> so I'd be inclined to merge this series and see how we get on. However,
> one thing I *do* think we need to ensure is that the relevant folks from
> both arm64 (i.e. Ryan) and riscv (i.e. Alexandre) are cc'd on changes to
> the common code. Otherwise, it's going to be a step backwards in terms
> of maintainability.
>
> Could we add something to MAINTAINERS so that the new file picks you both
> up as reviewers?

I'm adding Lorenzo as he is cleaning the mm MAINTAINERS entries.

@Lorenzo: should we add a new section "CONTPTE" for this? FYI, hugetlb
is the first patchset, I have another patchset to merge THP contpte
support [1] as well so the "HUGETLB" section does not seem to be a
good fit.

[1] https://lore.kernel.org/linux-riscv/20240508191931.46060-1-alexghiti@ri=
vosinc.com/

Thanks,

Alex

>
> Will

