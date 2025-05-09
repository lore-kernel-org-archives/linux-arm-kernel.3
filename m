Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51315C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LxYjwUQq3WnAGkbsPlmq/YR/T5g0l3BdRJzFVmckfAw=; b=SKAgaeHsYs5qqLfSyCVeHqm7eq
	39Qa2wMuhx2cehqiyay5o9RcsQCdT4G1rLcMdKZl0Ag6qWj79GsyOSKR3gqUjF3PCal7FgdM81z1Q
	XILdkSKMowIXRXtgLtdz6CdRUXEulcB+0cMJpl224E8MpEFAa/Q7kSd7vpBYEgVd7b8+9yJ5cHine
	fFF8DUMFzyxqq4hXU0HmH+xLRss/a8u6TG6GNM9jl//lhNn5Fh0ivBnEVJnKukuCTy7mwmBeTpYGi
	PJgvCkaXGKz9fXlWR3J1FZ8Gv3EqbcTfLXdK+GS7UofcXjRB3+l9b93XNwJ81qY/kFaEdzc2zBTQo
	RILSxedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJQO-00000002zOI-1Nbz;
	Fri, 09 May 2025 08:49:44 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIca-00000002qZy-3uiG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:58:18 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 141B5C405A48;
	Fri,  9 May 2025 09:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 141B5C405A48
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
Date: Fri, 09 May 2025 09:58:09 +0200
Message-ID: <m3plgi9pwu.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_005817_125386_69833C21 
X-CRM114-Status: UNSURE (   6.48  )
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

I guess these messages were split from a single function. Or was it
for saving memory? :-)

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd17..b6c7f114f9ed 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_=
subdev *sd,
 						 sink_streams);
 		if (ret) {
 			dev_err(xbar->isi->dev,
-				"failed to %s streams 0x%llx on '%s':%u: %d\n",
-				"enable", sink_streams, remote_sd->name,
-				remote_pad, ret);
+				"failed to enable streams 0x%llx on '%s':%u: %d\n",
+				sink_streams, remote_sd->name, remote_pad, ret);
 			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
 			return ret;
 		}
@@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2=
_subdev *sd,
 						  sink_streams);
 		if (ret)
 			dev_err(xbar->isi->dev,
-				"failed to %s streams 0x%llx on '%s':%u: %d\n",
-				"disable", sink_streams, remote_sd->name,
-				remote_pad, ret);
+				"failed to disable streams 0x%llx on '%s':%u: %d\n",
+				sink_streams, remote_sd->name, remote_pad, ret);
=20
 		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
 	}

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

