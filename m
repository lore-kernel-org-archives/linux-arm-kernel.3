Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036D210706ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=; b=nUtEId31GBlXPNKrlIhFnzgDF7
	YwvbVCZNZj2a2c99b7z1DQTQuPg8XQKGfYYt3hzAqQqKgMa8J9xT0YXx3yFwNXQwm0JMS9RIiy6ka
	8nfrjiGW1DT+N4epNGsy1VhPzIYm2ERBBRz22yWgYZzzsmsNZ9r3inzQv5ie11y3w6vgMVsjD8roJ
	tweKO3OUdHtD1/fxBcDz489/CgN3BPPvveUFZiyx3WzyiPK4f33EptHrIQcQMpWSR8BU9JMJ3ar/E
	54c0ICojytLXPHI10tIEEuDCS0MmItbb8pslHwHW+i2T6tClQx9mz6/dexmsVrNW80vP+RyKyVjMg
	5sIcY3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tLi-00000008sTm-1YZF;
	Wed, 18 Mar 2026 16:02:24 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tLf-00000008sSu-2a6E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:02:20 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-509069a7a7fso645131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849738; cv=none;
        d=google.com; s=arc-20240605;
        b=aTLODGXvbW5v0FbFv01a+B2OQPjynIZdkyTeLf6JjKhwNCWMQS1j2RYnq6nQ3LJ0n/
         dqMN3XrCNq1RHEk565wYvqHATaEa5cj04/s2t1EhHU5ru6qmgJoBX/bp5uDLEEV7ZZDz
         TbMlrKn6F7OI7ZsQ42eP2kU839CaZkRGB76DbPWFDiaWszimPgcVvrlvlojA4U5L5s2L
         BQvflz3j+Wcd8aKx+FI6aQSJ6vrIWRqQ5zrroz4LXp4uFsgJK3wxwuWhTNbtIjmPs+dQ
         BbYJ/alBXjfIFT2OKT0M5hKiEnLfafmr+FLnPbxoMMi2iqzA0O3NHsIVGpJyKSpcJawy
         JXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        fh=pluU3m9v88OVfSHE1geGpvLYdgiWgT/4P/HNii13a+c=;
        b=Gh39xd6m9A+8CXl+11iBIbfGaBgdfmz8j/LTR9MqOQE1TubF5oBtrd1CUjw7v/QNZu
         Mlq4pMVsDMoY0dzj3nP8twXcVggJDnExh6RiLTDXMuFOkpMB3q2V6JbHRX2rb5Pz9K0m
         gFU+nL3Q4FtF7pv9HEJZ/ylTUH0rfAj/NHvihB12zPoxBQexh19ycCUZoTZHDYAi9adZ
         q6ryhilk2lPl/rqEdSPhxcvX064Xl+I4THv4wTIdcty7FJrWYHHen4zTfSzFTSB75ybY
         kS39qfIE1SVS9t7pjatKPTclPkPswjoz3kZw5RaluoBqaLY4GjZUNwfVI3Fhef31odft
         7Q7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773849738; x=1774454538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=PHaZwHbz52RjFajr4pmKQ1kqoN/1pDQMuq/RFtT9dsotyb6gsWDdb7hBaebvomfWNo
         6Mp3tLQ7XgX5s+7C22Xlu2OTC4fXetbuRyApIatiOvSFWymBKpeXYsOO2+u9yyKhHgmv
         k+fX2pV/lvE1ljt/pwZI96nVQ4nrosdI7U1vUjFCXjFrPw48IuyW59UCJloIsRCZfTC+
         FcD/f1h9M0GjPpLm8Hd/YYFq4GLw9O+hgPFc4k7AuFvqTfFLAmTL5St0bsCoSWvfpgeF
         nNlbxLcXRzh/P2mQI+YhykmDkhNi0sIh+kn84pGi8EzN+dcWsL2jGrqjfWD2fT1Ba2Qm
         KGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849738; x=1774454538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBf0X4ZI8hrueKElVjOm/fdCiPNUuzJRpv2jzIUCVLI=;
        b=meEvyu/sYbejD/nqyIlcBs2akUWncTTcO6SUeqqLNH4zL2RGnV46pw0SA/2udf2lIT
         qkLsL+8aBb5kl8C5neT21oYnflFBBaMnUAL3ZKrJ3NU08RNrWbowDViefm+OjJG4recN
         yanfs0eX62CHMZi0Y4qUdQeVO0UIAnhvO1lAw/MmTBNekoURWyY1adC9g/+1iFWOR1hB
         cuLduNi9wwWMwX2cTljn30jJuNR34devaIX8PbZwZXUNjB814S1g+h0jeJTH8FKQIoSh
         2onzsGCotkbCg77WWZ/6K/7KOHY2UEXwHeOud69OaRJ8zN2wUIiOIJIdre2yF6rkqp3L
         Ya+w==
