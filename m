Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD99DFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzGtvo3BY4k2KCPfMTbFzcy9skFFR4HcNT8L72idkTM=; b=wYuJQHkRdxSRfT8U7///gdCM83
	q+mccgbb43KNVIbqKj9xztkuAAIUTtXYYwVQoSr2GqUAxPfvwl9m4fuEodoordVpgqq+IbUf3Bvv0
	HPHrT4ziyJ0/fj3VYi55tZJoEdX503cgNbBhDP6GQb7eUJz5Qc6BprhyKOwrGSuXs6Yw83cDm+mtL
	lPSzyQ5WgrOBl3MW01HchcLamTIZ0s7Gab7jYo0Tcxx1P057YQ56u3NKU7A2ssxOo6sVmlUbVA0lH
	f0WPA4lmreMwfmgEdhvRSfR5b9m609ugnQD6EUPkk32dwwOTttzSJv00PmEzedum8M/lZmSWt+q9q
	voknCOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOSC-00000005BLZ-1KiE;
	Thu, 30 Apr 2026 10:17:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOSA-00000005BLE-06m9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED96C417E4;
	Thu, 30 Apr 2026 10:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8331BC2BCB3;
	Thu, 30 Apr 2026 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777544224;
	bh=NQCNRA4r2Cl01+mMmoxO7aqM6wxV4AlNmytxTmeVZL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwV9rW8+ODlPxbCWtd/bNZuKjp7EDp5Bqbgyd8xmwapgpzfgb8vAIe0VkbHMtwwYR
	 d0dRjUcLzqrHKEAciBPYaHoSKtUWKQEBMv6FaP20bN1HJZOW8w8ml0E/f5FTlVo1Uo
	 nhCXyysrltsdprv8NrYpX3QmwKoUmiM5bKjTGcAy7B7V8tgjPvzkuPPplNIaFBMc3t
	 nA+oIv5QEIIBvXPoI5rQ+CL8PsGO7CW4Km/S4Yu5JvubMsVuyQ08D/kA6eJFk7lAFo
	 XCiovC9g7PqttlcijKwu2uce9T0T5EMCKBq6t7lhwKBcIufGEAqgMLefyXiOPdCED8
	 xxiJ3YeWiCq9Q==
Date: Thu, 30 Apr 2026 11:16:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range
 parsing
Message-ID: <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
References: <cover.1775205358.git.geert+renesas@glider.be>
 <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_031706_105215_F78EA085 
X-CRM114-Status: GOOD (  12.85  )
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

On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> When a range contains only an end ("-X"), the number string is parsed
> twice, as both "sep == first" and "sep != last" are true.  Fix this by
> dropping the superfluous number parsing for "sep == first".
> 
> This does have a harmless functional impact for the unbounded range:
> "-" is now accepted, while it was rejected before.
> 

Supporting "-" is good but I think the ret is uninitialised in that case
as sep, first and last are all equal. If you agree, I can patch up by
initialising ret to 0. Let me know if I am missing any other case where
it is not good to have ret initialised to 0.

-- 
Regards,
Sudeep

