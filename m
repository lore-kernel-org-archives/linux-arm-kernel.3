Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356C4FEFB6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhVaOxSuQqtX5/NsvxVO8bCc/8RN8fKX4ofMnlverss=; b=X9+SFh0BdfyeLtj3wpDYhKZrx+
	zcroCljtXnyqkipaTMcVHJBHEut2JKvNbR+JS0d4Gl/qgScwNQmff26Ez86gUtbaK4VGLdGyy96un
	NCgGUOkkMRSJK+8ZoxA/2ertI1xVHBdqb13wvPmLo0WYeazkPgDHjXQSapXTABiPgBhQaSCy1/qJT
	b9NxHgBl4lMy0iUxB5hj6TRA5KMwWlArk57fKlL9b1f+IF+S7QmLsw2NlkBIHZWoeBQ6LSa07K5rQ
	nztLTgNepAVFeracibWDTnjmyDq9zbTwrgRIU6k6QXi1GyfKx12NVpWlUprb7xQKKagIEJ/nV4kTZ
	Tk0xD6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1G9-00000008ltg-07b6;
	Fri, 27 Feb 2026 17:04:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1G6-00000008ltK-2uQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:04:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE9D14BF;
	Fri, 27 Feb 2026 09:04:02 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD8263F73B;
	Fri, 27 Feb 2026 09:04:03 -0800 (PST)
Date: Fri, 27 Feb 2026 17:04:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
	zengheng4@huawei.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
Message-ID: <aaHOgZFWnjMHNirr@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <6051a508-1e77-4216-9b41-4b93b21c18c3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6051a508-1e77-4216-9b41-4b93b21c18c3@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_090410_792505_1DDB2E23 
X-CRM114-Status: GOOD (  23.15  )
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

On Wed, Feb 25, 2026 at 09:10:08PM +0000, Ben Horgan wrote:
> On 2/24/26 17:56, Ben Horgan wrote:
> > The main change in this version of the mpam missing pieces series is to
> > update the cdp emulation to match the resctrl interface. L2 and L3
> > resources can now enable cdp separately. Cdp can't be hidden correctly for
> > memory bandwidth allocation, as max per partid can't be emulated with more
> > partids, and so we hide this completely when cdp is enabled. There is a little
> > restructuring and a few smaller changes.
> > 
> > Changelogs in patches
> > 
> > It would be great to get this series merged this cycle. For that we'll need
> > more testing and reviewing. Thanks!
> > 
> 
> There is a small build conflict with resctrl abmc precursors, [1]. The
> last patch of that series applies on top of this series and if the abmc
> precursors go first that patch should go with this series to fix the
> build. Alternatively, if it's obvious ahead of time it can be squashed
> into pathc 33 with the other empty resctrl arch hooks.
> 
> [1]
> https://lore.kernel.org/lkml/20260225201905.3568624-5-ben.horgan@arm.com/

Typically we resolve these by having the first three patches in the
above series on a stable branch (could be tip as it touches x86) and we
can base the 41 patches here on top, together with the last one from the
abmc series.

Alternatively, happy to take them all via the arm64 tree as long as
Reinette/Tony are ok with this and ack the abmc patches.

-- 
Catalin

