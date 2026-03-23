Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FAFF483C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=; b=W9FcrocpfeX9TGaNcGyNUxO7bl
	aFrwTi5BU0xmvaiTub4vw0eo6hoikGt1f+jpzdx3noq+Q9hGFhdifj+qgEyG84QwNDGCvMs4Qdc9B
	jxwhsf0jfSCZUVKE8qhfGC0Ra+o9TV1vS3z+h3np5KVXF3QOjk4SOXtWdr1IeEd10ZRb5xWqfqgaW
	wOYqSyatj11uxEIf8FYW5IEsi9qpWSVsHTLUcZb+/eWpf6y+7o+vQsiSq+PsYjzzspzdSnhF0WGwW
	2i6U5+gfMZmYAbDO86Gx33iaqOx/JLUExu/TtX58rSrPunpg2BI293X0mdwzyJLo7NvzyFy9HhO7E
	hpYB2n8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iBp-0000000H94K-0lGg;
	Mon, 23 Mar 2026 16:31:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iBm-0000000H93x-392K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:31:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486ff201041so24605775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283497; x=1774888297; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=nPfPiLAh04vfdd6Ilng4lyjmuG8wZQqmrJmjTNgqL3BsIbzpzZDBu+Tol9dOa4y9aT
         z1fdGSo+ttY3jqy5UL3uN7i8VqQiK3vXTu2y8BGQyOdcuHTF8RzeZUUsc0sBxXRZ/AlM
         c2XU0DsapC7xL5GYVB8cjA4qGOqSlQFuHdLSyfZ6xOC1eFoAPmJEuV+orn5Q3PFXX7HV
         KyawSe2O8tEsDQFv46i31x/1RJ181ZTbXb77gFau9gOQb9Y1jgIwx3pNFtgnIjAf53fm
         4iWlr2lKC1USRm8ylG2izWlPbc6g1i9NcC51kNxIa1AHh1tmxbQS9Z+ySffMMoq87Abd
         3sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283497; x=1774888297;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=N6FeDC6EM1y0L6KjSRkWQ3ilXA84KgxlaefEHk/7wZeVbq/16m57smdy/FPzbkPx8N
         ANCO11J5nEGsZTzZlPmCGz5J2MGuPb8K0TK2d8QxNPTXv8+mnbUPn488nkxj2GaF2Nd7
         9GSsJGhJGwZvSb0g7gGGpHRTzk4w94LAVbWb5lAut5B7GrQbtbtg/v1sTRprGoqeZEn5
         IHiyShDuIf7F1bi+aSa29pUxK2dDxsTPg/VpEQT6hHpC8581eDIQRRPhNo8CaIefl+bK
         Rwe1aVEs6ZbWdUCm+1zNwuz7SUbnrq0hcPu0MXjmjD75JaJaxdKcHUSwbzTIRUzD6Iez
         4jHw==
X-Forwarded-Encrypted: i=1; AJvYcCXgaqrvSKpaQ6GrmzAc5GbGsHoGSOOurkL/JUNle8zUfQlRSSijsIgKK0zPxo7O3MvSfy5UT1T9MU695C0HdsA5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy6VcszXj+0IOjItrv4vYUyOy9bq/mZwxPUsXdH2sPqQY/1VFn
	LcmnMtWvfr908K8y/BgLm6X0xqUt5yj2b8GkaTF3nIrEyTb7KoagyPxsnLT6+HFV5YM=
X-Gm-Gg: ATEYQzycUM6IwI53q6jdUehi6gIOoq0rBiSQ4rN2Dm75ru/W9K/EZxTiqGurLbTFpx+
	/CIAe4QSTmjTXEZkAbM5fRAOAoXZVkdtDEZtPYxmRcR32At707rDTNQ0DDbNHSfXfddAeAWe/A7
	JyMcpE/kH7HeAkzDAL54kFCQdwgWO8b8F/ro2s/Om+RhiQxplo1tV8fpDLygdE7X1/2SYUcyj7I
	qJ0J+rXV0iX3pmYOpLfo1yE0b83Ri0ST2nkHczHeh11peYeJwhj3oD8eYWYe/Rbnu27vgmHYCXK
	HveiG6p1GQkhvyUl7D8/n5tI8jpQiXtboJkIuzF4sZ3b1yqSG3PiE1rxt1GNU2TYdmdCNvQ3aqr
	5AsBvj3dE5C8OelqXB0vkYJGSSWU0xYP2K1U2VHVu3gkYuV53pj6hER2SkiGksjciU7s+/MGv0i
	pKDRbpF2mq/ixAfywn4AbI28nB8Zr0AXvHv+RcoLDINWPSyQFFlxkRweKQCIG+UXStWyzpHBeC5
	ZrRnVupAiBF
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr149439885e9.23.1774283496632;
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700377b71sm121384715e9.0.2026.03.23.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:31:35 +0000
Message-Id: <DHAB093OVD2G.3IO4C9P3ZI8HP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "kernel test robot" <lkp@intel.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
 <202603222239.JTuBxs7K-lkp@intel.com>
In-Reply-To: <202603222239.JTuBxs7K-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_093138_826795_76A19521 
X-CRM114-Status: UNSURE (   8.14  )
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

On Sun Mar 22, 2026 at 2:15 PM GMT, kernel test robot wrote:
> Hi Alexey,
> kernel test robot noticed the following build warnings:
[..]
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'

Thanks, I'll correct it in the next version. The warning is a bit vague its=
elf
though, the problem is comment that describes the mentioned struct.

Thanks,
Alexey

