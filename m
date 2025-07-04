Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FC4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=; b=OSPcGr6gVirlAS0T3pPiLLcVI/
	DcYFTOEk41hulXxGocW68n67NSuZ/MVJPAxQPb84E5b2q1+/o4nP+BakspHZ4DrRGJzK8N9MmUaUH
	z76sjOpvsz8XMkBcOzauWQaay5Qm7Z5twGfaWTyr+nAPRUfkDrL7tIRDA9ZvdAwUnLF2NuO/f+/vq
	WrQha3IRojnvmvHtwt8nmvw6P+xujNcvRv/GU7q4iM/mX2J1Wrm9aZq0arml9JoHSOV7uz3mXYo0x
	kG6VRCiCb400g1bsr9R+WHPh5zJfFeSNbexyMWW8r94whrzfpghkiOsc2rt8O0TcXvCjJ4z9s+Uoz
	EKvqCHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUD-0000000EC5P-1LBm;
	Fri, 04 Jul 2025 11:21:45 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbyx-0000000DlqW-04QU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:41:20 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso6691921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618477; x=1752223277; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=KpETZEcbJf3tLqYwm4/7Llm8s14adHuomgi8IHcnIaPrwhRDlpIoxKXgnH0tQY+B3l
         lrxvg3rrvG8SeR6oQ52AXOHm+kOumL9sohuHkTz4qiTHmth+3NOnrQt79Sql7bh4/usA
         EafDpwgkgOjKglpB/6c61wTluocGdYU0mm5UBtP3382ZQkYC1hGhVOVQRILzz2+UllY/
         r5ouKcHNbIYdfAcbovIW2W1I7r40IT9upPj63GUeRuIrSu8UMgGxkVdfQNtgXVjyOXYY
         7p2EHU6+lmq7J5AEWjCePM/zYnH6A5n9K4J6dgrzw5A8AWvv2v0awFHY5IE5qnOloOB+
         JBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618477; x=1752223277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=wQfm/VXoxiBT0+J92gTSzx7L6xOSSMmO/8nndqeuuzYjTXDPY4PiXM9JFLEfSPIzCi
         fqWAbrnDZNHvN+N/C4TkOzJws3TAyIyVB0hQdb90myUTI7KVAP3vSKV/r/gYhvAOV4Kz
         UjvWJAqAK4kr1WHaVcyZGnZa8ymJoJXNTGC+kbyjKeU4xRIM2PhC0upK7OWZMB0cBPpd
         +fTFuUITOJBKGTlB+RizVf0vPccj0cEl7KHtFbVG0V10RJSBZD1600WZj3f3uycP3WAF
         eYS6zxnSyC1CIFl7yPbXjmRJTB9ueqgMBwIsY8sNEGrNkQFnnuBgEE5vDIoBahXb+ELE
         xPCg==
X-Forwarded-Encrypted: i=1; AJvYcCVb9vOPo/CVRofSu0ZVJLn9Ug2btWCXFB/RVfhFr4YG1S0fErlf1H9DnVLoqk81LB0Qp3x85yqfLb0gdmrJVtQn@lists.infradead.org
X-Gm-Message-State: AOJu0YyP7JN64PVxnJQI8SmiI55gWt3SLDYKJjQ0u9izw0fT4GdlTevG
	EJO8hv83fWaUBOV8uiK3dTKnpev0ORWdj4TZXHdkR6CDXOaZIIe1VA+Fucd2k5r1hjDSbYBkJSL
	c/oDu8Z/UqY52A7nxPyx1cmclODQ1tf2XwtHL3cGauQ==
X-Gm-Gg: ASbGncvROesat4Ocvg1m+IL48zbpzWe7riR4TwkKKQXGBTeld6uMUl1GHHlvZ/XX5uk
	48tQWGxsZB/s4YTKZwHbFWJu8m9kLsiSLW8KYmDuO5provYgP4GoqBxISzxtp2ADm93lq4VO9yL
	DU+Jj/HTFGMFB51U70R9rYloJj3beZ8KE1P8Z3Q1gy7UM=
X-Google-Smtp-Source: AGHT+IEjkMzfSLOYZgYGu/gC0rhugH3gtKCbGLeh9K4QRq1fR9qFAffWdxMFTkqp/Cs4KgSwpWDdcpA+BKTigHt31n0=
X-Received: by 2002:a05:651c:410e:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-32e5f61b6d5mr3915861fa.32.1751618477177; Fri, 04 Jul 2025
 01:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075405.3217535-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075405.3217535-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:41:06 +0200
X-Gm-Features: Ac12FXwSUe6_z6ImTsHNK6iIJFxrmJR6h51CXwInuWFdU4SXV4TvNlJsJxqlUJg
Message-ID: <CACRpkdZQGFEXU8iYreW1XHC6jbPB0v4JrqKAe5JDrOmD63hjgw@mail.gmail.com>
Subject: Re: [PATCH 12/80] dmaengine: ste_dma40: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_014119_053588_68F8D2FC 
X-CRM114-Status: UNSURE (   8.10  )
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

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

