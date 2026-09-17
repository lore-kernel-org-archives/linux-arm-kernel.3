Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A2DC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=; b=H47YI/Yjr4Ufp2fR08zCi3n65d
	hyAYBxTrTi61eh4he5ghRZguWMJDLD7wDcPWuM4WD/tNew6d14VIkLzmRLOv0hm+lNZa3l28rpkD3
	fBwUR/2Jjiz/M484l2/y9BTNrlLGI9UvtRPemIFodL2uykGAtoxMm2ly9wm+bzAVzQ23jH7sNh2kV
	m4V3QAKeaiCej8pDo2K07eIUEfzAxuoHFDrOu1ZgxOrG9mK5sr4yIUeEm7ZyiOGCJudFR0+7P+bFa
	ASyuLXrTiMydbdlISDQM+qOszlXoMHUTH3SJ6F9GzjdJmbkXTI6FOmrkbuA5bXsMSNyaEEv0PSjI7
	KpHk3xCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D8n-0000000BXmW-2CSP;
	Thu, 17 Sep 2026 14:31:09 +0000
Received: from mail-wr2-x19.google.com ([2a00:1450:4864:30::19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D8j-0000000BXlM-3ZsU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:31:07 +0000
Received: by mail-wr2-x19.google.com with SMTP id ffacd0b85a97d-4843378fb37so487181f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 07:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655464; cv=none;
        d=google.com; s=arc-20260327;
        b=mDfjL2ETElgkztJrBLW4LWqXWbUn5NqdTW4QgXJJK/dp5OHWOkqGQtPcnREnJ87udo
         aTiwefo+vqYaq/Rtg47YiWEpZOh+o+pNhUyUivAemSQfjy6WWRquBwBGcpk/El0T6mm7
         EKmP02J7U71dewDR+rZ8AeO+g6ZkmYZObv9Mzqlf9fYC0zJjH1sxxDzZ+jwk3zY9iaU5
         grZ74TrCETn9fh/G+cIZ8NNEdWKY1GjM0BXuvEgXj0JY9f7Ff5veFMm9Jx0WQH3kwRPG
         FvbpiXPHPVhfpx5vQOZhbRLLzM0FaM0vdwnk97ugaMNAcDij4eYL0zGfdDQyB3AosAIc
         mYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=;
        fh=8FPYu2RYuSqcJGPt+wIR/IHkdwhPZ6ovs8ikKNx7FxA=;
        b=swjFADFyKbmytHMEOU1JgCt7Hb+tWQEoLF6/ygTZpd/BuIlgRCjayzJ+x5xODDGacj
         MWKOkGxkAJe8EiyHiCgJZJ7BVAPF8Q34pC54kRe+jsGfdUiW0kap/9SiAjG5HWifz0hh
         UiXHXZa5yaJ2jhNyGcp0ejdS/8xa8FikHZrZ57fLBOAg2mLTkWyBWRJkOrUH908HIu23
         o0rGjyRnuAL48SLBSdR2ueTnN2Wmm5xfe9kiBZGp1GRpfg32+HtTPsHBQdP6yPTb2fHO
         qBGC5mG9VBmOoB1afEmTpPb8t8HF0MIAja/Z65GoSYEtKI7gcJvwArZHZeM3Nr//m1lN
         cwrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789655464; x=1790260264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=;
        b=muQ94aq7RSgGn1Eu0+eXUr5OXbF4g1xWazwJ9V59hDmi9yAFE+rVh9YSNibbULDeUc
         v3ScB+fQ8qNhd2tIrjrqWiyO+HetxKoyPGkm4tZw5cVNNXX9quu70QpQiJsbAvFlioRo
         D3qj4PAp7eF4P25japhRjb+YsGKJeZMMr/lTEERZwHbcos42vtjrJxRmclOjgfJztUIA
         d0lv0aaR57w6LBO0eg7suSuyC9whBvqkDMKCnMS+OXa/xfraSCDoqHnV7eFa/c6lFOL7
         5v247VNJcp5qXrnO2rKkiMT8N+oUJ4RJBFzn/6YQ5vBmobU8DZvmzzDWcSS+FmGnZUKm
         SXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655464; x=1790260264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OL1rW9y9mHZ7kkv/coK63PMmFR1002GsoxxgXvkjsnU=;
        b=bHQdn2nK/KJwtISgeLURHN/RznF8BWrVOZAL0frV0I6QYt+cY1xeWV6kRUWg+wpeZT
         nbGy856fmsrguD39jzvITiXow0bkPwS6oMk0/e+cncXzIxNqVoC/PHdEnUAkMWix19If
         bM7Fumt7fJijZEfFqXfkvwpqi/itaYkIUr/h95IKWIMEsJkkmndVwTziqaAe3e58LnvA
         T66hGyIIh7mkyn8TZM/pyJIVYqh5Xb1P07b7MKOuFSyKeDJ7cmyBiZ85Zlamdz645o7Q
         cspmwX9jfRR2eVwDRbgjL65bBTPrCmCfFgKoK7PteIeDudRneOyHtnJvE6GevtBrnTzZ
         Z4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwayniBGNT3L3WZArqbYwtXIQ6VOG7oUWIIMMYO+HNArfo0Io7HQIj85o2T0rT2lTCDjAerx21fhK1QK866P1Zb@lists.infradead.org
X-Gm-Message-State: AFuF++kQPp2+40ZZpmAVCF76ZdC+TkKnka1NAqH5ZFuH64mbj1loUroX
	SDQgVVvb4NIrpwLS1OVDcRwAbRJP2X0dmX7l0W7G8te9Zab3DCJZxcqe9o+forABXPAuT0S9vyq
	JihJE5BWYWSq+WT3ExwKG3HBSqfCi8Ig=
X-Gm-Gg: AYBFou1Ht4mJ4ti080/rpP7rBqBqljGpBJ80riu3qnUvDiwDlhcKpENXrHSAw19frFm
	5K6amDeYNJn5NMnP8Z6DfnYkXlZapfhNfKr1treLx6lv4OOVIEsh9crGmTMkaekXvjMVJ2CLhG2
	TTQnW7MdEHna2FoU7eowioZp0jTvKKThNHC/Cq6REmD5hH9L/Wk08hOaKQr8G2CNFJl4oq7uI1j
	aANWFzVquaZOBWInQ5TkrCmDszc+ePV04TvOdM+gad0wn5ytNwwBXZO+LxMlvOasbzIZOQ+C06t
	7YUtw7VzfjOijOJmSQQTvLvpm1yPRWHUuB1H8V3S1pT/Sv+sKBKAkil1V8gaReDmqwo=
X-Received: by 2002:a05:6000:26d2:b0:487:cd:f1ad with SMTP id
 ffacd0b85a97d-4870d03f013mr9657861f8f.45.1789655463783; Thu, 17 Sep 2026
 07:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <493ef264-eab3-4be3-a80e-357f01ae1b37@kernel.org> <c92a1202-1fa6-4cd8-9d82-b46a1b5d8f56@kernel.org>
In-Reply-To: <c92a1202-1fa6-4cd8-9d82-b46a1b5d8f56@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 17 Sep 2026 22:30:54 +0800
X-Gm-Features: AcwNN1VjxeYLM2KzGJsJYtKrFkqVeJG4mjk-7CUC4wBfKBcPA0GlNQxygqiRut8
Message-ID: <CAHKocdGWem4xW=vZ03maqtHaRLReYmAWkh0rAj63AW7e1+MjPw@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_073105_904781_F64EFABA 
X-CRM114-Status: GOOD (  15.81  )
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

On Thu, 17 Sept 2026 at 21:56, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 14:17, Christophe Leroy (CS GROUP) a =C3=A9crit :
> > Hi,
> >

Hi Christophe,

Thanks for reviewing,

> > Le 17/09/2026 =C3=A0 07:29, Wen Jiang a =C3=A9crit :
> >> From: Wen Jiang <jiangwen6@xiaomi.com>
> >>
> >> This patchset accelerates ioremap, vmalloc, and vmap when the memory i=
s
> >> physically fully or partially contiguous. Two techniques are used:
> >>
> >> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
> >>     segments
> >> 2. Use batched mappings wherever possible in both vmalloc and ARM64
> >>     layers
> >>
> >> Besides accelerating the mapping path, this also enables large
> >> mappings (PMD and cont-PTE) for vmap, which are currently not
> >> supported.
> >
> > This series doesn't apply. I tried to apply it on top of v7.2, v7.3-rc3
> > and next-20260916
> >
> > Can you tell how to apply it ?
>
>
> Finaly I was able to apply it on top of v7.1
>

Yes. This series was based on v7.1. I'll rebase it onto the mainline
in the next version.
> Christophe

