Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D3F105F785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=; b=XqKijX5VRmPcgjGrcbZRxOrd/6
	JUZqq6CsXJvMt+9UaZ36Ma19gVW0plAUSQXB0IaQQxza6/009QOXHDIGBn+vhGC054gsKmMNoSyQY
	q7KKaa4ouWbI8nkW9reRszyMK6Lscpl29f+e1wGKX98gHk1aguyYdSmvC/+HHZOCpNbIEl0Q9ah8J
	u4vLM1tQktmrbpDLJBYXWN8ZP/E2ujvlQr2ro8jV0tYZpxOytb7C2J/EPQ1u8HK14z2o7Xg/ywdLr
	UqBEROU3A00mpW9nBW/xqkrlpmfbjP5qBu0HjLkVm9ExRMPc9FeiDEIiI2kC2CvxX3OV6pXbBGIpb
	7sWKi/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ynC-0000000HNw6-3DF6;
	Fri, 13 Mar 2026 09:26:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yn7-0000000HNun-3sPy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:26:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b940f962a82so305369066b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394004; cv=none;
        d=google.com; s=arc-20240605;
        b=k3bqXI6sGQq5M+Pw1ZasQLK08mkcP/hzQakaFjkaYj2KPF1QOpxDwbBmpTy4w4kHMU
         Q6oVMrmGxBLcPuFaWsmstTdl4ITQHiISt4H8iDfQhOkEKE4gC01Q1ADiRBzlLkJ0Ns5X
         41eCaBTbH1Nd/f4zoN9lW4gz34DBi8/ckqBa6sTkxSMc9NNxs7Lmqo0orfmEJKpvlDC9
         d09pkkzOJAMxIngNSVkvHX2cqdfB4GT0XrawC9Uf/g0HMgIY8lEB/xVbpGLGHp6+bQUx
         gWGSMTsIwZ7aL3bwcvax5EGSletwcsEV7yHdx4EmDYUwFDHjx9KDwI9/Zf5ZUORDggaV
         X/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
        fh=1Wa2KAzUOmjNAX0ndvMaY1oii9RhFaQsC8aRQ+C1CbI=;
        b=EdwaOhCAxxSCTLaOZaepKLiPicCzm/w2hGkLTp5yDduex2a3aURalLYAPdR4RKLByW
         KpwDKLz9DZSB3225gomf2rz3l/07AXmTXgzOGJAz1HuDDRftggjgUl8Lm1rTRP8OYgHH
         1nDehm4Oti81AjNikaFCWLml2ayDf7aiohyLlrqfqWMkS6803NM/oKDxb4qUNa9FgYbt
         TeDfP6uGifhtfzvH9lgYdVca5LfFrR2254BiIXF3Vg+wb0zyJL6lS0LQl53JUO+GxoGm
         QJXYeBg4Ned3YTEkbkE5w2URA9h2y/cpV8GxyFMmKtB2lOlm3PQpq85z9haHjHdDnXwh
         duHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773394004; x=1773998804; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
        b=ANjJGJbSUBJUhRnm0O+cjwb0AXQ3/xMWF2gsh5u6l2gx41glNeWMorAWuiWyqjK6Ip
         RRbPdExpHIcdgURrx9uixdkQTf5Yc4WBlfZ9Ibv6zlGTSO//ey5P8JeEORrLj6lspg66
         6C+tBVdAR/BT0bvC2N2pfMZrDhiK2Qbctaa7gNL/aAMCvPRb5lZYdn9jUWB6oVp15tj+
         Xy3N47ZOs+oIU5IcF2CasrrqRpTujaH7RgfDWbbi89YMnKA9veByZK4d3oEbhfs8g7HP
         W3aUYIYgXxlYydTJprZ+IpbBR5wcrrPe1YILzqQzjVVHbwTOW1weVtoTIfv6kIw8SD4s
         NdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394004; x=1773998804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zhdSL5TZ0+7QU3R0xnxIo4ImepctE4X0d6M5LPIqcs=;
        b=POOo0j0eH9mhEf1vvQdDlgRhiLevFufjuN881a9Z5Fe/hpVqP0pUE5kPfnmOQp+ryy
         yAnoVTq3Ua9t+uTtG/GGwJcgWtyxxfZlV0dzRYh3F7rRMGJXNZJRkYLsMB+3+KQNgP2K
         qlkQ21vJ/4XoqG9bysXv8yBYuS8oxBBfUq3R522ljNKin850q1sRK+p789A5pyhcp2MS
         XeMUnzn0q/G0HJiVLLnT9kO5Dk+KPhYtyca2LeWmo4S+DsW7dFr3DyPyrGakNp0cVeZB
         Rmv52aB7k5cGVLMxAm1hHa0rv9ly0UjpuI6+lsU1Mv9dgPVlOaoSle5ib+fW2z5uw/nn
         D79w==
