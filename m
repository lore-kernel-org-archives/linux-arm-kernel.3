Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671E7CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=; b=q9n7eOdYxtNMc4KqMUN79FENl6
	mBtABSK7jy/qykpY7QxjLID33RAtqHGaRYS33O0nHSp+c+0l22RbxxcV0rd3C/zXF2BGwGMf+fKez
	nX8b7NrRGeRUKhcLQLshEtYcSZNa5uQcRHEsXjZXO/HcFGLAAy4GwLgdTQZzJeF3OqHuNLrLegoJi
	sCTaTBkYgvKvM0eoFzNS4t2F+Uw/JlGP/vkIf9SmZO7BuNm7s9gGwmKCujaUNwzVqaZ6VYrfvb3nl
	Po5hexDrX9macMr+3U+0+2VGQEZ0RuIy0oHEjHrsQ7ODy6lk3Tc0nSyoYBMXi/YHYXEGCaZXF9Urx
	XOVqa0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9po-00000007E61-0T20;
	Sat, 30 Aug 2025 00:52:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us8zD-000000072iF-43fh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 23:58:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-248ff4403b9so16549125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 16:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756511907; x=1757116707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
        b=Jqa/0LS65vFQrE4q+XL8d92enTmswT0QluscxjU5bJ3QTuF0CCItdBKnipRrJHRscq
         djgSD+eqjsvxWUKwofSuXfvbttBuPfFOyhGKD2bfmvXwiJ5Vf+6IaFYRwO21gfOM+M+Q
         HsxWjefMn6UPEvjd3dfqkm+BbnvIjowx9VW3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756511907; x=1757116707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
        b=VYmncNAM7QytZir1yfmDh2UdK3MevwCsF/T8OI9kICKlQIS8gN/IFYhVFf9fe5i5Y4
         jUCkgkYP8i8kKp8GldEvufJl7mBKaaJRORb2q4Vw4J/GLztJUNwJrPN7yKQpZB90IKcD
         Yskf49B3i8jBUornhQF8Bzi5zdy0krhSusRNxWZxL4d37jrt9HP5y/Dl8JUyoyDnpBsm
         PtmWQ6fZqM37CcR9moUxgYizptnBOlkR35R8ufCPSwgUoQSQ2nORLiBZ8pW+CvrqtD3u
         ntVwGYe1L9eA9Y1xnh2SK4hHStXLoG7MtmqcT1qN2jOZaTwJZn3L5SafyBEilyXf3kl5
         MqSw==
X-Forwarded-Encrypted: i=1; AJvYcCWwqk6IXo/DrzYwO5h/JItF8x1FIyHHGYIKPqIkeTebFN1YnSKUap8jb33htA94RCHUlrnfl3mW848D/wEnVgUA@lists.infradead.org
X-Gm-Message-State: AOJu0Yytsqvya1oeaaiB+/R4lwy9EaWwfAlb48qsqcOzMhEx8ohQb0ug
	slMuM8D1zxjw8VqDag+gDW3pBt4Gp0zqVuQ1qRqqlbc6vK/8NOm4VB15syiE+h1bAQ==
X-Gm-Gg: ASbGncsmNrIX+DfnYbfKGYWPEXcp2L6J7avcAVNBk2vWDPJQGZpEf7SVEGAAgTlMqui
	HEkh1koYTsQmv8FzSIQZhgzQnXVDoHR0mBaiOhlfGcjt+y1Pr6ZNpKBkAgVC+epWAnSzCtTdtG+
	H04aCnaiwLSTb1Eln00AN1xzJ33ocvoG642u9ptmIRp6QGz9co2mPCfkPsUYGnuNb3sZqy3G2oT
	v6IOPiu84nyuyh8oJcSyKkPRjBw1zWQ30lj6D+DD6FaEG10CB4ynxXOXKV6AA+s1IB6XlEQzAM0
	I2hit1xji3Eqb0zTzhlct2Gic85ZhVG5xmn5qwTBd7Z+AVuXga/8rfkbWkf5cv5dVnRKohexerA
	QlsoznTzrPlI5PwWix/S37UuY82t7hAf4/8WFHK1yVQGV+TO0YahGKw0ZLdcV
X-Google-Smtp-Source: AGHT+IFvZvVbN+tcqDt9IuyuJa1uB30zy62FBhMsBU2d4G2xup0DO7jJDkNE7M+ZQIjDPW8i5FxZDw==
X-Received: by 2002:a17:903:2308:b0:249:33da:b3a with SMTP id d9443c01a7336-249448ad928mr5527165ad.14.1756511906811;
        Fri, 29 Aug 2025 16:58:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:1d4b:87a6:eef4:9438])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24906390e6bsm36386045ad.96.2025.08.29.16.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 16:58:25 -0700 (PDT)
