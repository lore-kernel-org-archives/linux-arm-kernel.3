Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3D1CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uTAAIuJ4cVZdZYoK/KXpFZRggMZT5MarFhidf6c9A4=; b=wWzuaK7rL1ylSD1n45n077iGFs
	PNTNoECLQEpXOWffRS5QlDC5WWVxf3QMkalQAKNq/EL4bd8mTfQ1U3GDpeyCkRqYSormbB3CvlRzk
	Q73MAgGdHRsm8xzO3LQHNdVTLchgh9e82Bl+2lPwjp0nwjc0ZF2PRuLR5Zt91R+lW0TvEkLhVK24/
	8JfmQ8UcRGlG2nQvYIbf5xooxP+5xvNWqUYLaB/nRWipR1yNZJyksHSKfTuDUQYgbMIR5rXtU1rOW
	0XRfFtbyS9Jjhqcp3aW663WcDE3R8Y1YVCX0TbFpyLcihZ62rsBzk6SgXFVhofIEXwyXnXrERwnu0
	2c1cWemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCF6w-00000008eUr-17PD;
	Thu, 01 Oct 2026 11:38:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCF6u-00000008eUl-0mZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:38:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8DAC419F9;
	Thu,  1 Oct 2026 11:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854931F000FF;
	Thu,  1 Oct 2026 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854679;
	bh=+uTAAIuJ4cVZdZYoK/KXpFZRggMZT5MarFhidf6c9A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=owmb2avYwgYjpPDOgFaY4OK9bgZasHXnVO1SSc9RvVuEk25I43mulFVpU34i3MFQz
	 EVN4xJwdbpfoa7mxJL8k4wiIYyLIM71wFWczqwQn1C56JEg8DtzeVXuJ6HxmN/B5sB
	 3c4kJDgRckEQ9WzlvMBI7w65grL+t0C5oSi1aoB0ffhdbWC7jkrfQvZAVnOem+//rM
	 JPdF21oc0y15A2M1FOFS/mV0XnmGK4ryT+0gsUB+egdy2ZCIxSbvKqFUbWC052douM
	 +bYHCrzDWUYJaRL/9+/tlbrGeRx4tQot/0DdqDejT7EzIDOMBAj8Gze4fFnF5DSZNL
	 gHUXe10VLukjg==
Date: Thu, 1 Oct 2026 12:37:52 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 05/15] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
Message-ID: <ar5D-SBtUCqAz0CM@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-5-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-5-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:15PM +0100, Mark Brown wrote:
> As per DDI 0487 R_WTXBY we need to manage PSTATE.EXLOCK when entering an
> exception, when the exception is entered from a lower EL the bit is cleared
> while if entering from the same EL it is set to GCSCR_ELx.EXLOCKEN.
> Implement this behaviour in enter_exception64().
>
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

I think this was just nits from v20, all LGTM so happy to re-tag:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo

