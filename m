Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F168FC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=; b=V1RIcpf2zne1R2kC07xbjEqtO5
	q/yGBqpYe6IRhg+TGEtw9XgEXGUzsw71dZ3RUPSOynpZkx92s2uCmQxDluIkcNcdrf52NzGguJ5pe
	unEfdTj4rBCo/QAsZDhxZ962Te76g4Q5s2Q6qdC7bGlUNfWBpevSU0I0z1v5WW/wVeAXLVtGJ5CzK
	nRdlJrWdYOKPpGwKCWLVXUrX2DoGnRTDa03jcXiUwsZDqXedns1n1zk0Mh+Ven0S10/yJqyQLC19K
	LXV9KrZ4jSR6jthFy0AkGvH7w7mN1NucglIYW9ovKB29vhfcGvz9qX4Tu4pxkwWoibZyLK2AsZw+S
	1ARgYy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cZA-0000000E8yr-1ez9;
	Thu, 10 Sep 2026 11:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cZ8-0000000E8y2-3nzU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=; b=cjuVZRvTb6onf8fhqkKzPmBfRm
	V+7T52MmqmRukaq3KPFq8a1Benkh6yYRajz7f5436bpuPJ8lY6GzHRR8A1ipFCc4HU3v2P5k6cbJk
	rboIjRKpTaixgdc6jmvcF+0B65Jfa1WNNmfxlTBlYgm1RzWEa5n1eMj099id2SXF60RZUYgJGORY9
	oVCVKedUP26aK4fDl/fB6ZtxjbOojPbGhkaetsfBSHqeXTTYLwukSsCZB5z1T7Nsnb4VegbQK0Xvj
	oPSTicc23j6pVt8nqpF0kpAVHJjOQyGAVXa67hvC4FDn9j4gLPEPOiQakNKitG/u0zlwj/RM4CWf2
	2dpQur4Q==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4cZ6-00000002Mw1-0M1i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:03:37 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so935034a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038214; x=1789643014; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=CleKX0RN8ZNBZbfpMKOitnEuoAq4S4eJ7gG9dkPcBm2+NmlCFbxizYyYF1xNmsrgLA
         QTKjQdYTbVRQ1ZXRkdn/cyZ4np3/731cO1+E9CzmnilEEPEwZWWsU5QwEl++7jHPpDsa
         V9yq8Lpa3AeW04cVbqAZsnd1uqhovVGbAvu7Er0+u0hvsDIoMOR4GOGWRZlf7LJ1oMz9
         XEKwf9I3UHxHegjYwXsf3iD+xi0+y0rXwtJcABQupTVmKLC5mStDBrgA5XXKx/bN8CYJ
         mgeHkYi+IguW24ipWx1FDSK2J3YTN1V/Tjhto0Ehpw4/oYyD464JDiqrVGGUuSlnbq8C
         dA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038214; x=1789643014;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hx87S2Y2VYrsz+ltlElpgYkkRP/rEKOc33NOUB4sPbE=;
        b=p/xDsLn0VBCHLBr9wjfvvVmW2EHyQQ2Nb0tlBJ13jcfyeASkw8AWYLVmwaZFMKxG0J
         USkY/rDPsLzOZuU4Xpy4OeZp2ODTmfNKyJYoUzWPS0EH5MmdUrg3EuPyQfpV8z2WIixP
         3m/3ZF6ylLX7x5SBtoeAlq90Cmre4HDCZNYLtYvu2Z++PRtTlIjRlSw1FHe7/k/lBOUD
         edlxqpRUZ4OBHuWB/6aevsvvEoRbyGgh5Ls4bbR+Kh1al5kyr9pFQdlzZMipi8AIJoPk
         /t72SGKJ+/LOw08riQEP8tB62EYu1RmJNDMwzQFEXJmvFZ5RCjxlVIVr5BtZbECJJ4vI
         DpWA==
X-Forwarded-Encrypted: i=1; AKwUvBx8ui5kGn8HWL7egUSg2tMXdEm8USzbE+jsg8wvmRjhVVfK/G6Bu0gbQiF0PqIlbbYOBYgeJIUs9zryrpfnAtQZ@lists.infradead.org
X-Gm-Message-State: AFuF++nFhfPuZlKC7Q9OybQad+xUMLLpFmoTBjmi0UGIbWLPtc0rzwml
	vtGxBemAkbMKpHz7s8ABpTnkH7XzfoNfpDA+CUxU8lftOykRWNSKa/tc
X-Gm-Gg: AYBFou17SQPpnu3haE+mjqYfT4TdDISYVZctttvx5Y0IeJZxJafD5KzFjz4EB14xhtd
	W+GbtNQW0Lb4uVDhkIa4iSmqjna+1G3Q4nEIDKUD0bnxoxWVOWYT7kPUsZgAc4VjkHQZRvVEQ1o
	45YLFkWBtofb91FMis3+bi6eeVqAZQ2EGJcSpoX8wzWL7xWPf8yIhs+KXPQWDj95FmlQB5X7F7Y
	SNiGR96Hyw2+D595+zWg4Vhh1ihSsPgYMslQ7hwVGloeemR+QXxJyPjldhkqDBNvq0sZhFtsWPQ
	NDesQymrhAURs40DGRQDXn6t6doV+Pv8k9GAhVXCdBfVtJauuUWgScx4wX6y7qanBZmmcFSf9Ac
	ZnpQ4z89xSSCb6Fpaqp9C2DPdIRqqpJlPZj8q0B1Qr8XvZz20JRHgGybi2YsWdKw2VaM5zI/tf6
	m46ubRe0B46fbSiQgzGpIBAV0vbhSObkF36ky28hcjupnVpfKa905iVdABEGuAJu8aNdLrIFoIN
	Z1wiZodpM7YW3u9RUS/IE26b/zNvW4UQmFgry+JlYrNclP+OKABRy0=
X-Received: by 2002:a17:90b:3e46:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39d70a5931bmr11901184a91.10.1789038213696;
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm50133517eec.10.2026.09.10.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:03:33 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:30:42 +0530
Message-ID: <a4pp1icl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_120336_263996_A28F87E0 
X-CRM114-Status: UNSURE (   9.33  )
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

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

yup. Indeed the later APIs will drop the memslot argument from the
main/outer page allocator APIs, so we need to use the
____vm_phy_pages_alloc() variant here. The change looks good to me.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

