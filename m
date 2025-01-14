Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F46E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 06:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=813evcyTv8dumTUalEYwn1B2vgVA+BpviWK4C0TXDy4=; b=eRopJ9x2EXoYn0dOYExS6w8xh4
	zwxnAzsg8DFz4108njj0iVY4GdPCUokEqyS/Bz6HpPvXR0HAA3Vi1xbQs50hatBTygEQtDoOGFAUC
	1MV3CIuxUTTmP972i2Mx13GknPDSYR5KmrCww9u5WPznsUULWIaWdsBVE60xGbJyYYbTJmH4PDZeM
	/6ArsPeTfkrXT5GTeCfPuPcUgKC2RDwjc8W9P3P7vUrSZXY8WDUB3+s3gJvliuoNVeAtL8Hir2kgH
	4SBIwtG5tyW8Gv4DbgK0yP4rYvlVxchD1NEALopWFkWO2ZjVSFncVux9PyjKxG2ZdvWBDvDr1Wdti
	iUOMRk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXa5Y-00000007ZY0-39sl;
	Tue, 14 Jan 2025 06:07:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXa4I-00000007ZSH-42ak;
	Tue, 14 Jan 2025 06:06:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so1135194a12.1;
        Mon, 13 Jan 2025 22:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736834784; x=1737439584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=813evcyTv8dumTUalEYwn1B2vgVA+BpviWK4C0TXDy4=;
        b=ckHtG19SGDgK2G4B10r357XE2YqiJ4Pm/fyTu0c4kzPmIEgIt3xmzhQFrg/Q1Qm11r
         OTk2w4wqQYFAnJhroQ8vOdl7Jppkf9OArytQViaNOqrsLz1FPI2YMg8Rm0cf3RSkfurF
         bXzqvXnf67D651Lyw22EBRhYurZ2dlU1fwUY/ehULqZE2PS6g//0IxRmamJotITmpx8q
         r4oJb3+Ujcp1mT5EZfT4a3l5xMkAI59J7+5eGt2A9DuFldn4wQ2lM4v0U+694z3NsLV9
         5ffNEiCHpDeMNmRqQpuD/K4oi4yISUgHVoiBnxnMHPkE9tnY557/6OeaDAm3m8mYfvZD
         H1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736834784; x=1737439584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=813evcyTv8dumTUalEYwn1B2vgVA+BpviWK4C0TXDy4=;
        b=H2nTd0Y3vV2XWfOsHBI4clYykP8FpdiJrCj+hZukeJx2ryiFqbEHv8/mREkeO7VWiy
         4k39QjrQkg7lDBJbz37v2sLo4VXgu3jAUq1BTVr62HMS7FmFzsBQADA8gX70jWjM2s1A
         Hx+gTbZMasloyqPGYHkYdtCgoIkiIbUWqskoqKZG5S6DhBt9/UanszGBYdM9GL6h4NKh
         DxMsc5Rnk4fqzFmQrA/j3iKS0f3p+8Q1P29qkRiNmruSCSr1wNZ8e+RomiewpL9EHNy4
         0Zram0zwvQG8KMdjDCr0YE3OLJ+TCfYGRbMI8DrYyKIU84pbhubCkhVHlu4/2oPYW/mU
         bVUA==
X-Forwarded-Encrypted: i=1; AJvYcCUE4ZHl2cXzfT+KtNrB+IvDTzQeatigG7z73pciUTU2FkVnoE+lL3XGJ7UN0Xdz8/sbGQXwO1eesakBbSU=@lists.infradead.org, AJvYcCVsJrIm5kWy5tKkyKLjbQDdU3yS1XyVIq5jsbm4ci/nRuVKARFh7rLesHfZ5sIIhW3i2sLBPxn8hOiKJg5E6qDx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/67WJN56dq5Pgyj3UegGjn85cCK8mbOAZgNVU+1R+jirfld+E
	F/ofcz9ayhj5z+ImMsVMmM2IRNPtzfKLVuz7QnuiD2KuucKAby9d+k5sycVC8+Y0eiwV+ZL+QmL
	9YYHYWZYP8ptnPzfPt5tHO3/OFK0=
X-Gm-Gg: ASbGncu0CybaOXS8iTO/SV+LP9HsJKHKh8KmN+gysb78TLH2DKg98cszZIJhmTv6nOO
	QjJ0mr9r4L50ZZ6C456UneW/vDO9KBrikYnVw66Dg
X-Google-Smtp-Source: AGHT+IGkZGoUQKrZFs+YqDR5CNO8Djvct/1D+JUD7ex6JEhA7MIRrWBGaDCX2KJEAguOUrZdlbMw/i8LQv8/JctIJLk=
X-Received: by 2002:a05:6402:3903:b0:5d0:e7a0:154a with SMTP id
 4fb4d7f45d1cf-5d9861d6778mr17916783a12.8.1736834784411; Mon, 13 Jan 2025
 22:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20250113033901.68951-1-21cnbao@gmail.com> <20250113033901.68951-2-21cnbao@gmail.com>
 <21fa516b-8828-40c5-b5cb-d97cdf01f0f2@linux.alibaba.com>
In-Reply-To: <21fa516b-8828-40c5-b5cb-d97cdf01f0f2@linux.alibaba.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 14 Jan 2025 14:05:47 +0800
X-Gm-Features: AbW1kvaObrzFbF6tRqgXeGqHXmlNgXzvexniwwc3YO2ckaHIxS1F0kSUyHHydB8
Message-ID: <CAK1f24=8YMR3ZN+45CPo55x9j8yho-j=CHj+rBzAVR1nKLnOfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	chrisl@kernel.org, david@redhat.com, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	linux-riscv@lists.infradead.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	lorenzo.stoakes@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_220627_006932_87D01C69 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, Jan 14, 2025 at 10:56=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/1/13 11:38, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > The refcount may be temporarily or long-term increased, but this does
> > not change the fundamental nature of the folio already being lazy-
> > freed. Therefore, we only reset 'swapbacked' when we are certain the
> > folio is dirty and not droppable.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>
> LGTM. Feel free to add:
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM!
Reviewed-by: Lance Yang <ioworker0@gmail.com>

Thanks,
Lance

