Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F567E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=; b=s5InUWiCSEbGEQ9xq86/HK2t9/
	6QG0nvAjQeMH1TN3S5Gsd+wYjxnHP18xtJRvDfEvjCIqMLo+Xd9yd0Q5NO+N6VOiE1xoigc6I3Dlh
	0QlJX537w86Q1bG5pcGEb5rc0i4954s63c7QYmJe9vJBY6RT0lcNVw5aSmS/xEJfae1BhfS8T8oWi
	qbbkZ2LYlEZASGV1xWp9jfB8lZnMrLG351jrAe+NKYhuNw/LpWfnP2qIlksAupEoZY0v5XfcGUx2S
	jTK4sXrAR33ZilTQ5N44s3sO+3lHysv7xcFAgcdp+1QPglc13Q//1Q1YPp90EidCqWXWLt0+BXJq1
	xFPNH47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1wF-0000000BiqW-3th1;
	Tue, 24 Dec 2024 10:14:55 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1iO-0000000BgGp-0KzT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:00:37 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30225b2586cso64414461fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735034434; x=1735639234; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=;
        b=ZkYQnpsb1mpBrnqS7mdbBj+Ijgq6WNSEcyeLVKgdgy7XOlyQ2k3sbsBEsFLb0IwLqE
         OhfTP1mQ+VFJA1RrowqWJWmnQaHzKBj2ePtBsrc8fyoPHGpmzYmaWAFPXjvBALtbPKQi
         aXKRyoKWCkqyAVEbFZPD7rdaqsEWbRdeiApcnCVdftUw4z1z7jXTpIEzyaAPD+GR4DOt
         YFhaPabExHXPbgA74+z9uMODODQ8loJhl+CGsm6hfRw1gdvRw0XBSbazp0LCp9MWGg2E
         BujfAX0WtXAdoEbdMSzbRIDRefycXxQDi7WhYDkHC6PlgTt3gxKd+YPrwuTFPAcQVUoW
         TpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735034434; x=1735639234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaXLFhyvddY8J2ykAWjPDBthPNDj/QrO8YN8626lces=;
        b=lkLRE89zbKN1K7s1gpyWAreUHMHRmisxkeWvhdnKUzupN1/LDgyS4sRzqxOZSHARDF
         MwMW+ri0Kv9cBTpQJWkLbVjD2ID5Nt9JThYfK7X/yzNmyyxgwzKf4yD6gFuU2EW0e3mj
         1udgHLOlMlnLapas9S+5WiMXcD2SJ5FN/fwhQiv8yqVy07Vn1V6SoYfUn4UyXhnSF8qU
         OKJQKavflStDnMO7x4mmViqza0ANT84il9zi4GU5tvi6X8okSFLtzsUz7+D20cVObO/a
         6uPCJOl4SGCr1+WlmUtkkAdmyccrLEII8dqgGJJ77cpXcNjbjjnbq8tE/C7QrcwChcea
         PMhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+81PbiL6zjlLk9YS56Zbq7U7tZBj9mLEnS0mOqbPYHOKsM5EYv8kXrybATYPIbzuDpuUFAdNHoKpSsLmdLeDi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx5bMQE3XjHyVmSaOBJYxwPd9Kcj8G0JGqV0q++UzzqE6Y+KAK
	VyUknA783wz7HVzRTSEcBocLeijV8+DM4vmEg/M2y6zzNf98XKIQlYlmhrgsGuM=
X-Gm-Gg: ASbGnctzxl+1Lhmv7vp1f2oMvL/LGYP1HzFf/lZzLuY2If9rT7i8rObda5pxs3koMh9
	uprB5UAuQ7ChTWFjYX6bbFxzDT/jymYxdyQO3iRWX0SPKzgJznV/E/apjbBxLzkMxb3FMnI2VL6
	ZV2fLr3jyHuHU6srLCIw33pbxGMxSoyqxM/qugMVdWIeSdIjM7RApU7tbx4s9b54hpprZ/zKfdH
	Bs/nFG85E1U9MNaEqxoEwyqISSYzvc9VGR18qGBZvO/hRqxrSo3GlQYn49/UWQHyY88XxjKtVuf
	MEM5xwIjte2sbEw9wHF/lN8xdh+9TSHHU35f
X-Google-Smtp-Source: AGHT+IEtJ2E9FABbPtAZzZbxNdp+y65cylCWsCGjfOG/8r7Qoah/U7UWd9bnkQBDUU5mmh+x9lgJYA==
X-Received: by 2002:a05:6512:6cc:b0:542:28af:814 with SMTP id 2adb3069b0e04-54228af083cmr5136432e87.19.1735034434112;
        Tue, 24 Dec 2024 02:00:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813882sm1556243e87.168.2024.12.24.02.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:00:32 -0800 (PST)
Date: Tue, 24 Dec 2024 12:00:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Sumit Garg <sumit.garg@linaro.org>, simona.vetter@ffwll.ch, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <omjfxg4gftxubikx5ynu6if6fupby3nulcilw6dhwtuetpgl7i@2gwiupvg2coh>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <Z2KsuAs-Dd4ZDaXR@phenom.ffwll.local>
 <CAFA6WYNVHu7_-bNAuTYBRBdoJwfk2VrW5M4aFVkb_UWQ=uxTvQ@mail.gmail.com>
 <Z2p-v-xjhzhPso6u@wunner.de>
 <Z2p_ucfNOyKcbWhH@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2p_ucfNOyKcbWhH@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_020036_133158_41DC5B6E 
X-CRM114-Status: UNSURE (   9.74  )
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

On Tue, Dec 24, 2024 at 10:32:41AM +0100, Lukas Wunner wrote:
> On Tue, Dec 24, 2024 at 10:28:31AM +0100, Lukas Wunner wrote:
> > I did raise a concern about this to the maintainer, but to no avail:
> > https://lore.kernel.org/r/Z1Kym1-9ka8kGHrM@wunner.de/
> 
> Sorry, wrong link.  This is the one I meant to copy-paste... :(
> 
> https://lore.kernel.org/r/Z0rPxCGdD7r8HFKb@wunner.de/

Herbert asked a logical question, which got no response from your side.

-- 
With best wishes
Dmitry

