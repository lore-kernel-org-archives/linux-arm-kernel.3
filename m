Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F77CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mu+qDb0wZ4/740wrPzuhHEl3nsK31AADu99bFUEF+x0=; b=bz2wGohCHn4NJWiwmIK5focgDe
	B2c6TlhPR5Pg7arTDsEBcIegDwcHGU696Lu4jCCluovzSIETmJK/VaQ4XKP6ui4QLhsJnmOxC2rCI
	EqFjRjBk17hh3+3mZleWZ2w4t6+E+y82V4lyubKwd0oL9YMNkkqHYUvX+Vb9/1oOimmtsSKrpAw1m
	tAxmWtSbXY781e7pYzLPaC12v3bEG2QeWFNxZx6GMCReopG+J80wlcAjBPhq8Fmd8S3LGUh0FTOsa
	J5oYVaqZ9Mb1ejznkryukiMBMjb+K9yQXVqBd1P1reo2Axd3YYydNuIWqjOLCPZEAznCArGNF85KP
	FOQjQbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxP4-0000000DtbS-0lKc;
	Mon, 04 May 2026 17:48:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxP2-0000000Dta4-01AX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B52940B3C;
	Mon,  4 May 2026 17:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55D3C2BCC4;
	Mon,  4 May 2026 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916897;
	bh=Gn59W2rZKGmYdbBqCGg8RqnxgppGZjElxUC6lD8BqGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HfAZQkfcVirmU8V5cCQecXzwgkWEEpgqOunXPDJ10GZl1RN5qDfynN0VBOC/mDmcn
	 0AgRd/7R2JYROR2inqMjk+lDGVU1fHAjXgkAch/XuU93x2h4wrLKqosl2E83pjx2UB
	 EWO4gupewhcvk3iidpddamYOFpvJ2Bmlg22KeXS+HWEMfGiwowLNgfUt9777KLt1b0
	 BIiXSI3/pR8JV19cVExvK7ce0GzChWiXZAWPB6g8uzp7isHh3sh3dl9YSgkVhqvKMN
	 6XZwmkvpDFjEc/sWtYdNX5xnaibM2xjpJXLiiGkH28SC7H4AYzCHqMgqSUBQrnTN4h
	 aHTIBPm7SqaEg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
References: <20260427143546.3098519-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
Message-Id: <177791689555.723297.3718755834253737201.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_104820_068142_73F53C11 
X-CRM114-Status: UNSURE (   5.21  )
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


On Mon, 27 Apr 2026 16:35:27 +0200, Arnd Bergmann wrote:
> 


Applied, thanks!

[1/1] ARM: s3c: use gpio lookup table for LEDs
      https://git.kernel.org/krzk/linux/c/b64cbd3f5d96b143fa9f21d84d381b1bb286339c

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


