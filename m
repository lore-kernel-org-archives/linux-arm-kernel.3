Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C71061B0E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RJnnB2pPQ6ncWBZL6xleP5qED5g2TriMKPwgfGIkEwM=; b=s7KGtmS11UOX1A
	hoKF2EgwhcAOxEaeEFB2aLXqRIQdCPYrezDN9pA7hQTzzsrhEbi3RW/HHZ1aRSG5inzXbpGGryAN9
	+2xn07VOeuU4Jl4pVqG6qfykQ52p35of5OvKRzj/+oTkcdGXvfpkcszHhAdoG+2us+Z5eZGmoOgLS
	AyvVPZQL+f7GPBN9U08rNd+FKFEn40G0PTz8ABrxTxPrJQoJystL0hxGO8kxdY2T1L+LDgVhCBgLl
	nR9Pbc7UuTIdOG6Z6YZbsstC+jsa2XiK566wJRYgZXzSKa4PwBu/TqsQlFgn/iq0lmYeGIemPnhkD
	oZmU2y6/k91JIharAeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EUc-0000000BZBj-2W84;
	Mon, 30 Mar 2026 15:25:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EUa-0000000BZA9-2RzV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:25:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so614693366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774884326; x=1775489126; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJnnB2pPQ6ncWBZL6xleP5qED5g2TriMKPwgfGIkEwM=;
        b=d4cZarNdnY3Gb6H3v8urnJ1WpZduwvQ9LkgafmxXGSFZIoSj/iaf0zjU5+ugR+p+3W
         wb7k3leZhecFxF1RB4BO02SUJKB8DrL/RS/TfHEocYoQP7ANNulDxk1lh/3kBIY+MMTb
         pIQuDFdhpzJjRsLaKhduNox2zAynP2Ytpj4qxkdUAbHViuJiT8WnEw6kHsgQPxyrJoQR
         BfEL7aSSiZtTmHLFMVURM5FICt+AtiiJaWSS15EdaH1zv4mCvw16H6FdmyZaYh6VN5rQ
         EB3ofeQSeziQvG665NfRf2AnCM34KNOSJpfLjMuBrCyjtPenvPuNnce4BIvs0eBPqgGn
         R1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774884326; x=1775489126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJnnB2pPQ6ncWBZL6xleP5qED5g2TriMKPwgfGIkEwM=;
        b=BBGYFY8sakbZpWRBSw0V6RhF7cQS2FQkwqJQD5sA8Bu+bh4/md0F3nlQLyCb35h9wx
         RmeNYha2RQUWsv2JVCM/Yyr9Mz1vBf6aP1pQBSv41R87/MuVCKtJ6l8/ElPsddv3fre2
         W7UTPG6lj6QVwc+5oURl+GDZQp8RHQC9iAxhIdMawIhQw5j4oN7vRRi2Q3jtOCQnc0QM
         PWg+VgZR5AAlMtkGGPmdAcBwWrBiDQpgGT1A5dpr7jqyolJnGyMTE1P9n/iVSGcq6ebf
         HihicHF5xXfuYgcFHr/fdKcIXP2nAAZlGKvsfjVxmBXFgluBVCv0jbWfAlzf//S8OPQb
         2G0w==
X-Gm-Message-State: AOJu0YwjzFghGOK8xWav3AaNHwT+ZrfcRWRvT+1LKSfPIlY1dR924fNG
	DEZZQ0ZbwJFPnazASIhkD01dSs/bgDgMwmT1Qhg9Tiie02/Ks9AchnRa
X-Gm-Gg: ATEYQzwZVwxbF0moty2B27aSt3eEkdCansyqFM5IcUUJ+6CTNeXo3cqJubvlGUdbfEH
	vVg3W4r/Bu/1RapTr+mMLGEslBxTOnUBL4vLuS4ZlNPLuyrFOODqP9D4weG4RSU5yN3xJcRkRxU
	I9Rx6QeuUYpt86w6x+kQfbeQoSkzfnzGoCJQvahZprpVhr9XuwcsLLjnAJP7dgZZTZGE6jaHziU
	/eSHjhRjpHCYpyys5QE7ZH1/1kYRY0vrfxJRHdLCi+3/0xDETBWmEYzJGhpBFSazho99zaCnEfN
	TWNBGyAxBWZy4zGc7ZgDNrWqyPW2WGczeBsVv8L5vXYgLmuGY7oL12DYspGPyGk31xXWIbFSiqd
	HDajIRrlN3Rx61cS3BgWVBljhesF93udPZcwMDlJuDBoNBrtHThbHE3UMF7IkhfCxzOMNl/KVAt
	36POc7DkESvRtwXjlUiHUihglmfcMB/Hnl+ZtSebqgLDGfS6bbQ1L+dzDcNKsoscc=
X-Received: by 2002:a17:907:1b21:b0:b98:1062:afdc with SMTP id a640c23a62f3a-b9b507a5dcamr785644666b.27.1774884326453;
        Mon, 30 Mar 2026 08:25:26 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm301058566b.49.2026.03.30.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:25:25 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] arm64: dts: marvell: armada-37xx: USB3 PHY cleanup
Date: Mon, 30 Mar 2026 17:25:15 +0200
Message-Id: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnA3UVFfcr4iHqNkMzK60ODrEf
 7d4fJd3QJKokuBZHRDlp0m/vqCpK5hX9m9BXYqBDD2MtQY5brwwWpcz7mmyGNY/zh9hvwfsibh
 rHbm+ZShFiPLSfPfDeJ4Xy2oZzW4AAAA=
X-Change-ID: 20260330-armada-37xx-usb3-phy-cleanup-922a5472794a
To: Gregory Clement <gregory.clement@bootlin.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Robert Marko <robert.marko@sartura.hr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_082528_674023_C10C24AB 
X-CRM114-Status: GOOD (  11.57  )
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

There are two small patches in the series. The first helps to avoid
triggering a bug in the USB core code, whereas the second one is a 
small cleanup to align PHY definitions of the USB3 node with other
platforms.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller's phy-names
      arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node

 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 2ff6cc999a04bcb094b8cbba68a9251f03a5c876
change-id: 20260330-armada-37xx-usb3-phy-cleanup-922a5472794a

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


