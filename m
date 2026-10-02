Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B30CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz1x5L6huLpRif5z+JxzN0AAJWwr/spmpwvDp5Tht3A=; b=RTRZ3Bao9xfjs0YxtpxFAmdU2N
	mGw6LLtl4abAWaJJ+lhaMgzR1gDyZyI9KNN88dmM8zxz40VQUdtXsoln9G8WQl7XCZE0qkyiNoMdU
	jCkcwW4HSbCB//KYxAjAQWlkH/WxBaSxP3y8OoYQri/YEVNCxbcFf0NFak0kcHXsHYPsbdmNajJVb
	osIIS9cDXMh5K5ugdqMv+enVcMxuFSgdAmGviXTqfWqkl1Q8VgggTVcUSYXIuKbwub3xrEmY/24OU
	5kJ+kKTrTHO10f/KC+JYapMHz4hm7E0A9dfN0pqITqBGn4xbutiTWfaHBpx8Avi4409OaAtY7KKMC
	ZIb5SgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCej0-0000000BpLX-3y87;
	Fri, 02 Oct 2026 14:59:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeiy-0000000BpKu-0KMx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:59:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FA7E497;
	Fri,  2 Oct 2026 07:58:52 -0700 (PDT)
Received: from [10.2.212.14] (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4BBC3F86F;
	Fri,  2 Oct 2026 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953135; bh=rz1x5L6huLpRif5z+JxzN0AAJWwr/spmpwvDp5Tht3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vs32S8+yFNMUbijWQoexDTe79iCr0dNxBsb04bpvBTqtxrgS/X5p/OLS1vNe9LGTX
	 DExHSeyZ5U1JWxM3NwBE/VMR6KslrzmXV/+KTXlpPB2MY4U0fE0JsVKqfk1gDdXpzc
	 yW/maa7VOzQptGOLi9Mxn8lk8idzx0OfQs5Mr4es=
Message-ID: <23c38074-86c7-4326-96c5-a9a434ec866e@arm.com>
Date: Fri, 2 Oct 2026 15:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] arm_mpam: Move MPAMF_ECR write helpers to allow
 reuse
To: Ben Horgan <ben.horgan@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-2-ben.horgan@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20260917145617.2202986-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_075900_186365_0F3E07A2 
X-CRM114-Status: UNSURE (   6.18  )
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

Hi Ben,

On 17/09/2026 15:56, Ben Horgan wrote:
> In preparation for calling mpam_enable_msc_ecr() from the CPU hotplug
> handlers move it higher in the file. Move mpam_disable_msc_ecr() too to
> keep them together.

Reviewed-by: James Morse <james.morse@arm.com>


Thanks,

James

