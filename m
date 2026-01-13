Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCE3D29DC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 02:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rFfXODjCRVHA3oXyZnoybHJItYbj+O62t+8u9pd99Xw=; b=UWxWGFMT38yQXw
	wHZ01bJb7qY4ZYFvgDyT9oXNsWne+oUDB0iQvAr9GMLUCohcVKudJu+PpWwpJ1DqcyOW2kSlNjve1
	RcC29g1FdTD9XuaueJa0XY8QWPExy6Q4NhzK//LAAjjG+7rc7BjBzRxC8iGAQDZfTVyI2UMaKdGoF
	BanO5av984vA+CW54BzApL3RHAaV6lwx1uxZ+sOpzULhuBECQGZfx0vxbGDoElSTLiXUqnxXCx834
	3dt4d0fQYSDOs/jj1x4XgQ3AsBYMAY5N1l8XJBLWgD3E6lt8s+CM1JrBuIIFadyDQVuTdDzCFM2Sm
	6OINe0Vgltn217yHQ6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUbl-00000006SWC-05qn;
	Tue, 13 Jan 2026 02:58:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUbg-00000006SVb-01pg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 02:58:09 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so1399814b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 18:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768273087; x=1768877887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFfXODjCRVHA3oXyZnoybHJItYbj+O62t+8u9pd99Xw=;
        b=Kk04knuFJ1CzmOwYQSMzK9PIS/4buGJKh1GagHuFaIagSie6T8W7sJcHUXBB5P+x15
         e7LMbdrnfSeyUvI22Uu4f3wN3QSZhXjCq5wZ2DsbH4L4DlZ8XkngQ3jGdhgT7MP56IZD
         V76P8wc0yB9D6oA5DFIilaiaWE9BQRqI1xjnbxOUMqeimrLF42EdJ1Siol/tNjTdPhNK
         jpsP4eIascmmzQxwYQA1XtSK7q9M7wp/KfmnlPPPo1xOs9rnlJwQhB+0tg0iChC3wRKY
         3/FZLUzSfd1TvCWwlZUda18l6db6OQ5Pk9eH+O4Up5AU8ycyHUsjuyVZK1nbpo1paBRA
         jC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768273087; x=1768877887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFfXODjCRVHA3oXyZnoybHJItYbj+O62t+8u9pd99Xw=;
        b=AhQLbKOmeNz8Z5viCuTzRCWfoCMlbG5mBLp72J/90Uh877NW3He+nzYQinsJwdxc1g
         8LlQzJiAfmWTgge8A+GnY7rCGtd6DX7P/o2Y0WuEBfTr08QX2o/WOL6iXDYUPagFhQx8
         EWXoi1PFovRcywHbFyde5Nes5BC5nRn9WPZNYAQWWoiaclgLdtifvk3F4Bk6uqaNZhmI
         q2BVQa3aYfFqD31/DKETwBBcp7FHjW9bVrjGN6paDpgdbd5zvcVVwj4pi9sPfjRVbgQy
         r1QqBS/xTxgvU6VCf6I23yRYovfK4L57cWVgEkNiAnE4D6MRUoSQOarmIcjtp7mrdi1F
         tcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsDR0/0arNH22Z0SAyzvaebbnWEcHw0l9w6N/mB3LELSudL1AebH+4gnzl3RXAmMoZ7DoqXmQtYyGA2qFAWlfB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4LDoVo6PLDIK22BAsdMRhh2pxMDxFJajDpE7fLPs0PZ0RENIN
	JI+cVhRrPv8GjVU8bB0NIJ+QgmJJsLJ6RSUniPMJTZZ5nM4vIgB4PFoL
