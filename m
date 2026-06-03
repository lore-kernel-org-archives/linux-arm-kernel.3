Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7685ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=; b=xyjGaTw11Xn1oJiu2UuJrcB8kC
	esDt+z9IlmylBC8Q4mtBXEFXyWnDeLoZEYGtl3qh4aQbqxJbtyjtVzO7w5tkGL4ZwPInI3YRn1fRm
	CNcbgMOtTHUT0KgLH3f7hXwJxb5PaIdZmxcHkkVkIoius15ermmgv+5AiJXEg4rAiEzk7kFs1afWr
	Dw6FGWx3+/0E48flMVtTGnCZu0pgxanwuVDEzvNTTabPdaiqtTutOT2vooMPjOFHm4Bf0blaqIArZ
	QMIj40yVuIvxYsUZh4VWAZPjEzTL2oQt//Fjfje1OqvP03+8ISF0Z3iW63SLenMypp5GK2HqomjnT
	uYVcj1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbki-0000000E8SV-1OoH;
	Wed, 03 Jun 2026 02:54:44 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbkg-0000000E8Rv-1tze
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:54:43 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aa7a7c9711so252228e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780455280; cv=none;
        d=google.com; s=arc-20240605;
        b=JKqSGikWwajFarE+p3+Oh7KtAH0GwKnqnIelNp0t+oxMp2oNJ8VxHqIq+96qrg1Wmt
         Yp5oyKH5Hbh2HKPajFQCKV9lrsVzzoYKKgON2klm4//8XBlbboTm21ceC9lfui5sz8da
         FZnLqPyVeOc+a8GsYe4YhTdDgOwqGwSN9k251yOtULDefNrMhoD9qAdODs8zJtqueqbt
         qyV/6uXZiAftL0UKKziG1I3IrdaqNJHaloX8fpZutzqUzu9IwvzUCdXQQi7pjsDi5DjH
         xUO/z0JAkTMsPyiuVhfFg3pwVc2scAiSezT1JS+lAd1Vdgrn0SqkPBPtpxLPh08WrH0I
         W70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=;
        fh=kYFfu8Qkub7fTjuxqs6SrEo0vbe5D0X0YDKSbtlw9+E=;
        b=JTUvAsZummzrGnb9clXXhjBXqbzEGDzcegeXGZY1L3F90vcP4UpuvexMUyfrwPZBMc
         9P+c0pQA0zx57EOR5M+eFRBzfudIcZkJDk7uB6kJasp7TXIoSsZhPi4+LAPz6axeN7ti
         mMyZ4CoxRJFhniX65TWaaaQvRNy2t72reqW+i0xHAPz5GDnYZXnZkhL25fAmDuIEYsVJ
         wzO3xz/BtRPdxPDJ160oLg37ZHcfaGlvLRFDdPDqc7SAOF6fM1ZC4Vx6VYIuwUO4NWSF
         AzT7FOBoe/l02JVOYe7kVv3/8+PTAkm4I42dTWDyqeRjzgqdsRdwsjIr4DGXKQ8GtN/6
         OvlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455280; x=1781060080; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=;
        b=iVZOV49Fw3fKMbh082jeTDvUT4/+6hE90hBANDy74WJYJeBbRW9rpW+kr3ZrxDFFTw
         L3FOa/w7c5Sgn5Y+5ox+5W1x/FLePNdYFpC1uypyT1kta2E0ZfGlXgCi5oXdPvnspOAy
         V3+S08Tpi+ZC3mO5htgeE5ojl3zLkAdAAWqgKf1T8uUhDtdmyIgowUQo2OZyD2xD3BM8
         npPcfw//adhYXl1eGDQIzNpsMRtFL42I7fMycOym6YcTGiYCSp2nhavfUH+WbEhSbnlL
         Brtb63T/uWLLEv2BBxYWqXn1+DINsrLT0zJ83PQL1Qi+7TdMKyvXijmsttPZWFWkLWU8
         oJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455280; x=1781060080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YEVSweRiJIFFM92G7CI5lIVwON7XPQd0EAv/NVq7jo=;
        b=i5CA+AcEZ4x0CtO9iReiBuDA8VBGSkwHseUtTPrPqx2YGcWPfSXHMHDQt4EymNx50p
         SsLHoIMkCvyWjpgcMGroIkytsNWKxbcm0rsnnGsxV6+XhNGN8LFknG9nQg+Y2MmDqwL2
         gtA2nFidd4uGVTPAgSemXvib/EdWVzdli9YvYHCdQmrDG3f+D/nvAZL8mkOCh+k1VwCY
         Cy0eH/UpYZqdzG7g2Wjf7u5EiDOEJm3ZoiScaD+0rgR5sUKHYFeAlEwcijuLhauCsbip
         c15iIewNKLqRjV3+V8iaXSfDoSSwmdkrkNoGHLI6iAMdFNP/mIbTrtrAj2xRNakcb8K+
         Vvng==
X-Gm-Message-State: AOJu0Yx4BHUxzustIWFKS+VaZ/EVMEgzmRq5vmBaS1bpk+bKEGSv76ab
	c9RYruP8/q8aJY5BWJftIwbNO5lirU2ZzZMmqa46g3z5XrshBF5oJ5v2c0cef1cHy93Jx9GYvmN
	BlKkq4mNRTfqki0lLhxe3Ti57UbZYnXA=
X-Gm-Gg: Acq92OGZ92LfZpQ+2lgcg+ncQGodq7EM//NFpV2zWOXqYwKervmj2TuCyf9yq3Nnyv8
	EhVfeLKt3ISH/13rgGi2cXpGfPvNd5d1gv4XVhexAqABaxnX48jMKfFaD9sJGGwQbq84gqGWle8
	+ehXkNsVJMG4nues9AWeabUG5+dg8Q7ZS80CVqT3V/A8SGkFCRpBDoCOE7gsNTbLft4fOBbL8pD
	McjZ9HYRP1/nTJIRjYJvcEbaDadx4/k7aAxYfTXtwza3JJYdjpiEHCF0e7nOf8gEFEzNk+jX0vy
	qLDh0NPC1qcRIyYhwnjtrkC1zqY=
X-Received: by 2002:a05:6512:3b8b:b0:5aa:6ec6:257f with SMTP id
 2adb3069b0e04-5aa7c75f6f5mr249329e87.10.1780455279974; Tue, 02 Jun 2026
 19:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260513205720.638900-1-dbgh9129@gmail.com>
In-Reply-To: <20260513205720.638900-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Tue, 2 Jun 2026 22:54:26 -0400
X-Gm-Features: AVHnY4K5DBF0weFjnJmuCniRxbOFWsLayi0NoEqhh__lipvmCqWEylpszpHtTeE
Message-ID: <CACrCO_WA27igaDzS5N_Vi3oxjSe3dvv8iLG3OLS_ZJ+NxTw4YQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: devtree: Fix /cpus node reference leak
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195442_494139_857E25D3 
X-CRM114-Status: UNSURE (   9.39  )
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

Hi,

Just a gentle reminder regarding this patch.

I would appreciate any feedback when you have a chance to review it.

Thanks for your time.

Best regards,
Yuho Choi

