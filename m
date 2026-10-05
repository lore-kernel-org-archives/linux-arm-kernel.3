Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B28CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sV3EdOxAQTAmg19Y3zgY7THPUvOZZFHhczWUDB6Dz3M=; b=J9fICbd2WXEkZNQFZGWBtNmjDc
	GkxQq7ZxY3Y4/T0bhCPu5kAcPJPSr2WTKVWkrvBdVGvanLyTJt4jvkSSMy0lQ/1l/+wio4vvEKcqG
	7V1nDnyimhxm6TVMDOsHN8aCv4LWLtqZ4QK2Nhl7P0wp6wBA34cHghnkfOR6+XrWohqobTGqQ4X0s
	DTH3VxkvxUYlXLQn70WVF0sD3q5Xhdb9pUJKGmgvZi6/x0OVR0iEx/G0bbnef4v5pk3C5Z21m0GO5
	Egg4jFGu162BsyPvQVS2eH3IdydnQ7KlqCxs5C+y7TCKt7fwyi+y7OZ+vLC05JRJdZwMZtx2XIk7V
	iFKCPXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg2I-0000000GCAB-1UYx;
	Mon, 05 Oct 2026 10:35:10 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg2F-0000000GC87-3E4O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:35:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sV3EdOxAQTAmg19Y3zgY7THPUvOZZFHhczWUDB6Dz3M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791196505; v=1; x=1791801305;
 b=T5zWd35aZXKsb9nyBEGa8vqsR2Fj7FH48neDFVqfCRr7EGRwJjUcqx72PsxraioFx6vnEwEV
 M+mA2i8vYD2jO6FQcUtz6WhIB912b1JHP5+wOwnuBUeG9VTyN/R1hXy3Ml2AVSeOz62xVrmMyJu
 KcitFd8pI+rCbfLHGA/uYk2E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fe68469367a9d806;
	Mon, 05 Oct 2026 10:35:05 +0000
X-Mizu-Trace-ID: fe68469367a9d806
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so4942e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwF0gvdhCrApOqQS6hfIPLqQvvYffvY3Qi4qkjF73z04/8yddVYcZxdmyrkRkyi1HWBjmUEqCwkH0NMp4g+7caP@lists.infradead.org
X-Gm-Message-State: AFq9FYJfS9wxF1ol9dv+a8dwhqh7lJ1cxfC8m8/8Qrr8p6lwO82C7ycs
	EaedzrVNUmI+DNhfdVLU1WL4DFGhmVHdBND5s0N6jWAOUy/ZGU5xnEILLEfrOCTvu9tFkNm/bT4
	4IaNUH1vh0i3gtNb2cxWbye6yi/vO+mJTUzk8YNZ/
X-Received: by 2002:a05:6512:12cc:b0:5b8:c932:f056 with SMTP id
 2adb3069b0e04-5bcb62a9caamr173682e87.7.1791196504126; Mon, 05 Oct 2026
 03:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261005050352.836980-1-fuad.tabba@linux.dev> <asNgQDxNQP9Gll-p@kernel.org>
In-Reply-To: <asNgQDxNQP9Gll-p@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 5 Oct 2026 12:34:28 +0200
X-Gmail-Original-Message-ID: <CA+EHjTw0qZ5DVNOag-8Y_LY2pny3LR8fys0_aFd93m8aYXdTWw@mail.gmail.com>
X-Gm-Features: AclHuK8UjgPmg-ubCtS9kjMFnBw5eJYdkkIlGq56U6ct7MdjZtvLfCs824uH56c
Message-ID: <CA+EHjTw0qZ5DVNOag-8Y_LY2pny3LR8fys0_aFd93m8aYXdTWw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Pend host SErrors for protected vCPUs through HCR_EL2.VSE
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	vdonnefort@google.com, qperret@google.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_033508_223021_742DF476 
X-CRM114-Status: GOOD (  10.69  )
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

Hi Marc, Oliver,

On Mon, 05 Oct 2026 09:30:39 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I thought we had discussed that one before (or am I making things
> up?). Why can't the host always evaluate serror_is_masked() as true?
> Given that PSTATE is never synced back to the host, it would only be a
> matter of set PSTATE.A==1 at vcpu creation time.
>
> It'd be more palatable than this sprinkling of vcpu_is_protected(),
> which really do not scale.

Yes, it's better for the host to always see SErrors as masked. v2 will
do that when the hyp vCPU is created, and leave
kvm_inject_serror_esr() alone.

Cheers,
/fuad

