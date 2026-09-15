Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FAAC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=580eTFP1NkimzWPNgS+9nYszud29IW8q8yHcoG0IgdQ=; b=AR+/uJq/2gnYG3CB+ybEaZzPa8
	JBa/5OqU1CL37Qsa0eLGxaR7Wh6v50MhNEVH62+dMLVZhUbL3ezhU9BHMhnNSfv/QeZdDTP+8P/pJ
	S7qngxIDfXFMl5SVVHYsx9PQIeD0JBMPrl0dwPZ2cNkwfjPNDmLnb0wsZdTFiwz5kQwhiSf/k73VR
	I+FlzKOu5QZ5oFuvY8eZNjn914SX7dxeFbtIRaMry8+8pRGNkQt1QVWbSfOaQ/qHXcS9NDDeShRqt
	MEO79fLDjWCyXyd6K2HjNpxwQRFALvQtM/aoct6pnLhok0hlj20OR2x29fOCYkO0f93BqZWEEiYR9
	1sqnaFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wu7-00000007a6p-2FJH;
	Tue, 15 Sep 2026 17:25:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wu6-00000007a6d-1uJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:25:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE975600CB;
	Tue, 15 Sep 2026 17:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC2E1F000FF;
	Tue, 15 Sep 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493109;
	bh=580eTFP1NkimzWPNgS+9nYszud29IW8q8yHcoG0IgdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hO3gh8+vlntlL5nCY1tQn6k1zDAHMnNhEaIOgyPOt+/Rilu6mgphABwRqdxLGT02q
	 kxKsCXquKHhovd+PyJ1lRSgNLyF3HxG2F+azgQHm0L9+6W6efGDY90b10Z0yfvLAKY
	 7iUdzTEPvXEf771V4jmgSZ9RIdGJOx5aBB9asLDHzU+7/Pw2oz2jWnk87nm/p56xuy
	 iLjqMRI8MlZTEbzjYUkKjzWoG96JymXLDE1Z3MTe16gtXShIqci+kHpXXhwS1NTpse
	 yACYL2FyaMdW9eWTkXVUZMAP4ZyaLc9fSS2EHn3WcUYIhhfE+wTXq+wJAnvYQc1kxv
	 vXoS24MlOWtXw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Roland Dreier <rolanddreier@rivian.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()
Date: Tue, 15 Sep 2026 18:25:04 +0100
Message-ID: <178949307034.3922413.1605841752391153227.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909-scmi-raw-v1-1-de3fa75d2c6f@rivian.com>
References: <20260909-scmi-raw-v1-1-de3fa75d2c6f@rivian.com>
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

On Wed, 09 Sep 2026 17:58:59 +0000, Roland Dreier wrote:
> When the is_transport_polling_capable() check fails in scmi_raw_message_send(),
> it returns -EINVAL without doing scmi_xfer_raw_put(), which will leak a
> struct scmi_xfer.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()
      https://git.kernel.org/sudeep.holla/c/1adabdce41b9
-- 
Regards,
Sudeep


