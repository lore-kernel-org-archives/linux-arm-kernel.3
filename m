Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321EDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSfLQ0ZocQ8Cc1F+LLIj9Qo0IKOtbGFRHofDF9JlvyI=; b=COTI+yH5MpRKNboo56KSL+vXR9
	MPjWAxHFg+be8t/62Y/AkvgMypq7L6j6brCOifHueDszrHBHdVOPga4cBsAcxydlpR3vg5K4kMObq
	haCLwqBGYMzUk5NUIG+RS48NOLB3WikgP4nt5GOAuYWnN/eLEVpvyGFAhZ1EQ58s42qysh5tPa1en
	oNy/wl48zVIWfdpKTuT3DHOiFDnDNhD//GBv4HFjiGEaviGRbXii0HScKJCh2/UQwb4peh/wsDshW
	ThG/4QcKh1XcBXr/OHUACaM6D/pn95Bax23WuelCNxSwDFu4mCAOnoun8YvY2+ZirxxrMfW8o+yh3
	u76Vjd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sTj-00000004Uy7-0s0O;
	Mon, 21 Apr 2025 14:50:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6sRp-00000004UZ2-3vJK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 14:48:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-225df540edcso51476335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745246917; x=1745851717; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zSfLQ0ZocQ8Cc1F+LLIj9Qo0IKOtbGFRHofDF9JlvyI=;
        b=ORPhYmgJPdjNhkZLMRYLDRDwRdeRE7aXewxhr/dwT631FzqWrhv7E7OKpT+WD8mlaj
         MrcvrhHQc4g7lJT6eYnNXfCwQ2lzY/YEU9UiHnyCSiZeiGnh/mYVOXKCI/6fhsRwIT6f
         x75uHf9qybSwDS3pjzavneIyxfKfOe5N9Sf1g6QPXfcxPqMQJsQZamKqZ4CpoJeqNlg6
         0oeFxIZbDBgaq5W6kXK9lX5onbIXzakKPf0N9aJQd4NW7ici+00V1ZI0/5AYjEKqs2xr
         n6c9c9PaUIfBUQM0BOiCWeLqx21xInRXGqGVSEz3P9jctqxn7yssNlXdbKmxSPJX0rCo
         Rcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745246917; x=1745851717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSfLQ0ZocQ8Cc1F+LLIj9Qo0IKOtbGFRHofDF9JlvyI=;
        b=Wus6UMCFVeP5iE4oTGvxXh4Tx9BAkqhpab+O0JLKfB0JM+E3A4IZgdq8s4z6NOks5h
         o22sJf7OuCMyMhFpJisfNnspVDhWONmywjKPWYMHLqOWjNq8CmsE/Hrj68Hf8eYrSoby
         Oeq/Eohe3OfStTfQSfEdJvshKW1ybcE2B14I3O/iFwHUAdpjxC1k9T7HC111gB0jj6GL
         ISpXXBEe/aTOCcEYDBtiReL4GBgZY1ieMi+LkMKw5GlIcpE2e8TrhdE4ERLuAMVKb9Bb
         03AquPdhVlJpfP3PAyxCE7XOTn9yVT29UGFED6z/AVNb+dsXCQeIPLNeh5t50rhLa8gM
         /txg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ryD+vONIgF4ibj1wnUqYKml9/Xrsh8kMfC6L3YZGAn1ng9NLkHViRKy+a0sN/ePLBvsSZ3SfKbyebhM6Nfbs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn6BTWaA4DrvvRFfrRhnHEHAoLkj/gNExBWkm6lXIUlQnOj40M
	1jNafuiwKW9JSxif7BCVu3BTmsPuxmeKDs12mWucml0CKGfdqbA+wXj6beyBoA==
X-Gm-Gg: ASbGncuyvxBHJcVUN+jXzultSkSyGSsigzSojT8zb7D37DoekQSDpw7BvG6NKuY+CRI
	0Ne7Y8F8tviQFk2AWt7DINb4abDExkRUDr8yVbT/4eQ1AqYLJNnR1gLR1mjunRjmvbU51815pCI
	RKdsmuZuo3FdxWs9BPt9eyfvXFHuhAU9WJCORTEyoBF7P1K6QahA2Z9g0o/mu4ccRTLp4cpA5x7
	2RQRfGF39cbfcF8sVHH9NsRDk+yCFUPCsMtPj51q8uWeVZYK1PHiGKcxUN3JWKk35k8XinHNw/R
	Fdpw8qJlfwxsiULIGoSRunv+BJP4dHqclhUBIP8V02+j/SygwrWN2OPC0GjXlq0=
