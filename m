Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ED1D29DE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L7hcDYx+9J7Ntj/MBYVNDeFz/IZyjH4ucJC66iwLttI=; b=EPYZaoPe3KHY+P
	FDImKA06lcHwBzoF/k4cFj6FIy78cG/54mdUa1aQYgu8/xNdLGgZSAOicvHYWR62inHlyiWbeweOu
	j8VEOKevo3RPxeqOQM8ct5dkjW+sjFxlsojkJXwWUY33IFiJzp16Y/8+GAJ2Pkrf06kMWypa8MU+n
	2F3x2M8fN/TFJgQaci7PDZYyVCemPtSYES4gESLAyOAI8wmtB3Kh6/jcUc2YknLMq3vU9QI7XxF5q
	A2e58mS4HobLUlmm192uowUpDBwBDf8pQMK+9LN0UTHBy4T2nzmMXaizUbQ6pdHOhTOhT6IJL+U1I
	HA5Ku/oz+NMyHs7BvGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZe0-00000006ive-3avR;
	Tue, 13 Jan 2026 08:20:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZdz-00000006ivR-0pBy;
	Tue, 13 Jan 2026 08:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CA6460051;
	Tue, 13 Jan 2026 08:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ADAC19421;
	Tue, 13 Jan 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292450;
	bh=i1Y5DZjciIYzsq+vPdVY9mHZmjo4XAc4nVfHVj1ap6Y=;
	h=From:Subject:Date:To:Cc:From;
	b=RfgZ2ADdX4mp3904VOIWBrIYyUUskCFYCDkp3OdIPf01lkjme+pG5wX4HHPxiFR+C
	 v/iQ+FAs45BH1AhOx42vD7s8Qsrmezw8T/N/cxGCWyimRQrrjcfA9/dmiEj7XaonbN
	 c1OKcIEx5KxIX4HKpzYDHIjDMi+7VK9gyusKPoc8aug5hQp+GzYWnhxk1/SlCMgW7O
	 qLeMw6mIRgY6csOwFl2j45dyfTUo2AL5CyR8hp+mjDH3AvRRFebrCfo6T0b6cj2Z8s
	 fljMUTcZHIL3J7bjtAGYWMkze3KH9c46t26jCgOIvebVMX4S0Ht03f78fVr+ufDYPH
	 siQ4TNLxihYWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/2] airoha: Add the en7581-npu-7996 support
Date: Tue, 13 Jan 2026 09:20:26 +0100
Message-Id: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dsy0IBhX3MOwKDKFidKSqaKGc
 HcrcevyveS/v6hIwhTVKVuU0MyRg09gdpm6DNb3BNwlVgZNiRorsCxhsOCnBziW8WmFwNuRIC/
 ogGistrlTaT4JOX5t6XOTeOB4D/Lenmb9tb+oNv+jswaEDltdHNuy0ujqK4mn2z5Ir5p1XT/hz
 epFwQAAAA==
X-Change-ID: 20260107-airoha-npu-firmware-name-34e5002a1a3f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

This is a preliminary patch to enable MT76 NPU offloading for MT7996
(Eagle) chipset since it requires different binaries with respect to
the ones used for MT7992 on the EN7581 SoC.

---
Changes in v2:
- Introduce "airoha,en7581-npu-7996" compatible string to specify the
  firmware and drop "firmware-name" property
- Link to v1: https://lore.kernel.org/r/20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add EN7581-7996 support
      net: airoha: npu: Add en7581-npu-7996 compatible string

 .../devicetree/bindings/net/airoha,en7581-npu.yaml       |  1 +
 drivers/net/ethernet/airoha/airoha_npu.c                 | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: cbe8e6bef6a3b4b895b47ea56f5952f1936aacb6
change-id: 20260107-airoha-npu-firmware-name-34e5002a1a3f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


