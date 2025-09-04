Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65529CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btcWU0VuzOuAgLeIG+yfqqa6yIJ2YjDjsE9sHz0/HqU=; b=Ux+QoHHdyo0faU3Xfb82v0sq9w
	DraOYKESpkbnbbdxKs6xKSweMn+mbOn0+cgFiAczl6HzFijiNSpVMMWTJzyU1+iQlFnxiPfmhgdAK
	3G1z+yZBiHa3byZ8bBZ1v2Z6TUNoGE+9HIpE3/+WKpMf1uYFkYRg0VoRy1tajORN1zP0IPmwdWGF1
	XXyq55JcTcUdZ+fgm7MVUZ7p98aIbHI3VdqRwgk4MXNtR9NZcilWJESDN4DCpcqQfBLUdSQcpqiNG
	YGJf4n0M85Ew3ZAGYjiASDL0+B5jw2e0eatP2psNcn69bJVUKub3Yokj2v2T6nId5po80xR8wkLVg
	vcPs3Pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkc-0000000Dat8-2f3N;
	Thu, 04 Sep 2025 18:32:02 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAOD-0000000C0tU-3W2l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:52:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-61c78dc8b12so204106a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993956; x=1757598756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btcWU0VuzOuAgLeIG+yfqqa6yIJ2YjDjsE9sHz0/HqU=;
        b=SjZ7wWTQzHck+hBIhhkmB3CtfahqOYkQE4r/dtrS8kBgqQRl19t9Nq0PSv/R/iQQqZ
         gX94xNKMsB1JU0pA4W4T+YUZNEWarGLbP/8kXv6VcXCw1Xds7Ze0xIgYGL1derFFUTVD
         GpFzoF3HGuqm78BmRaMvC8GIu7Do+FBF86jMCIEbnbWxax4ypYfUm2MvNUEzA8Rz1EGc
         yUSdzRX1JfgKYgmxsRqiLvdshJ3y/PGaZVjM7y26EpPHuQFXzlZ/RPHsap+k61JHK0kZ
         i0cEgm+UJdJj4DGrAp5qfL4eIKCBSKYDae6ITy4oEISI7qG+fQmsvOfvE3gmexhzgPcl
         uPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993956; x=1757598756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btcWU0VuzOuAgLeIG+yfqqa6yIJ2YjDjsE9sHz0/HqU=;
        b=Vti944LvkeuhO6lvSnzXUS/Og4jjHC4i88YBBTiItOnbZl9OpIKCw2j1xF9b5AiaRI
         hM/u62371t1djr/uqqjETKKCy7O1bwstPPY/BR9HsQj659KqJgUWiI5uSa1rSk0CLxHu
         wIykWrohMyxY7cOY9aG01Rc+ff9cSYVgGmqG0/aFLAEkghuHpMZPtf+pCh0sYngY2sLm
         HE01NiiSQtMgpkyZsp/NOB06M3VaMKoeUB2hu0DqBZTvpiH+2DlM1Kmjvyt+WVLlm53z
         z56zprBU+gFI6xMFfX360ZEFW+7PDQedux+U/4R1bHVgqyKg8GxVdc2JX68D1sW4CwGA
         jMjw==
X-Forwarded-Encrypted: i=1; AJvYcCV913pivZ/wSwg4lDK0p4kt71qaXHYE+JkfISZ2yS1eHRavhHjrw9+CPQAVhqWL1l+QYXuTTgnq6aiC7TRzI9sw@lists.infradead.org
X-Gm-Message-State: AOJu0YxOG3Z0IA6Tdunim4usOC/MfJ+B/uWetArk6MWfIJgWc4fxwIrD
	xrkQuiNdjr8jny77i+0loViPl2LhLX/RYsWzn64G2bv9FHQQVBIHT/SImhD+5K0xvwA=
