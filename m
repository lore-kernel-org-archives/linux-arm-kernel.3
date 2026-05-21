Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6AACD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enrh790BjgIIUBfQlfWGTFeBgm0WSl+DUA/ZN6Netao=; b=gLVEwNq7PwGzSo8hQlKpMqc+Ve
	o6vv2tk1/l86Jri5P4xXjchDD8iETWt/4/EL/f3NBu2qKlPBSALfXDUrqkQpv4HtD7Sb45XB3+wUL
	uPXvv0DKtOqlODMIS5lldu6Dnk9HdpQ/MjXGf8NFZlzaLrQzg2lVFk9o/9sQNHAfOmvFGyYV1iCr/
	aQeJwV+Bx+OvE0T4F/kP5B4KnVH+iBEWpH4uh1QhKrhhCGWPX4VxEuF6TmZOyChFfXKXTGpwrZBj3
	S0S4ZpDi96tHZISQRPVIc/c2RmDwDXg1He5YxtVfpPJpxgdRYbJK/cwMg3CaTk+gPIzfS/G4POBeG
	3G9NBJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvd-00000007LO0-2EcE;
	Thu, 21 May 2026 09:42:57 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvb-00000007LN1-13g7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:42:56 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-69b94acd958so3079700eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779356574; x=1779961374; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enrh790BjgIIUBfQlfWGTFeBgm0WSl+DUA/ZN6Netao=;
        b=dG7pHdjg2fkt8srDINF7lLGW1/GvqbG3saWUxrWXnUG7IzJ/RsW+CV9ps0FYaTD2Li
         q4VECgx3bb3QGUmBhS7/dPidaqA7Fprl0yKylSSz9ah1493gRe3NnW5SeLdEbSRBrIkb
         dUG8zwBw4r0FmnbNtkwXWUoGyH8d6P8DOK6mw5x+WirOC70kBUtVFtuA0kDM/NOqBRd7
         SnEsxpTmVS0OR6yIBjwe0Oop6IJ8IvRAKjG+TggsKKOHALHSi1Bjz+pRmi9k6adNyyIu
         M7uZh8TXUHMDjEPL1b10hEH0ByA68gjhoFSEzbQyWKyD+ysVY3hHhgHNlK0umRVkW1bj
         iQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356574; x=1779961374;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Enrh790BjgIIUBfQlfWGTFeBgm0WSl+DUA/ZN6Netao=;
        b=pK1mfvPfbGFRsQxspHr01IRO3utLNC9HMKvrug2jYpyDWlSPL7ODg28iby0LA8Vfzf
         l2hCFKIjMa8cVyfRaigNXPhUPWemURM0ANrzk+20sR2DkeGsIKkh+2lPWorm2TJ8+adI
         TLXLzIHfXqbk6BCr0yrsZEkjIbLoi5QmSmwZKOy1GGEsXryBveSJ4rvvc+rz00IlxER/
         5eRT9Pi2zoXMnhuPoop0BEgDaBIFv0Xl3J2EoA6eugTx6janNsUR8zbzI8noQbbCUFgu
         oJ8D8q+dPeFZfRFxudsKfymOG27iYPjxIgXXI5zDrBSPK8H0y8ZkL57kp/TsoDyJkwIg
         JjGw==
X-Forwarded-Encrypted: i=1; AFNElJ8vHX8hmDMuOUrBlAlMqOFB7N5BFwrUvYyuoD49/aQL9cuN0BPX6HXIb1dKhgDxWjxTIs8F3Nn3Qv6cwd/y9CrS@lists.infradead.org
X-Gm-Message-State: AOJu0YxueKv59YlBM1pBvaSEqHC3xeprH8KhqHv/hQAgtn/W75ZTKmvn
	43UuBfqYHlQM4BmRLwhHnUGHrouMJifomNxG9keO8/vbUkQt9faDe+Bm
X-Gm-Gg: Acq92OHJ1TlSiUWV2xDGj9mnoMB1XYFeqzZ1+F2e8lPlcgWsxybsW4CFZI9WBXMDhNr
	nKIy/+nkDWaKqRAIAjNXWLUc0OQB3P1KQarK1IT0pDSQAX6cSfMfqk0g2qxrb4RCQf60m70PP9N
	bzyWV+TGX034nugxeO2cQQCSkYCRvEAgdUSExK3K2R3Pn8zH/40ozTX+cPPCx7jOyBVEdSWmpPh
	Hn0dTdzqHujKUnf7AhqUhdxrqwHMiBqhT3rPqsUWIF4AdXGQGxEr4wGzXp+u1kkIu/h89pwX49O
	Af2WFTfPFwJj0CPckMOt8FiS1VyDv5mFoPTweIlYaZ5w9h4woxjF0IGa7/wFSzVNSN7RzZGrk0y
	mlNDAhtv2XY0baDht7rRweo8tAVWlO5qOjYNULNJsutXybCDqFltOHy7fEoQ44NUVGfoj9neR1X
	0k9q/+bcpksvJ3kx2QTM8iZTz++1UQmaYAP21GpRgZ0TnKqEVdkrd0BbDjKQRKYoDtRXF8x7mwY
	Np2GeeiJGyTubJjUQ==
X-Received: by 2002:a05:6820:290f:b0:694:6acf:a42d with SMTP id 006d021491bc7-69d6eefa916mr913981eaf.39.1779356574211;
        Thu, 21 May 2026 02:42:54 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:71::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d77385a8esm199938eaf.11.2026.05.21.02.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:42:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 02:42:50 -0700
Message-Id: <DIO99FYEHNC1.23KFEHRPTRB5N@gmail.com>
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tejun Heo" <tj@kernel.org>, "David Vernet" <void@manifault.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min" <changwoo@igalia.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-3-tj@kernel.org>
In-Reply-To: <20260520235052.4180316-3-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024255_299638_6B1BE91F 
X-CRM114-Status: GOOD (  11.15  )
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

On Wed May 20, 2026 at 4:50 PM PDT, Tejun Heo wrote:
>
> v2: Use ptep_get_and_clear() in apply_range_clear_cb(). (David)
>
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> ---
>  Documentation/bpf/kfuncs.rst |  14 +++
>  arch/arm64/mm/fault.c        |  10 +-
>  arch/x86/mm/fault.c          |  12 ++-
>  include/linux/bpf.h          |   1 +
>  include/linux/bpf_defs.h     |  11 +++
>  kernel/bpf/arena.c           | 177 +++++++++++++++++++++++++++--------
>  kernel/bpf/core.c            |   5 +
>  7 files changed, 183 insertions(+), 47 deletions(-)
>  create mode 100644 include/linux/bpf_defs.h

First 5 patches lgtm. Should we create a stable branch out of them
and pull into bpf-next and sched-ext trees?
I'm preparing a followup for slab-over-arena on top of these changes.

