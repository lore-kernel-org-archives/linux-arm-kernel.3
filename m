Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B2BF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xldhKdSLExnwUIprLhiJ31YKhBCjitGVus1su/uXCG0=; b=rcpSmttp6ODVUNeGW6s7Q9hYaM
	ZKlSqPaqTWx2Ep8nYexpkqCKjUVAmbCacZBjPbg1iv/L+sfUU9V+hnWyTw7F8SHjCX+KpzeKG8Z+M
	T4T9IaX3y26NZZsya6MBz4FxrFdjnxXdQ8O/I3GO+s3juT8sitlutIPBnX5PTMoWvtXVc0uNC4O8/
	jTQmeq8qhSNrYTNuWTiE8vhJYF/oGk8F1ZX7fVSURZ9RukB5T39jK3e7KyTh8W0YS7JOt4YlPXOxr
	AdwXi3lSXH+2ObktHTbUf7QSPekDXbQv7CWe07HezDlQXjuGze7DAjCPrXkWbbZIuUY0PGpkGr/u1
	fPwfK7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf9-00000002ocY-2yQJ;
	Fri, 06 Mar 2026 01:07:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf5-00000002oaW-0AQL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:07:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ae41544dcfso63327565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772759246; x=1773364046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xldhKdSLExnwUIprLhiJ31YKhBCjitGVus1su/uXCG0=;
        b=ZjDRh0AcgOgTj3ACN4olF5DGhRkRS9OHm1oIsGKLO0bAOQCtfU8UFIRq79A2TyvluZ
         rYFJg8paJ1JA/aqOurF86HlCXbxaahEpv0ePG/lqVVo+fCq9RQiSmw6/Kj1JPp0K9//h
         INjXh0hCYisoJPZTB/Lk+QGvYJKSvHokABDgvhZcezToan4HoVuvPugDhKTmHQtYEyD6
         4UYBszsdQGd0KqVOsJlN5tPIJUR+Fs40Mj9fJhADQ9V0DbAxhU+l1SFbfIcE1eLHaJ1b
         Gw5AHLXrfzzw+vGlQldVaZtpZQNexABtBfItqblkcSZSzfvuS/QQtm94EqVu6qp1puN4
         tPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772759246; x=1773364046;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xldhKdSLExnwUIprLhiJ31YKhBCjitGVus1su/uXCG0=;
        b=ufUkEnfR7tmlE43+rN1I8ME3+clo1yhkuMNanWyhNpbmPDv1WAbRRxWzqLn85MthdC
         nz/1x0kuUc1wFMVltcMW8XRHpjF8HU34L2UXE/gFm5Td19DajUGnzqZBUToK6F4GTnRu
         Q5sZJ6P/rsmZToLScEOKwk2yeNsJbz/5kv3qJ2oAJ5FxfaZIcPm/klZGAZqLBB2N24mi
         VdoxKxrlJ+f/M3E411CCkAbeVfUl4j3qnBhJlZEXPs2Du6WcSWb1ZR1M6M6mnjK41DLO
         4sqSZrVIbx7nQ+b+L+QUPYlfNBofaAdZTAfD8kc1Txk1BX+I0omnvEidgnyIvw5e3dZe
         T8wA==
X-Forwarded-Encrypted: i=1; AJvYcCUm3yaFMKreQVQNla0Spcl5gBB66jhWaAWoEdM5/QIZmNYS5d3p73p5jqtkQH/8VCxZZ0V3WwUOs3jJYai3NcRc@lists.infradead.org
X-Gm-Message-State: AOJu0YxIaVjxeJiyK99hO/IUDbcH1BdyGqRKssj4DaP64PEiipmTr9RU
	2mUqYAjnAtVKw5pNcqi963AEPLxq9cCk/mXPsDWsZwZxsmJ+latNN43KbD4cfM3Zu/k=
X-Gm-Gg: ATEYQzxsn4hYOsCNPadx0EoouHoZQwwr2ilwQUbU+b2gJnztrQyTuFvFIyhPJvl/2ih
	XvMynHyI5S3wfiBtIKwKcqtv+rOjcCC9J5P6rncxsITRPT0rEJdM2T5YEwYHMthUgbcbwrqpPCb
	qhQ01Sh7UCy1CXdniD3k0QVF5iY54cDG0pPmvD22F9olwaJzx3T5iUbO5iAiLH4LYp8CDzykbMz
	Zj07VRrzapdBjrwXuVwuY/BekaCmjmQ0/WKnvEkkO/kG2Ld7i79v7CFlcv2BCeA3/AmLauSdzdy
	orY/sLnj9K2FhUUFOOiCRWOPnQyzeW37KGXICFcO54omAUcGoV7SU0g6zAKwJQ4xpBzXK88Wuvv
	gi0FcaZG1MG/35eofKp7cF6zHf7nNIjzoBDBc1RPgrU80ZpS0BI40gvfNaqkHURWG+JbYYHrr4m
	G7T6nqZHM+z7pHcHCozTT1
X-Received: by 2002:a17:903:19e5:b0:2ae:61bb:425c with SMTP id d9443c01a7336-2ae8242cfa9mr4937905ad.35.1772759246050;
        Thu, 05 Mar 2026 17:07:26 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45e07626sm172536085ad.39.2026.03.05.17.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 17:07:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260224144552.585272-1-thorsten.blum@linux.dev>
References: <20260224144552.585272-1-thorsten.blum@linux.dev>
Subject: Re: [PATCH RESEND] ARM: omap2: Replace scnprintf with strscpy in
 omap3_cpuinfo
Message-Id: <177275924495.1445909.15705115426095519350.b4-ty@baylibre.com>
Date: Thu, 05 Mar 2026 17:07:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_170727_083563_6B082723 
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


On Tue, 24 Feb 2026 15:45:51 +0100, Thorsten Blum wrote:
> Replace scnprintf("%s", ...) with the faster and more direct strscpy().
> 
> 

Applied, thanks!

[1/1] ARM: omap2: Replace scnprintf with strscpy in omap3_cpuinfo
      commit: 5156a8d92cebb531c320c7cec7e527e40232b922

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


