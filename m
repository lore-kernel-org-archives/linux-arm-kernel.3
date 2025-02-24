Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DEEC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+3hc2uspzUuGySeq35PHHzR5JH/rChsfvYHdlzz6CY=; b=REIGWlkcHq6uylZx+epb8+inB1
	qtqyB6enByK7LxybqSqhbEAt1+UQrL8iKuMOAa8z93AhNI0ikmTbb8OHIvue2DokX+jHbaZtHaqNz
	VnWrqbr30qHA2I9XW2l6TAwXSzSbEvD/OVHZKXmACo1nYYb322hWfKBHKA44W4+AHX+O8eIhSH3Ho
	L4lUabWEVC5ExW75NgTMjmVe6gV5rpC0ilxooQh+VRin5q12qxXkHixMmDpAZLC7lb8d73dyDQ68G
	oDmqGKRHtCE6XxIPPiGaQEAqdinCfQTYDuevIePmg5N0/yTy+d4ckdCsR56Arj1wuwg8hGf17Roel
	bxurPUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW43-0000000DDO7-09X9;
	Mon, 24 Feb 2025 10:51:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW1a-0000000DCIP-3foc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:49:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso5636250a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 02:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740394161; x=1740998961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+3hc2uspzUuGySeq35PHHzR5JH/rChsfvYHdlzz6CY=;
        b=t+r6VlbI/9a+edUEVKfoHRq4bYk+TlpZ5NuuxMSl/mpe4l3+Tz5EfgClV0M/c29hkH
         qIPBqF0hwsOlSy9gmh38xuUhdtbKnYykNL8NtqjIjmZp3r1y09y+HyhXDx8a1/IJpFaK
         QdDsE0BIU3maTW0/XJjt1UfjLCn9qmZzVSe98VIteqYvYyc+CVauUzrjAN2JJdfELmmi
         nAnEOIS+W8Lq04C9BBDNgPT3mCotqwXvKHS+MKRoybwQ0fTHL0eqf5DIrkxIHbCknWx+
         qrqf8mVEd4IYPP1PNo4/NrFqI60wE6x0TnoSx4hntK1YYSsx4yUg7CaKac6hRxOc7/cP
         Aqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394161; x=1740998961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+3hc2uspzUuGySeq35PHHzR5JH/rChsfvYHdlzz6CY=;
        b=MshEiGdj33cm6G8ByCKJUOuf3DgaUqkTmXTcK+HtNyJEVhHOQtCS4lvr2E7T0Uy3qH
         LLI9938Tnrh47jyAQpmbn7I7hpoEbxIxO9dIMPuln85MZ97bK0IK6T53hHJI5EDaknls
         OmFK8SIWxuGASkrsoKgAjVo9lvm77eoS8WbXfw0lXBJdPXwW+WfYeEvLYwBR4QBdM/o/
         GTxIBzJ9/Aem+DadMpL+gd6JOjIU4PidiQe5DfNHIRIwxKiud8osXrTgGVjHOQbBTZED
         jmLNYhBJNNLGVl7M+I44hKRHkxUq90Wp376I3k0o/hL5oEDDP0tlWzgOxWq8vO8dccIU
         8JLg==
X-Forwarded-Encrypted: i=1; AJvYcCXXSZNB6kwwaVIutq1ElCp32o03LwVYj+M6c1bWpdnqnHI/rhlTsI/S1hWcU0OcQy4YMt2psR0XPM+R7qc2hWyx@lists.infradead.org
X-Gm-Message-State: AOJu0YwQlWRvYYAA67cmmv0xZY+QsFxFPA0TRYsx9C93jf22QvIxWQKE
	fONsBH+TKoVoBlFxpZWZ6ACHL8nCZknxT1cfR38Q6HpoMsAxki2nCXYv2n2wk9+pcnM4G7Gwy5v
	dT1/Cuc61zxWdialzELKIlb/kd941NE/VtkfIHQ==
X-Gm-Gg: ASbGncv0negrRPODkEs6jBVQZhQDtSbYB6rZ0rhaekFanodFpxv0MeY9FxrIrXA8htR
	Te1k/tzjWBFc7OWxH/9fC1XJCR62I99jeB+fdCplEHDMBmzqhPEqzoCvRTbj5kblyLPVwdbMldY
	4RtsnYP3s=
X-Google-Smtp-Source: AGHT+IHHpKWXIm/v2k+338UkHDIVLeb79WjMIsWoo/8r7lA3uc+V3rq9HglSj1eZuVQogWlVvckU5UsUcnUd6gUjF0M=
X-Received: by 2002:a05:6402:388c:b0:5e0:7cc4:ec57 with SMTP id
 4fb4d7f45d1cf-5e0b7266ba5mr26764777a12.31.1740394160578; Mon, 24 Feb 2025
 02:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-2-ryan.roberts@arm.com> <b6341aac-8d5e-435b-b900-5c9d321a7ce6@redhat.com>
In-Reply-To: <b6341aac-8d5e-435b-b900-5c9d321a7ce6@redhat.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Feb 2025 11:49:09 +0100
X-Gm-Features: AWEUYZlGjIT4eI7eKQbJ3SHrGN78CEaD_5h64M0X3Xtov-A0DdsnodalQc20rYI
Message-ID: <CAHVXubjy+VmvmV7FLuR8y=bWc4MqKgoWp4R8hqUs8xKBN-DQcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: hugetlb: Add huge page size param to huge_ptep_get_and_clear()
To: David Hildenbrand <david@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_024923_180784_601464DB 
X-CRM114-Status: GOOD (  17.02  )
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

Hi Ryan,

On Thu, Feb 20, 2025 at 10:46=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 17.02.25 15:04, Ryan Roberts wrote:
> > In order to fix a bug, arm64 needs to be told the size of the huge page
> > for which the huge_pte is being set in huge_ptep_get_and_clear().
>
> s/set/cleared/ ?
>
> > Provide for this by adding an `unsigned long sz` parameter to the
> > function. This follows the same pattern as huge_pte_clear() and
> > set_huge_pte_at().
> >
> > This commit makes the required interface modifications to the core mm a=
s
> > well as all arches that implement this function (arm64, loongarch, mips=
,
> > parisc, powerpc, riscv, s390, sparc). The actual arm64 bug will be fixe=
d
> > in a separate commit.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bi=
t")
> > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv

Thanks,

Alex

> > ---
>
> Acked-by: David Hildenbrand <david@redhat.com>
>
> --
> Cheers,
>
> David / dhildenb
>

