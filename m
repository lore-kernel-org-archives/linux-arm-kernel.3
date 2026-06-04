Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56D1CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+cWsncRD03je/liyU9E26MvnIevGkcwfAlxMTWYAhg=; b=25pBlkUbtHFtWtmgUn2xa+Ri+S
	yC9s4NwguAM5KOvMMagSb0EBcagMosmg50V53SdjF2aCktZG9obsjPaOHqwE1ghpohD5ZrZp5Sjc2
	x5LBHvAlSUic/Xsvn8FbeKE1eWMntWI0glaTKNhs75YZyYnK9bRS/+EsK7UNSPBFB1e8Fr5N8O1oW
	rXmHMuE2XCo3Qtf/5eFEYpdlqwZTo0wi8UQvwjcqZ+xUGb916yqJ5sIZSiP1MvLvaK9UMzMhPTra+
	ETYqs8ig5BrtntbFO9Fi24rH3eTR81yTvp5lcsM3in0vsVxSqHoKPcstF13mKxhxoj8xMtZT8ht+J
	sMRscY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1m0-0000000GEYT-3KHQ;
	Thu, 04 Jun 2026 06:41:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1lz-0000000GEYM-1hx7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 06:41:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A3A260126;
	Thu,  4 Jun 2026 06:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37EA1F00898;
	Thu,  4 Jun 2026 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780555305;
	bh=S+cWsncRD03je/liyU9E26MvnIevGkcwfAlxMTWYAhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dEG1PuDeUMCxLZDz1wMI/Aeheib98GLI9JjfdvCRwyT0NIu0aAqSha66unrJ9nErk
	 9ZFBMDduEtEnPaeA6JmR9LG3OB/nPOfRw7L90ZqFY4Pws4gZUhZhfzdT+D6zNeXW7g
	 7+07ufCean/reg+uU4t5T7LPlj6llAEnvpAygzhwj/rXGAI2SXJQK8JTUsgIlxYZU4
	 Dba6NATbph5g3ptC2B055KghmxmnwQaS1WTVygXqz+lf6Px0ynBoEoV66k5vh+xL2o
	 p6y98fpeQ5ZfZPz9UidRuOU6Shddf4tP5nlNKfJEOGYn+W0c4H5GG+F6wpPORYcMqZ
	 t6XpPvQc5W3zw==
Date: Wed, 3 Jun 2026 23:41:44 -0700
From: Oliver Upton <oupton@kernel.org>
To: Jackie Liu <liu.yun@linux.dev>
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	yuzenghui@huawei.com, will@kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] KVM/arm64: vgic-its: Fix memory leak when
 vgic_its_set_abi() fails
Message-ID: <aiEeKGsLg9098OUt@kernel.org>
References: <20260604031426.16109-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604031426.16109-1-liu.yun@linux.dev>
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

On Thu, Jun 04, 2026 at 11:14:26AM +0800, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> In vgic_its_create(), if vgic_its_set_abi() fails after allocating the
> its structure and setting kvm state, the allocated 'its' is leaked
> because the function returns without freeing it.
> 
> Fix by rolling back the kvm state flags and freeing the its structure
> when vgic_its_set_abi() returns an error.
> 
> Fixes: 71afe470e20d ("KVM: arm64: vgic-its: Introduce migration ABI infrastructure")
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

vgic_its_set_abi() always succeeds so there's no actual memory leak
here. I'd prefer getting rid of the return value instead.

Thanks,
Oliver

