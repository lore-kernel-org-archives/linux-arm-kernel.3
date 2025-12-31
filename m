Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD7CEE6425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Jv2thumymaHM3F69ycEVzyljEg5XSCOFSLqxw/qaeM=; b=cfjBZWumc6Ix4QNKsixRtaVYMI
	1I5c4pi/chk5LejmRDdejZ0wLo16D+1sANoFioP969Ux97VmUhcvZrS7otjZZqc/+5xGgCpOsWOoK
	rCdkqSWeigepdQXKAy04DrnmE5efDSKsrl6+Io43IlPHGJsz/aH8/AQROgOc941oEAQqBAUeg/2ZF
	sC2H69bOQ3RpELPMEv48DWaX1mMLq5K9LAVLosBN3VQ2hevokyuCYIr3oaNU0DF02YOgAtuMvz+DT
	6L9oCWkz7a7nC/Ko4MP2qw96mnAKQHC2y00ggDb6nZj3KKijNd2Egx9s8K8YuIENzY2W8rwEP2DL/
	Fe8XP3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vateQ-00000005tNx-0Rtu;
	Wed, 31 Dec 2025 10:41:58 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vateM-00000005tNW-1Kyf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 10:41:56 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id D519F1D00058;
	Wed, 31 Dec 2025 05:41:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 31 Dec 2025 05:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767177712; x=1767264112; bh=2J
	v2thumymaHM3F69ycEVzyljEg5XSCOFSLqxw/qaeM=; b=c8zPfXie9M3ssRxJlx
	tYIz0qkKMo9uxFUn60lf5Kq0Qdx49YqKsfCA4E+2Xgjx3XUK6CufW8Q2h/CK53Vg
	JAHKYb7+rEqDHUzt4feEmbrKLQW1NN9hC+dc2xYeIictMkuVxpZCDHvH7+2xiTFX
	TF3Q3AxnyNSJtHT7g2/WmDG+r5ksiywa64rjk0lKR6Ju7kfQsuG4N0HTEtyGmuvm
	ZtN7DfDQ12XsOMRckxdwgVJ2OeTLcHhH5Lr8phfRXFWjfmjkK+fvcYelEEkCrAIU
	grkeBgel38Mm5YkvU4/L41HDLrIEqNkaks82ZkKcgsYQvvFxuB90vb2g9l7bQQAW
	1KrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767177712; x=1767264112; bh=2Jv2thumymaHM3F69ycEVzyljEg5
	XSCOFSLqxw/qaeM=; b=hCp+54VdBdHu87EpMQzbi+DlApa0SxEVfjtF+Jdt+RxN
	eym2t0NHfAuPm9cX6D0ATtoVIwUp/Klwc0saQJxrAElgNt8ufulyLJa9u6H8BHAT
	u5elowRDSzXO6zDiq8ZjPdygXlADDZB0cTLBEPX8kjpHpKRehjkxEnY7RyH99RfL
	AsUWdzXF3wOzUEFh2I8SnCh8Jh2n6uvLmQGzim0qYrVm2tqMzbHq1IaC7xfpA1RT
	UC/bWOfQt1lClzcSK0KkE8G7BPS4DDujpel+xcwo9i1DQlskrS3OTAfbfNd+MJzr
	wNawts5/Z4xFlWy+wd6ew47Vus1+Jj9O1ZWfAN3Lhg==
X-ME-Sender: <xms:8P1UaZAPJKdb_mX_QBq4mcZz8lV1tVwg8AsFXPhJcSVnXuRdUxy7xA>
    <xme:8P1UaTVrR4aLiTHSl1V6qIIDHMIuQsPOn2oucjoZGhtizHLJ0ZQEn0hu8CL0E6jqt
    9Rzdwf5phg6tS1jmYQYWrKccOGU_yBTGjeDFVZCAuDa3lYrVjyAgBM>
X-ME-Received: <xmr:8P1Uaf985-mc5pko0VXeCIYYyYtCK5EI7v9ArTEcMuK5mzAoWiU8bj-keJcbxhvnqVJ4XFrns3hce_kEZLgh9bCpA3rDy5xJ7OmxaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeduuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtg
    hpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehl
    ihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprh
    gtphhtthhopehjvghffhessghorhhtohdrfhhrpdhrtghpthhtohepghhrvghgkhhhsehl
    ihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmph
    grrdguvghv
X-ME-Proxy: <xmx:8P1UadSPnyGjKm0pfk2GirXVL9AuxvVayrho4DFBd7epazBXVxgYfg>
    <xmx:8P1UacRLI2LwqObnHDr4QRZOtbM6Pp81ek91qHw5oRJwAKe7alJJig>
    <xmx:8P1UaR4syHqsumAb_Np31N-fZoEN8FQj0f13pLYkMIZ0q0_su-TpIQ>
    <xmx:8P1UaZXKHpjSsgMTWLXbiffnNAqYdsUWD4OctF2jwyJ_3bTgLmEddQ>
    <xmx:8P1UadUhwC_CpO1VLBjhGSv2Atzm7pGfgvqN5RDX3z9YLWo4ISquQJXF>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 05:41:51 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 11:41:32 +0100
Subject: [PATCH] spmi: apple: Add "apple,t8103-spmi" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-spmi-apple-t8103-base-compat-v1-1-98da572086f9@jannau.net>
X-B4-Tracking: v=1; b=H4sIANv9VGkC/x3MSwqDQAwA0KtI1g2Y8VPbq5QuMtNoA1XDREpBv
 LtDl2/zdnDJKg73aocsX3VdlwK6VJDevEyC+iqGUIeOQkPoNiuy2UdwG6huMLILpnU23lCuieL
 Qh3jjFkphWUb9/fvH8zhOpPDQRW4AAAA=
X-Change-ID: 20251231-spmi-apple-t8103-base-compat-e7c1b862b9a4
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Jean-Francois Bortolotti <jeff@borto.fr>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=ldnc9AN0Tcy3LRdMsAxOkNoDR2A2lSMzX/+Q9YUZ7V8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyQv+84p8/NlojeYD7p2xH7k8sUmu/cdN5o9d1+6rYJn
 40WGHou6ihlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRI7GMDH+Vrk3T+r3vkueK
 Xu+H/BWed+uSbxVOlP4bFuz1VMjcNIeR4dq2v+07+i49Pbel0epsdoh0nkncdpHY3nu9nO+/N3y
 35wYA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_024154_711194_B093A354 
X-CRM114-Status: GOOD (  10.70  )
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

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,spmi" anymore [1]. Use
"apple,t8103-spmi" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: 77ca75e80c71 ("spmi: add a spmi driver for Apple SoC")
Cc: stable@vger.kernel.org
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
device trees in [2].

2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
---
 drivers/spmi/spmi-apple-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 697b3e8bb023566f17911fc222666d84f5e14c91..87e3ee9d4f2aa5517808827f5dd365055c08446a 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -149,6 +149,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_spmi_match_table[] = {
+	{ .compatible = "apple,t8103-spmi", },
 	{ .compatible = "apple,spmi", },
 	{}
 };

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-spmi-apple-t8103-base-compat-e7c1b862b9a4

Best regards,
-- 
Janne Grunau <j@jannau.net>