X-Gm-Gg: ASbGncvVrn7f+e+sEKIoKFyrmzwiW78Za5E+Lp/+TJmb9OZCWpnkwDDqvbdji5YsEdS
	8XJ38oTNAZ+zkihG1rIpBRhyV8AlpT9HjYpn/O5ssoh/N7CIXpZPEeG5cWsH2IsfH88HXcd/8uN
	x3N/kiOn0dthlgJY+7yVbWgZgfDKEaACcEkl6PXm6FISd/rIOH5INjCgID91KmJMJybCfjhlWwt
	ABMde8py0M8XNJ+k8b16/vy4g5ZszST83HHwN5RDyCtuj0cp1O8Y8V7v+C0B0u8Xiq8Et/77nA+
	mJ92lWfYd3HtapwENsQnzA6qM2sSggtdY7AELHNtIxmANNuViiT/UU1XnMgTk6EI+7kM6U1gSOd
	arLAH30kTSWWu31rnwlmwRQSn2qV0a2p9ijTHUGZp4WYF
X-Google-Smtp-Source: AGHT+IGxy5J+mJ4+0BEKnBNp9VUSoH6e3U4hVID7ehFNf4mXYRzdLprSxcjyWEkmC59UjmMtXNp89Q==
X-Received: by 2002:a17:907:3c95:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-aff0e28a1demr1113990466b.0.1756993956037;
        Thu, 04 Sep 2025 06:52:36 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0a591819sm1510983766b.41.2025.09.04.06.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:52:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amazon: alpine-v2: Add default GIC address cells
Date: Thu,  4 Sep 2025 15:52:29 +0200
Message-ID: <175699390854.173213.4164297632935011607.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133423.312621-3-krzysztof.kozlowski@linaro.org>
References: <20250822133423.312621-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=mTvDTEmCZQDDB+2UJw6Cuuz2PPTXZClmk5Fcayc9wdk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouZmdjVXCiwMI1+8HWYwfY1OmAqwZX2PCuS2Am
 qQA0WNGfUCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLmZnQAKCRDBN2bmhouD
 18nFD/4hacdutq3aPcL/HzldUTkzIr6fLTPd2jMXK7X8qFzeKNFn/bNz+4kXuslVGJM6usDAVEt
 5jaHH2au1HhjqLKmw2m/hHr99ir1A2ttA5MjC1ctaY0RiaCgtyzEdSl5I8zb/ZTOO3YPZ+dsTzf
 pEcKOYUZ7btniQjURKwWK2qtYtbFKvYwgySWtgABKFb2VmNeBTvJs2q0CZat/vFthELkxT+kg2z
 4zisVch7q44u7Ie11kav/Vla/Xfh9eN1iNQCfiw4N4YLrGMEQzG/WaaCBLh6V5+Gq1AadcBktar
 yAyMejJCQ3K6WEjqkRmIhjA6PTNysuXY7iVib0xHWJmfIUTU60KbzMYj7bxP44cg0K2Q7aASStg
 KVO/cS2daFpwl5Fb+pNWawtJh+gc4FUZ2mg/+2Cxrsq3fCblNh7V3qkNA53a0XSqskQPVVfpmXT
 UQquzncilBE9uTFzMVFnS4lAWI6U0maKBz5dvT6mjxL/TQC2pkaX2kKt3MALv1rL7kvfYZLuJtt
 jbzlGx3Aosy6ad5dLqoueG7AGOoyyVa/S5i9fVhYvTTuqeZHzRwkGAyHJDMciP9Zkp5NP3IhY0m
 ji8P6sD5cp+zvFBcNiCoE6hPzLWAhLftpgvhUZQmYonzz1exI8oFxLJHaCUZSh+7rxLkEg2Ci+L x9f85n7Uf9JpsbQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_065237_879887_3A735049 
X-CRM114-Status: GOOD (  12.35  )
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


On Fri, 22 Aug 2025 15:34:24 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   alpine-v2.dtsi:138.4-139.33: Warning (interrupt_map): /soc/pci@fbc00000:interrupt-map:
>     Missing property '#address-cells' in node /soc/interrupt-controller@f0200000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> [...]


No one picked these up, so I grabbed them. Please let me know if someone else
wants to take it.

Applied, thanks!

[1/2] arm64: dts: amazon: alpine-v2: Add default GIC address cells
      https://git.kernel.org/krzk/linux-dt/c/b32a24f21283fbc86922006cc7d19fd23f70b8b8
[2/2] arm64: dts: amazon: alpine-v3: Add default GIC address cells
      https://git.kernel.org/krzk/linux-dt/c/3d1963e503d752ba33446ad056435c687f6d8d83

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

