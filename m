Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC33D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 05:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=; b=2HZBZinIx/9zRyZhgoK32bsUDM
	5b0tkJGGGfpGaTGbnzVYHSzOsx38OH1NkjJsjhT6STfiC+kdHTYXoll6r/AfT4E5WoY8iMgSaHHot
	ehfeGWdeWpqCVBLl3F+9IFJOPBzilGWp8Fcix5h9uh5KHmEALn9aZDszLmx4ti8+fND+pW2kT0lc4
	QvfuEQXmmcpw0V7EyokNJuCCbVriqIbkB5f1/6KHCl3UEHAOb24V9gMV2GZPuqdLY0rQBRt3tWJBs
	TCmaGVcnXPo1qegNbSOZ2LAoBqDZ6ofUoqxKVnxaXyJVm8N8bc9KRj9pleX/DTjn/WAmiXDNidAj+
	1rHXb6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS76L-0000000BU8W-0A3y;
	Sun, 07 Dec 2025 05:14:29 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS76H-0000000BU7N-2JJB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 05:14:27 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-657c68a08a7so1790156eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 21:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765084464; x=1765689264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=yphoFExAA6hw9FxEy79Q0Ktooulcc9EkrJ9pqdXEvLG6qOehRXefP1OnRnaNEVNhLc
         Poky6A4ZJdREh/x8eKFnYaZT3857GWvtWxmk8nQFmT1znJ2J2KXWrCdELfW6gdephopu
         4DR+dZ+uYk+4wjI8xgSDnCda9Qtoua7kHAxOWJhA7g/eia6rO3TYCsmskTiHmbdj21k8
         y+DJtXXPhRmrjy9VW8z8q7gS+a2QlJ9arTOWgdp8NmjDXr73SrjMRLDH5uIgcnRWRO3E
         BR/tSfSIUG7CSXrQ9SUIx2CcEDwy/ukbDWA/BzUILDPZWGXKFS/DpDF0zMVq44y42Bel
         5JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765084464; x=1765689264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=VQe54fG5xKtNDkW1hWaaWj5DNDHNvgYJjPbQmcLk1e0Uv/I3zST4Ekw6KSO1p3QteD
         YrYjNiZibJB3lpdOC/ThuTWuuwq67JpkAhCyp+Yyp+K0MHehaMM005YnswgeKroul+Rb
         xS+LVrZbHkMtA3CAUzehlXpI255FZNwMTCxwfvsJ5tjMcoEiZRXI/uSzqGtuQSDpAEqq
         3LaVY02i/UbqTjsGqFONpp0Rxk9x8Gt5f5bOnkYTI4IzqQAOwUngobPwlx+tchSfIjPa
         mOQfnqFy0EECBCk2Zr42BzB1vozyflut/raKw8R+BLK+x+Qh646kvgRl9IWg/ubHng72
         h1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVoHLqXTrkc0So/oTb/k2cLpG+4dhSL5FAv9iMt2XRX6AawhEhqBH/v9WJ+fXZPFNDerW+Igecod60S1iiUIN5P@lists.infradead.org
X-Gm-Message-State: AOJu0YwCoa2D72tN66D9PasfzSInM2uzIe4Su0CNHXWwgkZHqITPdHdV
	Cy6GINi8L4PmcUKpdW1ukRm6m2F5joqudK2nM/4Ahtgf5peJAO+CalWjZvmFD00f831PResY/Pc
	eUlco32bI9BB7EswNe1up/MKKBF9xmtYsVp5ZCXtwJQ==
X-Gm-Gg: ASbGncsy4Fq6bLkr/aSfH5HrP7DN+PxKSd8+7ci/vQGx8x8dMe3WARf+Q4Tz94Jfp5i
	Noat92pXwTi06Bhz8GxCPSVN7LkLZvMDWXQR7tZVkOyoDgezX7G58FqQtsmrgrBCnjdN17sUvPl
	OXqffzw/r90HW46YDC5Eas/EYKx0tiQ5lRkFNLf10B2cLVEUd+0gWN03u4hXFlqP3BXBDINV3ld
	k9dk1ZURyul6+zuAN/fzPm8Jhv2bHv2+TNHFgyoqGO7EULelaKMFUL8ELhSTts47ltyGzFy
X-Google-Smtp-Source: AGHT+IH3teezYiglKMW0l9sCwPDXKzHK/uYMVzLl99zBL+8tY4BEmXzPQzc7f6ucWRYnVm2fOg07KrRcgASdUHrgci4=
X-Received: by 2002:a05:6820:f030:b0:659:9a49:8f73 with SMTP id
 006d021491bc7-6599a973da4mr2018657eaf.56.1765084463840; Sat, 06 Dec 2025
 21:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 10:44:13 +0530
X-Gm-Features: AQt7F2qP99gde5P8lRQoinF2DOSDMpaUpigWBx6hvnDvXPL66vGpk9e2egXMZ2I
Message-ID: <CAAhSdy1cPnxjntaR=cwZqG+oVgFpZKM0rKYAEdkHUCToMvN0Ag@mail.gmail.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_211425_858053_C2822940 
X-CRM114-Status: UNSURE (   8.30  )
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

On Sat, Dec 6, 2025 at 4:57=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size arra=
y
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
>
> Opportunistically clean up the indentation for the stats macros, and
> replace spaces with tabs.
>
> No functional change intended.
>
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Closes: https://lore.kernel.org/all/aPfNKRpLfhmhYqfP@kspp
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

