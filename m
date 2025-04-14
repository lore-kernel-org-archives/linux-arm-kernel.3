Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E0C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Smsg72GcXkF+Ivv2bDXZHVMpQJJmZfbh7twUx1di6OI=; b=QgOhHKwZf4245smT43gzNKSL34
	/eXH6NrGHNpIXARi0GQ7b8QvDI6xtJunEPqMweEkGhEwGSEYZHDL7qRpg2HNc6zd1Xw8dp23NPUU7
	MpN9/HjqR3NBdUVTThGREywO9iiIm4BtmM2qSmtwal9mDnVA2Iok/vr8NAnM51Ymwb9RsnVb21eKd
	xhNlFgTlg8/YzBDZeQ39/pprdHfzB0R+Sy1nOd0tGvdNU7a/MxyS1bHkrp4Ps8369pMuMyQvt4Emc
	SQLAIN50iAVETNgsXLq8xXbW0U6//XxRdgvrDQ2AVwYGuR2e4wBDPz59QLQS4kLAEVEw5ny9ZulLp
	+rGn3elQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H7D-00000001YGV-0Rbg;
	Mon, 14 Apr 2025 10:32:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GpI-00000001SOg-1i3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 10:14:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224191d92e4so38092505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744625643; x=1745230443; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Smsg72GcXkF+Ivv2bDXZHVMpQJJmZfbh7twUx1di6OI=;
        b=mIuuVAJNMO+NBP8KteqP3YXOXgMXDKvUENcXD6QlEFmukJ1Ij+NvpajSnk57k2OEYM
         TmZ7B5BKpwlfLXMshdvO60gluDx+LPC3Mqmxci/v+xUiGw4SoiVl312n8hNzsaQlHZPu
         aDCjNhdjfgkwiTglJ7OH6Qs0sBtY17peLDbJqWZeW1O3hnDA62PCWlD7Pc7Zj2EUszgS
         ghdR8gcf+/U2ATPdahuGoHLMEim/3zX3i4XXvnwvZwXFuYADdpLv+vX4coz2aPojCuhy
         5WG9Fbg4LJx87EhFvukC6vNLFraDkJDF4FWHBh6yEu13YI10Nz3Y/Ufpr+1Vsp24r+X1
         +D0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625643; x=1745230443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smsg72GcXkF+Ivv2bDXZHVMpQJJmZfbh7twUx1di6OI=;
        b=G4KwvubwmM1GeXnipPqH/9Nqp/j9SM9qeBodLf1gxLJRa408S0IwIUYQBI7tgMnalM
         ig/48G+iXGC6jiLK2AQhBZIAp9Yo2s6OXNGmSEhnFI/cmmXSb6KJt+scyk5GBVYWgEJ3
         6RvAIAMZx7RNMhrqSL1/9nPJiRvkP7gisZex389McCKfknYQ39QoroAuRwjDkeomYgsd
         xGA3vgIudjKvOt1/qI1Yrf5UPxEYcPZJ9u84WPRHlFzoosPPRAOMk0N3UmeDwE1VxtGF
         7tCm9WkYrhnYfOT3hg4HdISpQnT/OrRkSfq3NsrNG3J9DTKjye8Js4ZGLPeKhoKFxZaO
         DZpA==
X-Gm-Message-State: AOJu0YwCvr6skzfR4PusVMAUw148y8mjz9oUNnrWXSOoAZCPF239Nupi
	2MpY9gEgvJLo1QtM5SwbZ5YzgoboM+gRiVepjZgE1B6qyXTPBlTdSwddkvSPinqqViQ0jFAmSq0
	=
X-Gm-Gg: ASbGncsJf3mGUdxeX35kdbj+fD0yq9siLNnoSBJvlMRQlyUX0nkrtEG4ePZwtGE9Hxj
	U8nS+QejjWeQvJK1IfoI0JG1FnsR1NN4/eF9fIvj1uhQk20gWvtX8YANQA0ldjYr4nApaJZgfRm
	XmUSbaLZO1NCTMW/xEPg0h6yNgb4qpOFT+HR31tCvd9ipuhGY/NHaTFxl3ZYemZ1yekjJmwznml
	RwC1bz5i4i+FMArX8t7Ms7R65yOCIKNLNEPc5VPP9nkctIOE/YElmNXYWFq0LOg8tp8XWqcRYFJ
	jJKEANon/5gEeVo9ShfUlzXID3tJRDdS50lr/J7BjbekdrsrcWPle/67fLGdjK0=
X-Google-Smtp-Source: AGHT+IFP91KCL2ubggimJjnRS6FXpsDpAY6dmmHmoDGSKCTanmBivzBpL+STAELx6GokUH9JL1EV7Q==
X-Received: by 2002:a17:903:244d:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22bea4f6649mr164638455ad.34.1744625643547;
        Mon, 14 Apr 2025 03:14:03 -0700 (PDT)
Received: from thinkpad ([120.56.202.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c93addsm95066555ad.152.2025.04.14.03.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:14:03 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:43:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 01/13] PCI: apple: Set only available ports up
Message-ID: <egu73pd5m4ubr5ex26kw5vwtmekuto73x46lzzmc3gy2rkiv5m@wjat4ewfsud2>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-2-maz@kernel.org>
 <k3wj3wkk3cymyacboalkhe2fa7jvkpuehq4knpsouoyhvoavpl@bafg4oakp4lr>
 <87v7r7ygq0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7r7ygq0.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_031404_466133_8FD2F75E 
X-CRM114-Status: GOOD (  16.12  )
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

On Sun, Apr 13, 2025 at 09:00:23PM +0100, Marc Zyngier wrote:
> On Sun, 13 Apr 2025 17:57:35 +0100,
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> > On Tue, Apr 01, 2025 at 10:17:01AM +0100, Marc Zyngier wrote:
> > > From: Janne Grunau <j@jannau.net>
> > > 
> > > Iterating over disabled ports results in of_irq_parse_raw() parsing
> > > the wrong "interrupt-map" entries, as it takes the status of the node
> > 
> > 'as it doesn't take account'?
> > 
> > > into account.
> 
> No, I really mean it in the positive form. of_irq_parse_raw() checks
> of_device_is_available(), and gets really confused if walking from a
> disabled port. You end up with the interrupt for the next *available*
> port, and everything goes pear shaped from then onwards.
> 

Ah okay. 

> So IMO "as it takes into account" describes pretty accurately the
> situation.
> 

Thanks for the clarification.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

