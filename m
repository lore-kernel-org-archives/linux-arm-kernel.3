Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7246EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJx0RMOQzLEeoQEOowvKuV4McVZIzUlDCT0lM4MZ6YA=; b=eCeu/PPGlINy6Evd3BcqIN4bJ1
	ZwPuV06LWIZwYZukHiWv0qxQXO/KuIP9YRuJaawgtw+89czqh9MbihcECBT/VIAWNqKq3FBFDJzWt
	SpwsK5ys8979WZb8IwxtjlaRrhCnVtvhW5DryUUIfpgTE8GS9UXuUIDwZA1kogHY+ZvhnTqj1Od22
	lZjcFVsLADVPPsk06qYWso1OXYFxxa14DL9btfdzb1PM06g1GSLNejy0JJfT5hv64t4SIUpXgUSEz
	SK3VkdbucFe7z5K59kod3PCWwheooD3Z+iyJeOFrsjrJBC5EOrCqD0vYtlQS2PwtEyKLG+lmzx1IQ
	IonQWSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1KR-00000004hcg-0bZ4;
	Mon, 17 Feb 2025 13:38:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1IH-00000004hAp-3t59
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C59CE13D5;
	Mon, 17 Feb 2025 05:36:33 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9EB3F6A8;
	Mon, 17 Feb 2025 05:36:13 -0800 (PST)
Date: Mon, 17 Feb 2025 13:36:07 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: james.morse@arm.com, bobo.shaobowang@huawei.com,
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mpam mpam/snapshot/v6.14-rc1 3/5] arm_mpam: Provide
 conversion method for new closid/rmid pairs
Message-ID: <Z7M7R8uf4g2C68cO@e133380.arm.com>
References: <20250217031852.2014939-1-zengheng4@huawei.com>
 <20250217031852.2014939-4-zengheng4@huawei.com>
 <d7069933-903e-9e1e-d7a4-5a6a9fa53064@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7069933-903e-9e1e-d7a4-5a6a9fa53064@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_053618_016577_E1F9E2E2 
X-CRM114-Status: GOOD (  23.64  )
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

Hi,

On Mon, Feb 17, 2025 at 02:18:44PM +0800, Zeng Heng wrote:
> Hi Martin,
> 
> On 2025/2/17 11:18, Zeng Heng wrote:
> > The MPAM driver statically assigns all reqPARTIDs to respective intPARTIDs.
> > For the new rmid allocation strategy, it will check if there is an
> > available rmid of any reqPARTID which belongs to the input closid, not just
> > the rmids belonging to the closid.
> > 
> > For a mixture of MSCs system, for MSCs that do not support narrow-partid,
> > we use the PARTIDs exceeding the number of closids as reqPARTIDs for
> > expanding the monitoring groups.
> > 
> > In order to keep the existing resctrl API interface, the rmid contains both
> > req_idx and PMG information instead of PMG only under the MPAM driver. The
> > req_idx represents the req_idx-th sub-monitoring group under the control
> > group. The new rmid would be like:
> > 
> >      rmid = (req_idx << shift | pmg).
> > 
> 
> To consider future compatibility with dynamically allocated reqpartid,
> should I refactor the rmid?
> 
> Instead of defining rmid.req_idx, we could place the entire reqpartid
> directly within rmid. In This way, the allocation of reqpartid will no
> longer be constrained by the static allocation of closid, facilitating
> future compatibility with dynamic allocation mechanisms.
> 
> In this case, it needs to refactor the resctrl_arch_rmid_idx_encode()
> and resctrl_arch_rmid_idx_decode(), and we can simplify
> closid_rmid2reqpartid() to rmid2reqpartid().
> 
> What are your thoughts on this idea? Thank you in advance for your
> reply.
> 
> Best regards,
> Zeng Heng

Does this mean that the RMID must be expanded to cover all possible
(reqPARTID, PMG) combinations?

A single reqPARTID cannot be allocated to two different resctrl control
groups at the same time, even though a PMG value can be reused across
multiple control groups -- so it sounds like your proposal would
require changes in the resctrl core code as well as possibly requiring
a larger rmid_ptrs table.

But I might have misunderstood what you are proposing here...

Can you illustrate with one or two examples?

Cheers
---Dave

