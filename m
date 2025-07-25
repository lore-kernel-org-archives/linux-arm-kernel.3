Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81393C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtRwewxpwq6wdbx4qVBSFtRxsYRj3bEn6apmzcYXc4U=; b=v8Fg5hpgOjmNumvoJYb2Sb0Rc8
	klMvphPLL5PWwCGNjJrq+qxzHGi74YqAnCw8xuT/XA1E6nPw4eHFzR9vXL1+wbLwhlH4ZgYpP4p64
	2EE8d66owZyZ0TpZ5Tqp5mC1OXW655LUphCYIYw5ZWM4uu8CzkK9UR+mNjo0+2l+oqret1tJliSmJ
	99B05YZiaJWgGoTj6dFaejO5QuPW6HvkJTpcN8ALVtOM1EgvKaEKPLDuFG6WbvFnDJyJ8YtQ8yTXa
	tbMoFuLRA7DqSkdRaQzXsEUyc423czUrccJVf1sFAITYt7x0vegEtllvr9P+5RetWM0TPMd5QI3Kr
	5WBmXurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufE33-00000009NlR-0WmJ;
	Fri, 25 Jul 2025 08:45:01 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufE0Y-00000009NWW-34va
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:42:27 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-301fb587dfeso918008fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753432946; x=1754037746; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RtRwewxpwq6wdbx4qVBSFtRxsYRj3bEn6apmzcYXc4U=;
        b=URIR2TkKdbcj9263XJyI30iqSvzYyMgGhWlvYXwYtx2KvqdcUdAnQpj2KvYNjoKtm0
         4/p/vPMZfC321Ty0XGjrx7CbCQXLGzGne1b6i5EO+rHEfgLnZjY/C9X2MPBlALe9uhcu
         +7SsawwolYVwQrnvRmQmw2bvz3K/Uz6CjZmJqyX4pWo6i+4X95koPHuBEmSX5N/TPDqW
         a4v15c7wmzkI54xd3DvuScEeEjsc80jdMHvq5VQ+t/xsK0WoXG/u3K6wPKIhToot/uvf
         guLqweCcxPhaxrDCq0Ju9b6aB7J5hgIA+fkGJZIfN4ZfGw+BvvN5RFlDanLpzdhT08gd
         TToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432946; x=1754037746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtRwewxpwq6wdbx4qVBSFtRxsYRj3bEn6apmzcYXc4U=;
        b=kEmSHA56BAhrpt/nBK1BXm559Pkx1B4NfdLbA/TcA7D57PStgPiTSjY89oMMTUbypv
         S+zLCG11ebFaKM1ZtVEWJzfIxv5jqO5KqDB+dF2m1mcZEZcaQcfrgnAgkc2A2dmXY5Zj
         DpHRSjui/eurswKOBnkxbN+4m0fRfm5ienK1Wnky6zgagd2zZHUp+RzetXUxZJClj2Ss
         UP4YI6TqcuMD1g2cjXH47RJwDraeKQzHnXO2J0aFws/6UzRoZ2BTviiFDR0rWkOfLJ4+
         Mq2s4Dn4tWjCCRj+mhMba2bsjp4ndCFPDoXKw8jjIQt3xxIS4bYkKQ+xNIgx7RSBYmUA
         FugQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkYY1kAtu+JDVNMa/pJ5EzOl9O+frs1Br+7Bq1rnMb6nbfvnfgclM3Vd9/VUh6u69d0UBHzhAlTCWFb/Yj2J+v@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ISroL1346d+WFNBgRfXPTi6v3EChz+7joOlmvnxMT7EO71TW
	Hkatd4gessuOT+jeHNUqtcZ3gtRVtBzrDk/r6JpXxU8yMCL1wbVeJN84W5lrtCkcZwxxKJun72r
	vVfJWDZ5a8FbrVLchi/5wVOX4fWQIP30=
X-Gm-Gg: ASbGncv4jHAts84Ph1lHOpPtjbmEty4E5TOrb+Rt9NOKWRpqvN4MvDPP97CKogy1zpE
	hK6nMvry7MucJgijYWUHDbd7dG8oV4vXSRa3mjiG3kn8lyhhBfaBhrlDrRNu3NUrml2szcE74Lb
	j93cQUwW9AVJ2M3Hr5n9DkyMwS1qPqLdLjPXdpUqPyZJfvsmtwQ5MdWm77osFCTGqkUtljo7rZ7
	z0glJX3tAqHzqW7eMc=
X-Google-Smtp-Source: AGHT+IEVFljy3riv5EFfk3X+lUpRuFxZgCwOrvFCvupN/y94Ps1Jz3V/M3D+xKgRnuMZ/6lDOnpaj2GSxOEwWjj3QCE=
X-Received: by 2002:a05:6870:6591:b0:2ff:a6d7:52a1 with SMTP id
 586e51a60fabf-30701b95dc2mr743859fac.35.1753432945740; Fri, 25 Jul 2025
 01:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com> <aINB80UeE9pqKvrC@arm.com>
In-Reply-To: <aINB80UeE9pqKvrC@arm.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Fri, 25 Jul 2025 14:12:14 +0530
X-Gm-Features: Ac12FXzZNc1wz0lfkqTulvOvt5tDVpytLFbz6qy0ZVkM2HN4QImTHaxW2rcRyCw
Message-ID: <CAO9wTFjYnNAiGXqczPMgmCMno2Y-T5GCmgBgjGfDRbEcvsyNhg@mail.gmail.com>
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default accordingly
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_014226_771628_B1CE9CAD 
X-CRM114-Status: GOOD (  14.34  )
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

On Fri, 25 Jul 2025 at 14:06, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, Jul 24, 2025 at 10:26:39PM +0530, Suchit Karunakaran wrote:
> > The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> > This patch changes the minimum allowed CPUs to 1, enabling single-core
> > non-SMP configurations.
>
> Do you have such single-core system?

No, I don't have a single core system. I've just used single core VMs
using QEMU, etc, but I don't know if it's equivalent.

>
> >  config NR_CPUS
> > -     int "Maximum number of CPUs (2-4096)"
> > -     range 2 4096
> > -     default "512"
> > +     int "Maximum number of CPUs (1-4096)"
> > +     range 1 4096
> > +     default "1" if !SMP
> > +     default "512" if SMP
>
> It's been some time since we forced CONFIG_SMP always on for arm64.
>

I'm sorry, I wasn't aware of it. Thanks for the clarification.

