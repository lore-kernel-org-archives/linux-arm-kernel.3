Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3753EFB809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mkPIWChdAQgXIFhSEQHDBSxI2g3eCHzD5QyGMhqLvg=; b=dmwGVmWhwxcF2z7J04bUf2XwwF
	HhZG2ktSdVEnDoEE2TrOxKJLnUbxCoeWetEsvzWILy2OSeQB0Xq+kb0P5KLCksb5YENXxof240xNS
	v3B1o6YtOdi3wzSzziey6gcixoH5mSkjPJuqrBkssLhfn5J1ulXuRLJVYDS1PUE3Yo4+v936QG7q4
	yeNfD1Exg3LZduv6arqByRaeepye9X9kbw3Vrcmf2yGi1XWLbLUYRBEaEe8D1jbusi0U1l+E8b9p6
	a2s9QJdTEo8QLUO5vMHJRgT4X06PxMxCiYsuagzgjuZt1GzPEREKrVk+o8xK8kqIZJieDEqUJdTZn
	pBauJOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumJ8-00000001Xzk-2LgO;
	Tue, 24 Feb 2026 06:54:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumJ6-00000001XzP-2lvz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 06:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A18940180;
	Tue, 24 Feb 2026 06:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B19C116D0;
	Tue, 24 Feb 2026 06:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771916048;
	bh=5mkPIWChdAQgXIFhSEQHDBSxI2g3eCHzD5QyGMhqLvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RQ1fcg3UTCQ68dk7NYK7spWLZy7OEzlo8g5ycn27z6lx3WwtAVYxp6HHWp4IMhjjE
	 63ZbJN5w877EcoY+cByaNeIKnrQ88DGzweea2ctWKor3UfBkIbwjzwtmVf8/exjvDX
	 FTN3YRmniI/weFE2izDaOnig44plnXeXSkP3OUv25oTwXS5UUWG4sMsA8ugdMRTxeV
	 rX4S9sz1LS2Mi/4O9TagOgw4rTQ1m7YQYvEHD6R8a23qjlOhMp1K9t/S/mwm+msxzq
	 gp2byJWH48VEkq6OmAcMABuLpQwu4f7j5aSmxBi1l8CWKOODZl9a9IsmguVaV8Wekh
	 RP5jO0coti9lg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
In-Reply-To: <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <kukzdg7cym2cwytx3zgbu5ik2cw7c2zq7irwp6q6o4jzupjzla@qgkrv7emus6f>
 <86ms0za8e0.wl-maz@kernel.org>
 <d289cacf-043d-46f9-9337-b6249b294c24@kernel.org>
Date: Tue, 24 Feb 2026 07:54:04 +0100
Message-ID: <87h5r6vdgz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_225408_723079_271B72B0 
X-CRM114-Status: UNSURE (   9.28  )
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

On Mon, Feb 23 2026 at 14:54, Christophe Leroy (CS GROUP) wrote:
> Le 23/02/2026 =C3=A0 14:37, Marc Zyngier a =C3=A9crit=C2=A0:
>> Thanks for giving it a go.
>
> Don't know what is your merge plan. I wanted to push it to soc fsl tree=20
> but it doesn't apply on top of v7.0-rc1:

We already established that. Marc will resend and yes, feel free to take
it through the FSL SoC tree.

