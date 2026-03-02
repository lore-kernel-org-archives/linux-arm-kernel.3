Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA81E9B36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8SSIbZ93R41fR9BT9txy5cX7q+XetDeaxLrs/ZiZ9Y=; b=1TgtJdkBjy6qMVjd92WlBmcmyv
	a5+BNiXsonwlnuBvoC6STJNyDYuScI5T/DkP+qvkCtmoWGqpaq2aE7xU1KiZLrIYflGjMmQq/C5dy
	tyu9lbEgwxTibvn8VDPciBoOuLfHEZkNTM1jb4xq5Gzt2Q6kupUbkbRR+LetQQSZhuw9bAWMIZm0g
	e4odDnZebn/fS91ZDicYAq4HGJtsxh5KK2s0xP0IOf/ZWD8/iB1iBMc7o5DLNdpSfsRXSUV2SC/IM
	v0PXSZoco9JwYK1W4EJyS4td3179tUdxn5ASFmxtSOAQE8ZK3bNGzaz02L60xTpUyPet99GA3KSUd
	3oY7TANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1oH-0000000Cryw-2jxo;
	Mon, 02 Mar 2026 11:51:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1oF-0000000CryM-2Qn6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:51:36 +0000
Date: Mon, 2 Mar 2026 12:51:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772452292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m8SSIbZ93R41fR9BT9txy5cX7q+XetDeaxLrs/ZiZ9Y=;
	b=g7XHkW1Pr65WvnSuDMjZgHVl+CcCiFI7fDIePtB21YwVaC/dV59j/LcQ9NYPhzqDGhkFlV
	LbvVWejqYktwHKlQpY1dLpf5LUFJREo9Y7EM/f5vq8RnEs4ACp3v8fkQatL3YT2TZdxTxF
	+GcN8Dg0D3T21KI3YClpKjvEgGAqWG4UwQrwhTcHqTFPWDGVAc85DdANsN3omvAr5b9A/G
	RNzKKyXHUNgCQx7MvxewVDVd4BVgWTNJjgH+VXydSMYDZ84RGstEa7nt6p/RYhE7rO+A+K
	rcJa3X5gZgHuJfd2wGq50IyXoh6JeJQc3/6AeeQ1GNb4D3XdMss7yJ669j8pwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772452292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m8SSIbZ93R41fR9BT9txy5cX7q+XetDeaxLrs/ZiZ9Y=;
	b=vHn+sqPLO9K+K/S/VoYuqM4qL9fS9YEzsivVX+wDS9DEEsPrI6tilxSBii1eV7NmH4tZ/+
	IcdfFC4+IPiPJzAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/6] ARM: move vmalloc() lazy-page table population
Message-ID: <20260302115130.T10_Vx84@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcX-0000000Awo0-2KBN@rmk-PC.armlinux.org.uk>
 <20260302104351.yyWvNCTb@linutronix.de>
 <aaVs_31KNKvUkNL8@shell.armlinux.org.uk>
 <20260302110055.hFMkUcnt@linutronix.de>
 <aaVyWFNu8scqZeEY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaVyWFNu8scqZeEY@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035135_757822_E61AE156 
X-CRM114-Status: UNSURE (   7.61  )
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

On 2026-03-02 11:19:52 [+0000], Russell King (Oracle) wrote:
> We've gone from the code always having interrupts disabled, to your
> review response that always wants them to be enabled (which is what
> *un*conditionally enable interrupts means) to now conditionally enable
> interrupts.

I'm sorry but this got out of hand.
The wording was we must "not enable interrupts" and I was curious if
this is because we destroy some information (on the following fault/
interrupt) _or_ not. If we don't destroy anything then it would be okay
to enable them conditionally. At no point I am suggesting to do so.

Sorry for the confusion here.

Sebastian

