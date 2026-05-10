Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684CACD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ud7L2P4X5Rr0hOtHbI867aqBSbwFY2XRAYk+zs4pPjM=; b=uYT+NWoeB4Z2QkUn5zGL/aHQuZ
	jb7FqH3FicJBYXtHlWLHru1IXNfU3qz6bfaeQvLhPBRQTgZEG9Wg8Tn7YhAeWKZiirBzfizUM8qsd
	2cdPN3gUqv8SOeatrX7lXwvoEje/3Mp2G08k7p2WwbpmWht0d05wDZLxfRjftNi3Cy1amYcw5ITf+
	mZoeqIfPXMp2o+9UY3JtWTN/rD1bL43yc4HXExishMLhzQONDoGPwG6zP2g1RBFEq/n2VunuKRQLH
	SDB70q63m2FJrQyPr2hWfQ7m137f6Y2V9RkFKrWBF4jYrMGsrie6ImDU1wmJ7Y01uXn81L1Fw7uHL
	1qA//U3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Kc-0000000AifJ-0EkR;
	Sun, 10 May 2026 12:32:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3KZ-0000000Aieb-3JrV;
	Sun, 10 May 2026 12:32:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E7FB4445D;
	Sun, 10 May 2026 12:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53031C2BCB8;
	Sun, 10 May 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416343;
	bh=PfAtiR22BeLI1xNkWhQObSwYDHOrQpp5c0BjbJTPJhI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pzzHPD46ljrfTpClixgvb4yANKVJ3v32sIl13C8+ea2jLszSd0oPgFXSSbP5Duv9f
	 QgfbscxCIdx2reDe4iTULpGdBFZ2AouPjzwdjbXqaLJ9JpJLD5DcEXQd+ISSb9GqV+
	 kZrGaFjVM2IPkBzH0ScNm1Nq60jYspEAwOPGW6BSrMC5BBaqxRmJwzAVkGHuvkHTtP
	 BlM0ij6KRT8uDlbAYyyb5hd2ckkXy/Zd61r3Ap9luWAxpWFWDF3QS2yyBEK4kzkZa3
	 PC28WofTtsac7virgk4Bc0WZOsBesX4ghbjyP0C1+Y6JEUQYIKO5BzsfjKoGfMnPP8
	 sgJqPMOxl+77w==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260306222457.8400-1-rosenp@gmail.com>
References: <20260306222457.8400-1-rosenp@gmail.com>
Subject: Re: [PATCHv2 0/2] phy: miphy28lp: build and simplify allocation
Message-Id: <177841633994.434434.11599287536410953289.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:02:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_053223_856232_A91DF4C1 
X-CRM114-Status: UNSURE (   4.95  )
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


On Fri, 06 Mar 2026 14:24:55 -0800, Rosen Penev wrote:
> First patch allows compilation on at least x86.
> 
> Second uses a flexible array member to simplify allocation.
> 
> v2: add first patch and fix second.
> 
> Rosen Penev (2):
>   phy: miphy28lp: add COMPILE_TEST
>   phy: miphy28lp: kzalloc + kcalloc to single kzalloc
> 
> [...]

Applied, thanks!

[1/2] phy: miphy28lp: add COMPILE_TEST
      commit: cc68a1728abfcbde12d36015f244046ae74ddd44
[2/2] phy: miphy28lp: kzalloc + kcalloc to single kzalloc
      commit: f3508a61c892c592e4e893a3681e568a5c671027

Best regards,
-- 
~Vinod



