Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB8ED216A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcYtubvKcGoSq4YWnqE43T9j+Qij7FD/s8vUU4QGez4=; b=patVtP9ObvyRKFt9w4hXC8Hbga
	YtjpS28Klj3X6qo9Z7QksgKq7LiprPcY3e+nrqRPUJNYVw7jXYHJoXj9+pUVlF2tGLeYcgYRXDyiI
	wGFykF3JhhXFKrD2djkcppxsIzPAMP/3OLNgGnqja7YAO1ypEzHpujY0DS1tpxnAz3apB/db1QBH/
	Iv4yuOblv1btRJmwkJeXlJhRbt4gvbOAfdMcOHcJItADxkzJyiFWwQxUD4UfKhsgsRSPFqFZs3GqU
	YyMEyCiRB6xpQYnXIcR4SXibwcUROPmuB6T+rULTqLB3MTDtVDHvuXp+xDTXFiXiRidhJ0pC3enRU
	XB+FhkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC1j-00000008H6O-2xUD;
	Thu, 04 Dec 2025 16:17:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRC1h-00000008H61-1ITd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Dec 2025 16:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TcYtubvKcGoSq4YWnqE43T9j+Qij7FD/s8vUU4QGez4=; b=denfrO4UIDl2WdNwC4HNyZAY5/
	pTivGhOHJ9FuofTe/Ulqt3keY2u+YkzoORUXa8BigBeaLjP6YJjA1/4sz++WNdki0PISPvC0GUtYt
	OuH/cqne288ltQk71FaVhcbIu1D+lHpU1vlw8PKTrzOGWJNCBiBGhtBOJkQxcAKWF/v9QFPRe5Vhm
	EGfZGrWnsqXGAWY3D8blmBSzqLIt2vYJAWgOykGKxWiXnZuPjZ6L5YK/S9iPH7CnO87kmAoh/t6wl
	Es2K/H5HEy+XvKPfjYq/6B7d8xlnALBiY/fncwZJ0YQN8C/TtVkcT5Di4SaYSRWi8kp9SW0bhGOz7
	4aBm2adQ==;
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBA5-00000004OhR-2al2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 15:22:31 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8823d5127daso10267056d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764865067; x=1765469867; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TcYtubvKcGoSq4YWnqE43T9j+Qij7FD/s8vUU4QGez4=;
        b=xJuaWJEa4wivp9OgVJJkv4qaN2hBvE3NZfQfmRKGnwW2G+fybHYYh5ga55qZfPnmEd
         S7zjvwrB5fXNGHwHVh4yRnENnIu5rozu6D4VewQRrYtvC3NfVcGVhA+7ixxgiBmSlwrc
         eOlmH/wunalYpIPQzc/Ax4yYR4u2TPAS+D1FTnp5fe05TS0rbAbo9TMcA1rEc5TQeUDe
         Ekuwqub9w19PCmnhB4+viOtvemHb5F30LkxWLlGhk819qMIUr8Eqq2fXdMbQWr5rwfEk
         4n9B/rgG7TZX2hphWxDJ2HbiZiIEQI0SIqdm9MvO1XGgNn1+LRfrSgSBnaRBVVSfzjbb
         TE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865067; x=1765469867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcYtubvKcGoSq4YWnqE43T9j+Qij7FD/s8vUU4QGez4=;
        b=bshmgKqNxRDwZmnDRj/peOKxsB0sg5c4hW7EjSFsaOq3inHaMdusyGn9LtOZ3SRWgG
         tVkFw2BHUZtjqHc6L4fht02qgtUheIlWJ7pI54174Lik8mQVfq2+PsDDggvbWR0JWxWb
         eSZ4iAL5FlLNMLs44jxj7F7knmP8Hm834FTpg2bPRhCTmDz7pB8xP4pMUZ15i/gZg20F
         s7/4uHILZj8KLIBWSJSg+vOnbWF2LLw8Px3inBrFI4WsUG4di3MPNIQ9Dq8YZkLb01HS
         lu6mLz5psQWT4YeWISqGIo1dBJBGBUqllXJ8mEleflwxEr4GBt0FwmBSTbtzfKoS/BUr
         Komg==
X-Forwarded-Encrypted: i=1; AJvYcCVIhNhk4QcKDD1LntULBFbnqY1h/wW56bhKOTIE5PmOPYd1fjLKZXrl4tW6GwguCQEjkDjVunT8XBpj4+kpZ1m2@lists.infradead.org
X-Gm-Message-State: AOJu0YzXhdx662+VjwqJnpqF2MJmNFWW2jvCC0pw896FoKwou9LfjDRk
	54FbJ5LStRAEc6IsQK59Htp9iQCw4nkkXTJa59Zfx4MYS1vZTpkblXSHQDThrqvwe8VAWftDPnX
	NZhrsVLomEMSonhN2TTnYcRTQzenUzqJ4zjK2YK4G2w==
