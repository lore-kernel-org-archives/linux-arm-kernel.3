Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3DCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=; b=DTPbBnlTW/roTQi7vCsZXbnY6v
	pZD81dihXl9OYdUHCeqyfCVJFCfyb1CNNKMmR+T3Haqzmc9DE1l1zjLgDu115x5IVpzeapUd/3Osy
	lom9PD6isI2Kgl6/IgLl0cguybwj3w1NbaMk7AWK0qIk1+mVWlM/vfTFwwSojDBOOI/82yjvLgJOU
	1peuCl6u1fCkTBp64bB1aWcjUtxv9xSBxKTZe6yePnCo7BQXriCHPjF81ZZhhpuRlONSKC1zqxnGy
	IeYbc+YwoV2C6Sc53hQFHoHRkPQSGXPGku1quX6N5XNa+wxozKypABZX3umevF14f/1K3Q1kS9kmt
	irmpjjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDdF-0000000349r-3sTe;
	Wed, 26 Feb 2025 09:23:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDYz-000000033KG-0ut2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=CdWAKyUkEIjq/IPqSUZRmLVwDfatvzwKCr7gf6kmeTe7fF1yQCimXPAKZ8hUWC0Wgr0qsN
	I1clgmnGYg/ritE675SJF6ixih2RETCZVqIqMiXth4sM4UhJLDiWGkNOjUVQQEdqoGT9JZ
	lZUe9bJx/yF2R2oUIlXQ3cu7lbiT5Xw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-QOM2bIedNpatVtgilyLMmA-1; Wed, 26 Feb 2025 04:18:39 -0500
X-MC-Unique: QOM2bIedNpatVtgilyLMmA-1
X-Mimecast-MFC-AGG-ID: QOM2bIedNpatVtgilyLMmA_1740561518
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f2f438fb6so7487802f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561518; x=1741166318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
        b=Nddtx5DkM7vp0UUTMIo7K0LSTlmDEyfBTn6yX9UTKP6stpSh7AzSwaaBPsP6DgT2mt
         CvhJyTeN23E6A4EMUoFbACOsh4bwe2gjxXY05t3T3F5mSO+BwQ5GaTtVfgx5Vmz6g7Xl
         vaOXeE2lulyt3Apy3vRYYLM2qzdnx/SSpyGhTPYcjax2dTEV8PzfCJYG9TvjHEox5GzS
         5MVKp0ltX3atMrrGavemuxV8Wbg1Ody1iF/Sngq4BGRiguNFLUDf7ldFQ/qyz/bnE3xB
         5VZpRCMGU0a5TJiSufIqg3hTEyqgjk1YmwTn7ZfrphV//u1PeQgtHF2cOUiSxMNpBigX
         DWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs2VXm5jLravfn7PeGijloNb3AUWw1v4cJ868MuBNOqmhnf5Sw4Xn4MLFdthzTeX7sCeampoWv6YAuI9Yg+KEe@lists.infradead.org
X-Gm-Message-State: AOJu0YxDOg5CsLrU/2TFpdwxlTJDHqBU+D3tzPKzkTW5K3/AaJunMatk
	JXQtsko1PuNsEYfq/372V+q9ahdF9eVrOv1YRTbc/vFHfd8J3zS0x3bO3m/kibQW/KmDBVEoF/s
	DRI8RZjJH8f0IvJXXggG1sVz6SoHlvSz5kMBKhP7I1XE9r+jDAigLIp23i0g7kuOmwPRlC93mU3
	Mz3oFoLS8xfXG1afdM2jBny50j5LnioLiH7lxUt0P0IFj9wOg=
X-Gm-Gg: ASbGnctzJkcDmgUyyza70GZasuD97YQA2k+aOVU/DP0UZzkAir2+l7+U568dlfttpsA
	3wq5DePtgxY7C6p71CnXMR8pCpu1DoicpSwj9GFx3W45WLSRJhM26sJlRbrN8KFREYnrG6ITYzw
	==
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id ffacd0b85a97d-390d61cc85fmr1296760f8f.46.1740561517829;
        Wed, 26 Feb 2025 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8QJcltKK3icbvaiTIyjEom27+uMjjmS3V6slM8kbmQaHs57lufLQIp1ODz/r9AND77qyPMNyl+BQOe7Hd40=
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id
 ffacd0b85a97d-390d61cc85fmr1296733f8f.46.1740561517436; Wed, 26 Feb 2025
 01:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com> <Z75f9GuA9NfKo37c@google.com>
In-Reply-To: <Z75f9GuA9NfKo37c@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Feb 2025 10:18:26 +0100
X-Gm-Features: AQ5f1JqpfKleIgYhNDBuhYOTkE7mUvo6hlKxjC4ts72PAS8Q4WmxhhjJCWdlkGA
Message-ID: <CABgObfZWqBm089dkOpWwX-d6Bgp84zP_0Gow4ow7ZKHov=8oxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: grQ9KqEoQrqKuc27VqfFIS2C5dbmmX55kAmEFLCsSMI_1740561518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_011845_419734_4B9F504C 
X-CRM114-Status: GOOD (  15.28  )
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

On Wed, Feb 26, 2025 at 1:27=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> > On 2/25/25 00:55, Sean Christopherson wrote:
> > > Free vCPUs before freeing any VM state, as both SVM and VMX may acces=
s
> > > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that n=
eeds
> > > to be kicked out of nested guest mode.
> > >
> > > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destro=
y was
> > > called") partially fixed the issue, but for unknown reasons only move=
d the
> > > MMU unloading before VM destruction.  Complete the change, and free a=
ll
> > > vCPU state prior to destroying VM state, as nVMX accesses even more s=
tate
> > > than nSVM.
> >
> > I applied this to kvm-coco-queue, I will place it in kvm/master too unl=
ess
> > you shout.
>
> Depends on what "this" is :-)
>
> My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master

I meant only 1, but if you want to have 2 as well then that's fine too.

As to kvm-coco-queue, based on Yan's reply I have 1 (of course), 4 and
an extra patch to move kvm_x86_call(vm_destroy) at the very end of
kvm_arch_destroy_vm; I'll post everything as soon as I finish building
and testing.

Paolo

> rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on a=
dding a
> few more cleanups (though I think they're fully additive, i.e. can go on =
top).
>


