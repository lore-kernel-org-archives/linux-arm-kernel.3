Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DBFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+F/dB8IVBgBEgFjNS5P8WtON/Q3cnLwScSTpV82+eo=; b=TPp2PREqf8BHh2zo4nelHkQOy3
	8H7gN1iNPscu386432ZIZsnOPyjNHUmFSlCCqunKGB5M69bznWJ3TRm6MlxhvNJ13WmODiVe6EGdG
	gZpc3uRG5D3knHu/iWPKMTT9uws43/dAHT9XQ8l1e3JcGA1rN7fLkvfgygEUM1msJfA1ou+mTQdfP
	V4sjz3cuA2oKszrTWV787SEWYXRyAHZYR2VBK6R6xot3x45cusv3fN29jbEZnm/7TYkvLlLGqE6Wu
	9FNUHP+a/lbZCT1mJrJrOV2MOtvO0ilCwu/eyScshdYjNq4PR3wSuRrEA9Jli7XZP9XpGgOQdYiky
	L4urPIWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1va-0000000Dm5Y-4BUp;
	Fri, 14 Mar 2025 10:06:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0ck-0000000DWIU-1vBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFEC05C4324;
	Fri, 14 Mar 2025 08:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCB3C4CEE3;
	Fri, 14 Mar 2025 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741941753;
	bh=VQS1Yr4tAB+kjagZmPvDSgv3gMXHVfCnmPEGOBTodA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aroWDp12uCjQCvTYtVLocTJeFM5M5VgtVNoNyOVNxs2UzKYMNijJ8Kh7AoXiHm0fm
	 JImb3CaJ94LBildurK4O+I8fgZZduBY26IBJJtbrzWKConLJUJHb+SOQL4TKEfs6U6
	 W6CakZRT9d4ootX3Z5IDjJrK++GuLL1ZExp0VgzK1g6qDMGfNa3Lo+Icy2+OHRNInB
	 Y0/tEyw/yfU0VUzvO9jQikWmv24uK8U52DNjnllVLel6jZ39DVEkLROngw66uUYfQz
	 TRjemEdizSl30kWlOrNBZ6jJill4vzcv9qIKviCYIW/tEm7bI6gL936PODFY99wd9G
	 tCDv94y8VsYEg==
Date: Fri, 14 Mar 2025 08:42:27 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 06/10] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <20250314084227.GJ3645863@google.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-6-ae8302358443@gmail.com>
 <20250313132036.GB3616286@google.com>
 <ef190ba8-a5c7-4a1a-90e6-2610de00e4ed@sirena.org.uk>
 <f363c1ce-8612-476e-a5d5-c3cb358bf50a@gmail.com>
 <20250314080022.GH3645863@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314080022.GH3645863@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_014234_540284_1F17B7B7 
X-CRM114-Status: GOOD (  17.85  )
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

On Fri, 14 Mar 2025, Lee Jones wrote:

> On Thu, 13 Mar 2025, Artur Weber wrote:
> 
> > On 13.03.2025 14:25, Mark Brown wrote:
> > > On Thu, Mar 13, 2025 at 01:20:36PM +0000, Lee Jones wrote:
> > > > On Tue, 04 Mar 2025, Artur Weber wrote:
> > > 
> > > > > +	if (id != bcm590xx->pmu_id) {
> > > > > +		dev_err(bcm590xx->dev,
> > > > > +			"Incorrect ID for %s: expected %x, got %x. Check your DT compatible.\n",
> > > > 
> > > > Isn't it more likely that the H/W this is being executed on is
> > > > unsupported?  If so, say that instead.
> > > 
> > > Given that the compatibles are device specific the driver shouldn't be
> > > binding if the device is unsupported.
> > 
> > Yes, the intention here is just to make sure that the DT compatible and
> > hardware ID match. Unsupported hardware would not have a DT compatible.
> 
> Right, so the user is utilising the correct compatible on the incorrect
> (most likely unsupported) platform.  When using a supported DTB on
> unknown hardware, the driver will bind but fail here.

If you simply drop the unnecessary "Check your DT compatible." part, not
only does it tidy up the print / line, it also covers more bases.

-- 
Lee Jones [李琼斯]

