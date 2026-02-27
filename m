Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F2CFEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAkEyJJOJ/JdV7CNjPcqTwZJK7pvth1XKt8oYwJ3QEI=; b=AyrCMoG3fNPYHobjwZ242lBAc0
	OJtKhGQdDJQTXVqQTCHAviYPPTzDfT9fFuwFV/vp2OhZ8Vxki1XWhe/6GMH6aRRoWYOa7TKO1DzqN
	a+Zd+aaVyzNOzrS+ciSP+SREfAFx9tPfVPEsnNSA7rHFY+AsBRwhWTRS8pKx5ZVfBlocMuHyTy/1g
	8d9nIbk2cGqItrL8CafsX0TZDxtPPAhQNp++9JK0WTTdQaLo+2iHL1cwIxBMgGLJNeVzxBAztJSfg
	NcfNTASBRsn4iz2z0is/yNetMZQJqwIMA5PKlCPjbU1F32ZvVIbq29UP2eJ+jp1i2iUj2V6mRCzjj
	pDTHhc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzvo-00000008fVK-1zfT;
	Fri, 27 Feb 2026 15:39:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzvm-00000008fUM-1xpf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:39:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4806b8fca44so2953755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206745; x=1772811545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAkEyJJOJ/JdV7CNjPcqTwZJK7pvth1XKt8oYwJ3QEI=;
        b=MGAe7sUWh2JVbiS6EypKnGqqg3DkciwTjcPJlUfsJKgrmVnpLiOCHyK+MIJPJjSqiB
         1g3LlwNG/n81/SlbshuJxngST13mnuV2q4Fbqr7D3u/NnBJOz32pFJQ6n8diJoGs1G8y
         Xgrgx+Vl4eugvk+whJ/F1X0QJMBOzW3VWstDc43zMQt72Xa5bglPeHis7Oy+Xewb2d9G
         T4E2aaeHCpql74+STXXtxE/UfYyZtKbuiezXuAbLLUz4Lym7TP38IDn6Tiho46R988YM
         ysEPUT/k99GTM2Pum7UiP1SAsybP+a5kQvjI3q+dPSe7TBRxsfxKaUQfq536dOkH/oLp
         04jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206745; x=1772811545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAkEyJJOJ/JdV7CNjPcqTwZJK7pvth1XKt8oYwJ3QEI=;
        b=E999V+eB/jEEk1xte8jRKpLz0GvNpVW7OcqNo3EllVR9c9nDzmQcm6gycMNdZw2erj
         ll+XO6G9k42/IFzL6zgiCkdNyFl1kygGwbaMVdTbUnoFjpCWXMUhVfTaHaOqihwxlxcr
         eFq2IPxGSxpOTi+ygwU0qMQqRMZ3eIwYxBe/vc6+tVl16Pz+4NV6GYL0cdvz+nazLpf+
         wOio8ZajoXaqWFozeI11okQJNj0Uy63uR2cLXcuAE2f0rXfU6ZK73bpkC/34JDmbpFvy
         POfkwqwU/HG/vdzPSq42Uk9DEcSghw+GI6S3XhiMgxC+kmHGwtY9o54IBf+SE3eWFjs5
         G8vg==
X-Forwarded-Encrypted: i=1; AJvYcCXLLq8HbubeeFhxtUz5dCDaWgx3Ixp1AX9wtu1OxhenVZnB89c7FxPHvntfiChNshv1hgnHVrXOR9c8xTWfL3zN@lists.infradead.org
X-Gm-Message-State: AOJu0YzxbJe/RP0rx9kWsjmtVGQTgJ7gs2OoiOybk9WcjNBacDDHsofH
	7SUb9VNkT5lL+aknW6q19yL2O5I7Q5eATi+X6bVO9U6Sd1ulXN7jR9i4
X-Gm-Gg: ATEYQzwAxCloz19EBuyscjpj0ZwPFMyQ8zLK9Ej3A3aUk5qU84VhWbs2QsrTPuZ4sPT
	+shvNTs8Ho/ksH5Jh/83nl3JJsn9ogBQW+lwEa1qTqkxcCznc5Vvke+fC8PWSN4wqAPSOXp9TbY
	5g7qQrs8OCTLs8ZtIF+fV0PXZQOJ7cGxK515BYO/c+HugYAbHQqPPveofNCdNfmptTxWw1rtM4P
	kaQj4gX1oWEnqFgRwemwr5F+YyhvGyHzh0P85uvzv7bW9385RJRRllPw49MhjzlpETsl9vQOjrd
	pDsN+yU2dFvhTgVFLp7Oyv1MtE7hV0GzsI1JM5kdg/cWwu8Lnb0EmQoEzjRIEAeju0ylNTt5QLD
	23IHUeLsjmOpnLglhpIDW/V5bXicvk9MQuxVAvoxxg4Dt+sdjkWjm3ojD8kpPYQSI9FUrS7WvW8
	BJpmbgJvg576W1xA==
X-Received: by 2002:a05:600c:46c4:b0:480:6612:253 with SMTP id 5b1f17b1804b1-483c9c27367mr29499615e9.3.1772206744631;
        Fri, 27 Feb 2026 07:39:04 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9566sm97450615e9.3.2026.02.27.07.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:39:03 -0800 (PST)
Date: Fri, 27 Feb 2026 17:39:01 +0200
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
Subject: Re: [PATCH RESEND2 net-next 4/8] phy: qcom-sgmii-eth: remove
 .set_speed() implementation
Message-ID: <20260227153901.qor4rtvtxur2zywh@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUD-0000000AuPE-1l06@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUD-0000000AuPE-1l06@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_073906_813532_D0581BDA 
X-CRM114-Status: GOOD (  12.62  )
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

On Thu, Feb 26, 2026 at 11:09:37PM +0000, Russell King (Oracle) wrote:
> Now that the qcom-ethqos driver has migrated to use phy_set_mode_ext()
> rather than phy_set_speed() to configure the SerDes, the support for
> phy_set_speed() is now obsolete. Remove support for this method.
> 
> Using the MAC speed for the SerDes is never correct due to the PCS
> encoding. For SGMII and 2500BASE-X, the PCS uses 8B10B encoding, and
> so:
> 
>   MAC rate * PCS output bits / PCS input bits = SerDes rate
>    1000M   *       10        /       8        = 1250M
>    2500M   *       10        /       8        = 3125M
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

