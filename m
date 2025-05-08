Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F99C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIUK77fu4LWb3V1OlOt8m4B54tPdlBom1F3uSrUSpms=; b=mztORyi/cRfG/Z+74avWUgFP/8
	tCWL0i1ZeLVmSwWUWGaSmICA0yr9uTjzQjH6l4cvusUHAon6IP1JbfvtD07r47zgGE/LX4sAGWnFT
	DvmxSCl2VgNrmb9Vbnnl8TpcRDRVxHDL47PP9bzeZXs8zHwqIWi7J2zYqknkhvf6Lm0I8NTzCIOq4
	Fvg7ouVzeVXb4Gm3Tw7DV/F38MgT2EzxGze3EZel1K/h9FFFmN/SYEZboi0K0/59nJCqyZ/Emr99C
	3LWwZj5zfQTwoaeIBIuCECxUaF8fp9onRcOcAuiX1Yxyqmi6roFQu15pOPOA4K7MFHGWLVX8whtlo
	AFer4MKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vp-00000001N8r-1PP7;
	Thu, 08 May 2025 17:21:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD45d-00000001Hln-3tbi;
	Thu, 08 May 2025 16:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA93560008;
	Thu,  8 May 2025 16:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E909C4CEE7;
	Thu,  8 May 2025 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721636;
	bh=akmsc7Idl/CS0YX85M/o15zpf4CB1w+47LOq+bjRS/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5/5xfBRDFswxUWUryDcM0QjyXtAEY8zLiRXY4VPEOEM/xStV26trqrotb89c9/Do
	 VME/iaDiEdNFxRk0GE19jJIdjvnB1KDSXwjBRzAdP491FP5N3gae5Jz/KbxMb1K+lN
	 fXDy4W/oBRhkXNCaekaWj31auEzVIvf47OoTbcuJqgWJVVj1oehXZfJCzHtuqs28Al
	 U5qE4ureMfEPxPc4O6hCo+ULcn6MOCT1MMszpouHZurWM/0aLG7Nh5GAe6SUasPWYN
	 gbs2yXjMZ+fNDTSR3GjS65d5b7VP9tgstySbba0OWO0PmDkULBO1su5ts+TZLK/0pJ
	 f1UQMp17UvSWA==
Received: by pali.im (Postfix)
	id 4CD036FE; Thu,  8 May 2025 18:27:13 +0200 (CEST)
Date: Thu, 8 May 2025 18:27:13 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Niklas Cassel <cassel@kernel.org>, lpieralisi@kernel.org, kw@linux.com,
	bhelgaas@google.com, heiko@sntech.de,
	manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com,
	neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 3/3] PCI: aardvark: Remove redundant MPS configuration
Message-ID: <20250508162713.tbdeggybijz36dia@pali>
References: <20250506173439.292460-1-18255117159@163.com>
 <20250506173439.292460-4-18255117159@163.com>
 <20250506174110.63ayeqc4scmwjj6e@pali>
 <8a6adc24-5f40-4f22-9842-b211e1ef5008@163.com>
 <ff6abbf6-e464-4929-96e6-16e43c62db06@163.com>
 <20250507163620.53v5djmhj3ywrge2@pali>
 <b364eed2-047d-4c74-9f30-45291305bc4b@163.com>
 <aBybUYYhrmlOeLAj@ryzen>
 <25c89e3c-9625-49ac-b816-945ab9145f87@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25c89e3c-9625-49ac-b816-945ab9145f87@163.com>
User-Agent: NeoMutt/20180716
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

On Friday 09 May 2025 00:12:24 Hans Zhang wrote:
> On 2025/5/8 19:53, Niklas Cassel wrote:
> > Hello Hans,
> > 
> > On Thu, May 08, 2025 at 12:47:12AM +0800, Hans Zhang wrote:
> > > On 2025/5/8 00:36, Pali Rohár wrote:
> > > > 
> > > > Sorry, but I stopped doing any testing of the aardvark driver with the
> > > > mainline kernel after PCI maintainers stopped taking fixes for the
> > > > driver and stopped responding.
> > > > 
> > > > I'm not going to debug same issues again, which I have analyzed,
> > > > prepared fixes, sent patches and see no progress there.
> > > > 
> > > > Seems that there is a status quo, and I'm not going to change it.
> > > 
> > > Dear Niklas,
> > > 
> > > Do you have any opinion on Pali's reply? Should patch 3/3 be discarded?
> > 
> > While I do have an opinion, I'm not going to share it on a public mailing
> > list :)
> > 
> > With regards to your patch 3/3, I think that your patch looks fine, but if
> > the driver maintainer does not want the cleanup for >reasons*, that is totally
> > fine with me. However, I'm not a PCI maintainer, so my opinion does not really
> > matter. It's the PCI maintainers that decide.
> > 
> 
> Dear Niklas,
> 
> Thank you very much for your reply. Let's wait for the decision of the PCI
> maintainer on this series of patches.
> 
> Best regards,
> Hans
> 

I do not see any cleanup in 3/3. There is just a removal of the step
needed for configuring the controller.

