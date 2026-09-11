Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E24C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwWyMMxaCtNDet1+YlRZ1iSBj+9uB0p8x9XQ2zZ2thg=; b=yqp8N9OQh/taEtmUqnpzGbnpSA
	3PUWledqclKiyrCpK50LmxV6SM4wswGFYX1Ce7EsH+SwJG1CUEgBEYDLNO2AfVwS+7df/KwIYgLDS
	I/ZJUdZwiIpB+0Hf7yneN0ClXdsugh4zFIcdvywjiEEybkJq5E1+7wkeNheywm5cllMQpOOoLbgW0
	KfGD2gThz6C2T0b4U+86ywMgVLRS/QAQARCFRjt02BvjV+0yxinnaiLH/pKWs/5PIzgeIdavfoGYB
	2A7Q10S0CC0rq2JiAOQ0HArSQVPofDc6n8ftfYfYMcT6vqDzz0nJ/2wXqaIPjL6xdydoAu37XH9fy
	ZL97O8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tj8-0000000Frm4-39T5;
	Fri, 11 Sep 2026 05:23:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tj7-0000000Frlx-3a17
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:23:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F8CD43A04;
	Fri, 11 Sep 2026 05:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED521F000FF;
	Fri, 11 Sep 2026 05:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104185;
	bh=GwWyMMxaCtNDet1+YlRZ1iSBj+9uB0p8x9XQ2zZ2thg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BNd0ZE8eJp4NPkAUIq71VAEFFIa2WTMItObvLW5wdNsE7OMuzx6lMjdGo+0qqylX0
	 V6doJOg0wBEMYaA5iurgy5OniZTbR4VOJgZ2za6XnN+TXgIEONoIwrOIbnqQ296zZU
	 p0iiIRmcYUzBl1oqALWh72uiGsHyUfL8rYD3GY1TJBGnR1gCzXI5ZFQ0EhPvIUFBXk
	 3mjxtzeuIjkEsKd3Gzzl7nbAdA8suJ03JPKA2NfbloRPUiMlc8L/yeUcfY30ojhQpZ
	 nZ47D5eA8QAhP5QJC4yp9csofJr6TRNr3GPsmpjGtx67t03cGYbH6dXfY/rCNjpdLf
	 PxZkUWrrSg9Zw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Date: Fri, 11 Sep 2026 07:22:49 +0200
Message-ID: <178910416257.316287.11748008875206660253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
References: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=chleroy@kernel.org; h=from:subject:message-id; bh=JgI8yiblDDqh0RKocIkn7ftaSlBN5bEMR22YME0ulgM=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQtnqBzKnB/8sb9qptWf3i9IP/AzOeC8k+/Mk9YfN0yo mLxkifxvR2lLAxiXAyyYoosx/9z75rR9SU1f+oufZg5rEwgQxi4OAVgImJ2DH84c4O3JK1QYJ19 VPamddAKU8dTn/adb725Yn3iti/azy9JMDK0uTokr1SaP+OwQcMOdpmVfJdTVzC2Tq+72LBlftx VuTXcAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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


On Tue, 08 Sep 2026 11:27:46 +0200, Bartosz Golaszewski wrote:
> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag for gpiod_get() is deprecated. For
> actually shared GPIOs, it should be replaced by using the functionality
> provided by gpio-shared-proxy. The Freescale QUICC Engine GPIO driver
> uses it as a workaround to access the GPIO descriptor already requested
> by the caller of qe_pin_request() in order to access the private GPIO
> chip data.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
      commit: 31d42d67c6eb66efc058069f426d69abb48ec0dd

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

