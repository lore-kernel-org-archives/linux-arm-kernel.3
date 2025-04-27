Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4933C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQlOF7pnuoHcV4tUzU9FAAnsi+yiSpTmFNxdSuCGH2w=; b=uO4kh09tT/OsqRJMNzGaX1cX2Z
	kr8CoI6XmcBrkKQBj7AhIrmZAmdGu/7ChAz11hQT2eA6IxB7fLmpoP6GWPy3Nvm2zmHVO+Y/FJMRR
	5606xj/LlUdBP+cK5CYJBxfHwL/Q+JcjYuALaUc6SoupuGinkq7MaRtGA6WY1QFVDo3Xvuci0dz5S
	8VR1XK1SQcqxbTiPV6CkEyclwoO0Px6JWYjbcgEuGA0tE/zw7h9FgcmmR3TwB43fljjGbuw99CLxj
	3huhwtDZ9EEbgBsA0j1F+N6aLh2YX/Gv6OD1VUqTjU6sFgACUwa+FdP7Q5cfWCvrznfJz9kiu3nhP
	y7DLRf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u95zx-00000003qCZ-21kO;
	Sun, 27 Apr 2025 17:41:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u95y0-00000003q58-13Mv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 17:39:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-225df540edcso50467275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745775539; x=1746380339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQlOF7pnuoHcV4tUzU9FAAnsi+yiSpTmFNxdSuCGH2w=;
        b=vL8TtCrgNfBt23ksD7MlQ+PPSvj2G7UoIRjIl4hpfRi0hYOqdoC5SjC8yYEwYhpMe2
         Z0L/Olf8jVZwgJVnLnSSD+ccce8ccPQwLZmSIhXhM26/go3fo9cla+X+Twep0Q+VW5zz
         QMTXwSNd4HVW0noC6lZq1wl5Bx4ZHWKsUCIhtESZyDcNVoJ1dtTgBtZ1FOD96ZZVPw61
         WHAsskcDLX+Ytx+oveP586okX53DO0YX2EJEiWP0nnwYDJT/fHh0MS2TmULsCcbrvXH9
         YizsN3bSWz9FrGETb2donTAW9RXxTmMNDkYBw3TnMxN8xNFOJ9lm3FrXEKkoTi3PNTBU
         HAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745775539; x=1746380339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQlOF7pnuoHcV4tUzU9FAAnsi+yiSpTmFNxdSuCGH2w=;
        b=TguipKatDCE+W9RnKEOtey+c6G4yGzWlbOUbP3P1hdxbGy2PHzapuDkSiUuaCefEwM
         bDN5gdN5gn91HFv7l8SXjwtDAl7decUfDJ8PBW8+z/qWpAXKVpu8wD0ot+HiRKcXp4GU
         y2unKlrW606S+sf45nc8v11pBbOwQtyeJLK66+q7+CF1uZtwotCy5OV1WF25H/4lfrJ9
         yylU1e/sO4M5fDXiiKUXHZkHAelF7juMjQWz1H1k/7hsWDfxehGb2y72U30xkWt2sA6X
         xSa3GF++iRRY5Czq4YgOEvC7rAq4+YhaO0EXGXhczo+0ZVrygx9eFFNkWHelDVKayNbq
         +gvg==
X-Forwarded-Encrypted: i=1; AJvYcCW+KJcgjerIjfoHvCXxVo3oV4fw7gdMCT5v8QPI4EyUc+tuUOLNJzkfrlvuEJfSkCvNEZZA74wLuOsrbaTt8CBK@lists.infradead.org
X-Gm-Message-State: AOJu0YzD92gar6MXD0Ke/oU13fTACMogPjL+IwXy+7jHe7n8x/kN9sKH
	vgfvm03xYYdGw6/MJnl+0hqd7fFOStC9hlUvysogUH8NA8uGYPZRW6asbBmVIA==
X-Gm-Gg: ASbGncsjEP3N46w8jB/IB780KwM1mL6t3zmvLlcq21Cdj7A0/rB7690VF33zHvo6q08
	3hZoNqo1mwXbKFUjQk8/BwfT/diORhItXN90jal4bhpc1gBYTcza80yIylBnbviFNp7slgJAp1l
	51cEwB+JfPvDoycTaocS4qBjCW3UiRON34cxPQwHTsAdK3BwWob7R+60tGaSF+f3/72dRU4+Itp
	Q6x8cqg2qrExPv1hNNXDHgg3HQXjlW6DIg7NkLqexMpXxLVoBSMpGjMT44WTk9CiA/MAvXie269
	0bSkJJvkx66R+S/naE1tXmm0nxcsw1CNTjwcnE2GHRl2HlHlpRq7
X-Google-Smtp-Source: AGHT+IEU5IH9SCIsyt0qXj4mqk3Sr5u/bdn7eIkZRJYO1TNJJ8pz73ALG1a7lc4tKhheycKSRkIO8A==
X-Received: by 2002:a17:902:d4c2:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22db481b546mr195207145ad.14.1745775539333;
        Sun, 27 Apr 2025 10:38:59 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbad7dsm66569285ad.60.2025.04.27.10.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 10:38:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI: dw-rockchip: Fix function call sequence in rockchip_pcie_phy_deinit
Date: Sun, 27 Apr 2025 23:08:49 +0530
Message-ID: <174577552237.92328.3418257212908173284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142138.1377451-1-didi.debian@cknow.org>
References: <20250417142138.1377451-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_103900_296265_1D38CB61 
X-CRM114-Status: UNSURE (   8.71  )
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


On Thu, 17 Apr 2025 16:21:18 +0200, Diederik de Haas wrote:
> The documentation for the phy_power_off() function explicitly says
> 
>   Must be called before phy_exit().
> 
> So let's follow that instruction.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: dw-rockchip: Fix function call sequence in rockchip_pcie_phy_deinit
      commit: 286ed198b899739862456f451eda884558526a9d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

