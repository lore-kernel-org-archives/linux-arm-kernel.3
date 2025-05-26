Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A685C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5Ys7U0q0MRpx4hKPR1VZIRhRMAFtbXbfqxLP6XVf6Q=; b=3cwAnHFzxuLsw33iJYGcQXtvVA
	3sJIXJAc8/nblx3GaCznLtauC6DD3yUerYGzEAaPd/AMBYHBvnN5F0+NhGFNCcICq0ehSOJajnOWg
	2v5giOmsl4RQEUeB9xN9GMvr2zGjL/1jaKzpY+CKW2Rbd1+whpk55FdPYSZC6KGSUdvqvSaTtpjaO
	wMxRyDol5sJDffQzUaKN/THmwHQKCvrwXlL1UXEB2BY5mCmr2+hbitzhpPdWkXbYeUed2mSKNpcGa
	aOgRsGSy51MDUxaqdEh4t6Q/tUeRf6P38c6jMxpGL/yc8mPdBG3UZRyTuv29MKQ0KIl9wrcmny53e
	Q2+6XVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYCd-00000008vkE-2aql;
	Mon, 26 May 2025 13:49:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYAV-00000008vX2-1dcP;
	Mon, 26 May 2025 13:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 996A2A4F302;
	Mon, 26 May 2025 13:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E36C4CEE7;
	Mon, 26 May 2025 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748267226;
	bh=+uw55Nbvzmy9FIP+DbRI7fubC+YGBHVWZbVdo3cwGXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFET7oiZCv2S5pqcYt2OWuU+DnRfYohENWFHzO/Tcht2eH6zoID3fSUPZXwerY66r
	 IUM0Zrglcad3bUC9ID2bRYC1Kspi/rN52PNt2eHMeH68jhDG/kJo3Wy+BXkiuImvUJ
	 mikk9wzRVHk5/Z87IAVRaUejfFTPvp9nEGvKYRDk4UELKkYlvqYABUuzvHSiiEw2pM
	 Kh93BTRBXrHg4AvarAYkvQTPPJ5hHC/MW5hn6TTW07f9l0w3g3wD5WEcoxcDzt/tcP
	 vbp6fXV5PqQiBfN3lMe6Eh/HZNEm+n+IUChv2x1cc3ol4osNC6io0daB3dmVgA4Y6V
	 5ZS5FKs+Fkw+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uJYAU-000000006H8-3uM7;
	Mon, 26 May 2025 15:47:07 +0200
Date: Mon, 26 May 2025 15:47:06 +0200
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
Message-ID: <aDRw2rJ39t9W10YG@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
 <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_064707_565299_61CB23CD 
X-CRM114-Status: GOOD (  25.63  )
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

On Thu, May 22, 2025 at 10:03:18PM +0200, Konrad Dybcio wrote:
> On 5/8/25 11:45 AM, Johan Hovold wrote:
> > On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
> >> On 5/8/2025 4:20 PM, Johan Hovold wrote:

> >>> This still looks wrong and you never replied to why these supplies
> >>> shouldn't be handled by the tcsr clock driver that supplies these
> >>> clocks:
> >>>
> >>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> > 
> >> Sorry, I thought Konrad had convinced you.
> > 
> > IIRC, he just said you guys were told to add the QREF supply to the PHY.
> > That's not an argument.
> > 
> >> If the TCSR driver manages these supplies, would it be possible for tscr
> >> driver to recognize when it needs to turn vdda-qref on or off for a
> >> specific PCIe port?
> > 
> > Sure, just add a lookup table to the driver and enable the required
> > supplies when a ref clock is enabled.
> > 
> > As I mentioned in the other thread, the T14s has the following QREF
> > supplies:
> > 
> > 	
> > 	VDD_A_QREFS_1P2_A
> > 	VDD_A_QREFS_1P2_B
> > 
> > 	VDD_A_QREFS_0P875_A
> > 	VDD_A_QREFS_0P875_B
> > 	VDD_A_QREFS_0P875_0
> > 	VDD_A_QREFS_0P875_2
> > 	VDD_A_QREFS_0P875_3
> > 
> > and it's not clear how these maps to the various consumer ref clocks,
> > including the PCIe ones:
> > 
> > 	#define TCSR_PCIE_2L_4_CLKREF_EN
> > 	#define TCSR_PCIE_2L_5_CLKREF_EN
> > 	#define TCSR_PCIE_8L_CLKREF_EN
> > 	#define TCSR_PCIE_4L_CLKREF_EN
> > 
> > That mapping can be done by the TCSR clock driver (which would also take
> > care of the 1.2 V supplies).
> 
> So we had an internal discussion about this and while it may work, it
> would only do so for some SoCs, and maybe only on the surface, as the
> wiring behind it is rather peculiar..

Care to expand on why it cannot be made to work generally?

Also, what would the mapping of the above QREF supplies to PCIe PHYs
even look like?

> Plus, not all QREF consumers have a clock expressed in TCSR as of
> right now.

Is that because there is no corresponding bit in the TCSR or simply
because it has not been described yet?

Johan

