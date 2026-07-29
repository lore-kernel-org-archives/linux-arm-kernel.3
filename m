Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F797C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQd+PKYg2SrS9YmpMTZzmi1rzZRa5OmKfOaIKvd4BaU=; b=JXeIIymX1QiugFRctQE2wgRyfk
	u0WPgpXd/WlC5BllEwhpeW1JGQ6t4xH6JtE9LUsvwnr3pW3j8ZRWO3pIxA+NQok6U5kbauAjHJRma
	HGVBErpKWevz+hXeakxOTaFUyl/QZPue2VWcRR7OVxSVTbP2gtpC2FgyAr1FZpLOZGfVjK0laKWnP
	H+hje6bEYqyR1cMu4IfxvF6jsFBGkqnsadCAP7+/Jk2iH2ZhhP8/osmK+kkTC4OIFHg3Y7oNxHtZS
	rtajCeNw1jQgOmhq//+dFSaJKNEy76BHw8UFRXiY4UjHxU3ZS9rHkAtDkG2AOpuQt+Va14GdVWBL/
	SyeSj13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6XV-00000008Say-3Kt2;
	Wed, 29 Jul 2026 15:49:49 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6XS-00000008SaQ-3Lxj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:49:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id BD8101D0011A;
	Wed, 29 Jul 2026 11:49:42 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 29 Jul 2026 11:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785340182;
	 x=1785426582; bh=oQd+PKYg2SrS9YmpMTZzmi1rzZRa5OmKfOaIKvd4BaU=; b=
	b26o47eWvoAOFjeXEWyfIbfcvKzOlhtWtolL6zXsin632c5Lhm1Ot9VuvuFRNJS3
	t/Evg05k8gZa3d/R+VF3J0o0k0HQ7/cVzcP05P7vUl695Ie3Tvng2ZpsmbO68idY
	knVPl+7iv1WkVLOW6Mw3krCpnTMxBbrxnWyTVFi0U5UvF5IHpYGQMPCSZ+kjIZiN
	ECjqj/dqUv7DFlKGSTbCWUArYxoBJZWeoxr2nUgLvSdeJ6R2CYiK/EjTrj/Ca9Wp
	gqoWIkjDIB62GYqlsUuWjIpw+GiPPA3ZgD5mWl9OkGISlVK9gGffA/Cc+wXY3Ln5
	60rvIsCj4bG6E2yVgvkfSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785340182; x=
	1785426582; bh=oQd+PKYg2SrS9YmpMTZzmi1rzZRa5OmKfOaIKvd4BaU=; b=P
	fyeBWqT6jRFBZMuJL13w0llBqGuTGHZG5WMzeCHtd0o9GuccC3DHQTeSLpas+EyM
	w3MMdL7MmLe3tEDHhQHHWv7ilEexzFtpx43yjO0yzMIH+mQxTUm5PbFBXjMhrKOy
	zPBHLg7c1q1BbWeZ7Dk0+UK7Bo7lvIU42Jnstz/npSD1EX2gGWd6zBUOKvouDZ8u
	hEL3AUHh/X9bbiNQLUyvXb88zGUnERo0fbwh/UURW/8j4Uxqz8QudfFp+vXPcs7e
	C/Q6axR/T9G6o+MKgvK9u49IKJVAgQ6x4ZQlmmDBWU9T9p2uqyvO6yQtEKpTY73I
	owTlOFHORlIX6diNOvImw==
X-ME-Sender: <xms:FiFqakPzmS8KQYVzSq8Q3GmJjEzmvDJsuGiW85jwG3Rjo1c-1jY0XQ>
    <xme:FiFqalyZbcxnYvefB1Ye22dtA7ppYCk4LSIDT-t9T6kwSf4G-liseGCZY4WjSiWMq
    J3sNeQZnco24jGc2nZLOmfjMKx64JYsmkLQPvI8Ou94SxMLsVEQQWUJ>
