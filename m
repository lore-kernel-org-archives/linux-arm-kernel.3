Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRMFbhzs/l317mF132/JTP02Lcj/AQBTGZWjmwyxiQk=; b=ITV0sdc1IvAMHRfOjw4YdS6/C1
	fe0kaccRYzubMYChReTnX5wca8ygLnNKsikp4YbE/hs2HAX9oX3Fcijojy2WCjTBQzVSTysOEEzeo
	f8J1gqgwQ/Mn6QBRvu3NePqVoIKD3ytg/ds7S3x73dJ3Mzl9Hulmls/y/NcVq4ACgiSdGGW2uGOoB
	kzV+HgdC2/xXMWSV/n50uZ5DGFirv5eu5zHnfTTao+RN0IK9E1kO0gNrAuESgOree3Ut7R0lunH5O
	daUJSKcqTXgxXCloFFu10FicVjvmzp8sHeIb4tus+rq5jqippMS5ufY2V9Tmm1kmWARg2KGdQvE/j
	8eXw5cMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IoP-0000000HEDm-0ihY;
	Fri, 25 Apr 2025 13:09:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Heu-0000000H2Ax-3kmm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A4DDA4D314;
	Fri, 25 Apr 2025 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F79C4CEE4;
	Fri, 25 Apr 2025 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745582155;
	bh=2m7v7Ej+P2mp+uu2PV/itldRgESRqZ9YTq3gSWdQ/5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgBHPfbnljjuxBioq8XInfcSM9iM5ETScLdmHeLGUlZoYoEzOFHhNitclDEj/kxnu
	 cCUMGnaIUUbwHDePe/noyLYMGwNhVT5ATRbQNj/nMvC7lMcmjZyRZmCe9NLSs0NGg5
	 J6padj7lhFuuuiOWOPWnEzQ704xMBldbFKQtI7l+DbKA1qpqVwsNbL+3abJ3LOkJkz
	 hi072Ww0coHK6kz+outdt4W8QQj5EnFw2SXbXtoMxRcHi6OUvgprhnYP2R5cSllRNm
	 qawrnvfLoCgSe8IM4SWE1q/rnyBoJjA5TLh4OD6h44QezjvZeZdnseAX0OJ44HgyMh
	 Y1Qo95+2hKm7A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u8Heu-000000004ij-0seJ;
	Fri, 25 Apr 2025 13:55:56 +0200
Date: Fri, 25 Apr 2025 13:55:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
Message-ID: <aAt4TBrekUqyTjfi@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_045556_998008_BFA4DBE5 
X-CRM114-Status: GOOD (  16.30  )
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

On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
> On 4/25/25 11:29 AM, Wenbin Yao wrote:
> > From: Qiang Yu <quic_qianyu@quicinc.com>
> > 
> > Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> > voltage rails can be described under this node in the board's dts.
> > 
> > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 46b79fce9..430f9d567 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3287,6 +3287,17 @@ opp-128000000 {
> >  					opp-peak-kBps = <15753000 1>;
> >  				};
> >  			};
> > +
> > +			pcie3port: pcie@0 {
> 
> @0,0 for PCIe adressing (bus,device)

No, the bus number is not included in the unit address, so just the
device number (0) is correct here (when the function is 0) IIUC.

Johan

