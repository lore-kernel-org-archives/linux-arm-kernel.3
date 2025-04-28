Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9986C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5PyhSBtLGsuIRqq3Wnao3XAIXhZyuUQyTbhMf8dn6A=; b=BkgqRG8yn+Xh4GzCnvPmloUPGf
	np0BdkPtuYqOoWwEoVMImTgkbv5d50OvpWit+TmmBbz96puwFbBKCkVsC2AqFmtDASluHXLoWOt09
	1kzE/2LTWdhvEPyNzVtZsMgB/vx9UiUO70HjIviph3rFMNYkTV/TTnyrGZUB+JCOVAcONZzOS3kDe
	kAxZ+6fvMMIezvy84dMXm8Qy1zg0oQJlwAQWob6Q2F9YVrMropoF1cllIkjx+eIO3fq8VU6bauZWG
	4Zf8Ng12fhRx2sIak2k0q+gxS7Ax24xpIbktFFlMEwvoYUGDPGJFJNut2qAFOFGVD1G+22lA0MJUH
	uqLpLbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9TWl-00000007GVr-36Or;
	Mon, 28 Apr 2025 18:48:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9TUn-00000007GO1-30OV;
	Mon, 28 Apr 2025 18:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B213F5C5B4C;
	Mon, 28 Apr 2025 18:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D976EC4CEE4;
	Mon, 28 Apr 2025 18:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745865984;
	bh=eg2rhi0L3VMr8m4UZ0QPZtf2aVXg+cv9p7DYcqzOc+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwQ/uJirTeuEwbzEq35HzL0lhukH2fGVnWgA0xvyKMAKApCs7eQKnUgIHU7VWTM1z
	 Z7clnXZlmMDwtZVmyO5DHHqq9YcbhMqttevow3Q+agRCh5lsKO3u8mw3q9eYpJs7/1
	 onMgQ28y7+7Un/zt0I1LGwFSuAJ8nYmQnyBtVDbc37L/ZwKqJgqCfzXjPhtarXMU7+
	 4EVngi8i1xpiiQy5R41NB50pKGpWYG52jGgdB+rn+IHxIXamDzJF8yp1C9M8NNeuJP
	 3OOwNXp441BywuQ9SVRWqe+AvMBIvUUX4Km14gQ6g8GwKPkwAX9VC36pxB0ynHFKW3
	 oKyMJRYdrFMdQ==
Date: Mon, 28 Apr 2025 19:46:19 +0100
From: Simon Horman <horms@kernel.org>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: shiming.cheng@mediatek.com, angelogioacchino.delregno@collabora.com,
	davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
	jibin.zhang@mediatek.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	netdev@vger.kernel.org, pabeni@redhat.com
Subject: Re: [PATCH v2] net: use inet_twsk_put() when sk_state is
 TCP_TIME_WAIT
Message-ID: <20250428184619.GH3339421@horms.kernel.org>
References: <20250425123354.29254-1-shiming.cheng@mediatek.com>
 <20250425203624.43634-1-kuniyu@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425203624.43634-1-kuniyu@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_114625_811968_614CDD96 
X-CRM114-Status: UNSURE (   9.17  )
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

On Fri, Apr 25, 2025 at 01:34:08PM -0700, Kuniyuki Iwashima wrote:

...

> From: Shiming Cheng <shiming.cheng@mediatek.com>
> Date: Fri, 25 Apr 2025 20:33:48 +0800
> > From: Jibin Zhang <jibin.zhang@mediatek.com>

...


> > Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>
> 
> I guess the sender's SOB tag is also needed here when the author
> is different ?

Yes, I think so too.

...

