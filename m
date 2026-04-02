Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A3AD6AB16
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XB1+qEZQ3/4/NCjiwpc6YJhMs5uxlHHTszpVXBON2Bw=; b=GHNfMa9PTvLw2jF3mTRZwWpNhJ
	BYpba7CJmA4sPnH+0LvDEWUQtKliFJ6p/6Tg/jcEKUVrj+TTdNT1qupWQMLiMNk5/mWXsoRPt//Qw
	JhCQ+aVJvx17KkOA9dsI7Btj4WZpqgB98RjJk4+rc8bFcSFcX+bh33VJ56WfJq5aHadzBJDD7N65Q
	uF7TqbcjU8kZDbX7tSxQPePF6TRbObA2WqWDoZhfMIF2HS4yVO5QL0gD30d0FvBflLvcm1Iv+ASIC
	HOYVixpPAlosVFjkbD8nXmpxhy7fuIirXHYWnDlk9fYryI6dKqMklRP75aTi3SJ8CI42lN1/VDlWV
	KSgbMJYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Puf-00000000pPT-3arN;
	Thu, 02 Apr 2026 21:49:17 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Puc-00000000pP9-3wsc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 21:49:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 154A47A013F;
	Thu,  2 Apr 2026 17:49:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 17:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775166553;
	 x=1775252953; bh=XB1+qEZQ3/4/NCjiwpc6YJhMs5uxlHHTszpVXBON2Bw=; b=
	bAsOBNSh44rSX7Zp6fqe29xav6a8aWeSRrpZ+bm1aYmYYPihpK+KY3YdPyqQX7tq
	+b3w2iwOG8KlV7urxMHA53JeTf1i+YA9u+duxowutB/uedKh5AvVoDWxUxENMH73
	DnK9TtCSUdBWq9sexO9Wdxqg85wSmB9hvCffYjs0TBplAqtWHOmeTsDug+w4OEkN
	u1EKWhgyE8CGEjAJrECNBP+enuSyjOfVk9Lm7NdMMvOgVXUZK07WRytbdEzbC4nz
	qzD7WIv2B7hpmDMQzqhYNAf+1Z1gCCrVSU09C/rCofYKsdR5oFnloS3vtVzOkvVM
	b7KbXtFUhhi6BuSusvQ+vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775166553; x=
	1775252953; bh=XB1+qEZQ3/4/NCjiwpc6YJhMs5uxlHHTszpVXBON2Bw=; b=m
	biH+zmP1EwDR0qNWOTXH6i+7xmqB2FMBcwtRsobX9jkxo81HRnKytTXXl8wgSTP7
	d1CHmxI7QCAtThxrVC5z3v+4WOZU9ja7CX1za1HaWmpm287xBz0BlHM111PMn2kO
	tojDZ0RnoMugLvBE7gHsQCQwbjJ/O9LIg/c2Upg1dJR911B0BTXJ5A+ro3KbbAh8
	mUDVxseGK1YDFOKhjgr0goyXAGYW0DwxGfm2CiBAHPNmbGXdnu5XaKT1l+/2QIm5
	RVxNwkUv0w5W9FeMYSO6Ba+YkKqF26FuJcN4GaZpOLazR2HaXuxZ8cljevAfpsIB
	jKJk6ca0qDctEjbzYsOPg==
X-ME-Sender: <xms:WeTOaTBnoBMs_w2pqOgtRm_MzhwgQwIJtsRItI5hl2cnFCWiNagztA>
    <xme:WeTOaUXjzxMpYzVL0UFEvnDmeEO1aqJhI2ZV2oJwHTWay3F1R4e92wVMLH9S5ZE34
    cOEArLdAs-vJCvdu5cL-9WcwDtQs6QMuQ4lMYjWPUHR53nj9siXTw39>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhope
    hlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WeTOacvZm9K3BPmPFfXJFrch0VvfW2IYX9T4ocXM5b6QSMtLxdBwGg>
    <xmx:WeTOaQUEWZ4PPlOBL-PEFI0971aaWNhQYGFngjyjabrWbsAgzhxRBA>
    <xmx:WeTOaQHHMRPc2J8KYpja9U3cWBLDRGukrUhOQamDlOE4l7Jtkql6jg>
    <xmx:WeTOaa3Lib2LN39k8jPIr8AIwoph6hZCjyno7KSb-VyimNBNViPBWQ>
    <xmx:WeTOaWF0JE8d6O0v2jOTXSP9W2kHxYMPAFiMO_n2ibkEg7sFbsk41-75>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8FD17700065; Thu,  2 Apr 2026 17:49:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1UuxUpPOvY7
Date: Thu, 02 Apr 2026 23:48:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kevin Hilman" <khilman@baylibre.com>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <83d0c8d8-fcde-4407-bb09-c2ae0e0e142d@app.fastmail.com>
In-Reply-To: <7hqzoytlms.fsf@baylibre.com>
References: <7hqzoytlms.fsf@baylibre.com>
Subject: Re: [GIT PULL] ARM: dts: updates for ti/omap for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_144915_050550_8F4712B8 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, Apr 1, 2026, at 23:29, Kevin Hilman wrote:
>
> ----------------------------------------------------------------
> ARM: dts: updates for ti/omap for v7.1
>

Hi Kevin,

I applied this one, but I noticed two problems:

There is no long form changelog text, please add
more information about what is in the branch in
the future. I've added a short paragraph while
applying.

> +-
>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi     | 744 
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts           | 101 
> +++++++++++++++++++++
>  arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts            |  70 
> +++++++++++++++
>  arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                          |   2 

Something went wrong with the overly long lines here.

      Arnd

