Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27551067041
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONzYsQ9Lvpso6qoPVLSGT/mMAjCygdpnxO1bNOTpkLg=; b=Fk6+S1rWWlKwCT3Rfw963v9DXt
	IDu6c7T4BrlUNDL1lWZqFlH4LFpQF6iG1zLB3a6EGCFnrFh0ZSBsngAl5W5ww0rZpEaVm5+9BjT71
	Fj6K4X64hziW93zstr+JYeVVD9flIP8cFSEyM1tTNfAP317MAk/OjRsm/WguYEEabnAtrLNvcDW/x
	/KM93BCPp2O7864ElIEXFnh1AL4z9Pv4n8NZ1bnafdXs808GKi1W77fDD9UfxbHe377K7NXPEme0a
	kOfSS8CVt+Avht9CZ7lz2ygoS322uzHQp+Pqmc7LjjCadGJ1KAChrsFj4lPtVLte12tn5m4JeBMIl
	F6UAn0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hit-0000000EKjF-1kcq;
	Thu, 12 Mar 2026 15:13:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hio-0000000EKhy-2uu0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01C3140557;
	Thu, 12 Mar 2026 15:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2134C4CEF7;
	Thu, 12 Mar 2026 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773328389;
	bh=qmd4fXGEUkzPL6jhYNgQSGXEqS1ZGmKTp8UonTLZLQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebdNbp5cbrYFvu/hWOzgRU4Ul05aIdTTiYeQBIPAiyKlI7kQOE0Pk0YkJs30uZt3h
	 kClOsQ/Zk7NfcW7zo4COkkffexh4spyEBUE06ivy0AUm211C2Hau6X/PF19sMsbFQn
	 Y3kcFKcCufoeAludy9cYYBHM2JEK/3EsDY33SAATUwc6nUT1wRzknLWZ3QcRPphG7s
	 luxtVzblW04j57GM5exCqU0gmJNpNU1iu194tyZCYqGL5e0dkS1Uk3uTxbdLCMqg9h
	 vsZZ6ucqQGyOmA68+NgKJtnXghIL2y4cQVOfqXe56UiTyo6+ldTV3BbgZ193qnHwt6
	 1apNSO8lmaAGw==
Date: Thu, 12 Mar 2026 10:13:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: arm,gic-v3: Fix
 EPPI range
Message-ID: <177332838742.3145528.6567102569919276162.robh@kernel.org>
References: <3e49a63c6b2b6ee48e3737adee87781f9c136c5f.1772792753.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e49a63c6b2b6ee48e3737adee87781f9c136c5f.1772792753.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_081310_749432_983074E2 
X-CRM114-Status: GOOD (  10.61  )
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


On Fri, 06 Mar 2026 11:26:20 +0100, Geert Uytterhoeven wrote:
> According to the "Arm Generic Interrupt Controller (GIC) Architecture
> Specification, v3 and v4", revision H.b[1], there can be only 64
> Extended PPI interrupts.
> 
> [1] https://developer.arm.com/documentation/ihi0069/hb/
> 
> Fixes: 4b049063e0bcbfd3 ("dt-bindings: interrupt-controller: arm,gic-v3: Describe EPPI range support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Brain-farted-by: Marc Zyngier <maz@kernel.org>
> Acked-by: Marc Zyngier <maz@kernel.org>
> ---
> v2:
>   - s/v3 and v3/v3 and v4/,
>   - Add tags.
> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


