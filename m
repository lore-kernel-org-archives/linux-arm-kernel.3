Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF34C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7RpVIHY+r0sfU2i8cmIAET2MityHo7vaehhJ6cZD5Q=; b=EYb56e5jOusdmRFQTm5sOC7qU0
	X41T82TOdwkPf7NDLPz9o3oy0wE9pWqHHgXBn+EQT6McCvkOdWxIPY1ePBxpYVtobwgKWIv7YqKRr
	LfaM4CJYOw5HtvT40Rx9PZeAJ+GA9f1459OGEBDRT620c7MwhyloG29PH09+nzh8Gm/KJDeTOw9Bk
	SrlR/EEDW9c7+p80v65z1p+ffF1OAsBh5aEqTqqx8sYTmCZGy9DhBVTYj2zmTosxeKc8AWxayBlxS
	DuwNtIkILvRW5eF4LiNi03bk5Yupx/7DV0U8Vk/bK4pYCT//Yclp2qvEHJkwbwPQCFHwjLz4hoPqV
	aD8aVsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treUZ-000000031M4-10cJ;
	Mon, 10 Mar 2025 14:52:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcaw-00000002gci-0o1w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:50:59 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaec111762bso816536266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611056; x=1742215856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7RpVIHY+r0sfU2i8cmIAET2MityHo7vaehhJ6cZD5Q=;
        b=Bq39xJ2skolo2oStJHhlwzsYxOHK4punF08Z2Ri1otsQ6hJGpKEJSffGTPkKoCeH9u
         DAsyEwrZH/sf4ScFFV9MHRh6O8rZD7pot/wb+C4lqohm1sclt99J0QY3tzMxbtMJNGVb
         8GYAEihZxGGzGc5MtMQEyTaja9AEG3JRipYAjftmPdxhHwQq0zVtwDXDMQBhhf0liE2D
         2AfQ0+bNIxYuLH3ByV9SNHpfcxgWeDeuGYmcPpOemcLj4pYGGGgWF6QG7aTQwqssTKij
         97eKtKpVcxn2slFL5Qdhon7Yb+has/42GpnidkcKmYHEXaAvok06XK2hIgoGXs0wQRIB
         sAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611056; x=1742215856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7RpVIHY+r0sfU2i8cmIAET2MityHo7vaehhJ6cZD5Q=;
        b=Eot30Zq/Yk1qZjvW4BJ5MzxHQj1uPQtbkU3MYEHpmUnStm63VWrCwQI5J1FYKGsF0r
         QsZGC+QgScZbPP/5VuVQ9XoRjFzWUOJuK3FLW8pEZTo9t856HPuN5YLNw4RnD6JJMsPS
         h8u74E2JNI3BtvkjWEfN0KRxic19QCSKu6p+n8rdljait8eLjSV7oUirtrcH0W19GqlS
         QMi8ZOM3Caklpbvp263vmAmMZJiVO4ssO5Y/+o7ylmP99dnGtSF6c2wZ8Xz5+b1rBVH0
         A6ZPlUrcxoOIAWDzWJzZYgnguIBHFOVWLpDWQb1kVKWtnh9MDNwJ8X9mcRbntf//o52+
         f61A==
X-Forwarded-Encrypted: i=1; AJvYcCWvw5X29Dzz6EhxRhjxrzlJQEx9++rlt5dUeO2DzxbNCEYB7XUzRnKmzTE4+8QgSexZhkOG7/dV6HVuOGtrW4FJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy2XIDYg0XWzC36dPpK3kVcW1uciVQ+PFUcAkVa6g6+BzfR6p1
	7seAKv1WzoTMmqMqiZJpT4l0qxSwC4KTRn6zqbycJ+fVsTHl+BlwuX6EEZ/wmPiS4AbHWF7KyVu
	TCi5a1y4lMLh8fev0r+Tc9g+Uc8g=
X-Gm-Gg: ASbGncvLqPI+CO14QCI98fNR2xLQsnHsqPnSpP1CmZCsrnxxDgIHr9JrBeiE4YsKWj8
	tfbKB+4h+LmBy6ch9QDXuI04epZxw5rNc10O2qJXDoifbPMUnJAbOlODyPtMtjFNGuIksv5KsBO
	SbwSHYIALL1bmngYpdkwqpHZdc9aL0fiCr6619m72mM7/y
X-Google-Smtp-Source: AGHT+IEEhoCLJZRXY4Rijvv9tI0tLl/IUwNp5Orm1PRrbMcRZugzWXJ7hXwK/krnr0EUihHMQKx/Fjue7P0l/J3Yjb0=
X-Received: by 2002:a17:906:99c2:b0:abf:4708:863e with SMTP id
 a640c23a62f3a-ac252fb9b4emr1577886666b.39.1741611056422; Mon, 10 Mar 2025
 05:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 20:50:20 +0800
X-Gm-Features: AQ5f1JrW4lh036PUCGXkQlwffXrplxrlmEnJajhWhVG9u6jh4khODFbp1KsY5xA
Message-ID: <CAMvTesAh9hK3r81TqbSwB58c1zuXpMzhk=7=gt2cR1QvpJC35Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] acpi: numa: Export node_to_pxm()
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com, 
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org, 
	joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de, 
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com, 
	skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com, 
	ssengar@linux.microsoft.com, apais@linux.microsoft.com, 
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com, 
	gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com, 
	muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org, 
	lenb@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_055058_225939_5281CCB0 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 27, 2025 at 7:10=E2=80=AFAM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> node_to_pxm() is used by hv_numa_node_to_pxm_info().
> That helper will be used by Hyper-V root partition module code
> when CONFIG_MSHV_ROOT=3Dm.
>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>


--=20
Thanks
Tianyu Lan

