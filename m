Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEECC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHYVCFiiv+rPCbDKAvXqRfQ7fVG3QYgFfMC5KpRE4C4=; b=kTjjy14Y1fS0tO6k4rTbM8vpZy
	KhG2bcNPSH1Yr/2qTjArmbSdpm8Eg14SR3dcNLpWrmZ4ZwAETvUxK07cbicPOjHDKV9/DsY698H9W
	Oo0t2JluR7/bvMEAB/iq0zFzPfMQDMLAP8qQP/+xGULbln62F5oO/dh47vaDeremlG9sAAOCkHvjC
	X+CuTv1F3H/bU4zxMVarHFc0tBG4/VrTnG5rC7fJ37cCWuhZUhX9rvcNVnP5rMRQ+0C642G+Tnilb
	NP7lT4IAPbUPtMXl2gi6g0eTf3Kf0hrI5nhD3JooS1aKEvMSnDcoKIrMp62jlrc6v1HjG9T8enXCz
	CpBTqh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsVE-00000004MDi-0oTI;
	Tue, 11 Feb 2025 15:48:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsT6-00000004Lqw-2P7k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 15:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FD71A407F6;
	Tue, 11 Feb 2025 15:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B98C4CEDD;
	Tue, 11 Feb 2025 15:46:34 +0000 (UTC)
Date: Tue, 11 Feb 2025 10:46:38 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, oe-kbuild-all@lists.linux.dev, LKML
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Mark
 Rutland <mark.rutland@arm.com>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH] arm64: scripts/sorttable: Implement sorting mcount_loc
 at boot for arm64
Message-ID: <20250211104638.0cdc51e1@gandalf.local.home>
In-Reply-To: <202502111626.K7CTghCR-lkp@intel.com>
References: <20250210142647.083ff456@gandalf.local.home>
	<202502111626.K7CTghCR-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074636_677615_7A62BB97 
X-CRM114-Status: GOOD (  11.75  )
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

On Tue, 11 Feb 2025 17:07:13 +0800
kernel test robot <lkp@intel.com> wrote:

> All warnings (new ones prefixed by >>):
> 
> >> scripts/sorttable.c:306:13: warning: 'rela_write_addend' defined but not used [-Wunused-function]  
>      306 | static void rela_write_addend(Elf_Rela *rela, uint64_t val)
>          |             ^~~~~~~~~~~~~~~~~
> >> scripts/sorttable.c:287:17: warning: 'rela_addend' defined but not used [-Wunused-function]  
>      287 | static uint64_t rela_##fn_name(Elf_Rela *rela)          \
>          |                 ^~~~~
>    scripts/sorttable.c:294:1: note: in expansion of macro 'RELA_ADDR'
>      294 | RELA_ADDR(addend)
>          | ^~~~~~~~~

The above isn't used if sorting isn't enabled.

Looks like I'll have to add some "__maybe_unused" attributes.

-- Steve

