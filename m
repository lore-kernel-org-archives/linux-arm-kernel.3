Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D152D1BDF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwCMuSM6O1Pbdf5nbt7dtIgWGi7Ix46jqsOFjxab/n8=; b=iORqadqujj6zO3CT8jTHuEJVs0
	pMlRI0B4YMD3Jxj5YSAkdz+vr9QXhBvYFz7pxY8rrQZhTzFSEhfgBRi6hDegfTIkRAiilt0iiwlKi
	MRkekJEiyLKw3igGFn/96QwU7kfq4VdK+t4a5jsoBevs/0VWB0glGODPSHHVdbf5uMGlWEau6XHSy
	VfrpMCoSrqoZJgVBv5NtHurB2MTs5qhB2of2ou92A5zO/DhfizTvXBGZfecN1WBcyPKidqpeZ6csg
	xUqgteToKyDdZaWJ5HqMRNV7rb38iSQdNPgbxjLvqRUIR/GgSnwc+6wrTnsDB6nyAPZIHIano+M1I
	rGJZU1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0gy-00000007RNN-3f9k;
	Thu, 04 Dec 2025 04:11:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0gx-00000007RMP-0akq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:11:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7ae1c96ece1so74853b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764821502; x=1765426302; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwCMuSM6O1Pbdf5nbt7dtIgWGi7Ix46jqsOFjxab/n8=;
        b=CCRkLtLoUBRJj5jx0wDyYgU82In5tV9IAqNhGF8kekpWCXygFyp4xC4DbaGbx5Nc/B
         ynsoywW/QyAzSp+86RrFq3E/6Bwnqj/lYiHrIRLhdNUdpE4FSbf3cTzaVdDJymVlS3s1
         3XW28SfBXsgc43utL9w8dj47HA4oNKFrM+r0NJmzNSm/hTsk5TABhWF12WsNM9szJbOm
         ah1h3RrDTie9SDnoUZ9l1glwrYvUX0GCelhppKM/D6V9spjQ0QwRfnVHghaHzYo2W1xQ
         w8bmIvyCFHAMT6z8dnoONGXCbUaAd55wTTPPcYT2FWQyQavHgo81cfV8v805p65nnsJw
         aMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821502; x=1765426302;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwCMuSM6O1Pbdf5nbt7dtIgWGi7Ix46jqsOFjxab/n8=;
        b=OiOF8XiNXVIGFiH2M9dVnMYq9UWTHgrUCWmpvltcvKxqAaZZdjEAPDTUrnEi0Msfuo
         vWl9sIlYcj+sAJ5LiLUEQbbMw9UQjx7gmgCEV/WO3JzolgakAfJBdbMdZ5FCDiEwNrjb
         oOWZmgZmpUqRYU/E1NhoEjzoQz6SgTNLZxZG3a80qnIRgFoIGqIkMf91H+Irpd6YM4JP
         0fnOjg3qEH+w/dHst2MnJJmATctHc8M7br9A58uVxX3oeLI2Ym0MOhVka31TvLmj7pqg
         ZiVrgoh7BobAS78R/Ta18wNAv8X2lLDst3f/4FmGS2ApVoE5tqLCsSWJgnWTns5mefnB
         mUNg==
X-Forwarded-Encrypted: i=1; AJvYcCVlBaBDWWjobIEVSFydTviOpoc+fZtRSKKtprH+MGuYJSADFl2oTETkJiJrzddctSx3pFTXK9ESwH8twzjCly64@lists.infradead.org
X-Gm-Message-State: AOJu0YxwEpApLwfQ4fkCmgKl3/yakdcKM2F5KxI2sS0ymyyyAgb2Is66
	leVZNRjdbWpazcfY8uNqDfh9OB6v/m3ERwNa9GD10RTQJX8EmGsRFh50sNT+OFpeEe0=
X-Gm-Gg: ASbGncswgtAk3llRibBNABwdimiLWQRNmtM+TR+hobB2+aSyXvUszP2Gc09yD1gpdzZ
	EOZ3S+cB+uwSmt9yN5xU8NxY7yZsFoY1uZUg2+oKnfPWZB/okbkqSNomnr3s/oae2S9g99b29IO
	qiafiaXmzn9XSYJwOLeFwZw/jJ+PNonGkXmluFVhaiq6taX8uMBHWPymvd+82FpFIE3G9K7G8Wc
	T/12S4QRARQ2uQZyiHf11Fs1tvKfyNP1gxUcssd2da+fvQn8+wt2VELFFkdZjlE4551l7KcKvsv
	MpFA2I8XBpkhqRJN5fYfzsi/uZOvp5uYJrZQK0VwRT+ZkAyKd5FKWIab+paKACTg81kk5DNkvtY
	F2TQ38r+9+QIJ69vXPxPlBkLyMmPPlJXphGt88EeyP/G/QIXJg5kFxFOcme6lxpkSoHm6Tzoad5
	mw7zXBHPX6Fm4b
X-Google-Smtp-Source: AGHT+IExUrj3ZMYLrqnhp0b5tWbY5kZoXk6/8iF/NzWQ82V6ZiAxlOcI//cw3FR+veQCCjS2CkA6wg==
X-Received: by 2002:a17:90b:1a8d:b0:340:73a2:bac9 with SMTP id 98e67ed59e1d1-34921118c1emr2376175a91.5.1764821502264;
        Wed, 03 Dec 2025 20:11:42 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-349128c00efsm2000469a91.0.2025.12.03.20.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:11:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 13:11:39 +0900
Message-Id: <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <conor@kernel.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 8/8] drivers: firmware: riscv: add unknown nmi
 support
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-9-cuiyunhui@bytedance.com>
In-Reply-To: <20251127125305.89961-9-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_201143_171296_8E8BEBC3 
X-CRM114-Status: UNSURE (   6.08  )
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

2025-11-27T20:53:05+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
> event. When the system becomes unresponsive, unknown_nmi_handler()
> can be manually triggered, which in turn invokes nmi_panic() to
> collect vmcore for root cause analysis.

Is UNKNOWN_NMI what we expect the watchdog to send?

Thanks.

