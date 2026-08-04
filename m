Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14373C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=; b=vVnH54+MTxLsyu1Ptyoj3v1qjf
	Ve5aUvD3MsA1ruz/nF59Sx1RjnGm/wrc/SrngoGLs2KcQO3L9MLhVuqhhdTqvQAMnEmfclPj6l5dk
	6TdQQkS2380Nu8fQ6oAWj2hEjg7aXkCi5xl99MOaoOaTNx2/u0wn1vCHFOUpWzT41KmRzJ8Bbsk5f
	pEJ1YlKnHfLl3g/9IPTg+vcXdetLsKXdpWWOI4Hnh4oIOOzaLXOrHJI65xspHo26uYJ/OSPfXM2ca
	Papklck7fTBLbxDgfY9NmpDZJx4Aq6TqJTk0unqsvp7Jel3gTDhRKGO3dTAH86VGs1VstshjD47Ad
	f3jFLZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAnq-00000001NAD-3Yy3;
	Tue, 04 Aug 2026 08:47:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAnp-00000001NA2-2ZYI;
	Tue, 04 Aug 2026 08:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=; b=Fig1qQzut8m/7nDwoDb5j3P0Ag
	C6JYn3vjSqaMBaHaInA9Isk0IrefqJeeoECB/MxyrCESH2u6EonMer22PEexPDBEHE/TyvkdsQ3fj
	nC+H7+v+loik+3+HNiASQHl6Ud/0VWd/Ey7tMhKdpSXGNiQ6qWYpeCuC5iwiDtYHTJE6a0/rnUnZd
	0u1EvJvIda2RJ9pRm3YicnrxMutrUdZKaspUNdMzGspDb8rjEKHkD4i1EDfRD84FR3IaVcRjLkgdu
	SXrOTS2korq70+TUTu+ZTkdF72n644sPq0cemK2N3y+cYCeGxEUBGSxPgO1gbBl1JduD6oSLuqhGf
	2VXrHIaw==;
Received: from mail.zlab.su ([109.73.193.145])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAng-00000001WcX-28cK;
	Tue, 04 Aug 2026 08:47:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A0FEBFB09;
	Tue,  4 Aug 2026 11:41:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1785832890; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=;
	b=WVonSWmmuU1u2sJCvrqoqoiWAy+2kv1AUSk8RwEiMQa3zEZn52QUrmmL+FxHHYKfJERL33
	8uRAEdfI6RCE7cZclFr5s2JezDf4xgSL+mUhJI72zuLk55jWAxRJwmoYgzQ3cmmjWTWO3L
	dnI3MU4mFKBXHkgIAA0zS7szHBUp3fW6fIt/igye6wFlylQHiglcn9JHkBfQDp3tm9BqdP
	0rcLBUdWnA1jgDL8LiVylrjoSFOGZvLHv/rF0aMD3HvpOPCCArwe7KzIgHT1YwYYL6jOqK
	7zPIRxUIJYDztfE1g/88UAzlIqTscJsNFflLDVK3HwrjGNGwsyrjmAPNI7cuAA==
From: Vladislav Leonov <vlad@zlab.su>
To: sjg@chromium.org
Cc: albert.u.boot@aribaud.net,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@nabladev.com,
	heiko@sntech.de,
	hl@rock-chips.com,
	jeffy.chen@rock-chips.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Vladislav Leonov <vlad@zlab.su>
Subject: Re: [PATCH v3 4/6] ARM: dts: rockchip: Add support for RV1106 and RV1103
Date: Tue,  4 Aug 2026 11:41:01 +0300
Message-ID: <20260804084101.11628-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729133609.3465563-5-sjg@chromium.org>
References: <20260729133609.3465563-5-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_094704_824015_9D5F6E42 
X-CRM114-Status: UNSURE (   4.98  )
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

Tested on custom PCB with RV1106G2.
Comparing with the V2 series, GPIO now works without any issues.

Regards,
Vladislav

Tested-by: Vladislav Leonov <vlad@zlab.su>

