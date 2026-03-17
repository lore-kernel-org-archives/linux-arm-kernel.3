Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DD4FED9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ax6GnEvFlUs6Tih71td9mzX0GzzheB1BOMQgWCIE0Fw=; b=mYwYr9nKz+Nkx1Zi9HkPRUaQS/
	SFgG0xaTHcz1yv6kGckwEU6SDsMZIdP7Q5jVNilmjJpGYDqeyQcemKVQWwhwtL/wAc7JLG+/JaqW8
	08WMk+xU2O939/oCzdWIXHjCwQOhLXPbZjevJpWd9HGTH32OYEa/4ncKHhjwSmIJPUqK1yGI3tx8V
	2FPpwQ1U//5X9rRSttOniZFnEE8EbQP3RyWCo3MnWMfsQTYAnYLBIM5xnHm3vHinHIXPbHTdTY8wT
	DxIQ5rSXvHD1LMjtMbpETsZk2/WvRq/FKtnUSy4OYep2loqLSlqJ8dte8ANufWuVbcvEPdhXFmYXW
	Kt4DS3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Xdg-00000006rc3-1B0c;
	Tue, 17 Mar 2026 16:51:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Xdd-00000006rbe-1RLS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773766283;
	bh=KWhCOBu1XaI2x2mEIb/lsnEQSL8ruempzbLEXwXjGnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvxKyZklLIUZcP50SdWyyPMhOkUVSps9y4PaE3u4jJ44riC/1SckVGdearmncCHV3
	 NYIvGg/MedCQuH8esmmmrUSnXoeUX0wuGTnLICEwLOv79NtTSwFGy7ID6OwaBhEzRy
	 CQNw0l05jscuJKEnBogxFU75U5Hz64RtEE2I939QVijI/Zu/CJMAmonJAe43j5faao
	 wFEJBlr+NvN7/5YrDVsUgxYJDpGFGDAEbZkJzhrdW9pIiVg2Ds8Mz4njJln4V0IBnc
	 uiAnubitHsMO1bHJx7DdrukGmFJg+6Wzk17HImN+zbgRGqIPdW1MjDhhUF2LRf8Wd3
	 GP56Ov0p/XbyA==
Received: from nicolas-x1.hs.collaboradmins.com (unknown [IPv6:2606:6d00:11:b76d::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F7F517E0619;
	Tue, 17 Mar 2026 17:51:17 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org,
	ming.qian@oss.nxp.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	mchehab@kernel.org,
	nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	ulf.hansson@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	m.felsch@pengutronix.de,
	fra.schnyder@gmail.com,
	linux-imx@nxp.com,
	l.stach@pengutronix.de,
	Frank.li@nxp.com,
	peng.fan@nxp.com,
	eagle.zhou@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to __initconst misuse
Date: Tue, 17 Mar 2026 12:51:06 -0400
Message-ID: <177376614640.2015221.5231981229215959103.b4-ty@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306031059.801-1-ming.qian@oss.nxp.com>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_095125_531018_9405BF03 
X-CRM114-Status: UNSURE (   7.67  )
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


On Fri, 06 Mar 2026 11:10:57 +0800, ming.qian@oss.nxp.com wrote:
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> [...]

PR sent to Mauro aiming for RC5, thanks!

[1/1] media: verisilicon: Fix kernel panic due to __initconst misuse
      commit: ab2e204b1e76e1a85ff75592dcbfefa3d783a683

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>

