Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039DED3CCB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTkN12TqYLIe0uJ9WtID9X0LSsmoorY5zMAhIMXzQJ8=; b=ZRpcGofKYKYZmmyjrD1maI5hqw
	D4Vqt5zvtzugwir6GLiikm7pUYlGm8B7XCbITqgEP4XuQ6Sl8S85Ys3YF8C7yFCZ+pEgPHJeam4Su
	7172AmvGJxKujangQeWJxpDx8Aj+9j9vKSv55AJi3Ote+Wxch3DYjb43eh+s847vRnOI+bDSf8XU8
	A/YSe4TwzjCEtJGPLeQDoKJNfQM3ixMmXGj61D3xvNkHfTi7zrOXB7wLMHnhM96GQvK00IG6JsLxO
	spDWRpcyTW8EPw6jT1Rr8qChfL4RQiKncbUkqQz+7wToaZHs1iqyolYPPdl9WGN0MxXV0/ss53R+s
	Dezf9ZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpu-0000000Bqzb-0iJH;
	Thu, 15 Jan 2026 06:28:02 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGpq-0000000Bqy2-2Lj0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:27:59 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id CAC231D0009A;
	Thu, 15 Jan 2026 01:27:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 15 Jan 2026 01:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1768458477; x=1768544877; bh=qTkN12TqYLIe0uJ9WtID9X0LSsmoorY5
	zMAhIMXzQJ8=; b=Gb959cxtIV4eQKvsOlJ2c/4PAeGfbx1zX/13Bu8cU5xKelLc
	U2iTi0mcIO2GyY4XNAgrQQFmN/uQcPi4CoZLh3hc0UkISmbQ1dpY/nIhTCCh4Hfp
	La+CeWnM4eRAv6WT0XQ5xV4a1t9tV0k9mZ86+Q696RA/014QaK8F8CiKClZNzkzt
	JxB7O5H5YKQ3NOw6rT2x1bmk/mP1jqa8RZzZEjmIPlr3xI07WmWhrCpATYoqHAD3
	xHVnOnRP36ocKfCwwXJiDFC3yuYQDPMqzYLIs5Uzkv+bkR5H0HC2jiI+ZGaXWwA4
	3PwSnYklfADVfO8wWV+391g/QY6w+/9p/J7fqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768458477; x=
	1768544877; bh=qTkN12TqYLIe0uJ9WtID9X0LSsmoorY5zMAhIMXzQJ8=; b=i
	xW3LD0KZsW+3+I9JmPoIzi6C8ds0IT2kA6o+LGOUNLrs8GrLGQNgS31NRP2q8T4q
	gNsV4h6xXaGyjsnqkSTiRCneuSagAs0yzEiYl5bB5zRRACYXu3zHghZndyPqASUC
	D1yhLYiVXgPHzMztPO6F78D0Dmprx5YzT9iQKp3WXqgMQv3kjR5bt/9bol0tIBiE
	C1SV4KlX5seMM+AkMXhVJwwhXnAqCBt6NzuH6Tl5g7PUszE3s5OmfmtmewdxfIQ9
	rYlIUiU8/g/GunJ6EqiDZg89Ny7lkqxpZdh1VlQOraEz7tM789YYJixqd8DhQAde
	nSiSlGWs/K8KStI/bYePA==
X-ME-Sender: <xms:7YhoaT-deRPZ12mKcChZ0_gsTJK-XAF-oB5WKuqWWWrurXh5C08haQ>
    <xme:7YhoaSRu1lgN4AwNNT2lep7z53pprrd5tHAwjm7XI1R-87y2ani2oBx-xaTRu-kLh
    PfTgsaXs9paXon8O-TWaUr84_tjlJMlTa6pm40KyL4tmV3sDWOZcJ_z>
X-ME-Received: <xmr:7YhoaUoSj8KTrE5p6X7j6borsqCzRyDyi2IXGfUBy-YvcXVEctvgwCLgRm5A3OVkJpf-pRYA7vP46EVbE_guK1hO-0ZsQ415M2U5Wey4T_-TlJrXqpJWFAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdehfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgv
    ficuofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecugg
    ftrfgrthhtvghrnhepffdvtdfhkeelffffgfejkeefteeuhefhiefgfffgkeduueejheff
    teffleetgfehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvih
    gtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruhdprhgtphhtthhopehroh
    gshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7Yhoafn6HXdqOx6QrwqXIRdym77sfrP6tuudukCyE4m37cCEyj0GFg>
    <xmx:7YhoadfBS3QWxEXRQHMqHR7XAac4qmgM56wAdS0Pb29oJTGHqamgxw>
    <xmx:7YhoabpoPsqMy3Sgg9Jz-qhpGuqfGrnazLvNC9cKVY8A5tHdMSQfJQ>
    <xmx:7YhoaXOvKM9Jh1s5XGU18lbdRuhZmWg0HjhvI_fgC9Kik75NfpW7zw>
    <xmx:7YhoaXRHmpHu3gq____CLLQseTo-jtQvgZZkTSg6CymQsBgt--XMhQet>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 01:27:55 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Date: Thu, 15 Jan 2026 17:26:44 +1100
Subject: [PATCH 2/3] arm64: dts: ten64: reduce maximum SD card speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-ten64-dts-updates-2025-12-v1-2-a56380bbb2ac@traverse.com.au>
References: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
In-Reply-To: <20260115-ten64-dts-updates-2025-12-v1-0-a56380bbb2ac@traverse.com.au>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768458468; l=957;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=zLFSas7YCXsYAOAsiXQ6e1u69vx7mNvPzVZzPdr1qiQ=;
 b=HJWk8LxUQ8zZ81AvRm80641xLsA1TdhMt82hQEnpbpSVMcfSVud1oFYQepgOAVPmClj5q/D8X
 3UJcYyAzGSrA/QLoc5tcIYIp0WvdLXv27DtTtD+qNYrS/jM9Ux/ptHW
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_222758_645382_E9129E02 
X-CRM114-Status: UNSURE (   9.29  )
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

There have been user reports of timeouts when using certain SD cards.

To improve stability, reduce the maximum SD card frequency to 25MHz.
Reducing the maximum frequency will disable most high speed modes like
UHS-1.

If this issue is resolved in the future (by PCB change or software tuning),
we will apply fixups in the bootloader to set the correct parameters.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 35470c0a928f..0a460eebd636 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -261,6 +261,7 @@ mdio1_phy4: ethernet-phy@1f {
 
 &esdhc {
 	status = "okay";
+	max-frequency = <25000000>;
 };
 
 &i2c0 {

-- 
2.51.2


