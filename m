Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64673CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=; b=S/U0rgpYIHjjuYLbamnHjLoPWo
	sU85K9G/CT+KlNRM9u+i1NPS/JySQL01NnmYkF/8osctcdhDqy2pji7fkA+8iqlG861eI2Pl8rwXg
	AKp3P3bC904ntCTj+4rhFLHQhc3sFF/0TKkHc3UBT0GgqTp8mYLH31mp32P/1767GOrSu379bwssd
	YSk4CYHPD/LUt4ScBWVxPGbvNYyJlMqCquQOVziJBAeUNTeg4H1q+nK5tek37DOHgnotOGbG8Z+Re
	cRAGLvw/6Ls/QNWoZSLw94B8TW10jHsbEo94cCFOE7a+EJIBUc5R/6YISugk01+JXjLq+bgYfq/W5
	M9xFLmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXi0-0000000Ezyq-3mAj;
	Tue, 28 Oct 2025 00:37:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXhz-0000000EzxV-06kI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:37:08 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33da21394adso5095042a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611825; x=1762216625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=x0J9Gv7No9QFvSn5UWnIJcTpz4HiL74KpiW9aD2Wxt0SncFIg2C97hW0RxJXqaJe1k
         RHo0dDok6A51buDGSwcoVuCXSuHR06i4y/devu6jOJ0tBD3IAVtJdWB8ZP33QZrq2BiA
         Yn88a/TeP/MwECU3EtwYMS3sfGRJaG1wgqu2iOYDJ3IIj0kJvZXSRCdfBz0t3ZofeFmy
         ZSf5NZ9jH7DpE0efEwEikKBan3W2ecq34yOplfeIQEPbQ8CTkllKqTIHc8G5yI/OjgvO
         RjS4ob9TfEKCdeqwWxKC79qzcDcAC/Hk3xKPnBgXMSmPpO8b5bB3X/X0Urmv7Ta8TMOF
         zYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611825; x=1762216625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3mxOKer4OGfyDxlfqvGDsZ/A3KYgtdet3LczK0ONqE=;
        b=cNll1mEnBFfTBdL/NcC/9lYCOr5VLiyUGAWT7Uh7kE0P5uaWtDjhZEQUr/TG1btGKj
         cFjZIX2zvxPNcMYt0OXvlxGCCrjQvof62lm17Ai6y6OPNR2VDDyZrjLSuOGFIhIrXTpm
         wZkNHsYW9S3wSW8be2Uu2eXdwyJswfoiHO+QCriLKpHPPbpXk66A3A835AdGmiVWIbHH
         8BWIU5Sy94C2u/RCaBNNTKPv6Kt8mu/hedJMwcj2j8/oSpP+FSZTbjUxsi52REtSrZmR
         hJyaxKTB3sW+x4dYMwJEfv4bQ2fXy8BV+qKW2YTTaAcjBETJov8zqUumMRisuaP0SgsJ
         ek8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2rPlZi47rq/WVoNo6am+vvqGQMfz4XWm0PSTHNIf8jCZpeYJ+mBCbTOk5GkhuSmEH7Uqy+KGbKyv3Y7gRE/9b@lists.infradead.org
X-Gm-Message-State: AOJu0YzVghI5g69D/VmKE5bz0u53Ov4BWDNM+BwKd855LlMKhR9bL1/E
	zJXS7Yll5PO6xXN+vzhlQU5j/p7HAecT0VtHqndQ50qKcW59KrhbH2Ju+l75SKi7Vi1qAszrblg
	BrTfwqA==
X-Google-Smtp-Source: AGHT+IGoxyiEdJHjsguM4HhfYAa3a3WGl9IwGzua+OMwKu3+3dxnKcX9NeqRP2yYPcwFhiCcHGTefjSDvqI=
X-Received: from pjcc13.prod.google.com ([2002:a17:90b:574d:b0:33d:813f:6829])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5241:b0:329:cb75:fef2
 with SMTP id 98e67ed59e1d1-340279e5c84mr1590788a91.3.1761611825209; Mon, 27
 Oct 2025 17:37:05 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:37:03 -0700
In-Reply-To: <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <55461c549803e08db97528127c29e092c597adc5.camel@intel.com>
Message-ID: <aQAQLzxyGFooGtNV@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_173707_081063_7D01B5C4 
X-CRM114-Status: GOOD (  19.31  )
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

On Tue, Oct 28, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > @@ -2781,8 +2827,6 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *ar=
gp)
> > =C2=A0	if (r)
> > =C2=A0		return r;
> > =C2=A0
> > -	guard(mutex)(&kvm->lock);
> > -
> > =C2=A0	switch (tdx_cmd.id) {
> > =C2=A0	case KVM_TDX_CAPABILITIES:
> > =C2=A0		r =3D tdx_get_capabilities(&tdx_cmd);
>=20
> IIRC, this patch removes grabbing the kvm->lock in tdx_vm_ioctl() but onl=
y
> adds the "big hammer" to tdx_td_init() and tdx_td_finalize(), so the
> tdx_get_capabilities() lost holding the kvm->lock.

Ooh, yeah, nice catch, that is indeed silly and unnecessary churn.

> As replied earlier, I think we can just hold the "big hammer" in
> tdx_vm_ioctl()?

Actually, I think we can have our cake and eat it too.  With this slotted i=
n as
a prep patch, the big hammer can land directly in tdx_vm_ioctl(), without a=
ny
change in functionality for KVM_TDX_CAPABILITIES.

--
From: Sean Christopherson <seanjc@google.com>
Date: Mon, 27 Oct 2025 17:32:34 -0700
Subject: [PATCH] KVM: TDX: Don't copy "cmd" back to userspace for
 KVM_TDX_CAPABILITIES

Don't copy the kvm_tdx_cmd structure back to userspace when handling
KVM_TDX_CAPABILITIES, as tdx_get_capabilities() doesn't modify hw_error or
any other fields.

Opportunistically hoist the call to tdx_get_capabilities() outside of the
kvm->lock critical section, as getting the capabilities doesn't touch the
VM in any way, e.g. doesn't even take @kvm.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1642da9c1fa9..43c0c3f6a8c0 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2807,12 +2807,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp=
)
 	if (r)
 		return r;
=20
+	if (tdx_cmd.id =3D=3D KVM_TDX_CAPABILITIES)
+		return tdx_get_capabilities(&tdx_cmd);
+
 	guard(mutex)(&kvm->lock);
=20
 	switch (tdx_cmd.id) {
-	case KVM_TDX_CAPABILITIES:
-		r =3D tdx_get_capabilities(&tdx_cmd);
-		break;
 	case KVM_TDX_INIT_VM:
 		r =3D tdx_td_init(kvm, &tdx_cmd);
 		break;

base-commit: 672537233b8da2c29dca7154bf3a3211af7f6128
--

