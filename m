Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50510D149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=; b=kMeSYLMW8nmQ3Y91rP/6NKUX6U
	eRcVeJ1LJvWREgG09TYS+42JNiV9Sire6OH9maS+0mPcU4P9liehHAyVQ8Gd8PhNw2XOmC2559nKl
	PiPS93eRhe6nFAe8fhir4JUeoJPDP8WKe67ohNqm5PvkbOyr1N0XCdT7TWuu5u+ZtoL4lcyHWTnx+
	3IAZEpz8/5BbDnGlyIRv5G2rG1DY6/Gve2H0Jx6LGO1c1gISTUk300wfCBBEh7eNS6ObVAIjVzt7G
	wRDYDXH8g9W29wP/ryncRI/vkdHxoTO/EZemBw8ilXaFMpVS8Lt7mUfhcQHi3RL1rMXUt8lc5IlpJ
	wf/46o0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P7i-00000004p11-30vP;
	Fri, 25 Oct 2024 18:33:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OLN-00000004f99-1bUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729878204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	b=KiH7nXtKtfZJFEUgfOdy0oKwF4oVM+/l3/RHxNVOJUkW90G4Ue2ayzNA4Ry1BuS9OFPgju
	HT/6qBqMkcV2IlUoUBPNlu1yFkvcpTe7LaR1pkV99mpXjP1fcyPzRxxctFAMpyXgeXoScE
	XvyCImE/A/bHHXgJ/ehX0Ji+tHEwtoo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-u7L6Z0k9NcmHAhWagmMd0Q-1; Fri, 25 Oct 2024 13:41:59 -0400
X-MC-Unique: u7L6Z0k9NcmHAhWagmMd0Q-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d59ad50f3so1173443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878118; x=1730482918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
        b=L3pS/ie/Bk8J/IlLXOkfhXwrFxF/6z/U95pkrLDQ3yRsSEznNcthI9pgWj6Gh8qDC6
         OX/xGXZLj8wK0uIWNTMHVqteR0iK5DMx0Kmr2i4D2BhFjilJ3Ji0YOx27cyO/4LtjKhM
         3Azk+l/gECZdjArzYY6gpDsMcpAm/QTXtQGOmqiNsn2szcj2tagKA3CtEeTt1Fp4rYk4
         +OMCV3rX0iG8sBnY3CfPbuG4seezz22o+L7TBmgiuRZL2E6h8oVdn5ia9aHKHZLSTG7d
         7PQrSez44JUX+jNtU3mj79xXCh/Tt8tu3SnMlwYj0N0amHWMpPohDPPUWu/vN9NntlLj
         K+lw==
X-Forwarded-Encrypted: i=1; AJvYcCW4P2hPNEw5GerL0Bhs2fFsbha/wfyebzZXb0wP9GH3/hh5KVd8o67//vibLjCqlCypiO1oIwI/x55uIvj2PQpa@lists.infradead.org
X-Gm-Message-State: AOJu0YyiNefF5MyAzUZAizSQNyK5dzOvBrNtfgG337g8IypbFrsnQ03f
	oEz4nzGv9qUqTHL1YHDuqxRu4kJAVCxSesPJhwR43Kv2sJB06MGgPb1y6510+1PSGdl1Ld2zm+l
	JXgO3lhNbW2ZOH6gw9sUMekqmSfv0coANGiL+JyO6d9OnDPPeY5iOhwH618atsw/DfmktpRsuce
	5Oucdcp9DFjfML0JfoRUFI5uTpSUSq+/BCXiZdnKBRitn0O1Q=
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3806113a07emr163676f8f.13.1729878118154;
        Fri, 25 Oct 2024 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJirsSaLOjUEz6kn7HmxOjIyhE9ZfBrB9GAGHgNcgNSBUFOeNbcRoyDDrANp8n6mxM4gCIddwEWDqpYot15qQ=
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id
 ffacd0b85a97d-3806113a07emr163639f8f.13.1729878117761; Fri, 25 Oct 2024
 10:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
 <Zxbw9XcFCHYR1Ald@google.com>
In-Reply-To: <Zxbw9XcFCHYR1Ald@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 25 Oct 2024 19:41:45 +0200
Message-ID: <CABgObfayH1x3qFjOiM=rQjxiui5tXJXObgR_qOGV5Hn_2QLEJQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_104325_634910_B58B33FB 
X-CRM114-Status: UNSURE (   8.33  )
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

On Tue, Oct 22, 2024 at 2:25=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> > Looks good to me, thanks and congratulations!! Should we merge it in
> > kvm/next asap?
>
> That has my vote, though I'm obvious extremely biased :-)

Your wish is my command... Merged.

Paolo


