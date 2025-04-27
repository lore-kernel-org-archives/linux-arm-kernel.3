Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D03BC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6wXrjzsVf3DH1Jrc73Ekpfc7PLUWri8Lq7HSEYSNfM=; b=vc+uwdboRDrritQ4gp9YmXZavr
	dv8qEY+lOXeRbjT0xCrFEbG58ohhuHdMfOI4JcVR2fSzsOlRw/8XxyN6MQkLWNJl3EbE7tWomF9kJ
	NpHNAAeEUrPhc+ldqY+EtAu5W/GcdVcaSxo6DFHgnv38H71triR7dOoTSBawtf5428GPciW42EmX/
	38Cap3Mqhz3xoqKFxq7MvAYCvlkwapH/5I5p2cx158EpalHDtzpBfqSPVXcMGbhnOswheknUxEBt3
	2vFvoffNXS95K/5DxRJaHqReF40YVSwuovSQ4ylqHf00vmaveflbskaQeBfSM7AXwXUs/+lAi6XjQ
	FBO5xV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u93nN-00000003iaP-2J8X;
	Sun, 27 Apr 2025 15:19:53 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u93lR-00000003iS8-1jiM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 15:17:54 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b1396171fb1so2451247a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745767072; x=1746371872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6wXrjzsVf3DH1Jrc73Ekpfc7PLUWri8Lq7HSEYSNfM=;
        b=dycefAmjFNyhdkdN7FJz2Y/PZ4EqQyj0t6Yxw4CKEFnMMWd3Zen4nUZJA5jigo+hbp
         o8hroqx9A3pajFertE6jreVGrDdskeLJcbjUf9xwFU/q5feMoEDOCXCSJcm9GltrrE3F
         i3IQosgaPjmlojzHbr7gCb72N+zOuwLpP8mqxShmtR4baWx4T6vEipiorY307zC4QSAj
         zSl9GFwKRVkFw3uAnCPO70ZvzoHElTtRGRHblNg7ValGET79Hg1NgcCBnLB23K2/NW1n
         NBCAEvyCkZeM3zjLevMoU38XKbNyiYwe4Vv5dOSHFlNg88CY5NICJHl5j/iESaKyfOKN
         GmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767072; x=1746371872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6wXrjzsVf3DH1Jrc73Ekpfc7PLUWri8Lq7HSEYSNfM=;
        b=ZDw3lOaipW169bTmWtBIMzjjaZEqN46GFGyCNnmtIeIX2swEc7OdOdXq0Hb2JIT/6v
         UtYDwvgTdC8sIfRXHGhyDK3PiyeuXhT7gMRpVsbQp5AzMDYxW5q8FB1o38Ei1VkpZZPV
         w1oa3bSL6STEttDWgFw9CEDe+DOtQDTFqF1B1zh1OkU0Rrc/G7wkMUpLTMm9LtNYC8X/
         gMhRHzk30V4Ch5YIvi+Jg4Q+Vl+pLvjEm05GvnNzf33WeCYG01t9r3IzWZjsc//we/rq
         foJ5/pxfBxY8GEWpnQ4Cm1D567J8hvgLFq5V/RfmCN1xGtdU9hbzxksmmdGtRC+oURfv
         2a/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKTmtZue6LxvgvZVUEn90fQiC+BXamxGpcdtlhqtSKT4Bva6BMm9wpSidpv/P9mWq/GwXAAdVS+a/SCjHH/nZC@lists.infradead.org
X-Gm-Message-State: AOJu0YxYiD9hJupwREIKgI+BNVg8rd38PLg2hrFLkOgarjzhWnD5qbkg
	7COS2cHKUb8nK+MLqWM8mTLXff+aAA8buNtMQG7pzE2iDQij9RGLuIaYsJTNYw==
X-Gm-Gg: ASbGncuE5p9OgfVTuYe6dD7YAqxqgXxxmQupM7gy+sVZ0EAU574/eSnRffwY/iXaBqS
	NCzg/q7RYPNYJ7+JIT40eII7PALvb4jmF4Cqn0g1ssLVh6DrzYFtKwkxG9QyxPVqu9EWNPiYYtZ
	YgtJHCU7DY8uzCw48anWYIGP38D1z1ky3REYMZs3LPnXV1fGms6MT1yshuMDFFeukhZqVr8ds3A
	zRnwzcXOzRS11z4DEL3hgvQ784+afiWxs9M5Bby/lhacX9rYoIzjisfjXTXeZkcf+qikvVsSlLJ
	XlbN9RO9F3jwi5W/RdMP95zKhfD0VGFtfTqrzKL2lr36dryBgPEQ
X-Google-Smtp-Source: AGHT+IHsKSGV7qVUDINwXMp3Zeljydm0ITfFLTON/CQSAoFjpJ4D36vJUKUIXlOMdJUWWo9Rrih6uw==
X-Received: by 2002:a17:90b:2810:b0:2ff:502e:62d4 with SMTP id 98e67ed59e1d1-309f7e8ec70mr11258975a91.32.1745767072425;
        Sun, 27 Apr 2025 08:17:52 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124cffsm7834594a91.32.2025.04.27.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:17:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	robh@kernel.org,
	jingoohan1@gmail.com,
	shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 0/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
Date: Sun, 27 Apr 2025 20:47:39 +0530
Message-ID: <174576703760.21368.17997982524874077646.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427125316.99627-1-18255117159@163.com>
References: <20250427125316.99627-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_081753_465331_B910ABE1 
X-CRM114-Status: UNSURE (   6.76  )
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


On Sun, 27 Apr 2025 20:53:13 +0800, Hans Zhang wrote:
> 1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
> 2. PCI: dw-rockchip: Reorganize register and bitfield definitions
> 3. PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 

Applied, thanks!

[1/3] PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
      commit: c2f61b8479b2abcd9e20f8bd4c46e54bb7f5286f
[2/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
      commit: ae8ed2b091ee8bd92da365d3332eebf159de8e0f
[3/3] PCI: dw-rockchip: Unify link status checks with FIELD_GET
      commit: 5e5a3bf48eed8d90bc5c5b710466f24663231f0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

