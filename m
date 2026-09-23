Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56638C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ctpe/eDRlFVbZnthdNX29MzI4lYShyW2hkRWR1MzG1k=; b=CR0FSG88Xv7i21ShW2g6Cw1ki/
	NnL6nhySSjOm8N42G6ufBHfTFxVHwA8+ve3Me0lQczQ7829jKWcM7A299EX+iJfIF8t4SxsRin3+6
	lYhjilOWTqvICToMm6hIh4i/3ho0PGkMfkZ4qmrRIndbQxubaBK5gkOyKjmnzh90TT5JbmQfpPcOv
	CF/jW/TcAYL7ipIuYSkJnkrOQopHqv1J6mc5tfM54LwwjMx2vkQMSu0oxxELa2mV+xyuj6z+f3CQW
	WWlX8oRWHTFMwn6aM2iwG9RG4ro+3FEeVx0xwam562EqYy0wIZZenMJXU37ix8foMcJfKH5N0v3MK
	UKbOHe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Neg-00000008Ur0-2tqt;
	Wed, 23 Sep 2026 14:09:02 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nec-00000008UqR-2Ldi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790172521; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F33g7b5uYY27Q/HKONhzqRoX1yUZngW8GLRy99QeATGs7iVLa6fXFXFp+bmphC2YZ65T2wOgeWVDVXReGszvhdESQBIL5SWn9E+vGgzhX2CosPnkLkv7VkczfP9OK/gmNuacDdKoXFF6KySJab3bDZH3rZotX5TdXPLalF6lCX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790172521; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ctpe/eDRlFVbZnthdNX29MzI4lYShyW2hkRWR1MzG1k=; 
	b=HDaNTViRqXcfimQKW7Gkp/dOXuanyH9mP+muyqnjCYgnCZBesP4BiMPr2P2HTfhF7qrVlQig+rCWw7FBxG99AOtaHMD2WBq5duxApQHWIculYwFfaNw6RknZYMcfoKhuIjuhrjLMpPVqidyh1bCoQvsBVjzW5j9OBQaHii/LHAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790172521;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=Ctpe/eDRlFVbZnthdNX29MzI4lYShyW2hkRWR1MzG1k=;
	b=RK6rMu5if1UbA5uX8z+2XGVInBdJp5M94kYTk6BurTgShWL3qbYSj2gIirk1b0ym
	X/12L8NCQvCdkpT2l2rmrnVAduQ69ZVSqtKoGEZG4du3SGql67Q6BS0oqWIs+YZKGqw
	BgPEUD5zcFVmDoOgqslEaUVdTenyC8WmmpPTD+yU=
Received: by smtp.zohomail.com with SMTPS id 1790172518026689.0899152113249;
	Wed, 23 Sep 2026 07:08:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 22:08:30 +0800
Message-Id: <DLMR6Y4BCAEJ.1QOAOOJRGJIN5@pigmoral.tech>
Cc: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Brian Masney"
 <bmasney@redhat.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider
 clocks
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <andre.przywara@arm.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Chen-Yu Tsai" <wens@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
 <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_070859_822296_C8077D40 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Enzo,

On Tue Sep 22, 2026 at 4:06 AM CST, Enzo Adriano wrote:
> Hi all,
>
> This RFT series has been superseded by Junhui Liu's tested four-patch
> series:

I just realized that you had already posted an equivalent fix before I
sent mine. I have been quite busy recently and missed your series, so I
ended up posting a duplicate. I am sorry about that.

I will make sure to check the mailing list more carefully before posting
patches in the future.

>
>   https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pig=
moral.tech
>
> That series implements the M-only and P-only clock conversions, was teste=
d
> on the Radxa Cubie A5E, and has been applied to sunxi/clk-for-7.4. Please
> disregard this RFT series.
>
> Thanks to Junhui for completing and testing the fix.
>
> Assisted-by: Codex:gpt-5
> I reviewed this reply and take responsibility for its contents.
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu

