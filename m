Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED3CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjr0EJXcf5fpGgfCYEE8UvjJrrggHpGu76Ud0Wa9ei4=; b=ouus11X7H4zqVCpW3r8l0bXUSX
	9MxdjLGADidQ7X/tYQ2yUaaPH9pxTubQyRj5lJALPbTWm21mZ3FSXfgYPssJ0OLjf6fbeZVgtOHxY
	RQGoe2cSGZ1jbYNwSy2uhJfNE33sqaAOHLtbHjEkvzjpFfdFx8NzT57RExf5KJ1NRuVLubFGp+zfq
	1vNxMyC+x/zyRJbWUkT2CgznSWiCvabVcGLUwzUXDI8TCSg4xNmmNuiWedKH8m10RGGXa93pQ0Ysp
	PGMjv7SwxDJ8FipgeGlAd9telAY9RgucFrI1Ue8Fg3slAfJMDCyYw4LOs3pB/rIjWePD0GKNeIcQK
	aQEs5WOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIP6-00000007fsK-0ddp;
	Wed, 10 Jun 2026 12:51:32 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIP3-00000007frX-1PJh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:51:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id BCC4EEC01CD;
	Wed, 10 Jun 2026 08:51:27 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 10 Jun 2026 08:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781095887;
	 x=1781182287; bh=mjr0EJXcf5fpGgfCYEE8UvjJrrggHpGu76Ud0Wa9ei4=; b=
	ADPwV7eHz6fcYGs1wkZRZgweMUvKqsmngMjiSNqaZXk/FDt21VXVYY5VV//lOYu4
	UI1mbMcpqQse9raUQESn5x2VUDPQCs4vVkY9UEVJwvG6qyXfQa5c9lyOsl7E4KNj
	2ZXiusVS7wiK363155BegUeAwNT07tHtMa16TY9UN1Ak0zFVKDo7Ni4oVHMkUw4D
	X3i4strVI1Kf4z1ZwoOI9NG8GuhWVWJDnNo9clR9yiCsXwv5+uYBLm1MbbrfeE0R
	bNqAgZU44GFYoDhnkxYN6GpUT3LPxUzgiWwTOU8eIDKzBswiNtxKnmH0UqQCPieh
	1rGbnMH555gJRca1Zk+XkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781095887; x=
	1781182287; bh=mjr0EJXcf5fpGgfCYEE8UvjJrrggHpGu76Ud0Wa9ei4=; b=Y
	qRIe0dJnvQV6D5AetFv0/TrA3U7HLrvWqT/o9+lVmTartR0GX3ACempMpDgEUcMC
	NcQJWkpKjWmsNE5f1AqSO3MMA1U8A5R46OfOizhDFbWI1LrfyHPS2Mqs38JmPx5Y
	n33bS2wIIY8bk3WovAx6T0a7qWSuWscKSqzi/FzayRi8nPtf/IJ6CMZ0+Vs6jm/C
	3vUK51u2qKAMrIXSsZfOyeKSW7P2kEpWv+K8oPi7nAxygWE3BwbHOOxt+XtP+Gog
	LHuBiGEzZxQ97eEn9BhqXroQwOcGBgm2+frypKHNkThAT3iQIsGGe2GqEIXclIX3
	zVxucZN8TI8DRf3DUB18g==
X-ME-Sender: <xms:z10paitPqf4MmvqIubo_izMLuxIyyJVTm2mFLfVzto3M5hTydAoB0A>
    <xme:z10paiQraqyfGBTg1-fkRTuc251kworeTC6pHoH8_qYDatRIPo3pQWaRaeDEdy4LV
    2nRKpW3T1qIDsNlzlX5oBvo5gSD2y-73IPkdGZqBjwK3lfUIINOHsD5>
