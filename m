Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCCBE7E0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=; b=B3Hl63hqg2/ZaJObTp99wb4E+A
	v2Ro13gS1YUgSmlKISbi+HT17gD1wJqoIybmHL+qVxSrQXZnTsxBuQHUFlN179tJeoKYnVUdYebuX
	vvJzrDzrZDliwmyEb5JbaSjkkc/9fXnavS5cUqHK86IXsHw/03nQybipZNhcfZWJRldAgphe930ID
	eISBsVxFFIsbj8BJ/6hOinTLXLsEHwW1YpW2gwvV6KJ8JPDycZtNgmkTo3TzvU+kX3H6QigpdNJKU
	ARSmfLD22JEUDoAJLCCvPpsJZu3OXkSDATmnKYQMWo1CGoDmFeHBd3GHEkvXTfzEgFzNpmFqIQXxe
	LJ3ERe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUOs-0000000FiJz-1muW;
	Mon, 09 Feb 2026 16:46:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpUOp-0000000FiI0-0hw7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 16:46:13 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so625384466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 08:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770655569; cv=none;
        d=google.com; s=arc-20240605;
        b=XliHZrpLtZIV1tpcFq4JBmBoADsRiWeA8X2NdJl7QZ8L9fhf/wXKB0TV43V3X4rmy0
         9dv8B3FCSh73rGVaeDtSvKgeAtl4h6IkUO/l54ypVuGTmhiAhJP4Xgsj2KHRWW7pB2Rl
         E+MqbXkkFP4XsScB5q5DMGjk8YfQDsSXP3/SYc11nC8Efih5qlFJt1QKTdHOMsHG14JM
         A89r6w8YcF+W+VnryhBbF4fJXhNL14Qyqv78f9i0ic+WOZv/5Yi4wTqu9QE1rK6Z5MuU
         rdZ87eO6OMK8+6jK9I0itFZtn5m1kQchkHOOMOoF5mz1jhouE91zyzBYHL+GdOPC6Yw8
         K8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=;
        fh=8Ntls/SAH5VY97BUrmMFPtaYIPHY0rQhbLzUY9aJYUA=;
        b=LXb7k8PB09DbV0bhRGmB2VGtJi+SYxiUMT8JG/z8ftl6dyvTbYqtFqQoNI7aghUnMe
         Os9MTSkPt+Sim+biCXv3mb1MD+UD62smtZmkamAHHDgLYIzAawrQwdzja6jEd138vT10
         4QYVKDBuTrF9YAOwud1MA5Fx12r41UdWwlW061zANCu0uOmr/G4qD4PTvoBXf/XCdIXz
         Z033o3YTBLXTi24Ed9ThFcIBy7nvyKjxN+45ZUrJLvS3haizfCptJfZj3uftg0mC4L6N
         rFp/dRm8LCNvJicrw5n+34PMMTQCeSwq+qywU4v6SC5HgP7Q2mqMngHaK3AgbZ/QCVw9
         VhpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655569; x=1771260369; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=;
        b=H1CMJQpnVcXh32WGK4GUFbumBktkd5BKMY5uHpNURWL/7TL9BqB5NXXzLxzI6OcjYc
         dSAleR4ATU9QzNveP37sFfYd7Mxl87ae5h/IdZglZLhSiCQ2hpgYJT1F5KlLanCkDl2W
         j7vTaKRPihy8Q+mcmtYkAxFxsGqCRuL2vOTjrt1/Y7r3YqyjU8JtgK4P8DzKHJTJjoBa
         jDF+O4Wzespn38qfmCLCFg7bs5F7M/TW9SFWvgt8uTZZTA2xH0yHgk89SxSDfF/wCpSw
         GqP8Oh+ut8o6edRpnMB9DsEGzUJPdwhFpaPH0KpoOXbZs1VO5BFjp7454GYaTeMC7ocO
         WWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655569; x=1771260369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cmy/Ly/aXsHQgzu/qcl33zGOHZYsPRhFpNl3iB5uL/U=;
        b=VPG0zYWyFRNmwknu6L+9uAG58koJDacHIFy1/P6UIkGvcaj558QbA7vk/xywC1PdFz
         YwKjkqBkKTru2kJufggT4uHBEDTn/HtCIQ7CZPuiX1PQQp30JUGgzzjP5DVDfNR+3YbB
         sSJrff9DiI8FJNc3DFqdKhVO0VPHeFN/iFtM8qbezzGy9Oncyd04H8xT16CNB/9yeI1D
         I/t1/EblfIN0ayQwwcxFZnjGx3Gso6n0+ctjiUt2POwa4X5YVv1+39LPnmHf6/kViUVv
         EH82cwwrp6HBcaWSEnyu5ITMxKRuBVIN8rkDm+YUatJLQLd93q7qaS4s8UKY5tCbBF1Q
         n3uw==
X-Forwarded-Encrypted: i=1; AJvYcCVS6GYYxP9O5RjRfUMHzswM5kLg2PZVL26RTAzjj7bCwk+Zg84AJxP/5acELxtjI5aZP8ei6dUfAFcXVvQgfLOU@lists.infradead.org
X-Gm-Message-State: AOJu0YykCWpK6Un9DsjEjmoI1EewTp4a3EG+bEC8q9Aec6PCCMry6dqn
	/nIRq6BH0gdamYLt2rIgTrgKCJfGGmLNPAmApEMKXI9+ei6OVDIO9nWkzw/eQY4j6IDxfVTGjw0
	U9zCj/KfiEM27MVnm65nj/LfkrfC70F1I6kQ7
X-Gm-Gg: AZuq6aIvu1E6nrkDKbIanwPVV+mV5XWI8CQ7Ny35z/Ajz73E48taipk07iSuy+lXC6L
	E+bGOO/JXzZ5qia81sTfYejH1TDSK3JHqWihczlRI9veD21QVOthd0Y/f74UD55PVzEV2nCLWhd
	BxtSu5/UunooSdO6Lpl0BgKbSSqSTE9zUaO0SMqStJKPPCNNPy7uLbqMewrWV7Uh4IvqvzPfp1b
	/coACp5TXJG/cmbmQC96v41eNBflGdfJyxmg0f3vucZeUCuUOS0uNEN9ePk+MxE/nYRxQ==
X-Received: by 2002:a17:907:d94:b0:b88:73ea:a1d5 with SMTP id
 a640c23a62f3a-b8edf3ea285mr667122166b.51.1770655568900; Mon, 09 Feb 2026
 08:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20260206122623.670023-1-l.scorcia@gmail.com> <e50c03af-309b-4a9e-99b9-048203e8acf8@collabora.com>
In-Reply-To: <e50c03af-309b-4a9e-99b9-048203e8acf8@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 9 Feb 2026 17:45:57 +0100
X-Gm-Features: AZwV_QiytXaAnMhcHoIRtNRAi7rG9xSgIkBTP_sI10eI0oNbM5rDJB87ycIrieI
Message-ID: <CAORyz2+KLdn5YPOQ3LSj5tP3SdLTBEceFyah6tp62gjOAU230g@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks
 lost during merge
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_084611_294103_834A011D 
X-CRM114-Status: UNSURE (   5.66  )
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

Thank you! I'll post a V2 including the revised commit message.

