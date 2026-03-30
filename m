Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE9610D14A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AHSDof0KAzWcvvVxhoaZ4n0EvtXVRbSZ6QprnFL0iY=; b=tgr62YR6K2ksRzgYo8W/PTwYYV
	MiQqbd6ns4jQgUgoYzEjx4ikdTLMXNvtJ1n+L4AYdz7nPYSp3rXaC7w+4oE+lUsdXrK+d3VTyaefp
	cU9Y8s8+wKXJoAhAF+XDphoG74wKMjJJk6d48wWxoYyfyGV0rnI7GZvjJJBJUpfSblJeWzO7SwhrO
	4FsTLxTDYViL0Rr1gIic7zrFrL/dkG9V4SRk00pcYJqGXFev1FggZdHDL34X2PBJCmzPYttBNg9k2
	VlI/2WGpNuzwL7/fItlHL3Nkmzp20rdged/PjrxbUGztYV6mwY0LvRWyM5oERktijiJcW3IKX1CYp
	oNC2VO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BcR-0000000BF9E-00OQ;
	Mon, 30 Mar 2026 12:21:23 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BcO-0000000BF8J-1bGR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:21:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b258d93ffeso2840525ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774873279; x=1775478079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AHSDof0KAzWcvvVxhoaZ4n0EvtXVRbSZ6QprnFL0iY=;
        b=N9V9cebGN7050CWpCoW3fggbOVUqtGuU8qvE2p2Ny+A3YRv0GCRlnDs0XuC1BKsf0j
         jwcAnmye3cAq/O6ESNd77cqFL7YxxkoLKMX+5qEIkB8OGpYLG2j7h+b/27sp0frbvLt2
         Qgvw6qEEu9aSXFr9MiCIc5gbm2Q8Q7nVomSLoP3ep93uB5suiyp28svAdthDqzyTOrge
         2nROUgma27Foh89axXLhAOA5+CO9lXNOogPFH5duCUfJG8B4K/hzM9kLnmjjjCx9aTDH
         0kPiMTtDsjfCifS64kZ1DBkpHmajNcIngwX+1kP/7kIi/5P0+Ahw770B28cNt8lVfxkG
         iscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873279; x=1775478079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5AHSDof0KAzWcvvVxhoaZ4n0EvtXVRbSZ6QprnFL0iY=;
        b=mIx8nGW2LqTxeSHGI3ydbk76baABYdU4uh9xpOhqu5fklD9WFTwc1y8cTZPb7mto2W
         nTWB1Rvv9TMXWM5sE9eP8OL9WbmoRcuACHN50Dp+IbJ3DQepUQv9nvucfnecBnS2vfLM
         OIRYod5LZft6w9DkOkXyMgPmXMQjdGqRckn4VIwBW+Bnw/FnYHYvH8bnzYxc9kfQ8Vaz
         I+qC35eMbxJhBLMxBqyyh7fll9sVLsK+mFJyoT2T5f35nP34n8nBWe89kdAMiRW4mT2b
         bpZg53PmiB0K4TJznVYPo4QvNnLoy4OMUkg0ND827GlczWNMcQdbt/wHyu+7s2mzuphV
         5QVw==
X-Forwarded-Encrypted: i=1; AJvYcCUhv0PK1Lwwi+3vx2GieVBqUDYRjlck+nGv5xjNaKYMKGXUcYb27CqlEgtLSdr0Wi7cGGWyAiMJz9xBG43sgbHV@lists.infradead.org
X-Gm-Message-State: AOJu0YxV9ouy+ZfJDSAPPEyOh+mPScm+D4iG40bP1Idj1PpMcEMCbpND
	CDPLyoJ1XYU/Eol97rdtbYFZLaLbQN+k6hTOrtHYUIIUhix91YoKp/Sq
X-Gm-Gg: ATEYQzxB9BAcWv5UkRpbkRkiu8yBCtJGlth85OFyw4yC55ucZKI7qYai1MLajU6Bw6f
	Ir78q4/Uw7TBLE7aBt6LonKoLjgMmOfbvJyygCm+4rhtFrS9YErWYoQNkTkixW5ucs8l1KOSH6H
	tFPMXs3uozcaABcIpCoQO2ZlSsuNJ8NCBk6KUQqtdVqrZD7nPluQDNKa+iRiNHVJRch8hjSXiz0
	TIADWtLl238E0KL19xFFUP/P0ikTYCapXl5VyUOMYrCHYZBnw7UW0s0iQ8yvymuf0v56dk4cQzo
	TEgQCk4Mp4pjwrf7KhS6ooadoX/GETEI0eZLfoXQTkdEssls1DVdDijaeeuwBAYCQtDw+CDhkVR
	KiVMI7PRDbxxTza6+zjxTBNNk8NftyD44xVQFJ3FTdBTzaMNCUWo3VuR7W2ruNU41ru5phW44zY
	tJVllca/TcafHZ5WPWQRvb2iZI
X-Received: by 2002:a17:903:138a:b0:2b0:5770:d484 with SMTP id d9443c01a7336-2b0cdd04936mr123264365ad.41.1774873278711;
        Mon, 30 Mar 2026 05:21:18 -0700 (PDT)
Received: from bsp.. ([2401:4900:1ff6:b7f6:a801:e6b7:b7ed:4aea])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427658e4sm96406185ad.48.2026.03.30.05.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:21:17 -0700 (PDT)
From: Rahul Navale <rahulnavale04@gmail.com>
To: marex@nabladev.com
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	dev@folker-schwesinger.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Mon, 30 Mar 2026 17:51:04 +0530
Message-ID: <20260330122105.3670-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_052120_420057_6A728243 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Rahul Navale <rahul.navale@ifm.com>

Hello Marek,

>Can you please add [1] to the patch stack and let me know whether that
>improves the behavior ?

I added the patch to the patch stack and retested audio is working now.

Thank you for your support.

