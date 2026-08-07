Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDB1C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Aa0XOZmSfIfd7MTfSKuapoTZ1eZa+JY5dctKtdAPzg=; b=u/aKcN66ZNFk9Za9/JTFqY8T2b
	4hG0ohh1GViAeeSg6yEUV0sl/a9jx8SKSI95GQx3Ctvq+AZodNfZyAwDY09fViB22ZxzFdtXjHuHL
	S3J6pbaT3Z9QeXPyzKvaDvN2/bh5LSOt0uWXhDy97NZyU91aE1gUHOkMTSqMQksE/0uwE8YcpdBvq
	r8doiEQJLoAgpD0EkAG5emjmBQbz0kqb2AcUrCMxok0xiZIvcOCS6iTxUVp3o7hgfdHZTqi0sjvNl
	EOvsQYYEKHzqKRNB+VEcpCG/uEhgwKiOWbwsx/eozs8zaaEPjFmYhSRqfkbAneTFoXqEKMx09lXiF
	Yc6NgoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4s-00000007RFH-2W2d;
	Fri, 07 Aug 2026 08:37:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4p-00000007REc-48eO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:37:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4956869750eso22623645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091833; x=1786696633; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Aa0XOZmSfIfd7MTfSKuapoTZ1eZa+JY5dctKtdAPzg=;
        b=Xd4F1QWdx4sEIeoDN/+popoCUuRvOKe76i9qFA57t3qXODGAEiEgJ6k148iszfOPr/
         lgXChACQ3EBhfuitHSGNu9SeT3XXQOqzX9ygOh2RKhSEmyL+Mh2PYEXzfTKX75t1YCXR
         iRGBOJUggLJDPxbFKy4nNO0J+x3sPbsIri/pdTNFusNPkSuQyQNsK4nnq9d3ncC1k3yF
         9Q2zcFhx5ziaFpnpXygNc9xcTtiIsPT1hnmL9B5YA31mJhEEmKnM/qXjKLSjPSOvtWKK
         Z6exExCy+F6HUunCam43Zo7WtEnNzhhaP/YyeeoK8RXjgRTGpswTHkizgrZDd53pirpm
         rrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091833; x=1786696633;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Aa0XOZmSfIfd7MTfSKuapoTZ1eZa+JY5dctKtdAPzg=;
        b=b8gFlGzpRlJ8fYLerO9n1KH7FwWl7zNziY5OBZMN2PWkSpZYgS875VONdFSx3HqpmJ
         bIPWuj25AMsUaoPAGthaN/GgNpQpHC/pBiqIXYl4q7TkqMPjOhODR43YEjqj/zW3HwRm
         FHnzl1oPRSDCZMmycbNyQHd+CV++BPsTfiHb/+OK5jK8iAi3OWnVJYMFI/q+4EFGAQ9C
         7SoUii7GtdI3Skvz3waV3M9mYLpvr6wVmeCG/8Lo+QDFef9HYgjPIZ3qUJJiUM54+OJl
         PcMwn64INzhNLrkR8atnWDeSjVv7a/kzbhXSIBECe+XQ7h5v3n2H6dYEqTS7bR/p83py
         Em7w==
X-Forwarded-Encrypted: i=1; AHgh+Ro4tYfZvHGS6dHdhymLZMcgYQCuFPEZXiJcj10PoMdHZDhLfVQi+epKUvhbvG+QopKA8EzTF3gucCcniSVrdczl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ygEidbPl3P1AxiW5ZtJX4BpfSrjobPM9bjnl9jZFg1X7RnPo
	JsKneo15aWpoz25fjfpELPN9SCdXu0y2+uOZOqju84ZsHz3oJSYSwi1GIk2nY8zzKS8=
X-Gm-Gg: AR+sD11TRdHK7WnW6bBpLfg8S7V3VhmOYeab9rBlTsF/FJcU8Z1XzE0NNOZbDqfhEFC
	JmAVWzw10h5FUVHgb0DApXmIuWU8rzAUvTgaiRS8OC7VjvEchBS7B071HEOPs9+CEDwJclMJ0YR
	sTVlFormRUIAORKWvzi2qViac8tFijMBwgjkTjKe4foeHMgYzqgpiHnqDr8qRcXJQ6psk9Je3+5
	adtrfga6osfywqOh50TlQVxSsj1ahTh3L97PGNoFYK9zTlK4w6B8G3NBhwHxDUEI9FHI7oNFgh0
	7CMfPmRnSZdP2hlFnz4/18RgKaxQCM3uaIAiEEL8AGd/W2LbDz2GcrLLlEcEC0NEKea2+j4e7+3
	AIAc9Io43jQEb7A1O7dgPfhshLQf8vqxB2NNrs3vlQ0Z22+T67hGO2xR0MywC2RzBMjwdc8pl86
	SnmOEVNX3CHWQhV6VloF1OOXVD/QveUS0lagoqfviMT6rWduIDrJlT8YPHwTsZUpfJ9e6zXUk=
X-Received: by 2002:a05:600c:19cd:b0:498:28b:1045 with SMTP id 5b1f17b1804b1-4994e793f63mr257933615e9.3.1786091833285;
        Fri, 07 Aug 2026 01:37:13 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:13 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 2/6] serial: 8250_aspeed_vuart: add
 aspeed,ast2600-vuart compatible string
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182922.193353.8621406142541186098.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=299;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=GGZJlZzLfev4HdzTInv04JY3/Vaa6A3FvI60xmArBaQ=;
 b=HyICfGSOOmuh66kJTlxZqHYzoimh8x1WZTAAHnZ2sbtvqD6Bz0e7JwNlt5sEHOPp9XSolfUBZ
 4LtUL1zC+S6AO+F0anHYOAXIWc3YKWwmxlWPBV3bzebGcSeZmzvR0I6
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_013716_131624_E1046785 
X-CRM114-Status: UNSURE (   7.13  )
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

On Wed, 05 Aug 2026 14:19:49 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Make the driver compatible with the ast2600-vuart.
> Enable specific configuration for the AST2600.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>

