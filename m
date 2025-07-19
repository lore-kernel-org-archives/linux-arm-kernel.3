Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA48DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 20:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trKgn9wFZ9o39XTS77tPA/b9wbDJPWjgDVHnBcgVX6g=; b=JlBuE+RoGUPlrSOMbLx2QkkXxk
	h1AukC9hkdBqNIonWjbjlXiUfAwmg2q2gpy7JfwqTpoX0LgyBRpxNEI238JsqsSm8mUQwcpfQ0b7S
	l+djo6lDSnUQ+PAFi7gBTyzE6eHLT64XCNXJygjdzacY0oxVPtGpmY6GAonrpjTtixmh95UIPcqgN
	ygvH1eRzbBpH4RXZo8IyUNK595L4u3XbO1R4G/S7najySNgQP4aQsLU8SH8bx+hZX7wXON2kPNLAZ
	n+iz5vK1IJAQlBS1x20MKjkCAW1w8AwEO+45G4UStvySs98zZU6kX302WRWXSGCISVSY4pnJ38mkj
	Wxz4EHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udDlX-0000000Eath-41ZU;
	Sat, 19 Jul 2025 20:02:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udDj4-0000000Eaiq-3BNU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 20:00:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752955203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trKgn9wFZ9o39XTS77tPA/b9wbDJPWjgDVHnBcgVX6g=;
	b=DqffrOIH5d/T0eaNuzXb24+AOr6tqWAIFA1kNE5nbjesD9vJWq+g2pJ50/9NGQojFURx7Y
	dtM+HbJ3pSjcOHaSKKZCzc87PuLxb+Bwk1veq/8hnxAgDTfu5KCIuCEMj649nLLhRPcnsS
	4KbRJuUoWSpOfb6mZ78lMQq0iGmn2fcLcgy2vFsQLxry8TDs7DYJJwbnNYG9fQwrLwOk9Q
	eS+EYRmT5MFYMDMlFwXj36R/sP11IWD6jSqmDLmuv1kDhHMRq4wOcSUKdC+n74gEl3oI3c
	lWDnXL5Y2FGlOfHsaInhM5dfgOP9rd/esONpN2k6owDSNtu07zJ45LzsskURww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752955203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trKgn9wFZ9o39XTS77tPA/b9wbDJPWjgDVHnBcgVX6g=;
	b=KVNZ9gc3y71iyqP9P6vcq8GnI2oZ677aSw+q5/n7M22IkOMMcWklu5t8dmY5hLtCmAfvZi
	xLKrLtM0/JO9FWDg==
To: Markus =?utf-8?Q?Bl=C3=B6chl?= <markus@blochl.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Richard Cochran
 <richardcochran@gmail.com>, John Stultz <jstultz@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 markus.bloechl@ipetronik.com, Markus =?utf-8?Q?Bl=C3=B6chl?=
 <markus@blochl.de>
Subject: Re: [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
In-Reply-To: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
References: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
Date: Sat, 19 Jul 2025 22:00:02 +0200
Message-ID: <87o6tguf25.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_130006_943619_5B08FB3E 
X-CRM114-Status: UNSURE (   8.16  )
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

On Sun, Jul 13 2025 at 22:21, Markus Bl=C3=B6chl wrote:
> get_time_fn() callback implementations are expected to fill out the
> entire system_counterval_t struct as it may be initially uninitialized.
>
> This broke with the removal of convert_art_to_tsc() helper functions
> which left use_nsecs uninitialized.

Sigh. As I explained in the other thread, the proper fix is to
zero initialize the data structure at the call site and fix this whole
class of issues in one go.


