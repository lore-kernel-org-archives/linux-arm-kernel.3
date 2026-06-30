Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EDBC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugwhfcxPpXyb5lcG6xT5ZSDZoRYaKnLUPCCn2ZRHAgo=; b=a+XvnCEG6fhsuWOK82B+JRXiSz
	TYEsBcIBVPRJqeAbRuFJLoeWgITVGrvMXL6lDgIgullronzxOYNzpnQ1l7NXyNV3qsMRwm1BrYXd0
	+7yMUCEw0K0YjPQ/bpu0CBKn2+yC+E0daDyM6EPz+2EyDBh9VSbVUNUJKtA/R3tLcE65yfWsGybWP
	W+KuvnWJPkQjOYYCycO2XL1t2jP61kE49A1U3+Oq0DmO4tVLJ3JpGoCz2xApH/DFHwGOYWqZ3OOoO
	apfEH79xpBduRh6vl8cjw4eojIyfjm/vqD31b+mtINj8DTDLHqS6WzHJx2qe0llJR1WK5I5QCIw51
	XKdEBuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUl0-0000000GQbh-3och;
	Tue, 30 Jun 2026 09:27:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUko-0000000GQRB-0ulI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:27:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 758F642DD2;
	Tue, 30 Jun 2026 09:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19491F000E9;
	Tue, 30 Jun 2026 09:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811661;
	bh=ugwhfcxPpXyb5lcG6xT5ZSDZoRYaKnLUPCCn2ZRHAgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jEZxTv+lThopYW4B4p4Egdjl9Ff05qgLMXCc7yPPquOYegVualcVPi498yst3PDxP
	 VUo4vKal+BiLimjB2Y/UE4e3fc31PFLI7b8hmuEh4PaAxYEHoLxo2/tdbatniu7UoJ
	 Q+462KE+FhEeIbXL7qak8IUGBwp4ox/Iisn6qKFsWqqWuzEHJIqtNUaBi1OnmwIjol
	 KZVPrXA1hqVCwVlK53/mYeWChGIQCLYc0JgJ/BUzEyCKBUFuOHi655wnZqqfkkg8v+
	 D+RnHs/mxMeKOCx5MCb64ziMXOeBIVTYpccGsBg2PfU/1N0l9QgQTk8MR3p8ROfB+w
	 Bj3o2I89MP96w==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Subject: Re: [PATCH v2] firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()
Date: Tue, 30 Jun 2026 10:27:34 +0100
Message-ID: <178281163007.1093271.9754656642307066889.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617-ffa_partition_nullptr_fix-v2-1-bc801b4ce34c@oss.qualcomm.com>
References: <20260617-ffa_partition_nullptr_fix-v2-1-bc801b4ce34c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 17 Jun 2026 16:35:00 -0700, Unnathi Chalicheemala wrote:
> ffa_partition_info_get() passes uuid_str directly to uuid_parse()
> without a NULL check. When a caller passes NULL, uuid_parse() ->
> __uuid_parse() -> uuid_is_valid() dereferences the pointer, causing
> a kernel panic:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000040
> pc : uuid_parse+0x40/0xac
> lr : ffa_partition_info_get+0x1c/0x94 [arm_ffa]
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()
      https://git.kernel.org/sudeep.holla/c/8ae5f8e48366
-- 
Regards,
Sudeep


