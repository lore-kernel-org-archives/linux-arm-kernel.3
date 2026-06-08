Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513FBCD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMS9EBgXRR4/02GUSuS9J98SE+hMJi428gTY835n4rI=; b=Jp2wZ/bx+3oFTkHcU5AANjp4rb
	j57cqLET+ycn/1G1aELj8JgFkNDhC6OXu5J9gc/5YB5Ogr+H2SAKEucjkjJO4GttQVuiBwFs6vS2s
	eNfuqBUmWkN90n+tZdzaXwog/yJc/fLhPLLPeo+sdlpKCsJCfU2HwQaHoErWst0B3yqPVzOI8chAR
	vcunGC0OVwe/9t7LQUw1n6FnjhkOSiPp/oAj90DNnsg+qvB3OLdvGqWoWPOCneBpFOkO24iFXHVEZ
	524CNAMQEfaDVtNL9Nbvg7vXQw0wJcOIryv/4H2uDIK/Ww/80U1lQY+Nf1XcrEQJ2NTvu/y49iQEW
	zcYAe74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSYa-00000002qEd-2eXp;
	Mon, 08 Jun 2026 05:29:52 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSYX-00000002qDo-1WW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:29:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D47C6EC01C7;
	Mon,  8 Jun 2026 01:29:45 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 08 Jun 2026 01:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780896585;
	 x=1780982985; bh=NMS9EBgXRR4/02GUSuS9J98SE+hMJi428gTY835n4rI=; b=
	D2HlrqkQUXk0LSbb5e2QDMbH+gxoHaOICNfsS1MtI2nhPyw5pvfPmv1r6VCFTcAM
	BqyRexsfj1qBZT0loVcUzJA4+pHvNbutt9GsPT9XeUNja7/nDP/IE+GSdPSK3MQg
	tuZkt6RfGCzttli7UJlv0nbGXyZL+lc9l7Gjc05E8oM4SAFpuzzjUR2drtK+GXR6
	B0mSUEAn6Jxe2QykRW9P6WNqwQCEgwq2C7+MRTRiZo4oGrhTKuuT4aghiQVlzhb+
	U+kTfMVwHXrfx9BC2uF+gyKDFaA8yLreh05dFMFT5BzuOAHemCut6ywO4C78NwSH
	syaI896MbeRB7mZBmZCcnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780896585; x=
	1780982985; bh=NMS9EBgXRR4/02GUSuS9J98SE+hMJi428gTY835n4rI=; b=J
	6W5lJDOkHmKKtCRGKRiTF8tLwRHn8uxOh3zTMStI3xlOYhPHKWLgnxu6Y1NrP2Wt
	dUI9X1VSG9VoniW4KKBxuFaiXVaf0hxeBTThExydegqh1QPWDgdwuBMs3Nti+hNU
	b4BTYm1ZVrYU08vo3mZ58APyJosVv2xzS63b4Bz5tkOtbErAMOpoXteG4xgl8nYS
	Fd0PyZYZf4C5xrNVUi+ofN6FgtSAU799DqGIEOt3pVrRusDNi/voGxMaQt5olfOD
	CQ6DHNNJz3jNpXZ2w87O4Qmjoitr0owI98azfiyttUMQiBiuspu45NzXH9O86uk3
	/DmPmEi7NfYpovKMZHcyQ==
X-ME-Sender: <xms:SVMmai8xSTcS1Vf8yonVMRc3GfdwesUqMq1dixLDwBklVSJW5xkNsw>
    <xme:SVMmatj-PEH1McOZhbTIe4b-06sJwrWXZFPDoLLr0uvfSrNVwK2evP85thBb5kAyl
    8aQpEEICwN6Umw-hvLrpAJXJXur__zLkYpYUnTjWyO36k6QDRf3nQ>
X-ME-Proxy-Cause: dmFkZTEjhN5eAyps4RopbsqXKHVoYSp/qr1dPrgrLl4G4rhqcVzYy5m+WsA7iRsVdUizau
    gOtR7utmsVUNr509JhN3hWhgKIzmrs0OCdHT4rcYOpLEHxXmor8MzX7zmnBZAH/sS9kZdz
    pFExCgUD3RLKmvfI6SICEcFyFjoBu+ObTQF+mSLpO1IaOtHQXPCRPqp6wm0EiLliBj0GMx
    DsxDokAvHNMKoZiCdfsVuqMSlJ6eJGiQwxKy+Yo8kFSr1QRu9Dz+5FM6vRI4Nyf45RzzeP
    2EJQFlIoguQaStLMuS7LUVwRt6KMbMUnoG5tJsNV0tJNuXJf9tbtm2Zoc09GboEDS+LMFz
    mldyprQPisHyUGVxxR9ld4SqLx59sQsMC/oaS64/oEvN2feI6KkV/FW/IM9DqZfAeVGfBh
    rQKEDeBB5ip0B93e7rNXPG0+TIaCnrr56k4Lwre1V1lVogcXcFsKHtdd25MxJXaT8Urb+0
    F2WrZdbOl6ZzXn5nelSHsDi0C1hgcK+4h1M2mPSHf/bpNI3Wdf5Il7r0kIsHwFV3qQrA+F
    GCX2qroIKUIvwENG6mINzyxKTg5FXe6IUR6MCCJzy1lfb7HYCL93+22K1lY2mtn5uS0id9
    bhsBYo1xz9iUMM6fadw+7daZzTo/0OPnMTw9tqA5l0FzpZHs95hEGZkd0pyA
X-ME-Proxy: <xmx:SVMmalQCG8bdBzyVciVotgA3RY8TVUwr3XI7QHF1jQ6otUmjLLuCpA>
    <xmx:SVMmaie3eJJjKzPS_gMoz-At7CiOuCXLOReTSO9kERPjjTFNikIpaw>
    <xmx:SVMmakpgqsSwt56sEXqX8HR8YEebqnKsdWRM570m9goeOFbnOJqvuQ>
    <xmx:SVMmaj_rMqNJR-eYLzergAGH5NSt2N-ZNuwy30JKHk1uLICfXK0AcQ>
    <xmx:SVMmapb5yYmBo2LeiaM0LlOUVJZYTvfYUqfxL6JfAu65-_JGWj8GaHtz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 54B1D182007E; Mon,  8 Jun 2026 01:29:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AJMYJ9Y4Nbko
Date: Mon, 08 Jun 2026 07:29:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "Russell King" <linux@armlinux.org.uk>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Message-Id: <11295c52-c0f6-48ec-b032-da3e427606c8@app.fastmail.com>
In-Reply-To: <20260608050926.88446-1-enelsonmoore@gmail.com>
References: <20260608050926.88446-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] ARM: arch/arm/kernel/signal.c: resolve set-but-not-used warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_222949_868401_1CD3A06A 
X-CRM114-Status: UNSURE (   9.02  )
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

On Mon, Jun 8, 2026, at 07:09, Ethan Nelson-Moore wrote:
> If neither CONFIG_IWMMXT nor CONFIG_VFP are enabled (which is the case,
> for example, in rpc_defconfig), the variable "aux" is set but not used,
> which generates a warning during W=1 builds. Resolve this issue by only
> defining the variable if it will be used.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

