Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F34EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=; b=uI0mz7ACSRBuFP2kY2KqihvGNT
	AzGNGmwQT8DpTO+ub+9r+Q24lvAhRW8pt3dA0R29enB3E1aEr9MdW6tN/WjzykLmM5OGSOS9iNVWQ
	XRvN8nuQh1tPK3wYWDa31nMspfjtCld6htAmC5HmroPU2M3IzO7eb2DBmnioWkcPpzZE8vA3hSLrH
	yoRddJv4KCRkw8bUlKd626UNHUQyZBZ+PwV0SaYkx6BPW4eCAkl8xcx32BTe8A5NxS63xtIPLYOac
	YShqH2o3k+liv8xafzBcvyCh+zNd82klfUIGk0ouNlkcDquVSyFQdDOkhgK/USXG0vNfmZwNqyzU8
	o0krA/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Ka-00000003K7j-43co;
	Fri, 13 Dec 2024 09:51:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2JU-00000003Js6-3OqD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:50:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43622354a3eso10740855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 01:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734083423; x=1734688223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=;
        b=K/mRjK6P/W7UZogiDptR9SuZWpUQsKLxmbB2Tthu0F7xgkXLrH3YktLueWZOngFevM
         QzuSo6SbwkLWkW7qYzMfQIrSNAIkxcL9KVyEWTvH2wNgfFc0FofzMQn9UZmf8FHD+/Zj
         fTSgFWcRYw8MoJV3GEJ6+9B4xjWnGxFsolXOoESNIyL1GC9xL35Jg7OFGVMdZUYPhJ2u
         LxDdUxUaNdfvwqODQYNxAJfkoxtyMYu1EWj/irB1uLTNixUOQywqyJhVYrmFl3iBsZIf
         rZ6bd8rYXGtsehFf839C3fK0zF6isEFx73KmhIb7e1ZimprWHQtQArY5nbHzDRbROHH6
         ZaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734083423; x=1734688223;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BrG/YdfyMfJSbNwPUyHp+NyjkXJ3CoxC8wyqAirNVg=;
        b=ujer8YuSyWUZbbiyYxH2Mair39BZuKQ+bxcOow3qIXg4FvpFU4gNt9QU5A8Ttif1mO
         Ie28/LbE4Ep/VzOwZZ2DBrmbOGSSwC3kMjfG0nqQCQd+w911Y98yVCygNF7A0VsWn+cz
         3Rw/WK4F1fBaT2ArVXTVn1K8VUZey1JMnfi6HrF2SIITJ55cQzN9SNE0bLV4JH3LpH1G
         J8sTURIjGzpt3WGbihaVvlhKN33grbCGHBbTaJ1WkF4490fl3UKe+kz84xbnCsu62t3I
         r6ufVl9UwiIl1hU8iprUtwW1wzJiU7kxZOY8jUon0yxWaFteLOF6ktZ0lqXvu0Elnif4
         PiMA==
X-Forwarded-Encrypted: i=1; AJvYcCUm41PyAUCG+zn6iCVeq2JJH8MIsFW3cibj/bDvNMG8dX7uVLX6m/wR1fPUXZhUV9TUy1qc3e7Xu33KR1wxfALX@lists.infradead.org
X-Gm-Message-State: AOJu0YzsqTeGbYhBeXuScK2P1bQmDZesAlLvl7UCYvyCNXaloaBMpThN
	7Glcx6Gzvfl0zjme2hLOBWoRW/K4lUnfnr3sdOIWj97QUVcc60d6IcZePh5C8vw=
X-Gm-Gg: ASbGncvdqg+2e7qr7pq5k8RdbFHPNsjCW2BlM95oQEdjdZUrxwZ8zyL0r0zkuE6l5E5
	SMnwXmtn3TCsL8MGeNViT4FHIgY3XY8Lq7EPjFDjVwXPLqzyjPGcBhvU4RCr769w9xpa1NPJbI4
	AkFgqtTchg0fbQzB10Pgp3dp5DkrVjKYmLpFZHoVCkaXGPAFWlnMVIJjLTfLlTZM6STh3Nc/2AS
	3C0oliz2IDJia4JqRlouUTm6qaganDi6RIV2AqtysxBBfEghAsjx2fMYES6GqIBUdCI3kSOeaCT
	Ew==
X-Google-Smtp-Source: AGHT+IG9A/KVakoN8guITzQ9eblOlzfndf3qs1MoLosGMewWA0MLS7+7RXq3a6QkML6U748MbVt8iw==
X-Received: by 2002:a05:600c:1e28:b0:434:f8a0:9df0 with SMTP id 5b1f17b1804b1-4362aa3d988mr12741175e9.8.1734083422743;
        Fri, 13 Dec 2024 01:50:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a3e38sm6521670f8f.23.2024.12.13.01.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:50:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
References: <20241210105705.116116-1-festevam@gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: display: panel-lvds: Add
 compatible for AUO G084SN05 V9
Message-Id: <173408342200.146926.12035228317678634165.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:50:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_015024_866160_04348F27 
X-CRM114-Status: UNSURE (   5.94  )
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

Hi,

On Tue, 10 Dec 2024 07:57:04 -0300, Fabio Estevam wrote:
> The AUO G084SN05 V9 is an 8.4" 800x600 LVDS display.
> 
> Add a compatible entry for this LVDS display model.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-lvds: Add compatible for AUO G084SN05 V9
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1c64605fd976cd2c7e4f30d826818a8c27924c32

-- 
Neil


