Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821B4CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0/kXwLol77P1UIWOZaXZfvnRJWwEc/Fx9u5zNdyzPc=; b=phsiRn6HdCxbdzsPkVbkuZZrlV
	uxxP4IMuoa2WLSdR3NLboTKIHs9uFcQuwOXnQXSO21++MRmcOxJbYjiO5wZh+aEpLPJDn17ODLLD4
	PEO2/NM6Ko6RavosEkPsaZ+tgyifUfjkGd/612CtuZzcNf59tnYKpqvXxryeZoKLv3hzNHdoXFG0s
	KEnRKr2FVhBWw49dm1PvNbKNlOiUPMpkxl1UrIHxKUDHGQPkYxacNj8lN8w++KbT9EN5vuNdst6qJ
	fY36DvEIwSwnf3NAbwdBkeQy/E5AK2+QH8bzYPUJDWcX3foF2vtubwkLNQAEzX9LcmijvyXkWmyV2
	3T36fL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxqn-0000000FPIs-06Az;
	Wed, 14 Oct 2026 12:12:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxqk-0000000FPIT-01N1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:12:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 104F360219;
	Wed, 14 Oct 2026 12:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1821F00893;
	Wed, 14 Oct 2026 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791979968;
	bh=u0/kXwLol77P1UIWOZaXZfvnRJWwEc/Fx9u5zNdyzPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BZLIhcGbGKV1fsesf/wSm71gyqX5envcYaPqmYBFHgAuldLfHIx+qHL3q4oc/ZYpT
	 UR+6xFVedLeFGlSYXe+hwMsCsMnorDk0TZ0jNCNcw0TqloNhZ8bLEKYy6xhmQn/q20
	 1x8TjHMulY4z2j1Gi679Q8i03H2kvVHpWKfQON012Aev9AdiuCbTeyu3Fe6D4szxxA
	 FlEFsLQcQM3eJ+Jw/N07l72bXJjJF7OVyHtQ5aGBxIMTuw5ak4Kr56H0+qpbjmoA6H
	 DmVnWgzb5Ug+0Om/EjBpJYRDgcycRY6Z3cXrrK7tvpzdLaGIeHqLT+7ARzSZ+nFaBU
	 VPhscif4noHVQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Rudi Heitbaum <rudi@heitbaum.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <aqfqE4OLhnN4a1lW@b65e9c1eb12f>
References: <aqfqE4OLhnN4a1lW@b65e9c1eb12f>
Subject: Re: [PATCH v2] PCI: imx6: Avoid dereferencing a NULL clock name
Message-Id: <179197995736.38040.16523239820411551777.b4-ty@b4>
Date: Wed, 14 Oct 2026 17:42:37 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=57pibpZHJQ8PNUTQdmsvfInl1FuFWliYpgpnWYMvTOc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqz3G7KyLfJwopwyubBI2cQyz05Pgfv7a6bBmIO
 GuKeAj9B2GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas9xuwAKCRBVnxHm/pHO
 9f0mB/4hu+0F+duNvinGllK+1Hhv37pnBDPebIMwv3Ligu+r3lGaVU8q1a95LUKPyr/xx5vywU+
 gmIl2GndmGc8dAkpT7O12EbYixW+40Gr+JsRSJzFw0+TCEvzx4ayCDyNwCkSeAfagp0+9BaMKAv
 ZVTWUV5eRNLRDQegH5uUdDFkkVKtccEP5IPPx2/qshCSf/Gcbb67t6gn74cSr/BYAv8PbEdWjjm
 gsGZay4vEcKxNJx3SUVu1J0SQVMqDSUpTHFz/UDzWczyCobEjumElMRTWYgJwS1iietF8hXEc+y
 uX8vzO/ccIIWqJS0GYu31dpFBqTypaSYJq7bpKiZuGrkxY6m
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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


On Mon, 14 Sep 2026 12:35:31 +0000, Rudi Heitbaum wrote:
> PCI: imx6: Avoid dereferencing a NULL clock name

Applied, thanks!

[1/1] PCI: imx6: Avoid dereferencing a NULL clock name
      commit: e6fe37efcde8e7f81581129ef4e57ea158f38e40

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



