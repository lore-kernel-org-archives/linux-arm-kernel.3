Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AC4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 22:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr+yXJ1zx4RlPju5kOdUktz6qmzd6euktFiv0KaUpN0=; b=mVTNRdyCCHOgOE1MV/Tjn+VNsh
	YPJeYfOTAIthJornCaUvq78lsywLT3qYhO4b8xjjaCJ++7licZyNwz97tRl/3C4F1VlICvkHc2Vl2
	HpF0mCmoIgZtZMlmTvVpERs433MievajI+FtdID+5f+eBcS2BdsejJE8cLUOpQFr/a7rOs/svG0gr
	Jq7H8Ul/XXvCg5ZJFAjrYuLtqxTmnYYBECpr7bVHqrKD4u0z8cqk3kze/FD6LbbVAXZYL892JM9jT
	mcKIBAr888c9gT6+os9Edek6gv+Ab1ArHaMS/NBHwTT1l20Vt+Szkge8fCGbmXGfG/cpejXcox0Mx
	Mg3/yXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woU3X-000000042Te-1drK;
	Mon, 27 Jul 2026 22:44:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woU3W-000000042TG-1iQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 22:44:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5257D60008;
	Mon, 27 Jul 2026 22:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FA61F000E9;
	Mon, 27 Jul 2026 22:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192257;
	bh=pr+yXJ1zx4RlPju5kOdUktz6qmzd6euktFiv0KaUpN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i/Hl7HGk8uQM91MvyyJgoBz/+ijmz5VmWHNnyYAUxYfXSkPKivRVEtRp8KInZVDHJ
	 3dH+pGFf+0jF7UOdNnzXswVqjt+Obi3JRbngQO/50UxhyvEGQqAHSpdzCjE/U0e0w+
	 jgu3g17VdveCbqK80mQqEb+DC+XwmQmAeCIyCJWtCLkLpc2j912Rq0UvBRiVD8uH3x
	 zJrcUxjL5xvS+LHaumTjKdshPtp/obqVRtRBxQWhVf1NrsU3KTj1WdbyQQEVN4Ujou
	 AQHF+eHQYP+HVMfmnSYW/ypgFxvJaF+KumIMzGPQLdDUe9lzYDPZvM1I66Ovh701K3
	 +UVuX8HxM/3xQ==
Date: Mon, 27 Jul 2026 23:44:10 +0100
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
Subject: Re: [PATCH v4 05/10] arm_mpam: propagate MSC access errors for
 __ris_msmon_read()
Message-ID: <20260727234410.1504cfff@jic23-huawei>
In-Reply-To: <20260723155454.1760823-6-andre.przywara@arm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-6-andre.przywara@arm.com>
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

On Thu, 23 Jul 2026 17:54:49 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> Allow the function for RIS accesses to return an error, and propagate
> read and write errors from the lower level up.
> This function is a bit special, since it can be called via an SMP
> helper, so the prototype must stay as void. So propagate any errors
> using the "err" field in the struct passed in as the sole argument to
> that function.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


