Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D891C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoMZ/LXD0n6wHUQnbeanWfL4wspkznf22EfqsCZFOOo=; b=rzKgDyys01neRfoDyghDCijQOO
	RqdSjEMQm9Uksv/Wyo+7O+hww2PmhBi8jNW+VVDvobZM4ZSNFTLpOjOtYiq6jFrQieFwKVsn3TTIy
	B2n9D/VBzwLHryUknp07kH1+7EXrMlHTjfoDyxG4tDEAB1MiHQqKxHUz5RPfT99fwSHkqvYUAGpf2
	mV8ZFusStIyU/0qfMGbkqZLncwrf5wZAw3K7rZf14ouqcEQ2ynO3O2TML5PIT0QV/hB72Iy9Mw38w
	ZFvtNIkRNzHdPJLo3bVcoNhmp8oRa6ggQ73ANjLGxa8YVbImwuAK5q2aTiofLGsqvtKi2dbOuFiA8
	hLKargsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpW9d-00000005eSq-1Btd;
	Tue, 04 Mar 2025 17:34:05 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUqP-00000005MaY-2Mkq;
	Tue, 04 Mar 2025 16:10:10 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223a3c035c9so39801705ad.1;
        Tue, 04 Mar 2025 08:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104609; x=1741709409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoMZ/LXD0n6wHUQnbeanWfL4wspkznf22EfqsCZFOOo=;
        b=cEF90+SEk1n7eu8M84jVP3FVaQ9w3sPmDEOOslWrInHtxjE05FP2j7B1Tt8ai1R3P6
         k0puxGZExYdEkcKQQChQFOJGTMLbYkh/02p+TDPXRDHerSrRLrisQMaTBpkzeBO6duvM
         R6ar41YG23y5lzxJm4U/LBbwEOVrtVm40xEFrWjHu1iDTlAi3qN/n+W6Vo1vP9WGtOtB
         xOWuqEQk87HvC83jxOOV02hHRSPMLB9FNEDXidwufv9xUvc1fqt+SsGk7ndiOGLv7ffT
         /D56y+VWoyVMlFbQ/Oq/ksi0/UdSKKDAft4fcKuyEzJnfLNMnq+eOfFY3MNEewwPaqLj
         yerQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgVGDalfh8iFbGRAyw0KYJP59GDapGzBpKKPIdFu4CBB7TmyNy7A7FvtIzYbARAtq7o75h+6kitrpo96yA2b4N@lists.infradead.org, AJvYcCXuDKLWxKLNhmeIvjSIaQ/mSaAVV5WkksF2jU/gexPrAsw54gb2jhjrecsEN5Ie0hKq/1lvuRA2QHM1+jrCbSGPWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX/RMxclN5FpG+12yvEEmqvQ/Q32SUBD6l6iiOWB8QgyeTLaCh
	bJLmuNcKsGeT5xWGx6OJvkiI4RVIuS7w3vAKSuY+YHP0pAmjVC5W
X-Gm-Gg: ASbGncv2Az5vosdUrruxYkZwSxda3MR+F+/eHb2yR21/AJhV2vGEMyOqYUzo5q2+iqO
	rCaYu6Y7AVlW7BgdBuwof5eanP3ilJhaiGfzq2wFzZT0ZMwCQ2zbyitVL1EhmwF4QQonRDs6Kf9
	1jN1rvFDOiLDNCTmI31HJ6Ot1cHdX+41bTIC2VdqP0Z/96D1KTP6rAYGxithclZNW82tO1h0w1L
	2LGqkPVH6WknDKKInQL5u3Q1RkhDkXVolULQOw6UKUaa30sZ4SAfc1l+pjfCCwEIIW3LL1KIhg6
	rMSPcEIgKRVVwjws/NFezokYsKpwDlYCeLEB6tyMYYHPpL0d0onPQKTIOW0CZgfv+lEwVQZ9gjX
	iY8o=
X-Google-Smtp-Source: AGHT+IEg9fODno7y7kdKi9IiU5DrBqwcBYe3/nmHU0aecwM9g2wT01bptCub2WDnULreykf0DHrF6w==
X-Received: by 2002:a17:902:8303:b0:215:758c:52e8 with SMTP id d9443c01a7336-223d9154390mr46974825ad.12.1741104608622;
        Tue, 04 Mar 2025 08:10:08 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22350514239sm97095005ad.219.2025.03.04.08.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:10:08 -0800 (PST)
Date: Wed, 5 Mar 2025 01:10:06 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/8] PCI: brcmstb: Misc small tweaks and fixes
Message-ID: <20250304161006.GC2310180@rocinante>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250301144831.GA846783@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301144831.GA846783@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081009_599257_1F1B1BBE 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

Hello,

> >   Six small fixes and improvements for the driver.  This may be applied
> >   before or after Stan's V5 [1] on pci-next (they should not conflict).
> 
> Applied to controller/brcmstb, thank you!

Updated with missing "Reviewed-by" tags that Mani recently offered.

Thank you!

	Krzysztof

