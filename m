Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF6C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 03:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4MJ41s1A142NA0JHBZhNkRWVOos7geyDm2w5okD2k8=; b=Gmm50C/A5T3OUW/CRiNV1NDOEN
	iEk8RhRtUPaqF8r/WvxYlz86PIGdmYoPE+pf+Dbjk4iCvLZz8bE1FqAgmyNhB2n+a5EedM+8NVwjb
	7amoXXI40PrxbCN2QbAMuG511ithIJIeUUyj36/lgt8btd1xjnD+sDj7aSw0pdDWWFN/4akAO9cDU
	3ytSMvJdx9GYq+ulf/ZZ4nlodEp1mvHWfhyuTx58OZnrXe2nTDwuqrrBubPCpSEdeorEY1Vn1Lx0g
	ZHhcfjVAJTwOkfpXZrOhkoWfIpoFQnolreZK2Om8RTR3rGWxGIWvtw8B6DMnE1voA1lNZifDyEH8t
	YFSQjg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkv0-00000004x8m-1a1q;
	Wed, 30 Sep 2026 03:23:42 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBkuw-00000004x8L-1MNI;
	Wed, 30 Sep 2026 03:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790738601; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DLxbt0wzBdA7oOsZJe0gxhRtNExKFJvKWAR8wQ0uevpTE6+eCwkZS1dA/lRfCMfDk0qbBbdBCkR5C+1IphIWvOlCDeldToVlNVBSC9QP5dPvQgAlKUjCWxg0YkNj/jrsX7lK9w9/TdyTya3aj4duc9SoZqq7BqRYpI2rIXnkH/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1790738601; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d4MJ41s1A142NA0JHBZhNkRWVOos7geyDm2w5okD2k8=; 
	b=KzvEnW766lvKM/XqFTKKqGW/xb5K841xy3JlB9uq1LmOeu7d2KvG4gmMjTk8x4P637eHGEuZ4QpL8LHxno/PGXJMOfsHzHPDx1IJW2jrvnIk/T4Kl5z2Ti0YJrh85NvEoX7JKnMFWy+lunjEGYNt0/u1gqUKjq4tlGd7G4o5Xxs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790738601;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Message-ID:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=d4MJ41s1A142NA0JHBZhNkRWVOos7geyDm2w5okD2k8=;
	b=gLRaCq6w5Gt+xZSsaClLFHv5BSKqYRyajYle0VtjET/aZA0YwGKWDmCSYP5/mjmT
	Nho3bp0c+oZ/zey6lbezpwdmX54/fw09BqpBM6zj4qjmAkNrOx2mRJZ+8tm4YdHfhIr
	/0DRzwOuCJzx0MNedjqJeTXxqX3E+e2D52+rEhCQ=
Received: by smtp.zoho.eu with SMTPS id 1790738597782290.93273657147404;
	Wed, 30 Sep 2026 05:23:17 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: sashiko-reviews@lists.linux.dev
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add buttons to Kobol Helios64
In-Reply-To: <20260930030034.3099C1F000FF@smtp.kernel.org>
References: <20260930-helios64-buttons-v1-1-d76249064003@iav.lv>
 <20260930030034.3099C1F000FF@smtp.kernel.org>
Message-ID: <20260930032307.4ab95783e5ff@iav.lv>
Date: Wed, 30 Sep 2026 03:23:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_202338_692599_46341B22 
X-CRM114-Status: UNSURE (   8.39  )
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

On Wed, Sep 30, 2026 at 03:00:34AM +0000, sashiko-bot@kernel.org wrote:
> Since the user1 button GPIO (RK_PA3) is registered in gpio-keys as
> GPIO_ACTIVE_LOW to generate edge interrupts, does disabling the internal pull-up
> with &pcfg_pull_none leave the pin floating?

Not floating: GPIO0_A3 (USR1_SWITCH#) has an external 4.75k pull-up
(R9) to 1V8_S3 on the SoC side of D11, sheet 29 of
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Armbian ships the same pinctrl; with no User1 button attached the
IRQ count stays 0 after 29 minutes of uptime.

