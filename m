Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034E1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+VHUjNG6s/Obwnth5asqBJSwblkYn4SwJqZOdEtwdA=; b=tiiF1bg04uXhDqX1l7L2GX6+Iu
	QY1iYfG2SD9O2U+C9cPC41TEH/Akfd0Ty5H+BvjVJ+j3eFAk6iqo+X0L2/m7saHMxFJS0ayMwdlqT
	cvD1XUSJfpf6J4Cqzbqiyg2UvLK5IdMWIvXRGQIdwdmXwIEPl0D4THCarYfpe7Nod/Ir/RrVWXpZS
	gS1wpTPUGDFRRZKSau3HYnhWlm8v3Mk46gxX145/BJrsvDKfl3yyS8+iCVU91Job/uXdFksHohK5M
	2OaKMzOdNEmV/5DH6P6fIgaqOfAAaA/wUKWkcxP++mkemxkdzKoKuvg6/B67svqs9ZvJ0Izw6T7vQ
	9O+ycFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHj-00000004mYp-3RDC;
	Fri, 09 May 2025 20:25:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPfl-000000045HM-2BWM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:30:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203531595;
	Fri,  9 May 2025 08:29:50 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8D253F58B;
	Fri,  9 May 2025 08:29:59 -0700 (PDT)
Date: Fri, 9 May 2025 16:29:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 1/3] arm64: dts: fvp: Add CPU idle states for Rev C model
Message-ID: <20250509-lurking-hidden-shellfish-cf2bbb@sudeepholla>
References: <20250508103225.354925-1-sudeep.holla@arm.com>
 <174679984875.3368325.1365758165371282064.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174679984875.3368325.1365758165371282064.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083001_604034_7310BF7D 
X-CRM114-Status: GOOD (  24.67  )
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

On Fri, May 09, 2025 at 09:16:54AM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 08 May 2025 11:32:23 +0100, Sudeep Holla wrote:
> > Add CPU idle state definitions to the FVP Rev C device tree to enable
> > support for CPU lower power modes. This allows the system to properly
> > enter low power states during idle. It is disabled by default as it is
> > know to impact performance on the models.
> > 
> > Note that the power_state parameter(arm,psci-suspend-param) doesn't use
> > the Extended StateID format for compatibility reasons on FVP.
> > 
> > Tested on the FVP Rev C model with PSCI support enabled firmware.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/v6.15-rc1-1-g59529bbe642d (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/arm/' for 20250508103225.354925-1-sudeep.holla@arm.com:
> 
> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: idle-states: entry-method:0: 'psci' was expected
> 	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: timer@2a810000 (arm,armv7-timer-mem): #size-cells: 1 was expected
> 	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
>

Thanks for the report. Now fixed locally.

-- 
Regards,
Sudeep

