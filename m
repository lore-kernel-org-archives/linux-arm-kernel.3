Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA3BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oR3+sjzXfF1kJu70R/WOS6OhxjSB2FVGl0MhcctQyD8=; b=VWLlTRxbPTV3LfW/3ACfXkapgN
	oST1PVKa09KxEMXKZE1b1HSUAT9XwQPFcp3Jtli6COwvm29eUMWVLG2fmO9cHAeDiz0zmAabEoBye
	W2u9tst+MkLCXOayceBp+dxqIHdvkIFn03SZofxZ2Fu3Y4Mxzf0nFf5afly4oGiP5vWvXCaI3hGVA
	GpFu6tiDTqE2pZ2oU3i6/Yv0ElnuT2ijqdQ+fzG8+Fiojhibe5OHjIbKZxA6p8VG4quK56W9N6wwC
	gPDUy8ULgRUcQtN/dJ79bt+ZlqO5CxaiuCUY05+AEOJ3JWzTgcayppyCa9ARjuGXDpLB6IFQG1bEy
	qmgLDBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFTh-00000003jUa-1IVp;
	Mon, 17 Mar 2025 18:46:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFS0-00000003jJ9-0kUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:44:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22622ddcc35so20447075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742237075; x=1742841875; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oR3+sjzXfF1kJu70R/WOS6OhxjSB2FVGl0MhcctQyD8=;
        b=J46PPw31gleYwrDRlR99/NAsadJgeg21YYqY1ZvjczgB0Kmvs1Yf7EVVukrnbvULex
         fzlPtqddWRQsxekzmUCbMt/GXS/sIK8OeGXzsGzTLAb3gQiPib1EJj2J5CKGAz/dorJT
         3ldI26Kr1jw9NPurMWreBxdjp0WPxxrc9ycR8Nn5FK0rcS2y0cS05VuE3eDNIoeNh0HL
         rIX3o+xSqOx+D3U4McSWhCKCMDao5HBS0dUcgWRGcG6jTXPVaM6VJwBA28GOFXYHPbua
         4HFpNB6qYbcQY3PEVC5fAVsm771KWnBJS1LZMLUq/RbYsNk94kkAnKop7Dd9rJumjqJf
         cNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237075; x=1742841875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oR3+sjzXfF1kJu70R/WOS6OhxjSB2FVGl0MhcctQyD8=;
        b=B5MsF3XrvkQPBQ03KbQKQORHbZLbA1+kt1q6336WVR1cnV7FHLXvYM1bw78mb0j2ge
         9no858VGDXP4rZApW5pNW+tP7NMldg5HnVByuWjEfR2/MK2Un+13I38zgeqTaSoHkdvP
         nNNcqRnTMdOHNSfukbGSLcutdfoGo46j/dQ+uHrOyDHpVOCrV5VfbG6bNsinOY2BwsYt
         eMgZn8v7wFM/SEI9ot/cTW8MVxPMFDrrMSFLQB6CDMcYTbHzUadNtVf8sjCe1tG1vXY0
         s1c63CabAh/4FZNE7gjavwxb94u8B5LH6hyFWRzFAvquUSe3migMAzfpc9pUUie80sb6
         Un+w==
X-Forwarded-Encrypted: i=1; AJvYcCV2zilI/DhZfolRy0dB9UA/s98PB3skqf8FneHQSryxpmwm+7HfvEeNi2g7z4CFhsuWUrjpnxhwrlf+l2n6XXTz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxj+YACbvKDFXeEMbZUvqNgU4bZbyO/0lRLLWdrYVuAalyJM10
	/Z4fVMCqkOJ6kIq6u4Io4Cr7dfVLRNyZVX0VdAeOSaQwhSgNGGOcQY7WEvCe3Q==
X-Gm-Gg: ASbGncswMp31GWEXbiY4Lavg2mp7F6DecQmL+EHzqwE3ElipmAyQG4jZOHnWBpcFEVG
	ljZJfA9yF/awRlOcyzZBiIh9CIUfcBSS8EvSa4pagTc37y6ccgwBFgaK4+dl9CmRB6QD3QSGMWc
	BDhi5rifphLSv1Ud+ioaUWy2mDVwDT4zSViSt65NX6QK801xEnYGJ2oFXA5hGZZ7H/5YcXBJOQF
	y0eOR4GeRHIc1bvBQBIppqcb+PTHGPrTapbQwi5uSVItwYhVX2negjiqMTDa44nrF5EFeiWQdxT
	fpiGsgkRIxy55WuiAsHSGODXjUofpAYeBILeFMa7lV2L++Ak4y67eWL9xl1p6dNWyA==
X-Google-Smtp-Source: AGHT+IGISBTwHnOEY2bEJPR+BTe1q1qlpEiRYXNfbcGJ9ZaqciEpkdDRztt/9NPlZLzrMm9yu+GByw==
X-Received: by 2002:a17:902:e5c7:b0:215:94eb:adb6 with SMTP id d9443c01a7336-2262c5edffemr7634215ad.40.1742237074779;
        Mon, 17 Mar 2025 11:44:34 -0700 (PDT)
Received: from thinkpad ([120.60.130.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68884fcsm79360525ad.16.2025.03.17.11.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 11:44:34 -0700 (PDT)
Date: Tue, 18 Mar 2025 00:14:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <20250317184427.7wkcr7jwu53r5jog@thinkpad>
References: <20250313060521.kjue4la47xd7g4te@thinkpad>
 <20250317173008.GA933389@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317173008.GA933389@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_114436_220196_34F89B23 
X-CRM114-Status: GOOD (  21.79  )
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

On Mon, Mar 17, 2025 at 12:30:08PM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 13, 2025 at 11:35:21AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> > > This patches basic on
> > > https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> > > 
> > > I have not hardware to test.
> > > 
> > > Look for driver owner, who help test this and start move forward to remove
> > > cpu_addr_fixup() work.
> > 
> > If you remove cpu_addr_fixup() callback, it will break backwards
> > compatibility with old DTs.
> 
> Do you have any pointers to DTs that will be broken?  Or to commits
> where they were fixed?
> 

Any patch that fixes issues in DT and then makes the required changes in the
driver without accounting for the old DTs will break backwards compatibility.

> > You should fix the existing DTs and continue carrying the callback
> > for a while.
> 
> Any insight into where these existing DTs are used and how long
> they're likely to live?
> 

There is no fixed rule in this afaik. Just like we continue to support old
hardwares, we need to continue supporting old DTs for some time. The best we can
do is provide some warning so that users can update their DTBs. Then we can get
rid of the old DT support in the driver after some time.

That's why I asked Frank to add the warning previously.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

