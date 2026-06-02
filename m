Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68980CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaaHWrkz1CVZgfrqY6bPa0dRB0HAG6XClP9O/n9xu9g=; b=IhLeXZDnoCIas9VCQ6AjGDxltR
	FvKgFpEek4xPlQvFKStg55/WfoUT7URQT3YpfxAUhKBT34boXBPxFf1und4oyHpFWRYcM1f7s2N3+
	OJ/seCK2OYif9fFHcIoxWEsi7RBNUCYbvlpRvZfHWTFiwJ2vbF90GqWVANBgG0QVaKZ221570bj2v
	DtqmQKYQlGPYtW3Z3PIt6Ljwe8xqkW0+NlEdC4A3ktTC4mLzjoBMoECTJItY2Aec0iKNMVM2VRhKb
	yEt7q00umAHhEUQeWAowio6xCyv1NbzKbrMMzKgbe32q4FGWam000CUCxSci0aj12dhIjII9v34w7
	2jD9MPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURLm-0000000DMVG-2Bsz;
	Tue, 02 Jun 2026 15:48:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURLk-0000000DMUk-1f9p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92DEB418EC;
	Tue,  2 Jun 2026 15:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D381F00893;
	Tue,  2 Jun 2026 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415294;
	bh=yaaHWrkz1CVZgfrqY6bPa0dRB0HAG6XClP9O/n9xu9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aw/R6Bb8N4oC3YLCZbbKVq6FxNdny3Vf+XMloInImnwUabwTe884CUlUN+H0CFBGF
	 wRRPz/8sAKSy7AjJwXxVD0QXS60pq9JOgdiF+oetUw389hwUWHP8IYLkJq5KNftw7P
	 lyj47LhNLiVo/4ZQTZG1dsteMvXxhvk4E1nHx0fuUOwPrhY71h6MvOxgHKfID1B93x
	 sMbYhG9X9YkKSwRvBm2hgtzRKtYSBi8gZEVLaWZShZUgg1D3KvkEz1O3LypHn33Nnv
	 KFwFvK0oB1FHe8CDBXSlsD7kaZkDLFS2SGuajPo44eXtahw/8iCG0x8HclSg6lOtl8
	 BWFxkAWq/qhxA==
Date: Tue, 2 Jun 2026 16:48:11 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Seth Forshee <sforshee@nvidia.com>
Cc: Sebastian Ene <sebastianene@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: arm_ffa: Fall back to minimum buffer size
 if RXTX_MAP fails
Message-ID: <20260602-defiant-perfect-bustard-cbf22e@sudeepholla>
References: <20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com>
 <20260601-b4-ffa-rxtx-map-fixes-v1-2-c071b12ae05c@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-b4-ffa-rxtx-map-fixes-v1-2-c071b12ae05c@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_084816_466273_331B11E2 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, Jun 01, 2026 at 03:45:12PM -0500, Seth Forshee wrote:
> FFA_FEATURES only supports a maximum size value for RXTX_MAP in v1.2+.
> Older implementations may still reject larger sizes, which can happen
> when the minimum size is rounded up to the page size when PAGE_SIZE >
> 4K.
> 
> Fall back to the minimum size when RXTX_MAP fails with
> INVALID_PARAMETERS to fix the regression on these platforms. This also
> has the side effect of falling back for v1.2+ with a maximum of 0 (i.e.
> no maximum), where the rounded-up value isn't expected to be rejected,
> but there's no harm in retrying with a smaller size and it might even be
> of benefit for a non-compliant SPMC.
> 

Is this needed on any of your platforms ? I don't want to push a solution
or fallback/workaround if there are no users for it.

-- 
Regards,
Sudeep

