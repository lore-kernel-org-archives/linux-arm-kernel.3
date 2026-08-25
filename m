Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320EFC61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=; b=n1J+cxXco1ODDGarkhvpmIPA3D
	lLd40cK7Mtz0n0Hez3pzoEHB1LTX977orQBKfM1Jeu8x/oiBkvFxEwQMxxYO1cvAebZTrYN4Y55x3
	Pu41t1N10CSxV3ABGftVDPd+eKCB+BEkaO41SqPt5IL4Q8Z37ZWaSknQ1yKmYp2MXGs6VPI/hRAnf
	m+0VOleRkJni8QFpetcP+ERTRGBhjNY5efwA+92KZJgjDJ+E4Xly6PXYhiahX0nC5u2tHB5xGGPec
	9v9uLlQLvABAEnT5YVgfXgtH7jpybZBXCVgErQ5DOht4eE/IU66xTY5DIgi1ZBKv4c7JzwpuoeZuC
	U4q5lQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoeU-00000000cvr-3WMl;
	Tue, 25 Aug 2026 10:45:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoeS-00000000cvK-29bw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:45:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d6f9e2f681so2857285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 03:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787654707; cv=none;
        d=google.com; s=arc-20260327;
        b=ikx6B5uf3i0Jw2uRHckobb1gy6vreDN1x700nDM2xcRzd4K8er3CvUcEOy4ZSh5Kdz
         xitW6aMo/KYW5ny7gDwn5zADoDvnrNJKAHTzlDhXYtZn3j3w+Do+7g6IFLQefjW9inHs
         2HvekDgdGNntjOOYQPOyJtfdlQ2UadYDgYUDceOxWog5Vx1BMDNzh3Mn/OfvTPoIJDIQ
         yyhJ8B1h15Iv3wvGrySDtujU+ocaadbCl6jnCD6tNaOBAht4jM2iO6cphD9VCI1ZL0JZ
         KrbjrInDLcapHdkOnckhzCPYKB5WEe9eOnIVFPZr0s1C9CtqVIZ4BPF2FIRbGjRymape
         VCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
        fh=ZgiVAdyg7Jv8kE9vNS2Mjf8Nc8frv+SFpvVnklxN964=;
        b=ijUrZ5fLySxmyHNyqE8HH8yioX323smkFZu6zCAKJ5amUOPTOIUGUreIuNFDsDcK/7
         o0MJLFca66BPDdBkBgxoaEwTJxeEDY+ltYvnWfCk81nokTIOfupBfATRae6wVuqqds/U
         dwjHIdh7+o/vD9cUjKWlioyR0c4/9iysB52zTS6moqGONchfhv+kfT/STBT4R+isZm6D
         C9eUNNk8Owd+QuvZd8MvqY5XByvDaZZ2y1GOtvprmwve3WrLMvqCV3nOs/362BqAELxO
         QVXe7CvOlncHBcBVBJwfpWQ4vjHqvOLNDZg1zAJ6G63prUgQ8jiWKSZxpD8b5JvPGEmv
         g+Iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787654707; x=1788259507; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
        b=YHIPrM4B2dpDA4cbmFNbb05g/76qLhHmyANu2IstWSo3dh4fK1Nw96N2QWIRY3i1Ua
         ydogFEgK6kQclbQKPLki+3PB0WwZbc0sdnkFCUGB+GoU77+oamKkf/HSn9ODpYW2W8aH
         vNjxP3FT/++2Iqg09BeQAb33NC3DhurPh8VxFTCLjov9djGJ0KcvNLJFlY7KEFNtyx/k
         RLl6TqNq4JANp63rObNKN7B1BPy1g245Si16OM9xYwl1KO0VMvTCImd7L5p6boAsipug
         0c0nKTkrdGrlMWskhC3B/TFeFOlw6YV43kkDdP8Bs1iFxVKgITiPUbUP317LzAYCzJz0
         hm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787654707; x=1788259507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b7tRcxQ9uqlAYxU73ScNDdxC2wVeUQWIqGoczNzFSXg=;
        b=kiB+Axp6BnC4aLQxTCUEz9Ox25d/PVQ95wcpMtXucdSp5aIZafqIp5ukQNMbP0zxUP
         TKR5UpYRY73IRB6G784B/g71Ltsc3tI9JFhztQaPHjM84TJpWMuj9W4auVYHlBOgVgwk
         DkgtUB2+6tIVZRe4MUoc1xkPIKDXCxOk4BQgm73N49NED6q7dzO8/uVCUjzZL/Pnu2u0
         Z06/N8lk+FWU7gfJS+OVqgq8q+rh+XLTi5nSukGns4ilAsfy462lUw9yhpEtYE36zXaG
         /EXOvkPGSTb+br3P6C6R5SUU8M/NZrM7AKO0+BHljKQ22HIoe2MltJECZDZ+UECL5rLw
         gDdw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6EH9pv96PG5AmLgIa7bb7l+J+dA98xhiEaWFsyvSt6DwhEXgOd5mRpLuJh3ZN3OOYtmAc2IZ5iUkd2yzvFZCD@lists.infradead.org
