Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41156E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwy9iieJhFkaxNxipZ+EU3eTo1Fdkhc8eYK0ryVP+qI=; b=QnmCUxAkDy14BFL8UJpIJP3/vR
	MeM3nJoX7Edw6l08D/VxY0SXTIdUIBw9T7tvDK99TU6exz8M2j21K+nOQMP+zaOcHCIluDAyn2zZm
	XmQ7GWIZ9rNYuZf7w5IT818qvSu7gv1LvtV4Wyy7XIMMCDeptpYTwgMRP6iiVGxcWyxNuQUTXe4KQ
	+CnhMx6ymuDvF/hNE9zbdrycMUaF4v2GkfcM5qrqOBHOnh+JVdGf7vgA+bpB76mHQfKN+HdUuecfB
	uGjwy2cnNFp/Ka41ix70Oa3xbLQE0hR3e04tlvou3kwz1/17kY224gweXcjrugBlgk7i/HA3Jng4u
	pqC1MRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdjj-000000056jf-1jcQ;
	Fri, 20 Dec 2024 14:12:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdWv-000000054mk-2JFH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:59:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DAC1480;
	Fri, 20 Dec 2024 05:59:29 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F88A3F720;
	Fri, 20 Dec 2024 05:58:59 -0800 (PST)
Date: Fri, 20 Dec 2024 13:58:57 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on
 pre-SYSTEM_SUSPEND PSCI impls
Message-ID: <Z2V4IblZNgnS4T2Z@bogus>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
 <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
 <Z2VXgkJ4x5TJTKJ_@bogus>
 <765bb1c8-31de-4aec-b8ef-f141a3e25c56@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <765bb1c8-31de-4aec-b8ef-f141a3e25c56@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055901_633212_64722CAC 
X-CRM114-Status: GOOD (  23.97  )
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

On Fri, Dec 20, 2024 at 01:42:04PM +0100, Konrad Dybcio wrote:
> On 20.12.2024 12:39 PM, Sudeep Holla wrote:
> > On Thu, Dec 19, 2024 at 08:26:51PM +0100, Konrad Dybcio wrote:
> >> On 14.11.2024 2:10 AM, Elliot Berman wrote:
> >>
> >>> I'm not sure why you'd like to support s2ram. Is it *only* that you'd
> >>> like to be able to set pm_set_supend/resume_via_firmware()? I hope this
> >>> doesn't sound silly: what if you register a platform_s2idle_ops for the
> >>> relevant SoCs which calls pm_set_suspend/resume_via_firwmare()?
> >>
> >> S2RAM is what you get after entering a certain state, but currently
> >> it's presented as just another (s2idle) idle state.
> >>
> >
> > Just to be clear, I assume you mean CPU_SUSPEND idle state. There is
> > no special or different s2idle idle states IIUC.
>
> Yeah, right.
>
> >> That means some hardware that may need to be reinitialized, isn't as
> >> Linux has no clue it might have lost power.
> >>
> >
> > Interesting, so this means firmware doesn't automatically save and restore
> > states yet exposes it as CPU_SUSPEND idle state.
>
> Reading the spec, I'm pretty sure PSCI calls should only mess with the
> power state of the cores, core-adjacent peripherals and GIC.
>
> Reading section 5.20.1 (SYSTEM_SUSPEND / Intended use) I think it says
> mostly what I'm trying to convey:
>
>
> "In a typical implementation, the semantics are equivalent to a
> CPU_SUSPEND to the deepest low-power state. However, it is possible that
> an implementation might reserve a deeper state for SYSTEM_SUSPEND than
> those used with CPU_SUSPEND."
>

Yes these text help to understand the interface easily. If they were same,
do you think we would have defined 2 different interfaces.

--
Regards,
Sudeep

