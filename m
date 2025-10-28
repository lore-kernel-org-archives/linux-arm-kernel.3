Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A849DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39Q4QJAbuaHwdppokZlTMSHTUZpVg9kkFS9isAIE9G0=; b=MQWY43mRPeYjWf+wpytqGdWPHi
	4LDD3W6j/lscxl58x39dYMZ5SNOHnivVziZGQqszPcFfB00xw4OAUnHreKhyLhDhCpkC4Olps7Obm
	t+Ie+srJxF3OovxhqPkU7kx1r50us9yRn8LEhuvY4VC1FolxC92YlrTlNR4i1+WZyT2FGrkpxpIsf
	YFV865O0pS7OxsSJ57SYf5BfWotToeRtehxQrp9J/bXEV6sFQY+YZZ0+PHNk1Wt+thsuEBs9UCE0B
	/cVZOkMle1COww+rqsC45HENoO7tex/EdvIgq13B79DV+OXAChv3FE4un4vbW8TXSJ3UJ74N2NLNd
	Qu/t5LbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmTc-0000000GJSM-1ViL;
	Tue, 28 Oct 2025 16:23:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmTZ-0000000GJRJ-3Hxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:23:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 509AEC0BEA7;
	Tue, 28 Oct 2025 16:22:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 958E4606AB;
	Tue, 28 Oct 2025 16:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D24BA117AC5D9;
	Tue, 28 Oct 2025 17:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761668590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=39Q4QJAbuaHwdppokZlTMSHTUZpVg9kkFS9isAIE9G0=;
	b=ldOj4Yzdmox9S8RzQVtCR1Pl/eps9aaUcg+kOLQRCh6F0fGqutlY7MBEcwLDtqX2WSMAyn
	BWbNdnoXCq/KnEmVcfE0C2IJB8DaED/lNqryn8HTZ9rJDwg6212YWyqrHBczBgelTiSWE+
	JilJPeNXAYSCN59mw8RLo9MbNd/wgh8A1UDKzdBX7+vqOCnLQAOcjS+6stgVBMqJeKLUye
	VG3ow2UkTPfMF+/UCPxrY53QKtuHESI6Ggky06v2QvN13H2LQ+jnefQyi91tw2NZCb7hyD
	/Cl2bBeT8MaT9kEDLU63bN//W3k7IFey7jBOuiQC8yIUr+WkDYlqO0WOulL6Jg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] Introduce Allwinner H6/H616 NAND controller support
Date: Tue, 28 Oct 2025 17:23:02 +0100
Message-ID: <176166832292.369296.13474664579564092602.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092313_965100_46E1EE82 
X-CRM114-Status: GOOD (  11.08  )
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

On Tue, 28 Oct 2025 08:34:53 +0100, Richard Genoud wrote:
> This patch series introduce H6/H616 NAND controller support (but not yet
> the DMA/MDMA part).
> 
> All the work was done on a H616 board with a Kioxia TC58NVG1S3HTA00 NAND
> chip.
> ECC is supported, as well as scrambling.
> 
> [...]

Applied to nand/next after fixing the Links:, thanks!

[01/16] dt-bindings: mtd: sunxi: Add H616 compatible
        commit: 7c99743a0b10d18abe6895c01843aa5d7f8a2a6f
[02/16] mtd: rawnand: sunxi: Remove superfluous register readings
        commit: deaa77ed66bf6ed1f7c06c183bd7a5bc0d931c62
[03/16] mtd: rawnand: sunxi: Replace hard coded value by a define
        commit: 1be7ac78b72f25e0e2ae2288944da31d08edc2f6
[04/16] mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
        commit: 94dc08adaf927b8a1d4de606055cf1a9c7256425
[05/16] mtd: rawnand: sunxi: introduce reg_ecc_err_cnt in sunxi_nfc_caps
        commit: 4a3a05681432c4a3bf9f7af3c813baf33bb143e8
[06/16] mtd: rawnand: sunxi: introduce reg_user_data in sunxi_nfc_caps
        commit: f53c74d0577426bcf604dd2f087da812812a6538
[07/16] mtd: rawnand: sunxi: rework pattern found registers
        commit: 6fc2619af1eb6f5994a27e8617ac0911cdba81b8
[08/16] mtd: rawnand: sunxi: add has_ecc_block_512 capability
        commit: 8c1b28ab3e4ec8d709c47928e1e6ecaee873d74b
[09/16] mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_caps
        commit: d21b4338159ff7d796e0c809a29d3425b2864115
[10/16] mtd: rawnand: sunxi: introduce random en/dir in sunxi_nfc_caps
        commit: 1340fa872102cd7eebdcc358965381d5928803c0
[11/16] mtd: rawnand: sunxi: introduce reg_pat_id in sunxi_nfc_caps
        commit: ee61bba4ee7ca6a862ec8c8e76b2051606f25e97
[12/16] mtd: rawnand: sunxi: introduce reg_spare_area in sunxi_nfc_caps
        commit: 6208274d0a27b81ae5425c819810fcd7bf89636a
[13/16] mtd: rawnand: sunxi: introduce ecc_err_mask in sunxi_nfc_caps
        commit: 97d13bcea2306f47d5e54e5a347d5ca5817deb0d
[14/16] mtd: rawnand: sunxi: introduce sram_size in sunxi_nfc_caps
        commit: 5ddfbc68ec7ac92ff64d8420909b1258be3ca8a1
[15/16] mtd: rawnand: sunxi: Add support for H616 nand controller
        commit: 88fd4e4deae87fa66e0e00e2bf6a4c362d241215

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

