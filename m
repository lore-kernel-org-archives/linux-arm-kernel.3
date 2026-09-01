Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9F0C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe8F/Y/8QTfgkrG5uLMZ++MudMQRDOd3PvSYxZZEGWY=; b=nt8QgyX/UeUihFgkH3yA7Es0nL
	Ve4PUTZbIiTSK+DpCF7s9L499gkjrikVh39u72srCmC29hFkDzmLCd6Ho+Yt12xX4jIQrUS47ny/g
	i4ebNQHTuu/G1uKQIkK8L7mGVBuOzdEAyVJPn4aQlB2orDJ9slokuRphj2WPKXlLbxIamzEoNQG/Z
	i+JWWWb3lcm0ExNKM1TUhtVPci9n0XEzLAP9EK6mavHDBXfi86jYl8eo32yetRdcETjuSpOwupED4
	i0yybCgkJ6Ss8DzRMsXVR6N3/X0kOCSFY8tFld7e7HQKNwnOzuH6gDA6EFMwir7VbEINUNTMxOC2K
	3mODcygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ipl-0000000B6ua-380q;
	Tue, 01 Sep 2026 07:23:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ipk-0000000B6uM-15Tq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:23:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62CE160202;
	Tue,  1 Sep 2026 07:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158CC1F000E9;
	Tue,  1 Sep 2026 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247383;
	bh=Pe8F/Y/8QTfgkrG5uLMZ++MudMQRDOd3PvSYxZZEGWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWR/jrnSDZPJp1eP3Dcm6CayOzYp/KAXxWB0n2EksMZsUuFGu9uVY5oyvcy+ZbJL7
	 Uzz3xswuG0IQXDkN9EYXewSBC7j8OGGx402znSNjpbZKampBiPSgfolQuRxNYcckGB
	 Cd+c81aKQ3VAKiJLAqRKqVymqRMhFoT7/5v6Ac/4KndtR7YZIMGZy/Jv5r5A5IN0IW
	 MNrVfGAfY7xVD6Owz5MOY1Meed+frmhz0ER5McFlaMQAL49Ywb4yyV+jO2/LAxN3vj
	 OIyXUvndkeZ2KmxVH197YyfClgy08r3LxBLJfetI8MJg7OF5lA9EZvcdUGI5BuI3hq
	 0isKt2AMGFuSw==
Date: Tue, 1 Sep 2026 08:22:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Carol Soto <csoto@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mochs@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: Unmap Rx/Tx buffers on shutdown
Message-ID: <20260901-nimble-uber-walrus-7a3ac0@sudeepholla>
References: <20260818224404.3694580-1-csoto@nvidia.com>
 <20260819-aromatic-albatross-of-virtuosity-2406c5@sudeepholla>
 <c5f0fe8e-faa2-48d5-b6a1-370ba36b19bc@nvidia.com>
 <4436a4ae-de40-4355-95b5-f5104ad30dd4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4436a4ae-de40-4355-95b5-f5104ad30dd4@nvidia.com>
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

On Mon, Aug 24, 2026 at 11:33:08AM -0500, Carol Soto wrote:
> 
> On 8/19/26 2:13 PM, Carol Soto wrote:
> > 
> > On 8/19/26 2:08 AM, Sudeep Holla wrote:
> > > I had posted a single line patch here[1]. The original
> > > author/reported never
> > > got back.
> > > 
> > > -- Regards, Sudeep [1] https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla
> > 
> > Hi Sudeep,
> > 
> > Thanks for the pointer. I tried your patch from [1] and it fixes the
> > kexec issue on my setup.
> > 
> > I also tried limiting the shutdown patch to just RXTX_UNMAP, but that is
> > not sufficient here.
> > The next kernel can still fail notificaion setup with:
> > 
> > ARM FF-A: Notification bitmap create error -13
> > 
> > So I agree that using the normal FF-A cleanup patch from shutdown looks
> > like the right approach,
> > since it tears down the notification bitmap state as well as unmapping
> > the Rx/Tx buffers.
> > 
> > Are you planning to submit that change to resolve this issue?
> > 
> > Thanks,
> > Carol
> 
> Hi Suddep,
> 
> Just following up on the FF-A kexec issue. Do you plan to submit your
> shutdown cleanup patch, or would you prefer that I send a v2 based on that
> approach?
> 

I was away for a while, I will post it as a proper patch soon. Sorry for the
delay.

-- 
Regards,
Sudeep

