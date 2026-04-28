Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A1BFF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR/QPrnACdsdO0/KY/ZNEVbUuXYYjJD9CqgzSXSt5fA=; b=3HJf+BvscmhrVxuat06SQic7o9
	w5hJ53Tkfj8gKNdQLdLtNQMm/+A7y3Z7lc6czbeS8K7eHttDH+QzztJkFTC6p/5cjZn1+9Y32MNwb
	gx9C8kNgpSvHuX8g5mBCmp9g3KX7hLtqE3uxXMDzrTijpZVdNP7dFVocSrXkZr0ge3HfbAGLDNBJM
	b3JCZO9zwRQG/IkFrZCmDcYVTzM5SRLjXOp/i0vSg2Coum4NdQfeMNKkcZt6f16nZD5VkUI/1NTkU
	YP9jyieN5YCTjiEEX4CTiHwveaFgbWeZOfkyfze3dZnqQUPQSSmOUzH5toLcWm49xK5Mp+BchUM/B
	wG/I9pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdUH-00000000r0F-1qv7;
	Tue, 28 Apr 2026 08:08:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdUG-00000000r03-0Hsb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A75C60141
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209EDC2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363687;
	bh=jR/QPrnACdsdO0/KY/ZNEVbUuXYYjJD9CqgzSXSt5fA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=AU0kWrW+liEaSsXff5W2v0MsU1Q3s+Hiy/43Ofc30rIEHTQ9fIdl9EeBuYEPJDGdX
	 RoFruUCAVqbuHsEoPMBpPsUidf+TjKlVzjcXlBf6cwCo5dfFrcG/fV2+eTEpMDAC42
	 ZNynsd26hhnGeo+sHc21lfrf57sAjf6rfouDoprMvXDscnKrbsyEXaVTbJa0hT564n
	 uf3RCi6Cga9LcFaZ/FHRyvWjtOmnL5KvW/XJhAh9KEJhWl5nPddflQlLK/NHHZA4Bu
	 KSfqDJ3qVnZ2Ad7KjNgcGU4wFNbhzncv/CdnZvREms9Hf8DSLkTUOkdFlxZgTOa7tY
	 j1UWZ8aA+9Hyw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so105745321fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:08:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+bSHh7ocy/wTKiUqI1bha07ZDJeJPJtBXCYQiGM/NQuVqt+3eTH6OxqdyGvRh3I10l+zmhZP84B5o+3XqywtV@lists.infradead.org
X-Gm-Message-State: AOJu0YxiRqfukTMDGTKnxNVCegRSBOYl8HZEBMdg//O5a+tDjQ9CYVOA
	ezFQ1ZAKxAtswAQ93Z9gvtylzNWfgpnW2mfLKyvLd3a+vopsgyaiJO371bz7t1/d3O5DfKtgAjG
	cciSjR2FWkVU6cVoeC/q/u0T3E1CFweLGpGAim3AGQw==
X-Received: by 2002:a2e:be08:0:b0:38c:6b42:3d77 with SMTP id
 38308e7fff4ca-39240cc20ccmr6706361fa.2.1777363685836; Tue, 28 Apr 2026
 01:08:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
MIME-Version: 1.0
References: <20260427143546.3098519-1-arnd@kernel.org>
Date: Tue, 28 Apr 2026 01:08:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McpfT-Ph3S4yDfhb3ydc-vP9fBVn9Nq0P7+BmFNr_69qQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jzxwbh3hg_OkvmtqMYURBrWE3b_ixHf74HXsaHbAsWE-SCzGz3iCDPxv4
Message-ID: <CAMRc=McpfT-Ph3S4yDfhb3ydc-vP9fBVn9Nq0P7+BmFNr_69qQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 27 Apr 2026 16:35:27 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

I think you need a commit message here?

Bart

