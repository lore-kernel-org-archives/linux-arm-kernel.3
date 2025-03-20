Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B87C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 00:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAmZLpDiMQYCKogBSFFB2PhtBHc71B8HKr7YGw2WdWI=; b=mYbwGXCe4K4SlkpA4Vl7kCoyfH
	m9ZoogRLPQJYbSrWrOHSJMWSXMf07FrKt16hAD+f4UdS4Old91PbLSQKpYDIQCxDq+moR7Wx8QfF6
	Ulz/zMUIoNMa0QXkVoPfbfBCd0CIKb8v/Y2DKCSoaUC2shOKFuL1hlaVxvRNREyU3cN+Z70jNQCnf
	hDa715Ws7T1VEo66zW6Rg0gHy2s9rENyQp2Ck+fVr9L5nJRuFYt4ZpCW+4VsMSemwamd59X7vYSgM
	VIgHP7SWbuhEoJ0t83mlIj1EbvSxQIYeTOhrNKKfFrArfiU7AAVLtRZfJv4+wEp28RlPgJBaJu0Ec
	4qPPbrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3ik-0000000Aby9-1YF6;
	Thu, 20 Mar 2025 00:25:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv3h3-0000000AbtU-1umN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 00:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B79A6166C;
	Thu, 20 Mar 2025 00:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48C9C4CEE4;
	Thu, 20 Mar 2025 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742430208;
	bh=PLlGPu13lwUvjhab9LGjWlYnOdDLh4IYoJeW/dS/6H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwvDFVYeRWNt4Go1WWNiDAksolgD/KKL9rClnuDhtRjnwagIXpaa34ntS/3ezBdt0
	 G90wIpvGRNU31jdHgMw6uqDScCnm3ptixfAnRMVRbVXd3wBVlxwRiMISO8h2nnLNMw
	 H+WT0q5X7YaN+1oyrlrBFCFuUVZc0UpiE/kzm1m58ywZ0xONuF/3tEkCYKqOkS8QSw
	 2xEStXdqjyZ0VqODkhM93DgOD0ueevOGWrU2ewNrUkJahusGrXO17Y4sqEYBch2P4I
	 7rAy/W0uMURLicaK2gwD6Wqn54om6hu1507zYiKACDS+wXEeP7DtEXcIhQeomsCxOh
	 FJvtfP3tQ+Ogg==
Date: Thu, 20 Mar 2025 01:23:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Message-ID: <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
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

Hi Sven,

On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
> From: Sven Peter <sven@svenpeter.dev>
> 
> Add the missing register bits to the defines and also switch
> those to use the BIT macro which is much more readable than
> using hardcoded masks
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Just this patch merged to i2c/i2c-host.

Patch 3 and 4 look good, just some comments on patch 2.

Thanks,
Andi

