Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F895C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfACAF/PU6UgUb84VTnVhrrYtkRyaFUjHjmcb7xIiBw=; b=YboedDN18+RZhkJM9lpHhVn4o8
	Y/zCSichYhc9ZozO67KMxFyhLLEh+YYqQ5JcX/dM5hmhho0K16Q7jpsDwpRPF10Sa0ZKcYym21UHM
	jOO8s6VeyaOFI9xi7DU3iGO3u1RrxoI8pKfOrgUmIBbXikWnbhOfFON91pdhaLE0JXytr95jTo1Z0
	NAVNP3n5b1MMIvP1Zw53YdacUscZtE6XzkFYwUF0ElSkIsa0LQtzpvqXc118htNDS1uZSMJzZEsuC
	x1YGDNb4LpTserJ1TyRiN8nB4ks8H4r9dIeLlvMkBoq52ZSCMLFrUS9y0ckH9CaMUXZ4yV8u8JfZY
	ucRrQf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UBx-000000040bd-1v2h;
	Tue, 15 Apr 2025 00:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UA7-0000000406e-1nRE;
	Tue, 15 Apr 2025 00:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3CEC5C4248;
	Tue, 15 Apr 2025 00:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137ADC4CEEA;
	Tue, 15 Apr 2025 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676906;
	bh=oTSg9PqW0ApH3vnGI6tALTZWS8FtlZGVOxGxV9UY+jo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qtagIO5Bh7tMHKi76J3YLNRJu/3t/BRs4z1UzaiAraTJ+hPcaxx0OIajVEibTOH5e
	 59dtqk0lh2FBBcjbT+9y6BRdtvfnUBGTjN2pGulH3F7viPa9nBpyqAhQ2s3N07MNmk
	 /o45dsInA0EOks4tv4+ubezigfwC26jnlO9OBln0EBZHMOhwVm4saUnA47V7IlZrOA
	 /ZLeNyrFDlCeik8kvNWcwnjBJQQr1K2bcphwUORVp+AG4FWumoBEr944qZC1B8yVZJ
	 GzFcJyDRVwpfbta4iJ6lAC8euzpTLW5W7ebrJKx/AtR9WnHIIHUyKa8iVsMpRrQ/eB
	 LHOHe5tXRRMtg==
Date: Mon, 14 Apr 2025 17:28:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Davide Caratti
 <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v3] net: airoha: Add matchall filter offload
 support
Message-ID: <20250414172825.028f019f@kernel.org>
In-Reply-To: <20250410-airoha-hw-rx-ratelimit-v3-1-5ec2a244925e@kernel.org>
References: <20250410-airoha-hw-rx-ratelimit-v3-1-5ec2a244925e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_172827_524535_B5C606E7 
X-CRM114-Status: UNSURE (   5.53  )
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

On Thu, 10 Apr 2025 17:25:37 +0200 Lorenzo Bianconi wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:

Does not apply, probably due to net merge..
-- 
pw-bot: cr

