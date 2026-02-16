Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F20E7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6N2P1woktSvq/O/OPh9bNbC2hnbgvc/YM2AU2z6w8E=; b=07mTNQRSUvec2tRMabghlMv9HS
	pFdwgVTd8YYeaI0jQyZJMLta2LW4kXuMvsOhKaGANRZ1nXJNz2RVL4VmH81BiU98XTUi1qNm6YV2R
	YdKxFzg35ScI1Us4hviW2qtfrN1USWx76oKHSmdgfZs+UB370atrxM9GnGrUvQ8DPZqH8Fmvym22L
	Vwnqxy+Qksmc2RlLkgyj6zmABu/ECAliNVZBSN2+bNLTCU5+gjp/WO7wBkLAWTRg3ULhbVbZfmOTL
	mbppYWZUlVk8SEq13q4LsauCfplVE6LzYG1a04hse3fVCmd/VsSvzeySqEPvTRceZebLUudfGKshP
	w1js5Jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwLm-00000006OmN-2WEw;
	Mon, 16 Feb 2026 11:01:10 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwLi-00000006OlE-3tdf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:01:08 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5069a785ed2so884351cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771239665; cv=none;
        d=google.com; s=arc-20240605;
        b=M/b1QMzUYtOrtiFXvB+6DkEtJjr2jOiVOL8Bqy8jbdRIuVlqgEs1XEmmdihn2twOQ1
         13zQHu317G6Wpu4Dop++4qiK2NhMCfoZVXKExg5I4cgM4oJoPdMIOSfgnm6p6YAkkCeE
         5+dbJDSpg2LaKXpPH427MVMQTCTOTMu7iyCpvn0rvQCYHAvtEhA1QSbsURryZpX30fUm
         oHzw9F+YBkj+vk5h+tDpfetS2aT0AFlLlpmVpZdrn1kTOzUclwLbM1CKLuWp5LBNNTf8
         iFiOipXuLe07n7VYhntPT9WzwCOcEHVIQpx3n9xCI0+y2S/vuxJ1O9fMUPn3469ydrt2
         a2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j6N2P1woktSvq/O/OPh9bNbC2hnbgvc/YM2AU2z6w8E=;
        fh=mLSSobuOifcWmX0SNSvBQ7mleHIDFPXc8dl9s+iQ8so=;
        b=hMYpBCzF87G0eQ/nidsTCrtNGCZCJBvvOaKAxLWb9l5gxarNE+IidN0VRrVoGdHE+d
         +8XVx3PapPdSK5mgtv1BmXQDZ7BIDQirPzkH+jTrxPgg6xqtVAVzNB6QuYZQNEhuU4aT
         bbV7uZSJ4IYorz0KgRfXllrxzvWqeZmw+Ttno2y7RXg9LWUV9aSEqW3HI4lUKYvEMZmS
         ogviTYV8CEFtC1C3SWVyDHcTg41HJhZ96SyRtLhsHiorsHMEfmyrEFivZfzqJiLp+z80
         bngJLfOdv3dkbRI18e/5JXjX8jhNdc8NpJet20Xs6YmwNu6nJr+47hlwGhGAVa5Ybkys
         PhRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771239665; x=1771844465; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j6N2P1woktSvq/O/OPh9bNbC2hnbgvc/YM2AU2z6w8E=;
        b=yP+ZubYXj7oZBBCeyg5iCLxazaMFWSMHShGSTcF4Baz/XvHZ1uJiVmOewHU6XkPZiE
         7Vbm37Qj6VT1WmGa6jyVwManZnheMANn8SafGJ+fQ8x4PSFKUx1BhRUJMFVLgkyN5syO
         n4dUVJekJlFMs5zMVJ/lz3XDakJlnA3XseyiBiDaVWSHbga6T6C76DFpisPzubDoJZX6
         pK3rmFcUsmZShgDqbLvC7fJkSubuVMnxpBl/6UMad4F9vkSB54C8lhnSLPCIyZuGWyzX
         0jBvqqktVkO/d/B37YHxge7Igp2uLOMCm7sKALOtnzONTMP03veKxLzAJuR7+x50aCOQ
         XcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239665; x=1771844465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6N2P1woktSvq/O/OPh9bNbC2hnbgvc/YM2AU2z6w8E=;
        b=cR1kOYGG5Gr0FWvrYh6K5vf6NnGZaFhTk9roqSs6JYytmMM9dEFGLa0VfV1dlVr5z7
         WhV9kg2HWmArDgCfoBweT0qydOb365bjbGOBA0laBCRr/5uVtuTyEoWGjkh3wWVF/XZ9
         WDLgXQa+kHqiyibw/kqwDTlUGK9Fhe5r6lMvwryWwOMUxE7syC7jUZ/LSjBXy7mQl0G5
         G6cz24a3MeI8Ofw5l02y+izQsf2extA3qeE5JsMb9D7/2AYGoOKgqc/WyMOWo9d2Ni03
         i3+aAwmOi2rNAmlxIXWBDNpLBD+EVU99qhKGDTMa2pMalaaZjDByJrFZJcEiPRr44Nat
         znkg==
