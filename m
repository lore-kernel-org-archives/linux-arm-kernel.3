Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5281CC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mIoGoh4sIDM3c+NpeCHr7wsQQg2d3tD2xjHc8WXc64Q=; b=4096FdUH63rxcn
	ILPLxtsMEJVOzQmw0yCrWEKDx5NeuZ5kxrKByAFsOxoTZr8tZHQqiQxUKpDExkaRU+orPoNoGJbUr
	wGdUAqunouKdyE/0WQCvG4FsAN8NHoAX7d8VJBGVb2LrCQCB5M8dL0v8rUagn16DfCGgiAzEpBL8N
	zDDNWu/MeEoNIr2rGFoFoGTstO4IkAKCIDlqzWCV8bSG/YX984DTStGrsivunbBYjFqDBYR34JTOX
	+0SMluTYQtLvgkYCRLRNYRkRltUgpfN5abnvqsiSjnALadHEIqOddYM5OedQK0QH5s4GjcTxKekTf
	RDYtqQ1+QumDU05JDFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6M-00000002dso-2ZjY;
	Fri, 02 May 2025 17:23:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtTz-00000002YOd-0BQN;
	Fri, 02 May 2025 16:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746204205;
	bh=yw1w5T04gn1gvO0Eacj6I5K1Un/3y0OZ9jtnwYuxfQs=;
	h=From:Subject:Date:To:Cc:From;
	b=ZlhKchsbqYhfIVV4s70fGnYsp+E1osDveIH6MLobr/hdKC9sDWd1sDPYepOJ86Nvr
	 A5zbLtspETWeaG9Rwnk6UGMnZHSrbVDnSZvsiOajp0nFU2y1u5Yv+J8+MI6qI3jcRl
	 zg3+DK5SwEUk4cSVHzyxX/XQDZOgtrBo+YuBIo4WHXhUDduMWsu+VlHGE255GmU6uW
	 HE/N5PgfrWAi6VM5foTbQqnioTobveP2kjZQ3uX1inOKNXZXNzUTjgbwR6Ahe7m/lo
	 I/+vq99PmhPF97LS3r/tEEnCUb6yR53qB62yhaypSEKa3cARlwgyUR8FQSZQ3wc/pD
	 1lnmAZs4SHhxQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42A1517E0858;
	Fri,  2 May 2025 18:43:23 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/2] Correct MT8365's infracfg-nao DT node description as a
 pure syscon
Date: Fri, 02 May 2025 12:43:20 -0400
Message-Id: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACj2FGgC/x3NQQqDMBBA0avIrDsQ00SLVykuYjKjAzWRREQQ7
 97g8m3+v6BQFiowNBdkOqRIihXtqwG/uDgTSqgGrbRVVmlc98+7syiRs/M8Y3QJfVo3t8v0IzR
 dMGHq2RruoUa2TCznM/iO9/0HdP/nXXAAAAA=
X-Change-ID: 20250502-mt8365-infracfg-nao-compatible-46d4db7f54f7
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_094327_226485_73F1D8DE 
X-CRM114-Status: UNSURE (   7.57  )
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

Introduce a new compatible to the binding and use it in the infracfg-nao
node in the mt8365.dtsi to correctly describe the node and prevent probe
errors.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (2):
      dt-bindings: mfd: syscon: Add mediatek,mt8365-infracfg-nao
      arm64: dts: mediatek: mt8365: Describe infracfg-nao as a pure syscon

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi          | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250502-mt8365-infracfg-nao-compatible-46d4db7f54f7

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


