Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF104CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sETUeraPm3lDWt83CkBlDnReof1JzvEfPtq12I0od7o=; b=kEb1X5XqaiKHGai18c/gHiEhx+
	pHRdIS+RczMZ3DlpSUNZVQ8JQsOX+hvqeBLrEq2QD2FKSxdE5uLZUjzXXb5oDMWiJFcFaAwv3AOYJ
	YJnZaStb9MdrotKcal26FnrrmiPa4Ojjj+hqqnW+OJqraqJThVmqYh8aosaPU7nca+jSXSBgACywB
	lEQ6AACOzqSI1dSxkFMXgpL++MWoYmclZ3mudK62na7xY1Fjrryw2qeDkaP9WrWcZo5TIi11aBJNa
	JQ8C0bVyCdJKTDeZdf6EON/5B0QFENOAnTPnZWbRWWAwCwzL/SbQOEb/DWIabfyotbqV1p/0DmMVp
	Bea/4PFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzxm-00000007s7n-3Wi7;
	Fri, 29 May 2026 16:21:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzxh-00000007s7G-0zuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:21:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93BFB401AA;
	Fri, 29 May 2026 16:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B72D1F00893;
	Fri, 29 May 2026 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780071688;
	bh=sETUeraPm3lDWt83CkBlDnReof1JzvEfPtq12I0od7o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UhtkOfg5tpU58A1puKZrFMJv4+ZSY+eHsk+EjpC/uqcWBXgkP8itWmK0dw0GnzJBx
	 v39RsyJx6rpSPrPEqDUrnbFCdXnf7nsoynP6VjDU0VDApCY4+N+cb03Di9yd91jFWD
	 n0LbFYZc8LZCA9ejD4EqmuVDmZTw9bAR2jSr/cZIxUOZo+iR/2vi/KlLQuTWt4DILU
	 wpiss1Sz6+OBpgYvYpF7U47lZb2JhC4gjIkVys1sKHhI/N3hi+LRqtlsFP5gZTKPpx
	 OumseINICIYyrn4mJ+bECl0Av1JejR9IwFfjvfDzXb9/D9D24Y40MRhZT03818uWla
	 NUrG5X2QKk7fg==
Date: Fri, 29 May 2026 17:21:13 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 07/10] ACPI: APEI: introduce GHES helper
Message-ID: <20260529172113.74c4ca05@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-7-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-7-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_092129_296027_58AFF36D 
X-CRM114-Status: UNSURE (   9.38  )
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

On Fri, 29 May 2026 10:50:47 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Add a dedicated GHES_CPER_HELPERS Kconfig entry so the shared helper code
> can be built even when ACPI_APEI_GHES is disabled. Update the build glue
> and headers to depend on the new symbol.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
I guess it doesn't matter too much as in practice all exiting CXL systems
are ACPI based, but is this new symbol sufficient for the
CONFIG_CXL_RAS dependency?

Rest of this looks fine to me.

