Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A7ACF2560
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpxSrIQU4Sf3/HyIJxoBUoaffMWOknIQxE4wCm6ESrk=; b=nfUvSObKhSNz4US6Kc5d2lo1pB
	FxablXcz5GiyR2iz+DRxKLdki8st7Fp0SQApzgDEdPdIBASnQ/Z+BWWpk/NRVWsTl06PEvbBj4Adf
	ZjlwXqKmjvpaso6iatLXIPBWtDDkau9AG5S6KGUabrkvFNHnOJpydaMatjbGIBw3hwF0ihrZvGv48
	o5QNn3YCUFjHe+WKgM6wbPOuLqmIyYag2fOnKgooEe2zNwIdtlRCL/no0IhE6HocxQNRZRQAUfY2c
	MTCjD6a9mBiFzdyCAo1SrBUQWIfp1ZYi8fhK4+5Q4DGrMIj2tcwENQlYtNGCdhVgnw+jbFrxdp5aw
	M9U7CsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUbV-00000001Cfa-35Jk;
	Tue, 18 Nov 2025 22:55:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUbS-00000001Cf3-34VV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63EBC4183F;
	Tue, 18 Nov 2025 22:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6426EC19425;
	Tue, 18 Nov 2025 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763506511;
	bh=ECVRPnw3Dhpq/9Py1ARDE4+WGX1Y5233CDDNwtbgC2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svZ7gpGLXJyX4ewPplNwWJkALIe4g/9+nzUE8VUkPwZdgaYr5lRvzcfe7kaUPIjBS
	 4JZeuPH0pc1X2t9dl2nMGlWU3mI/oATcnOj0cHPwmpJX3GGiG5dD4xsMUiVDcd9Hqw
	 312jzLTzMoU/a8k50zucWfTuCcmbrmggU1p35wFAYUHZMtjhFXStNjOzR3LFZIqve4
	 Rdlcp5Qv4F81QWxFOtox33m80qTNMoFklv//0ag/RTuEiQKkmn6aABms8c5021usEc
	 pBBF9MYjHfN9a8LmgCmhX6xqPnhMl/wpOQdKcZirQ5YHKDwFZfLIZBi6nek4KKsqkK
	 hhyQ0PImEWlyA==
Date: Tue, 18 Nov 2025 14:55:07 -0800
From: Drew Fustini <fustini@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com, catalin.marinas@arm.com,
	dakr@kernel.org, dave.martin@arm.com, david@redhat.com,
	dfustini@baylibre.com, fenghuay@nvidia.com,
	gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
	jeremy.linton@arm.com, jonathan.cameron@huawei.com,
	kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	peternewman@google.com, quic_jiles@quicinc.com, rafael@kernel.org,
	robh@kernel.org, rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
Message-ID: <aRz5S/gnT9mhqN+7@x1>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <aRoG+UptQg9mix+7@x1>
 <753f4d26-efa9-4ffd-a820-7c2a53c0bc5f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <753f4d26-efa9-4ffd-a820-7c2a53c0bc5f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_145514_818023_72984CF8 
X-CRM114-Status: GOOD (  16.38  )
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

On Tue, Nov 18, 2025 at 02:11:31PM +0000, Ben Horgan wrote:
> Hi Drew,
> 
> On 11/16/25 17:16, Drew Fustini wrote:
> > On Fri, Nov 07, 2025 at 12:34:17PM +0000, Ben Horgan wrote:
> >> Hi all,
> > [snip]
> >> The rest of the driver can be found here: (no updated version - based on v3)
> >> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1
> > 
> > Does anyone know of a hosting platform that offers ARM machines that
> > have MPAM?
> 
> As far as I know there aren't any.
> 
> There is some MPAM support in the Orion Radxa board which is likely the
> cheapest option. The MPAM acpi table isn't in the firmware though so
> you'd need to load a custom table. James has this working.

Thank you, I didn't realize that there was a dev board that supports
MPAM. I didn't want to the expense or noise of a rackable server :)

Drew

