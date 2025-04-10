Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FDDC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5riLeTe/Eu2n5//o/VPdIzBfe0QKtBNXlz9iKtSP2Q=; b=GwOWUYeGswEfNE8jHXeKMG76wK
	IvltXtab3mBe/gL5Oh8q4fpz6edt94nrBuBO7lY2mpzN9OJLhzedDwA8QQuy03QvyrY9yyX3AYvTH
	lYkg59aqNhdVh6qkJ2+IZUYCILGf650GvywAsCUx8a+/lVXid3gH9mfQGp0WeYeB4563gcioUk1yF
	ewcoUMUYfHhn5MPmTXCxjy/TPjS9/kMQePx1G/G2ZgXAfgsy0DO2q3I6kKxxmlhfRThWvI3Or5M76
	yDeQI9TMHrdWF6I/kH0b5A5KXW/q98dZLQ8ZT95xVBznAwj7SrS2X6aLMjzwiQk2XVZSiReKZ5h2V
	fx3q669w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rO6-0000000AZeL-3BAz;
	Thu, 10 Apr 2025 12:52:10 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rGa-0000000AXyP-1bdu;
	Thu, 10 Apr 2025 12:44:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744289049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=faUr5cMNVJEtxkEF81Uj66v0dLpqsPPbOQ8jeHs+xjdzkfu20q5tyxCGuJdgnkvjNQyi7LdlGMby2SHrjeb7zfpy10MEUBxa/TsMJb/otf87w7zIhK8upE8pUIYrb+WMGGdn68unk6B3YFkH7EsR2lWuVMBi0pq15gntgaE7qhg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744289049; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q5riLeTe/Eu2n5//o/VPdIzBfe0QKtBNXlz9iKtSP2Q=; 
	b=FAwslMOd1D3HFexQPIoaHr9ykGjPn+yhh37TR+myOwni4K2r7IL22j/bkAY8hqsvcvlP9bqA2RyqSvfeoudmoS97rjJDZ72TA1dcoODVLzXSTf9T3s79i4uuJmUBZvOXHbxgpNWl8+XklImn1hfMmmPgUk6caZ8KotoSCFxuccY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744289049;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=q5riLeTe/Eu2n5//o/VPdIzBfe0QKtBNXlz9iKtSP2Q=;
	b=hf/PPn+ncwxnG6f2I+tARaUTsD3w8+H/v4M/MvP6LjGueeGOqhHIC8KRA256Ou4Z
	JeBu/vXfJdQLf02AbSGpkh+oK3Rr4kU3Cm3f6Q9DQJQhONMtlSSVm0U7tKzdlxkX9Ra
	v0EPXQJS1/C1AyqYnR4FHr6n3ELAWicoGLly1jOk=
Received: by mx.zohomail.com with SMTPS id 1744289048170962.4372419761808;
	Thu, 10 Apr 2025 05:44:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH RESEND] pmdomain: rockchip: keep PD_NVM on RK3576 always on
Date: Thu, 10 Apr 2025 14:44:03 +0200
Message-ID: <10136636.CDJkKcVGEf@workhorse>
In-Reply-To: <CAPDyKFpw=qXT6Qh_Gyub7L3ELdODPkyEZVtALvnJZ3OZQeS76w@mail.gmail.com>
References: <20250408-rk3576-emmc-fix-v1-1-3009828b1b31@collabora.com>
 <CAPDyKFpw=qXT6Qh_Gyub7L3ELdODPkyEZVtALvnJZ3OZQeS76w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_054424_492377_6F045790 
X-CRM114-Status: GOOD (  23.69  )
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

On Thursday, 10 April 2025 14:10:56 Central European Summer Time Ulf Hansson wrote:
> + Shawn Lin
> 
> On Tue, 8 Apr 2025 at 17:28, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Due to what seemingly is a hardware bug, PD_NVM never comes up quite the
> > same after being turned off once. The result is that the sdhci
> > controller will lock up the entire SoC when it's accessing its CQHCI
> > registers.
> >
> > The downstream kernel hacks around this by setting
> > GENPD_FLAG_RPM_ALWAYS_ON in the mmc host driver, which does not seem
> > like the right place for this.
> >
> > Set GENPD_FLAG_ALWAYS_ON in the pmdomain driver for PD_NVM. I'm using
> > the non-RPM version of the flag here because I have my doubts a
> > suspend-resume cycle will fix it. Suspend-resume currently seems busted,
> > so I couldn't test this.
> >
> > Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Shawn Lin recently made some changes [1] to make UFS work for this
> platform, as you probably know of. In particular the changes affected
> how to handle the UFS controller from the power-domain point of view.
> Could it be that something similar is missing for NVM too?
> 
> In any case, I am happy to apply this as a fix if you still think it
> makes sense.
> 
> Kind regards
> Uffe
> 
> [1]
> https://lore.kernel.org/all/1738736156-119203-1-git-send-email-shawn.lin@rock-chips.com/

Oh my, good catch. That does look like a similar kind of thing, and
potentially a better solution than what I'm going for.

I'll have to do some testing on my side, thank you for bringing this
particular part of the UFS series to my attention. I'll either respond
here or post a new version of the patch series depending on the outcome
of said testing.

Kind regards,
Nicolas Frattaroli



