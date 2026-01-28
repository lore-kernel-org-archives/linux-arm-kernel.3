Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FEBD35693
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgY+VD1JPRIDshJVjlRkrGjJN6ik2chDgUKnN7ZWi98=; b=RPMuPBy9kH6eNxpxh5CBl0aEdO
	01MMK+Vda0uyRrJ2OvuG6VtztBbBCtZKoFzPv9zBTzLaq6pLKcz8+pxMn+Y8KXNsJlOgYriVCdffM
	gd6JdRakOuWNyPgLrEVYmFaIR39tPmxW15lzbyy7IL4BrSlFpbxEYN0G9i7dCdzC/0vYfV0hlP5QR
	BlvDVdZX63/th47Ove0B4w55FLdFVQN1F7NfvyTQsBxzTmSqpBkRfEavVWPXeMmUNBt9Ghh9Z5Hqw
	5jjsaMkU6eDd3ivgVWCAL8GKSlgvNiFK8p+tqNZgV5vLvpwHT45otM8Kot8oEZYo3v5jNAEINeG98
	UrH43HXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3Iu-0000000FtHc-3w8a;
	Wed, 28 Jan 2026 11:01:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3Iu-0000000FtHW-0h97
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EB126001A;
	Wed, 28 Jan 2026 11:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE88EC4CEF1;
	Wed, 28 Jan 2026 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598103;
	bh=Evsupp5FNJNP5BJNiK4ytm0+NzTNTkn2FDzFf2nf0vQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nU96+Ytt+ws2tZy7+KxRNVw3X6ma/ZHPFb/GoBAVnFO3hzbWXAhddEUZLa/xcGPUJ
	 wmXuVAvL2U+xRcF+9HMsZnJS1wxUkQDWg+YYTrnYGNzpr/0v6uFN00piaNa6jaGGB3
	 v4IxiJVetEcjSCWfzlCxx00FJCxBrwX527IRf2p33xBztV3ii8+9ddAZGl2eg0u6RE
	 vj98QEskBtxXppCcORfYrKmuBoNB7BKW1WgmysuikAxe+YDIQfeozDqd+jO3XmT457
	 CzLnoGqa1+oEpn1dwPwyUPulT++RFOK4v3Upx/OoxVrtSjrBPsXoYouJ+kK8iWkMvX
	 wH4DEylcBcedA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: qiang.zhao@nxp.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install/remove
Date: Wed, 28 Jan 2026 12:01:31 +0100
Message-ID: <176959784390.2069162.369898481051336357.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260119055715.889001-1-nichen@iscas.ac.cn>
References: <20260119055715.889001-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; i=chleroy@kernel.org; h=from:subject:message-id; bh=K9TS4tuJrDcMF5FTNg6KgLVB8p+qHIx8ZqaAHWUIO10=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRWvumxj483P6ueMo35k8g/4/OP/NWV1R48sr71USYvK /oMg9K6jlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjCRw4sZGaZcWl9c/Yj/5Lrf i9J+hS7J3sxXwmnlPHlN8kdP84f9YesY/krVrf7DJmjZPHvb5qmK/+9t3c17pmLrYcPGpBR+hqO zjBkB
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


On Mon, 19 Jan 2026 13:57:15 +0800, Chen Ni wrote:
> The driver currently sets the handler data and the chained handler in
> two separate steps. This creates a theoretical race window where an
> interrupt could fire after the handler is set but before the data is
> assigned, leading to a NULL pointer dereference.
> 
> Replace the two calls with irq_set_chained_handler_and_data() to set
> both the handler and its data atomically under the irq_desc->lock.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: qe_ports_ic: Consolidate chained IRQ handler install/remove

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

