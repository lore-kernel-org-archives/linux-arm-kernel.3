Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B488C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cxfayQFlNnwIQkxkgk362Uhlt0jtcBW5Ai1XuO+SqU=; b=XwnbKGRvWCBw36qawcbEFYY8Qk
	s94CfcVJm59tuHcQvg/nN7R7V6nZ1hUqUUWWYaifFAfBUbmHvj3pH6satlMLrcHojlcQNBmiRAHQB
	/fyxXC3iIaek0zQLS1Au1UGKv9o933aU0ACfUxFUqSuXf7YfbSiRX1KJxML3V4C6O1P4kuuITbyCb
	SN+1EmgDpwwK2gkICige8Tx99RVUbrCBo9cE/v4tbDhGt+R5kZnwGiZlZlGNC5ackNmOncoT19KsS
	bgrhx2SN3CulP/kutPhGFZb2HctR/GlAoTZHL9ZV1Opj/VPJVBdoLP0+mxlNWedlYkVhzHmZbvrSc
	wrTQU2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkmg-00000002eNm-1h1N;
	Fri, 17 Jul 2026 15:47:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkmd-00000002eMx-29iR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:47:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954d29264cso2392465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303246; x=1784908046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8cxfayQFlNnwIQkxkgk362Uhlt0jtcBW5Ai1XuO+SqU=;
        b=mWeKBHj8Te15Z4oSUungF3gWSvPfE2iqh7v/nccJC0KHQmtFU44xys8E0mXk5PAodG
         5F/6G9udsYc4tIkzGGA2GmRywb+fyb+jQ4BMSNVO9kA1uIGGrZo6xRFc9JqKnBLHltuY
         wNhRbA2NoDVClhfly1y47gZ8rkPpNBWYcSSWiWJVR2TlmqR5bBe1/48d7slRq4hAVVx2
         zSG6pEQnRmOqdsmiyAZMed5OUJzsKOHKU4x2pr6byAf4IBUC3uCkaj46QDfo/4ApaPba
         nfM6Exg5t28PIsrHs205lC+TBgX16vo70z9CSDQQ7ojp88TYLriPKqRRkEGqMfUoEcc9
         m/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303246; x=1784908046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8cxfayQFlNnwIQkxkgk362Uhlt0jtcBW5Ai1XuO+SqU=;
        b=s4PxvAVhYucRShSHbGQJO0uJ7aYIh3ErAjmXzdvL4uIU6XGZC5Iu24MPqcKoPfsJwJ
         nZkY7JDc6e2Flbm1hLzYAmAU9h3lw6nlRvKlVKSiPRSKjxYjlTMLb74ME+zjNQfMsc2y
         YHt+eVWikTnWilbZPM3o57/2yNsEzwgoPHpX4+tcK4TXU3WF07wgkb1ykbix40Ox4ClJ
         /VfOzqfOGW1P1lBfqCpDHMG1H3bUr8jLT/k3X47hAj3rdIvN37SaQoObkOzYXzCMBwbR
         O/rUmUULvFkQQj6aq/EU2tBRcjkXYmMDu4wGGZJGTNRC/Z7A3RrqE0zaKVqaarVflJgQ
         8ntw==
X-Forwarded-Encrypted: i=1; AHgh+RqNZrf4wmRW+YfA7cfX6hf+zejdiBneiXGQr3GUckvp9yjONMWs3jvy9mt13auQpqgJYXmA6ojTF6JCORutdLwv@lists.infradead.org
X-Gm-Message-State: AOJu0YwaNKQO4NkJNFiqboSTjLpacFNWidfVu6S5pxXUdubJgjanhd01
	+tyOqUN63i3vx17lzXNtfMu5eLuzemAWiC7A3kVwTpvyxW31UpZ82HQ92Vgn
X-Gm-Gg: AfdE7cmYxRkKzgnOObZHyiTHnpmeuQktwPBC1urcVcPQuL/+g8LCOclQoeKpRThJR6X
	Q+qoakVzMnexstoTurEWEjqvql/4+IzOeScnDJjAXAUwKncUHwP2H1L5egWdGctXU7KwQOZHPrI
	WyH2y0Hclf6yYt31sfiN5fyvm1SBUYCDK/zxFmBdKXQkCVhJ++sc3NrWtnFjHR2zuaWTI28VOEj
	uJuKPPbiGdUfJTWL/iw3ewSOUsEfz4UvsDHhhB6ZFUdcH5FyTTH2vkw2mYENsPz9isAWlAIwNAF
	5JQYRxI8hFXqMN28ew2y+Se14ZpDPZBL9XzzmhJSXahdB3mjidHfOq8LVjgPXq62NkciUaAP7uV
	N6cVic27EPNpSifURogkTIcJh1YkeltE2Qo/dwlr8vHqz5U/K9PLLV53JV8VDc7fdCNtNz9gUn2
	oubRrZLRNS2ieaBN5FwTk4BgfaLng8X9dGffyTtFkB+o8EK/yyGkT29+YvDjVswas=
X-Received: by 2002:a05:600c:26d4:b0:495:4075:7dfa with SMTP id 5b1f17b1804b1-4954a51e4abmr20886145e9.35.1784303245457;
        Fri, 17 Jul 2026 08:47:25 -0700 (PDT)
Received: from localhost.localdomain ([151.43.147.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm59211035e9.6.2026.07.17.08.47.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 08:47:25 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: nicolas.dufresne@collabora.com,
	jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: rkvdec: fix clk reference leak on unbind
Date: Fri, 17 Jul 2026 17:47:16 +0200
Message-ID: <20260717154716.84346-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6c3081fed130534ac0d5cf83c7658bb13e0bfc7b.camel@collabora.com>
References: <6c3081fed130534ac0d5cf83c7658bb13e0bfc7b.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084727_559099_DF773281 
X-CRM114-Status: UNSURE (   5.79  )
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

Thanks, makes sense. Resent as its own thread as v4:
https://lore.kernel.org/linux-media/20260717154505.83935-1-pavone.lawyer@gmail.com/

— Sav

