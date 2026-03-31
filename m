Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E91061B2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 00:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kboeLqYNOSQN3AXOfZCSntrXfQNumGp7lIu/grxGAMc=; b=uSCjCVTFEwFxZC9a5kGWarKgCX
	1M4tyMiPDlRxppqKXgH9dyGRKzLB9u3eB6AB+PMyR1wa9rSO3YD7J7xxGNg+guV8rcaL/f8zhj/IH
	zXUsI7VL10WH9jHfNwa+1c/UVxO/gPG37KUowo6x/fJh2Q7n/vWlQQmj95YY89YAOAGmnKgY1gp8k
	w+YvYcXh+69cGOwDkx8QuAgHXKZDc4eyGZnNOmkkP+NAnjbwHMPsHFEwZMGoNkQFHEFHuWJDI8Tlj
	LFKvgaXHl0fq0LCG8eSyfL2enrScgGH8WnywsqfEb5u4ZlF55q6EY6WgkPsnUkhirIkMlZ03hB3Lo
	jGwVnwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Myp-0000000C5B1-0myo;
	Tue, 31 Mar 2026 00:29:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Myn-0000000C5Ap-1GeR;
	Tue, 31 Mar 2026 00:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kboeLqYNOSQN3AXOfZCSntrXfQNumGp7lIu/grxGAMc=; b=iQM6cjg1yW0vZcGGcqHcxjmGlL
	oTJbPC36F6hE+xkl8K26V690nL8Gt4VT8L6EqHn8eXGY8d5vZ8jKjiOGcScn+vjN1apUCXGWqXqmD
	p68hPVgeMbJiIyUaAoHJzIzwv8f1NJEtKH5kFuIj7phEQWNA2UQCfyDS474a3fpSk6NWsFoYRQrK6
	9AkuiRKW+VsrmdT471RVK9p+5B5N7dPPeKNPMnPJ7RPKILp38Kd0X77+6zQ8j53H+wLh7wrwtnKjR
	uzQXNeHzpGgvzh/j5aOSQBm2oS7ORdm5smKeDNlW10JKEgTmS2ghtUnKSjfZHGCjckQOqyh7hDIPT
	wTQ8Hq4w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Myj-0000000EvMr-2trk;
	Tue, 31 Mar 2026 00:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7942439DE;
	Tue, 31 Mar 2026 00:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732E3C4CEF7;
	Tue, 31 Mar 2026 00:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774916945;
	bh=HqldPgKp9TGGyn7L65pc2nORgMdMa6raZULjHCR1jCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UaignE4TkOdCWR+vxfEaWiwNOgV+brzQ80h1rNgUJxsm/9PunnuneMchdQcMT8OOZ
	 WDYsGFF0bcd8yNT7kJgVuOpNiyHk4+fj6pDzKnokCN9tyJbeAuDRcOgdeC4QymVtcv
	 t/vDxrU5q/MUz6+ViW+XGtvy8u35xBJy5QEW9o/ulNtuZ1b3gXE/RAWLooVujhpry5
	 7Y0pG3yClGmoojWnWmbDulqcrmd7+hu8WmDVnnLx/gehIAymFFskNMIWNNjZC+MX7L
	 4Xgdn7NPhQhGM45M9W3GiwU2kuSMEzJFoO8ZcY4//w6JCGT4h9mVaBx0gmVfTohZux
	 4FlkvsJ76abvQ==
Date: Mon, 30 Mar 2026 17:28:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Madhur Agrawal
 <Madhur.Agrawal@airoha.com>
Subject: Re: [PATCH net] net: airoha: Add missing cleanup bits in
 airoha_qdma_cleanup_rx_queue()
Message-ID: <20260330172857.0c94685d@kernel.org>
In-Reply-To: <20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org>
References: <20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012910_073785_0FB28866 
X-CRM114-Status: UNSURE (   7.25  )
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

On Fri, 27 Mar 2026 10:48:21 +0100 Lorenzo Bianconi wrote:
> In order to properly cleanup hw rx QDMA queues and bring the device to
> the initial state, reset rx DMA queue head/tail index. Moreover, reset
> queued DMA descriptor fields.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Tested-by: Madhur Agrawal <Madhur.Agrawal@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Take a look at sashiko, please:
https://sashiko.dev/#/patchset/20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org

Looks somewhat orthogonal to the current patch but probably worth
fixing.