X-ME-Proxy-Cause: dmFkZTFq2iEO/MoPXTyaGp2UdguHzuRFH2Rks31lOqsP0RqRUR3u8kgw8zQwlT32SuhXKX
    VOzT4qS110I3PiAJfbGsC9Hs/n6uakep8NfM7cDrSEnJ5iQgwtE0NqPozXC7Z+TcFp8x7V
    ah+4bCjpGWvJ4fz1G9SbSfqX1FPjoevYum9vTUc8JN57iX++KTe+Jj0gl9FmfprpVSDMka
    9z605UgXHTfp7m5Jym/yMiXsoO7/NS0WRfDGh/QH3fPkNEI7RHOzx550wQfIudOKz5S/2q
    fgb2vDXKnoltEgiNb5fgO6uFes249Zpgea0YVuf6WpItibhpVTakJPnsxSBRPpQ4nlV+s0
    ZX6IiP6c69+Rc5XigSTeEjGqXD+Uvf9Vg18nc1W2/0kFUstARkdv/bK8YzTXBSRgx00UgF
    C6d3AAmQrorzZc2Mr1PrdX1+SNV+s/l0rOg5n+xlR/q/3h84Lsjj2h7YbxtvkmTVGdBVHa
    21lUEl+65l7T4npJo3AZeIDHQSS6J4H4WnhWqRbKXOtTf82Tj4N9i5uSSCNILUg2DdfiFp
    l2GZTq3yzKhNrkqU3VkdSXwa8zDC4AGRF/YRCVF7msGg0TzQyHYdGGF1hx+o9xutwe6toi
    QbljgEgTqe2HFkSE3mj19I10YzVAj6sr5OQWIFVXQNOTEC8x4BYkUPlB2ctA
X-ME-Proxy: <xmx:z10parpNaF_Y5P9htIjVC6i2-Ibu7yW7P0bNV4ZO_A2bxBnHWM21SQ>
    <xmx:z10paq17NnmaZmNAV-JaoC3oAJSZFrumz5_YlFHdqzY_44I_dFLGEQ>
    <xmx:z10parmeNriMYSYMJBgDlBjyPUi9I5T_E1r1HcLiHDTcJrKAhTaAyg>
    <xmx:z10pauYJhuCnsCU7dHU8LiOdMGeuKsWl0Q5oYHdakY8aFDkjjh7jWg>
    <xmx:z10pakZo0q-H-mXHY8HYckiwxy5SyGqeoxCwiZ3P_m_mu9_hMydleO3D>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 43BD3182007E; Wed, 10 Jun 2026 08:51:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: APCtYiT4KAZo
Date: Wed, 10 Jun 2026 14:50:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Li" <jason.lee651024@gmail.com>, jason.li@cortina-access.com,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <7dcc8386-a0e0-4c79-a9f7-f63188bb997e@app.fastmail.com>
In-Reply-To: <20260610112821.3030099-2-jason.li@cortina-access.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
 <20260610112821.3030099-2-jason.li@cortina-access.com>
Subject: Re: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and platform
 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_055129_450552_9DD32AC5 
X-CRM114-Status: GOOD (  18.43  )
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

On Wed, Jun 10, 2026, at 13:28, Jason Li wrote:
> This series adds Linux kernel support for the UART controller integrated
> in Cortina-Access SoCs, with CA8289 (Venus) as the first supported device.

Hi Jason,

Thanks a lot for your submission!

I'm glad to see Cortina Access is getting back to upstreaming
this support, I see that you first tries this in 2021 but
didn't get very far at the time. The last submission was v4,
so it would make sense to cound this one as v5 and continue
with v6 next time.

You have already received a number of comments, so I'll skip
looking at the details for the moment and let you work through
them.

Regarding how to split up the patch series between uart and
soc, I think sending them together during the review phase
as you do here makes sense, but as they are loosely coupled,
I think we will likely merge them separately. For simplicity,
I would then just put the MAINTAINERS entry and the bindings
for the vendor and board into the series for the soc tree.

It would also help me if you could add some more context about
the SoC into the patch description for the patch that adds
the arm64 platform, in particular:

 - is this the only one you are planning to upstream at this
   point, or do you already have plans for other SoCs in this
   family?

 - do you expect to see full support for actual end-user
   products using these chips?

 - is there any shared lineage with the cortina-systems
   (storlink/storm, now marvell) gemini 32-bit chips that we
   already support, or with any of the Realtek SoCs that
   are also being upstreamed now?

       Arnd

