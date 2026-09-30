Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5125CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11MUmeJ35lf1n9sJklDRobBFWOCCy3mivuiJZJlcYCc=; b=YoD0HABStdq2v0ab338+NspFuw
	t0rVMfHHJh+a2QzP69kqdATyz4e4OO7tdI0DLTamqM9nGi7jWiUpNtSDaEKJpQdJw0pHmfbkOFKlo
	fO4oo3azbk+YslFzf1Ep0l/Rjx++d57jAUlPpfkrCsyGi9Za5+dU93cjgV4iLndS9Jff5Q81pmjGR
	JijvidD7eUpYl+hhseOkWyi8vFuPyXmpahunAYoRPM3PcQGLMKLS2D87r+szaXwBY+gmq0Mq3q5XH
	vQimzRYKq3WBnZSEvQvIJ40GZfDIfjQ3oMjTsBmaSAkFgRLdPvXvgxPsPeLBS3Lh2nVyISxb12mvr
	oCYv0Ang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqzc-00000005cl5-1hNC;
	Wed, 30 Sep 2026 09:52:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqza-00000005ckS-3Xhp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=11MUmeJ35lf1n9sJklDRobBFWOCCy3mivuiJZJlcYCc=; b=O+6o41wO00wRdDwNdJSGq1f2y7
	OqqXB4W6kcxq6fOmr+MwlPrJR150Vz1Eq3GM0sqlWq5Gc3ZYkjToKejrT3ugWnvkcZC8jNpU0eUZO
	ZlnU+6kLTnOovKYMvt20v+/CnKrpuWrCl4kgq0ZCRrdJEMJG20vNlIwbJMWD7pebw8SNWGPgWWzgL
	k05I5W+HYBJzzyC+ePuSSZjJHVR0+UyT1enTFRbYc11tY0ceIb2k1fcnW4dyvrcLNgQlFZLNZtI3J
	FtSrox0Uh5GbCAgbzpAn81O1IMZwRdHl9lv6Tn+EQbSO/cbpHshQbQOKhDOVGRkvIxWxn3iD04Tcs
	DxoSYAkA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqyw-00000003be7-0UiB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:52:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A999497;
	Wed, 30 Sep 2026 02:52:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35523F86F;
	Wed, 30 Sep 2026 02:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790761927; bh=Hh/kEdyKxDItZL2czsn11te4PfKPTHpLWgBl2v8d60M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwcKnvvqIEmedSeZQQhoIZ9dMjD4/8L9sRmwwDRYpF5LBg5tSZ3uGXpFfSzpOWsAE
	 5QIsULyPjCo/L2kedtkgNo68EQY4Kvo3Bsy16uGAYj2vLK1PKkBxuRmJLMY8KQf31B
	 vE6J/QkCbSMwI/cvCYa8EsEhr/Y4u7g6ZdL/mC4g=
Date: Wed, 30 Sep 2026 10:51:53 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v20 1/9] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <arzbue4Sdjt61lTu@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-2-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-2-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_105211_657333_D9F8BB3D 
X-CRM114-Status: GOOD (  10.00  )
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

On Tue, Sep 29, 2026 at 11:16:15PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM (Realm Management Monitor) provides functionality that can be
> accessed by SMC calls from the host.
> 
> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> 
> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

