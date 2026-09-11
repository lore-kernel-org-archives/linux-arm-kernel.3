Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58EEC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az/NxtCPN5f+uh79/JU435f4UBkD9edmgjDV71q7HaU=; b=PsOdMR853TaYDxtJckPtMeSuh2
	9jufPSGtvfwtYd4KWBqSSJ99sdDi3ef1kth0izlyp3QCBMWEgqEC4jusTqRL7nQrKNBV3DOEUE8sO
	Qe0Qbnm/npTJTX7+6AdJlY7sBu5jzz8ugNJ2iwhfzn3uG79OOOUDC7PaEbeoDMhb8BRhkz1YWTsCl
	FsPMFBmcdbVw1HZLlEz57WlX+T3aHY5mk298n6OeHN2Gc7/UbU0gAiuJELwHycCAvwTBulDxWZFvx
	Gy9z1Y/OVRr0By7oYbAnDvqg7ACaa2p/Mol3t8f2vwhBA+q+3aycC2YRLn0lRgW+Z4qdT3sQRQ24n
	KaqslJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4u79-0000000FtzZ-0Ien;
	Fri, 11 Sep 2026 05:47:55 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4u75-0000000Ftyn-1G8f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789105671; x=1820641671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NX/0FxXyFfQZUAmTs3a0stKu2eAXVAkDkn+OMUSpgxU=;
  b=VNb8VYn3FCR/csHptIKvSOPLjvI/AZ/JAwPzVaL9B14/BmCx1U0RIJ3y
   uoZ4DKTo/L6/84kjDDaknG2EwVYAWLvj9RNdyzhNwGRnCyrEo7z3QNau5
   +xut3K7tRZgZ+TRLolKpk+lHF0LEsCXp5k0yU66KJteEPFvPCHVAFsOTk
   t5G+oEvFDpLr/eQtdIbmyGpNuefk/qD4KG71xg0F8gcvDYVkQ5COXDdvt
   QrodbFOcqWJGP1AY1TL/3FZKf848VTZDOgTMW7Bog4X4k/cqeL0KI4g+G
   4Qag02RAllvRUS2D5w1w9lXuDQ6B61OuOfBM/L33awUcfQ07jksEGgMct
   A==;
X-CSE-ConnectionGUID: BnCaGTpcRdSrz47InrBjNQ==
X-CSE-MsgGUID: r+seyCG1Q++62TEr2yKaAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="254202283"
X-IronPort-AV: E=Sophos;i="6.27,96,1786978800"; 
   d="scan'208";a="254202283"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 14:47:49 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 049221C1C706
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:47:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AF79B92674B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:47:48 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 216CE829F12;
	Fri, 11 Sep 2026 05:47:42 +0000 (UTC)
Date: Fri, 11 Sep 2026 14:47:40 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, oupton@kernel.org, tabba@google.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, will@kernel.org, ljs@kernel.org
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <aqOV_NFeTuHWFBVP@sm-arm-grace07>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260902163500.1841671-1-wanghan@linux.alibaba.com>
 <877bl26aqg.wl-maz@kernel.org>
 <wsnf276xrun3g4hjr3t6alprapctg5z4kpj422v3hujqdjnrsa@swq4blkqvvj5>
 <46342b48-550e-42c1-9d9f-e800c72269c2@linux.alibaba.com>
 <874ig55u5h.wl-maz@kernel.org>
 <f2357ad9-ece1-4331-844d-5911baaf571f@linux.alibaba.com>
 <87o6ea4q67.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6ea4q67.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_224751_832670_FBCFB0BF 
X-CRM114-Status: GOOD (  14.96  )
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

On Sun, Sep 06, 2026 at 11:42:08AM +0100, Marc Zyngier wrote:

> That's an interesting remark. I guess we could add some extra tracking
> for that, but let's see what we can do about the above first.
> 
> I've hacked something together and pushed the result at [1]
> (compile-tested only). I'd appreciate it if you could put it to the
> test with your setup.
> 
> Thanks,
> 
> 	M.
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/unmap-vmall

On Neoverse-V2 though, with NUMA balancing on, the WIP kernel from
yesterday brought up the Ubuntu 7.0.0-31-generic kernel online
without an issue. I will test the host kernel again when the new code
is merged to kvmarm/next.

Thanks,
Itaru.

> 
> -- 
> Jazz isn't dead. It just smells funny.

