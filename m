Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18B4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1AJb/5nJjGuAi7KNzBsrlIYLjJOf6yj55dAqxN2Vz8=; b=prG+chVnI3xPgHes+AmRAATXUl
	T4Bf/F09tSfLjw8ZvGL1T6cp3bVrI1pDJQIb2YjHmsWD4ztp+DAS/8wjdo/1CouxaI+I5oCTYUxF4
	trYfv4J24K5z4b8dTF6wnLJsvrzd0xPQFQkeANfBSeBu1RP3O2C3AjJoaUDsPGuvyOaNOABrxsYkJ
	cq2YvM9U1S4coIi3vmWE8fI7dhPp27dPUeMepDk20M2wRujaDS+jhoLOal6J8gQ1f0tqvYxH6hz8t
	Iiu7UaGG77nnl2y+p0JN5ZpuVb/IeYkXyyEgBbiBuJhipwRj10m05r5fpgf9jnBoUvnaMr3QMexqZ
	S2H2YCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkPU-00000003yXf-0363;
	Mon, 10 Mar 2025 21:11:40 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trkLm-00000003xro-3mJw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:07:52 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so6865038a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 14:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741640869; x=1742245669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1AJb/5nJjGuAi7KNzBsrlIYLjJOf6yj55dAqxN2Vz8=;
        b=FHFYbj8P8q6+Ck2dXCOfFZpaFqEwikV1StNOafa+vPsCk+uznVBtgNj806UxUFRT/Q
         UqV2XNgxCCIlvWhs/I1vYCaddk79oYpcd8boiq0ZxhSYSy2XDWWWb2YKkReb2tV5i6wo
         EtBzb3AG9EHXt7EC7b1hRptZgU8mPdITDE/6W/YGvpjtT87dyVMTGp1eg//Mn705ZD2G
         UR72CIItIm+bpFreQqugEwczAtOw+iUQks/kzo2GbE8xqa/VZPMxM2fz2eelWi8mXkeI
         fpbvGMyJaKOtkhEHIp+ktgbNZ9F0hu8HnY+pKqejIwCfzAist9Q+tCLdnuIrciTjQAfD
         iLhg==
X-Forwarded-Encrypted: i=1; AJvYcCVViTrSnGjTkmek67WKciszuYcYipH/gJ4bU5XUIVm++opHlafopA5ougEcmvpBsug1k2SeM2Njao81tNIkI6xw@lists.infradead.org
X-Gm-Message-State: AOJu0YyRXA06yHuujfqAbGVpFXNepuC8FC86Mu6DVracqVY0oRYRdjYS
	Szu7lelpehrWmLLuLhuRAn8NJIsV6/69uAJ/Z8XdRSQ3NPMGKHl68QG9dFMaaFA=
X-Gm-Gg: ASbGncv+/nZ9Ap4+bxOhUhL0Ysu78BzfX4LzEpoJpfYK+PNgBuaZyMieTUOSZkjdd9y
	aHwWWQh4jhnLVOc3+FQ1X40kCQ7Bkg8CXJOOPw08ISsNiNIfAN4/NXDvIcVG0fz4zn1DsZhYF77
	WhlCiBh5dAhH8PKSdIE1Nltz0Wp7RCnUBL2vYr8OUY2pTgu7Pqvv/zChddSk8fQ5U2V7+VaD8gK
	jMvSuo1kw8zVG77Xp2Y1X6ACm1411R3IAP08me4RRE23npS620y1ECMhdtm3Y+6SClrhS+d964y
	l822A6p2fVkDYp7lrmwjqiznTw+wTGkRfWtf2BhJihSl90v8t1GWCjXWjbMFOfnzACnyISqe5su
	kY6g=
X-Google-Smtp-Source: AGHT+IGc1KBuVi32oJuLLXoUmcYMGQ+dxMVqfvMg27687+GtmjFcAnXL+mt7Wixdqbol46Ej6Gut0Q==
X-Received: by 2002:a17:90b:4c44:b0:2ff:4e8f:b055 with SMTP id 98e67ed59e1d1-2ff7cf14526mr24048537a91.35.1741640868746;
        Mon, 10 Mar 2025 14:07:48 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-300fe40c28dsm706225a91.33.2025.03.10.14.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 14:07:48 -0700 (PDT)
Date: Tue, 11 Mar 2025 06:07:46 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250310210746.GA2377483@rocinante>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305132018.2260771-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_140750_937011_8AFB57C1 
X-CRM114-Status: UNSURE (   9.78  )
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

Hello,

> Hence, set 'linkdown_irq_regfield' to the macro 'J7200_LINK_DOWN' which
> expands to BIT(10) and was first defined for the J7200 SoC. Other SoCs
> already reuse this macro since it accurately represents the link-state
> field in their respective "PCIE_INTD_ENABLE_REG_SYS_2" register.

Can you confirm for me that the following use the correct macro?

  333-static const struct j721e_pcie_data j721e_pcie_rc_data = {
  337:	.linkdown_irq_regfield = LINK_DOWN,
  
  341-static const struct j721e_pcie_data j721e_pcie_ep_data = {
  343:	.linkdown_irq_regfield = LINK_DOWN,
  
  347-static const struct j721e_pcie_data j7200_pcie_rc_data = {
  350:	.linkdown_irq_regfield = J7200_LINK_DOWN,
  
  362-static const struct j721e_pcie_data am64_pcie_rc_data = {
  364:	.linkdown_irq_regfield = J7200_LINK_DOWN,
  
  369-static const struct j721e_pcie_data am64_pcie_ep_data = {
  371:	.linkdown_irq_regfield = J7200_LINK_DOWN,
  
  375-static const struct j721e_pcie_data j784s4_pcie_rc_data = {
  379:	.linkdown_irq_regfield = LINK_DOWN,
  
  383-static const struct j721e_pcie_data j784s4_pcie_ep_data = {
  385:	.linkdown_irq_regfield = LINK_DOWN,
  
  389-static const struct j721e_pcie_data j722s_pcie_rc_data = {
  391:	.linkdown_irq_regfield = J7200_LINK_DOWN,

I am asking as some use LINK_DOWN, so I wanted to make sure.

Tht said, the following has no .linkdown_irq_regfield property set:

  355-static const struct j721e_pcie_data j7200_pcie_ep_data = {
  356-	.mode = PCI_MODE_EP,
  357-	.quirk_detect_quiet_flag = true,
  358-	.quirk_disable_flr = true,
  359-	.max_lanes = 2,
  360-};

Would this be a problem?  Or is this as expected?

Thank you!

	Krzysztof