X-Forwarded-Encrypted: i=1; AJvYcCU31rphBM4BkzNRt/nKT3AyNeHAkLG3cbymiH/pe1FrZzuwogvzurWRicSsX9QqAAtx+LqP7RicpeSe/UnZNKaU@lists.infradead.org
X-Gm-Message-State: AOJu0YwWwORNjjPdZJCWGKl4/g/UoiINZSfBp1ebGIAvrhlUI/2Qmcbc
	zGJP74RLaihQt5OwHtgzZtiho6aBz9DPZPBJ/B/rTcVnpBTsk/fK6jSHGAZ8H9ETzxvnO7aqs01
	Ie5Axk1wb55XcJSUrrAjyg7GbXFJ0pI9ND306scRP
X-Gm-Gg: AZuq6aLamgEiCdA6V4ZOxEAoI3CEPZDnkkLxGKRlWYKnJOmZkaDZ8VfRzHJeCnzZQtE
	53Xb0/TfLb2KalE1vLCjwa3Dh/kjFYNlKz5CEBpW+Fm5cMjlS3LbKnXIfS/FnE/HHjuy4NY1EIJ
	iqL9QUkaeQPWjt/LDCi3lQXaRDv+p9vBF6TRnA3Q6b7MKD7BzcEQgvRGote+k6hjk6gNzYEQzDT
	8nqEgbv1sfOH9tCimdldIom+Q4Q3Jl7gjDfvwqARAVyV5vjx6OqnJmAUyvVpg1NKWJaPDnBRi8E
	QjRD4Nfy
X-Received: by 2002:ac8:5985:0:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-506cdab08e4mr6258721cf.7.1771239664283; Mon, 16 Feb 2026
 03:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20260119124629.2563-1-will@kernel.org> <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
 <d2303150-5692-479e-9a56-11a52ba58c2b@oss.qualcomm.com>
In-Reply-To: <d2303150-5692-479e-9a56-11a52ba58c2b@oss.qualcomm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Feb 2026 11:00:27 +0000
X-Gm-Features: AaiRm52UGHbce0UNCUNYSqfkL14zPT3LmCyCoSrVykbFhQDeWXdeg2c2n9iGses
Message-ID: <CA+EHjTycHq7WkOfD7d+1-9A7HOAkGzBTmEm-6DB8Y0TNq-Aftg@mail.gmail.com>
Subject: Re: [PATCH v2 00/35] KVM: arm64: Add support for protected guest
 memory with pKVM
To: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030107_034201_49421E77 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Venkata,

On Mon, 16 Feb 2026 at 10:58, Venkata Rao Kakani
<venkata.kakani@oss.qualcomm.com> wrote:
>
> HI Faud/will,
>
> Can you please share tip of your commits to apply the patch series cleanly?
>
> I could not apply on tip of master branch.

The link Will provided in the cover letter above didn't work for you?

>As before, patches are based on v6.19-rc4 and are also available at:

>  https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=kvm/protected-memory

I just tested it, and it seems to be fine, based on Linux 6.19-rc4.

Cheers,
/fuad

> Thanks - Venkat
>
>
>
> On 2/11/2026 12:28 AM, Trilok Soni wrote:
> > On 1/19/2026 4:45 AM, Will Deacon wrote:
> >> Hi folks,
> >>
> >> It's back and it's even bigger than before!
> >>
> >> Although the first patch has been picked up as a fix (thanks, Oliver),
> >> review feedback has resulted in some additional patches being included
> >> in the series. If you'd like to see the first version, it's available
> >> here:
> >
> > Is it possible to test this patch series w/ the QEMU or it will require
> > real SOC platform?
> >
> > ---Trilok Soni
> >
>

