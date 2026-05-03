Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B9FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uthZmONBUuk+WMGtj597kAOFGLE8xMCSEXcpDcg2u6c=; b=vrVHv6dpzdh3o4gWahoLGJni3/
	n6cXhi8xrHcfYxYhWYtOHiDU/Yttl11HvBdWWBwm/kFmuY+baBgoOx2J/uF9C5Oirg/ocvTFtgMum
	PqZa7TVzemC+OvTx0PDwsyUgS2gi31SyQtEL7JNinSQWavU8s94mAdyWrRr8cw+CMxB5F7JdzhNfo
	m6wv6qMFZL3h8PVrCCcBQ1SpFt/mQOCEtGqG48rOZYYrbhMX2Jac3VXHfdh9QY454tjGT+ZWsecsU
	PtJToib9oLyqkgiowAoPVqDoBlRgJSSPPaXbucY1YzTi80/iZzF7pYeyCi4F97Nd6orwHBW9KBJ5g
	1DnhBCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcpQ-0000000BcLN-2sRs;
	Sun, 03 May 2026 19:50:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcpO-0000000BcKt-0tKK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 19:50:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b941cd869cso19423625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 12:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777837808; x=1778442608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uthZmONBUuk+WMGtj597kAOFGLE8xMCSEXcpDcg2u6c=;
        b=YJqD7CrxgpWXQdN5/jR9+1GISU5GkpSXbV7nkv1zXJjiMtKPQH3ZcAGP1PMyI3HWaZ
         cMecZgx29Ov8B2DTuK/YDWskk9eYOjN8pzMZO9E2VovcTsDvGUT9d1vTaRzVm/R6mcfe
         BBdy0F81pOI1BnN0yROmNYUK0pK6/tCMg0H7iCTAAKr5wy7/tLwRQFNYNuRf+0lCp8W5
         ZEqb49wE4+Nv3eBzx5FPV1TKrJmOEh697GTz4Vcr+GzfcwB6vWtAL/K5eLxI3UQ70TzJ
         qbMrqJjCnkVaEfmNGfAEMvrI0YyD6g3LyCmalDnDCaWdDXvh/QLnvLSkPGjaSgS3G6PB
         tX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777837808; x=1778442608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uthZmONBUuk+WMGtj597kAOFGLE8xMCSEXcpDcg2u6c=;
        b=hJnMIuL82HIBDTcjRCSplO+3ZO92OkoauMiA0PGksKwRbVyJPP4QRng/6rIvYo6VoX
         3zGaW4W21PlSr9dcyz3Frfw/AE4oFM+5qw2cpsziV+t4VgigUNPHDu1uViru5iDO2bV/
         +TRhi50tRmiHy8Yo0Mfls75N3WwXheMuTIlIR9VwzP58DGBZdRMYo20+6d3lJfbGHmTW
         aBXCHIawaztIj1R6CKQiFaILeEG9m6bmWOoVH2wHQo45yTU7Yr0/oTSPS32lTAkCfL4W
         6Sr35fLvaNaCtzkXIPJCK2ipzSv/WNcnxZMCGCs69ao6Efrl0W8Sm8Sezdh/J38GRwx7
         kUZA==
X-Forwarded-Encrypted: i=1; AFNElJ+18EsuJrlsl3CLjCO05sGzImv0TCWMi7aJ6jgjCP1kxtCk412x3ZpVSbRvA6Rb9uYIXovJ3eLTk2CLCjRQiBc6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu4li5B+oZnFIAt0m/AMmMgSYb4dhaB+mdVrNaQcewqDqylgdR
	YD1etKLaH38cbzJX67wYWKS7axBW8S4tAq66Tv0ZomhQwGvQDo5QRI6L
X-Gm-Gg: AeBDietSuLpGwFqURb7l4qaL3uUL6yXUl4x/yGCuuHBoXsNQ9lDTe23pnLZf2DnmCGm
	lWcJ4cggqgCxPzQZlFRCokS7wmVQv/ZRyohchYJdNm9r4WaFkwPocAkzS7PEOLSEh6LZqgSEvqM
	HUE/bEUTgvum3D+uyE+/X8KeFP0shHRYvneRmrJSAL/Q+NZVd82jVShh4SmneP3IuzKnTP0Dw52
	QJtqMCX1ah3/ftEeyG7YnjtXLULj7G/4IiS8NYkbD3MPaw2CXPEjlmTIxySEyk/iXWTdfxuPgx+
	scPZXxfYN0TdFiYAxJqfONSvIYtpdb8j4rJUN4+rFf4QhyVzjAAq9aeMluYOtAq/MCJAqS3kZA0
	MgI5zCcTbvCh6ftZyRPMOfzlewdSZL2+HumaKF7wLy/eOoSyjZH7dV5QHMdNAq+EiawDBmBciKJ
	IVwMLsc9abEOmqaj8v3jxnbfJY1DVw6g8AQWs0BIZG23F2xrrcYnQRj7sID4g4KjdovwfaLc3ok
	5jTtbJLpj0=
X-Received: by 2002:a17:903:944:b0:2b7:9d86:ad3c with SMTP id d9443c01a7336-2b9f25e222amr62851315ad.23.1777837808409;
        Sun, 03 May 2026 12:50:08 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0d97esm80224185ad.48.2026.05.03.12.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:50:07 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
Date: Mon,  4 May 2026 01:19:21 +0530
Message-Id: <20260503194921.3449864-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
References: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_125010_311987_6CB4FC4E 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Greg,

Any update on this? It has Frank's Reviewed-by but I don't see
it queued in tty-next or tty-testing yet.

Thanks,
Shital