Date: Fri, 29 Aug 2025 16:58:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <aLI-oKWVJHFfst-i@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
 <aLC7KIoi-LoH2en4@google.com>
 <aLFmSFe5iyYDrIjt@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLFmSFe5iyYDrIjt@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_165828_038142_41976107 
X-CRM114-Status: GOOD (  40.16  )
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

Hi Lukas,

On Fri, Aug 29, 2025 at 10:35:20AM +0200, Lukas Wunner wrote:
> On Thu, Aug 28, 2025 at 01:25:12PM -0700, Brian Norris wrote:
> > On the flip side: it's not clear
> > PCI_ERS_RESULT_NEED_RESET+pci_channel_io_normal works as documented
> > either. An endpoint might think it's requesting a slot reset, but
> > pcie_do_recovery() will ignore that and skip reset_subordinates()
> > (pci_host_reset_root_port()).
> > 
> > All in all, the docs sound like endpoints _should_ have control over
> > whether we exercise a full port/slot reset for all types of errors. But
> > in practice, we do not actually give it that control. i.e., your commit
> > message is correct, and the docs are not.
> > 
> > I have half a mind to suggest the appended change, so the behavior
> > matches (some of) the docs a little better [1].
> 
> A change similar to the one you're proposing is already queued on the
> pci/aer topic branch for v6.18:
> 
> https://git.kernel.org/pci/pci/c/d0a2dee7d458

Wow, nice coincidence. It's a reminder I should work off the maintainer
/ -next branch, instead of just mainline...

> Here's the corresponding cover letter:
> 
> https://lore.kernel.org/r/cover.1755008151.git.lukas@wunner.de
> 
> There was a discussion why I didn't take the exact same approach you're
> proposing, but only a similar one:
> 
> https://lore.kernel.org/r/aJ2uE6v46Zib30Jh@wunner.de
> https://lore.kernel.org/r/aKHWf3L0NCl_CET5@wunner.de

Wow, that's a ton of great background and explanation. Thanks!

> > Specifically, I'm trying to see what's supposed to happen with
> > PCI_ERS_RESULT_CAN_RECOVER. I see that for pci_channel_io_frozen, almost
> > all endpoint drivers return PCI_ERS_RESULT_NEED_RESET, but if drivers
> > actually return PCI_ERS_RESULT_CAN_RECOVER, it's unclear what should
> > happen.
> > 
> > Today, we don't actually respect it; pcie_do_recovery() just calls
> > reset_subordinates() (pci_host_reset_root_port()) unconditionally. The
> > only thing that return code affects is whether we call
> > report_mmio_enabled() vs report_slot_reset() afterward. This seems odd.
> 
> In the series queued on pci/aer, I've only allowed drivers to opt in
> to a reset on Non-Fatal Errors.  I didn't dare also letting them opt
> out of a reset on Fatal Errors.

Right, I can see where the latter is risky. Frankly, while I have
endpoint drivers suggesting they should be able to do this, I'm not sure
that's a great idea. Or at least, I can see how it would potentially
break other clients, as you explain.

> These changes of behavior are always risky, so it seemed prudent to not
> introduce too many changes at once.  There was no urgent need to also
> change behavior for Fatal Errors for the use case at hand (the xe graphics
> driver).  I went through all drivers with pci_error_handlers to avoid
> breaking any of them.  It's very tedious work, takes weeks.  It would
> be necessary to do that again when changing behavior for Fatal Errors.
> 
> pcieaer-howto.rst justifies the unconditional reset on Fatal Errors by
> saying that the link is unreliable and that a reset is thus required.
> 
> On the other hand, pci-error-recovery.rst (which is a few months older
> than pcieaer-howto.rst) says in section "STEP 3: Link Reset":
> "This is a PCIe specific step and is done whenever a fatal error has been
> detected"
> 
> I'm wondering if the authors of pcieaer-howto.rst took that at face value
> and thought they'd *have* to reset the link on Fatal Errors.
> 
> Looking through the Fatal Errors in PCIe r7.0 sec 6.2.7, I think a reset
> is justified for some of them, but optional for others.  Which leads me
> to believe that the AER driver should actually enforce a reset only for
> certain Fatal Errors, not all of them.  So this seems like something
> worth revisiting in the future.

Hmm, possibly. I haven't looked so closely at the details on all Fatal
Errors, but I may have a look eventually.

> > All in all, the docs sound like endpoints _should_ have control over
> > whether we exercise a full port/slot reset for all types of errors. But
> > in practice, we do not actually give it that control. i.e., your commit
> > message is correct, and the docs are not.
> 
> Indeed the documentation is no longer in sync with the code.  I've just
> submitted a series to rectify that and cc'ed you:
> 
> https://lore.kernel.org/r/cover.1756451884.git.lukas@wunner.de

Thanks! I'll try to take a pass at reviewing, but it may not be prompt.

Thanks again for all the info and work here.

Brian

