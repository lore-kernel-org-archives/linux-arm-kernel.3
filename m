Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361F8C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhDFgFWw4dRynh3xb8krNzOwzq/udnrrAoiD2bS2QJc=; b=B5wXzfDcBLU/cyJqR2nFtk7jNV
	nBhjcQAOxWoThbkLdvrx2d3mOElWlDYmoHbz/LkkZlmtvydOV25lqIX/MHV84FUmkAuT72QtwEqz7
	PMD6P9rA3Z9v6RVK4EIG40AYsZ6mnAVYtxdJSciMUki6Y94k/ccJiXAWWdvkYIHoKUGqdbJdV16VD
	8OrgVwcUHzCDJaLlQp5r6rP5+8bXHFvvqA1NOm/C931DkH2AJe4SNqQy/0CySq8Yo+I3SRNuL3ubP
	ln+4AoEkAkGVSp+XVxLoeievp6+5ZnF8oQU9IIY4tyPbUM6YyDIK8Ce8j/A1CQqOlRN03nkOQ4gJ8
	A31P2kQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woU0p-000000042H0-3X2z;
	Mon, 27 Jul 2026 22:41:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woU0o-000000042Gs-14qB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F24640741;
	Mon, 27 Jul 2026 22:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898371F000E9;
	Mon, 27 Jul 2026 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192089;
	bh=MhDFgFWw4dRynh3xb8krNzOwzq/udnrrAoiD2bS2QJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nLNmvOjZoUi5/YfUo7JlIKbjI1XyVnHnVTO3e6w8bzdSQEErx03/maa1MAqXel7Lf
	 +N2MbEmOcsGodpN8t9vl+jUkU6CixqgH5FXRES6zlKgGfc++ZOB7lWDRhKm/anzpKG
	 z4rVymt8iXBobnWuM0Yfu4YT9gzY+DXyH7WvLT67vLyYn4HhFv/DLGrzsSWudHlmsa
	 EfDXLPfFSGotwaf89kw+ksnJESYzQ0NR7hIHtsnbSfiap1VY2PHLfDkTWQ3I0sr3Y3
	 /F/zIDHVxpx92flC99mb92xhubAusVWU7Yl/7BumswBR89Riy8+8aDqAmdh37R4k7P
	 rjcjIKjIKywwg==
Date: Mon, 27 Jul 2026 23:41:24 +0100
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
Subject: Re: [PATCH v4 04/10] arm_mpam: propagate MSC access errors for
 msmon helpers
Message-ID: <20260727234124.4834835c@jic23-huawei>
In-Reply-To: <20260723155454.1760823-5-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-5-andre.przywara@arm.com>
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

On Thu, 23 Jul 2026 17:54:48 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the helper functions for msmon accesses to return an error, and
> propagate read and write errors from the lower level up.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
I'd take another look at this one and consider if a few more blank
lines would help with readability. Otherwise LGTM

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

