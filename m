Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308DBE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=; b=cmPeBTZAiBLPDWSe7GL7dgoW8E
	C73O0Vt/W+ZvVxStQF4w61J+ltEqFE54GZnNGdimsM+ToIuU2I4wZlejcAKR7zCVuCcpkJBpCeNdb
	HkN4AHL8COEEZ1X8fT9TIEA8hqQOPQe8AMZD18OF4NIRvqKTqTHJajgWL/Ef5ps03mv3cGaBCyT0T
	Lx3KZUwb8SbCEYVpq1JSuWTYCDXES8E2pOQk1f3vr9CBZLGx6b78qVC/Sawzdtrxm3m7UNDQY8Jpv
	t8dwmqiKuSLBQeplzsK3qIlzvj+OSaF9cCXhXghPsdpsvSTKLiuiaag/Z08o2WAozg1v/Br0uE4bn
	x0AQ7vZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKx5-0000000HXPO-1Er1;
	Thu, 05 Dec 2024 23:08:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKw3-0000000HXFR-0Gbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 23:07:04 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so1252596a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 15:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733440021; x=1734044821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=;
        b=0NMXEBUo59mbBa0JvddDduQk75223ddUPk79KwCucbPf51WfjHKthQJxY9+6qY6GhT
         Ngc7fRWQ/D+frDH3RpItP3XJXKbM4jTAnnllfrhMJDlDB9U4yrZdYgtJG+k9gomEBDtJ
         eRTcci3FIVMPaPDcKy3Orr1nNHtReWluYBmzqLsCZPTpo86he5YehfJoh2CJ0241GP+G
         Ax3Si26xcOy30tinvyXowZVJVT8c6aGg5jFgCXmoLZQzOMbKW6fdzrXpWO3cmc05n3Vw
         sH8yontQI6OaTlV8Jmii0Y6eNoj1fayhTAyhWPdceJVekOMjSl+BtAP0P4VSS9LL7zfU
         yj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440021; x=1734044821;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cfmId59vxiNvq6eQ30QkQNn6nuXdIqcNwMG9TRCwVI=;
        b=FjWDmSwJ6kfBzDxJ1s5kUAZAYq2z+BoDVucfL0w1E8/a41mv4e+KFmhU4qpZjIjPSN
         l9dmnWm/7U3yKGziN6ITSLwKHVOtMZTazal65c8Sl2GwZsu8EYVg48VumqGNKq2JhF8P
         gUEiGa6nauTXNloHfA5Po/zPiRimcp96CTnnaIYQCZSgM4JJItY84TRdv5gWjgfGkb6/
         oWbWPXY2fWjvDgwvopkJwYrNtu7W2ZX9hXqMYQxEMF4IwbzIwXtqQT/viQtefN3nkHcj
         5r5Jy84sfzGdUp3s21Dvzkp/UFGTnkrlpUK8cBe/RFLiWK81q3irI5w8Y0EGmRiqGnQN
         6j6w==
X-Forwarded-Encrypted: i=1; AJvYcCWw26+lJP8LSxFzKbOntXDlJfWtMWls0s3qoQM4C8//129mZfe+ew0K/9qLLnaFP4BguHn377eyzNoWpCC/4b4e@lists.infradead.org
X-Gm-Message-State: AOJu0YwIP+j1W/gRZ1y3hWfESEGAXl0gGnsMKh0QiRRaJP2eo74ftrcg
	l/W1plCyvJQe7XtEzw1gej5KV11BWFCOLIetUKVD3SgY4dzxlfTvKSBSzuuG5tn/mEy8v6Bu1QX
	/w1E=
X-Gm-Gg: ASbGncuKZQqhQafAYYtI688mralwppfMCZWXv0zDOllZxZLlLS1/i/vZipmpcaHylG6
	eJeOVGMTYrorzihi5rTbPS6RwAHyVXg7sCHCRMqgifWfSYqfLe/aSPwt8aQlJuzl8uvcSEXE610
	NZDLbf9KoECGZqe2O0niN7egh/OPAmHoRLZb5HKAZOr6LKRS96FXVV/SupilYmAv8BGJsyT5hkk
	DILCxKp0SAEWGKdDdw4Uz7IKvrh3oQoixBmthtLM/byIbQj
X-Google-Smtp-Source: AGHT+IF0lJnHZZwx5qW89pY3JM7PmU56DWfppWtG1IiiileeHZLO1SZtL+I4lEvD0dwQNQWcZ0pTbg==
X-Received: by 2002:a17:90b:520e:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2ef6a6c112cmr1324606a91.20.1733440021483;
        Thu, 05 Dec 2024 15:07:01 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f7d804sm1938792a91.1.2024.12.05.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:07:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
In-Reply-To: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
References: <ec20fd5c347bf74963532e95282f850d209d84d5.1730539664.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ARM: OMAP2+: Fix a typo
Message-Id: <173344002056.407600.10771943462992727832.b4-ty@baylibre.com>
Date: Thu, 05 Dec 2024 15:07:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_150703_109000_342DCCA9 
X-CRM114-Status: UNSURE (   7.02  )
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


On Sat, 02 Nov 2024 10:27:51 +0100, Christophe JAILLET wrote:
> A 'a' is missing in "powerdomin".
> Add it.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: Fix a typo
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


