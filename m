Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CEAFEFB60
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHBV2WlEb8YlpAeS8vaO1JmiPasxSaE0UWxp/WI+MZ8=; b=SIPmdBRAL5j5IujJNZuwUHfLjB
	ewCtKNFmE1BhuIyLniUV6AZZSTVOxM2BL9CKUJhrqAatWvpMjKew+tlCEkMA8617PUawPcwvrCA6c
	iNXCUjsS7JwNM43UKAZyt7XhVdFZTW7DorWZzfrST09xPZqpKsQnChhk3hWhFdQ7+xV4RJF6SANrH
	J0AlfMbIf0Ztcgg1cgomt+26EJWK8nssRoGqdnjq+rYqxmRuoy8WGyauCb7J6v2VQE6HIXMEkUWDW
	mA4gm9re2ztXE5UrTtTU+/yzY0c7n1cNUrEBNvIjP+Re3U6S3Aeo1wnmBBrQVAK6wPavMq1KcbhAm
	Gt2RXswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzzC-00000008fre-0SmI;
	Fri, 27 Feb 2026 15:42:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzz8-00000008fqJ-2Klf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XHBV2WlEb8YlpAeS8vaO1JmiPasxSaE0UWxp/WI+MZ8=; b=GkA5Z20qjL7ELHmiio68OJidA8
	mK4E0sR+65sAi+UvPsXhMB99uC18aBfjD9/3SPJhz6T/cdzXRWUvMUCO0ECk6zx1WvyyT1enPzJSf
	/s7+8p4HVt1fzY4FwNEOoHx7HGoeg5x/RDMblSk2V32OVtfHVhGIl2GNQB0pHvb7ZdlKWR6Ulp9hu
	zlVBtpC3qJU67HCUnmNJgPDSJ0sQYMeiqa9pZxz+vxBjQxSmhlIUGQPKmBEgRRtsri6xuYoHxEgVC
	CNHzqWzE8gH2srZtol8tLlklvoEBk1qsqbpSD9dpE6QT0Aw4jVT4on+D799uwEYn7LlHbbKLF0lQt
	Xp3tXb2w==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzz3-0000000DPG3-1DsD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:42:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48371104ffdso2910475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206947; x=1772811747; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHBV2WlEb8YlpAeS8vaO1JmiPasxSaE0UWxp/WI+MZ8=;
        b=LHt89zQY9Nh+x4MUpFqfm7MrktKLVLnqTRP+hnYMv3iEZlLrWOgqgaF0WFo0bugCyW
         r9ZfeMSW7/MWI40Hss0TPzXHyjZGnWgILrfvabn7SKDOaTuLz1ZCp5Kd/h15DVAt++Co
         O8+Q2pa6DNwblZVW9rt3WNKcix4O8Ge9sWn1ylBx6BZIgrRkCmXwZ7U5EcHsGDz9RC6y
         OKUVefDvaa8rEHaZre887QIYLFUvCD+Kz33HKlo8+ra0YU8HstQ2WwRpOzXfK/+Th8x3
         nGCHH1N8QqNEVsKJGztKdK2Km0B/kf41NZAtcueghDwI7GDYV233A9sG5i/s7ey/h/oo
         rzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206947; x=1772811747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHBV2WlEb8YlpAeS8vaO1JmiPasxSaE0UWxp/WI+MZ8=;
        b=NoYV7pTnCzlDu986NDQ2x2m5Q4Z9lsEVXBk7H7yhfr9cMbPdI+kRfJY9TgHPffQBBG
         0jAEbWOFixM2YM7zhOOFZHZEzKHgs5MH0bBkN3b9tuff5B69GH3narn3vQeu6CgZkM0X
         RPhZA6ugk+DgJ8niAGcLJ7B9tScWaJyYU3/SUwd/x15EC/vaulM6R43pSRdHw6dYQdld
         owB5d+3u5/4+3OJ3dEnHBvjoomhDmC1NmmxwJ/XWl+mjESKmYEuwhCpOfK6Tpy5z0UBj
         xp+VD6oIenwm0b+vV7kJCZcVr0lFweBsxvuHCUCrkTnuLbG4qCrrn3SkRYMNS1JE67ru
         tBoA==
X-Forwarded-Encrypted: i=1; AJvYcCXhx2Ls/Ujn8Ag0P/fGqr8hM/7Nl3hkURHfICKh4/ZNGYrsEcmu4nNdqwproPpioFKZUeZu2E6kUDOgFFfE98O2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx++5D30KjPySTSYmgLtUi/evPgRF1w/eGaAfvAyE0DKgGtIl/R
	kFv/OGvaJzGLjSDB+nKIDBB93Bw5XzDrFzcsyHCvuSb1qFnksUGo9pLS
X-Gm-Gg: ATEYQzweJigFsG1OxAawXhwAK04qCrZa0NkpSOombtJHg9xzUfJgcGnNuYuQOo6zftH
	iiuqBEwXYJVpV6KokjzpTqrqUzZPjfALz+MnocLR2ufXUm6X03MujfK74VTUL2KMLrdippkXte1
	fDYM4oiOBMpKRBMKow+b0TXaffmS4hXRuBvOXhdwHk+/YWDx9i3SVB+DoQopDiNmJHc1NlWomsz
	l9Yrpa1yFRHxdQ7XNgxv7HPATNLOC75+ZtYmqdJ0nr4r9oW/Epy4zT2gdXjimGueWGEMa1tsvbJ
	npeHfXc74H47V3DceaaPreF2y9B8T9lHr9CT1MibuZtEXroHMWdIf291LvzXo0e8IyrQcUKm5pd
	5dR6DGbVyd95/a1SoG9gWkxzQ+ZM8kfjbHwuJN07rfQWS4/a1AXlG7HmgcWSISO0dSNSJxMGUeK
	eRhV8rgaoXf8of5Q==
X-Received: by 2002:a05:600c:4592:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-483c9b7fadcmr29575125e9.0.1772206947165;
        Fri, 27 Feb 2026 07:42:27 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f764sm7600585f8f.3.2026.02.27.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:42:26 -0800 (PST)
Date: Fri, 27 Feb 2026 17:42:24 +0200
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
Subject: Re: [PATCH RESEND2 net-next 6/8] phy: qcom-sgmii-eth: remove
 qcom_dwmac_sgmii_phy_interface()
Message-ID: <20260227154224.erj32n2kmwvv5xgl@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
 <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
 <E1vvkUN-0000000AuPR-2qKj@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_154229_454291_49946495 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, Feb 26, 2026 at 11:09:47PM +0000, Russell King (Oracle) wrote:
> Now that qcom_dwmac_sgmii_phy_interface() only serves to validate the
> passed interface mode, combine it with qcom_dwmac_sgmii_phy_validate(),
> and use qcom_dwmac_sgmii_phy_validate() to validate the mode in
> qcom_dwmac_sgmii_phy_set_mode().
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