X-Forwarded-Encrypted: i=1; AJvYcCUbmdHCUm+99nRnFfZWLjMPIcWONxhXGIkiCmu3Wo3a1JVqsD4g8cD+DBycWfL3oXtzSsoFihIHHP/dqnCNmTpR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4VBiAKn3g5SAzxw/q+LmZyq9oSqi6CU4sDJo74Rt1jZ3tNYmN
	MD47DzXmIsVF8kPRfWXD6z6Q+r9GTEHFukBGwP9occZBU+nl/XvId4H2hA9AFelDu3ox0Zr1Sye
	D7TPtOTpZYOtIDVCHXQGTl3PH482r2Ioh91g0ooVR
X-Gm-Gg: ATEYQzyfkjygBBj1S04nSkBflFESTiasyo6ctq8QXsZs1DMbSKSZhtuXaR3JF85o2XH
	WCJcV8QnqT/VZnLtAF/E+T+vtwc6EnUStkxAqZzLKd9yXmCPqmPilfD1Ifbqd8JldhwYPTx6FWk
	eUKf+hkLbqb599phKg18UxxebnVBMdj6GDoYLYMvqZ3ySNiNure4O9IWlfxOwjFf/wo3UkqMfeV
	AoIhrtWVGSc2J1FTowf76Eyt7Oj9nvtultYLZ6PcLDMcwxV0qHJ7MHVTWzfBPuKFsj2cbsadMIg
	iGve+rgQn8vn97ra6ooalPjYf1s2ICZgbWoxTnvADApcraBx
X-Received: by 2002:ac8:5d4e:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-50b1462cacfmr16816931cf.0.1773849737454; Wed, 18 Mar 2026
 09:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
In-Reply-To: <4e152e7b8e1a93baf0777628eef9409d031cf8f6.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Mar 2026 09:02:04 -0700
X-Gm-Features: AaiRm52kf0p9Fxu6EolM9nhc_2BIDOLEzyHhrKwtGPKlzkXo42y6XvhNDeOCJ6g
Message-ID: <CAJuCfpFd-d-E24d5-G6=dSYDpyHkwS=aXzGd6+SzyMkgssyPAw@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] mm: on remap assert that input range within the
 proposed VMA
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_090219_664424_25267834 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> Now we have range_in_vma_desc(), update remap_pfn_range_prepare() to chec=
k
> whether the input range in contained within the specified VMA, so we can

s/in contained/is contained

> fail at prepare time if an invalid range is specified.
>
> This covers the I/O remap mmap actions also which ultimately call into th=
is
> function, and other mmap action types either already span the full VMA or
> check this already.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/memory.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 849d5d9eeb83..de0dd17759e2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3142,6 +3142,9 @@ int remap_pfn_range_prepare(struct vm_area_desc *de=
sc)
>         const bool is_cow =3D vma_desc_is_cow_mapping(desc);
>         int err;
>
> +       if (!range_in_vma_desc(desc, start, end))
> +               return -EFAULT;
> +
>         err =3D get_remap_pgoff(is_cow, start, end, desc->start, desc->en=
d, pfn,
>                               &desc->pgoff);
>         if (err)
> --
> 2.53.0
>

