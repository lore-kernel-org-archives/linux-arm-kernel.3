Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C6C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bFH2hUE48gz/KB7O6y02J62w+mIlyTKOUySKbsKRYY=; b=G2YwAvU50m+RiUl3S+3IU4aMJ7
	D3cPi80WZfHe6FkpZT7UDO4Owld025//IbRDnHhkaPsmFsXfL9ksc3TJcGHGIfSFYPO8AFZdP638t
	oFGU3+7wPEBNww3NqptvCz5bqwbadsbfX5Z0m/KNyKCVQdxoDTjn8rm9b/LerYI664KBXpe7vMnPA
	jQ2lC3VwRppikTnHuqn4tpsQmUKd6q0CG7QxOtWrQAbtHWnTBOQzgho2CJAE2wsFmAzKSPRBcWiS2
	AlpN+q3ljFf7BPys5p+98N8XOn4AyrK7TimopDrhf+JwkNgqqmxgFHrV+Lsk2CTR0ZNkyJGiqvlK0
	cqUJwrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNLZ-00000005CLn-1mrD;
	Wed, 26 Feb 2025 19:45:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNI3-00000005BmG-0fvn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98ED75C74F4;
	Wed, 26 Feb 2025 19:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F09C4CED6;
	Wed, 26 Feb 2025 19:41:51 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:41:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v8 5/6] smccc/kvm_guest: Enable errata based on
 implementation CPUs
Message-ID: <Z79ufaZULK15EUk2@arm.com>
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
 <20250221140229.12588-6-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221140229.12588-6-shameerali.kolothum.thodi@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_114155_255933_53AB7941 
X-CRM114-Status: UNSURE (   7.06  )
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

On Fri, Feb 21, 2025 at 02:02:28PM +0000, Shameer Kolothum wrote:
> Retrieve any migration target implementation CPUs using the hypercall
> and enable associated errata.
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

I can see ways in which this can go wrong but, in the absence of a
better idea:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

