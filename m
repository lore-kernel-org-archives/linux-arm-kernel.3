Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23610E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KYkN53WI+JNUVPnu1L7iFZzO5YGuruzvwyya/+uFx4=; b=z53a321XNyJrPF+cnLDwcZm+Us
	OKohN9+/zl14LSA/uV8MkQSDcrMW/SHI981wYhIMYDBYpEFBLu1IryZ/euq4gZQs9E5SQDOrHSmcS
	R0f5685Aa+r1Z2doOTyb9f16eMo6hoysTh1z4/gLGWRcNmAIeO4SDiTJGYqNsaXINyZUKTnp9WMGD
	TLYQbPHeS7KnZsu14ipKf8A5ZLGR0DnjyZu3CkyXKqjuIOvHBOkhqsy6f7+Jt/FASKeA+llGDrNNO
	iP9kb91AKIeCXobaINL0SMGitJefsrAeKsE1WKRQcso14YYeVN97Z8GAfBpEJWdxNds0IkMBaihQp
	CQsXTRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSEzk-00000005BlW-3bi2;
	Mon, 30 Dec 2024 12:35:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSExg-00000005BQl-31W5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:33:33 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so14137662e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562011; x=1736166811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/KYkN53WI+JNUVPnu1L7iFZzO5YGuruzvwyya/+uFx4=;
        b=rtj6QRcEJJ+7Bl+rqMazt7qlm8G3Fw5Kio+xajrFouuz+e+pmomTBBMjUKK5lWaRsu
         Yh4qVC8o8ox5p+qwj/EB38NguKO02CMo4jArDfbYeVx8AKza3LNlU+yJ/x6uA28aj46r
         l3gCMiDH2E6YNJw//yE4D7RpIr96WuR1ta2xbsmUdB6ZQnOXT6FXfTjYFDY2vGlaVMev
         r+67jCNLvB9RNtqSgmDKp8GsPRrI5sYUh/q893Jx4KbWYTwVeXEUZZXxVUlQ2O+qrTqX
         6jY01KQyLHjg4agJ2/w7q+PJHbD85sHRJLgzagXxUJAHy2+R9mqB/Nvp2PF1cmZEKo49
         vvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562011; x=1736166811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KYkN53WI+JNUVPnu1L7iFZzO5YGuruzvwyya/+uFx4=;
        b=QWMKFhkj7xwiH07QA1JVVv1rVRsZfSi56WJPCFeCtHie8wz4aFC1LM+fFGLBWveWFV
         k56yKLNJT7+P2CoDw6hkeo3GUxYJn16yILlpzAyIR8fqjN0qUeRjffZx9KIKuDDk4UXQ
         6j/dWGyHckPDtoBE8b700aqjozLPzCfHLceWDPsQOAmpJpQm7iT0Z/aSg13QxF7Mpg5H
         HGhBDy5qoCHqVBXEEhouo+RlCSYr6iIOVMDU0WtGur7zvy4S/yUxY2Sm7Gbh7WrgQql1
         LM1EL81kX5MMVXa+hb/CQjagQ3K5XUZPzKuIWlMYEK6O2ZD/nd0UbLqEX2cTj19FHr/Y
         +Mqw==
X-Forwarded-Encrypted: i=1; AJvYcCV93I7HvxECKrDiBuWv6CGaZNDppzGVU9w1m6wbt1cT27jWNgmzN3moxdEVRaX+iQPHfzzllEDEG4q5JztZrrz0@lists.infradead.org
X-Gm-Message-State: AOJu0YxHSZGmH8RBnJqDhAHez9bZlS6FdLbzCIDGYDPaKOWNJNgQCGRh
	GYGO62szk8NUZL7hDkAmt+ZsTunlyGDBGbYQJIZw8aBYmgaUdR5mVCZU2cFoQyo=
X-Gm-Gg: ASbGncvvYtgSXm8o1RE0PO+VP7ayHE6o+8K/rrXpIAKh4E0wTmu7HgaB8ghPx8N2QBA
	RH1PQI3eEKtWgklR4XLNGi09756VFeJbug4OHslEDvPdWaR0UY5zGIAapbV3a4XjR++5C2udKou
	AhtMq84Mq+BHsBdON6kQq1f+PiHtZOYitftMv9eRToXzlgA6imtTb5Dj993ybce9ddDKxC37BWu
	H+PbBgsT/jymBaqxNSDyvuONrGhep5AyzOiL3zn5HAR/xEz89OGR+wJCAwmxd8SS8A5zuKu0vh8
	T1O4lgdXUQiJpV0w/34+r5xZRQ4jHP13YVgY
X-Google-Smtp-Source: AGHT+IFuphrsUAmtBsapn4MuuZ4zkhPDCYfwZQ1OQx+nK20jXRfJS5fbhwKtwh7lTAQAKIeTPggikA==
X-Received: by 2002:a05:6512:334f:b0:542:2990:722e with SMTP id 2adb3069b0e04-54229907232mr9337220e87.15.1735562010862;
        Mon, 30 Dec 2024 04:33:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5423d3b5697sm1688236e87.133.2024.12.30.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:33:29 -0800 (PST)
Date: Mon, 30 Dec 2024 14:33:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 05/17] phy: phy-rockchip-samsung-hdptx: Supplement
 some register names with their full version
Message-ID: <nr7ilsmyu5kubahmq5pjscgpf5wrnzn456zoohatpftr2zjpfv@fl2mx4y3cel5>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-6-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-6-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_043332_763497_1321ABF1 
X-CRM114-Status: GOOD (  11.99  )
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

On Thu, Dec 26, 2024 at 02:33:01PM +0800, Damon Ding wrote:
> Complete the register names of CMN_REG(0081) and CMN_REG(0087) to their
> full version, and it can help to better match the datasheet.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

