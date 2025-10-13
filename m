Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4ECCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UooLLT2+k2eSFbtbDCcP/1aILrtCbHtbgr4qP1OaIew=; b=yQYWPNGkF/e4knAbwZUCh281YY
	BlLCADkij99cjab0wA0ueKG2ae3JiegjopudG/qVy4od1ucZVtbFJQJNMgdJhD7q41DJZfHJ46Bnt
	mPDTDvxd2xS3obZvPeGsbgnavkuB8D/PfVCyAhQTlCijNJPUUa466b6t0lZCedPjgeoSm6yDxkfWu
	IU7G2RKDpQDmIBBAsLzswxFLiOYognyYh19lus/cQfAw+XqpW0HxvFR51tnmhevSIF0uC8CuSoF0N
	BtmxR3fuUwuXam2pj2crBpQ+RfglZ/znH/rOFRpCNQCi5qiCiOJrCWLjmA4N4wjTLHQbrFo0wS60i
	F+qmpzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E9C-0000000Cdls-17QD;
	Mon, 13 Oct 2025 08:43:14 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8E9A-0000000CdlX-0otI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:43:13 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-635401a8f5aso4450659d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760344990; x=1760949790; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UooLLT2+k2eSFbtbDCcP/1aILrtCbHtbgr4qP1OaIew=;
        b=bTqHaQE3s3DJtOuULCGMbVSKnVuCAIOn7xOZkR/3rBomZZnjwth4jYCaOY6+Rg7OFD
         Ye5pnlbMoX2uII0qNrcDYr+ZJfw1oDPo1nwKBzjhxeRLjDDFBYMKPMezXi/qrfOM68Wx
         62Q+ukDquTFA1GcL2O10uEMOcn4LulKkrLnOjpuLJO7eRoQbc319x+Pi/oFSYZ35xO0W
         YCr29871iuEencNWga7q+ppOkEfDhpgc7AyhoO0NwfawJDYbmBADISP0cXBsdZcuDiSh
         +VmbYb88SG+1isq909n2ij7z1USLpurxcbWHXVD0Iv+8B2QxpMadkKyBKiGHHX/8CVG4
         S+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344990; x=1760949790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UooLLT2+k2eSFbtbDCcP/1aILrtCbHtbgr4qP1OaIew=;
        b=PFBtyTsoi8xy9amWDFfSZ3+gnY9vO15Kr5dYnZVH9yJoLczwnSpZKd0tLVYIpHeAOd
         TRrjOSkUKyMqNodigda6TPVv3RMupDskwNvFWm9TquCZXqj4lC/cYIqYtFGfystQh8JL
         ZVUswHO2FEuL0eBDgXAPbmX9pyFN1AImf9ReU0/6By1lohWSK5k+EtE4zSnb1NL0yLNu
         f9tSC6AiTHuIPdMB8aOuFgYGn2jf/oNRV4sCPbW0bQjEQ3OCoJtjhMTWOTAK/GsyAiP2
         aH+QvXjdar9HH1lZNkLbddZjZfTQKelXA2cD5wKtvkd9bLYZ03aQKNom7/NCJmsa5ssl
         acKA==
X-Forwarded-Encrypted: i=1; AJvYcCUriqYBwepFeptYFM3/KmA96s8B6BuSq1Lb0nXt6x50XY6cQo+ACbOmzWtL/V0RzZJDYg+4F6uzV+Uz79vkOBVu@lists.infradead.org
X-Gm-Message-State: AOJu0YxtD83HRMLexOaQ7Uncoh9hZsAOZIvR2Q2jIuQWF/tw0+vob8cf
	CEdiD/M0RhQeghSLocDHPNHuNDKT2VJrsqeRkKaD9q9at3dj3qrEOBN0qN57XNeo32Xu/cLq0Ge
	WcEyYRUgbIqh9/ugeWPdZuNP202MZ2wY/tjKb5JHvpw==
