Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907FAD778BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=; b=A+P6YOeT8haGw3ET3pNaVI0/Vk
	RnExBAuFSwIYXvj/rQ0hXIBou9ZtG73aW9f4gtJ2iNw4K6NRJHvfl5AztfNN6Uj8sWWRvMQz1okZJ
	vvli0bMh08OD+4KBGPnV71UN1SO/q5ScIBieU5XB3iqahMzm781yk58H/uqLE1w0S/cejo671o6ZA
	RrjB87E6C5/vD1ut3JwXbPDHs40L41nIqh/sglUmky5y2S5SnFfNp9e7cr+NKLqBzGjc+oAAt/ZcT
	yhWTos7hHwvDFfEDgAZWFhKbkov/nRIw8/Xrpk1+pHmGkkIHkLfoGlAS/glamjSFhD09BoPSEYqDA
	e+60yAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjR8U-00000009bAm-2T0H;
	Sat, 24 Jan 2026 00:04:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjR8R-00000009bA1-2tmn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 00:04:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-4359f35effaso378999f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 16:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769213053; x=1769817853; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=;
        b=kC5GmJNmYpfl7Ahg5nVID8eEDY3zEKPpFEgc1xsoT/yQYx/r6ZY3fNrNxiHtqjssfu
         K12LmBLLoBJBFVv0xoXkZS92ELb/EvTm1+etPxzRkVNhGK95655hgJNkY/IR6BQ4lwTS
         qAWmXJ8WjMB+gyLybnKnSXUCmd+BNaMeXs2ewIkjw5XoarDlM604Z2tsGJu0BuXzdqKj
         JlmVmKQsI6ms1zNM7uXC18fC84QM9Z+6vneOBGP7Ti+pNlYuwHI5gx8VpWm7iTLfONfu
         BZqdyOnhnuBl4DGEvLZZUjHO0SsCBTo5JixeBUNWkU+OytTTFzfvO3eRY8UV7X+ZpdhB
         OETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769213053; x=1769817853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6r2QurZAQWCjh0fiFFVfKXSGYPjUAsKdH07r9CUR7DA=;
        b=s+NtHES7mrSifHVo4WVfgwAt0Ud+SZ8OtQ5yeii302dAEgSiIGJDhMO+eY7S9YijJQ
         Y2oxMHoEExcNVEOlxf2i4GyUbWRFTtJmU/Tq9aWht1NOb19BRu8Td1kUNU+RA9BUGorO
         8zF/l+xJ9YK5pIvBkN2UaDg07civ4t/uwRsJqxiO+U8P7X5JuFHi1USTdskcQ3OcYTg9
         6dSQjVHwEfVEfFh5nFIQv05IE4G2XVrCzNT+0OIZIPtPtbfHOrdAIDt3bgqlrpVTlMqS
         AQA1HXJ+O+IR5JrZa2r8uPtrz36cMyFtsH2V/1THJQSkRVjdWXnBt6yQJLpCZVY5oRfF
         a9ew==
X-Forwarded-Encrypted: i=1; AJvYcCX7s4Xh35T4gFrWha7cvA4HIMNGStMR3nDk57/lseW9ddkfurf0eybZLy6aT1fLBtaYkJnV0J2GlZrup5hRwZwo@lists.infradead.org
X-Gm-Message-State: AOJu0YxtiNqNsu6I0NxnWNpe/hrk4CD/sGYUj21vGumSr0c3omd/bHlo
	/wMSJ5StZ2mOZMuqFaOE/wBvJbvL40UOXHZaOA8ainHxxyeoHbiUn9hT
X-Gm-Gg: AZuq6aJ+5b3jmQ9r8MHoXugfUX4uiPqMCpePAYVw636JTBesAvPDPqiwckW2Rxuvjpv
	EQ7mjKsDU4CvdKtcdvKvvOIHOYYOOV9W2b+oJWpiSa4hElcaZtPzMacG/gY84YYxzOys+9Tcxza
	SUn7+7avne/ahfOjJUFpKrMBiAIeFxdC82lOyaB8E6U0vOSl/tmOGO8T0GQK1og1X1xXjmeUmym
	B1y9balDGKDOwkhceMXvEDNy1gfJd9rPYO2Bjyyw9/gtuAnS1Nny9To5KRbi9aBwzqG8uBucRlX
	XpaxxXdFq1+uc+S0H8hJetXinBQpGnhADa6cS0GcBpAj3P4P678KeqSOdiLZV2F9FmwdNHwQCVg
	DdZejNYXe1DMeI2Lnvd2vHlmYrcTq8CxtkPyNBbJs0MuOYZhklKeiqHm9plyHx+UY4N/JQn4Vp3
	ucdw==
X-Received: by 2002:a05:600c:3b29:b0:47a:8bfa:bd5 with SMTP id 5b1f17b1804b1-480541f9e3cmr11110495e9.8.1769213052988;
        Fri, 23 Jan 2026 16:04:12 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:1430:8b48:2d45:6c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e716b6sm10359890f8f.27.2026.01.23.16.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:04:12 -0800 (PST)
Date: Sat, 24 Jan 2026 02:04:09 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <20260124000409.36nsxlvkde4zpddk@skbuf>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_160415_750719_D7E2924C 
X-CRM114-Status: GOOD (  14.03  )
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

On Fri, Jan 23, 2026 at 11:13:26AM +0000, Russell King (Oracle) wrote:
> According to patchwork, this doesn't apply to net-next. That's odd,
> it was generated on last night's net next, and although there has been
> further work, it rebases cleanly on top of this morning's. How can
> these changes:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> which happened in net-next overnight result in this change in patch 1:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> failing to apply?
> 
> No, patchwork is clearly wrong.

Conflicts with commit dc6597fab3e3 ("net: stmmac: dwmac-imx: keep
preamble before sfd on i.MX8MP"), merged in the meantime.

In include/linux/stmmac.h (your commit "net: stmmac: add stmmac core
serdes support" adds a "struct phy;" line, but that other commit
modifies the context by inserting:

#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)

(the last stmmac flag in your context, at patch generation time, was:
#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
)