X-Forwarded-Encrypted: i=1; AJvYcCXsG3bAfiDp7cRDcF28TZZyF3MG6+sYwOBL+UtflVqR/7OnU6PPAEvZebMuTRGyCLD8iq29JWpIoJ6H8rsdi67a@lists.infradead.org
X-Gm-Message-State: AOJu0YyuVsWdkyZ4QGErAXgVR+PDPEYiIWj9w6Hv0a95p0kwXCIbam0P
	C+toET0a0BrT8e/D+9BmNyQgh4N4LLmmoMBzg9ZGb2caUhtxuwJDH6n8qtgRxwMsGfM1p764nvJ
	cZ2meRV3No5iNm+aAuUKf41tV/YItBW8=
X-Gm-Gg: ATEYQzwC0Ukadjdls7ldZBtFGxEfONhRLHE2sdhyLadxnbqnbHJkStuF2VRFIZ+pfp7
	2jvtNrdX9gmBiMoK5Ce8HWLWU/T+yRq2RDV7lya//Mq3RNGU1LAaLDiBuS5AAGLqFEV0CewUWg8
	QMMGc307B/DvTSbgB9T3tIEwOZLCKtsqhSd7vlYVZs7GlgIg/bW6C96yYg95tU07D/8cUiCOeJt
	F2J8Io3NRirrQyH6T0TFjUx+uATHsR2MQZ4mFxR6W83XE8n8dTAKmaaJQSbHIffN/Kza6ToE/+o
	241Yqg==
X-Received: by 2002:a17:907:6d24:b0:b95:53ff:5e00 with SMTP id
 a640c23a62f3a-b97651ec2fcmr160615366b.58.1773394003605; Fri, 13 Mar 2026
 02:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260226101032.1042-1-linux.amoon@gmail.com> <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com> <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com> <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org> <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org> <7b5592e7-8a9d-2cf0-bb3e-e306a6337165@rock-chips.com>
 <CANAwSgTaZqsHYXD_ACkJGGLgk4knc7N72f4qrJaaenE-cXM8BA@mail.gmail.com> <DH0S7TSFKDJV.2YPSBH9F142LL@kernel.org>
In-Reply-To: <DH0S7TSFKDJV.2YPSBH9F142LL@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Mar 2026 14:56:28 +0530
X-Gm-Features: AaiRm53rZCLp_kErJJxBMXMWmeLwePiSPPATSICps4w1XibNQCvpnT-mxDnWsvY
Message-ID: <CANAwSgQCQ4z7p7Z8qe2mRqUY7zKe0w0wE+1RfYtD4NePzoit3A@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Danilo Krummrich <dakr@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Grimmauld <grimmauld@grimmauld.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022647_101339_64F9BC14 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Danilo,

On Thu, 12 Mar 2026 at 17:24, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Thu Mar 12, 2026 at 12:40 PM CET, Anand Moon wrote:
> > I've reproduced the issue on my end. Following Danilo's suggestion,
> > I used PROBE_FORCE_SYNCHRONOUS to resolve the warning.
>
> I did not propose to add PROBE_FORCE_SYNCHRONOUS, I just noted that we should
> not force all subsequent drivers into async probe() by adding
> PROBE_PREFER_ASYNCHRONOUS before the issue is resolved.

My apologies,Thanks for clarifying. I misunderstood your point.

Thanks
-Anand