X-ME-Proxy-Cause: dmFkZTEAyhqDvJeN6sC00nrS4GH93muUtp1FPUrKchOpg0VdjiYsXIoAe2zJ3VMf/DUodn
    RrZLFl0kfeT1+zgD3tRPqzt3Vw/YaAnP+0uH3CC1FCrlrWz7J5y4eCAY6s6XqmrYCxvrsM
    ZTx4y4ul/tMPWDH+Pj9Xyi3i5qV0rmzz7IAiZ3DPZ+dB45MLXp3JtrVyHLfeo7likE+yTe
    XTC+zjjvnGa0TNiLVFYXZN0clt8U5TbLmm+IMpoIKbj7vWk/GkIzD3ejs+NmhrUPXamvrO
    iOAmTwZan0rjGdm3PsfemjCjQmAo2F4qP3JYvLDxNs/cB9xPEiqOL9zbvciDKG9+AazeeY
    067KfJvU8iPJdV54yLFuArogXd+Ye1GQAXl/I5+N+zpUeXR8Ii3jB3kHsDDciEhseBYzlI
    ETrdKAM50hJQFjt/SgbV88U3w3g9YG99aBzn03PMyAqByZ7THsYGtrViCWXCn41tpE7umy
    bQV2+BS0hF1po+OGZDjXKEbERzNfysLaIAR7Xit8XT1ScmdMqCWw2nkYt8VQF8WYSwDpf9
    Goh4vZxUvx9roqGpAuXqWtpsD3z3lVRmCMIO43TnIsc8PuiKPs0AUIMvwPOOWnFi12MRvG
    J1PbeM2vhQdALy2wwtJzNxCLO2SLxfLyfAHzaUdTcQckVPVSdWEPbtd2CAgg
X-ME-Proxy: <xmx:FiFqat6qCSrETiPUP21GnTsG9VleAgPpOyESj7AFZh_eJCN0BP-TBg>
    <xmx:FiFqakOkNoKrJdElhxxu59-KFQyooXLxZJtX3C7NYg2GIgCvCJVaTQ>
    <xmx:FiFqarvxEXeDmeIk-RbMlo8eBcvW2dHEKGlAn2iCpTcvTB-Q_gY_bA>
    <xmx:FiFqanYNZmP2lwW5atuYwYx7gM2sTMuBiEygmJpe_Bs5iL0O-5zJEA>
    <xmx:FiFqahYG4HTsmIPxJTcTY_vDuqCDGs9RVhIKkYsT5crc4QIh8IT6j4NV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6797E182007E; Wed, 29 Jul 2026 11:49:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AlS3N7dQjmI-
Date: Wed, 29 Jul 2026 17:49:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>, soc@kernel.org
Cc: "Rosen Penev" <rosenp@gmail.com>, linux-arm-kernel@lists.infradead.org,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Message-Id: <5ed3a50d-b87d-4df6-b81a-ffc5264a553f@app.fastmail.com>
In-Reply-To: <20260727201200.2441827-1-florian.fainelli@broadcom.com>
References: <20260727201200.2441827-1-florian.fainelli@broadcom.com>
Subject: Re: [GIT PULL] Broadcom devicetree fixes for 7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084946_919571_12CC5318 
X-CRM114-Status: UNSURE (   9.91  )
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

On Mon, Jul 27, 2026, at 22:12, Florian Fainelli wrote:
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
> 7.2, please pull the following:
>
> - Rosen fixes the Linksys EA9200 NVRAM DT size, the 2nd PCIe controller
>   interrupt that was duplicated, and finally removes incorrect PCIe DT
>   nodes 'ranges' properties breaking PCIe

Hi Florian,

The third patch dropping the AXI bus ranges looks wrong to me,
I've commented on the original patch submission and dropped
this pull request from my queue.

I only have one other fix (arm64: dts: broadcom: bcm2712:
Remove non-functional EL2 virtual timer) pending in the fixes
branch, so we should have a few days to resolve this, but feel
free to resend the other two fixes separately.

     Arnd

