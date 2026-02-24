Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AD2EFB7F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pP/H7SQ7kDYgmQ+jqMkmQHNlrIiDaSP02Y8vKbyocy0=; b=f2yJBQvnlimo1DUKaob9azo8Gv
	5ZnDw0GHDW2E3RRQDe2EmG/uryVelqJOGCLOOrUD3Q535/+exR4c4nrRU6arM6Bb1dkHjGVJhS7LC
	jE7dOuKO4Biq+LSo7skJGjGHnEC30A7tot+PihERQO/QHvUvJpYjWhRK6hXXlCwOKChSZx5ulK/EG
	Pk+9bH37qMqwzkySvUZQ977LcllHtlg1XogHxZNSZxs2ntNBegisJLtmYBoipfGHoovLzS6vREd7C
	1+2i3MH2sw3/fEIyMSAiS+TuiT9oxNvXep0w9EROT+w/tBULr7dYWj1Qpbql1f7UHCo117vqY+HkD
	csBkMV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuokr-00000001l0E-3J8M;
	Tue, 24 Feb 2026 09:30:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuokp-00000001kzv-3FZI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:30:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso5120028b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771925454; x=1772530254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP/H7SQ7kDYgmQ+jqMkmQHNlrIiDaSP02Y8vKbyocy0=;
        b=CORvyzCCCaINW/uE6/7Lzgl7/UYonqc0WlvvcyBNBlKwzaN0mrQB5lqtTuYgP01VvR
         L8yLSMcyy33X/ST0Q8Lpj53s8FdEAiJzAAz7UTcD0VDUUabj2+ek08spY7mvu81yP8nQ
         0bhOvReRuSnbyYdOtW1a41aCAIXbtC0sOEUTi9o3S4E09uOnuaqcQJ6KB8sDT//sl5H1
         1TyR1BtOzoFr4P/M+/n5j4JKjlRJtBQcqiEfHlvgwFo0eChHQhaQT1uMpQzhq1Bo6QNd
         nhr2z+l2caEAu3JuOCI28dgxSi5O6cjiexkCI7BgT9jyz/RifGoWa0kOWszRNJJgDZ5p
         433w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925454; x=1772530254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pP/H7SQ7kDYgmQ+jqMkmQHNlrIiDaSP02Y8vKbyocy0=;
        b=s0zrGtWRbP34X+6/5vZJPgG/AXPMsdlWTY/jdPD5odGNjKjvVeU2I8An9WntN1Z7zj
         QbEu+SXlwrvou9NKlXh1zLy7ZGCTYG/rHfQ0TWhZhxSwrLX3TrugTrw8B6YHxyB536S3
         fUFK1g5KZKtNfAYdpdn7H9A5vtcqTQZR+EAs4FYlEMdeUUVrXRrje/WyixjSJCwkb1SZ
         ezKLfYf3UFcT7OieD/6V0cxf6764WE96sak5RteHf+f5vnMzo6msTLn42DQLP0O8fy0f
         3P8FXK/fHqd00O8ZOlknFULVRgWOVuD01P9W1tnmY7U1C9SRRlwrhwUXimYVQsGoZob9
         BQlg==
X-Forwarded-Encrypted: i=1; AJvYcCUHnq1jeCcDygiT/mPDTbNqfHqHriEIsKHYAF/ZZGV9hcHvXAUTA0auCvKFcjyqVUNUBNggpHZVFcA/FQpuW+Yx@lists.infradead.org
X-Gm-Message-State: AOJu0YyRbcAUXu4OUcfFrZ0RZhK7uSX/GwkfTWKC7BwHnW3OKdJAgVgi
	2vBxPIe0Fb+J1IM2JgLL8jFqpfpQUkV5ghNcTwAVU0mOZ5XjM5s9X/ce
X-Gm-Gg: ATEYQzxK2ZUYYJ6bCJxbglKsu0PRrUH5hL6jgNbWFTU9t2AbgpmHknl4oyaJ8oXBYPj
	Md2n7XUFgbV+gNigoerJtzxFU6POHK0lxu4TkKQny7ogpSrmAlLMCI/fV2ZuiVvUFNdrkgQIr1O
	CgIGCsulZkOY55sMnYzSu939mtu4IMVO8+KiprYZz6KXw1mRIg2V4DdjdpjLGmVq/j+3ucf49KJ
	pubWT/Lo9rJtLQlakuvx95wPxTUpreO+e5zIcfJw6BSq7z449k7axSeSxhS0FhHV8kTI0Cbf77I
	ZQAPVLq/zr3EqxRJofaNDC1GyfLmTpIzbCmO1ZSqkK2IH1CbQ3Eveh12BKSUq519Qs5iZHhEM1e
	4fGnvkK+SF357IHQvf1pHzn26ens/hGYP7u39Ocjv6c7gXXEjW642A8ORF17UTVQgjtvyHcsCGd
	pMHwfCk4MdfmqSmJZ4PlJa2w==
X-Received: by 2002:a05:6a00:2da5:b0:824:b334:3053 with SMTP id d2e1a72fcca58-826da8f4a85mr9620099b3a.22.1771925454274;
        Tue, 24 Feb 2026 01:30:54 -0800 (PST)
Received: from bsp.. ([2401:4900:1b90:3a2c:517f:a983:9a1b:5289])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86c5b6sm9780044b3a.32.2026.02.24.01.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:30:53 -0800 (PST)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Tue, 24 Feb 2026 15:00:39 +0530
Message-ID: <20260224093041.38699-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_013055_814006_42BCFA52 
X-CRM114-Status: UNSURE (   8.57  )
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

From: Rahul Navale <rahul.navale@ifm.com>

>this is an important bit of information. Could you verify that your
>customized driver uses dmaengine's dma_get_slave_caps() to obtain
>channel capabilities and that the newly introduced
>xilinx_dma_device_caps() is actually called?

Hi Folker,

Thanks for the clarification — I misunderstood about custom drivers.

I have confirmed that we are using the upstream xilinx DMA driver (drivers/dma/xilinx/xilinx_dma.c)
and using AXI DMA for audio. We use separate fixed-direction channels:
MM2S for playback (DMA_MEM_TO_DEV) and S2MM for capture (DMA_DEV_TO_MEM), referenced
via device tree.

Thanks,
Rahul Navale


