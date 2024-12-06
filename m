Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD39DE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7OGBrM+Ds5/EU59L+lS8dg3ydHTx6BnOQHdjJwv4g8=; b=xbqLoEBwh4mka+tx9xTXQ66lej
	PBgpiHffTmUyL5lv4JAaEj1EjJ4Zd9VEYBvz9h8F1xheYb1uDXlSjpNJkNnajS8CNwKkJGHIOW0bB
	4s01Fwy2guHhg02Wd3dTgrpprV/KmSGkzvCj2DjZiO9Jt8RvPmsaCfEZvLTFSzvNSnfgWgL9fvCfA
	YH3womkeI47bPFQQ/n9MGWZTIvr3HZQsxW86U/7M/uPE4GuPrI0b8bylrrk0G5H0ja8LxHyyk8uVF
	gAzIGNBdf1NlnBVC5rr1OVO9c5A0Dad9SsyrsPoHQg5gwljk0BZJopZiJ9w/A9xCrqzh4YzLhq3GO
	22BJyz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNQB-00000000EGI-3BJM;
	Fri, 06 Dec 2024 01:46:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNP9-00000000DvS-31yw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:45:16 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee88b57ac0so1284155a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 17:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733449515; x=1734054315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7OGBrM+Ds5/EU59L+lS8dg3ydHTx6BnOQHdjJwv4g8=;
        b=NAkiAddJHy/VGfThXrGt3260L+ZBJOPRHg/WPguWmJVr0BKEGT22G+uylKk3VtX03P
         HKJ8NR871tktgcUFzg6+wE/iAD86cSDiGfcySj2fzAQaoiFkA3F4flccg/MEH/JluJ7h
         t9iHBlzeTTzi9mtqAug5bp0r0fogm0+SQ2rxjqB4vGEVwNpK8KR1kkOydV83gQ4H8Of7
         Ne8Sy04GxV0EYxUhbnecXoAOxRglJYXMSmDxaK3uzK2Ue72zjeXWDs3UfZLAYYIdzKjm
         4XBHk2xodGnWn37OYM53A50xCqmfVpbNquDWvAB4K/Q19dqJYTdVZr8B0R/JQi2fKtkH
         zUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733449515; x=1734054315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7OGBrM+Ds5/EU59L+lS8dg3ydHTx6BnOQHdjJwv4g8=;
        b=Wi+/SnL0S0M9wp7rKCG+yUHUsEQcQgzQ+y+ipvaRoFL4clwuB1o4WxWQTDaGdk4CNs
         9PPpWQ27e6ODjN4Hqog6VRavIrUuQO8ykZScmoegBugtE8Altu9aG8zsvI9uGfhCwHKA
         vL4S+Hmy2DWhh32YsZglY2ibPmvwpGsIr7V8rRlKvCihXPXBkEtM2CyN/dTPISeCLnxH
         J7ptyENyNCLRYp365jAA9uUq3AsL5BrmF900iy9StaSaY7OM67PbEPosz4eJ3U4R/Fx/
         vWUnnE8Wa3rJwb6P6qh4uqqG8DCo5eA+OUd59qu7l/XdCRjka06hDR8UDhXMuyKGlu6J
         hn5w==
X-Forwarded-Encrypted: i=1; AJvYcCUvE3+tbXRk05Rcbn46ZR5DX26q2PR9Lh0Jw9dhoU+djCgg0miUV0LaaDbObdH4dZO6B1dfjmCMiB22BCvqJjXz@lists.infradead.org
X-Gm-Message-State: AOJu0YxUH+YltI0WIeavJ3tI7RX0EGlvKuoPDYw5ha+a1OvEDn3iRyGL
	tcFscvgpT4HohSqtXwiJ7ITb6zJyRbvRLm4thsSNlzalpbMsjJFd
X-Gm-Gg: ASbGnctinnG8o5DKgvgSu97nbWVhuKzWFAbf0AwqPnxG9k4jHO8Rqp3htKmmfNt5Sv+
	/Qc/UdQtUc+ahaQGYA/dc2c0WoIO7WwreKsg/NFg6HjOaVxdgFKMLbKLc3kIwphZ18diBoe1CB8
	vHtUq8Scey1uPpBP/GLCsyZ3B6KPbrgR0ffYX6+Ouj5tFMuy8TChgxRowraNW88IgKBRMyD+n7w
	mlRWPiiOS/pcXZlE8YurBI465w/C2MsXWX0fT9VaoV5kFk=
X-Google-Smtp-Source: AGHT+IHFjL05H9QqEdxBhvGferOk0PgAeiYGY9/70kKdEA1TFewoP80NXEZbHvZ4XqWoW1SHDKN0wQ==
X-Received: by 2002:a17:90b:3f44:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2ef68d99261mr2300618a91.5.1733449514616;
        Thu, 05 Dec 2024 17:45:14 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2708becesm3962772a91.52.2024.12.05.17.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 17:45:14 -0800 (PST)
Date: Fri, 6 Dec 2024 09:45:02 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unaligned DMA unmap for
 non-paged SKB data
Message-ID: <20241206094502.000062e8@gmail.com>
In-Reply-To: <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
References: <20241205091830.3719609-1-0x1207@gmail.com>
	<Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_174515_764126_7DD52E1A 
X-CRM114-Status: GOOD (  12.09  )
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

Hi Russell,

On Thu, 5 Dec 2024 16:43:22 +0000, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> I'm slightly disappointed to have my patch turned into a commit under
> someone else's authorship before I've had a chance to do that myself.
> Next time I won't send a patch out until I've done that.
> 
I am really sorry for this, I should have requested your permission first.

> 
> Please use rmk+kernel@armlinux.org.uk there.
> 
So another iteration is required here.
Would you mind me send the v2 of this fix?
I will not send v2 without your permission.

Thanks.

