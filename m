Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47559CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53MBMVpYsah1G6NU1zmq3jtKdic1Gk+mrU5myoZHcTw=; b=0Sspg9ZM2VL9kfl94wPFhW2K8D
	hPmLHxA+Qcfpd6JC2vk1KUsdM9RydxT0fWVF+GMyh8/V1J03SSC3g/u7TofSzzMfKv3Y1z1jVB115
	a3e0hLY7JfQyeI+wu3IqA9mNzHsKtRtbbNUsHxs8zBm/VCNxaOHawLP/mJ99e+dwM/gUVjnlfkjRv
	qpZLkEk8cWeUXOSFYsT9/kgACsA9hJ6TXm5AOSig4yYzQ3JMhwccJVy0WK/orT06Cgr7G1L4sZjLB
	GDroVNYa7NxuWf1UyC8KYhNZkS2ZtDtBzWfaCrQlPa8iP5iHScnKTlifVKUXEAy0tggxNWp3c3Jcp
	A6RqRkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2rw-00000007mEZ-0Grb;
	Thu, 21 May 2026 12:51:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2ru-00000007mER-2NS1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:51:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09E75601F4;
	Thu, 21 May 2026 12:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399F91F000E9;
	Thu, 21 May 2026 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367877;
	bh=53MBMVpYsah1G6NU1zmq3jtKdic1Gk+mrU5myoZHcTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkToSujNclyXcE88OzhY40ufvQn2cBGui3KuvHUppU/C9uik42OSCjbIQqlUp0FIf
	 01BFXGNtxBBf3a7CeCM8rndojcNt2MN8sA/1RQ2dVXcqPbR9TmXZXbD8RY7XQRqVuq
	 vzMNbPTwmKMeuUjg4JGCRHdyGZkz/GkwGF4/E12viTb43aA+fqmDHYM2cedyi5ikYR
	 ochACvQ3dea/2IQoJjm+7upgYdeJfdaaOItq8r+auwNgK3PZWxquM/lO3XeDuxEH7T
	 xRvHLTIceWp0qqY40Cg6lcme/SuObotCdw1AP8VMP9uTfFKj2C5PgG+k8k8rGhLdBR
	 BXz1IUF6qogcA==
Date: Thu, 21 May 2026 13:51:12 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, jens.wiklander@linaro.org,
	sumit.garg@kernel.org, sebastianene@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v4 2/5] firmware: arm_ffa: Fix out-of-bound writes in
 ffa_setup_and_transmit()
Message-ID: <20260521-gleaming-shoebill-of-artistry-5d738c@sudeepholla>
References: <20260520204948.2440882-1-smostafa@google.com>
 <20260520204948.2440882-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520204948.2440882-3-smostafa@google.com>
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

On Wed, May 20, 2026 at 08:49:45PM +0000, Mostafa Saleh wrote:
> Sashiko (locally) reports multiple out-of-bound issues in
> ffa_setup_and_transmit:
> 1) Writing ep_mem_access->reserved can write out of bounds for FFA
>    versions < 1.2 as ffa_emad_size_get() returns 16 bytes in that case
>    while reserved has an offset of 24.
>    Instead of zeroing fields, memset the struct to zero first based on
>    the FFA version.
> 

Neat, I clearly missed taking this approach when I added zero-ing of
member initially.

> 2) Make sure there is enough size to write constituents.
> 
> While at it, convert the only sizeof() in the driver that uses a
> type instead of variable.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

