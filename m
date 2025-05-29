Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5520C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suszitiSJbZS8iWXXXVjI9GrivMQ+RVo/o+nLw7sB/M=; b=CPUKWRxDoZdLQNzH/8t7tthQCE
	92sMYtqzHy8JFRp9RtAPcCHKPitDAEdHidprV7Hq9bsn/Wu4wZm2yYeWhBentW0QABQqgXvQHpap3
	I8oehj88xNNKO1HNRstIGg67gEKVlHh4MEC0JCgNkBnlpQ7OamPBqKb2NytucAtZSiHhERzypM3WQ
	nG+NfxmFmqCg8BdX21ZH3M5BycUc+Qjjl5SC1yOtZdtbXhoWT3jnicvQ7rWmelVrjAGMQ99NSdGcn
	2npb8jvoq7BcyHgib0HiXqXHuC3uLK61y1E4m2QtWvpV45PfkDu1SzAEmWh5FDqZHEsHif7QffAAN
	NNkBbm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcrp-0000000Fo8A-2omH;
	Thu, 29 May 2025 13:00:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcPB-0000000Fjfl-2IKP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:30:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad89f9bb725so162708066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748521840; x=1749126640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suszitiSJbZS8iWXXXVjI9GrivMQ+RVo/o+nLw7sB/M=;
        b=fBITYTqYHdSJUaBA0SzU+0Gho84uCVeyu6jws0m92ozruH2eQ5dqF4V9aUUn99ARSy
         OaiciM1jn1c743mbKj8Ku7k6gi4zoc5+a4064EQCIrxYciOKjVNmkopaGnqvd6w1mFTa
         NeDrRyVj8w908eZG9le0LSjZNnLDZ0ywQBwtstmSxm/1nQ2tcBT9IB+xZXfGclWixmKz
         vZGDEnKuZtTrnsKHDNEfZTHCUYppCF16n2UfwWl8U4djpdbgByLOSkCCS2T5X11VkFoo
         c8hWISdasusw1MyGczAKxU9/lQS659Z5G0JzO2t+ledU0VSWoCwjnh8JSeRYsXbQf5Rj
         kMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521840; x=1749126640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suszitiSJbZS8iWXXXVjI9GrivMQ+RVo/o+nLw7sB/M=;
        b=mVabD0hF8SmKFOkZH36ik8PqTpxCSGPXmALPMo2ixjzMhXVqVa1y/x6aesRzqMowjp
         ao+IJTt6SEGXSBjkgJdSdMnh4YJI3eXt6yVrOotsqZs/nsorRUvIec/oMpRtu/G7NGT8
         o1sAWeS8BVZgGt177WoVrW+Y1avoRUUh2ztX3QT0nBCw0qUTB/qFj22Dvlhthlna051R
         uQJn+/taCEJfqWZ7xphkihqNc1vazvy4QEn9IiFe9cgEF0MNzM6+LYSHXZzoAp3C3nD6
         9n2vUR0pMpE630UHaz/i+LvlhdpXnx5ofb+Sh8+2Zazk/CLFjuBUpsEe60zcPeP39SDn
         zBow==
X-Forwarded-Encrypted: i=1; AJvYcCUzlsQnQa4wtkZUe2VLZadmZAmsbtTorLuchQbPWxF8x2deoDMqIUh8EDAIO8VnI/0KK2gQ0waxqc7hgkz9dxyW@lists.infradead.org
X-Gm-Message-State: AOJu0YzOgD2PpMMommN6GNgv285f3wjgHvTl3yPk+5z4HHnCyZgc9ZXw
	QEI2eacqpEmi0cb0ekfSevKAzrHdjRo1ew7gH6kl83mbjZrPhRFGP8dEKQmHdYNF32M=
X-Gm-Gg: ASbGnctv12G4uGdlh2rpJsGvUY641SmymEbPCaBZFbaiYU8JikioVvKR28NT5lAvUvl
	7Gv8NuN+TkoFyeJOgUb3kZ1aCFVKSTfAPVxJu4n2jijiZwaQb2buMvi8kfu1KGc+K0uscFRngQx
	grExYJNVOXvUVubmO9H27uG+vHvmfcxLZ6281JNlUUzJv1npFdKbdgXN7VAE1VUrSAHQHsoRLfs
	Nh1q+mxWvcXgQGy/EIDTAZ5A+ljWgOenMwd6R2i8uMMGqIvPONqwwVTSwL/Tbxi0XfmF8KqcsTf
	8GTmgO/UFxL6plzUNXfTa5+c2vOYLFaCI0jp3zEWvwA6GLU/XbHSRAFpANsRlCj9WNsgH3/QHG0
	jiRBR3FmNJ/Ly2IZ6cOrtAQ==
X-Google-Smtp-Source: AGHT+IGh83QJllCl4ga2r5TeFVA+yFVEjbebpA/nYkqIF9yNbUhm17ow5NrnSrfH88Ym8gPqVxFW9Q==
X-Received: by 2002:a17:907:1c21:b0:ad8:adf5:f7f2 with SMTP id a640c23a62f3a-ad8adf5f9camr383908066b.31.1748521839767;
        Thu, 29 May 2025 05:30:39 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d850d88sm134258766b.77.2025.05.29.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:30:39 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 14:32:14 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v10 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDhTzqMLM5wR09y2@apocalypse>
References: <cover.1748516814.git.andrea.porta@suse.com>
 <2025052908-goldmine-ramp-b865@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052908-goldmine-ramp-b865@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_053041_591232_DCF193AB 
X-CRM114-Status: GOOD (  11.25  )
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

> On Thu, May 29, 2025 at 01:23:35PM +0200, Andrea della Porta wrote:
> > *** RESENDING PATCHSET SINCE LAST ONE HAS CLOBBERED SEQUENCE NUMBER ***
> 
> Then it needs to be a new version, not the same one please.

Sending V11 in a moment.

Thanks,
Andrea

> 
> thanks,
> 
> greg k-h

