Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61E1FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCI1kb7TlrpTPNFKPwflk45oBxqy/E4b7hXMBF9DXnE=; b=f1Fiqd6ZfC4PRqK208ua74Fw0y
	XksruWFk3+mcIjOYzpDQxiwp9KA6pdAL6ktORWHWI9uCNVXO8LTeTd9oN2MDSQL4jcwXKOG/3KtrB
	0pT3I5JHnxnd4tkz4nITuPdXadu9i6ZOedCiEYFYFDqs87ejTjszHIcykjBSdf1SlvoHhGkLSHaTj
	MdtDN4NFiO042etSHfZE3/UfUwbP08NOkQorFxrfh5lWOoR3cTlz2BK2MiNjV8LEeVR34JfZHX2os
	XAoq8jYJVsckQ1iynUA25zXrcWn78vsfmzYv5EOy5RmKc7mnV7W7AQqyho7yZPwVg3Dg8Cz9/dc85
	SDLzou2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypOO-000000058Do-2jfY;
	Sat, 07 Mar 2026 11:00:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypOJ-000000058CV-3xrG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 11:00:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483a233819aso99676555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772881214; x=1773486014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QCI1kb7TlrpTPNFKPwflk45oBxqy/E4b7hXMBF9DXnE=;
        b=Op0mgIbC9/qL4l3f0NsbLBjZJPT8iUhBq+JnAjyOXVcMG2WTeczWYU9Ye6TVPT2NKj
         1rkAhcn4hwKQDKNO6nY6MFhc38oICFialtCnly7PSLy2K3SaWushcFHMoFx3dIQz8SAH
         oez6HbAoB+k60zZT54xakh1ODXtboWwMg6QrxsxHA+spS1PceCJKfBwzdXfLg7KXLYZe
         6ULRsMdbjxh4DsDINaKvbc3sHceVFLJKJGi/vm3C2AZbV9mtOBYpcHgQ4blIRvmsf95m
         NRzQnGLlrQ/Bz1lBwlmEvhQdVz+rn8tb0mMw9eUd/99eaqd95ZkcwfG2BfL0yOtrmFJI
         +Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772881214; x=1773486014;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCI1kb7TlrpTPNFKPwflk45oBxqy/E4b7hXMBF9DXnE=;
        b=Z7jBlBRa4RmURL0QykqVkkVHiQA33TfBNt8SJQ1eU3VgdE2CMHWpmTk33HNv5udn4B
         HxKomYH1JNvCaQ1o5mSkMMV8zb2wTmD0kmlrECdaxfndri42Tp9W7fp6J+O5q/DUyy5Z
         i6oYBzEzwZKJmi5cU89dvf6EjukELQTTlzQI12ZvCV25ndWINitHTn86VpQyOowBMdnn
         gcbZm4IJNhzTUtVSxuBJjKZMyA32kmrvjrbZ/9KbrDsIJ0M0CeBZXsErir+lN/ZA/9Ws
         NDbbtTjV/+GsC3wWCCEYyine/MS5+NpDmDbD9RTfijExTpxLsWYYg7KdFKJgWzkEvqIu
         S5MA==
X-Forwarded-Encrypted: i=1; AJvYcCUeGDQobzlNi9Fx6oFQQPn31TgJDcv3rLPJlGQl91rNcNhV9jsQgzwEhlIt2zwiw+abiWGUj8wMi+ObJ9djy2we@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/U081khJ5A9iUFXInEWVpTZ+YSXuHk7BQnVht0fbCIVCX5WZ8
	OiiAopvYnQj4z3NbaG1U3Tq3nwRWAhTqKMyldM3eXAIAKfUBtBGE4awl
X-Gm-Gg: ATEYQzyiduX8FyIZi6IbgYsoxJgSNFhDb8XMK642QGphkuVmB41tMi+Rct89h/isbd1
	vrL0UJrglpoWt5r7CHMG4HE061E1YdB2w65d3b3Y/TsUwdVM49qzdaP3nCz0anc02nze4GYxS2z
	3aKOj/vJhMMOkUqjLCgNmwtF16AYv9rcwiRB/NfDQHhXhztPJNo6FdDZMaZUcEpFpFcvM09/UPA
	TeJgOL65UXRq5t7IT+M/1ICO3M1UIqO5v2TkywCwo0qhMwLJZX9Zjykg0R9BYffaYZ9t6K+MVsh
	2q2PbNFjc38d1gr8fxvhneKEDK29YciTt15OBpyS+rWEPsVco/M8oXLl2Ktw0flPkYmC+iBYq7x
	X8Aae6acksmx6MOacweDb6b7ww/bDdTvTDn5p538X/kWMDSpt7JgQfUIEMZwg14pRezH7awJrJZ
	rp6z54p0PZjvLeoWWzQszIwg3Kxf5AfjlQuHO9c8yFVLq14t1azZvxYmn0DIoF7MsY
X-Received: by 2002:a05:600c:45c6:b0:483:c35d:3662 with SMTP id 5b1f17b1804b1-48526957c37mr81366225e9.18.1772881213827;
        Sat, 07 Mar 2026 03:00:13 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852e38c013sm84256225e9.8.2026.03.07.03.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:00:13 -0800 (PST)
Message-ID: <69ac053d.050a0220.24143c.6b14@mx.google.com>
X-Google-Original-Message-ID: <aawFO9rx_7g3C7eg@Ansuel-XPS.>
Date: Sat, 7 Mar 2026 12:00:11 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] airoha: an7581: USB support
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
 <20260307-poetic-salmon-of-order-33a4d0@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-poetic-salmon-of-order-33a4d0@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_030016_003515_9B7C6AA8 
X-CRM114-Status: GOOD (  25.22  )
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

On Sat, Mar 07, 2026 at 11:28:29AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 08:01:49PM +0100, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> > 
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> > 
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> > 
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> > 
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> > 
> > Also other unrelated patch are dropped from this series.
> > 
> > Changes v6:
> > - Fix kernel test robot (sparse warning)
> > 
> > Changes v5:
> > - Add Ack and Review tag from Connor
> > - Implement Ethernet support in the USB driver
> >   (testing support for this Serdes on a special reference board)
> > - Use an7581 prefix for USB PHY driver
> >   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
> > 
> > Changes v4:
> > - Rename PCIe and USB PHY to AN7581
> > - Drop airoha,scu (handled directly in driver)
> > - Drop dt-bindings for monitor clock in favor of raw values
> > - Better describe the usage of airoha,usb3-serdes
> > - Simplify values of dt-bindings SSR SERDES
> >   Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/
> 
> Why is this the same link as v5?
>

Sorry a copy paste error. Here [0]

[0] https://lore.kernel.org/all/20260304005843.2680-1-ansuelsmth@gmail.com/
 
> > 
> > Changes v3:
> > - Drop clk changes
> > - Drop SSR driver
> > - Rename property in Documentation
> > - Simplify PHY handling
> > - Move SSR handling inside the PHY driver
> >   Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel

