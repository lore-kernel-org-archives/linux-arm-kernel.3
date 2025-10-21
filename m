Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ABACCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 01:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAijegNyPM7oBl6Suv1pcENTGRAuqXvLaWwH4iuPJ2U=; b=CX3QPH6ydF8Lc1Dio+eDq+wV8Z
	XuaZ4QQRcHExgJ80OTto6ZMQh7sP6+sw30J3M8gTJ9CkiLlqoflDtmyWAXuFYV5G2BoaV1oeaCL1L
	mOa/G4IrKTryzJM1I4Q8jgfjAmQrKLFJbTOaDDuu+yyIdkDcL6tKD2Qa8YUxeZ2vAR74tgbo3PiRA
	VJ1LlWn4TswgdJVFmbe1XiiSbmZyKKYVBvRxA2SxkhAfWzJ6D0ZW7pZPU2CtQgI8fUm6bLF9b47/H
	WYg/DHlMHZe8kpY5fzIqgPqaV1+Ze6RPjrizbnX/BSGHYga8Qm7oGtETxWg5M22iO/m1cAgUk7dPl
	UGrAymuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0md-0000000FQRl-0IX8;
	Tue, 21 Oct 2025 01:03:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB0mc-0000000FQRI-0MOK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 01:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7958960348;
	Tue, 21 Oct 2025 01:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB3CC4CEFB;
	Tue, 21 Oct 2025 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761008591;
	bh=kZUG3ekjbgqMUNy0q3i+gFuqeUpAWQ8+S6giYThScJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KoQlZE7fEp/69DTCsk3mks1FSpdb5anEGzXte01mSzflvCuUOU+bVpIhvRGX6o/iL
	 4OTw5EJxosg4VkG/ckez1u8WrVPGStAgTIg3CU/bsYmzpqADp/q65xcqUTMbuPCOuC
	 f/v5G3D9e9nIn2aw1rkiN2dPrdx70JHXNdrW/MaZf/Y7wtsbSSoFZtRZCv4eD61DCJ
	 /B2b5Amdzzv9vGJgByWu+vKjA9fRj9qnHcmFLjXfOAuHF3frPYU8t74Jog1iMuUtHv
	 SXqDtdgvs+YLiHAgwRpcOvy5L8B9aqpp05DwKSzlNIel5baHxPmf9AHQu5lbXEbDJ9
	 5Ey8byknV+a+w==
Date: Mon, 20 Oct 2025 18:03:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
Message-ID: <20251020180309.5e283d90@kernel.org>
In-Reply-To: <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-3-maxime.chevallier@bootlin.com>
	<20251017182358.42f76387@kernel.org>
	<d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
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

On Sat, 18 Oct 2025 09:42:57 +0200 Maxime Chevallier wrote:
> > If the HW really needs it, just lob a devlink param at it?  
> 
> I'm totally OK with that. I'm not well versed into devlink, working mostly with
> embedded devices with simple-ish NICs, most of them don't use devlink. Let me
> give it a try then :)
> 
> Thanks for taking a look at this,

FWIW I dropped this form PW in an attempt to unblock testing of
Russell's series. I'm not convinced that the tsconfig API is correct
here but I don't get how the HW works. Could you perhaps put together
some pseudocode?

