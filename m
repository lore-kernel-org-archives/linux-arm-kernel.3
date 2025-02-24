Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350A2C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQq55i9sPiHAagM17ICTCVjXUcSmU6FsFp44CyEwhoY=; b=Ei97AlEIYC8WhvqT0uQgtzE5hR
	77gIP9hpC2+eMudCOFOYF1/jBksnhqu/gEon8scjHiuAtb8vAE6FK7FLSLnf55lv2M71/AA/OIphq
	egsoYNG8iUG+EVv35b2Gp1NCbPi5UA4HxNfAm+I/TJ9HmQFNxR/4cgruRf3bjNOKSKSwtdueExl9Z
	jbR1dNP9uvQ9ue34Mb8fPka3NCXwu3cknp49mNgTwOpe5QMdW7n46CXEQ1WK4NUXaAVoYpRD8rDGV
	Q0qoZ1SVIkKACnPPK/sL3cnrGdxCRwb8UrESjXABo/YOOlacgtjX4Nu2p5qsXLRXTtZymFgf2KkJ7
	cXaQzbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZhO-0000000E9RN-1L1L;
	Mon, 24 Feb 2025 14:44:46 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZIT-0000000E4GO-3BnO;
	Mon, 24 Feb 2025 14:19:02 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220c92c857aso75894325ad.0;
        Mon, 24 Feb 2025 06:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740406740; x=1741011540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQq55i9sPiHAagM17ICTCVjXUcSmU6FsFp44CyEwhoY=;
        b=q0iy92h3bIKOhqND5j4g6SBDz7A1All/5Yr/4Qqo7pP1q5AeJ7cG3mcsT8tgiBS3oE
         YxFKUMIk/HtzDWFRC2pBAQrZPlSUbTn9o6HBY6FyMMLx6cA3SVaoUG9nptZvl8VTXF+8
         cKh4sQJ3P8dHMT8pR9PVhNkz5SBUtCZDdZbtczNIm/qSIwxN6L1BJiCihILHBkF/Bibh
         7XCHKKOqlFNFsGr7ujONkb2fovZg5AFOz+O/qOmsWKa7LCZUCL4B9P7WAXdEyy0W+srD
         I1rMWILa6uE8aN//um9eHezIvmtKW+zr6MtDtFcS01hscd1oiM7vBjf4Rkc9mzrW9Us6
         1jlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1f44E/SZbliOUEj0kqtXjZZbK+CglVjI5UvqqPkDxaV7mB/cdLWPXtG1k91Ke0y+gyHxjYmdrVjmYoPhwiss=@lists.infradead.org, AJvYcCXSRwcC3zJ4eIS9PPIno0EYiIEB5L8SlQeDWDQwjwSv0i7RNHMB9LByCaO+P66pY6KK46Tnpl9DH3x6otF8izP2@lists.infradead.org
X-Gm-Message-State: AOJu0YyM9QsRwrljeSL08EoTzJKBry57lcRArPpgX5x8ReI/ezfbrfHX
	weDwQHVT6kS1Bb5YB6wIzQeWASBKDHPto41Qs3ikqoMIcrmpu3rY
X-Gm-Gg: ASbGncu07NCdkgtA1Wp68WZ9veVTxWZKHk3xs1SapibRHsRJJ5nmeMOAGPscqNYKAYT
	DMBCNijRXNebZZtOsa2FstzleKEAicmSDD4C/CnwZcXH615M1PWzpf9DktqgSwS/1Mmp+YhPP7r
	XqHZoFpE4Lwj7qdMBue68IuOW9QVYAaI/Fv392HyZI6+Kgny+QlWY9/z24PPFrLsQQVrR0LGQcF
	EwN5yi4AA9Da9Ni0leXkvdg1uC5gSMQlA9PA3qnB1QSTRr1V6E3xSSVStA+94zqwifr/Bb7JtNO
	M1v8/0a1h3zO9u0zd03UI9O+ii1xHDDSg7mzu37MgozK7ldUjNKUNM/ImPMF
X-Google-Smtp-Source: AGHT+IEArhAzVGpSC5/pwMA8672aG8JuHulEEM/yIdtoSC6FajaFQZpNsOz5Nyb51qV69zSmstlAhA==
X-Received: by 2002:a17:902:d4cf:b0:21f:6546:9adc with SMTP id d9443c01a7336-2218c3f4333mr288752845ad.13.1740406740281;
        Mon, 24 Feb 2025 06:19:00 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5586075sm178543045ad.228.2025.02.24.06.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 06:18:59 -0800 (PST)
Date: Mon, 24 Feb 2025 23:18:58 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Wenrui Li <wenrui.li@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <20250224141858.GB76745@rocinante>
References: <20250221202646.395252-4-cassel@kernel.org>
 <20250222000029.GA373377@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222000029.GA373377@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_061901_793432_1B31C89C 
X-CRM114-Status: GOOD (  17.00  )
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

[...]
> Can you include something here about what the issue is?  Based on the
> subject line and the patch, I assume something is wrong with the ATS
> Capability?  I guess this is some kind of rk3588 defect, right?
> 
> > Usually, to handle these issues, we add a quirk for the PCI vendor and
> > device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> > we cannot usually modify the capabilities on the EP side.
> > 
> > In this case, we can modify the capabilties on the EP side. Thus, hide the
> > broken ATS capability on rk3588 when running in EP mode. That way,
> > we don't need any quirk on the host side, and we see no errors on the host
> > side, and we can run pci_endpoint_test successfully, with the IOMMU
> > enabled on the host side.

Rockchip folks, anything to add about this issue?  Perhaps there is an
erratum about this?  Any code reviews?  Anything?

Western Digital folks are doing you a lot of favour with all the upstream
work they do maintaining drivers for your platforms.  But it would be nice
if Rockchip took some ownership.  I have seen none recently.  No reviews,
not even an Acked-by, nothing.  A bit of a letdown, if you ask me.

Thank you!

	Krzysztof