X-Gm-Gg: AY/fxX4mHA1aKr1ijaQY01tWT/rp8WAQl+Ujdsmx8F83PRf8d1gq0/mZy78ba0WU4yr
	fZTe50CkSvMXjC0hlK02sywqQshW2wWknaPI9oPjZth6zr008a8q72pyXpqOQzUKNFsAKZ2bAef
	MpT13Zdi5UbOmmrM4uMXTTq9PVWkASby2nOyWKSTeD+Wrnr+YbH9HRQVuIJB8s8uF4W6VuftF7l
	L4VhIVBnBxWqYDw5PKkRAmMeTu9aK8/vhbqyctQizuKC4P8WjUgY0xvl5eDi0GvXwaDuaFMEis/
	U7wkAvD0NttqnsBafaqYhTPP8US/4mN84vD/dA4U7uIThvb8cceX+LwLxBrwGoa5nBLKo4ZZj0U
	dFAlnbuttSFSGEkoac29t65gXRYGYnwZpTouIXsFYHhlmYhmDF91CplJkF36kkIAJFZOln0G0d5
	3wkpL54xqzd9CdaDDdY/m+yfaj54Xt9V6WP36fXoAOZJFrtKtzTL0=
X-Google-Smtp-Source: AGHT+IFGjSWJ0/N/jssuSA4G7vWWabFAFD8WCwkp8/+SFuj7W2uo6HpZBUBUR8JLjzWJaFq/fn4bfQ==
X-Received: by 2002:a05:6a00:6511:b0:81f:3c34:fa7a with SMTP id d2e1a72fcca58-81f3c34fc14mr5522589b3a.39.1768273086884;
        Mon, 12 Jan 2026 18:58:06 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm18702724b3a.31.2026.01.12.18.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:58:06 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH v3 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Date: Tue, 13 Jan 2026 10:57:57 +0800
Message-Id: <20260113-ventura2_initial_dts-v3-0-2dbfda6a5b47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALW0ZWkC/4XNQQ6CMBCF4auQrq1pp9CKK+9hDCm0wCRQTIuNh
 nB3CytdGJf/S+abhQTr0QZyzhbibcSAk0shDhlpeu06S9GkJsCg4ABAo3Xzw2uo0OGMeqjMHGj
 JylqAUkbKgqTTu7ctPnf2ekvdY5gn/9q/RL6tf8DIKaO8ZZJL2aiTFpdu1Dgcm2kkGxjhE8l/I
 JCQlpei1oXJmfpC1nV9A5xs8TL9AAAA
X-Change-ID: 20251222-ventura2_initial_dts-909b3277d665
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=4g+wGXOzU9O4o728wxdzupLqoaY0H+UaF3VynGflQsc=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBpZbS7Nwp6cSSumZLmoON0Cq6yF7x8Kf26aO5sX
 7TAG9KFxv6JATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCaWW0uwAKCRClg0K3CVbE
 gUylB/42ekjg9KvH3E9Mz9qnzsc0txXIwLQK/t2U85LJDsO+zMrJXCUonA4apS0nQBHnIGBUGS3
 vZpHn5wrjMjRau6TfaRuDKcVvdZBKGYjzU6OKKW1mAWNGLAgbC8MnDyUaUFCiruIsPTPcYjyuoK
 dbdXv86abQbgosBL5rHdkOFfqwyz3iWpSjI31GlFbQc28+76UpLe5Zm4QcSJn1wJgtWbUUp3lZq
 1dIFTQP1glVTi3VqHrpKj1uDLC1QZUzumV2A1SblHgMBoROx9qxOO8ofcCEtQ1TgNZlUhnxrJ99
 GKFKECn8vOMN2sHZqoSlrh2LV820xgUFcyNlkk3SLfUPxfHu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_185808_107929_2272775F 
X-CRM114-Status: UNSURE (   8.99  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Add annotation for marvel 88e6393x
- Modify the gpio-line-name
- Modify the node order alphabetically
- Modify dt-bindings document for rmc instead of bmc
- Move the gpio-line-names to original node
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com

Changes in v2:
- Remove unused mdio
- Link to v1: https://lore.kernel.org/r/20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com

---
Kyle Hsieh (2):
      dt-bindings: arm: aspeed: add Meta ventura2 board
      ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 2874 ++++++++++++++++++++
 3 files changed, 2876 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-ventura2_initial_dts-909b3277d665

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


