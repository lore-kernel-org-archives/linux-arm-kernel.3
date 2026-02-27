Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2664CFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=; b=CvorYF51nq3JbSTK+qpHPOv7cI
	5SmrKj2zj9aoCkbx14qyTomy6IFZ0X1m6ACWLsROdXfvvO+/kk2HW0JYJ2pXpOPXwHcFRt9WW9fFI
	b2xbFpiSzz8kSW96fUbogAUJ1HLOIob1wQgXfRJW5TrC/6G3KdM1zXLzKGZjhOPVwoFcLPjlOSrBj
	c6PgMSPm70214asPeSSRWsW+SDI1wyhHb4M8HGvEWcZQ0qOgTRfA1T2GyR1Iq5cUzmNNvjAKgUaS0
	3PW8UuFMqNMfO+ATEnzvueRL/zWGbRJdJqT/cC1JJpKmFu7XGMbsE1AGtCFXWPf15YcoGteh2H9OY
	ytMRiuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzuW-00000008fIX-2ur6;
	Fri, 27 Feb 2026 15:37:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzuU-00000008fHP-23tK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:37:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4806b88d8c9so3066535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206664; x=1772811464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=;
        b=aNCsWxdzdO5q8ORiz0xkR+EuUul622UPxqyvGCb5RkB8N1X6E+f7sXLYzbf1Fo5mY6
         HOclbfNFBp/eiFWjUUP0BejxtxYtWUkykCyQGqLQE7YuAaDHoY0gs4fsJkue86YVDXhP
         54ZuMZbNI+068xQONzcXFk+YKPReQlAajn7ciYTl1n9NKXALZq5z3s6XBZzSNqVxL733
         EyD4JWIu3hwHRbfuTwqzORyrwe9gPxzxQYZoBVIty0CLfLPOxeAGXO3qNjHoVUy659/p
         kkudnrzV78LCnlj7CYt+p5KsvTuB8/ZwqMQtGwQ9n9UGak+h86VNu9XkMFSS+KtcoPNE
         AE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206665; x=1772811465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmXbxBtIqJncar8DB1sW/Qw37OMyoAkSD4eIty5kISQ=;
        b=aZ8WD3l21wYk3tgUJ4tabKetahWshh0kvsmfU1846MoZcXzy+QUjjbXBOptQ5Ea5UT
         SY7EyMSLFjq2JwAczrEbc2cXCEjEJ3MJmoaz92diboTyNofbbuetHkjVkK6GQeZIjCeW
         aoe1Ek0A8LXx0xbJp/rkM/0dmk+ttUgPQTHEXYUKBCZ3BBXOVPC+17CMb4UgHy6YmHI3
         t4RlWxeZQVFW1yVIKcrOJYt3cFOoVZoi9t06QFwIsWhQ4jsRVdAKDvlbgyMaYP89XqLb
         +us9OZVsOd+sin0BjS5BxcLmNo0H/qZlU+TY+74mLLy29ydCkbGxClR/vvhTnp7jbGhS
         5jqg==
X-Forwarded-Encrypted: i=1; AJvYcCWfe57JBZLk6uFFS8kLFsH82ZqwuAK1WcqPA4F46TnxaGj3spTNf9hdwPA3rK6xKHBwn6eh7TVwTmXbCxeJdsRv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdx1+Q8bi/7VlehR8Gnkvrh4dsN+J1e87qW1f4kIjJrk122Q0r
	3xQPknz2aKOe201HE21M/coAEsb+HOi16pkMiwjl16/Es99Nsb0wgFqt
X-Gm-Gg: ATEYQzwF7IdZxZs0f57iz7ccUBi0i/YlOlzMoyyy8M3WrwSpJvYF3A07bOirh9DlGSS
	M6Dcne0PB9nT5VPOuSf3xxiOryd3ztuFw0O+lR/qrC6WE8HmkFbueBuzUhKJ9LqkguPxcrvh84r
	79+BfiqOHYs/YoUMULC0z6N/9ptSXl8UnUKG3IkdGWPSBdECeXLIyALBe3755Tubhfp1s0iqqVJ
	QYl8+xAyPZzw295vpww3VVTIznbUduSlCOHREJQtBaxj5UM2sidmVFd4Hlk5i/b7yG1N7rYrtgm
	6uwmRBc7zHhU+awex/7avuzJ2LK5dYbO2oJqmCDNKNfJpuXgU1zddnknz5u3lhTefQb59omaNU/
	fk9p1ftZEKnjxE3U39TSsmYZpcPP/aNV+kD5NN87N6oqPYjHnDNCY5HNM+DhkZ3Iw5XcfEdZR99
	38m02XoTUUaMZm7A==
X-Received: by 2002:a05:600c:444f:b0:477:a6f1:499d with SMTP id 5b1f17b1804b1-483c9c1bbdcmr28085255e9.3.1772206664464;
        Fri, 27 Feb 2026 07:37:44 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776a3sm84332245e9.7.2026.02.27.07.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:37:43 -0800 (PST)
Date: Fri, 27 Feb 2026 17:37:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth: relax order of
 .power_on() vs .set_mode*()
Message-ID: <20260227153741.e462gzmv7t62r5uo@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUS-0000000AuPh-3Il7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUS-0000000AuPh-3Il7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_073746_541206_A887F244 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, Feb 26, 2026 at 11:09:52PM +0000, Russell King (Oracle) wrote:
> Allow any order of the .power_on() and .set_mode*() methods as per the
> recent discussion. This means phy_power_on() with this SerDes will now
> restore the previous setup without requiring a subsequent
> phy_set_mode*() call.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

