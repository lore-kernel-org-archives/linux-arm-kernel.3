Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8E3C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yukb6eB/bNng4SAAFttQCTssqyKmGEQDmYHj5WOFoWA=; b=UzdBleXOx96k5Qq5AwfdJOrFUZ
	yNWPOli0xqnVqcu9xjN+Wo353anwnPpiUUHK5kjapF5lYI1cxlznPVNh0bDeqZdlxcKsihKTT80Ne
	SF/zzSlYa5+HREZ+vdAUrw0jGph2lHGx8C9zArRwq+AnrlLC+lBQaRIiZhXcQu3ChlOaVb5c3xBCY
	obcCZPopd0XZAqs6jhptd3a4Hl/xq18EOluUVbPw/wkUWfzy3TqXEj7Ew2Y97KiQlldc3kPh/Escw
	7LdRUNXQW2KbqdLZxf0XtamGOBiYQn0KYMajGfw5OzYpOJcU9CUrqiyv+Tm0luvOAZxkJH5gKGDN+
	i1g26Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCy1C-00000000K29-14EU;
	Thu, 08 May 2025 09:58:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxod-00000000I9G-2UGH;
	Thu, 08 May 2025 09:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04AF94AC3A;
	Thu,  8 May 2025 09:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0453C4CEE7;
	Thu,  8 May 2025 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746697518;
	bh=Cc1Skj2gto0ryJBoXR8ewyIYTGM/x6xJbXVwlCnskmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSX8cTI8/vBABDZQ+rSYj4l9l4Wc8jSRifZt9YcFuePwFbmbajYbhXgA4oE3NGKhe
	 uWi/ifztGcQTxDHqk0qc/NJsZXS2VYyMEf+uX3YwRJmSGjP6UEMti1pKk1FYVMQ6Xs
	 bWeL65kOJcfpxSz0R7fnOhA8bOwr5aWMT6D99QL4RlAkW1QQKu0fx/LegWUsgHtdNL
	 wgVYKKA3ziMeBm+wuNGFc14nlVJuKlEojt89fj9iJDt/tiVzNy5hnNYBNmWTDs5Zsg
	 zai35rtmGOx0mZBACU/TO/IBhN3qMMUYSK1A7mchf7A0YsKb/juvK7s0/6cB6UmpmH
	 rAjeMbbwH0+JQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uCxoa-000000000zp-0t46;
	Thu, 08 May 2025 11:45:16 +0200
Date: Thu, 8 May 2025 11:45:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
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
Message-ID: <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_024519_648502_F72AC3F5 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
> 
> On 5/8/2025 4:20 PM, Johan Hovold wrote:
> > On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
> >> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>
> >> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> >> clocks provided by the TCSR device.
> > This still looks wrong and you never replied to why these supplies
> > shouldn't be handled by the tcsr clock driver that supplies these
> > clocks:
> >
> > 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/

> Sorry, I thought Konrad had convinced you.

IIRC, he just said you guys were told to add the QREF supply to the PHY.
That's not an argument.

> If the TCSR driver manages these supplies, would it be possible for tscr
> driver to recognize when it needs to turn vdda-qref on or off for a
> specific PCIe port?

Sure, just add a lookup table to the driver and enable the required
supplies when a ref clock is enabled.

As I mentioned in the other thread, the T14s has the following QREF
supplies:

	
	VDD_A_QREFS_1P2_A
	VDD_A_QREFS_1P2_B

	VDD_A_QREFS_0P875_A
	VDD_A_QREFS_0P875_B
	VDD_A_QREFS_0P875_0
	VDD_A_QREFS_0P875_2
	VDD_A_QREFS_0P875_3

and it's not clear how these maps to the various consumer ref clocks,
including the PCIe ones:

	#define TCSR_PCIE_2L_4_CLKREF_EN
	#define TCSR_PCIE_2L_5_CLKREF_EN
	#define TCSR_PCIE_8L_CLKREF_EN
	#define TCSR_PCIE_4L_CLKREF_EN

That mapping can be done by the TCSR clock driver (which would also take
care of the 1.2 V supplies).

Johan

