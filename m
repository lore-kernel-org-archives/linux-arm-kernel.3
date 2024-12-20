Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0053E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYN8HM4We1odY5HnKn+7RCWQnj1cjAeUmenMBmBMQz0=; b=WfR8lvIkO9ZIb3rDM4mhX6IHWT
	aXJOFlFnYAvzp/rvUIbcA2fnQQk12jFAGx1n0ogRN47PkiOCwqeQd5hj7G6X1yWaRUNngCF7ftDwx
	IbGTDhGB7UfGslcMWgWxUSsjtmUKjmygjsw+yc+TWf/YdGbJksYIxRZAwu4D0ezLdIYqUAdnEIpfz
	GdHEPXWeK5ruomo/eUiJ5frwXI01w/xZCDcpJ0/rLGk7sPnr5mlBgamOHviNuK6lGsDquhRv8uW3O
	GEdPw8FJmBOuY8lvzitsyxrLdVPbxUcS8HQBdX9MvKqqZGFve7ilp7LHatv0JYhmqMybSQPwYN/Zv
	bsM4mWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOf77-00000005LBi-1xGX;
	Fri, 20 Dec 2024 15:40:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe6p-00000005A1B-3cbh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:36:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F921480;
	Fri, 20 Dec 2024 06:36:34 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8F533F720;
	Fri, 20 Dec 2024 06:36:04 -0800 (PST)
Date: Fri, 20 Dec 2024 14:36:02 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <Z2WA0o0QJS64ftVh@bogus>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
 <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
 <Z2VXgkJ4x5TJTKJ_@bogus>
 <765bb1c8-31de-4aec-b8ef-f141a3e25c56@oss.qualcomm.com>
 <Z2V4IblZNgnS4T2Z@bogus>
 <875342b7-3825-47bf-810a-effdbeacab46@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875342b7-3825-47bf-810a-effdbeacab46@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063607_949180_119E94EF 
X-CRM114-Status: GOOD (  18.10  )
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

On Fri, Dec 20, 2024 at 03:20:37PM +0100, Konrad Dybcio wrote:
>
> I would happen to think that, yes. Especially since the reference firmware
> implementation does *exactly this*:
>
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/lib/psci/psci_main.c#L179-L221
>
> PSCI_SYSTEM_SUSPEND seems to be simply meant as a wrapper around a specific
> CPU_SUSPEND state (which may or may not be only callable from inside the
> firmware when SYSTEM_SUSPEND specifically is requested, for reasons),
> in a platform-agnostic way, so that the OS can enter suspend without
> providing that magic StateID on all supported platforms.

Exactly, that's how it can be OS and platform agnostic. Yet this platform
considered to optimise by not just providing it as a wrapper(if it was
that simple on your platform too) without running any tests and leaving
it to interested parties like you to mess around to get it working.
That practice needs to be fixed and this change won't help and once we
fix this, more such special treatment fixes are needed on newer platforms.
So lets stop and ensure things are fixed properly.

> But since it already requires more elbow grease on the peripheral IP side,
> I'm not really convinced it's that much useful.
>
> Plus, the optional bit of doing more work behind the scenes doesn't seem
> to be very wildly used across TF-A supported platforms.
>
> So please, stop making the argument that it's any different. The firmware
> I'm dealing with simply didn't expose the same thing twice, in perfect
> accordance with the spec.
>

So that it can continue to do so in the future ?
Thanks but no thanks. NACK with no arguments as requested.

--
Regards,
Sudeep

