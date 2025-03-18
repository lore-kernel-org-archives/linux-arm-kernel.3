Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA07C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cg01GAKhpZSgbu+ff26UMaPA6A3CZokLlmN6f8k3fMQ=; b=T3+iVmH2Ebk4iYhhZFtlWH7Uue
	8/JehmONdVo8JDPwIlvF6rm0a1IO1Kb1W59fsWVKEmK4bC0fQXG3WIGJoZx3x36RdJfNc4mqU+qaK
	jMyMMHlFAr6I3Y2TlCkoHYdvlflwWIlvHTJYgW1F9FSwTkA846RlTabaYhYU77Ov0EY8ORQCLFhjZ
	GkwpNzYOQ3CkNVHukOSCkrVFK5/uvpvJ2Ww4JeWz1JRIWnJUns11w4OmZRNLqR0G1ekGYYPz3648I
	a1uURBTzINvWtD9BVAwmAOSoBCoSfGn/LTuoT9MTKTkgqsBxv5K3DkuYQNDJxNkSWPpfQo6z216fw
	K3/LG8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZ5a-00000006OJ8-01AB;
	Tue, 18 Mar 2025 15:42:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZ3r-00000006O10-3coJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 15:41:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F34685C58FF;
	Tue, 18 Mar 2025 15:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867C7C4CEDD;
	Tue, 18 Mar 2025 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742312458;
	bh=8XU+uzlDIVHp8KPdPZ+SQ58qTW7pc8uMOtHULNZO6zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaRF461uLgkFESqexYg+JyYJMVoKk5NVmQR7HipojvNON3b7EmXQ/MgTOZZXIrj/n
	 TklI1rzC65IMk6/Bh4u0wwQfRquGxxdKAqbzvqiEv1QLeU2poojlDmVtE+yK0krYag
	 DY4pcVj6FJa9zOduwD346Hp5rLoKkgldHkPSjCSbkg1o6uFIn4Rny07ogHt0dJn4Ww
	 NuLMpvLTwcCrmknhC2aHFplU/4nsaOR7L1TVrYhhC6KdeAgrF1m5Dq1ShyjJIlJJYZ
	 h+LSeTYbOfu5mEQL7x5NYVGru0KQ40gOO4rSIdm0yED7zr5CHi2bNvvnnh3x0NzziO
	 v3B0EFuEDtgBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuZ3q-000000006vp-47Uz;
	Tue, 18 Mar 2025 16:40:59 +0100
Date: Tue, 18 Mar 2025 16:40:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z9mUCmQW7L3yx7qt@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
 <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
 <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
 <Z9l1L1WICMYXSoIu@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9l1L1WICMYXSoIu@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_084059_955964_968CE29B 
X-CRM114-Status: GOOD (  19.88  )
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

On Tue, Mar 18, 2025 at 01:29:19PM +0000, Cristian Marussi wrote:
> On Tue, Mar 18, 2025 at 09:16:36AM +0100, Johan Hovold wrote:

> > Have you made any progress on the quirk framework prototyping?
> 
> I have not forgot, tried a few things, but nothing really to post as of
> now...dont wnat to rush either .... I was hoping to push something out at
> the end of this next merge window...
> 
> > Do you need any input from Sibi on the protocol versioning for that?
> 
> No I am fine, I am planning anyway for something generic enough to be
> easy then to plug your own quirks separately...

Sounds good, thanks.

> > We'd really like to enable cpufreq on this platform and ideally in 6.15.
> > I think that should be possible given that we now understand in what
> > ways the firmware is broken and what is needed to handle it even if we
> > still need to decide on how best to implement this.
> 
> v6.15 seems hard/impossible even using the original Sibi patch 
> given the usual upstreaming-timeline of the SCMI stack where everything has
> to be usually reviewed and accepted by rc4/rc5.....so both Sibi initial
> patch and my own babbling were alreaady sort of late.

Yes, sorry, I wasn't referring to Sibi's SCMI patches, but the
devicetree changes needed to enable cpufreq on these platforms (that
will go through the qcom tree).

It may be a little late for that too, but with an understanding of the
problem and a quirk implementation around the corner, we could enable
cpufreq as long as we make sure that Sibi's per-channel FC fix (that
addresses the FC warnings) is not merged without the quirk in place (to
avoid the crashes).

Johan

