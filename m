Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DB8C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITi5eWVIokI8NX7Dfs1unagdyttshAyr98E6hiT7dVo=; b=EIJ+M1kagk8uK2mSf+iczY3wQa
	1nespwTZzD927hIvQkERANIbUi7BpA5hfQQLia1qby5WsopGNOAIbokUqbPhS6nqYyv3rNrPUxR12
	bub1JOV7ZJJCMrybxWDl7bHJ1BRLa3XF2OyWRjzOJ+tMgqfH/0RJ0Axf7oOYgGGMheLqODVCWTDYn
	fSwLuhnJ5QnY/jErgVZeCSpcxFrYC7vNUj/PK0r2Iqf3KkRyCgX7jwDR8wxTOI08Fw4YuSpATs5Pw
	IaV6hJhIm5n7p4TH9USRGeT39kLdDPPpe0WoEPLO4ROYGBl37gj27yUwXAiZew2A66OrJolq8HaWv
	F33lSzmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVuz-00000006Bdo-0NZi;
	Fri, 21 Feb 2025 16:30:25 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVoC-00000006A2b-23sT;
	Fri, 21 Feb 2025 16:23:25 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22114b800f7so45309785ad.2;
        Fri, 21 Feb 2025 08:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155003; x=1740759803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITi5eWVIokI8NX7Dfs1unagdyttshAyr98E6hiT7dVo=;
        b=kp7vmCipMJbPqKKaDy41Dq/gNA4sIV8UkjeQAOXYzEOrWO3HGzCFu225xXeCl1w1Ip
         v3bYvd35jH9f3Pt5Q2WPycxG547JusN2d6ZnsFX6/0WZEjiPYQT8KZDODEfpc18ipgQo
         fBGfFxX2H3Z/BLjubvRRfm+tWCDX2ZAXz8hwlXcmqr6Cj2XmTgR6b3VRf+DZK3ZewEnZ
         BaI+FIUXPdmDL5zRBbjvmdckvtAxbsLRWPIxah4oWuGpTZi511Jhhq4TjzzRBa/yOQBQ
         sdtZmSBa+BI40GfBomgY/t8fUFZZMgFBegoRBLDrBB9SaMGe1lXYtmeDg3yY+ZndHcUw
         1BoA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ElD+yZI8K/EuCTI5bpW1WAmt+SG96E+wzStrrKUpQA5nrwFARgOOB2o6MfAfOtonzK+9Vz+ZX0avQK2IuGk1Ng==@lists.infradead.org, AJvYcCX6/aopeM3fvan/EQiRu85oBVY7PYOjPlAD/lqE/apwqjJn2KoE/kJvhuPYCImM/Av8Rj8e0cObttMJxIxW5gbC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxx0MbSl3NBI6KFgBc1MsSzDLwpfzEwJZX0E4JLp7OZwXMP5Z8
	VjgitznOu19O7Twy4QOk3VCw1Iz3iLc20lrm87vEDdI7GyIsbKTG
X-Gm-Gg: ASbGnculFSj+I2JXh/ziRvBCh6WptOI5luHLvOG0LtDY18MOD9KF14dMDsoZ4pg+k7X
	d3yNwUJ2NIAzFGGndqSCJ10mv6AkTHunjXRPYTayEqv4g8avQoB9sDj6dKiuIe+zeA5sX1Rmgkd
	XGXwkxesmUxRI2eHGKqVtsBy9NBV8UjTzU0pSfC8I3a+RtvDjC8nw2PL7ZmsDa4CmtQrEA2wxit
	SJhd24ficQM0WPpdCuSwch/+6u0fht2GgM+23lp3c+muH7Tmw15MdH96Fj+7HopfPA1Kv0df2eo
	Wn/vNPFEGK23fC1gEbkfhtGN2+vXlKhiPPQWog1fgnrejMth8Af/YGdvNqk1
X-Google-Smtp-Source: AGHT+IH6382mgQ/qs604OZFx5389HScCACYI476oB/HnFj1e8TkJWM8SG7lXAnABvg5u4OW6bEYXTA==
X-Received: by 2002:a17:903:32c2:b0:220:d078:eb28 with SMTP id d9443c01a7336-2219fff356dmr48806535ad.48.1740155003489;
        Fri, 21 Feb 2025 08:23:23 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d556e169sm139087635ad.192.2025.02.21.08.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:23:22 -0800 (PST)
Date: Sat, 22 Feb 2025 01:23:21 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 03/11] irqchip: Add Broadcom bcm2712 MSI-X
 interrupt controller
Message-ID: <20250221162321.GC3753638@rocinante>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-4-svarbanov@suse.de>
 <87bjvs86w8.ffs@tglx>
 <b1009877-6749-4bb1-95b9-ae976bef591c@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1009877-6749-4bb1-95b9-ae976bef591c@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_082324_528621_CB2EE28A 
X-CRM114-Status: GOOD (  11.42  )
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
> > As this is a new controller and required for the actual PCI muck, I
> > think the best way is to take it through the PCI tree, unless someone
> > wants me to pick the whole lot up.
> 
> Agreed, the PCI maintainers should take patches 1 through 9 inclusive, and I
> will take patches 10-11 through the Broadcom ARM SoC tree, Bjorn, KW, does
> that work?

No problem.

As such, when applying, I took all the patches from #1 through #8 and
dropped #9 as it has been superseded.

	Krzysztof

