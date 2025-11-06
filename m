Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90855CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hr0Vse2Y5fi04cdwwrJDnW3ctvlVERZyfsaruZe18ZU=; b=FBIJ/QNCoi7n2zf8bc0Ovr5aEZ
	9nfqQ+kOgn9rjwycwbvq7kdcS8uQB2tHIovvDAg5Smwpp4wnC286MxuISvOK8EEO1RwLv5owDGSaK
	cEoloTnHdkPp9cC6aUjjFwteTe+4E+siSus7qF8U/jd4wZqzBqwZPT0x5jXUQqiX/ItdpL66qh1n1
	nEstDKuTJaAFIFwVC9I/pMoq++Qxm8h2tEhlMz+CZKdRa3zgczaVrOhurJYwRAM3SkSjwpf1k/5E9
	fE5NbdKu6Gkj1T5Pe6WtX7J2vlGHRrWq0Ym/aCUIE5g/jLQUod6snmE5ewWqZh/tnzZLOdbnT6mN9
	SgsScy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpc8-0000000Ekt3-1VMS;
	Thu, 06 Nov 2025 02:20:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpc4-0000000EkrS-2336
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:20:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7810289cd4bso469458b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762395636; x=1763000436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr0Vse2Y5fi04cdwwrJDnW3ctvlVERZyfsaruZe18ZU=;
        b=fKlYgl2LYy3FWTtQ9O5vIUvKnV74x560vRTPDmzC6xXyYOYA0mMDDQ+DKEJboKKYSj
         6ehdAVbe6gdRDhxdDPr0Ojl/7H3f1IRHAivVBfnhDIpLx7H8EvW2d5ruTMZddyOr08RI
         /IARPVayDdqzJz6yMxnomwe2PJ8CzzXwzA3DxIkxifunTDd9UAC7f1TaqtTyYTKKau2Y
         HCdt0y62OaIe5/vG47iuZtKnN/HKqfXd9g221sBsR3SFWbWIt+uOR9PUc0zbmDDjIZUm
         03kQvqanTzaULazZUYpcOviyVYl4PiKV3J0qYkNFwIt8o0Nx9O5kfIjltqNJvCMAb8Gq
         VyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395636; x=1763000436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr0Vse2Y5fi04cdwwrJDnW3ctvlVERZyfsaruZe18ZU=;
        b=NhxhnrHMrOK4or5onfKu50b1PoAcMPulI0S5JOHnbNdL4RRA5UXlg8OuAj5aBztGxv
         yuLEtiideVWAcV7grQi01zYpjo/iZTjmq4FLVjCHUAsKGOEsG7tKppRulaaBnVSDx2a4
         3RmU0xZCU7ruuR/OXOXjh9Bf87X06ZiUoxpQNMxVlry8W/MMdWi5eOzfIQRruXd4Ox7R
         MkDZj7ZRkaxK8ky9343RlH60Af8rX9t1kKPa718T3osoL3j1NJcWFyC1cA85aZk8X5Lh
         7BhHL7IlN7bITyrh8v43VSQmOQqr++PwVW7ARBTPZ5eBkQgELE8oL+MlMTk5kplQkSIL
         /Iww==
X-Forwarded-Encrypted: i=1; AJvYcCWo2DhVwYeVvsz9eNmmWSULDcqDTAj2/IRx+bJYT7wjebOLlHGNdRwqwY6v/7XmGUw2NSLU7ZrK/1YR6U6l7/r1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/HZ/59/g9NmKbJIidsFRGjLFVY/injA9jqwg4+m66WivDqiJt
	zi2W97stJHH7J7w0mIvWpvAoHdt3nHaPLYM+J6UiJPzQro/dGsD4MvYS
X-Gm-Gg: ASbGncs+HjFpZdj1vcjiyD8MCQcge/1VPexsiRN5hMBVO/vTG5klEhxH3JXd0kZLjPv
	yiflXne2eOSwwPiBCt9DuTXPCsrn4Idj6QSiu4xKWscfwrg/FYlF/cZrlIWt29Bjhqu2EtALbkj
	7Kjl19UWNRNufDIHs7gDNH5PExKuw8PGuUJtHGetpHTVFDrapE4jh5m7IMdaktmkTMztOylndMr
	qIjujJbhu1kizuufGtbDuLMDQIieGCzp7fDazFbsKUFCxSB9g1RoSVxdqaI2jwiEIvqnBvdruPQ
	FsqwlYsI4qLK6OeLwZsrjK4LrHj442d3JVtAUsV2FBFcrYMglE+qMx5nNs+uA6N7FjvAU3l8Uy7
	iOul8gSeX4+qgKAqhmvC2EAfr+ZgvCRxraNaUaNkIlZQxyQ8=
X-Google-Smtp-Source: AGHT+IEQBBkO+M7qfWlA674bZguEe4T/U7VSYvqSNvaqCY06piaQC5cOyLjhg4IkWXUoHoyzszlh0w==
X-Received: by 2002:a05:6a00:2e91:b0:78c:995b:4e9d with SMTP id d2e1a72fcca58-7ae1cc608a0mr7699152b3a.10.1762395635714;
        Wed, 05 Nov 2025 18:20:35 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd57f91sm830516b3a.23.2025.11.05.18.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:20:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE)
Subject: [PATCH dmaengine 2/2] dmaengine: st_fdma: add COMPILE_TEST support
Date: Wed,  5 Nov 2025 18:20:15 -0800
Message-ID: <20251106022015.84970-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106022015.84970-1-rosenp@gmail.com>
References: <20251106022015.84970-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182036_525936_88722ABA 
X-CRM114-Status: GOOD (  11.93  )
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

Add COMPILE_TEST as an option to allow test building the driver.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 1e7c8f031b19..243d3959ba79 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -590,7 +590,7 @@ config STE_DMA40
 
 config ST_FDMA
 	tristate "ST FDMA dmaengine support"
-	depends on ARCH_STI
+	depends on ARCH_STI || COMPILE_TEST
 	depends on REMOTEPROC
 	select ST_SLIM_REMOTEPROC
 	select DMA_ENGINE
-- 
2.51.2


