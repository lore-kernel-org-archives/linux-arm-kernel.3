Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD33CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=292WAxpEB52jiI3fHCRPNW1lPGzvVg2oecSIVi2nkiA=; b=oP+Bh3gOF2cjB0/dJXqlDQV6nU
	bD9iFOq3EeP/06mDY5s/rgLEOSRrgJvmI2Hx/Ca2snGioVany1XUgyYa+UjmT/p+UiP2T0Y6ZiZ8q
	Ql5pHb3u7DomZlwoecnRmL+M4JfR14PFBzJe6d6itG0ysFzckCr5In245K75PsBBUH1Lkm5Ohmt59
	m9JI53eFMpP2eF01fHNO8sWWXvzRgCDnBN+jUD1pSUdMuSRYAHFqFV0BDvSxCUum/124LJ14CXT5d
	DE3jSUZTbK7BZuqYkLKnJ1P+sR980/moOodpGxbx+Ip1iPoCgUk14CfWymN/89zfFP2kwC9zcek28
	QDgZzIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJpo-0000000H7HD-1LNj;
	Fri, 07 Nov 2025 10:36:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJpm-0000000H7Gf-1jX4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=292WAxpEB52jiI3fHCRPNW1lPGzvVg2oecSIVi2nkiA=; b=UkPa/M/I2kBfPuwA5mflVjbtwC
	elKhiBwvri9e7BV6OlYJgKw1t5W/Wby2OCX63++CDsjG8PhBEAycho+K5bidtccy3ihpPM17iyhng
	XZ/hXM1v/ohku5QNiar/zVoE2ZSHCj+ItEpCMb4cQ5DZ1qdfqZlmHj0Ujv5XYzagbkfEylweZ4cFl
	nuc/vC/RX7D98xHNs7gWcuOs0AV4bTfgWe9LdYj/ocrq1t+dcuzIaT/lu6RaudMoM1gaswbKfMlRe
	og8prK0jNj5lNYL0T2wzbt4RtPiTudc3wwXQYYWjY0VfDaaxDx0WMkVVNwCfoUd7+tkRuFT/NNYVQ
	TVb9nDvQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIy1-00000006CO6-46TW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:41:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJpc-0008OG-Nu; Fri, 07 Nov 2025 11:36:36 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJpc-007VwC-1L;
	Fri, 07 Nov 2025 11:36:36 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJpc-0000000041J-1PL2;
	Fri, 07 Nov 2025 11:36:36 +0100
Message-ID: <85335f1cd661741594316c68457a9b943d0d50d1.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] media: staging: imx: request mbus_config in
 csi_start
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Steve Longerbeam
	 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Hans Verkuil
	 <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, Michael
 Tretter	 <michael.tretter@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Date: Fri, 07 Nov 2025 11:36:36 +0100
In-Reply-To: <20251107-media-imx-fixes-v2-1-07d949964194@pengutronix.de>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
	 <20251107-media-imx-fixes-v2-1-07d949964194@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_094114_197999_DA2065ED 
X-CRM114-Status: UNSURE (   9.42  )
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

On Fr, 2025-11-07 at 11:34 +0100, Michael Tretter wrote:
> Request the upstream mbus_config in csi_start, which starts the stream,
> instead of caching it in link_validate.
>=20
> This allows to get rid of the mbus_cfg field in the struct csi_priv and
> avoids state in the driver.
>=20
> Fixes: 4a34ec8e470c ("[media] media: imx: Add CSI subdev driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

