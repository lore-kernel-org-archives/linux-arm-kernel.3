Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4939CC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3EiMZSRShemmN1kKxrA3UwxzPeHRepeyDfZJmIBpwRM=; b=xxCm2xU7TWVApR
	nxP9CUV/XL9hX7uQit1GsQUtJmpN1ItdNJbF4Z03Hv9CnbEipXSdjherU8BEznpFRerbU86ZCOWOO
	LKlANjkhzMsLOoNgXYNUYYnQGhK3GQsJlQnuCxuB2Ui46efXQc/yeWH9CTxsaPkayKHZ88GGBtNGo
	rk5Kv15Z+p9N3OPaZHG7IETHvKZBPACmuneQp0bNO8VQFf3bmIhHa8CnY0npKxB02jlIYESXEo4fS
	9lI3cVyAuJG2LZYEqI8cHoHchsXOBPvsIw2gfYUw5Gx0PATGPKQoQGs3RRXX386Y2+vG4DJ8SshNv
	PVEuUMFamMzP59o/U8TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6RQ-0000000AJT8-0z44;
	Thu, 06 Mar 2025 08:18:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5Io-0000000AAR7-2cbd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 07:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22EB0A44882;
	Thu,  6 Mar 2025 07:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CA4C4CEE4;
	Thu,  6 Mar 2025 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741244753;
	bh=El74G6/NI0u0FdRCimXmohZXkOMOrBaMbRBx6pb9WWY=;
	h=From:Subject:Date:To:Cc:From;
	b=DFfLBx3NgfryZifDyoUEj913Py+XsgKqdaYhDhgmNRfM1L7AVrl7X6DAxSuLuWtqP
	 q/X+nPVpQvVppmgSLhkH/r7OfPfeHaVbVnbnHi26Ll7OEpxNh9tjOwU3cWFFYZRky8
	 WSaWangG70YS3ALg6G04e9ebvxkZKWTOpmHNM6OQXCjfLWtUKcChmznmmCaIqTEuB9
	 3qEMN6u1aHw+yywmbWQd+sRDcaX1MMdRliUv1RtxpVTEkNoU83gkRG8V+eczGzN3fr
	 hV9v//r9lc+6B87OocbFVygZe62ARX+NyS5fE7XIFvh0agUQDf3azkUb84oUOFmncw
	 lvG/3jHjOOPEw==
From: William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH 0/2] counter: Introduce the compare component
Date: Thu, 06 Mar 2025 16:05:42 +0900
Message-Id: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZJyWcC/yXMMQqAMAxA0atIZgttRRGvIg61Rs1gKqmKULy7R
 afPW36CiEIYoSsSCF4UKXCGKQvwq+MFFU3ZYLWtdaUbRXxImE6Pyodtd/I3MPKhjJmtdR7bdjS
 QD7vgTPd374fneQG4+V/kbQAAAA==
X-Change-ID: 20250306-introduce-compare-component-11f22ace88b1
To: csokas.bence@prolan.hu, Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=wbg@kernel.org;
 h=from:subject:message-id; bh=El74G6/NI0u0FdRCimXmohZXkOMOrBaMbRBx6pb9WWY=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOknPQMExE5tV31i2jGxe7kHk/5q6fR/Ni/P1tno/Eme3
 ZCu9PNNRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjARw+sM//TvJyhZxTBUSFSc
 4oi4Ff0z5RZf8crN2f9+/g6oYN0w4zMjw6rmnOCHEQ3zc28wXpz0aPLBXe8y5jk4lEsu2XJUPmg
 rIxcA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_230554_737154_F1AED415 
X-CRM114-Status: UNSURE (   7.56  )
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

In previous drivers, we have exposed compare operations as part of a
larger set of functionalities; such as preseting a Count channel,
defining ceiling and floor boundaries, etc. However, we've lacked a
standard way to expose the compare operation in its strict sense as a
threshold comparison.

The need has become apparent in the microchip-tcb-capture module, which
requires a way to configure the threshold value provided by the RC
register for compare operations. To that end, a new compare component is
introduced with a helper macro COUNTER_COMP_COMPARE() to create such.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
William Breathitt Gray (2):
      counter: Introduce the compare component
      counter: microchip-tcb-capture: Add support for RC Compare

 Documentation/ABI/testing/sysfs-bus-counter |  9 ++++++++
 drivers/counter/microchip-tcb-capture.c     | 33 +++++++++++++++++++++++++++++
 include/linux/counter.h                     |  3 +++
 3 files changed, 45 insertions(+)
---
base-commit: c2a756660324fceca26780a50950e6d91dfdc210
change-id: 20250306-introduce-compare-component-11f22ace88b1

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>


