Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F137C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9yKVzIA+FhMTC4rrM4hDlH+jkyt/OHi/VKWuwVsMN8=; b=zPnTfMrhLyRWmOW8top3dVPRR0
	3EXBhfD3JWgnfhSZdCRfz+f54x+VfPMetmpQ9zV7ZxHBhBbfhLHXPj+zMCVLWu0OpcLXcfF4ygZrs
	TfefAqhuI0wjgYHw+QfLJ/al5K55c58qTsOgsDF+RoHCLmjoE6RoFZJlA1kFL+8Dx0tt2x1858Oi4
	J4WxyK2C6Se/fQCoxy3PpAiXn27d+HYDX8jQeNLib7VJkLrBgt9Mtdugwb2y65OFZx3bEq/9lrcqL
	Xqc/j4NJ4GQnUEd+HHuECYaOV/WtQ56DOvBDtwAAzXft9heDo/bRKH5KPensbKOquNA8uOeu3k9LS
	dEOPu49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64vX-000000017OX-3mFm;
	Sat, 19 Apr 2025 09:55:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64tc-000000017Fm-4AjE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 09:54:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so3452554a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745056440; x=1745661240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9yKVzIA+FhMTC4rrM4hDlH+jkyt/OHi/VKWuwVsMN8=;
        b=wRkLgPPCCdKBcf6sOGr1tzo2DFfvUY8q27HWymGR0am65GaCSAVDAaq4MbkSDIU7Hx
         lecvkyZ4dJCNWyst/4P5BP27/GGVcqrSsiNT4JkLKLF2kIjQp7kkrEqgC/Su3A0o9uZh
         4EvmOBt5M9bWFs/brxNxVmvZQ3u8N4R5R65qyCeQ1mWrFST2xohXRM38K15ipBdb+CSX
         jCpMhSs5IINcb9+VWa18p1GNbLZRBkZSrxB0+gTBaoXXa13UMtpBKEaGRFAzMLT0YYVv
         BmlQDZNBaCckAIdYj+AneOx42+RwlRuGtHe/TbVuov5wtwRBqhyNUeRiD1XtOc9sj+Lb
         WMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745056440; x=1745661240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9yKVzIA+FhMTC4rrM4hDlH+jkyt/OHi/VKWuwVsMN8=;
        b=fIm6dGOivskRxxEsEPKVAjfz0trGnOn4ISbdWiC5DdNrZtNOKHSRMbkMRfQDWiRJy6
         PyxKaecr4hZMtgRu+l27I9zW6TPgCOnqDP00h3S9ezti8t+JJ0qSIEGgHiGhC4bX/woX
         4PvFxdZBmk4Mwy0OndM6Q4xHPxuLI1kBS8yTpaMJOJ67J2ehQ7R9qK2cn82NPLx6iHbt
         U/s8CWftYUEunhUXlNTEFySh24/28EoeF+2fkwVqGuQ284MY+EM22XXfzMXAU3V5J+zx
         jUEsgSkqiy3lbfTSLEf/tAEoxkwyaumr8G5wfydH0Iyb5AGhVsx79jwcS48ahHxotd32
         9Tog==
X-Forwarded-Encrypted: i=1; AJvYcCUJMS8DitZkV3EVW3HUF7yuyF5m+EINT1Id940o2KwdpEjxfLWYquz/r/wK0n0YQu2ZahRT0zph/M/9thS39CJA@lists.infradead.org
X-Gm-Message-State: AOJu0YyxOhOeDwcFie+G8AKLu24eD/lmQLeJnKDCUdHrNndU8XqmHEIi
	y6p+r/XeZiF1MTwPOVPNT/wxsBN3YjDh19als4kthldCh1ybChAjapsDfyxjzg==
X-Gm-Gg: ASbGnctp1/SbcEQuQUWOOj7MXKMR1xBq00lo2gVxgDlp3OzfYGfVBZt1NCNhqfJZwXB
	clo0OvMSS1l5Z+zC5ZDyzxWPelyixaQooUbc58QmCgq3vQakpA/Wu8beWIkqQuji2dCo7L6VgGV
	sQgGcXLHNEpeBXLYoOjuQhIJnMw9x0bbyh9ccUcpEmBhhPYAFMv2RoqEHgn5HBP4ShsdRDBwIUK
	Pqv3xJUSxoxLubKkYoI6NpLKcvnEOjFwt4/KueACOCQj1m4U1iovWd+Nlmf9sd6aMVW7rmedKiG
	7g3P3qpncIbGmI8+lJCPIYotXciHAzX080M8yKTVyY6WBFGS1sWoKA==
X-Google-Smtp-Source: AGHT+IE/nEJy748pRZBsgQs1pUuc+KJsoas+6d1SDGbI9MhgwRJ1z7aHS2ich2UbQnlsP6+skuAA/w==
X-Received: by 2002:a17:90b:524d:b0:2f1:2e10:8160 with SMTP id 98e67ed59e1d1-3087c36108emr8133093a91.11.1745056439818;
        Sat, 19 Apr 2025 02:53:59 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e05db51sm2695542a91.43.2025.04.19.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 02:53:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: heiko@sntech.de,
	Kever Yang <kever.yang@rock-chips.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-rockchip@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
Date: Sat, 19 Apr 2025 15:23:48 +0530
Message-ID: <174505638863.29894.12853512494056448618.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415051855.59740-2-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com> <20250415051855.59740-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_025401_038491_A3E5D31D 
X-CRM114-Status: UNSURE (   7.65  )
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


On Tue, 15 Apr 2025 13:18:49 +0800, Kever Yang wrote:
> rk3562 is using the same dwc controller as rk3576.
> 
> 

Applied to pci/dt-bindings, thanks!

[1/7] dt-bindings: PCI: dwc: rockchip: Add rk3562 support
      commit: 1d6d956497ded6ae02faff74ac493adefddc2c73

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

