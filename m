Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078BECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zkrx1I0KHeK59HCjuGuKLaSLiOWoMbbq+JSXoCLeD00=; b=A7AmlBEWNvNbmOwPjdMPLbWBlp
	1o87I/mRP5IsIl2++fU5oNyZtXWfa+3WbvF3iM4qYEc2TnbSLCmVq/8jkhEa8eq3PERiG4uq8eb8F
	sE8nOAmGbIdfeHWQbxda0aMAz/TVa7zABqueVljJ059vqMz1xeYBdJB1IyzoajNTi2ivWWyzmJzE6
	atHl1bv1W6FsZzh8LT/bk6yRihCXp2PDEtZrlhDDjp9lyvA94FB6saqeNUEM/UJUZHHPTSwlyrMHD
	GeeTMdhGDh4nVacJAp8eo72Uulit8Zi7uAHf/SqHOq3iyixdwBDN3ITic7AbBEuPeC+A0FcnjGoY3
	kE0VQJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfxq-0000000A5Xq-3T4r;
	Sun, 31 Aug 2025 11:11:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usfjr-0000000A4Pm-1O5F;
	Sun, 31 Aug 2025 10:56:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-327a27e0d6eso3733270a91.1;
        Sun, 31 Aug 2025 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756637806; x=1757242606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkrx1I0KHeK59HCjuGuKLaSLiOWoMbbq+JSXoCLeD00=;
        b=LVY5sV0DwA64LhTgVBfGFcxwNNZxc97CxZfAlUQ2MAh1hhklMfUSy+3z+OpDX9qbXR
         WQUttFbU+nyZ+gU6LunYcWnRMjWy/YaZQBrG17gAtV9qGtC0vAKCsgmhvufJKmKia1io
         xWUNTK8u3u9En+5zQhawPW4DZQj1ojA9+EXk6vnrsHc35zEQ5SxF96y5J3ozai1HGXVZ
         K1waLcSH/st+uzXYleBj4raxFQC0dHqtZZ+Y+HP5R6g0WviyGnfFoRXpkG8mskI0m9gR
         w4wbUxpiGhfqrU1OeL7q2B0wjUYXTLIQMu6c3DBcLQ4kDphk+ak8AexDPnuv3PJu7ffv
         d4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637806; x=1757242606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkrx1I0KHeK59HCjuGuKLaSLiOWoMbbq+JSXoCLeD00=;
        b=OhzbDbO5/9XLxefvAGwU8m54kSGakwr33Fk/vY00XRw+YDWUM9ZYUjkXWrUsNQaLyR
         d5W32BEYfEe+McKyvAitPGbEmf8Vw2+DeMsa8lwU2sXDSW+MqXLxvuvAvRz0fqt2Ul80
         RfBUtw+5jnZZTsrwC6dQ7/R8wg0tt5W0GoZ4G2kKlc4aRbXRWw1T/5EFAm7ZEegXoPFQ
         CjVUz8ELPgOrP9n9J80Mcr+aDZ6Xuz4FOhA39n3gK4JT8NfF1KbQw7uUJ14E8PGTluCy
         +J28RvGGp9uaJ/tlA/d+kNvt7T4WJkYld+3CJedTRs9DmrQtjH8np2xWvL0PfyZR65Sg
         ZfEg==
X-Forwarded-Encrypted: i=1; AJvYcCU0qAxl38Nd5bgm3Z/fu+nN5TenYnf24b3MaBQlThLPVZRgdN3326gAIR9Ag6VAohYzYa5Sjsx/SCwK1rELcKY5@lists.infradead.org, AJvYcCXH00oHUP5f5JAf54fbgKh2Ro0NwxwLPMw0zcgKkDtIA+8zYnfNAibHbCY2TKQl96NMbb8/RMqOCf3fhRUc2Js=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjjuhQnxopzUorfp2vkQRt2j/KFYENCtHd7UU6jFpci7M+z+3z
	2lN4BRUOB0K6MNgl9KfWXyinbWAC5gr9dRxP/6MXuSqZrG6BK7kL+5pN
X-Gm-Gg: ASbGncukZU3pwQV+rZeLOc5L+5G+nfEWeMBdH12xWuwFjHUQpvLpQ8SK13N2mMa5MCH
	ItMzbra7AfZJ5Uhd8TkBAqo6zwMtQ6Wm/3iXtgLLwnfHMVeQHtxsk+IZ7f5EUK9m6v23UyXeGy+
	kmyChtyBgLIS0QulNxHOZBUdJs4/9NRnZBVIgJz8IjtJXDLkQsQRLYRuNNZwB+CIxhik1Z8wkx2
	nvRnTOjWUBYck83g4/+14pGf+2RBgHhULfrxyv/eoIjUx0RxUbAd80ftz5iKoSm4fxmZsJai9dY
	RSXEztZvCjiftopmdSkOd0oV1+Ubr/MhrSxfL1SRRTFpxUzpxi7dBTBRADSxeuTL+8ZstAzmod3
	NV7n4AEiXqvpkJcVBVVaLfJoZWNiUYGKAZ3MZm+vYMIEMTxLaAA==
X-Google-Smtp-Source: AGHT+IFKpeplLh4uLrvMk+zHJGuhr3o+bHub20dAlEwu8c3p/nYRP2DnhcBdxHUgO8wMnVubNgDUDg==
X-Received: by 2002:a17:90b:278f:b0:327:c9bb:be45 with SMTP id 98e67ed59e1d1-32815414073mr6055958a91.8.1756637806467;
        Sun, 31 Aug 2025 03:56:46 -0700 (PDT)
Received: from localhost.localdomain ([240e:478:1c78:352d:7cf7:15e8:f0c:9846])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd3669d76sm6638260a12.49.2025.08.31.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:56:45 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Sun, 31 Aug 2025 18:48:51 +0800
Message-ID: <20250831104855.45883-4-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_035647_366302_029ABCF3 
X-CRM114-Status: UNSURE (   8.96  )
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

Add a clock id for mipi dsi reference clock, mipi dsi node used it.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index ebae3cbf8..b951e2906 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -72,6 +72,7 @@
 #define SCLK_SFC		126
 #define SCLK_MAC		127
 #define SCLK_MACREF_OUT		128
+#define SCLK_MIPIDSI_24M	129
 #define SCLK_TIMER10		133
 #define SCLK_TIMER11		134
 #define SCLK_TIMER12		135
-- 
2.47.2


