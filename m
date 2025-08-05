Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6780CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1Meg3SAhDcH+nnYjimoBkrTZ4UUpLXDaIJfimD1+eA=; b=bxjCYMTNblz1UlASsMqSPE71WL
	/M2vbytgCoVUIBUw1ZTRnC2j4ubza7lq8H1Ag8BA6QNqcrKBCwquW+LvwDt12mdm/x4y6k+tLv7Bw
	0tCJZTcMkk+ixlPDwSa13mq/QTaorzgVbYWpZnWD6Bqq4U2mTy9ns0YkbkLqRstqAWztmYpB3TQmO
	LXu4UHUrzdxWiWmt85y77q7T4NmGtz4cKbjM7hPcuSawfz7FvwqJv3Kft4VhDqWaYDpdLmBbJsSYP
	lzBWnSrG0SwU+RMN2C6TNvrhA8Qzs14SEo3YXnRy864mxZEX0WLZjOFd7zolbBSfu47yC4oOeWhET
	RsdeKMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLTs-0000000DR3s-0J7K;
	Tue, 05 Aug 2025 17:29:44 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJTc-0000000D8Gf-02mY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:21:21 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4aef56cea5bso168131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754407278; x=1755012078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r1Meg3SAhDcH+nnYjimoBkrTZ4UUpLXDaIJfimD1+eA=;
        b=4VsWUpMW7b8jObw16EWTrrIfUjc73QYR5WShs9xROEOkn/iXPUB5Uwlwn5IGTaohT8
         TiChZTsUQiBgtdxCmEoPCaq9G7VR5Mz1itXCEuxL9T+rcEaTKkwPtm7CXrEDyhONZrqN
         hq6renXnjJGGuLf90rHZyImdAoC+Pb1Hrinvtdak4zI2OhTZbnlnTkbtBIdW+l+T2xhN
         7ykGRQM45c91Sdo/5JfxGSzHN74rQvhoAVIc2uPob4ezaH8Is0i+DMEOXF/AoNfSXycO
         lsoT95aAbbCEN/hdE+GD5TtzHAlUhiDkAkJJEhSH12CR8cNRcaCnV2VmTHvPAHbasj6M
         BdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754407278; x=1755012078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1Meg3SAhDcH+nnYjimoBkrTZ4UUpLXDaIJfimD1+eA=;
        b=KX17uC0Kh3fda1yqcSq/HJ7La1yLrvZVkGNNCHN0OFzK2fBzuFymt7Xe3nmZZYTDAI
         uEXU70EyOw9+fnq2lxMQ3WP+Rts4nSY8pLhl3t0xGDwQologYlkPWHJOKfcidCbY2j8o
         c9Z+SLW5VmmKJKD/o9t2glTDRobeSSBfvQjUcQmJ6Z01SJ4NszyyPPkNq77WMKOmmvD3
         UfN/FoiPPsLk7nZt+aC7JPtWvzWZVzwBMuTpRr36U+oQwo/o+GXo5YFmsNwgFH0avlGl
         SJ/I8HP+sdWYjJuRM+CUzv5sUdgvWISMY4yPQcqRcR68nc9nbVSg6vMBZNSFrTIvhbha
         +fBw==
X-Forwarded-Encrypted: i=1; AJvYcCXJCTMG3bwkfe9Dqyz8BohFl+TApaQ4YZeKyXZ9Hxv8W7/DIGx5u1BjYXl/PuR73ITT9DgjmXp3JFgt+5HQmQr1@lists.infradead.org
X-Gm-Message-State: AOJu0YxEbDtHNAM/gCcmiHG/5as2bzSLGKgrK121aaAA64lCmfyp31sL
	2UFjvloT6lzi0yJG+O13YvufbQrEWTG2pm2f5btPeyKbXQ6u1eR/cVBiJKse5bRvjX5Mqtp5LRB
	Et+OChgDTz2wkk6ySoogF5gFPteD1B0VzTXfHJrRo
X-Gm-Gg: ASbGnctzU6q/diT8AHSUMpbbbNM+6d21J99YUh3pat29LDwhF7+IBqAASOIHcR0TcwI
	m+74VGNTA+/nNSK8gD+mQIdcim1giEVfADSdMNFXHBSMpkWdLehoyhXERJxNZftmrtcVr61wgIF
	k1eoznJZyclS3sDcd1OrULt7EmfZkI/3UVMqCYedQ37Zp51wYVG0cuTrCObH+vpJKIhbKqtg6ST
	oamh6P9
X-Google-Smtp-Source: AGHT+IHgagTKXL9FPCp0iCD+9/acHZKe2CgULwhUdyzE2hK/zZEFw7jdeh3IdiV4ujAdRnhlDN2PVWoMVQsJW7Lprbc=
X-Received: by 2002:a05:622a:4e:b0:4b0:83a3:9bac with SMTP id
 d75a77b69052e-4b084ffef47mr4060521cf.17.1754407277855; Tue, 05 Aug 2025
 08:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com> <aJIXqmv1_0djt82y@willie-the-truck>
In-Reply-To: <aJIXqmv1_0djt82y@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 5 Aug 2025 16:20:41 +0100
X-Gm-Features: Ac12FXyEbwP4ln3SJ6qXyIbaadtTPQ9r3wm2Hpipb7fqLA4duSGS1qyDxnJRhTc
Message-ID: <CA+EHjTzTikJjhHAse0vKBwn2Gi=nOR9MKjQDOFL2H8BxBL3JGg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] KVM: arm64: Fixes to handling of restricted
 registers for protected VMs
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_082120_050120_E9A18F36 
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

Hi Will,

On Tue, 5 Aug 2025 at 15:39, Will Deacon <will@kernel.org> wrote:
>
> Hi Fuad,
>
> On Tue, Aug 05, 2025 at 02:56:13PM +0100, Fuad Tabba wrote:
> > This patch series is mainly about fixing issues we've encountered in
> > pKVM (in downstream Android code), related to the handling of protected
> > VM access to restricted registers and injecting undefined exceptions
> > into a protected guest.
> >
> > The last patch isn't pKVM specific, but a fix to the vgic-v2 code
> > encountered while fixing the issues in this series. The issue it fixes
> > was indirectly introduced into the code with hVHE.
> >
> > Based on Linux 6.16.
>
> Thanks for putting this together so quickly.
>
> I left some small comments on patches 2 and 3 but, for the sake of
> transparency (I already mentioned the GIC thing to Marc), please can
> you add:
>
> Reported-by: Will Deacon <will@kernel.org>
>
> on patches 1 and 4?

Will do.

Cheers,
/fuad

>
> Cheers,
>
> Will

