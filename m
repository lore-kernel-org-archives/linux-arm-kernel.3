Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2FFC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 20:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8ek9XEABkKYopYQPGgQ0eZy+De8ylYFeVMzcY2nL9Q=; b=wqz+GODfPOOqtzeG6fFgBiSKoP
	72bwcN6wDXd4aC0/90bnMXDXTyDuGMkxHnA2SOxin3+Nwn5h6Fn/RhkyitIlH1I2Pfu9Wx/nrZVO8
	DKPzxHHV7PU5beIf0vUVsNFWrSKVbRhN6Fn/8O50dP70bMqpFCVRhasqhlBUvyEqxZS4Kb8WSHF5E
	zusLjFHnC2WjBNBgHCla48lC1N3F3M6HOmCEM+Ga3hsfyK5xvNwFZFwlHiCyl7/1y9jrqlPSGABHL
	YHZ0guErNoA6TRNf9Tamz8ReX52m0xewZe2Z//JGRyc87C7qS6Y+b1vKg6w2u1NJeZ9Aj1azOjguZ
	H9Zh3K7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnEe-0000000AXHR-3oG1;
	Wed, 19 Aug 2026 20:50:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnEa-0000000AXH5-3iY3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 20:50:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4813ea321cdso192463f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 13:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787172602; x=1787777402; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8ek9XEABkKYopYQPGgQ0eZy+De8ylYFeVMzcY2nL9Q=;
        b=CbG2aCQQwINCaxSwk5Vq5FWZmr1cHiFNZpxVk2BMD8+H/YCUISHmDSnwkwoA6yLisQ
         bvF6AzAbSrVpr+nFg/I//X3m32IssBz2lBCAzpb575KTNLPWZwelLjJqXIXxFAMxje1K
         fZ/5mAHjYLWal26Ro5F5I+4m7d54DHtSXRcQ8VP3w0/dQTKC5Jdi/NlyRQYLfyP6smK9
         e6PfKUjQMNjh6ItzfmGXcs5ntPe1woGiDXYdn8Ni7JSMwhYqJ+NkzLkmVfiHKSQFCxCD
         s9ECHWaR6jymrZ63fwkBXlitRZWyAs6Adxqe24nmrvYEZyJhPw5hMY6Qbw5+NVEAUjbf
         Gpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787172602; x=1787777402;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8ek9XEABkKYopYQPGgQ0eZy+De8ylYFeVMzcY2nL9Q=;
        b=pbpTz68f+6Q1SDUDVV7qQsFGbgD0WNKk1qL7lY9eQRUwTfCTfmptRgLDnCXeX7Lmy8
         YoM+PtXRrHCWdHQDxg/tMt47TY2mSSb+odQkEf2HMZeVf6JjpwSsIl7ER5LSpbx4Fjwm
         NsA4ALKUXApSICq2Artrz2dREVxpclUGAdUpmaYYi9rgarZ24WOmqarpgSbvSprVs2Y0
         of1OWGIs7qqvD7Olxz9BDsEQmjBONBj/bN3RqmuqPUg+WsKYeWOdFoQX/aq9DMfZDDqF
         /gboTdbbPdPKueKk46gHd17woIkHVQOBunVdMkCxj0VW+/eaeOaacxPpCWHjbt6mHyKx
         hx4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4z8ekfaPLG0LpacODcfyCr2VFygfBo/k0gzhXju2GaGsRjZ+qDEmTR5LF+e3KdwEiYqXaq6s08Gqpx4luWuSi@lists.infradead.org
X-Gm-Message-State: AOJu0YzbvwPBMB8hUOeJGcNPWD9Tg8IwZLL4E6sEUhrXiMwkisZRyOvR
	acu40NdXVD48jLDSSak8rkj04zW9QnW1tigM6gF7xzpauqOgE7r7HhMME7wjto69g4cDmWtCjav
	UHAcKD6w=
X-Gm-Gg: AR+sD12W2eC4QFcWvtl6NhnsTTu9gn4As7JD7Xg3pqyoif75EwOZFxh9Oyxo6pLwJUm
	X01pVWtmZ1s0iRyudREg7hqtcHu3qpRSATS6QzE1ifzerByeo9/nPeZZWUmCwrvTP0m2XuBD6cr
	kKmAGxFZozgYEmPK+7v9dfPlmyxymRz/mNzTjxGR1TMy1j07Mv0macLMVk32tBL0ep/hlflVWbh
	+t0E2nH8zs86UXnF2kBTAZLyRyXHkCQzVdRgi7fsEi6aR2a5zfwzSbxNpH0+hE4Fs4fJcI7p5DF
	2yzOIIz6ivfVxv+WAwhDyFSjkruAjI1iAVpZ26Vlf3sPz7TLg08u/Fuo9IINj6OtAHF3APmlhyE
	IaN8QUWYqhAvT0pT47cDxX3jPlf00xtoEF3L9j87YP7862+OchO7HSCuMAakDXCXW3ej1AOyywt
	bFTdHjeqbZKySeNs1yqNCFkWTsoCs9nxnDAUD2mV21bg9fLB08FrN7pzs5IHof5bqmLrnzkaRxE
	uNDIhK83VTal+ouSu7+rjUDaeCt1uwSEf6YsoYfWSho1eA8NZQ/KhhjgsUU
X-Received: by 2002:a05:600c:c4b8:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-499b06adfa9mr26301385e9.3.1787172602473;
        Wed, 19 Aug 2026 13:50:02 -0700 (PDT)
Received: from [10.0.5.39] (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499affa25acsm24257305e9.4.2026.08.19.13.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:50:02 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] ARM: dts: aspeed: g6: Add missing uart nodes
From: Tan Siewert <tan.siewert@9elements.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260723-upstream_g6_dts_uart-v2-1-4951ae6b4ac4@aspeedtech.com>
References: <20260723-upstream_g6_dts_uart-v2-1-4951ae6b4ac4@aspeedtech.com>
Date: Wed, 19 Aug 2026 22:49:50 +0200
Message-Id: <178717259080.130614.3272450084960702654.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787172600; l=223;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=Te+zNjde8ncPGxnQfN9Ew+2u2ctnkBeEiF85U5k4JHw=;
 b=/uLeucK5jyjnSISmeVUynHbHVwcXGwPgqKGeQfPtZ71BtnVLy1XFSks7yth89NtjvTduqB4Ha
 BtXB21dIBq9DGk/cuow/TXINuPbkdo4h8j30i0RkisjIO33+CQSveE8
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_135004_950674_3880F4EA 
X-CRM114-Status: UNSURE (   7.07  )
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

On Thu, 23 Jul 2026 11:48:34 +0800, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
> Add nodes for uart10/11/12/13.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>