X-Gm-Message-State: AFuF++leaqeL6B7QG7JJGOBUKSMfDHxWwMMnqicyoqE9lseUY6H/71hD
	BxrFQNOIZn214FVnkHsfiv39fsO5jYHAiRsobrPRtqPkaKrwweyP2Fk0P33+TkZA8IOA/KaZ5o1
	nQOfRxj6UobF7EomF8n7Z5bq0J9duv6A=
X-Gm-Gg: AR+sD10MaTd8EOK7LNDzGHOSVLR6dW7hmtIn70KwFMHRg6DmgnoBpG/f+T5Dq7Oms76
	ep4BfvXkeCKKsoBEENWSBcXg6X4wqNSJxkcrNf3Ge2vvqdDGEZXRpPhB6i4iOL/t3ah3LccXZoD
	1wrSrMX2ugNoA1RvzTpW++ypf0RGIpnAZ/oJCvsfPn+vmSoPt+PZBfBl5XH6E14WjTdpae6h/QM
	psFh4oFsbMkAaEoVBoTIeo8TZvHQIkA87aW6yKYM20WCm7oWgJ2ArBV+BJIymqRHREZBp0zaYHE
	QzJ9xUv8b7vcvqzfyEEsN1yy6oJ/P3IEQLhQrppayo6N2qIRA/zYTjbu5crozzlDshizhkVCUG1
	+QxC/g4HVhqNbzvzRkmAeqSR6CHPf5P3uyh/coECq7T0v5PUBcH65M64iDmyS7OGHnlg=
X-Received: by 2002:a17:90b:3b48:b0:393:1cf4:d972 with SMTP id
 98e67ed59e1d1-395dee55f7emr43701740a91.3.1787654707353; Tue, 25 Aug 2026
 03:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260824100901.31675-1-phucduc.bui@gmail.com> <95b5fee4-70e8-4b2d-96fa-bce267ff13f5@arm.com>
In-Reply-To: <95b5fee4-70e8-4b2d-96fa-bce267ff13f5@arm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 25 Aug 2026 17:44:55 +0700
X-Gm-Features: AcwNN1XpjoADkpBZBVR3Op1a_LHVleiZBaqWEnQq1TuYD8o94K4gAQB13ZUSpAM
Message-ID: <CAABR9nH0jv--f7nBSKy7RDapiCcr2BrZbOG=CVwMev15iBO01A@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Roese <sr@denx.de>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_034508_556121_E2A1B380 
X-CRM114-Status: UNSURE (   7.80  )
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

Hi Andre,

Thank you for your review and the Reviewed-by tag.

>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>

Best regards,
Phuc

