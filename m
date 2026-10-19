Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AA6CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDrRA68z4KEoh0nLY8p9SGTNzMPGLXG3eVIgxlhGRgs=; b=xClXoN6uinn8OBkOb0ySuP21hq
	Bjb1SiP1u7YxZBLcu+C4Nh1/fRbTmzBQ6OyXKT03feJaAa0DOzoREAj9MVUsnB+ry8s50ydiuRJOM
	PGj1abIWDRtf+2d8+g1+8NtnM/eDV+hSp233JvyxxCaO6F1azQVO9BC+BVMZ4vYWy4VNLxM0WCqCu
	SHOMmKLI9v3CUqr4efHT+2hsMdWviGgIRPkoLNBQRaFngwj0BOuk/a89louu4jzrGJJ62iOXygR+v
	iOJBphtA7WeLiyKt7R3qvkKbFm+An/FzrtovT7WMTfGocQy4xizhK7ocR69LMk8jO2PdpDcdHdB78
	Hvh8iPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlmb-00000007JR5-260i;
	Mon, 19 Oct 2026 11:44:01 +0000
Received: from out-88.mta1.migadu.com ([2001:41d0:203:375::58] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlmZ-00000007JPs-13AC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:44:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EEqi+37BMeU0EiUbFlxcrBA6Sxfs7ueAIK77z1KnAV4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792410236; v=1; x=1793015036;
 b=fB7SHMkm3uQNSY0AhU+GGqTiFGjrM2oSEEEGj2hQ23XpHLz3erPPHMs51KzLpyypqTYdsPJI
 YlKdO5QueIwFOp0E2ZJMoO25cReHDpg/EUZpwMrTBFXTcx6+Hy5K7dpzxexfKLdGXtnh8LuiR9R
 oD5vVj8f+B2197vSA+zGg9Tw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4431c74f09494a35;
	Mon, 19 Oct 2026 11:43:56 +0000
X-Mizu-Trace-ID: 4431c74f09494a35
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Track physical CPU number at EL2
Date: Mon, 19 Oct 2026 12:43:56 +0100
Message-ID: <20261019114356.3528307-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <86y0buyo5s.wl-maz@kernel.org>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev> <20261014125510.2928306-2-fuad.tabba@linux.dev> <86y0buyo5s.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_044359_430112_FD968A9E 
X-CRM114-Status: GOOD (  11.66  )
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

Hi Marc,

On Mon, 19 Oct 2026 11:34:23 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
[...]
> > +DECLARE_PER_CPU(int, hyp_cpu_number);
> > +
> > +#define hyp_smp_processor_id() (__this_cpu_read(hyp_cpu_number))
> >
> 
> Do we really need this? I was hoping that TPIDR_EL2 would give us a
> way to compute the CPU number more or less directly, without having to
> maintain per-CPU variable (which is pretty backward, when you think
> about it...).

No. There's no direct way from TPIDR_EL2 to the CPU number, since
init_hyp_mode() allocates each CPU's hyp per-CPU area separately, but
patch 2 can do without the number. I'll drop this patch in v2, and
patch 2 will keep the last vCPU in a per-CPU array indexed by the VM's
table entry.

Cheers,
/fuad

