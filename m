Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0273AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsO2fJ6cq9pdq/WTSW+tPj6Eq0Tb3UI6bZpj045PKQU=; b=x99O81BR+w0krzy+qeJC70kb4o
	bWcCfS3INDquyy+TISu7xmqceOZrnBWGa8azxicwNCqpAMVtY7RxKWzFaj1v82UWQd4RJH1LkFY43
	VGp1ZYmP0KLWWvH36wLe2XEaTpK6fFJZwQkRzQs7a7e+Q0ienp8jJfM98f45glHIYUnVJBU5YhP5p
	sMjCnGWVIrI1MhODpGyoQJxV5blZ2lTplXCdqDYKGxdSPaQvyebGNIGRxEjhjv3RgzU0i5o531feb
	yd+B2XBsNYQVv4w+iZNlrFLl7AvV89ykWmegn+h+r8B+kQgmHbeFojmiIHX5iTBBuInc7sesPc9Ar
	Zxxtk5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treWC-000000032Jd-451S;
	Mon, 10 Mar 2025 14:54:12 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trccB-00000002gpZ-1Aju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:52:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb379so7103002a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741611133; x=1742215933; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsO2fJ6cq9pdq/WTSW+tPj6Eq0Tb3UI6bZpj045PKQU=;
        b=K0AsVPREH867WDox8P+7UdTK0Am1tJXhqNyrvC3ydVESM2eiRzVQGCJ+mYuSlcX/Sc
         2rZ3zmWo48AMNu1WuquyFH2ht72pn1WCGGZgQxngZkrJ08fAZiTJuv5VtE9tl6yA73t1
         KzVQ/io3qokiYCAxnX38KzeUUL0OkBjOvLzhLgKPImZJiS6PgnSJQU3u+UzCDmSwcuzg
         nODo+8vEQdjpg7gYLfArmjHRX0CQUaISZP3Ym4FF2e4KZkhY7So4fNNtlF3N0mKNoyWa
         5YDVLEffZVZ0rs3g/CbtTORLyIG3U9jyhxF1qXKTkRqyvjfq4AolWGny/4pfBTYPooBd
         n6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741611133; x=1742215933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsO2fJ6cq9pdq/WTSW+tPj6Eq0Tb3UI6bZpj045PKQU=;
        b=TN/xNULVekU7BFDFJlbyvVkAxSn8+ODeKNLYzBLb3g2KXqg60eions6nU5vsR2Cv9W
         U9YNNZyK2EmJd8k9v7U33EcepVMzboHVeIR//UG8cDHVJt5b6wi1bpBfYz543bIFJqdw
         vpGi5p7UK9QbZZEl2GijEmRjc+f8BXUyPBkUtRNVtAwsRi/CopJ7OfheL6EvRvmqzNpN
         H7nIcKduwaIVdgBiivvYcKDE+WwOYUNwC46Kt5kN+ECJIRNxbvJeJ/tS/GWVC8T1L3S8
         EordGVknhpEJxDW8k6Wgn2uFnPeo6IH1qadj6I5XjzMVGkwgWp9QYdXZVbKMurEuFJpn
         /68w==
X-Forwarded-Encrypted: i=1; AJvYcCVtm6rjCSo9ctGlEWrUrBaEVid0mrbFcYXZ42cynYBFIFXi97L9m18JoMCnGzwDmhoCFG85bfB0S73uULHifgc6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3gOEiAUr+D1EDM0tV1xpqAbMq6e2EiAEnPJKr2DvbBvpGls6+
	obEnhseqoQBtJzD743xROSCHkWiMEuXEyUPvAoD4Gj0rRkWltB7Y/wg1w9Bhp8na7pAPEO4zi0X
	UgdZu5jGZapbpkO/HaXLAUFKCV00=
X-Gm-Gg: ASbGncvLS2o+fpBOD56gp2xf/+LIj2HxxOcwCQZfiVkryHfeSkhgigZfmFTHMP+MgE5
	YVnAY51CDvRG1Zg9TzoruxDuSaxgbuUOYwAoi8JHP2AH0Gp/tbUBaNNQCK5qMfGcEzWxrFLkioy
	ji2cAGGFs6/d+8p5HgU1Npr8J/BWzuFH/uLWHfNVByCl/U
X-Google-Smtp-Source: AGHT+IF0bYWGe4Fmo22RSpPatdmw+87/zdDh6bOztJpjAX5OtLNHVpRiEKuqE2Y797OiBIf0Zkae239Ix1mhgUN6BD4=
X-Received: by 2002:a05:6402:3507:b0:5e5:b3cb:38aa with SMTP id
 4fb4d7f45d1cf-5e5e24dd558mr13645616a12.25.1741611133396; Mon, 10 Mar 2025
 05:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 20:51:36 +0800
X-Gm-Features: AQ5f1JoNaKQNf7RCTRzeqWK-w55-IhlYCYK3_qpuW5zNCfXinD-QYDINJtQnu-A
Message-ID: <CAMvTesCs3ieYDEnC1xd_U=XYvg2u_qE7FZRLp5OoWh1Co8p6+w@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hyperv: Introduce hv_recommend_using_aeoi()
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
X-CRM114-CacheID: sfid-20250310_055215_318461_8CCFBEEE 
X-CRM114-Status: UNSURE (   7.72  )
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

On Thu, Feb 27, 2025 at 7:09=E2=80=AFAM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> Factor out the check for enabling auto eoi, to be reused in root
> partition code.
>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---

Reviewed-by: Tianyu Lan <tiala@microsoft.com>

--=20
Thanks
Tianyu Lan

