Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1200BCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=; b=EC6FrLkaebB5q8PwqRnswPG6m8
	1XBELINQ77lytNFukVDRef8gEv7HsOX3oOMIjfPAJVyu8VYmBi0XpQTBu37bAoLDtRXUEjVvO8CE2
	ZA+tIYsoGHP28BOojs4Q09biNfC94pkuF7bgNnIim7uX1U3xh5nDwfBcIzwCADcSBdB1Y4QCjVwv3
	XSPMIp0+NNngdRUXW/NDaNqJz80e5dgR5nZKAXCgIVSPE/7Xb3+9cRp0+AAhGeCOjigiDNj35k7Va
	0dh05yYs8KW2kSfzhntxpmFaCyYs4VrWQlexy6eafJmrv7Rgf3RF81yEWUxtcU7QZelm0wuf5vEQp
	OGvD3roA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRrz-0000000DwIB-32cD;
	Mon, 11 May 2026 14:44:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRrx-0000000DwHh-0Hut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
	b=QWvdoJlkm226nC79juU7LLp4wEMKCYqu0wWmneg5IZ3h2O7hbaV7FUGD1r4GFBJl8JF+VW
	jsA2dB+QB6uwvNcKjeXxDrjzVxFE17e4rmI4Spj03Wb8OlbG8ZODZp2/TRwZuFvdV9oOXV
	xcXrqhdIi1YT075UgWzA3keSaQOksMU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-xLaxlsmENie0PoQM4a91sA-1; Mon, 11 May 2026 10:44:26 -0400
X-MC-Unique: xLaxlsmENie0PoQM4a91sA-1
X-Mimecast-MFC-AGG-ID: xLaxlsmENie0PoQM4a91sA_1778510666
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b7105dfb5eso96135866d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510666; x=1779115466;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eicqwhgs+eER0wAJIrvpo3UBssGzYDYUrthaa+7DjQ8=;
        b=hCynVazI6cbN2T+L4x9nDbVRqyrsFtdaERw3N93Xk4KRAoZokS/W7aBZF3VNMcPMfj
         SMr8TwUEtEMjFIVrCMxFx1H9EhtpP46ci6rteyw5nTqEcHlOVbFWwHDxsjT0MOwOmeFO
         4Nc4G6JSbTQfvqK0GAxCD847VFJbMunxFAdnlobWzEFQ/ReKxGbHO1alacsUHOdJrbgC
         4HLfaovQuXe2Eri9WU10jO4qcM/56fCEnmF9ijjdJ3lWXLfed2QayVRvJSJUoxvSWx4S
         cRVvB016GqMcpYv6f8YwUY8JRUsvo44dojLXp7O7ZOxnFWKAOy9N4AFP+UvgiMXJr1D6
         jdGg==
X-Forwarded-Encrypted: i=1; AFNElJ8mJXEUwWkYsn1F0IIFq3T3BcZ7zoyCFAsjfGpB+SmOS1UrpCV144JSOq8juiXTV9zyM8jEQ2KBRIJIn2fXG0ak@lists.infradead.org
X-Gm-Message-State: AOJu0YzZnPF7biEolItczJwwDea6zDAx5d+Z5wNVX3++WKDzJU4Vx55v
	Wrm5/nPSJWGcaEFRAJkjNVpq4WGrFjLyX5JbShKLBFdJtRLfs2IaxF4ivYoJ5C9uVKs+H7ba742
	oh+yxR8ApUPLlTbOO2dpE8OToMCjve8dggpBVQMXofnhVwgGFGyBXx3kz+M828ZTTVACCJLJ6AB
	O7
X-Gm-Gg: Acq92OE7u6FGklZDmmbgxxWbg51U0At6PhQxllVUJnIQODP5zD28/xMmPHMZZjB3ftV
	PecTVgSu/IjXyi8WHEpgy4aTY3kNrMbAWShT1B2XzYh4a3NxF2+jZS86Lbo2e5iJikKtUS5kdQv
	2G7pUkoGYgM2Lk9qY/EnphbHJXr1W3VK/ALD+23moYTpGDGWnjXZaIqbgsIN0Ux1gz1faTDkwgq
	OccKxzjL8fNUighocyqA5uESaJhDEiZ5lnUkpJZwTn0gxtlj3YS5aBtWud4jlKRn57MYY0yshCA
	nvxL2A5J4ITEaeMgg7K/WmO9k82xi96wEqm1L2n171vJaV3363Qa6i/F2wubpxOdVV6dOkadPXY
	ApxoECAWOQQ8U+7impqbLcIKUWyV+uIkISwvzaeqEc3xYrsyvr+4phRZP
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246380076d6.26.1778510665821;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
X-Received: by 2002:a05:6214:242d:b0:8ae:6587:3d54 with SMTP id 6a1803df08f44-8bf4302e586mr246379126d6.26.1778510665344;
        Mon, 11 May 2026 07:44:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b8398sm345352276d6.37.2026.05.11.07.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:24 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 01/15] clk: scmi: Fix clock rate rounding
Message-ID: <agHrRhvz_gHLpxPr@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-2-cristian.marussi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20260508153300.2224715-2-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r6hAjNplXXyUYIV82nTwWk68Rkxb3NUoO43fE9iSD2o_1778510666
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_074429_246725_780F8274 
X-CRM114-Status: GOOD (  11.14  )
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

On Fri, May 08, 2026 at 04:32:46PM +0100, Cristian Marussi wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
> 
> Fix by using the proper div64_ul helper.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


