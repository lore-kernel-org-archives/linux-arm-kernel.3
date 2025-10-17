Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0A9CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2mFFuDobBzMcj0MZQwX9+Y0kLuQW292PvP5Q6CgLmc=; b=oc2PZgbO3TsMyYjwfvcPTfTPOh
	+UNlJmleJt78F7Cp40xEPGiySDXG2d5hOtidmpwc9k1/NWnv6fJjR+w0lXQFn7u0gpzWvC6z9A2E5
	hUFdXKYo/4oiY3Wwn4zXprqdt2ht0HHNZe8wq/cX//AQxBXbH2lxFNW2xwo76Fgna5RPkGHuoAPid
	SHenTNVTu66AbaZQx/4stzbzzeiC+2OZ45O/9XtKMXal6tEnGUkP5RfPTauAXMePxgjHyM3W3Dh00
	7KJEBYm1P2Gnt6ByW3JNpUXNXBYUYDainfHwtZZdBNvXl7M6v0Rto4IBu4xjoDsL9Ya/X8c0TrxOg
	AJVlq+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tJ6-00000009974-0X10;
	Fri, 17 Oct 2025 22:52:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9tJ3-0000000996f-1Jbn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 22:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4A084A62D;
	Fri, 17 Oct 2025 22:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79DFC4CEF9;
	Fri, 17 Oct 2025 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760741536;
	bh=9m38dHlYeupV7BLbp372QPrZPXXhaYcQGUiETcqMnUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8heZjg+XtWVM2qiYjl6ePyBS21vW7t/MbPfOmYrFBHujmXx7gzV9fU6rkYdLxcls
	 Is6cBMugc1RqaSdCe1kvooFJdxJJ7qqWLyXj0S51AtJANSkZKdoQJd5T4Gcm/Y+RE2
	 DimtuErPoZsfIpg0sGWf3D4XBU/t8bK9YRNEBy9wuU7VXrsyD3616jloftiRdjypD7
	 ZgjsrvsN7AKwyGoFl5vDCj69w7egpKtQYP/PZvYBh9zAnN9djZzsSUiIkLH3NLS7pI
	 1KKlcEqH2JQTSwyB6Yhoflu7FdhJVLV2CHdyiKWPIbps+ZDnskeX+H/R1AGuHdZYxc
	 rOnm9HcswqTdg==
Date: Fri, 17 Oct 2025 15:54:09 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>, marijn.suijten@somainline.org, swboyd@chromium.org, 
	mripard@kernel.org, abel.vesa@linaro.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com, 
	jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com, 
	simona@ffwll.ch, alex.vinarskis@gmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_riteshk@quicnic.com, 
	quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_155217_371612_604CEE52 
X-CRM114-Status: GOOD (  19.79  )
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

On Wed, Oct 01, 2025 at 11:43:44AM +0200, Konrad Dybcio wrote:
> On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> >> This change enables display1 clock controller.
> >>
> >> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> index c69aa2f41ce2..d4436bc473ba 100644
> >> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
> >>  	};
> >>  };
> >>  
> >> +&dispcc1 {
> >> +	status = "okay";
> > 
> > I think this one should be enabled by default. Unless Konrad or Bjorn
> > disagrees, please fix lemans.dtsi.
> 
> Of course there is no reason for clock controllers to be disabled
> 

On SC8280XP we have the same setup (two MDSS), there the clock
controller was left disabled because not all SKUs had that IP-block
accessible.

Whether this is the case of not for Lemans I don't know, if it is then
the commit message should have stated that.

Regards,
Bjorn

> Konrad

