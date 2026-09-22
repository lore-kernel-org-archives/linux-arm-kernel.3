Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DFCC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQMVZR7bVQz/sE2rQ7Oi7HxPrv/jQ3e7sAgi8F8An/U=; b=AbG/mmz2ipjFvj4SeZdm3bI4VV
	NAoFiC1O9ikhva1dsuGq3YXQJrfinbt4WlSAz02efjytQN6iro5Zs/iyLOAi5hAkvWxuXFGbey+j/
	auOeq122lRqT8AdkVMezn6exstSRQkLOAygmSOXfj3TVzsjEqixXsq0KEavQ3hGttudlL99eWrg6M
	5NGjNlU118P/a3WcUDTaLxUX/1JwyrL4fV7hgYNn7NoRooJEugBHymI+EbnblZp0lrqtSMwY/s5St
	jAKp44VJu9GLFiUaYKv3EXQ0HSH1qu64yOX86g5Smg2Xkx94zkZHfTBMDH59cKLdSyzopVHZLX4UV
	tN2tYHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zpa-00000005L4c-2V5g;
	Tue, 22 Sep 2026 12:42:42 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zpW-00000005L3G-3OgC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=UQMVZR7bVQz/sE2rQ7Oi7HxPrv/jQ3e7sAgi8F8An/U=;
	b=bL6aXDMrst6lk2NFKD6Ol0yi5HnAthxMTQGNKz/L1lzaf/SFtIGtLmRJq6JFgF
	IsbpJAPLexX6oLZIXKcvOhB30Liap0aRj6cTeoUe5lunRMgvCCKxdC4ME2GskHbf
	jakLG7O5nlEVjaBpcbS1EoDFFAbvsmy4VMv1KLZNiy86c=
Message-ID: <6ee07707-a1f2-4f3d-8ff7-d309e94c3dd6@126.com>
Date: Tue, 22 Sep 2026 20:41:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: do not cache the new TSO MSS before
 it reaches the DMA
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaolinkui@kylinos.cn, stable@vger.kernel.org
References: <20260920061609.1919876-1-xiaolinkui@126.com>
 <178997153300.2160803.9722094587431911734@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <178997153300.2160803.9722094587431911734@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3955_d7JqnfIhAA--.28161S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1DWr1rAw1DuFW5tFy3CFg_yoWDKwc_ur
	yay3srG34UGF9agFn29rn8ZrW29FWj9ry7tw1kJayIgrWxXa95uFZ7Wr92vr17A3yYyr9r
	CryYq3Wfur13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1hID7UUUUU==
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqB9EG2qyd3-d8QAA3U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_054240_036697_C967583F 
X-CRM114-Status: UNSURE (   6.78  )
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

- [Medium] The commit message of "net: stmmac: do not cache the new TSO
   MSS before it reaches the DMA" describes a failure mode that cannot…

Agreed -- thanks for the analysis, the on-the-wire symptom I described
cannot happen. After a mapping failure the abandoned context descriptor
stays at OWN=0, the error paths never advance the tail pointer, and once
a later xmit publishes it the DMA suspends on the not-owned descriptor;
stmmac_tx_clean() reclaims the slot in software but pins dirty_tx at the
first descriptor the DMA still owns, so no later frame is ever segmented
at all -- stale MSS or otherwise. The real pre-patch consequence is the
wedged TX ring you describe, recovered only by the reset path
(stmmac_tx_err() -> stmmac_reset_tx_queue(), which also clears the stale
tx_q->mss; reachable from both the watchdog and the DMA error interrupt).

I will respin with the commit message rewritten to describe the stall;
the code change is unchanged (keeping tx_q->cur_tx on the context slot
and releasing it on the error paths is what prevents the wedge).

pw-bot: cr


