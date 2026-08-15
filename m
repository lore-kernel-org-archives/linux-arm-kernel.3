Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A998C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=; b=RBfMFhOzHAtKFOW617EqEnc6fi
	XIxIX9WDrmKQ1KaaIpKuP8b1x3JlbPyajCk9Q7i1f7KzbQ9LlEdBjW0i/l+rS4HECwrfcB2Z/JeUs
	vphakInQ2cXaa896Crq+mN8QBUiDPnc7VAMNo4V2WOAuiNbKxHfCpO3IhxJBOKx60mqivLb0iChWp
	Dz4MEAwF2ueNBQCcGy9P5Dm5z1U5Upkx/faEBkISCcHI9hoxV6HiGZbRFiAQIa66uNpTJWoEzJR0t
	yZ5r4HZlB4xZXr4s0OHlY88lfpfCD3ib4nkV4dtJBbImDUKDuomYyxgPjRq7YhJqmMFkMeC2RuvAT
	iBqpSauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv8l0-00000003cOX-1cT0;
	Sat, 15 Aug 2026 07:24:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv8kx-00000003cOD-4C2j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 07:24:41 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1587503a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786778678; x=1787383478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
        b=X3yWltWt6/w8PUr50uyBOqEAiLS/+RhraEtozGTy1HFTOTqQ2aXGqhN0zBWsb0FCb7
         Y/g1iG0c++bQ0gCN8ACuLZLkw/4RhTCwFwUeS98sZ7uKPiPzmtaKtBBgspWTylojy4dC
         lPs6Jhfbc2LDG4mge74NxmzeS8nPZTb0AVGkvQb1D6inHxLHVZuDQ8u8moY4vQpP2bW9
         CeqMa3p8Ov56+/aS4c/7syOlxma3jw8OCm7eyz9zokA26LvdyDi3Xj/dI6Hn1V7bci4t
         rBgLNVRYpuOdCCvZyOM3B+DUnBn0VgDKJL5kT1jJpQC7bxjMIf6e5P9oKuyiKog278Yj
         PtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786778678; x=1787383478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d81zRYCsqoH4yC+fFuwiOVWQ7sGjNnHCn37vF9eBXco=;
        b=JAf5Nb/EuVTR5XMmHEVeGsnJbiA56M0tLYc+XePsulO2jrkktZVvuPbXHkZCG00J8P
         gf8/D8Sc67+uGesBnf7lBYImY2NrLduKUwKeJ0lblmDb2h/Ac0fV4GTMgkK96yMdXlTY
         zmgdUF5UmZWibOwsP0pe9/rJZtq736TM237iKbxK/r95G9YKNo9NGUVju6Z2WoxnRsf8
         ZR/DhNByJk61XlB9GHz0ORw3bPo+cRzmtijy1v594pVktzIesQsiyAAE8XgaON7BncnI
         tYFrzfWVDdms9d/n/uc+lJdz+lPg3zCPct+PwC8DScN0fE7TASNQHbnfkhsO7vwE/sDx
         n0hg==
X-Forwarded-Encrypted: i=1; AHgh+RpMQ5hS6ebt5018d42jEAxVtzQqfqvVe/4p4d2gJL8bl1Xas4OyMPHIGrb4sJhwFK3Td9Vy0Q6GSjH+bxhG5Sjd@lists.infradead.org
X-Gm-Message-State: AOJu0YwC/Ystxmiib806+DvyENkWxlC1gr/EPmVuRQZ+9/rH305ys2qU
	9MdTk7eK68nTX8mhVt+Zu+2Spzqn6ZP/Y2ug0Z1F9W2VlAvFQntmx6s1
X-Gm-Gg: AR+sD101+e50oBumeHyiesBkUK26HqL0fIb7GM4q50qbmxbjM8lOocmdnhGKvQ6wmhw
	K5h/XwiBTWeJVkamrzhZc9ilnisyvg10QJ/ruK4BDmY00C0swUiStzUcVWg+Qcuv+NoLurBZfvW
	15sOVipf8YLl94dUR6jez1nI+K7pZr+ZTKYlyNB3hS4fBvVKY/l2fG5ZUZp/WQN6X8a1550uK8/
	2GxnDFACF2R71LqpcjYI1LVUI4pSEvHBXc6s8sRSNF5M/YReecg14JurcBfCB/zrkbVUmwqq8GT
	VU5er52SjqPuzVAe6Xj+F3P+ce6jw6I6b65QGUFDLTqQvmHHBGkimN5WxyO8M5o97DiXH8gcVRN
	D8LD+QmhkQ2eEflQP9V2+XAvxKLHD4stP8WIXhP4efmxmxeRtMH7dabKKpokWmcHv71EGRM78am
	MrO2+lO3rPIPjLI9OZFtq8jiHoUpUkv8cqO/n5pcyKfp8vvYpIXYavpUgixIcx1POdKQmREv9BQ
	RYacA3Fa1Wy
X-Received: by 2002:a17:90a:da8f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3933b95e327mr12509086a91.14.1786778678185;
        Sat, 15 Aug 2026 00:24:38 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm27142118c88.8.2026.08.15.00.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 00:24:37 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@kernel.org,
	vkoul@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: fix use-after-free in descriptor error path
Date: Sat, 15 Aug 2026 07:24:17 +0000
Message-ID: <20260815072417.2636042-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
References: <an-B5SdpGfsJoudH@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_002440_038397_73C5468D 
X-CRM114-Status: UNSURE (   8.46  )
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

On Fri, Aug 14, 2026 at 05:00:21PM -0400, Frank Li wrote:
> Drop review-by, I prefer use below method to fix
>
> https://patchwork.kernel.org/project/linux-dmaengine/patch/20260727061142.44195-1-zenghongling@kylinos.cn/

Thanks Frank, agreed. Hongling Zeng's series is the better fix since it
reuses the existing sun6i_dma_free_desc() helper instead of open-coding
the save-next-pointer logic in each error path, and it removes the
duplicated cleanup loops entirely.

Please drop this patch in favour of that series; no v2 needed from my
side.

Thanks,
Chaithanya

