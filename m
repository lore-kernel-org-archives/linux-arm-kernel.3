Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A746C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tEuRYMoDCTnsJpQSrq3lm5BTz1PR7T1PtpA+L2h/K0=; b=pBEgTN8zEcSFquYL1i/HSArGeU
	kCX86Wqvn4YkvULKfFFfhLbKITrjHoxMtLscpcAEKjZSUWD1hsDHh3zW1UOGHkb2zTvQYcGGra5/w
	TysRQuFPIS8ksuRPvW5uIAY+cVuk5rDOH7LvxxcBDAyyQruN9Ri3qo1B57mc9jO56P83szvB6euiK
	WMV6r/1YSC4GXPP3BJgwv82IRNcqsg0N6kN+uHgX2IfSoVPCtuvIQ3NTIQnQzLfaec32TvSS62zma
	q+J2Chq+VfKcQAvHSn9JPDbfoP+tw0ErZVjlxVV/V0X0lTIubW4OPHn+p4RXMHYhvoGKQTE1ETbAT
	WwrKEHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLJc-00000003LIL-3EBM;
	Fri, 09 May 2025 10:50:52 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKeS-00000003Cr2-2BAt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:08:22 +0000
Date: Fri, 9 May 2025 03:08:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746785296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0tEuRYMoDCTnsJpQSrq3lm5BTz1PR7T1PtpA+L2h/K0=;
	b=BWBVuuc/0d2OhfeoN9XXfXMbSP7bCet97/T63EwJRuZ1y9eHr34VHdmDGF9SxI7P/1TMiq
	DAQOFuov9KNgqj+ue1n6vcFLgvnriyXL4NF/5cRsiNZpe4lfbGRe/zRur7XQYX4e+hzxiH
	eRQtrVdF070zBkcgl1l6l7ca7JLZNlk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring  (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <aB3UBSQYtTveKPlh@linux.dev>
References: <20250508210009.428998-1-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508210009.428998-1-scott@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_030821_194110_F96B12E9 
X-CRM114-Status: GOOD (  11.23  )
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

Hey D Scott,

On Thu, May 08, 2025 at 02:00:09PM -0700, D Scott Phillips wrote:
> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> translations for data addresses initiated by load/store instructions.
> Only instruction initiated translations are vulnerable, not translations
> from prefetches for example. A DSB before the store to HCR_EL2 is
> sufficient to prevent older instructions from hitting the window for
> corruption, and an ISB after is sufficient to prevent younger
> instructions from hitting the window for corruption.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>

Overall looks good, still needs an entry in Documentation/arch/arm64/silicon-errata.rst
which Marc noted in v2.

With that addressed:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

