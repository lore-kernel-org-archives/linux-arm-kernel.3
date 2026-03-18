Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37AF103E168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/yl142uki4yhzbHevTmfD49HrneXqML6XD8ozlyd+4=; b=FIN26WKITuZeMO18uMfpFjV7Br
	t0k2VKjfHHVIuTryVXRkUwVPZzqOH6ZCPQrWFa42FyQesmlmi3IoCTfX4/IZaqbKSIQLLtJkqYa52
	jcp05nSrbafFzZ7tX2l22hKhNn9fTguXvSkyEDBYZr03EXCsKum7hQnVpjeTSDZtnLoPnU0LV0MOc
	HZKHwjcIuNkhDlnrfC+KWSIiEV1Hgl0TtxQI6HwVsXKx/VSQAiKmT2HEMv6DOckwxMcw0pXMIRUJ4
	1dgFNP5NEHWFs0N2ls9Sm8Zem6DRT06TEoihyKiuqSV6nPHsugTCpyLN9vTU1f790Xe2XdjK7Ns9M
	1Xn0EaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qRp-00000008QwJ-42HP;
	Wed, 18 Mar 2026 12:56:32 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qRm-00000008QvZ-25b7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 12:56:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 727F3140025B;
	Wed, 18 Mar 2026 08:56:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 08:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773838583;
	 x=1773924983; bh=N/yl142uki4yhzbHevTmfD49HrneXqML6XD8ozlyd+4=; b=
	fj1yedZZ3bklSeX2boCjOTKnl+3E++OiUD7mCbjJObAGqP6bioFhaJFdolap+Ogy
	Dyfdajuw1ExQKctJZfT0aHTab33oRqjnhCpWpHOk7sfu+KephGKnDnvSDfGXxd6U
	xQZzR88Y56VQEFZPfk5HoP6JFUoWvSPp2wFkQQEzSr88w1Tuni4zhq362R8ILLSQ
	ljIGcMAStxDM40IEOG0SfWUTBgJRKwih+VdV3wH29RGJzTMuD95tmFBb0d37FA41
	8EJdgUueudiEyPANh9/oib57LtokQGascD/dt+Ujygqgv//j7MQ/Xj4Nh4qLLGJ8
	a85/LEqwFbdIo8DG/5B+Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773838583; x=
	1773924983; bh=N/yl142uki4yhzbHevTmfD49HrneXqML6XD8ozlyd+4=; b=G
	o0Tmic2L9YVdTtd9JXwlo5jGFlrIYDuRmdT6IfSrlVFXKzGrvZOFy5PuSUUdQVLk
	t4AUCDfwdWn/J6qZ5mBSGcWUHN2dxiixyhyry4m4uGGLN5s7VEkyXCCz5agcrPX1
	1aGIVTFdtSM64fU4wvsG9DoqoUCZ+Tc90cvfhbi6bdv9y9S0WfnCHIxUfXFSbbrz
	5aj43cGb/Go/XhlrOB1NspONSNMMDhoN6DjKuhUEVq+Jxd2UlpptEGKtt5eqYZz8
	wavhUZmEGGLO5XeB9E6eCmIK9WlMToPxdPXNeKNhmnJjNjVdelIahSfYWH7iBdvP
	Mwiaxcf7JC/KASYPfSUFA==
X-ME-Sender: <xms:96C6aT1zsWSfpHxmEt118hSnPRiBuiYkoakqHN4jmCzOYRQ1tc4glA>
    <xme:96C6ac6y4Uoh9QFqoQo0KLvKj68Rj31gyg3_CjitMzCldrJz9dUadOOVcOHTGIVoq
    rI49Hqq4ItO5ZXUFP8nUuzNVDpVHwY1qSBXFazqKXWB7hwLGh9YgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghgnhhushdrug
    grmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehmrhhitghonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    hotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmhei
    kehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:96C6aUnaLSipjssmpRnXYYslYJi1jXQPcNXqo-Y_D6K-IW9s_VPdPQ>
    <xmx:96C6aWZnownml55EqYPNmPWYS1R_CRFCHwEe4mBZ4kItZFYMdYLnCw>
    <xmx:96C6aWR_nja4qvQf4_HFwKbC9P7W0rFrR3YVWC1lI-qJsMWcFHPbkg>
    <xmx:96C6aQvLrN2euPHwKAxbs5mHhXy6a7YVlwBYMO_SOYnMM5_SE2f38g>
    <xmx:96C6affpgjzeJlSCDUynxvWF7vdqudtG5g3CmZyC6nDCUzIo9VjcdgG4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2F31F70006B; Wed, 18 Mar 2026 08:56:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYTw_54MFalk
Date: Wed, 18 Mar 2026 13:56:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
 "Magnus Damm" <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <a4cad30f-0f29-4bf6-b69d-a38ebe05828c@app.fastmail.com>
In-Reply-To: <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <20260317-spirited-mahogany-swift-b1ac53@quoll>
 <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
 <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_055626_603014_AA376EB0 
X-CRM114-Status: GOOD (  22.95  )
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

On Tue, Mar 17, 2026, at 10:11, Krzysztof Kozlowski wrote:
> On 17/03/2026 09:46, Geert Uytterhoeven wrote:
>
> @Konstantin,
> I use modified Rob's script to go over patch/pull queue in Patchwork:
> https://patchwork.kernel.org/project/linux-soc/list/?state=*
>
> I deal with them one-by-one, so when I finish merging, I want to be sure
> that Patchwork status is updated, thus through the script I mark it
> "Accepted".
> Like this one:
> https://patchwork.kernel.org/project/linux-soc/patch/cover.1773399675.git.geert+renesas@glider.be/
>
> Around then - can be just before or after - I push the updated branch to
> git.kernel.org. I fear that because the pull is manually updated in
> Patchwork to "Accepted", pw-bot ignores it and does not send the
> notification.
>
> Is it feasible to change pw-bot so it will notify even if it is marked
> as "Accepted"? Or any ideas how to change the flow to have both:
> A. pw-bot reply,
> B. Be 100% sure that Patchwork status is updated (allow my manual update
> via script)?

In my experience, the pw-bot reply always happens at the same time as
the update in the patchwork state, we either get both or nothing.

The way I've used it in the past was to let pw-bot handle the replies.
If anything was missing htere, I would know that I had to send a
manual reply and update the status.

I suspect that setting the status to Accepted first would stop this
from working, but right now the pwbot interaction appears to be
broken regardless of the status update, i.e. it only handles
patches but not pull requests at all.

Konstantin, this seems to have broken around the time you modified
pwbot to handle git:// URL rewrites earlier this year. Previously
it only ever caught commit messages that had the exact same URL
as the pull request message, IIRC you said that it should now handle
the case where a git:// URL gets turned into a https:// one, but
the actual result appears to be that no pull requests get matched
at all.

    Arnd

