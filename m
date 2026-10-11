Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB558CA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7DXiWX6NxhC79YVdqT8qzPDfjmWzZPXCSsdMdToVlU=; b=R3BZi4mBv4UGcRLdl4EP+65fwU
	aLInlfrdJUXycnNXT271UGkXT09XA3tN9dzL6pjq+mspUv95m4JtQypxiqhMCHnagBu9+pfaEd2bB
	kVdTqHBr7fxWFwIYxd9RG+DCrHHpuaLjmdZYKTyYpTdZmtUx+XwMxUQnonqHJy8NNEGmRBrlcvF3Q
	pw2XC9zjHfiNWQqry10BvNlvxSA0dp7RbADV65wha7H9jXLRTKOj6xGB5zianxHBqJ6M2YfrXwzer
	8Id/KQCIkrCKc425b4T/ErJ8YfCe+k5Y/zwFtFR4n9Sjk1kKGCJD+y5aiqqEc/q5z2ibNdsgQLRGS
	NRtYKJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnxT-00000008neR-1pI7;
	Sun, 11 Oct 2026 07:26:59 +0000
Received: from out-215.mta0.migadu.com ([2001:41d0:1004:224b::d7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnwz-00000008nd0-0k6I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 07:26:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zeYhOKLAEK6plYt1ei/97MDQNIKutEUyTKAyLEF+q9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791703584; v=1; x=1792308384;
 b=L4wLziu16213DXMBBhFkLND1yin9VWydReaUre0L8iThcpRM4XOXhJTnUSvc0QhFLWGl9Rhb
 z/vnU+mcKOwOp4nDC9FK5vQmGXdD0o5A4UQMeRLVzXF+8pFqVFCb4KAakRaC5wYGEO6DiylY+Qm
 a6QllLgF08CpCP3ksis5hmDY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 76158bd889af1474;
	Sun, 11 Oct 2026 07:26:24 +0000
X-Mizu-Trace-ID: 76158bd889af1474
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba40832934so2447e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 00:26:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwD9aUXz9lyUWXeT/90yWqhCVruOk8oeVNP6O6kj8X3lSfKYZzc+wXJsuuQfhn1q3bzfDmykFluXxDxk5TDw19z@lists.infradead.org
X-Gm-Message-State: AFq9FYLpXbhLS3FdBrl6XC1DOCIatlnpNm4N/Jy+V8WzDOEvIdNhNBjd
	j0ewPJBtK7X+/6A3tpxWP5wQItEeFbHRLqD1hcJ+NKuQ3tyWQZuj7dAlMdnTj4NA3FqevJuI8eR
	0O8i3b/4njW9wb4pVuL3jz4Sr41Znt4ThQPvaVPrz
X-Received: by 2002:a05:6512:3b11:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcea610359mr46362e87.14.1791703578480; Sun, 11 Oct 2026
 00:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-4-fuad.tabba@linux.dev> <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
In-Reply-To: <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 08:25:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwe73HZ5u3LWgeYjDC2t1n4aLdwF=r-on5hSzCeTg+WPA@mail.gmail.com>
X-Gm-Features: AclHuK-7n7d2SMrcaEI2aS0U2QLkxfWQsDtE5UfiVO1913-p3Vb7V7WrGlc9y-0
Message-ID: <CA+EHjTwe73HZ5u3LWgeYjDC2t1n4aLdwF=r-on5hSzCeTg+WPA@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: arm64: nv: Don't loop on AT S12E{0,1}{R,W}
 with an invalid VTCR_EL2
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_002630_064795_7D5097E1 
X-CRM114-Status: GOOD (  10.00  )
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

  Hi Kajetan,

  On Fri, 09 Oct 2026 17:30:59 +0100, Kajetan Puchalski
<kajetan.puchalski@arm.com> wrote:
  [...]
  > Currently we just clear out the upper bits of an address larger
than the IA size and proceed, but
  > the architecture requires that to cause a L0 translation fault.
Not that it's a particularly common case.
  > That is to say, I'm suggesting something like the following:
  >
  > + if (input_size > 48 || input_size < 25 || (ipa >> input_size) ||
  > +    check_base_s2_limits(vcpu, wi, level, input_size, stride)) {

  Thanks, I'll add this to v2 as its own patch, since it's a missing
check rather than the loop this patch fixes. I'll add
  an at.c test for it too.

  Cheers,
  /fuad

