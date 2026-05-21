Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE264CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr/9hqel5Ty7gJs+k9crOmQVKqRYap/VGhhoyrbDA9w=; b=WE66pvzkGdcsZzHHnkcwsP3KYR
	d7AhGFlndFa77k96w9HGSlS7qtzfdYgHQUQgrk4StSUCC70DMUImiiKUewrga8T7RRoofQdroqh5y
	t7E+w6OGOT2nT1tEUR7TXI7wiX3dmLKXFUCDgcq3LYQNbgnLqtGi6EfHqltnPgCd/JMNHr9Vkv15A
	H29EXPXRSus1teN5Y8MLN7zecr687L2D5aHa1K7HUwu4amD9BbyoYrQw+bvI2kKuy4BB9gouSd5Ny
	U4WEXPtQDgjAsGn4gVyBh04K892LKsxHkoDhoJVlmUqN8FYC1t+aG9twxNN6QU1DN3FH+CW03AUHx
	ygw6nCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2vn-00000007mv8-2zUs;
	Thu, 21 May 2026 12:55:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2vm-00000007muu-2Oru
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:55:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09A2D601F3;
	Thu, 21 May 2026 12:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B23E1F000E9;
	Thu, 21 May 2026 12:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368117;
	bh=Yr/9hqel5Ty7gJs+k9crOmQVKqRYap/VGhhoyrbDA9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XpgFNDcZjIVY1mOkaN0Kgu/WBJ513yFFIh2BykmcZhcM0Ly8zIOzBatosDmsUVOtf
	 9WlpeZpBVuqp58MnGm57uDZ/B9TA1HUAyX3LLDbZk1cvWvT6XDr+UcTNEaUsN0TeUH
	 8MzKqr+28wazSELnUGFpFEJjLWTLsyl86+yJosRYlvhlWFYKarbvrku9JD9aeEp9ud
	 XaLXCSNQ923dEvXzPQPJ6DbW5t0hJA94ProbfTBUWOnRSgJBdCV0b9m55kIEr1LCp6
	 TXyAPDKwbYRzzWRQiFtv/VLqsMOf3saXZrXsGkbKbVUbOMYSRZF6NAtVHk6BmW2zdv
	 BOfYgZe4dRE9g==
Date: Thu, 21 May 2026 13:55:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, jens.wiklander@linaro.org,
	sumit.garg@kernel.org, sebastianene@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v4 3/5] firmware: arm_ffa: Fix Endpoint Memory Access
 Descriptor offset calculation
Message-ID: <20260521-lynx-of-uncanny-intensity-9e37a1@sudeepholla>
References: <20260520204948.2440882-1-smostafa@google.com>
 <20260520204948.2440882-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520204948.2440882-4-smostafa@google.com>
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

On Wed, May 20, 2026 at 08:49:46PM +0000, Mostafa Saleh wrote:
> From: Sebastian Ene <sebastianene@google.com>
> 
> Use the descriptor's `ep_mem_offset` to calculate the start of the endpoint
> memory access array and to comply with the FF-A spec instead of defaulting
> to `sizeof(struct ffa_mem_region)`.
> This requires moving `ffa_mem_region_additional_setup()` earlier in the setup
> flow.
> Also, add sanity checks to ensure the calculated descriptor offsets do not
> exceed `max_fragsize`.
> 

Core change remains same as v3 except improved error checking, so my
review still applies.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

