Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00438C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 04:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d05aik5hC6LDlC1wwpArorOkpaXXSmFvs4JQTlxeA8w=; b=TuiLrzhgKYXczFrJDp4NV8jMSw
	xBfWvZGZZuiokbf1vN/81T9TT4rIDGvRFsbnMexZ+52kvhJJUad+TblXKs3ltjyhjC+6zx4g46tej
	IE7L3t+eFh0AooRq0/eLSh6+LWHPpPgCcebVN31RJAEKSfaHiU/s1c+t4wmJot0PLneb2PMAOkFc5
	JQFuGY6uY6DLaryoT9dL4HMj13fzCIORitMCxufXTEsE2LzBSSWCnZZpkGeBVCvuTyGdsGmfbmPGO
	Zs1qYR/jkfC2929lrp8f9jjqT+c0wHhcRqdaEd1DA3Mv9+UZSp1RpOVsqGdrw+mlY4hFAL5osVA0W
	Q09s6T5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6LqQ-000000029uc-0C10;
	Sun, 20 Apr 2025 03:59:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6LoR-000000029mH-1dQu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 03:57:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223fb0f619dso34262335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 20:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745121466; x=1745726266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d05aik5hC6LDlC1wwpArorOkpaXXSmFvs4JQTlxeA8w=;
        b=OTAQ+l+uYmQS9DQo6mcspNjiyMsTt1JpMl/zT0B/EBQaRTabGRmkepdBW6zDPpNR6K
         pEkYvUsJQJtHoveIF1cVAC0oDOGG+OOFApO98tYhRlpiWgt2fGCFVWsk9AQqxT/N8W2a
         4Tw/5e9hl8JrirRaFtkk51VrNIgbMl8KjL6a4ZVYTHKwZcwCTGDxSs6T6uh856xib0dt
         oxroeR8n6ONHCfQJM5lBUfVtyxUEHRjKQ6LwfMabwgoa5R9i/MPaMDwktyhLMuNalpEd
         +v0Ssa36EKO/4wf9UpbZgbSAdePB+PFMoLzc2JQUOe9A3ZxU1pTds9W2EBgjwK2Ulnqv
         WgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745121466; x=1745726266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d05aik5hC6LDlC1wwpArorOkpaXXSmFvs4JQTlxeA8w=;
        b=ZkA66h6VVp7+SHa9yg5PZt1/X9WZR+TjB+RwlumZ+1WIAu0UpCgUrP4auhCkzJ2mBS
         /83H/GZaiXn+6N9uH85aN6HE5OkpLt4miWuU/IVW0OmpxCJaaMEaEotX7szjLCPSaa7C
         4tn1PWCcHf6BMGQvnrWm6hGNCd402zSR1I6wSfu2dCwDB6cK0E4/cXpjR8goSeYZYtw7
         /qM2ksDeIlg9lpa440QNkt1P8Y8X6XM+qgb6fYO/hMJQ57Z/RmUnwuEypCS4UA22U7V9
         I2AUtkK6fhmaYnI9xWKC+125+Fpa8JMrKmEq24JgfE5ayxGi4vQmiiwRdQJKfK8Ki1GJ
         BTLA==
X-Forwarded-Encrypted: i=1; AJvYcCU04Ghj/EcYgK/eYMXzIZwSoHAs/kNlnqbfsqiCKfBiPKzt58NWqv8OmD0WOCLqHghhzxM7mOZRGiPcmKNoRdQm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyax3SnDYa2I7Lnd13qpf2PB0NYcRx5DXD1EYDZSvR/Y8SON3U3
	JFAvdlOcxew6YxfpYKtFrMtFZz9y31KuK1nYIErjHSQkzwNhKBcGB/9vhHi0uQ==
X-Gm-Gg: ASbGnctzIYXN2kfqE2P3g7G6vTrAiVKSLueVpP0EAuZK8buLAEI5ZHldraYDVEETu/f
	JQuKPhKCAv+TS4MQiru+2MkWgXsHKv2rlFEQKWcXlP2DCfjGeiGYeRfjQXgY0fZhvaRugt96+Nq
	PAQ3i8FEpj5Ed+gB6vIP4FDWy4qb7UP4d/fK/4FKNRr6KUcQehkokQ3OJv6ZmIU2uxorQtPpH0T
	fEQtuObVaQ6g90SJ/JG7yVlmbq5CZuHFX4hZPob8MmdD4u1Ou+8oTjtWKv1hYZpcXiSPwXmTfbf
	lSpTMwUEUDScQ3WeiEh8wbqSLYYg/vNddBNjeee3Sz0L9aSJE/Rj
X-Google-Smtp-Source: AGHT+IGqRmfFnfaKAG1NQHv5VKFPsQHr8AgFIidnjypNgyYAdT7Q7hhn0ht2DNSI6WuV2LK9EtuJpQ==
X-Received: by 2002:a17:903:1a30:b0:224:1074:63af with SMTP id d9443c01a7336-22c5360c9d8mr122251965ad.34.1745121466025;
        Sat, 19 Apr 2025 20:57:46 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ba5sm41382555ad.120.2025.04.19.20.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 20:57:45 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] PCI: rockchip-ep: Mark RK3399 as intx_capable
Date: Sun, 20 Apr 2025 09:27:32 +0530
Message-ID: <174512144432.5058.6969526836746985984.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416142749.336298-2-cassel@kernel.org>
References: <20250416142749.336298-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_205747_452394_BF3909DB 
X-CRM114-Status: UNSURE (   9.01  )
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


On Wed, 16 Apr 2025 16:27:49 +0200, Niklas Cassel wrote:
> RK3399 can raise INTx interrupts, as can be seen by
> rockchip_pcie_ep_send_intx_irq().
> 
> This is also in line with the register description of
> PCIE_CLIENT_LEGACY_INT_CTRL, section "17.6.3 PCIe Client Detail Register
> Description" of the RK3399 TRM.
> 
> [...]

Applied, thanks!

[1/1] PCI: rockchip-ep: Mark RK3399 as intx_capable
      commit: a7d824b2df0d8b9e19c334594cdbffab97ff8d66

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

