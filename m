Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BCECA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=; b=KNuDR+pIqcurdTMho5WAo/YY7L
	OqS1uFcRCTfBbtCiw3JTtlRkwUY3FjLySS+k90BhSlZ2m786GQRTzyJNUwbE7A846ORDVYJXqLElU
	Xvhg3EDaconqYpyCPaHTfeq0vyZTmQWx6TIu9QCocELs1A7FcoMK9JFoiAvChe2qwZP0d+hoUrSpG
	DPawlJ7697u+OC5lmcazJvLwiYg8WOPGaA+LCcjbBBLQkDIURzq814T9BdWWKhZlrD6FJYz+sgtc9
	gY9d0gfOqGa4A2VB0op/bIXZ7YaJmLM8O1mY+EFBfQoW55Efc9TdLfhg2KLSWsLt1GeNfYEiplhcp
	ZHKBarnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb0L-000000046JY-2sqA;
	Tue, 29 Sep 2026 16:48:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb0J-000000046J7-0NQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
	b=Yvqg4v028s6FrJNRbhEwQ72GLha1MTHeouOKeW1r2CpnAIxx7++qswTf+XUj/Qdk5TkKhS
	xBV2nULSjdFSwtE6GVJJEBUpsFzPpXpGx8vxIoSec7l6pC3jmdvdovDHMhCyOOABbo8inV
	qn+KJjeIPn1U/37/vnymzXcE4FLVxpg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-jUkTq0tjMcCib0_ySz27Gg-1; Tue, 29 Sep 2026 12:48:27 -0400
X-MC-Unique: jUkTq0tjMcCib0_ySz27Gg-1
X-Mimecast-MFC-AGG-ID: jUkTq0tjMcCib0_ySz27Gg_1790700507
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1e564fd5so825272485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 09:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700507; x=1791305307;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7fhQ9KGGUbPPoOeQdI2Gd4sk4/oPY6yvPOncKOrRvQ=;
        b=tAIOcAdSuYoc1HSY5mDg+bytVLvTnxd+sXcFPHprKZF8qap5kMN1HpvcbvgSqlPSKy
         R41j4Tmrz1vOixrnpn8NtiBpdhwxvzzHm63jizHVL4EJtvw6JKXEvxL1HuVVfHWkH3Xc
         I7MRhplxpo9LwsmrdzzOmbiOp5Ma51uNQHetvg2D2LjtH3QcBsAIv6jOmeoE+4shTiRJ
         WHUWfTEdJDLPIlV77QWausig41NDWIFm5MNx31fsT8frHfMh3luUbZBi+IjfO8DDpcej
         USJSp6/pHJMiRICMcXOrnVMUv1YiwYfz0TANmpUouAB8/Uua7X/FX8ENBwSaYRpzml12
         2Jpw==
X-Forwarded-Encrypted: i=1; AKwUvByN/EXxbRuSOCkof/hfnZ/GDyWfvYob09kmTogTbpQ+Q/jG8hyQkTCzGbfnnA6w5GXEQ9JzML0eOO4ml3cKepH3@lists.infradead.org
X-Gm-Message-State: AFuF++lOW4Pwu89P/1rFty5dmlTuLyC3+hhInfnOe7LZ1nnPRkAo4xXD
	Ni6LwYirL87kNZLxkqZsO0gpIDA7SwA+KfO7guBVbqKQZ8/4endyXKjmruGCqQ3QeNwMVjDhYsc
	+utWMfWml4kkOAuPcCEsEBoSooEwpwPYpEIt1Bo2SR4M8U1PkbYETDEndbCyPGoKi3OHSDzOIf2
	DG
X-Gm-Gg: AYBFou3HbUT1pujEzVHZh6l9Ry10Fh9S/oVCzYUayhdHseweR8PZaT3IiKVFrHZcaGc
	Fi1qlaoSVLPPAZw1glNg2vTI1ffw3eytCuz1fY2DUrqR1qJ04M242b0an0jo1L98HYzlmMtbEMv
	YdRZzyolOSRrCfrXcirQhvvObdT5IO4wpuwWdKC6vLn+iP1OZv9ssaG7XOT5u1TCKg6Gfq3ZAff
	TyyR77NYI5J0nuz6CRxipphnV2QZQtV8LN6xuEp4E3LP0IVAgPsx5ON1gKzoObD5+QQL5MtAXao
	gql+awM0YsBwbSZMgfbckgGlVtI2GXaqXVbYHPInyFjaUQEigFuWUg6Xf4PgkXvp0XqRxfXzlYo
	Ebl8HR43sGhLVDHihqJtCOJ+GWzQNNymUJZEPu6RpJMjmJF0m0TQ=
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21400685a.47.1790700506655;
        Tue, 29 Sep 2026 09:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93c9f90d39emr21392085a.47.1790700505852;
        Tue, 29 Sep 2026 09:48:25 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f54529asm10347985a.37.2026.09.29.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:48:24 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179070048452.199845.10870046832708018931.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:48:04 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SAHYf/h8Oe0K/ekB9Nro0D69org/h+4brL2o93Uibw4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2v75WObHBi99/6nvz91sfuy9/aBE213x2T6bCawPDb
 lVWxc/nOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjILQVGhi1pPpPUYzwFivpu
 5+WFhLcrLrx2Yo2ZS3zjMwHTvjirboZ/GtcvfHvLK77mYvkzJi1D73jODRmTUlvF/1fM2lIoJ7G
 eBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rg_Bo3EWErtRkBTVO-EJldKMkTKgE6eT2X7pkA8x3WQ_1790700507
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_094831_204253_5B66D229 
X-CRM114-Status: GOOD (  11.54  )
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


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[2/4] clk: validate spread spectrum configuration
      commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


