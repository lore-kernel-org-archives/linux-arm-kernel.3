Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA486F327C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9sQxwKpJf93U7RuYjrl3ZgY9mBuqCcy1eEU5QIPNTk=; b=cEDwl3DzzuC41TR6XRs84Ra76m
	szqNdp4KNquq52HU7wZYBquWH55ydp9otTwXdkykgYwIUDjsIE+JjN7y02b3gO4zMw8g9/42zwG3K
	bQ+cL7cyj+bd9GTreHV9wz6cEkyDWHU5nLGxMjjxtZhT3SVIOZOpLHjpH6Xv7g4HkTiTP/7uItvuF
	CQT+EGevS9JN802NDd5jMk5pSfaIMKvP1CrhxK7i3Dk35NX/TW48c7xp2Y0Y4xOH6GXw0H6wS+UPh
	k67eczX7BKKoW4drZuRe73wfKirNx1ffYj7f5oZ+B9tkZ60fO5xxvDcoP6gMDxERGWoUj6kTx6RBs
	CORoESSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6p4-00000008HIw-2CAQ;
	Tue, 21 Apr 2026 08:51:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6p0-00000008HHw-3pbD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 08:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D47560120;
	Tue, 21 Apr 2026 08:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599BDC2BCB0;
	Tue, 21 Apr 2026 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776761466;
	bh=MEcfYsbBJrV5oQCJrkPYya9PsDdj0dGclYzGZ/NMaoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rv44PtdNr22dtKoHbGMuLuFFdDw3bvbNc/DmRgWcVmzuLDomT92rSJwcxKDhGkp12
	 uChD5+vAcrJkapF5msWb3hc0PiiVDwDmzlGoauk1Rp2hY32637iD1HS2jLeGWkvp+x
	 edMAVyiQGC5RxPdppq0LUGkGu6K9qFCKeVben/2I3gES4JuF8UARLHj1qiTyCwPE/u
	 m+NtImr7q56WBR4t+1HZKryZVgRkH7dBrpFJf5zKucpkHEBCOhpxF/pM8sKE3OdSmT
	 W4UDnvSbmjKR5A1xIvcAbgjSGw5+Ln1he9pK+LXtZse27pu1GgMaEzU++/Z68J8qj0
	 l7d6KLvBeommg==
Date: Tue, 21 Apr 2026 09:51:00 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <20260421-married-liberal-ammonite-dffda8@sudeepholla>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aecf57rWloQwDh6v@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aecf57rWloQwDh6v@e129823.arm.com>
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

On Tue, Apr 21, 2026 at 07:57:43AM +0100, Yeoreum Yun wrote:

[...]

> 
> Also, the FF-A initialization is not driven by a device probe, but rather
> happens as part of the bus registration itself,
> so it does not fit well with a device_link or probe deferral based approach.
> 
> Instead, perhaps we could go with the idea I mentioned previously:
> either introduce a notifier, or create a pseudo ffa_device
> once pKVM initialization has completed, and
> then let the ffa driver perform the additional initialization from there.
> 
> Am I missing something?
> 

In order to handle/cleanup some ugliness in interrupt management in the
FF-A driver, we may introduce DT node eventually. But it will take sometime.

-- 
Regards,
Sudeep

