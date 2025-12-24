Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A34E7491B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 06:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rcXUuHqHsPLnPcdJtfcsoHeBwUrBqqzkRj7ul8huktQ=; b=HgDlbzWEC0SLit
	jhdtUA4d6W0cBX5jr6vGJcU6RXnj0jRxZR9yuGfMpFCEyb+gbTs+h3PhmRa4gnU6MsQPHi6g6KUwZ
	U34Aanlt2JsA8nuHDV2Z3bJ4R0jIZkM5hwGJtDi/viN3E9LxLFionLCh0cTM3H4LVSYmUwEL6Oq2f
	lU0gx+y5+DsyC6yoP+M6YzmjGuLt6rH3sQTCW+RkMb3lWinG03wbzjqSsiCejT8DVc4wp+SrjD+qm
	VzmZMLjta1hJAe9/m6zQK0bnkGmQt+xnkeSZVXzdjQArK8P33U8LZO43g9q1gyRkCAnhPOXMso5mh
	x6vuryHBzXYWbIJYeKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYIc7-0000000GVL5-2HfS;
	Wed, 24 Dec 2025 06:44:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYIc4-0000000GVKQ-2dwm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 06:44:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7ade456b6abso4751660b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 22:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766558688; x=1767163488; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rcXUuHqHsPLnPcdJtfcsoHeBwUrBqqzkRj7ul8huktQ=;
        b=L+ZFYe7XRwep2Ym9oUGulcnxArjsEgy7I9JsDtiI/h4rN4rM9gNda79LKSfuB1hFLt
         HOHhvdDjACcpNiVlUk66NVSjbZPKaQZLCJMLvLgubq8ZMByJg13B4kmPsZC940wXsZlQ
         c1SgfB2kcm9pZ5D2Q2qxDowe59iZYxGfnufLFXR4mAayb+CX57ex3VzipyNbOX/Et4/i
         5CwR93wGGhKWmQjnwlBpeItxnyRFhneeVS9JrxFtDfhgzTTRLZO5Dfdkclx/ZOfrFAcO
         1nVuMDazVgJ9tBqae8VXqHIVNIxZ3MXC9UX+nskcdWTxb3nKx3EgPv5Npa21nefEjaFw
         XF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558688; x=1767163488;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcXUuHqHsPLnPcdJtfcsoHeBwUrBqqzkRj7ul8huktQ=;
        b=hUyhmZLWjgD1lbVlPmSJOHNwmv8ZBqTA+9vjy1FEWqBS+duDytfROKGgRwNncRyltN
         8hYaSFkdaW1SKlhuWQgsiWlLC+TXDXJN4p6EOuTOgU9N78fruLQ57DDGUDTV/vhrKZy6
         AYUsxHRNBpnIEXI6mg79xnOO3BfOZBdBTKHExXeEJVkSyuL8GZy51koqpQkDzXWxkqtQ
         W9IPMNM2i9PSBFWD/Vls7YjQEucFUYSDwBu8p5zNHbnNPa8SaKlf9AOlyEvxlrNChbF6
         Rii6dMi6gU0PYX1kAUlzktc7oifrUr+PmmZ2GpBgWu067htdRSN0WxWfIgUEmvqfAXH9
         QlZA==
X-Forwarded-Encrypted: i=1; AJvYcCVlU6R2oHgwpFsjord85FvZSa3Ereh2nvaG4HpW8/vOegrAp0wOGhgnLB18YDt9T8w+7zjuR8sOsd/rz9LPej0o@lists.infradead.org
X-Gm-Message-State: AOJu0YyK+ATBgKlOnOs4M200m5cLQT64G5yBo2yNxzuFamsOh1DWWVVz
	tQpdflSpJ47l1rQ9Aq0WXW5lWucnWjscWzUYx7PTsit3qsL3UJYB7pRL
X-Gm-Gg: AY/fxX4jsRBAwV7w0ggRfn5oThLmuOUxptcFVPsT+odATT8Hg4VgTVeZT73mHJ2XVHd
	ZA1guMt0KdT5xEeS9Fmvx+hfIQZVErWrCN+ECnQrGeG2lsbZkAgZjad8PWohFPwUdx8Gw8weXz3
	dXtGzSx9IP8Z/FSnAJlDPnoYUKmE6X9laMRkSHBb3U3WJ2BJ1KtLp1DXWDN1cAjQ7eQT3cO249v
	ks/257R/gG2tx28T6IoqV0i0YyM7DAu5jl1PJ9lZQbOhWGlExwdfyaLYYVFtCYgChBSx/GXvTTo
	dXhMKPfhTz/h3Rfkzf+Y/snhG1rSYTgPhBkPMNAHYrVPkLcA4j4kHVDwLVCArqrVRhGJ9mT87vv
	CrL3P8aPBPeNocH9af1en7c0IFZ5374qZQ1Ytdd7Zp+zDS3M+7CdlwZogXqtl05ts2huJ4b4xWi
	wVvzOHIkfTE50Da+5PLLxdZaTIgDnbsF4Iserdic4Dijj9XeRjxrI=
X-Google-Smtp-Source: AGHT+IFzM0YtWfrF80UVaawG2TS/l53Sn0EPeZUElG2pvPac2AyOx4/2qKIx+1lXLB+Crhek66ij9g==
X-Received: by 2002:a05:6a20:7d9e:b0:364:783:8c0f with SMTP id adf61e73a8af0-376a83d8902mr15918646637.33.1766558687573;
        Tue, 23 Dec 2025 22:44:47 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm8320864a91.6.2025.12.23.22.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:44:47 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v2 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Wed, 24 Dec 2025 14:44:37 +0800
Message-Id: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANaLS2kC/4WNQQ6DIBBFr2JmXRoYI9Sueo/GGIqokyg0QEkb4
 91LvUCX7yX//Q2iDWQjXKsNgs0UybsCeKrAzNpNltFQGJBjIxCRZevSK2jsyVEivfRDiqzl7aN
 GpQYpGyjTZ7AjvY/svSs8U0w+fI6XLH72TzALxpkYuRRSGnXR9W1aNS1n41fo9n3/AouFguG4A
 AAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=879;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=azZjw8PVAWNPZynSiyTzQDrnhDzBZBhZaLDnEbGQPdQ=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpS4vcWXtTW254mAtMa81OfMyOxzHujO8LGc3Cf
 aA9IBrNSMmJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaUuL3AAKCRClg0K3CVbE
 ga8jB/0fsX1Yn9czAf9jWr+dWRgMjd9p6K4v/4mIoZ5JgZA/ZU6vaeONX0vCj6yX9JekztiDk/p
 5NF+RV7z7JtqAJjgLhTTKYzkPprssM5VlvVz+UttrXPbG1rG0fDiI10eeFm0v2wWJJScAek92CF
 6GxiwS8ZAehRdFM5nYccny1p1xmmN7nlVS40qxO9Vc++MqeOGT/qr7aXefEoq35zDToi7385iTv
 TIUU/2r6vkAUhXZsFO9xB/cNpndZdx3URwituA094L9VFq4UNYIvE6mXN0By5tvez0E0M3gzCH4
 nIXJOQh0q1p0J5Z8WuW2YdRSNkTu0/QfPxDmOiCQj++ZMjAL
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_224448_678985_9877C928 
X-CRM114-Status: UNSURE (   7.74  )
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

Summary:
Add linux device tree entry related to Meta(Facebook) ventura2.
specific devices connected to BMC(AST2600) SoC.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2945 ++++++++++++++++++++
 3 files changed, 2947 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


