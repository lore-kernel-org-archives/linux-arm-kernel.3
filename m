Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D90CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BL7DQ4RqPTkNcvLx0cbL5e94Aml+aXvs6ikCBvbUdw=; b=YeTO1j/DKw9zBaGE/a2XmjaKNL
	GFsSTqA3rCTb321Afy8tWVzN8XkwKZPxI86VNNVlbs0F9ASltyzVliIIRqU6jX2KmQP4Yd/hxxD0c
	Pc8g7+kTWUOt6fIJfK5Y+jw/GyAq3k8twEWAcusXmXirUGLkemUc5t25y5a02ej5kRc+vPpisICqq
	sk/rEXqF6WyfHuXZwKTesLwz0gJP+2js1vZLaZFqyXr84flCOWZwIozBIRM516yblTsJNMQUzMYN8
	2qIFAbsjP49NXWsOM4es2ofhdZ4uvyZAr+S9WEVnBjUhSiR67aUbq00ZCUd5YgnEID+ID4kYZd1xp
	q2aDVXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcKG-0000000EdqR-0cx0;
	Sun, 16 Nov 2025 12:57:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcKC-0000000Edq5-2jVd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1BL7DQ4RqPTkNcvLx0cbL5e94Aml+aXvs6ikCBvbUdw=;
	b=HJNWVBaDVy+uDKnl4wBcTGAMQYqih+G6UKS0uoyvfg6ETIRsvvc484UhmnJvcC
	F7fvFp8M8AGBsOKqpF4UJQUOMWtwFWttLv4T9fH6mQERtL5sxqvee+8N3WtkiGbq
	PO2IGMMIU8nmhVKv/wRp924yfcyGHbklhGPLeSfORJekc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD33kM_yhlppWkYAg--.8028S3;
	Sun, 16 Nov 2025 20:57:36 +0800 (CST)
Date: Sun, 16 Nov 2025 20:57:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Switch to using AIPSTZ5 on i.MX8MP
Message-ID: <aRnKPkd3oppdvNvh@dragon>
References: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111120022.696-1-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: M88vCgD33kM_yhlppWkYAg--.8028S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFzuWDUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgFjyGkZykFFoAAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_045749_065139_183D1B5D 
X-CRM114-Status: UNSURE (   6.10  )
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

On Tue, Nov 11, 2025 at 04:00:19AM -0800, Laurentiu Mihalcea wrote:
> Laurentiu Mihalcea (3):
>   arm64: defconfig: enable i.MX AIPSTZ driver
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

Applied all, thanks!


