Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C70C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntfNJBiNkhpiyDicL/SzZGec/VqCZFSbVnQ9ysVYwHE=; b=2tnHzvkB3Td3VcEfpQoaZ0QBnM
	Lhq91L8rrdVzXw29Z/SewbWzimikF2aq8kxr+AotzJAJULlcCxfheyS1FhpNza9Z7m2z7Z/P8vmDc
	LPDojK37DwMd2LrUcYG1uE9VvRrvizdq6uum+FybnWCxQHCYX4RNyF/+iHvRvlYn3yM2EHRASirjW
	BxU/m9/Z3V0LYsJxcShWASTazSWaOnjBRiGiE8xHFfvCdeLwsNXbsZZoS4ya4oLJHP6sNhVS823HL
	9kx8R9y0/ktoYCUPLlwsDDmjP41y3PCTPPrSuHC+JkuyN979WxUDwvsAGzMWjsnjvJWixhyoI7P2c
	A6kh69nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTxM-0000000421w-1CVV;
	Mon, 27 Jul 2026 22:37:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woTxK-0000000421q-2y74
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:37:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDA1260008;
	Mon, 27 Jul 2026 22:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E881F000E9;
	Mon, 27 Jul 2026 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785191873;
	bh=ntfNJBiNkhpiyDicL/SzZGec/VqCZFSbVnQ9ysVYwHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xcr2ZhkXhg7aBbwaoTu04yPSZsUl4WcmtFKLuoFsmZNkordwS1AuuITyV47NftNDq
	 +VeMsmfOqSg0mzCxmf1z7HOkO/DxklmIlELqJe/UGzL+n5InMhS0LwX3Vqd/JWlmEz
	 lFAJhvqUax8JwtdCG19FyRgphlJXobKzHs2xJINT4MdZlS9x+Zs6qek25jAGu+kAzK
	 LFv4b9tUvs+OhRVFvRvsVOXnPWM/zqxQTA3aWnStkjHDVy68AYeQyG/2rJs7LaJ2Jf
	 i8r6H7dPDeHm2aEXDb1jiEV6oSQyszliGDQ0rfJoU5jjvPspuMLTKAVmqrFsQpnxq0
	 N2TKdT/aQNTLQ==
Date: Mon, 27 Jul 2026 23:37:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
 <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>, Srivathsa L
 Rao <srivathsa.rao@oss.qualcomm.com>, Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>, Trilok Soni <tsoni@quicinc.com>,
 Srinivas Ramana <sramana@qti.qualcomm.com>, Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/10] arm_mpam: propagate MSC access errors for MBWU
 counters
Message-ID: <20260727233749.3c44257d@jic23-huawei>
In-Reply-To: <20260723155454.1760823-4-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-4-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 23 Jul 2026 17:54:47 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the mpam_msc_read_mbwu_l() function to return an error, and
> propagate errors from the lower level up. This also changes the users
> of this function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