X-Google-Smtp-Source: AGHT+IGLyVgf/HQ4DSOk1F1wHKJSkand7jXIg3hSIBpK9iwhMih+xeFlCH/OD/y2+M6k4Dl6AH84vg==
X-Received: by 2002:a17:902:ce82:b0:224:3994:8a8c with SMTP id d9443c01a7336-22c50befbf2mr187120275ad.8.1745246916945;
        Mon, 21 Apr 2025 07:48:36 -0700 (PDT)
Received: from thinkpad ([120.56.203.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfae9e77sm6662709b3a.160.2025.04.21.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:48:36 -0700 (PDT)
Date: Mon, 21 Apr 2025 20:18:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, heiko@sntech.de, 
	robh@kernel.org, jingoohan1@gmail.com, thomas.richard@bootlin.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
Message-ID: <vtb7vd7xbdoct3k2ck6nqngevq3os7t6iof5vyxnfoutingjpl@juhcjyp6qstp>
References: <20250416151926.140202-1-18255117159@163.com>
 <aACoEpueUHBLjgbb@ryzen>
 <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
 <aACsJPkSDOHbRAJM@ryzen>
 <ca283065-a48c-3b39-e70d-03d4c6c8a956@rock-chips.com>
 <aACyRp8S9c8azlw9@ryzen>
 <52a2f6dc-1e13-4473-80f2-989379df4e95@163.com>
 <aAC-VTqJpCqcz6NK@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAC-VTqJpCqcz6NK@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_074837_991014_8B4E803C 
X-CRM114-Status: GOOD (  24.79  )
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

On Thu, Apr 17, 2025 at 10:39:49AM +0200, Niklas Cassel wrote:
> On Thu, Apr 17, 2025 at 04:07:51PM +0800, Hans Zhang wrote:
> > On 2025/4/17 15:48, Niklas Cassel wrote:
> > 
> > Hi Niklas and Shawn,
> > 
> > Thank you very much for your discussion and reply.
> > 
> > I tested it on RK3588 and our platform. By setting pci=pcie_bus_safe, the
> > maximum MPS will be automatically matched in the end.
> > 
> > So is my patch no longer needed? For RK3588, does the customer have to
> > configure CONFIG_PCIE_BUS_SAFE or pci=pcie_bus_safe?
> > 
> > Also, for pci-meson.c, can the meson_set_max_payload be deleted?
> 
> I think the only reason why this works is because
> pcie_bus_configure_settings(), in the case of
> pcie_bus_config == PCIE_BUS_SAFE, will walk the bus and set MPS in
> the bridge to the lowest of the downstream devices:
> https://github.com/torvalds/linux/blob/v6.15-rc2/drivers/pci/probe.c#L2994-L2999
> 
> 
> So Hans, if you look at lspci for the other RCs/bridges that don't
> have any downstream devices connected, do they also show DevCtl.MPS 256B
> or do they still show 128B ?
> 
> 
> One could argue that for all policies (execept for maybe PCIE_BUS_TUNE_OFF),
> pcie_bus_configure_settings() should start off by initializing DevCtl.MPS to
> DevCap.MPS (for the bridge itself), and after that pcie_bus_configure_settings()
> can override it depending on policy, e.g. set MPS to 128B in case of
> pcie_bus_config == PCIE_BUS_PEER2PEER, or walk the bus in case of
> pcie_bus_config == PCIE_BUS_SAFE.
> 
> That way, we should be able to remove the setting for pci-meson.c as well.
> 

Sorry for being late to the party!

I agree with you that we should set the bridge's MPS to MPSS by default. But
doing so would have an effect on almost all platforms. Also, I'm not sure if the
BIOS would've configured the bridge's MPS to a sane default (I'm just
speculating here).

So IMO we should limit the change to platforms having controller drivers in the
kernel. This way, we can get rid of the MPS hacks from controller drivers (like
pci-meson) and also make the change less invasive. If required, we can make it
generic for all platforms in the future.

Let me share the diff I have in mind as a reply to hans's proposal.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

