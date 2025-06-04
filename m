Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7760AC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW4MVmgQS6I4hO4L7HyA9e+KjW6U2bnyl1pDYWhmSwY=; b=CIemuBLWu92v4UazCOp8pZ/ZVj
	/88RWfVtYEn4xnZ8A+4Lnjm9PQH4jMMu5F4YGnF1xjyWGB5SJJEc//oSA7jIGuaYCvDeoAZkC+mJe
	iWUm/jIWjPDUOtcp1GYPui4cMl2+qT3oe0CM4Dlq7O5illVZO5L+7zezaSN7mPhiVcTwhMQ4dDMO9
	lsSAqYiTlYUbkt6sbeZXImOBejUk2ZUbtrDcC6lVjAVvbRGD8UuB3jTTOBYEYry2sHOOIAYb5yZvG
	y73LA+XTvh8FvqcE0V3TDpNs0j0l5QVY7ZBO6Rse5oYm/mV/h/B3YJUcDkewWP7tjXJRhKnL1Wlt6
	L4iacOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpck-0000000De55-0QZS;
	Wed, 04 Jun 2025 15:01:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpad-0000000Ddki-3XXR;
	Wed, 04 Jun 2025 14:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E26165C5EA4;
	Wed,  4 Jun 2025 14:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575E7C4CEEF;
	Wed,  4 Jun 2025 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049178;
	bh=wJsLEtGGSfzQUfeRpedxvZPZVDcyW+G0Ky8PAJCKb/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvhgSFbo5OA0fTglMBFbVarnMtKITK18FMO5UmtdmrI906yOD+zuwukrmEwfWushX
	 wvbzdnTfVYCy2MVV7s6QmlMYgMgPjdyGnETxZKnyPa61eN73UfverYxcNRxKIXzRVK
	 lndH4lqa5cwiIP1X2z8n2Aawj+zqA5xuKLqjAvuwH3VqCgm+2xKbxUHwJSgBc/hBUa
	 ToAL+ElA6Okw7UJbnMS3RTHC9UAc3rT+6klp9LUn0Uc24L7ikdhcWzrkYyFoVwuW5V
	 xAaahjWLOwgQt33Ea3Lt0IB8K8wVTcLrgDri490DmJV5LmwWQPPHRDr6rZRG7XiUTl
	 OH8ez2iGYuV/A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMpaZ-000000007f1-1W6J;
	Wed, 04 Jun 2025 16:59:36 +0200
Date: Wed, 4 Jun 2025 16:59:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,
	Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, vkoul@kernel.org, kishon@kernel.org,
	sfr@canb.auug.org.au, linux-phy@lists.infradead.org,
	krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_cang@quicinc.com,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aEBfV2M-ZqDF7aRz@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
 <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
 <aDRw2rJ39t9W10YG@hovoldconsulting.com>
 <7f525932-570e-4c81-a3f2-6d2e26b02233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f525932-570e-4c81-a3f2-6d2e26b02233@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_075939_971728_F92A8AB3 
X-CRM114-Status: GOOD (  31.88  )
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

On Tue, May 27, 2025 at 12:50:21PM +0200, Konrad Dybcio wrote:
> On 5/26/25 3:47 PM, Johan Hovold wrote:
> > On Thu, May 22, 2025 at 10:03:18PM +0200, Konrad Dybcio wrote:
> >> On 5/8/25 11:45 AM, Johan Hovold wrote:
> >>> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
> >>>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
> > 
> >>>>> This still looks wrong and you never replied to why these supplies
> >>>>> shouldn't be handled by the tcsr clock driver that supplies these
> >>>>> clocks:
> >>>>>
> >>>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> >>>
> >>>> Sorry, I thought Konrad had convinced you.
> >>>
> >>> IIRC, he just said you guys were told to add the QREF supply to the PHY.
> >>> That's not an argument.
> >>>
> >>>> If the TCSR driver manages these supplies, would it be possible for tscr
> >>>> driver to recognize when it needs to turn vdda-qref on or off for a
> >>>> specific PCIe port?
> >>>
> >>> Sure, just add a lookup table to the driver and enable the required
> >>> supplies when a ref clock is enabled.
> >>>
> >>> As I mentioned in the other thread, the T14s has the following QREF
> >>> supplies:
> >>>
> >>> 	
> >>> 	VDD_A_QREFS_1P2_A
> >>> 	VDD_A_QREFS_1P2_B
> >>>
> >>> 	VDD_A_QREFS_0P875_A
> >>> 	VDD_A_QREFS_0P875_B
> >>> 	VDD_A_QREFS_0P875_0
> >>> 	VDD_A_QREFS_0P875_2
> >>> 	VDD_A_QREFS_0P875_3
> >>>
> >>> and it's not clear how these maps to the various consumer ref clocks,
> >>> including the PCIe ones:
> >>>
> >>> 	#define TCSR_PCIE_2L_4_CLKREF_EN
> >>> 	#define TCSR_PCIE_2L_5_CLKREF_EN
> >>> 	#define TCSR_PCIE_8L_CLKREF_EN
> >>> 	#define TCSR_PCIE_4L_CLKREF_EN
> >>>
> >>> That mapping can be done by the TCSR clock driver (which would also take
> >>> care of the 1.2 V supplies).
> >>
> >> So we had an internal discussion about this and while it may work, it
> >> would only do so for some SoCs, and maybe only on the surface, as the
> >> wiring behind it is rather peculiar..
> > 
> > Care to expand on why it cannot be made to work generally?
> 
> "-ENODATA".. many connections are difficult to unambiguously decipher
> 
> > 
> > Also, what would the mapping of the above QREF supplies to PCIe PHYs
> > even look like?
> 
> I'm not sure I have a clear answer..

How would anyone know how to use a binding like this if you guys with
access to internal docs can't even answer how the QREF supplies maps to
the PHYs for a given SoC?

> >> Plus, not all QREF consumers have a clock expressed in TCSR as of
> >> right now.
> > 
> > Is that because there is no corresponding bit in the TCSR or simply
> > because it has not been described yet?
> 
> Unfortunately, the former.. Some IPs have a non-TCSR ref clock and
> some are presumably implicitly fed by BI_TCXO

I think you need to provide a lot more detail here so we can determine
how best best to proceed. We shouldn't accept made up PHY supplies
without a proper motivation just because that's how it's done
downstream.

Johan

