Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F2EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPP34a2qPJLJUDs68IjGTEbCLX34B34aXKmwHjCda18=; b=bRAcWAWGQNlvR37o9t14UbIx1T
	VRbNILxX0fXAQbrzvUY0Ms+Ut7mOy6b3fbMZByu3Tggjadei7zx3LScrU8d87iGv5cRivxQjdr+A4
	w/AS3o+K+uELW/YUp+QP/G8yeskQiIFevtDVqmctPdJuYyNtvC9KuwEXMgDqWnqsUTwPprZinpxu1
	TPOxn8TUH6yhrkVV5/IZlkCb/SZrWgv5Q9VSon+FLqYu3jJ7TKWZj1kWV0zxgbkjWmexJ523tvl6o
	yuk7rqlhXsOBme5z+zp+eFMAp8dUErFwjKqBF1cKCbhQVLttKMTqHUpO6dYjQIZ+NS2CF6dd/YPRp
	Lp1oTzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsC4-0000000Csqn-1Y1C;
	Tue, 13 May 2025 16:09:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs6o-0000000CsD8-1fKI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:03:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so12979835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747152237; x=1747757037; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPP34a2qPJLJUDs68IjGTEbCLX34B34aXKmwHjCda18=;
        b=IcjRY2wG97UUr79oV0VgjogWZ677f22Xvsse37TkBHMixKAJNeaGkppVekLrOdMpCe
         MaXFzavEsqcq0CV2fNea4R/ailrXpBgbw+SQuZQ1NzI7gtvK2chiP9FsYcOr+nfyhqyK
         7CJUEfdPJMNmxxiEsnSQc5HHo0w+FeaAk1uMRVrX9M2FrZKxjRnmmD/s83Yqvj8TiqfF
         f1gJSAkI1BZ9BEvic8yJMN/qkDelVPH0JOiY+kkgoSbx9yuTreRP7gYYveqN1MzlS0lV
         MtAisWWRWiym89EknDA2tKagQPHtfZ8aKVxGl77KFzqhNMjLT7KSuS/6OcPGhCHFCv1B
         UYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152237; x=1747757037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPP34a2qPJLJUDs68IjGTEbCLX34B34aXKmwHjCda18=;
        b=SzeuhPHPlmZAu+fE+hS1Yw3RrACDK11iG0LNslM1GZj8I77kuOL/XeX/x0vLvI0buZ
         7V1XrAVbpJJZ6RjEOV9qNK035m1MlmROQ7xD5EmdVnld7yhyj8Z3rzk7zvkiLrlYD1Br
         xmvCzaBgxgIiSv+Fmz6BhWVCySLuqUTNGhX4chM2wwijtbd2ZaRysoeq/5OBcQqx+tIE
         xworq2yY7//b8SjZ199L2XegBX6pduE0PU51wLE7RsKhb+cVMLouNP9RlIjiAUIIXt9g
         I2vTqaM0mMOSMu23uBd8X7qm7ghxztMDCSBVz9IRKN1JcYrVZnYm6Taz7Lti8YRmsFvw
         K4CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgjSO8EUXL8TyfFRXru6G30e1BOQ8ZqyitTS6gaLIlgbCEOHdiWyr+F8t78UWbq69B1n1HrBhskIf+8emxOo+e@lists.infradead.org
X-Gm-Message-State: AOJu0YyjfImgA+NQWAtONRPa6dCi4w8MbOJ/3cu5usxUOU5w2KhF7D6L
	RQbW8I+w4jsKezS1LGylVUnJKq3l9WPXVzsqDfq/TzcUj6bv2yGVDnTnPtaaew==
X-Gm-Gg: ASbGnctJrex0kMUvAuTYp5+8JojegHqU1VJvX00ZF616EVYX6MfARmXHl6TAAzJuarR
	69JJOfuWBuLS46E3ODa4FssQB2ED9lNH+o5NpJnEy53DHwCnRsn0f5vYkH9LRt6x2Zq4LeFPJ7h
	Ny1ecRHwVecPqWSXF0WaL3R0JVudzIsbYwO0pqRKcXCZgmjf6gyCDyVFyhWhZ10DgwHij8vVVVx
	xKBanU229n5mwCreVmoTp0IVxWd5P4ausNxYtB0QGdDe0xbgQDFUS3oELi7T5mAguZh+4jpLnRT
	tn4ny6ujJQB9UvD/bEDoR/+o3NkesOUfwaqMlPxioaGGD8n3+Fi3kPOPJypY98imojw/Ptzrqps
	1bGlEd0x1KH6RRA==
X-Google-Smtp-Source: AGHT+IFUs/E8lGN4Y6i35nSeqOc0zjhP+SyJASizXG0DBXcxPw4b86BdcbX5E/ih1Apnan2qlPCivQ==
X-Received: by 2002:a05:600c:4f54:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-442e9eb1c1emr42627385e9.24.1747152236887;
        Tue, 13 May 2025 09:03:56 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c09sm175331185e9.7.2025.05.13.09.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 09:03:56 -0700 (PDT)
Date: Tue, 13 May 2025 17:03:54 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alan Douglas <adouglas@cadence.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Message-ID: <lds72okw4m4novwi2ysaomolph45dzuuyxdcyl6llpruie7a5t@4v6ol6qtu6w3>
References: <20250513073055.169486-8-cassel@kernel.org>
 <20250513102522.GB2003346@rocinante>
 <aCM7lWQiwJBwamEp@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCM7lWQiwJBwamEp@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_090358_445976_628F8FBD 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, May 13, 2025 at 02:31:17PM +0200, Niklas Cassel wrote:
> On Tue, May 13, 2025 at 07:25:22PM +0900, Krzysztof Wilczyński wrote:
> > Hello,
> 
> Hello
> 
> > 
> > >   PCI: dwc: ep: Fix broken set_msix() callback
> > >   PCI: cadence-ep: Fix broken set_msix() callback
> > >   PCI: endpoint: cleanup get_msi() callback
> > >   PCI: endpoint: cleanup set_msi() callback
> > >   PCI: endpoint: cleanup get_msix() callback
> > >   PCI: endpoint: cleanup set_msix() callback
> > 
> > Note that PCI prefers to capitalise first letter of the subject.
> 
> Do I need to resend or can some of the maintainers fix this up while applying?

I will fix it up while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

