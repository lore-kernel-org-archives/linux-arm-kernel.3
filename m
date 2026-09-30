Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F664CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQf5VlONXRq6xVW0TVypl2nLlOk0Bq5oPu4nZlDPXBY=; b=guxgo57tRJY0Di9khnjUW53x0I
	f2iVY67K6HwJXRH93h2bUrQ9G5tEQnFiPUCMDPWHSiBi5G50IW7iEGfG0VlWhd25KNC5WoxUNqCsR
	mgSNYZ1yeEaXFXzTne3I3Dgl4KjC4tzQ7O4Lw6AYs8/zAezGts0HlfafLyLaflrw8HXXvmMk2OSPA
	l95ieV8TW9ndEGmegWbb9ufoR3NofYNLvqQwD27BoJ9sh1XtzpxEVpjceJODUDjkVh/n0sTq2YyTT
	6yfNpDD61+2TaCCHO33VSIxiUtbKow8zsiOXaoZXX4UYYF+YJEb/Wg4dFRaeCfg+KLuB850dRRvq1
	fj/BT8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuF5-000000067G1-1zFT;
	Wed, 30 Sep 2026 13:21:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuF1-000000067F7-2SMJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 13:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aQf5VlONXRq6xVW0TVypl2nLlOk0Bq5oPu4nZlDPXBY=; b=muFD8ar9zLMCHoo4TlLVzIOmMz
	qijcteQf5T4yhqr8Oai7cUynpe61D7IHSj7CGOz+EoNi75fBnjC9fkvOMhBuWX+6lWPdspUmh9kko
	tnE1IoNV+BFvWYr/yu3B430bc6aPoA7zI1a/1L+9qGQLwCN8XsxoBlyIivYu5FbOfGxuRZAgLeQ5K
	GXixWg93Rn+5H3uMTWvafLytoHe7Kc+4iKzrTh3mw8CBUPqehy6dCHH4IiVqh3gBCO67CmHEJcAF9
	0290lSsCBsVfOksSlp816tvDb5NdUWsfOHTuxcOdickdYTOkC0RUqrRK1sUfTAaQStl9E9HpqQ2py
	2ZOqKznw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBuEy-00000003q8W-1rPO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:20:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B53497;
	Wed, 30 Sep 2026 06:20:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE9443FA32;
	Wed, 30 Sep 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790774454; bh=4wZDewP2RGse7Zw+zuVaU/BLnn4YFJizDqyyPy85DiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPKUrK15ML6CxeOQsAX17ABpRH/LJLKiH+0JPCvYi5MtaqlQKPWp/G5ufXIUI2gR1
	 xWv0ze54e5JV/G9+LO7+q6FRbJV3wNiVjUO19JzT06CYuJW9uih0QZ7RDNc3j+MThv
	 ZpnudoLQRY0AQVbuMtfzQTUpPrG8zL/VPdf9YgO0=
Date: Wed, 30 Sep 2026 14:20:47 +0100
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
Subject: Re: [PATCH v20 5/9] firmware: arm_rmm: Activate the RMM
Message-ID: <ar0Lksky-b81Eizj@arm.com>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-6-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929221623.1342076-6-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_142056_731074_2715D39F 
X-CRM114-Status: UNSURE (   8.79  )
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

On Tue, Sep 29, 2026 at 11:16:19PM +0100, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory
> transferring stateful operation.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

