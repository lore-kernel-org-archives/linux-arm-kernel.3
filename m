Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1563EE77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9IFvjQJur5Mc1jKu7jmQt0cXfWwbZKjMKrDZ+uBFiA=; b=kP2CSIOJNLZJjaVZDzZkrS2u5A
	Tb03eukI7ngsaavTBUH/iqdQUIyzwOHkkUNXN9pSjamPPOz50vE8/O8Zia3cmhFYC72eaZm/bR1Ji
	WVvThAN8zp7Ycg6MFRBQOro5uQmAWTLZlOwFTIsSo1Jm5fesO3tZwEfDKbVoBOrdlsz+wXh1F0R6T
	GZKdNdyj4wJQhcwteg78yXVmS54/7mzSZBSrxxIunj8BrisUKFrsoavTDJGtEsUZfKeFzjNDWpx1l
	BZk6PzUtokLZ+ueXlJ7Isv6v3mysCuVuuBz4t7QyNhDbg5k/y88rCWz3OXvVWmJQ/GE86+Rrr6jJ9
	Ngp6gi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7gd-0000000FG2Z-1E7d;
	Thu, 05 Dec 2024 08:58:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7ec-0000000FFYQ-2cLC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C34A0A42649;
	Thu,  5 Dec 2024 08:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C53C4CED1;
	Thu,  5 Dec 2024 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733388969;
	bh=pH8a0eNfRI80cchfeptzgtUqN5gprH6NUlyyyD8s8k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRYlrZp4YbGf3IH2/CZlwrjiBWrjQjPllwLRDW0N44b8FMUTV4+lC5DVRm2fXg59i
	 zo3acu0Lg3JGMV2uJCcUpJLOTU1O29naKmDcdHmQqK88S7TdSUnOQ/BBxbPysZS+ez
	 GWY8vz4V4RA6HNt9oua3A9v9WevjE31P+GBUcmNkpcs/L9e82eFC8CRM7v1c4+vZJx
	 TLSFlb8kqAniIMfIIPuCnYSmXYjmrKMotzaY8W5+tjVtcyvogU//yXlTPS1rPXSdtN
	 wdeO2yJMqYNYYaVjEotOQpTck5uMMr+RDe3r4xU0RfX6BZdF9MHP63qFxrZCXugDSb
	 czIM+Z6jeYOVw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJ7eZ-0000000082O-2LQ2;
	Thu, 05 Dec 2024 09:56:08 +0100
Date: Thu, 5 Dec 2024 09:56:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Message-ID: <Z1Fqp4EXxDbLOM4e@hovoldconsulting.com>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
 <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
 <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
 <e6f60ca6-a4d2-4539-ab9b-dabe95dd2d21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6f60ca6-a4d2-4539-ab9b-dabe95dd2d21@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_005610_722228_732EE595 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, Dec 05, 2024 at 01:52:08PM +0530, Krishna Kurapati wrote:
> On 12/5/2024 1:46 PM, Johan Hovold wrote:

> > And IIRC I even had to specify more than just the fingerprint reader PHY
> > on the X13s to get it to enumerate. I never had time to fully determine
> > why this was the case though.
> 
> This might need to be checked. Did you attempt adding each phy 
> individually ? Just incase the first PHY is not the one corresponding to 
> the fingerprint reader.

Yes, I tried each PHY in turn, and only enabling the HS and SS PHY for
the fingerprint reader port, but that was not enough.

Johan

