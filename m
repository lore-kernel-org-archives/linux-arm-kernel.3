Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B122DFD9E07
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 20:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCF8FWWOPs/3jZyvVWyjhhPvbHufnb1Suj0O602BVrM=; b=Jd8yz0o5qjltXgjPqBvu0xfS+b
	MobnzBxFM1/Uott5APoavAG1L12Y778sGitX+fdrU4Og5PR1SWfUZS5pnkdNGcqmpDKfIGrrtaJg9
	uhL0TYI8I7++XGBFwx8tVICAvDhtGYBmwYrBrxkNgjS4j3wibR3UI9h2yn1/vFO4Hk8O2E1r9KHI8
	1/AUndTrjLLUJWTQltySYsJHepjmg2+MVASesRMOii8/IDm6vsh2wbUxAdpwoftyFojmx0ef9GcM8
	klLUBW+CY6fbQ4+AEqqi9r58rnAEnjze2fCRNY7SRRkqlzVzNEWfx3UHFQfzkNYeZ6HVeRCyQls8i
	tVEud45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhdE-000000078De-2qG1;
	Thu, 26 Feb 2026 20:06:44 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhdB-000000078BY-016m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 20:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eCF8FWWOPs/3jZyvVWyjhhPvbHufnb1Suj0O602BVrM=; b=h9S+qVYjNEMQ6kGtSE0q8TcTUh
	BGyh8q1C4GjmMVF0102QFSNsuohfUtgqn5fgkgjC9ui/Q1fvua51GzqsFnm/ZAlQkgTr4tJlJhQeK
	kA9whG67+KnM0jGqdjiEB8Yp337rBz2YegWRzyG8YrRidZ1DGR7NQw1gXoMG+Xl5h/hc2/TMJyzvM
	wxwHkkdTx39ifFTymK744ARG3V/Ct/GEZzLB811u+tVQSFUDaZ4EkKL5pCjx9Ug/y2M8PbmBruCMC
	zZ8EYCt+6dMjgL8wWjDNoI9w1k4r4WBVHsTHqcqiBpPNlFoO42qlC2E5XiFW9HwLuBcn8/9sMtWfC
	DIwEYbUw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vvhci-000PKH-1n;
	Thu, 26 Feb 2026 21:06:12 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vvhcg-0009t4-2f;
	Thu, 26 Feb 2026 21:06:11 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 20:06:07 +0000
Message-Id: <DGP5WW6SNUHY.2E1CSUTEDRM4M@folker-schwesinger.de>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260226073512.4595-1-rahulnavale04@gmail.com>
In-Reply-To: <20260226073512.4595-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27924/Thu Feb 26 08:24:13 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_120641_350658_157428D3 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Rahul,

On Thu Feb 26, 2026 at 8:35 AM CET, Rahul Navale wrote:
> root@pdm3:~# aplay closetoyou.wav
> Playing WAVE 'closetoyou.wav' : Signed 16 bit Little Endian, Rate 48000 H=
z, Stereo
>
> aplay: pcm_write:2178: write error: Interrupted system call
> root@pdm3:~# aplay closetoyou.wav root@pdm3:~# dmesg | grep xilinx_dma_de=
vice_caps
> [    0.318827] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [    0.318832] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [    0.319170] xilinx_dma_device_caps: caps->directions =3D 0x00000002
> [    0.319175] xilinx_dma_device_caps: caps->directions =3D 0x00000002
> [    6.375745] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [    6.375762] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [  133.401497] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [  133.401513] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [  167.802636] xilinx_dma_device_caps: caps->directions =3D 0x00000001
> [  167.802651] xilinx_dma_device_caps: caps->directions =3D 0x00000001

Looks like direction aggregation does not actually happen in your case.
Probably because you have two distinct DMA devices with a single
channel each. Could you confirm this from your DT?

This suggests, that direction aggregation is not the actual root cause
of the regression you're seeing. Maybe 7e01511443c3 exposes/triggers
another subtle flaw in the ASoC or DMA layers or your driver. But that's
speculation at this point.

I'm not sure how to proceed from here. I think the patch itself is
functional, but it does not address the actual issue.

There's however one other thing you could test: Could you keep the RFC
patch with the printks in place, but revert 7e01511443c3, rerun and post
the logs?

