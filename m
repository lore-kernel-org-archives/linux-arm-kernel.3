Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB133CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sfoe6f9keiheg1YT2XdDIlcmVfY0ilROQRp3Qnb0fyM=; b=sGTrQsVmEyHHbCP0RJeNNA1r7v
	TJLJTQxbt0y1qX9cmLxf+hX+sJoWi0oi6O559lzmtDWXR1H95ihhzCbMm7LPf1qPsVn0lGhiAIZ3F
	V3T9oedQvt3tFCOW4oHoOC/nGQCGwN+v0EHc9fowrpv1McsLCl+1PVRHtHzT8/+ZTGPLYFZ9vF2Ua
	ghrVVBnY/SEoejU5xJkntydlgd/WBv35Cf/J2bwSCxI9JlBVDWqyUw/QO3Lb3XU7wIFNXp3KXkBU/
	+Dq9QmwZ3ET492Rjt1vOVnu3rX7uKNOqSnxKmc89rQLM5V8M9bQsyKzyWaIQ88MmqLoxEUAB4QO+S
	ksXnes5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BcT-0000000CKHA-0d0r;
	Mon, 13 Oct 2025 06:01:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BcP-0000000CKGQ-4AiX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 349FB4097D;
	Mon, 13 Oct 2025 06:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2E5C4CEE7;
	Mon, 13 Oct 2025 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760335273;
	bh=1ap+MJcPfkNA5oVgftpQ/EYbo9aqD7bOjQWjQ77cIbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaSHwMsHgqQemegBnH4z3oFtqkOsLT1IhDEMS/coRuLAZoSlTb4Zs0o/UGOmLsK9n
	 RT5cyg951w3iTn84isKeDXTtaa6B2TN0/HlFVvI6oAxHRaxsEDNhZRrFU76CqYMbpK
	 zI85mwMbLeA+MwKebVlrEecroqp/YvpC5OqTRonT1XgJ7vlBFdhcP/aHkksVJcraQ8
	 XUPdW/zj6k3Af6rh17Du673XxKtIWcyjpb9i+ZFB3keNfkcPihDLignvGdGIS76ji+
	 kNJDXnYukWH7KdM8eeIEfV7PX/bx6+m2ZJ850+OrTKrX8VlYVzb66w2vaO933HFCov
	 DesJsblSJ2Nyw==
From: William Breathitt Gray <wbg@kernel.org>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
	Dharma Balasubiramani <dharma.b@microchip.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Allow shared IRQ for multi-channel TCBs
Date: Mon, 13 Oct 2025 15:01:01 +0900
Message-ID: <176033523436.106204.9869251013103555876.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006-microchip-tcb-v1-1-09c19181bb4a@microchip.com>
References: <20251006-microchip-tcb-v1-1-09c19181bb4a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=730; i=wbg@kernel.org; h=from:subject:message-id; bh=FfihZzLUnWdr8UZTAyufw7Pkrq9SwIy86X5nsYJ3Io8=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlvpnZOLD3YYij3rHVJaMIfn71LJ/Mms2v6vd137m3fI 7/pchLiHaUsDGJcDLJiiiy95mfvPrikqvHjxfxtMHNYmUCGMHBxCsBE1tQwMvR8TJi44XOK/feI O21d/yTUDj3dPD0rZ4uNX9zDjo7zZqmMDF2qd1huvl31ZjpHTaS+yBmNX0ayFuKeB8+qSbxm8Sy 6zQoA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_230114_048933_130F94F1 
X-CRM114-Status: UNSURE (   7.15  )
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


On Mon, 06 Oct 2025 16:21:50 +0530, Dharma Balasubiramani wrote:
> Mark the interrupt as IRQF_SHARED to permit multiple counter channels to
> share the same TCB IRQ line.
> 
> Each Timer/Counter Block (TCB) instance shares a single IRQ line among its
> three internal channels. When multiple counter channels (e.g., counter@0
> and counter@1) within the same TCB are enabled, the second call to
> devm_request_irq() fails because the IRQ line is already requested by the
> first channel.
> 
> [...]

Applied, thanks!

[1/1] counter: microchip-tcb-capture: Allow shared IRQ for multi-channel TCBs
      commit: 109ff654934a4752f8875ded672efd1fbfe4d31d

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

