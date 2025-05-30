Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823DCC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=; b=J2aGDK99xDUlUwcQhyO9QDnCEz
	eipmfaM9yKmocC7Vqwb4l/hRif/4CA17K5urNPhUX8vwdPkKEvex5OJBl+jiDVi85MJHrML6qOBpo
	2BrUXjtqa8R90MAVn8rCJy3DIL8jWd6ows93X7INB0wAcgFod0FHTEzcEE1jLq5iT6+ie4CVMnWyw
	/NG1TIJ7LD2rNaGkz2t8B+fs8JrPJ+xmqzPdmWeT8rFAnBhhcQFB3jvAYwi0be2obYrF5OLchbrMf
	6ZJjozlUQIZQu8D2EKCO5hg7sk4q/gc+jhcvO3G108CbXB3ZKPl1CoHnhSYNxj3sOkhfbv+1t4CUd
	3lqBOZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Xt-00000001AlR-1faW;
	Fri, 30 May 2025 16:25:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Ic-000000017G9-3Z2q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:09:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2349f096605so26967505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748621378; x=1749226178; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=AoAgJ262hFG5aijsaRfq5QziMrRf/C9NUgbzEuOqb5Hqwxh0Ku97As6np3yIek+ZDU
         93XccZnnB2dIFBfapkH4i5fB1roLjleP9+fedHOiRvD+6f1Yq3Ze2DPyur7fiX/50kkD
         KTQF44jm4eNLzhO7xPC6vwJa7BSnh6auzJ797w10xAntRhXTiazoicLn6dpXjBIuls7h
         yC1A4mL5V9wkajzLIFgSP3+aF/ZLp7XovkdjrM/Kwmf/j6av6asZRqxgYb4OnFCuSs75
         qlZu6+TikFoLah8ERsxVe6zOu2Yx39C1/v3VJFvTatmYBhyeTeMzZCKsBsZHNKF8bcqR
         tp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621378; x=1749226178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=fH6KTJU2MC6X+W6whG4wRBLI47Em0efD/X+ulJIsRKW6S/070/jUSqsplzuw6Ro3wd
         KP61u7LtAz9ULHwz/xZkUNXI6o2YcKeTA9Qksu0CJvjfT1YEjVK56uRb+geHoQsqhoM1
         YJNS3fsPjplbJXypUGPVho05KJr5XJaqJp8rF89ksGX0/WztwYJUE7CicBKCrOsJ0Vwg
         Kr4WNQ4sZO3DIK4MzYBxHwTwZPaZ+T0MUs6gud/ykuZXYaHmBqYPI+70esCe8kmFPS/N
         aM+ip5LcQWY7BcI48/dF141HPT5QgPTNKiKtNIakkESEG75bJiasyXRTfzZywAFJhUlX
         0l1w==
X-Forwarded-Encrypted: i=1; AJvYcCUFctS4gy0n8gE9LqOCepTIFuUaRVb+e/v63gsWphWpedCFoYMGY0De/GfmuxtjeG54NwIZoqhZ+ZLx4e1Dl6Bd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7w63DoscqKqWX7D0FfGRSCHUh+b2607UOmVVUdok4gx7W7Ztb
	UeOjI6pZaMtM3/qlHh+UHJrHuHjT/WKhsgfvcprMP4e1GAxH4dSImTuVOFwXReNqgw==
X-Gm-Gg: ASbGncsaRRjodIYKgj8xKJhpuRPo7v1/pFz+RItC+5U8TkTm5OyJdTJ/qqRDqLydB3K
	A5i5Hv/iXfgseZvheZankpxA6Z9SDKqU/qZmA4UK6aHgsG7gAw2yv3UAaun/KKimgnYNK1qbdAf
	V9Niy3/SnlX9H4MrpCy8A305G6pmnUbcj0DLDcswQ4qJ2Y9KL6s4pVNcf51NGE4uleHD2husgOU
	064Ev+Pl+MnY+cff6nLeuXkmeX7Giz8ebCLRxEhIw1fd7DJ/rW3eF1rzTJfMVM2MP1xnd1FTbd8
	+Zfb6qzkwFS/sF1OJtHe/IszjZoVJJ/kl7PSrsd2OXrsfRahN/ZmG+D0nDuhkg==
X-Google-Smtp-Source: AGHT+IEaQI64EZVaM9JygVJu/CqqQgOOBJm+b8JHY4a69IBYYuuTYL7zefQI+S32XWNK9lzdgNMIBQ==
X-Received: by 2002:a17:903:291:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23529a28ab7mr65505535ad.37.1748621377852;
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9478sm30412095ad.77.2025.05.30.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Date: Fri, 30 May 2025 21:39:28 +0530
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
Message-ID: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530113404.GA138859@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090938_891407_7C09FB9F 
X-CRM114-Status: GOOD (  32.22  )
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

On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > > cannot be done in a generic way as link recovery procedure is specific to
> > > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > > called by the host bridge drivers when the link goes down.
> > > > 
> > > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > > execution of the AER Fatal error handling code. Since the link down
> > > > recovery is pretty much the same as AER Fatal error handling,
> > > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > > callback will be triggered for the bridge and the downstream devices. Then,
> > > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > > resume message will be broadcasted to the bridge and the downstream devices
> > > > indicating successful link recovery.
> > > 
> > > Link down is an event for a single Root Port.  Why would we iterate
> > > through all the Root Ports if the link went down for one of them?
> > 
> > Because on the reference platform (Qcom), link down notification is
> > not per-port, but per controller. So that's why we are iterating
> > through all ports.  The callback is supposed to identify the ports
> > that triggered the link down event and recover them.
> 
> Maybe I'm missing something.  Which callback identifies the port(s)
> that triggered the link down event?

I was referring to the host_bridge::reset_root_port() callback that resets the
root ports.

>  I see that
> pci_host_handle_link_down() is called by
> rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
> but I don't see the logic that identifies a particular Root Port.
> 
> Per-controller notification of per-port events is a controller
> deficiency, not something inherent to PCIe.  I don't think we should
> build common infrastructure that resets all the Root Ports just
> because one of them had an issue.
> 

Hmm, fair enough.

> I think pci_host_handle_link_down() should take a Root Port, not a
> host bridge, and the controller driver should figure out which port
> needs to be recovered, or the controller driver can have its own loop
> to recover all of them if it can't figure out which one needs it.
> 

This should also work. Feel free to drop the relevant commits for v6.16, I can
resubmit them (including dw-rockchip after -rc1).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

