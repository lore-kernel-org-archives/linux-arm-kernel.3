Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E664CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 02:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXhxJQbYpMikTp7H/nAmAzSO0DdDRv2XPs4BDJRfaug=; b=v/rKM4bYBh8h9nrec3mu7/o7TF
	uwdXvwRedwQaCqBmeUrWnHI+Hm2g3Z+QKjvCr+QpIMRv4MVRDs0z3S7DHfak6ZQ1Mf6incJhKwDWM
	PgQClCws2IYUAYJGVYfQpRrrxr78ySoTT65uUKWjL3B+sS6H54mDdVvTabLnnm4KWba+csxqSBOUo
	iWlMAi1HwhTp3ogt8GeDEVp5kNiaNZrQ384IXICMw4xR3Ej8nV5Lc3BByZGfWNnAUrky3XOYxj4xJ
	Jsec7R4r9F0JlShGrDaj5SKJEmBjy8qzW94P13xqUwNaLSTdU9WKHDridugFCYsiRgbP2Znf7DNWI
	X6WNeEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMLq-0000000A8sP-0FXa;
	Sun, 03 May 2026 02:14:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMLo-0000000A8sC-43rt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 02:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65DEB60052;
	Sun,  3 May 2026 02:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A71FC19425;
	Sun,  3 May 2026 02:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777774470;
	bh=WrE0mBieKMvVSSs7pOWhhotigsQi1SiBQNbII0L224I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=luD2NrivuOz6+qE1pSR5XkhLqWFdneRIkn2WNostSMg1HqThOxgRNL6fidSulRf1w
	 mWVdqW89dMACy03eo9Zv08sfjzk2cTvVliKrFCmpttr48ku+GXQ/4sDgompfv54adv
	 pqlh+63F9DHQ4axILVjqOjC1WcUl4Ezf294Yd2ebK842lnMTOyqK3hHu9YxMUDOcnF
	 3Aq6gDSUe14G8y74tGXSpIAOXGmQcxNsFuVsVBHy+43Y5fX3GqQ/cE4WSlhosPkH1z
	 u+TA3dOa0WmhNZjayRyBJGTMgqRsPaB4toy1GvGAV4tRi9lCTCAiQ3S4pR7I+BpLIk
	 wf38VcnjgXhqQ==
Date: Sat, 2 May 2026 19:14:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
Message-ID: <20260502191427.34048082@kernel.org>
In-Reply-To: <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
	<20260501155421.3329862-12-elder@riscstar.com>
	<20260502094559.15c3f479@kernel.org>
	<649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 2 May 2026 21:06:33 -0500 Alex Elder wrote:
> > drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >    541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
> >        |                        ^  
> 
> Yeah I think I noticed an error like that shows up with 32-bit builds?
> In any case we didn't see it during development, and we'll make sure
> <linux/bitfield.h> gets included.

on x86 it hits on all configs, I suspected you're building for ARM?