X-Gm-Gg: ASbGncu1ui9blJMkiUDcN7aLQHDs1zBqoGyuMrUFcrV/bOh6wjXhdpstks+KAG+5Z0A
	0tI62xzYcl+XxeWzqrpORQtRCoVKntWHs5s7F5Uf/dticmsoJY7wph0ug4wjZxvz9pT8Y5RS2VX
	nFQsD5sG5uJfRin/J4fTSwxnEFO4+EKj+1ZnsXmsBZICGHuWzFB4O6D9xShJwkiw8WT7Lru7htG
	+XNFd6NnOJhbHvrAlSJsQHTjYPxIpqN6N6IkZSeNw==
X-Google-Smtp-Source: AGHT+IE7uecq6exgG9yMGFshaWnygPzsY94kaUydCSOH4t9VdYDMHhDCY7COXeGCW6oHpXyDu6o1jQTLE+lL7DHhfJY=
X-Received: by 2002:a05:690e:1518:b0:63c:f5a6:f2de with SMTP id
 956f58d0204a3-63cf5a709e0mr7250059d50.64.1760344989651; Mon, 13 Oct 2025
 01:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net> <86v7koxk1z.wl-maz@kernel.org>
In-Reply-To: <86v7koxk1z.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 09:42:58 +0100
X-Gm-Features: AS18NWBOHqaPdVaNAQm6HnqE3sDpKzQQpa3lWt1IHGAjwjcmIhabHOei0Ckzxt4
Message-ID: <CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
To: Marc Zyngier <maz@kernel.org>
Cc: salil.mehta@opnsrc.net, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, 
	jonathan.cameron@huawei.com, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, james.morse@arm.com, sudeep.holla@arm.com, 
	lpieralisi@kernel.org, jean-philippe@linaro.org, tglx@linutronix.de, 
	oliver.upton@linux.dev, richard.henderson@linaro.org, andrew.jones@linux.dev, 
	mst@redhat.com, david@redhat.com, philmd@linaro.org, ardb@kernel.org, 
	borntraeger@linux.ibm.com, alex.bennee@linaro.org, gustavo.romero@linaro.org, 
	npiggin@gmail.com, linux@armlinux.org.uk, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	gankulkarni@os.amperecomputing.com, wangyanan55@huawei.com, 
	wangzhou1@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_014312_250137_7ADEC3FF 
X-CRM114-Status: GOOD (  20.27  )
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

On Thu, 9 Oct 2025 at 14:48, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 08 Oct 2025 21:19:55 +0100,
> salil.mehta@opnsrc.net wrote:
> >
> > From: Salil Mehta <salil.mehta@huawei.com>
> >
> > [A rough illustration of the problem and the probable solution]
> >
> > Userspace reads of ICC_CTLR_EL1 via KVM device attributes currently takes a slow
> > path that may acquire all vCPU locks. Under workloads that exercise userspace
> > PSCI CPU_ON flows or frequent vCPU resets, this can cause vCPU lock contention
> > in KVM and, in the worst cases, -EBUSY returns to userspace.
> >
> > When PSCI CPU_ON and CPU_OFF calls are handled entirely in KVM, these operations
> > are executed under KVM vCPU locks in the host kernel (EL1) and appear atomic to
> > other vCPU threads. In this context, system register accesses are serialized
> > under KVM vCPU locks, ensuring atomicity with respect to other vCPUs. After
> > SMCCC filtering was introduced, PSCI CPU_ON and CPU_OFF calls can now exit to
> > userspace (QEMU). During the handling of PSCI CPU_ON call in userspace, a
> > cpu_reset() is exerted which reads ICC_CTLR_EL1 through KVM device attribute
> > IOCTLs. To avoid transient inconsistency and -EBUSY errors, QEMU is forced to
> > pause all vCPUs before issuing these IOCTLs.
>
> I'm going to repeat in public what I already said in private.
>
> Why does QEMU need to know this? I don't see how this is related to
> PSCI, and outside of save/restore, there is no reason why QEMU should
> poke at this. If QEMU needs fixing, please fix QEMU.

I don't know the background here, but generally speaking,
when we do a CPU reset that includes writing all the CPU state
of the "this is freshly reset from userspace's point of view" vcpu
back to the kernel. More generally, userspace should be able to
read and write sysregs for a vcpu any time it likes, and not
arbitrarily get back -EBUSY. What does the kernel expect
userspace to do with an errno like that?

-- PMM

