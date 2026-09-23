Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5791BC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbucsJ+3HVCo+fnBVTshq59m5J/OWoM++tK/0t2rhGc=; b=PJGamOUok/lxkMW12FhJd20tg1
	EJ+c1Nb6LWpDSIasvDmjqTenCdNikC/GumGper70rSfVpRDcZTnlSeS/1KyNXKw7cBY/K99JqpnLK
	e3JMa+2ELLx/pWLtGjfVK6kmuUwgN47TjMKrl5ZOBbXOFDT8g859cmXjR7igAoY7KbWbvIew6fY9a
	J2IaowWLgIwpdeeMtHxShUdL/N3mRIdkpdNQac1lyKUkMsrrKQqIkIjz8+g6IW0gotL6TISgmIbEu
	JS0nPBTNkQaBnFNj2zGMH2RILN+uv/Na8iv0+Wkry41GaBrdUykGcmlkR+BSkcbo7HH7rgjG6fmpz
	TqtUEYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SaO-00000009K0e-3Vgt;
	Wed, 23 Sep 2026 19:24:56 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SaM-00000009K0J-1b3H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790191490; x=1790796290; i=markus.elfring@web.de;
	bh=CbucsJ+3HVCo+fnBVTshq59m5J/OWoM++tK/0t2rhGc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DRPibJSXlNIWxEZ9ayFdaJs15bJfm//UfiiS3OtWOi4/JgCUMc3BOuW6T7umWA7P
	 txyksBDDwLThyvo4bjkAsyzBm24fSXkYGTmFeBCrVOzcUbjJQixq9IeXGnegjqZG4
	 HzXmMcg7APR5vhpPPiFAgnC23SKjx/wYCL85lzacU0qvDqzK8K4eujfax4+AFoFk7
	 ObtfRzFlTOpcXYl7EExdOXdfM5oJ+q/tYe7mHYcrjSsVL+rynokst+gYLHm19zyXz
	 BKfXpkyfcBIX2yYguPNC69duezcNCoh4zFeL4lzlcw/fbZZhJjNAigJHQGOmWYPXZ
	 fqZF8BY2w7ZQ91b6TA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N01ds-1wn80y1bLq-00qrVf; Wed, 23
 Sep 2026 21:24:50 +0200
Message-ID: <fd2d47a1-b85a-4fd2-89db-fbf3a126d730@web.de>
Date: Wed, 23 Sep 2026 21:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ginger Li <ginger.jzllee@gmail.com>, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20260923083729.64831-1-ginger.jzllee@gmail.com>
Subject: Re: [PATCH] media: exynos4-is: Fix a race between s_stream(0) and the
 interrupt handler
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260923083729.64831-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Br3p51EyQNHCsR2s6TbApZmppOtvtxGqVAB2IiMUg4yoD5C9opm
 OR3l6RHOAjvpg/NSI3MU5WtHdP2tIvpkF/vHmexQ1uQWA6Rr6ln2JO3DQR9Ekg7IzqOLHON
 O/VVXAJS7fd9rZ9bIXhuGD4HdQrRtvv1ZMQvGwVT5kWm9Ib9EEayq/COoB4vbKvS/xTsc4F
 il94z7D6A4AYgxyih5Kng==
UI-OutboundReport: notjunk:1;M01:P0:1WiTbawrvgg=;lxJd+wE5pYB0/HlzhV0JW8FHa4e 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 ToWS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_122454_739319_9BB79F0B 
X-CRM114-Status: UNSURE (   4.23  )
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

> Fixes: 6319d6a ("[media] fimc-lite: Add ISP FIFO output support")

Why did you specify a short hash for such a tag?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.3-rc4#n157

Regards,
Markus

