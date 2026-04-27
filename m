Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE66FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oczoMnPReZaIdQXexoCfPQETvMC08e4WB9/AECl0kH0=; b=DdcRuU6n/LC+WvMCd3WFPnXNVi
	9RdJK9w/ZV5gCQKMTHZJiGlwe7gjL+ASV8JzOTIEy1x3KoihqKXUSBNihVPIxTMf32NCBLNAJTA4o
	SSK9TTVONObV2DouxVNoryLX6/fU5djq30TiD7fDBDaD8lHWRuwt/1hfPcVXWfXkaU1GG7vHEmWUe
	qPWrI97IEHd4bnVu6A3e/WlG/H4vuMswQgsFhZJAB/0tIBq01+SElSkPfWDpJc9JFnDDcxU7MvAA5
	ms/IgyWxmtYhPuD0oETJ0YRSCSPw/fkZ/v/2wLUzTMf37DSdAX/ApP8JN0igUBBGT02TBCgdHh6Xz
	iNXEBQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKBj-0000000Gnpw-2LH4;
	Mon, 27 Apr 2026 11:31:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKBh-0000000GnoT-0UrL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 11:31:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso75106255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289499; x=1777894299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oczoMnPReZaIdQXexoCfPQETvMC08e4WB9/AECl0kH0=;
        b=LodDXEkCAyP6uzan+Rt1xbHXkvY8g8wmluuprKXSBPVztQRYAQjCwm7PQQs+LtSPiz
         TKpKrrue4yGv4DnyEJOMEIHPspA8/ZDoo13cx1KxnuawqHdFfbYLdX1u0w0e6YvsHIGB
         lI4JzenJsRnZiByPhYM6hPO0Z6lwBnl1iPpQAJ25s4gslQQIGE96hV5/UdDlMuBVbRW+
         clJo5aaHXCMkBHYGyJFVmn98QVKoS5zhpAUT6ob+XLEPZFFOsBai36NFZ5kJAqLn0pPf
         3TX1N6RQ4BjvkiCnzNwhqgAXtwSORxVax1DmtfdAncTXfDWV57+dNApf3VErPCYli4+3
         4YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289499; x=1777894299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oczoMnPReZaIdQXexoCfPQETvMC08e4WB9/AECl0kH0=;
        b=TLxfSkIPlzpjjBLprZeCVSo3QTY/qNVUd5fFZ/JBVEjyWKYrX+Bw+GS+yVEJbpazJM
         +ekIgpoh3feh+lEpC4972SLOvxWbAnfZUBzTRwYuBCy3WJhYpSHUADVRzoZvg25oZQvX
         0FWESqVdpgt5IdL91rFnGaiQ9v8VZfyMIDvp76KOR8xiwbh6mIguSJy5evaGR3b2+GM0
         IqUyvHyz/R47CQlFfkzKS5/VhULoAigqNP9VlYk86EB0+QENeyCJfUj8VX0HxaIuXlwR
         tD+VJ7HCBigMptf7pXSHCAaqBC96n/Dv+Y/tPIcahIOq2qogyoTa/UiALxHoYcj4Hg1V
         uBzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sluV0WdZwl6MD5T1AAflxIsf7docRXtAMzqKFcpsvXwi/jpGqhGGA+g5zgQfaOBekv/jsAgMZKWdoPF1zWuNs@lists.infradead.org
X-Gm-Message-State: AOJu0YzZev3xfWWKz8Q/pU/LKoTKnT0XRkcszV7uR4h+KZNAu8jYofGf
	AfmD7LPNr9GLn7BlZAaHV103DOsmdu2rbM3ltId9RtYO44DmHvLv7GQg
X-Gm-Gg: AeBDietrVQ1UaoCEcq56ErbmTfCwLA5ZGNWGKQdEVJkQcQSKE7UdR5unf8DZ/+NfbqX
	emMCgGCru0lvWJehZ4bW8hIEvbuuvVSnpNrIFXnokEZWDISl4c+tNymYweDvUiUEeXh5DC8r5ti
	0uIESrNoh9hlAGjjY2fkLybL2xDLQyJTxrl0zJpmw4pKAL7s/tGWcdIRG+r2Lrw6Lz5Ly85QgQw
	A4FTCl61ngK6ZHZXuP8z3fWZbMOyjURbBds4KiPREfFd3XmV8Lr/GefZpHBdAvLKnFN4u4v/QRi
	ZLMsD0z1Hdcpg64Pr5jz0eUayAwiIJdc13HxGtGb+TivXTaMAoechlG2SQdvviEAnQJESG5ile6
	U3Aqwgo0dxU9a6f6uO2jQK5ln5m0Dc6YwqFmgSUgl4OiYGzysgoptyz1JUJ4QLrK2hHbuJNoIqd
	ApxzhQ+Yfu70/eZaXQ17boWTYGUsDUGGfzkA==
X-Received: by 2002:a05:600c:a31a:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488fb785b7emr456261975e9.26.1777289498891;
        Mon, 27 Apr 2026 04:31:38 -0700 (PDT)
Received: from pc ([196.235.239.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a59816b71sm221145305e9.1.2026.04.27.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:31:38 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:31:34 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <ae9JFucpXBPwwGzr@pc>
References: <20260427085458.38546-1-salah.triki@gmail.com>
 <ae8pAGBGGOvsURka@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae8pAGBGGOvsURka@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_043141_187568_5579C54E 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon, Apr 27, 2026 at 12:14:40PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 09:54:57AM +0100, Salah Triki wrote:
> > In mt6358_read_imp(), the return value of regmap_read() is currently
> > ignored. This is problematic because if the bus read fails the variable
> > val_v remains uninitialized.
> > 
> > The function subsequently assigns this uninitialized stack value to
> > *vbat, leading to incorrect measurement results being reported to
> > the IIO subsystem without any error indication.
> > 
> > Update the function to check the return value of regmap_read(). Ensure
> > that mt6358_stop_imp_conv() is still called to clean up the hardware
> > state before returning the error code.
> 
> Sounds like this deserves a Fixes tag, but the problem is that the whole driver
> is written like this. Why does having this fixed make it special?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

You are right, Andy. I noticed that several other functions in this driver
share the same issue. I will send a V2 that addresses all unchecked
regmap_read() calls in this file and I will include the Fixes tag. Thanks
for the feedback.

Best Regards
Salah Triki

