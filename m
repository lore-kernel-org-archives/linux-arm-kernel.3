Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D51CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfdHANOehTUP1HPo2Io2Zx+Al3fFDMd7EV9Pa2pY7UU=; b=CKuZx53BiCfo6KZTr7IKb2DG+k
	lzLusmMHPIYcziYtxd/6u/k6PfwfIEsKaMF8HEPBbK1CuulnrpgTsKk+JQxhOZMoHxlVWj5vsZ9Iq
	JGm4n+M60rg4ub17MOpR12QpISDcfdE/1W2vG42p8OYIgv55pa/3n5yZ3hTZm/duVSMojswujd/bm
	I4gEkBvkSnEdfuh4N13i7sDF+xNBu1ZYPiitLoctph5YXyObtNuVY4CGFYDy02cJaYObky2XMdRZp
	wkTZ3BxpepIERfR90kTtQHuzoeRaVTRnnN1/MZpOW126q4/i1NCWK4ixJEf73hXkzRX324/wr8MQC
	KxGY4Dpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGGz-0000000CxAP-1pFy;
	Wed, 10 Sep 2025 08:33:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGGx-0000000Cx7a-1DiJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZfdHANOehTUP1HPo2Io2Zx+Al3fFDMd7EV9Pa2pY7UU=;
	b=TTC97RhnEgJfdlDzGW47lqFtg2e6cVlsSCFfrsS/oXpiK2FMEG2qNi5T/ibO0f
	vlpeixtVmt1bFDP4BvEV0nNZDFTnVMZhDOA/n2fPXrb7JnyIKu8wBGBocSMbxJwL
	sE+NWsgAtsE0QI2yAAAtP0WKCTHAT8Tu4r4IigBUOgd8k=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnJW+NN8FoDMs8BA--.39270S3;
	Wed, 10 Sep 2025 16:32:16 +0800 (CST)
Date: Wed, 10 Sep 2025 16:32:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank.Li@nxp.com
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 9/9] arm64: dts: imx95: Add msi-map for pci-ep device
Message-ID: <aME3jbmlRVcT2biX@dragon>
References: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
 <20250710-ep-msi-v21-9-57683fc7fb25@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-ep-msi-v21-9-57683fc7fb25@nxp.com>
X-CM-TRANSID: M88vCgBnJW+NN8FoDMs8BA--.39270S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8zVbUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhB84WjBN5DjOQAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013347_639138_10F49167 
X-CRM114-Status: UNSURE (   6.38  )
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

On Thu, Jul 10, 2025 at 03:13:55PM -0400, Frank Li via B4 Relay wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add msi-map for pci-ep device.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


