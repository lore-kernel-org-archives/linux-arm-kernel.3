Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0A6CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=; b=AVJtMGwg1IEvbRMxYli+eCSK7E
	BSeSSFBukryMzmYeamFNeAhU1ZP2yDs9Zf0do9bly1UC+WB4gWKM6yc8Y+F2f8c+xBkrk41UNwEJ0
	v8Xz/KGUBgElIBX68sCN9p1xcjnQ7tf3IAmOdxTu4MIeejNaki07/mILKlygTyxbDvdaST2gtmpn8
	8W/PTohqFoyzmlosBb8rDxZm2xlHBKAuZdwaSmQLGGNDjMx0jxMpiTj83Aw0HuQY0R2akMpQ9Mlw7
	6nAiEWdDNsffukXpeaogqqLZ7FHN7wMgSGzSgc1r04jmT1X4n63Yww1vcwjk5LkglxYuSEVfOR4Z6
	PhUW8v3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXau-0000000EzT6-3j71;
	Tue, 28 Oct 2025 00:29:48 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXar-0000000EzQe-33Ac
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:29:47 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6ce15aaa99so3828368a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611384; x=1762216184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=W2KTpxdBog6wEgizqYtCyy8IeBp9EwKpxA+gvoIg0oZivMIshahawOfTZ7aTsE5+yO
         y7K4K8jzpPg3Qag70h9+DyrlI5MQsNW0V3tHmCCvSMnc3bo9qAFcJtc24yHdWluh4cVT
         GV3m5g3cUQQLDReFpOoYRvGquhHQ2heFoY1B6dUIHNNNnRwGUxOIS+0ZygzzvGh050aV
         VUga1gJzwSwhdz15wbJX/RR29vk3u4nUuZLL/Xld3uT+ZdO5gOQ8TLuHuqWL06uChmR8
         tyK83ZDwmle6MtYHvo1diz029+LGOwm2fBJwu40L0qNpb/aC1Y88xiLlT324upXbCr35
         doJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611384; x=1762216184;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=mxJncatz720l4J7T3Qgkj7lm7axNYGV7fLSD/JdM6Nsi4Wr292SRR6gVnKsqcq26ZQ
         P1EdvkEXAKaI2WfheX2V1ZXIy4JDKQJzlkhcvZlywB/NSezNi0AdeZjufGZsHjahkRQF
         95AlE6O0oCYDJhPwRAXTwNhRrm2Fzj4yfP63qhHmmHudzW1qPWajHatwkY836uWPPVa1
         iDF2KvdnYU4IAPLBxq9hwxpGSx8Poj0wG6spIEu9MpwLLASF1mK12+ekIMFLmYUD0wzQ
         SMwbaYh9KeAzXoRPBsfpefqwbuMAdwcPgjFN1zoN5AAcq2h5qACmbTyUvHcjRrWZuxl+
         FLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeJo//ilPhGBL4OvtQNhGS7dF0DQgp/H4Y0uJh3tJbQnsr65UiS4ECnBr+X1ApR88Zp13O0U9MgfSu2Dn5iEee@lists.infradead.org
X-Gm-Message-State: AOJu0YxJof9sZUngh+/qEkesmwSQLkQAYL224lekGVGa8qOlHDC7UeHr
	1S5Gy5YWylZXXCmpnKVCCan8cdvwgUY+q60im2KX5cYlcDl7oNKz46JhNKSz5vriXbgSTX/GvSO
	Hz8cHZQ==
X-Google-Smtp-Source: AGHT+IEcbPffJX+DPzKHtANj5YoID2qTNS+wCvJIhOFTengBDdmvUTitjaF5SaOhKDAJ4Iu3BAJZiOrVVlg=
X-Received: from pjqc14.prod.google.com ([2002:a17:90a:a60e:b0:33b:51fe:1a77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0f:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34027a0775bmr1898674a91.13.1761611384405; Mon, 27
 Oct 2025 17:29:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:29:42 -0700
In-Reply-To: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com> <aPuqYz3ly5a3__mf@google.com>
 <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Message-ID: <aQAOdiSUktmAJKsw@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_172945_785704_E4A54838 
X-CRM114-Status: GOOD (  20.94  )
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

On Mon, Oct 27, 2025, Binbin Wu wrote:
>=20
>=20
> On 10/25/2025 12:33 AM, Sean Christopherson wrote:
> > On Fri, Oct 24, 2025, Binbin Wu wrote:
> > >=20
> > > On 10/17/2025 8:32 AM, Sean Christopherson wrote:
> > > > Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spt=
e() as
> > > > providing a one-off helper for effectively three lines of code is a=
t best a
> > > > wash, and splitting the code makes the comment for smp_rmb()  _extr=
emely_
> > > > confusing as the comment talks about reading kvm->arch.pre_fault_al=
lowed
> > > > before kvm_tdx->state, but the immediately visible code does the ex=
act
> > > > opposite.
> > > >=20
> > > > Opportunistically rewrite the comments to more explicitly explain w=
ho is
> > > > checking what, as well as _why_ the ordering matters.
> > > >=20
> > > > No functional change intended.
> > > >=20
> > > > Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> > >=20
> > > One nit below.
> > >=20
> > > [...]
> > > > +	/*
> > > > +	 * If the TD isn't finalized/runnable, then userspace is initiali=
zing
> > > > +	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the numbe=
r of
> > > > +	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.=
ADD.
> > > > +	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pa=
ges
> > >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^
> > >  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nit: Is pre-mapped better?
> > Yeah, updated (and then it gets deleted a few commits later :-) ).
> Oh, right, nr_premapped will be dropped later.
>=20
> Since the whole nr_premapped will be dropped, do we still need a cleanup =
patch
> like patch 12 which will be dropped finally?

We don't strictly "need" the cleanups, but IMO intermediate cleanups are of=
ten
worth doing even if they get thrown away, soo that the code is in a (hopefu=
lly)
better state when the "big" functional change comes along.  I.e. if code 'X=
' is
easier to understand than code 'Y', then theoretically/hopefully X=3D>Z is =
also
easier to understand than Y=3D>Z.

