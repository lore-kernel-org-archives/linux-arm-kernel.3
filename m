Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4642FD132DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JKuo9CTAykduP5fMt3ym5ibpLBBhoEvoUSqeN+sce8=; b=gLOvMRJN24sHmrly9Humszl56L
	bBM1b9cxLffnlXVOmLNQ8GCYVYSHPoJdm+vLx2adPz4otDLTMQhpAVN0L0jsKW+83HH9bIOsuDim8
	ZUvx3GcGdTNCkM887Nnz+YE96fVyFJ+TILjLQ5K4AGs2D+ZDT3xJhdsBWxYy7jB6iXJ25J0LKkgHH
	5ExuXoL//P3xVdAQ5unNQjP0B3d3g8/oPjB3tLDH0gW5TI7GT+CMx5+8QbA/WKdnwq9mQZKn0UkFY
	mmncXwLZRDF3MOGMuVqWXoiZMtmXf+o0iE/oPFRLBzE8seGjywIu76SgREGUR9J+uZ/9tNWw68Eyp
	A8RjxFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yp1-0000000EAq3-155x;
	Mon, 04 Nov 2024 15:16:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yky-0000000EA8A-0JZP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:12:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-720be2b27acso3521325b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730733159; x=1731337959; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JKuo9CTAykduP5fMt3ym5ibpLBBhoEvoUSqeN+sce8=;
        b=RHB9MsaRy62jk2AbwdIFFtuPOGEVJ0nwoAATHhclwV0IFWmrzcyXu3tHaWuyWOTolF
         W2EOORJzuqI2Yw7amxx/k+JejKZbele1B/NmsZJKaCOa3OQyjKosgm35RygohhcyEKwl
         TgSjEuGEclkhvc+0+px9mNRcFXx9VQYRMSbliia0JK0xES1XzOkG3v3tIKlxJYIMaDyE
         RlIgjJXy5/VBDSEqoHiBnSMInwNAqX8J5E2il4ZWUdlOmzsKGNGkZHDFuGFnt3/sCkdM
         JiOlV1ZskgaWzDEwlUNUx8e7KyMl8WIjbRfKHZMizll4f+ZgR2oIh9VQDHEsISrDD5ul
         1G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733159; x=1731337959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JKuo9CTAykduP5fMt3ym5ibpLBBhoEvoUSqeN+sce8=;
        b=grSQRzcoNwo9+MpsTEIFH9AwoR/d7+CqUsVII+QcW843Ng+h6SY8oXSEpUohje70FT
         XknwbdUpxkegT2hEIAJH9LPFxlM4q/DWXyc+s3N5VfAYO08TccrbWWSCDniWcjWqqFZy
         nKPsGsiasjQvILS2NZi97ZrQzLFK/8D4ZwdiUGsgiAt+/Rnx97zXqKoASBgnLW0HeS3I
         ObCIObu6JXQtO16YjC8ShQJoig7UtMSjxZ2oZpSyYVBLu2aT1Rbv+dyFjH2ThvOadh06
         3ARHQgw2scgzjp1DY2SuE/9tZBrEzAvNuSObb5JgV6Yu2JDV1W+z/A+3pP7Zp31mo97f
         A4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXsiS333MfRw3TWnjpsR5aoiClDH+UFbFVJux1Stfm3Cu5uqSiN4Gs96Xzf94CZYCYr+Yl4ShLP19DhMLTTCSSh@lists.infradead.org
X-Gm-Message-State: AOJu0YyokZ6g8d4D10fuGYgbTI8aGOzxsrg9VCqWhGDz7WggtXNVIYbB
	yF5xypNiT+ut+Ml4w8HKTTjaOp1bEbfoHXdYuybzB09XsZgbL7t6A3KxUd9iUA==
X-Google-Smtp-Source: AGHT+IEGoyeuH2l+G925Avh2F986QTf6nNmEZxSYqlhaBxmXN61/88Q3SSZ9ynilZvc+TeUuYfyKeQ==
X-Received: by 2002:a05:6a20:7f81:b0:1db:dfc8:9d8f with SMTP id adf61e73a8af0-1dbdfc89d96mr3916387637.44.1730733158828;
        Mon, 04 Nov 2024 07:12:38 -0800 (PST)
Received: from thinkpad ([2409:40f4:3049:1cc7:217b:63a:40ce:2e01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452991f0sm7076953a12.13.2024.11.04.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:12:38 -0800 (PST)
Date: Mon, 4 Nov 2024 20:42:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Stefan Eichenberger <eichest@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241104151230.bxsdu4fcf6fssx4e@thinkpad>
References: <20241030103250.83640-1-eichest@gmail.com>
 <20241101193412.GA1317741@bhelgaas>
 <20241102120403.GF2260768@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102120403.GF2260768@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_071240_138576_3B5F8221 
X-CRM114-Status: GOOD (  15.35  )
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

On Sat, Nov 02, 2024 at 09:04:03PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> > > PCIe device is connected. Upon resuming, the kernel will hang and
> > > display an error. Here's an example of the error encountered with the
> > > ath10k driver:
> > > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> > [...]
> > 
> > Richard and Lucas, does this look OK to you?  Since you're listed as
> > maintainers of pci-imx6.c, I'd like to have your ack before merging
> > this.
> 
> If things look fine here, then I would like to pick it up.
> 

LGTM, feel free to pick it up.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

