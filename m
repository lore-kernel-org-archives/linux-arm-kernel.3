Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D416EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTgdRGCrjZVs332wXwjRkWCPapMl7/eRuP5w9RmhYD8=; b=Ag2UJa2D9UE5rtHSSFOiu7IZ7m
	hmbhX5FJr0FG4WT5DO/AFKzpGsddAaTPD0J2G1C4ya0ORlJycLhs27QcwmV/HpzY0+DDElU9N/mGx
	LE4+7exHt0owAL5EU8RlBzIEz9OleWRahsE+ViUPfilftPgTxfMt8Mvap2q9WDCpXPvLI3HRHFDI0
	/r4p0R8hgJd3rm8axw+M6UJDkR6rVUg1yMjjL0lsQbzZoSGlHgW0snVTfNX0ctMSYCcMdTnZFuts2
	yIEYIsYyoKtr5PnSVZ+bTcVaCpDApki20DY8lQZXGMMzlxS3vL1DqFd0LCAapfIHqirvOXtyyB/oq
	XgpmKxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYSe-000000094eF-2oox;
	Wed, 08 Jan 2025 15:59:12 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYOm-000000093uU-21TF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:55:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508Ft28S005993;
	Wed, 8 Jan 2025 09:55:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351702;
	bh=MTgdRGCrjZVs332wXwjRkWCPapMl7/eRuP5w9RmhYD8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=coBYJ4kc6YvpDID8zVRljQH7PuAY7mftWPRpuNg0aKHmEVA5rM9tUmV7w7hiFGFSD
	 Aj5VFuDXoPpahcNG7lB9tEMGXj+CHJYm6DJ0Lor3SPTt6zKD5crzlmlumm1FZcaQo8
	 D/GWZW3zDvTPeAqugqc7LqLD2AFhJ2KrIgPVPrfs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508Ft2X9084233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:55:02 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:55:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:55:02 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Ft2KJ091324;
	Wed, 8 Jan 2025 09:55:02 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a-wakeup: Configure ti-sysc for wkup_uart0
Date: Wed, 8 Jan 2025 09:55:00 -0600
Message-ID: <173635169682.1209268.16035989059453940874.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241231-am62a-dt-ti-sysc-wkup-v1-1-a9b0d18a2649@ti.com>
References: <20241231-am62a-dt-ti-sysc-wkup-v1-1-a9b0d18a2649@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075512_613067_2177D8E1 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Dhruva Gole,

On Tue, 31 Dec 2024 14:44:19 +0530, Dhruva Gole wrote:
> Similar to the TI K3-AM62x SoC commit ce27f7f9e328c8582a169f97f1466976561f1
> ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for wkup_uart0"),
> The devices in the wkup domain are capable of waking up the system from
> suspend. We can configure the wkup domain devices in a generic way using
> the ti-sysc interconnect target module driver like we have done with the
> earlier TI SoCs.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a-wakeup: Configure ti-sysc for wkup_uart0
      commit: 5532b8a9ce0e80514e37a1e082824934663580a3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


