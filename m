Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ACEC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xFlDqgj+7IPtto9fJVKoN7wW6UvRYgPIe7Ac0aUbRs=; b=AjYQzdHcNIAHwS4kMPtPkbXWSF
	hxlSuhqHSyiklEPrTSmJNTIRyWknz9fKfXrK3uAUmVSRcP6dWzD2hDrzUfMkFCyUhllV5xaEY1dtS
	vg1cxve1I7xx61AHhhz4qXjCS0jL/LBQm7YN8+cigVmaqe2Z3spz9dBaPuBsEN0dS0dKunKnY0603
	EXCXyz1pVFEmu29Ymq5K0n0nGWistrjPUt0EMDUYR+ZLLE80Wvlj9OzUQRFAzwo648dOyPIBE1Wm+
	1omNAE3WmqjWtMQkxMzvMbgtR7E2/782Ye7oUlJ8Jz6kgZ6opKG3EkL0ORPVL+EuIXVEYrATycVzl
	AyRHPS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UNP-00000002IA4-3O24;
	Fri, 04 Sep 2026 13:54:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UNO-00000002I9e-3qNK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:54:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 983BC42A7F;
	Fri,  4 Sep 2026 13:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC3A1F00A3D;
	Fri,  4 Sep 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530082;
	bh=6xFlDqgj+7IPtto9fJVKoN7wW6UvRYgPIe7Ac0aUbRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TmaBCs1CEeC/C1KYKJ6PD2fQfkERgH+0y/9fTEl17VLYixt6CnT8SYS+X51gXjh6Z
	 CYii+PXn0vNpQLrNLqbh5SJZM2wpTlELblBC4T/ejVJtdrJouEyF0AfpQ4dUz8AnIU
	 losxn4T0Hd3FMaLNy+SNdhVv+L9/divl2QxP9UV2slS0m+DJsvguaqMprUQCkST9Hi
	 XtuTq7cB8DMwer0iLmBVaTNaOziQKoi+wYN4NkzGam50QOvRzO9UpD/HvqGLS9dqsz
	 V6Amn45hvIxvxtINVqx9zmePqN7zty17DBVXi/n+tSgwMmthOarIFqXeX3ZVOVMGZV
	 cQazZRinsPPdA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mmayer@broadcom.com, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260815134559.47888-1-pengpeng@iscas.ac.cn>
References: <20260815134559.47888-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] memory: brcmstb_dpfe: validate firmware section
 sizes
Message-Id: <178853007977.24196.3488069210223537136.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:54:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sat, 15 Aug 2026 21:45:59 +0800, Pengpeng Hou wrote:
> The firmware header is read before the image has been shown to contain a
> complete header. In addition, the final size check adds two
> firmware-provided u32 section lengths before comparing the result with
> fw->size, so the addition can wrap.
> 
> Reject images shorter than the fixed header and checksum before reading
> the header. Then derive the available payload length with subtraction and
> require the two declared sections to fill it exactly.
> 
> [...]

Applied, thanks!

[1/1] memory: brcmstb_dpfe: validate firmware section sizes
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e61c1a1103e2617e8f86288368911a8591e35c1e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


