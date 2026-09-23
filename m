Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D5AC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=; b=fdS9tcVKC8XC3Y8nLBploXB2gq
	+woWE9MpOr7jhns59N/JeWkskWPmPpR+qWrt0feeL2RjHCTtAwSTBabQQkaqq/SskMw3uekl/3c1/
	m1hrLUNSZr2XT/0Mu3p7Dgqkd/bl/4sMi4gNLy4ME6XV3CpVeDmrRHHZxjyKQnScIRcy58QM3XgSZ
	VvxLxYIklyiLR0rMT5IonDBXMjhVMHd2JX3O7BdG64aSj57CGKjlAaZJIaICCH+tNdj4fw86hnQYQ
	xyTy7dlbyAIL0svf4mjpJzT9gzQ/0hncfIaiJsNHJ1FGhMe/B2NRV+29mtYXPGuXZx0o/OeiOaoDJ
	tIlfih9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iot-00000007dVn-19zi;
	Wed, 23 Sep 2026 08:59:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ios-00000007dVV-0i2B
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 08:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=; b=L9CkcRawbSu1NZH5ArMhxy9pjD
	996OiAsDjDxyD+AnLjFro/Rk9x70jWJyVDgMeCytWkFGxcSNNpj0kUUkTZbwZ23RpREQAovz6T65j
	4gg477th582Bao95K9P13wDQSm09A/aoCexuidH+NbxcQF++g1ZZphJsM5cdFqA3DujGKScjI17La
	SBcTNhigiX668YuvqgVHjtkjTuJHVQGz6Z7U6voZSgzPQGSzGWGvsclmSZlHx5EZLZRAfE/vaaBO8
	SqKb29pcBNUq/B32i4L2g8VUcRRqjpvBGsoIkVQAMxkgGn4e1wjerlTQCW3TstvDyk44ZMPImJ5oh
	SCVH5pkA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ioh-0000000EYNh-3aZu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:59:05 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48436686a40so97490f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790153941; x=1790758741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
        b=iQonFq5j6W3WO/u1grFbP7xZvbRCsCaVitlxNO4zcOV3+XQ7aEOpaRwPrLDBJa55K0
         Mkd9sRDWmaykoZt4RLw5a49mCVQn1G8gYX9E2uDWAiCQ5v04jVOZhnV+JDA0oqvZDGWf
         ktar4Dm4am9FaOIBg7dReBTNQ/g32eu7gZ8FeCkZrN96DX3lIeLh+fv+wDy0EoSdyNTg
         dy0S0Cg/zqPLias6v/BeBG+fU91p6biDaDN5cNLJs5Ji70Xq+GW9st9BHZCJaZgym8+V
         MBVMP0A+1/E42X7RTPiJx1GLe0IEyWf2tYG1Nw3qG5ghmW6RtvM3nJ6LvB7nD/GKtBCN
         wnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153941; x=1790758741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0deKAZvEUC2+qIm2qCL9XPw0JCTKVP9Fpq7a4fZNq8=;
        b=zanNBAZc9eSAcFZuvYT5wdKyuoc9O0h4m9wv1pF9zsCygjaTstpuxnO6CyqElHx63I
         k2FBVuNELBhb1c4ztvZquGaAt0ThTqEGuFDfjIxKVPiO73i8GrfkOlfRhUdvU6UdRgd/
         kv0Erpd/dXv+SxV8qtYw3FFsf0X4owTRsT44RuIotIioGECEg4YWfpY6kqxCAApUcKzE
         tr5gs82DTXixEO0396NKqMB1N2xmzEYzbvpmjrA/hA6zGna9O7KozPGOwt5avxtJ/40H
         zkrv/MUxOE3o7UTLMnHrBcIJ2JvILJgK9VFIFFd9aynaDY/93yb+SsiLsOgIlMmduXEN
         fikg==
X-Forwarded-Encrypted: i=1; AKwUvBxK8eHyb5ovj32sQGwCwfKDB3FeQYfN9lHBoK6xVtKUI+CmynD1CBvwryTtDSXe8HBZz+9o1sjGqeaIenaJ6Ong@lists.infradead.org
X-Gm-Message-State: AFuF++mOCdTf5kG9hozaiNgCymmo9KvPXAwoGx/zePtcCfB7U2YZGr4T
	1dPO7KwUwrvtC+NcxKnr+7/rzLvDhFci98Ku1US0Uq6lNUigSccRnuGb
X-Gm-Gg: AYBFou30YRQuPI3nbpYx5qVZ1JZFwL3/xpRgjTXMCagtd0NJ1aH32vJKgN56djedQm6
	EwrYPLHGnQIjy1zt2s4v16kSgcVXTBNT2dMV3py1bxXlRPlXtfK9Tcq9z5u6DG407dvwREC/y4Q
	OTaEf8e1LqEk5C1pdsoNN3UuPrBXNU6DNkVR0337Nue5LHUjifzShvNt5FSXQJ8ah0CQi5iymy+
	qMrHUWVtl8z2QA6Dr3ebJ+N/RcnuL4NJgyt+YDqMQq4N30zaRr1sm4Hkzvy8lIlsoAzJgJY9Pfx
	DiT5SGB7vzvAxXuVjPt4xT2b4M0z/VP6ky06wHiqVom3lSqNsPzaXSOhjV3a3gCFV8HUTO13vG7
	CUKFho9q4lkClYGiEg1NEoBns/0TbEyQmJ+Up7nZloXlnY6mNMKPuQAv7NiiTyN/Z9qmZKulyFI
	hY1ahgbh03cKtr/lU+zHQM2h8ZMvPH/SY0gTb822j71G7wssu644z7xcliyWgz88U1sreYEjB7Z
	LGVYgdqQ8c5SHpumdL144eiVzZ0L1vkqjaYLcgg5jbT/j2VtemF8+F/pkzpVJ/THqUOEgul9nsu
	bus5
X-Received: by 2002:a05:600c:19d3:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49fdec98921mr21435345e9.0.1790153941274;
        Wed, 23 Sep 2026 01:59:01 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe23d4288sm30177355e9.12.2026.09.23.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:59:00 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: npu: rockchip: allow DVFS and thermal properties
Date: Wed, 23 Sep 2026 10:57:55 +0200
Message-ID: <20260923085755.16219-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922160602.GA3529337-robh@kernel.org>
References: <20260922080114.44662-1-royalnet026@gmail.com> <20260922080114.44662-7-royalnet026@gmail.com> <20260922160602.GA3529337-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095904_072724_70798874 
X-CRM114-Status: UNSURE (   9.13  )
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

On Tue, Sep 22, 2026 at 11:06:02AM -0500, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 10:01:09AM +0200, Igor Paunovic wrote:
> > Assisted-by: LLM checkpatch dt_binding_check
>
> Drop 'dt_binding_check'. That's expected/assumed.

Will do in v3. By the same reasoning I will drop 'dtbs_check' from the
two DTS patches, 07/11 and 11/11.

Igor

