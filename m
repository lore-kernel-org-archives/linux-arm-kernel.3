Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E4AD4A5E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9plVu6awmElwcj43jJWhFcDPnkRrV2uQo++mo+YHKp4=; b=NEhJranxTwJM5v7s9oDI3RwB6y
	QpCk5bYhUCrWdF/R8Ye0zIBuUhPZWNq3YsvVxHs1Md94RoXdYH1F+7UCfXotO57l2nYNIOWSJnJ6p
	m/KoYBLGCoa39HK346FJDK9bkxsZnZzeJVSu0pI5wfnbgu/bS48vZ/Kbr481q7PFfQBDab1gCQVLs
	3I3DXpHg9FN/KAixnog8fxDy/lEY3s7LwWN1dki1xv71P6l+gbDN2dx55XNKSWw5IPnrfbaptz/Se
	7FxBY2NGv9QwzoraiQ3lJRu2W0lLeMRzR/klg0pKlajx15pN/lso/uba/FW1e7pKnn0O/xZxsMLX4
	FXQsQllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZug-0000000DUJo-1C0C;
	Fri, 16 Jan 2026 02:50:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZuf-0000000DUJP-2XTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 02:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B4D6016B;
	Fri, 16 Jan 2026 02:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC22C19421;
	Fri, 16 Jan 2026 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531810;
	bh=9plVu6awmElwcj43jJWhFcDPnkRrV2uQo++mo+YHKp4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i+LSQMZyRjO6xFTOhFH7DiQPavwQdNcWY6pQllyzHyH2QCl+ZB5nSVgrurf2wno0o
	 U8oyCyegAJmvzNeEnfzuFRYYDy2mxPSy/OUqurKq4JSjfIk5X3mvxabJfTNR6A9Fy4
	 qtZ5XkoCmpUcLR7/uFCGTaciyp9NVJNLTKnuIjUHZtEuI7qCnuXpwlL8ejDyRP23JR
	 pNAjlY/UrhM/d1iC2nQSu9EaTthsNL1GznrCsXVoHLY46wbNcZQqeNXE36u0pkUTE8
	 6CIwdgPzeN02iFyFhY6QIx8g1x+5do+QywMcfm1/6EfvcBORNMIndJHGYqNfboxeC0
	 +Cx45gsv2e9fA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: lmk04832: Simplify with scoped for each OF child loop
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 19:50:08 -0700
Message-ID: <176853180892.4027.3113144416442406501@lazor>
User-Agent: alot/0.11
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

Quoting Krzysztof Kozlowski (2025-12-24 04:22:40)
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next

