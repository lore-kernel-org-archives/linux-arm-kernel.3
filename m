Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D19E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P50MVxpm4pNCgyiT7F46O0s8JVX58z0BCx7mjjXCMvc=; b=I1nnjdx19DtteRUwyGYz/Vi353
	62lmJLZ1VTBEGNJ+30bz3YX/O63mltmC+d/0QCO0c87YvFYrFBd578aA5KKzCARWjs+rVQr5MR5BB
	QtjouSNfYqr1tQUS+Bg6ZIFmYMw/X9Z8auVMQ8au5yxLjOCEuaXszvA73ni131+sADmTSMblSx2TY
	bLYd/EUuft96jk9gvbC2KtmSk8c8zhF6xjAScOeN/asIkCFvnDslM7vamR9r7yTuue3ZvniM3Kw7Y
	+GsjwcJ6zywBYHXfAxW36fbFHO265yt2yxuFyO8Iwy/YmDn8hazzDGq+qfzp7L+gtSyeV0NvTkGIG
	yIisDkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskq7-0000000A7g4-0dpI;
	Wed, 18 Feb 2026 16:55:51 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vskq2-0000000A7fW-3Mxg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:55:49 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=P50MVxpm4pNCgyiT7F46O0s8JVX58z0BCx7mjjXCMvc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771433733;
 b=Fc7+FAU1OY9Oanv3QQdI1hEyT1LeA4uoX1ESpHlQA+PgTlD7RJU4gyenoNF6VH2Mx/LNaNB9
 PuMjgWpgBlnKndJsnkxlDqojHRitewTaVp96AmADTu0YV03dimRgEazk7n4zLwlHNg3xDGAQWhL
 B3L+2xjRAnc/HHK7UjKLU2iBu9HbtEejqjMnKxQFetWbRBiFvQ8fkY9QXEBJQ+gWo+dl7BQhbAc
 rpJNwpJCkp9ys/zfplgcPDb+FjDImeJahp6g2g8R47gmi94ZLyBTtraIPA+0GJNoWS3ZWqWdSrZ
 32fgee+EdQBCWau7+XPeJ8JeVABN8cm+CP2vczMnijaOA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771433733;
 b=SZIX60wZVPm+yAem4MnsuFFwQe9mbKaON8xbbqWuqGEMWZaBnYjqdQXNPVxeZLIxx3xyzM11
 t04MOM6aEH4EWLFbGIOT37iv+JLj7ZCYo2CQCeigDSf31hQO8pABXzW1LBsO6mi2uYtA4B73TPh
 Y1L/UndKJC/MkeNjdw8k3hGp8WU0spOFWTBLbm6f2DnGBNbzIMiq/8jw+NN4vO2tt/tMpuAAoGk
 SfNCukg7gbX4Ls0E+5/Fd7eONsZILFP/l56jr8rq3apWwCVNDYWLRuhAQMY4zNpoSE+RdeYmdBu
 eFPer7C5RG0/xsRVcgYV+yzvB/iIf8GalzOAp+lfFlthg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 18 Feb 2026 17:55:33 +0100
Received: from 10.1.31.92 (unknown [10.1.31.92])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 793C9A403D9;
	Wed, 18 Feb 2026 17:55:14 +0100 (CET)
From: =?utf-8?q?alexander=2Efeilke=40ew=2Etq-group=2Ecom?= <alexander.feilke@ew.tq-group.com>
In-Reply-To: <aZXr_r1VEx5kcl7g@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20260218135415.204974-1-Alexander.Feilke@ew.tq-group.com>
 <20260218135415.204974-4-Alexander.Feilke@ew.tq-group.com> <aZXr_r1VEx5kcl7g@lizhi-Precision-Tower-5810>
Date: Wed, 18 Feb 2026 17:55:14 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Frank Li" <Frank.li@nxp.com>
MIME-Version: 1.0
Message-ID: <19f328-6995ef00-67-b89a9f0@203920772>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/3] =?utf-8?q?ARM=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_imx7-mba7=3A?= disable =?utf-8?q?boot=5Fcfg?= pins after boot
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fGN0y6h0Cz4MQYG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6f2a51003bcaff58264e8b6e95e66ea6
X-cloud-security: scantime:2.494
DKIM-Signature: a=rsa-sha256;
 bh=P50MVxpm4pNCgyiT7F46O0s8JVX58z0BCx7mjjXCMvc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771433732; v=1;
 b=Lx84ypsChQfa+3wMsNweboQUGlzPqpuT5Nk43L8pagi2ETX3OK7eoThCST9Msnx1rRCkOSoB
 DYTvnRarvA04tVcsM/oU3nB1AZpg2gCgjDS6JFLl49vlOjvQdAyrCynvfZOP9+/m34jGPGuuuo5
 1jhk0/MMzmQMlpKB3YnIM9tj5QRXHoaAHeucbrErEpDgUCsTG9cCCN9iN//LM20Ng6mjl6Mwk09
 3Csj8kTHjkiLRekxLjLBp/SogRI/lM5ra52fZ8FW9G5d6UBzZq3PhnJIQiUR9wVdQnZ8rdOALUQ
 iEIATPygQEpBU0v0a0zxpebJfg7dY1y5vdaa5BALFOocw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_085547_130618_6A308CFE 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wednesday, February 18, 2026 17:42 CET, Frank Li <Frank.li@nxp.com> =
wrote:

> On Wed, Feb 18, 2026 at 02:54:14PM +0100, Alexander Feilke wrote:
> > The BOOT=5FCFG pins are located on the LCD bus on our starterkit.
> > Disable them after boot to separate those signals.
>=20
> Your comments is more clear.  Is below commit massage better?
>=20
> ARM: dts: imx7-mba7: Deassert BOOT=5FEN to separate BOOT=5FCFG circui=
ts after boot
>=20
> Deassert BOOT=5FEN after boot to separate BOOT=5FCFG circuits from LC=
D signals.
>=20
> Frank

Agreed. I can send an updated patch if the rest seems ok