X-Gm-Gg: ASbGncsqtdfLRs8GTYkB6WfHLlZCytER5zc9ciSkouwKsxylx090ikWF/nWBa4RMDHS
	iIwyudsYzSpTOgGz6p+aekPG0x3rkAO4EU+F/vDV0gGAYGD9eccjrjzYJ+Aol5TBJ1S1OfpKtqP
	m4/EB+3IcSAUhhdlFA8P8u5eVnL/iAMDj84PUeh0yo8xZSjNLkpLAzH1T5vSf2I4MvYeZIAGr9+
	AyZMEjOmed0TZcTy19eKD/+8o2bo/KUPbGEVTUcjcpT/SbTSs0tJlCDQQw0Ng6lz0HTElycEEPo
	7NYfcOK4jel1UqB7CaNZE3PyL61Y
X-Google-Smtp-Source: AGHT+IF8z11XLGfYzUm91CMdZf4GezIwYVVnF1KmzD5fxiCI7uZI3auSv7HjayTXTjcC2dCJDroO2z1dhzcB1niqEsc=
X-Received: by 2002:a05:6214:21ee:b0:87c:2360:d404 with SMTP id
 6a1803df08f44-88819483e38mr101446386d6.7.1764865066864; Thu, 04 Dec 2025
 08:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com> <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com>
In-Reply-To: <20251204103151.GK724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 4 Dec 2025 16:17:35 +0000
X-Gm-Features: AWmQ_blm_2rs2si_vAcMXoW5zZu2s4mytZpslYby8tsAcsAdu9x6GoUJ81x6Q9c
Message-ID: <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Leo Yan <leo.yan@arm.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_152229_850986_F3BBE959 
X-CRM114-Status: GOOD (  27.37  )
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

Hi Leo

On Thu, 4 Dec 2025 at 10:31, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Dec 04, 2025 at 09:07:56AM +0000, Mike Leach wrote:
>
> [...]
>
> > > I saw CTI registers are within 4KiB (0x1000), we can don't convert
> > > standard regiserts and only convert to QCOM register based on the
> > > standard ones.  So you can drop the cti_normal_offset strucuture and
> > > only have a cti_reg_qcom_offset[] struct:
> > >
> > >   static const u32 cti_extended_offset[] = {
> > >         [CTIINTACK]             = QCOM_CTIINTACK,
> > >         [CTIAPPSET]             = QCOM_CTIAPPSET,
> > >         [CTIAPPCLEAR]           = QCOM_CTIAPPCLEAR,
> > >         [CTIAPPPULSE]           = QCOM_CTIAPPPULSE,
> > >         [CTIINEN]               = QCOM_CTIINEN,
> > >         ...
> > >   };
> > >
> >

The tables in the patch are

    [reg_type_array_index] = offset_address;

e.g.

  [INDEX_CTIINTACK]  = QCOM_CTIINTACK

which resolves to

 [1] = 0x020

where index is constant for a given register type,

As far as I can tell what you have suggested above is a table that is

  [std_addr_offset] = qcom_addr_offset;

e.g.

[CTIINTACK]             = QCOM_CTIINTACK,

which resolves to

[0x10]  = 0x020

which does not appear to work correctly?

The registers are sparsely spread across the memory map, so a simple
mapping does not work, even if we divide the original offset by 4 to
create a register number.

The largest standard offset we have is ITTRIGIN = 0xEF8, so assuming
the compiler allows us to sparselly populate the array (which I think
it does, along with some padding), we end up with an array of at least
0xEF8 elements, rather then the indexed 21?

Regards

Mike

> > I suggested the dual offset approach a couple of patchset revisions
> > ago as it actually simplifies the code & makes it more efficient. The
> > offset array in use is set during probe and the remaining code is then
> > common to both without lots of "if qcom else " occurences.
>
> AFAICS, we will handle the QCOM CTI particularly in three cases:
>
>   1) The register access;
>   2) The claim tag;
>   3) Sysfs attr is visible.
>
> Now we are discussing the reigster access.  As suggested, the
> "if qcom / else" is encapsulated (e.g., in cti_reg_addr_with_nr()), it
> will not spread out.
>
> I'd use standard registers by default and convert to non-standard ones
> only when needed.  A new "neutral" index layer seems redundant, as the
> existing standard register indexes already serve this purpose.
>
> For the sysfs attrs, it makes sense to use a central place to decide
> which knobs are only visible for QCOM CTI, otherwise, we also will not
> spread the condition check.
>
> I will reply separately for claim tag issue.
>
> Thanks,
> Leo


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

