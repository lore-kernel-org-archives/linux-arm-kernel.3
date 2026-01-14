Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F4D38FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpY4ha4kYUq4avSRPWQzXtscZ3ysrRlY5UJHAfMVqZs=; b=iXOHbl3cBZQaSoGxRe39TbIwf3
	CBN3dxqMyeFkwXaX62thLvGH3/XGCLFOxKfnWPHl4ABnoSwOk/hHqokpeVX9Jht2LWUywzHLo2xuN
	BNbFIwF8dRR/eEzko7qdpuu+pA+Ns3dFiE2iUZSYDzWnksyk3UdBwaDXo9n4ZpM3WGSXrjUMOehRh
	DOlTYk0ceWIbOQRMCaJfW2ZoAAsIoU+NtdHjXIPtgVi+rcpPA6J47IXPbFXhzwXM9x47PSQoOA2Co
	jtF8R48lnSDN0Hln46gs0HG5HVHyoA96bR8f9SmMOTlWANoCBbogMENrF9jlNb0K2rECHc8FGPYSe
	IZWXDXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46A-00000009zcT-2KgV;
	Wed, 14 Jan 2026 16:51:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg469-00000009zbU-0mTf;
	Wed, 14 Jan 2026 16:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A16396001A;
	Wed, 14 Jan 2026 16:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6F5C4CEF7;
	Wed, 14 Jan 2026 16:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409516;
	bh=yB/TEwjeZj76CFSPXcigHhXplmVJWILyO+nteFdd1iY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UOdkPBoDeaPWlCOlwlGuYiojKezsUWwMSocBQ1uS1ger1x2nCWG5DK8/lPuYf+cmJ
	 vMA2zQqOVQot2SbaS15P2WMosdMskRAZi9HgPBH82L3u8mSf1PLX59hoJp12AX7yyc
	 e43LDHSDoWqP9la/M83rqsTjfz8gKECGw8DvWsfy610TmCtu0xfOym3GhEf/uZA8j3
	 C5+Fzsd0YQL0nwhOBp864dcPnVAf90XcJ/rXlcvE2SqYOK4g+H7bOKXfAyWCpbvjAO
	 52+2Le4XEB8k/DftUcQw1mJkGj+FEPgXfoGd8m2+aJZ4WV0r2j7GwXVsklPFnzQH0F
	 g3Mbel+wpaWaA==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Glanzmann <thomas@glanzmann.de>
In-Reply-To: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
References: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
Subject: Re: [PATCH next v2] phy: apple: atc: Actually check return value
 of devm_apple_tunable_parse
Message-Id: <176840951359.979558.10661452762725106563.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:21:53 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Sun, 04 Jan 2026 22:56:39 +0100, Sven Peter wrote:
> Let's actually check the return value of devm_apple_tunable_parse
> instead of trying to check IS_ERR on a pointer to the return value which
> is always going to be valid. This prevent a oops when the tunables are
> invalid or when they don't exist:
> 
> [   57.664567] Unable to handle kernel paging request at virtual address fffffffffffffffe
> [   57.664584] Mem abort info:
> [   57.664589]   ESR = 0x0000000096000007
> [   57.664595]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   57.664602]   SET = 0, FnV = 0
> [   57.664607]   EA = 0, S1PTW = 0
> [   57.664611]   FSC = 0x07: level 3 translation fault
> [   57.664617] Data abort info:
> [   57.664621]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   57.664626]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   57.664631]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   57.664640] swapper pgtable: 16k pages, 47-bit VAs, pgdp=0000000b4391c000
> [   57.664647] [fffffffffffffffe] pgd=0000000000000000, p4d=0000000000000000, pud=0000000b44188403, pmd=0000000b4418c403, pte=0000000000000000
> [   57.664670] Internal error: Oops: 0000000096000007 [#1]  SMP
> [   57.665047] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Tainted: G S                  6.18.2+ #2 PREEMPTLAZY
> [   57.665061] Tainted: [S]=CPU_OUT_OF_SPEC
> [   57.665066] Hardware name: Apple Mac mini (M1, 2020) (DT)
> [   57.665072] Workqueue: events cd321x_update_work [tps6598x]
> [   57.665100] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   57.665111] pc : apple_tunable_apply+0x8/0x80 [apple_tunable]
> [   57.665121] lr : atcphy_mux_set+0x3e0/0x1138 [phy_apple_atc]
> [   57.665133] sp : ffffc000802a7c00
> [   57.665138] x29: ffffc000802a7c00 x28: 0000000000000003 x27: ffff800016c84080
> [   57.665151] x26: 0000000000000002 x25: ffff800016c84090 x24: ffff800016c8408f
> [   57.665163] x23: 0000000000020004 x22: 0000000000000001 x21: 0000000000000006
> [   57.665175] x20: ffff80000d6da9b0 x19: ffff80000d6da880 x18: 0000000000000002
> [   57.665188] x17: 0000000000000000 x16: ffffe22de59e0e38 x15: 0000000000000002
> [   57.665199] x14: ffffe22de76ecff8 x13: 0000000000000001 x12: ffff9dd5f90bc000
> [   57.665211] x11: 00000000000000c0 x10: 048abc15ceba0919 x9 : ffffe22dbc5fde10
> [   57.665223] x8 : ffff80000175e0d8 x7 : 0000000000000004 x6 : 0000000000000000
> [   57.665234] x5 : 0000000000000001 x4 : 0000000d6d132db7 x3 : 00000000000155db
> [   57.665246] x2 : 0000000000000000 x1 : fffffffffffffffe x0 : ffffc00082b80000
> [   57.665258] Call trace:
> [   57.665265]  apple_tunable_apply+0x8/0x80 [apple_tunable] (P)
> [   57.665276]  typec_mux_set+0x74/0xe0 [typec]
> [   57.665315]  cd321x_update_work+0x440/0x8c0 [tps6598x]
> [   57.665332]  process_one_work+0x178/0x3d0
> [   57.665346]  worker_thread+0x260/0x390
> [   57.665354]  kthread+0x150/0x250
> [   57.665369]  ret_from_fork+0x10/0x20
> [   57.665386] Code: e69a0ae8 ffffe22d aa1e03e9 d503201f (f9400022)
> [   57.665394] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied, thanks!

[1/1] phy: apple: atc: Actually check return value of devm_apple_tunable_parse
      commit: 7d55b44e2be1069504e22253d26d08982884f930

Best regards,
-- 
~Vinod



