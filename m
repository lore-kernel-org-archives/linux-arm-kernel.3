Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A660CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9A0uibkeTCaIFcoZgfbAN1n3LDDq5OYVnx6j2mA+dr0=; b=SO3JA+8I7TGBwGoS/dbkg2ZJbj
	JOq9T8dr08Hl77UKk2p+idy7SSEQV5n8TTiPoH7wYLQLKu9nF0ikUu3ZfoYQ/eLSs3Lu6tLJKAhyt
	jmfTk6NoFlAZF9/d7MO4jFYZctFNKagsZNSyN05cjqWNdmy7gmLnojAxcpbn+oFaSkjPIOIKMwDMN
	aN7vH3gjy64OmLrt23TlBBvRbwv2I2D5Ku45s+kiq1F/5QKNpcOYQ3XDgfuTgbfqQie9L/8ghVnNk
	kdq2sLD2kS/g2KtXCFkE9/MwDrkO8YYzgsVl2YkEjdm/VvOa2mfwbh6glbY5UGCx1XrRIDWxjwqrK
	0a+gJVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnnO-0000000GQe5-194o;
	Tue, 28 Oct 2025 17:47:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnnM-0000000GQdl-3nIi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 031216013E;
	Tue, 28 Oct 2025 17:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7711CC4CEE7;
	Tue, 28 Oct 2025 17:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761673663;
	bh=Cf95w80aUdBCexcAXXklVfncQajwu0vJl7eWpjuz120=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2nS80rP0T20ccHauAlWnqkCpTXh+lxp06dydw70FiFbZOkURPrwzQPiFlKQXJpDQ
	 9GlU5pgZodK7khU5a3Y7SHRv0+ydEpMhp7Xxroge7zYmIfIUN6SWtToe+ijInmYFdB
	 TsyU01hZm0IcnWZFvpGra89rRDPj8P+A1zE5KQFESZTdhlTqkCaLrlo76fOum6xS9V
	 RT30RsCm57QhhOKbkejmY9WU2K78zxjLPyXqU78qqVKlT8DbtP5r2qaOc2VcXBNcft
	 9te8eMunTbcHGf+NQ2KO3CcGDJiOiuDPXQoFR5oyLpA5/yGlDnpumQbIV2JFmUO2sW
	 u7FRTRCO+3NLA==
Date: Tue, 28 Oct 2025 13:47:42 -0400
From: Sasha Levin <sashal@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	mturquette@baylibre.com, sboyd@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.17-6.12] clk: scmi: migrate round_rate() to
 determine_rate()
Message-ID: <aQEBvswDDxZ0r-0t@laps>
References: <20251026144958.26750-1-sashal@kernel.org>
 <20251026144958.26750-39-sashal@kernel.org>
 <aP6rvQD-bwSkhfU5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aP6rvQD-bwSkhfU5@redhat.com>
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

On Sun, Oct 26, 2025 at 07:16:13PM -0400, Brian Masney wrote:
>Hi Sasha,
>
>On Sun, Oct 26, 2025 at 10:49:17AM -0400, Sasha Levin wrote:
>> From: Brian Masney <bmasney@redhat.com>
>>
>> [ Upstream commit 80cb2b6edd8368f7e1e8bf2f66aabf57aa7de4b7 ]
>>
>> This driver implements both the determine_rate() and round_rate() clk
>> ops, and the round_rate() clk ops is deprecated. When both are defined,
>> clk_core_determine_round_nolock() from the clk core will only use the
>> determine_rate() clk ops.
>>
>> The existing scmi_clk_determine_rate() is a noop implementation that
>> lets the firmware round the rate as appropriate. Drop the existing
>> determine_rate implementation and convert the existing round_rate()
>> implementation over to determine_rate().
>>
>> scmi_clk_determine_rate() was added recently when the clock parent
>> support was added, so it's not expected that this change will regress
>> anything.
>>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>> Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95-19x19-EVK
>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Please drop this commit from all stable backports.

Ack, thanks for the review!

-- 
Thanks,
Sasha

