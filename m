Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E465CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YCjU47KtDqMMbgkRAigx09Mh54rE9MoZ3613ZX642s=; b=s2fLRyY5C28i3JcN8i5/X0jpxZ
	j0Hs4IIgFl5V0Xr5X+mf9Pz39RIw2DQyLoY9qZGMzzDBPARRjowZPrkYSnuWk8zrcTTvowH76eCAA
	tB92NIeq+2lmWN2akb4f2SIjflU/UzAp8uLCDB/SU937mThfL+5JaVaADU94oNqlMJS6rqfrOjgKP
	yy/qRrxrbZ1Jy5WIcN1noZImJNcAL/j/krIs0FZLG9tZEvAoMdDT2XR4h+RLhPk6QTHOnjAC1JvO4
	+vacGhpEEgiTAp7GjI/wGe9pp3Ecs2WR9fu52khDF8atA3Y+9lcjt2nxmmwrzFVepW5eAH2g5HIEI
	aUzOGguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiPM-0000000CJfH-1ace;
	Fri, 02 Oct 2026 18:55:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiPK-0000000CJeh-0x4L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 18:54:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C88832F;
	Fri,  2 Oct 2026 11:54:51 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30D0A3F86F;
	Fri,  2 Oct 2026 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967295; bh=eGyVz0XZ7ALfqOkWbgpzgS0+QvE7rRsIYQwZXuE1Epk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5d6587sIYW1teJ+JCZw/MuPJPkPcScb8vRR+okpH3yRb3UfkT/FLxU/rRHPboLNk
	 aSalYsWP6FpIDH+l+Puf6SKjolRuCDc09N4cl2KRgY+2JPJ4iHk06zcIil5uh9d4sb
	 3yTLaRmqKr4UV+8PQ6zGh1EaWyqTbcSU2zp6LdCM=
Date: Fri, 2 Oct 2026 19:54:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 06/27] arm_mpam: Use __ris_msmon_read() for saving MBWU
 state
Message-ID: <ar_9-3-ciXNoALGI@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
 <20261002173941.292319-7-james.morse@arm.com>
 <28a89543-1199-486b-8de9-54d69a14e723@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28a89543-1199-486b-8de9-54d69a14e723@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115458_334829_87D78264 
X-CRM114-Status: UNSURE (   9.40  )
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

On Fri, Oct 02, 2026 at 07:52:31PM +0100, Ben Horgan wrote:
> > @@ -1708,17 +1715,36 @@ static int mpam_save_mbwu_state(void *arg)
> >  		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
> >  		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> 
> __ris_msmon_read_locked() checks the _CTL value and reconfigures on
> mismatch and counters to be lost. This needs to move after the
> __ris_msmon_read_locked().

[...]

> I'd put it here.

Queued already on the for-next/mpam arm64 branch. Please send fixes on
top.

Thanks.

-- 
Catalin

