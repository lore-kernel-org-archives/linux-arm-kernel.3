Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC8DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYwFNZ7gJ7YL/bHRH7pGKeSkqhcvD8xNXSGdyMHjqaw=; b=MTdJBuyMO2gV5SIKV8pB7vNg7O
	A2avHpX5gY48sIpACuiiloH7z8rDO/iARgHGPM2MHa1NRphCZwAVmfpNZ/irwforPrYw5Ss/vIUTc
	imu1PK4wKDhLz4ap4aPIRpAJmVHJWX7T8XKnGvD/F/rPFcCxzxxe9QmiOaLhdn0sqd+SoTw8xQfEx
	XwB6aeyGSbHlRbZB6BfHAuZmlLWhWWmfzeDCaTMczlZv7Q4tdt+LlAh1RXj02u8I8P+pd+y6CL9h5
	UCDhqN4zhZxnqW/4zoLYkqNrDHr1M0xWoQasiGyZu0T+GsLQz0WIbqbZp/kUYRTkAF2HG7+15D31R
	k60XMOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9pX-00000005hT5-4207;
	Tue, 08 Jul 2025 15:01:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9cJ-00000005eqW-1caF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751986097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYwFNZ7gJ7YL/bHRH7pGKeSkqhcvD8xNXSGdyMHjqaw=;
	b=eRKM2Ic9q6j5Ar539ObIBwx7gQGpU2uRKT8vcCaJfSWp8I/kPjtM+coD0/Vl3AqOc8ggIR
	EUM1lnpMkM8hHCqBUlR8MNfT4UUgo0ZkV9Az3E3Hxtom4KNVdSjTjfgdXIv7kGeHCbnzRP
	mw5eg6G8HH+xx4GRaRwzXAFbKwS56AA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-1w30Sb6BOJu6pOI3JC6gzw-1; Tue, 08 Jul 2025 10:48:14 -0400
X-MC-Unique: 1w30Sb6BOJu6pOI3JC6gzw-1
X-Mimecast-MFC-AGG-ID: 1w30Sb6BOJu6pOI3JC6gzw_1751986094
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so1997815f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 07:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986093; x=1752590893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYwFNZ7gJ7YL/bHRH7pGKeSkqhcvD8xNXSGdyMHjqaw=;
        b=ApYY85YjpNhhyIu3vvUulokN5gZcuujGmpyBdPRFbsWMpmg82ppqq/9xA1Jp+R0T/r
         QhEPcZrFw8Wwd870dacS0IbPwQ3QdMmEZ/NqihIolm3r9j1UvFCwpaggXYDiE0x8LSAc
         mRGOi0TtQEKIyT2Y0qaEUgRho48ERUIGi5NFj9Yb8W6clBocGJgu9DDOY7KwY5Gy6qLE
         9TQTiH+vLp1XVikm7oSzQC67/zZkfouP8CK9CWPuplMV76QXuBe7zwBY/loFVUO4ZfLp
         e1O8eGNCXglVHotJNeQcc12Bdd0c0yRG0gkvr51g5Tz3fz1kQZPzq6oKj7C7KX37Uu6Y
         jsGA==
X-Forwarded-Encrypted: i=1; AJvYcCVMd826knz+ZGPykf7XcUbMed89qW3o5G8yXdthwXEuan/h+qYIZIzPdW7cvVmrRxoHgt3FHt6XlSrue21YvEej@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5cByiuwrZSwvM4M9oF3ZXAHRmGKA5cxn7CPxKPJ/xd9Vl//V9
	+scmvvc2xb6pf6HCy+V9NgQMtDOj0m5b8zGesVoiHRolN0MurTT/9BC0qhyWrnfj1c+gaBYNPH0
	vtPT4MDsWs/nI0lHiVoy3IMgp8BgYGvwYhu18daeVF+6pog9RvJp8Ibx8IBF0puAtNa0Sm1X8xu
	PmIIdlz/iFePeW8OjkC0wA4L1+UjjD+aekUDuTTFaCmfdy/e6mXpM=
X-Gm-Gg: ASbGncs/ZWSOcpbR96J4LcsadJtYUGo1n9FAGdHutA+HmBk4m+tL5EYY3f0hVoG7MO8
	72p/NJuLOejYdjNmSh0ed0lC3ETF5yZz0KZdxH1eJCGl34tZ3ZKgDMBrSeIH6RnLl906uPtq8CH
	wCxQ==
X-Received: by 2002:a05:6000:2303:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3b5de020c32mr2975724f8f.24.1751986093486;
        Tue, 08 Jul 2025 07:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZiM0/9n6ueMPFfbYNFhT+fBviGPPImQB1n/AEnAcH0tJWdCzJAc7ZdV1DzjlOYDO19wxA0F443c++AksjL/c=
X-Received: by 2002:a05:6000:2303:b0:3a5:271e:c684 with SMTP id
 ffacd0b85a97d-3b5de020c32mr2975705f8f.24.1751986093032; Tue, 08 Jul 2025
 07:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250626152023.192347-1-maz@kernel.org>
In-Reply-To: <20250626152023.192347-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 8 Jul 2025 16:48:01 +0200
X-Gm-Features: Ac12FXzzshxqceQql3qnuEeB1aBk-3TKPKyjGfeEqol9jVWILuBd4g9oY4XHIv0
Message-ID: <CABgObfZ3RepTFAMVSB4v1cmuOg+JB7LAcqx04EZui6qF3q5QtA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.16, take #4
To: Marc Zyngier <maz@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>, 
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oQHFLT-vPn8W7a_g6txrMK54qKvGCUcbVv4d_uhEOew_1751986094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074819_494222_82E65100 
X-CRM114-Status: GOOD (  10.94  )
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

On Thu, Jun 26, 2025 at 5:20=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> Another week, another set of fixes. Nothing major this time: allow
> pKVM to fail to initialise without taking the host down, make sure we
> are not mapping too much in the host S2 (another pKVM special), and a
> brown-paper-bag quality bug fix on the nested GICv3 emulation.
>
> Please pull,
>
>         M.
>
> The following changes since commit 04c5355b2a94ff3191ce63ab035fb7f04d0368=
69:
>
>   KVM: arm64: VHE: Centralize ISBs when returning to host (2025-06-19 13:=
34:59 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-6.16-4

Done now, thanks!  Note that in the meanwhile git:// is not working
anymore, so you probably want https:// in there.

Paolo


