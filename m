Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F55C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=; b=AUOwvRorhHTISVytHrqJax9Qo2
	9rmlOiklUBM8hPZv1+Wgm8XFdv5aT3AktHqIA+RXvjC6qUnw1n1Bwwh8fxrjVPJXN/W8BTP2a45S0
	Fq7ZGNsds6GaGEIVIvFFb+h079x/p+xoEmBplijarReRau2C78nLV3EWCannnS0w/JNKoV3t4jhdM
	m//jDgSUAuZe8A1z+VhcVbS07Kvd+8z/sLurROvf8SjRouz35yw7TYyeMs5KjbdUJfcAQEKkOde2K
	YRoAm0hPhOcmxb/hJDbLipZDO4OVXkVSEaaFMoelRjGy8fHEDauTkyNEDyYgMo33MwL6xapIAYGvG
	0WOYye1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqkD-0000000H6o4-3N4u;
	Fri, 30 May 2025 03:49:21 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqi5-0000000H6Yi-1qwC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 03:47:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2353a2bc210so1026935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 20:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748576828; x=1749181628; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=dSGc9ZEI/pNrYuXGQ1+RwGeU5MeCj1eyx+IScgszhigmwUrz7D6Bn529VMP6xoXhwu
         JMLuGxjiD7PNEb7BSaVHnyQqACx6BZof6TQ5Xlnwavz3UI2BwqK/0XWoWxUnGoCcIF0I
         vynx6e39nRYm1HErKihdCu8OuI+XfcvXYtgtdyHLVzUwwZsMR7GUknR6E7v/u3u21xfc
         coNbYOvuap8LV/VrmQqPXLz5BQKrNJDz7E31H53acfT8czU2AVSIzfSnkSmkTVtALWWy
         c3Y7HnlQbzNIzCn1s7z7WyKQLiIDAGAeycLJaTWSbfZawWFIvseZBkfT5exkBrX8U4bw
         d3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748576828; x=1749181628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=IqAm6c54c+NX3OQXBZE3KItDh4R23x5AcsaRTn7M/svN97r/JmmM2f+Q/Zw9oa3gJ7
         EePZhTa4V0LLf6kx5rZgkyv+NVW/tYnL78Fj5ITo2rR/Ys5nJWfvEu2fpTZuWxeuuihi
         pSvelIo7Oq77wOPD3TrYstz2zr0dYYnlAzhG4XoARP26SEmV8+7Lqi3Zqq1OyIXSn9qT
         9UCIOZmzWVbWyMmBEKXrPhg1ofUulVQ7pYUGjxDdVdJBSFPNKfny6R4XRkgW52nF+gSN
         4w2+/eTCa8JB22rC0i/KeDgfMjdFL0BU3POSm8zofxIRgiLQuwKoNbb29ZJ8VC3bbHBR
         w5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXq6mUVumpaqoE6fmU3b0qLzVP1jN1sQ3wN7Zm4MzZncfa0vt7FqIx6yvX5Kt8auARNxyDVHksK5fADzqfiAaOc@lists.infradead.org
X-Gm-Message-State: AOJu0YwMWFifXfEw9TZcWfSEBzwsvsK7aHhT203GpMtgk3krXJuWAl9E
	GjNvnaZr5OWhrL3XCoxFZ+LJzDF7pNEB7Ktq/TvkvhhJ3W9Ud3iS2HLgRu5VYeUSbA==
X-Gm-Gg: ASbGnctnMnCkp+mH680OwA60Dh1WfX0PMPTYzGMyngpVAMkarQYhJr+Sgk0z3twMcis
	1ibpGvZLCt8imOIOm9SZECSyYqAPTgwlox7iU03YNKxYN6FbT/cNlqdrR0aNZb/rH/Fj0d5s8M5
	omurhGhYBTAin5FV5mxgLS9+FSwbF76VTe5MkDETc9Z4i322ljK5fEoqFdhYoOU1Ol+vL+nI768
	Dr7ZTO5rnGAQVkgFStDrZDGromUdflSi9fiaUxbKQpmdxleQbRdKLCD14WsUyxEHjeMu3K+lCHd
	86ix+qAjr8AUbmeHBesl85/owd6XeUntW94f457Q0yE41TLkD5tAtwr5kuIoZw==
X-Google-Smtp-Source: AGHT+IHUystiPvDn8wtXmAxatZwAwM/wyWA7RAF5uIDmvCTdpWPCHf/AgW9Un8RMnzAXGJkMNGGi/A==
X-Received: by 2002:a17:902:f711:b0:235:1962:1c13 with SMTP id d9443c01a7336-23539563146mr10695205ad.14.1748576828510;
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c236asm327042a91.42.2025.05.29.20.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Date: Fri, 30 May 2025 09:16:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
References: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <20250528223500.GA58129@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528223500.GA58129@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_204709_505408_CAE4340E 
X-CRM114-Status: GOOD (  19.36  )
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

On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pci_host_reset_slot() will be called for the slot, which will reset the
> > slot using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> 
> Link down is an event for a single Root Port.  Why would we iterate
> through all the Root Ports if the link went down for one of them?

Because on the reference platform (Qcom), link down notification is not
per-port, but per controller. So that's why we are iterating through all ports.
The callback is supposed to identify the ports that triggered the link down
event and recover them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

