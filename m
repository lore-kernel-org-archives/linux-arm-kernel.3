Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6CACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaVqlPxzNpRMBnQnw+EctKbIaA2oi8VgOSAculcBlas=; b=W2d0VoiDcMuM/Wbvk8IfcjquQz
	T5hQyUWXXjIw/1LDzP9KKahtxgzCgAgoGBO2IJ+RQuj/fCgJ2DT1fl8OqmeUFPp1h/CLRmTmoHQZo
	+nMJ3DAOI0R0JWMXOuwNpGRbmkapDKTtTow6Msc+jNcDq+SczR/3ZGqp790PZgN+hwAO6TKnpgCtn
	psdTHkg5qknwXErp93U6cjZsBJMoffpGr46FMeXu90zx73RTuzZb2hpZjK3MqSSIsDbhJpEMhoj68
	MQxWPser+gk3VdE3WPqHWK55drL6ELoyUZvWB72dKig+2cTw3lGO2oug9MgZSl+ROlNeagFeOJPgp
	khwv39KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oGX-00000008b6Y-0zeD;
	Fri, 17 Oct 2025 17:29:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oGU-00000008b6C-14ED
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F8B44613E;
	Fri, 17 Oct 2025 17:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0F8C4CEE7;
	Fri, 17 Oct 2025 17:29:15 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: debug: always unmask interrupts in el0_softstp()
Date: Fri, 17 Oct 2025 18:28:37 +0100
Message-ID: <176072211693.2071457.12794183998113158672.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014092536.18831-1-ada.coupriediaz@arm.com>
References: <20251013174317.74791-1-ada.coupriediaz@arm.com> <20251014092536.18831-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_102918_330196_2CF4EC9A 
X-CRM114-Status: UNSURE (   8.34  )
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

On Tue, 14 Oct 2025 10:25:36 +0100, Ada Couprie Diaz wrote:
> EL0 exception handlers should always call `exit_to_user_mode()` with
> interrupts unmasked.
> When handling a completed single-step, we skip the if block and
> `local_daif_restore(DAIF_PROCCTX)` never gets called,
> which ends up calling `exit_to_user_mode()` with interrupts masked.
> 
> This is broken if pNMI is in use, as `do_notify_resume()` will try
> to enable interrupts, but `local_irq_enable()` will only change the PMR,
> leaving interrupts masked via DAIF.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks! I used Mark's commit log.

[1/1] arm64: debug: always unmask interrupts in el0_softstp()
      https://git.kernel.org/arm64/c/ea0d55ae4b32

-- 
Catalin


