Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C38FA1FE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+Sfz/TbuXN6WiyV2mcY8E9Mqa6jAyuKik5u4nGTPy9w=; b=CQxtNLT/OLSE/a7MGAQ4qRgkLs
	AwHv4y4+hD+ZxyS1LIM7U/nTXiWgZLDof/ovDCcBBmogRJZBWzjKemXRK6rL81IOrDz9TxMcAiTnU
	vg0sAvVgq6bdYby/mgeP9QTc50zilmRLgNpeUwQ8HZw9PuvHZyiag1kj2sm6xhV0L4Gn9rWtTE1Sl
	Aj5h9LrDHLZcs9GRUJvnoDsZ5YKTBG3jt7X6S7BFOBeD2Yu4eJ1sxte3/zgyvSusjD1yq8B5pbeZN
	OfFzsv835uDQ/7LyZrQrqUqZRMGXwwcnwTY60dbihjHdemtnPDzEIkEHS8kc+okhWQEAz0jlc5yoh
	jqOGdPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcAj-0000000AcjM-1Fn4;
	Wed, 22 Apr 2026 18:19:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcAf-0000000Acin-2KgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:19:35 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b9358bc9c50so769361566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881972; x=1777486772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Sfz/TbuXN6WiyV2mcY8E9Mqa6jAyuKik5u4nGTPy9w=;
        b=Rg1zQJ8NavDiRtswn+NXyh3IPxVbUDUEbWDzQXqTvOrI9hhqZ5CV0/bmDKf2Xq6j9F
         yHKktNwq3wmDj/WqUepYipNhkwaTaJnkpbwShMJ9viMaqFbB2i4HLv4bsqwlrFVkMseV
         ILzuC+RueRKKG0qvgXr/ll7GkAxLpo7sSOW5tjYD4MkAD8e+ERjfvYrL66XwACm+Ww9r
         ldH3b2bTFSZDgQbayvjIex+88kmP9idgFy2EwCLb4gZ6U6OOf0QVnlmpWYx4nRdBBHoq
         hzkBBZpM0GQ6HOtZXFLD4RoJikaybNyPORS/vNHtmyP0Xiv+RgMLTlQZqStKUv/yjTvJ
         XGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881972; x=1777486772;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Sfz/TbuXN6WiyV2mcY8E9Mqa6jAyuKik5u4nGTPy9w=;
        b=TITQeYYiRvpeHOsxCxaubVSyQPZ0pISeZq4BZDPYC+QI7F3SeQ1yZ5cyabg6yh4ZoS
         t1eJA7RmxTcJz2+LVDzCh1HJji2sfzU4/4s8Uu8EewkbjCs/2QeseTo+gqhoTQbMFLpc
         LLmz0YT8lYtVeG99ZaS4KMf0KrQGZY6JFw0wotmXN7a5xFpLM6GbAfbQnyuo+jgerFOP
         Ex1T4mt1SQq9cPK3yN/6Q5r81oK9kRf0CrXA2hf0sP2g3badg6Ho33N+HNg6cvQy1Jc9
         caYAv3yCnbvo4F+zhO5orKlg7Jx1Hoc/mQRZmJwNud5JsSl6YVxcafgB3Vv0O3Ac9P3E
         Bljw==
X-Forwarded-Encrypted: i=1; AFNElJ8I5lU0gFclW1fwev1Pr3a4PBDNBGGZNhuf6xYs8UObbxvWJnhe+mdY1rRjUPRjKpGQ4lVF3dIHQtrsbd6xGM53@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1nxoJuJXB5zuX96Pmef6At1/apObWsWowdC+7y2frPX3747PF
	35Mw7vtW23YygsDkNmu5Hkv+ZOVbsyXyaoYaBxgQ3YbWpURdk//lB9Ci
X-Gm-Gg: AeBDievau/0eZfF3cGousda6KL/GyYir7fOQM4IGNE4YKC8C9DNfaDAI7Cqs+O3rcRh
	qlCGjwydfABL3lzonbUibYl/zrl0UW0ecKOerc2u0MEtucn7rG28+nQjPPQiPQ1JgHgY2EOYNQ0
	9PjbouK2D59xa7hTcQkveBZAYl51uZNO5Bv4pWL5YFAZTSxckI7FNQDdOKp5LMkRaP93wnh6TY2
	6qmRSrfOEA8yHEcXQk+NfQQjUWL6gWQHKVu1xbq96Q3lbNBzHgl5AUC43qLCtIh/yTXJoxpI0EH
	+gXkcv0qs1UhCMxoxOZ2YMlc8R5z2/X37w1lmgl6KV0Y6Wl2lHmUkLF46R40oWJMl7eqsJ741t9
	DSjiFb9vgiILRBWJsd2udIhgyIYoWrmS/ykVhzkjGqMbD4Ac+JLE46QEDk1hOzagUB0i23IEbSU
	uQipk1Z1mycdRN2DaLFSEGEg2vSBrvMqB9brnb
X-Received: by 2002:a17:907:9308:b0:ba7:34cb:388b with SMTP id a640c23a62f3a-ba734cb3cd2mr794916766b.42.1776881971338;
        Wed, 22 Apr 2026 11:19:31 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553980csm575137766b.58.2026.04.22.11.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:19:31 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:19:31 +0100
From: Josh Law <joshlaw48@gmail.com>
To: ardb+git@google.com
CC: ardb@kernel.org, arnd@arndb.de, ebiggers@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, linux@armlinux.org.uk
Subject: Re: [PATCH 6/8] crypto: aegis128 - Use neon-intrinsics.h on ARM too
In-Reply-To: <20260422171655.3437334-16-ardb+git@google.com>
Message-ID: <C4E4FF7A-8CCD-44CA-8AD9-5BA8D177E1DF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_111933_624193_1889F243 
X-CRM114-Status: UNSURE (   6.88  )
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

Hi ard, this is a good cleanup!

Being able to drop <arm_neon.h> and just using
<asm/neon-intrinsics.h> across both architectures makes the C code much
cleaner.

-# Enable <arm_neon.h>
-CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)

Getting rid of the isystem is good. iirc that was a hack anyway, feel free
to correct me on that

Reviewed-by: Josh Law <joshlaw48@gmail.com>


