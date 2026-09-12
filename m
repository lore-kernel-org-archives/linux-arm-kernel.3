Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D29C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=; b=HHXKNd8yx4A63I
	BGquXjKvo8qt2wHBPgX/f0LutixwT9wdqmDKucPw3Hmz6sZIKTjQ/Tm7Ao2aEhBJTPFvOrCpF3hxd
	DxjqHpJQqj9AHy92Hy/llLmfK8x/r+LRwJpSyq6c4MbxzJu31Ky3N4xS2PhAvZKQ7mMlU8krF2zAW
	ieSTzMqTdY1jAXuhjulA3gF1GxixbwjkUhSOtJjMNOeL6wB0tEhPsP59QnjvGNHPSP1CTF/HsQoeW
	v4fs6OhKz/YlJhQm0w9Q2bjR4Vg/fOccBwu5jWX/rDKIYMSDUVQFP+YU3R29nrLKq3yz/udz4RNrf
	iQCWCops+fdf19q8y2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ3-00000000aDS-40ZY;
	Sat, 12 Sep 2026 06:40:59 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ0-00000000aBv-3E0h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 06:40:57 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-8046c3d6e35so318037a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195255; x=1789800055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=;
        b=BVoVW7EGRHbkgWXsEvfU7nTj2xY0e5wKYCAcgH9sPJJ9QtLyWzVUQnuf7ZyddAbwN0
         8aTZ+lf88w2PVinVKs0vuIZZw0V0m/DOb43QW8596AB8IYNnCgZUi3iFhKscwUmbsieP
         JZsaQdZeKMOTS4VEvSMcLeOK/LZ99ZfrgqTILXfKf/MZwz1XNAd7DYaBeQKPu4SbYiS0
         L8dKSQxn/EcFfAzCjJAkIv0+13KEGrd2CiFNPAd/MGSfsM6dD5NBDiShnjeXr1StcGSP
         xCLxpon2tVD9eW5Phbg3S+ilaFsc7ppCN1b9tka4qWGsMXNRuIMJsi7sLAaUY2PKc57h
         ezlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195255; x=1789800055;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q640RqR38QE29MmVFWdMcnQiW2Q7cR4iK1FcWO3aAjg=;
        b=T7ote+l11qqxEoBSfTc5QLyhAVAqHH5JLDYD6CbkFB2TWQW3NpmMA0aROPvsTG5Q/Z
         SS/7Vd52gJVV+eUPkao010HBYtIeEU86UBtPvYBkzHS8yz1E4vx15tzSOmJ9+IL5uEVr
         i1vN4/K5t3qOTRdtOMyN+KwBJ2bNPHCwYvcgLtNYXxjqZsVOriKTU2R04lX56WBcE8vD
         OXoH76nG4JPz/b4UNnyX+PsbMkOgm2mC5N2699rXkR0A3caICrTq0xdtNdrL0gPGCPvv
         IucECz/n2b4JFvmiyqvXt0XZwiX16XOf+jMgJamrNNCoQ1Cog2+pzeFzeUguJvaJ/Zxd
         e6ig==
X-Forwarded-Encrypted: i=1; AKwUvByYeuATkD92bKmLAc2UHkIjqo2I8Ce6RNKyIR07KSLhMmcemNwgnLQlqeFxjpM+dDzFPTO7TfgUoF80Vg4E6Vk8@lists.infradead.org
X-Gm-Message-State: AFuF++mNwnhqvu2XbslmdlSU7Ikk8QEqczse81lqIB+ZFBmBInScKVoM
	csSDtv5ouDfmK3jOi1HUyJQp/EQ7dXXNwpgTocc3BKjdAmLxYKmYp0ym
X-Gm-Gg: AYBFou3MigRpq6WcA++b7ye53om1CQ3tXPI+Wtakm5l/kKsHd5XNnTPDn3n7rujS2m3
	33peLHvCtO8DKcF+zP0ojFsgizvsv+/DN85BvjrkyHJv9iklHzkF4b/E7CK7y6/CVNF7Yir9EUy
	97il6Ad9XpBLdsRkAH8jZNaHqXwb97dmMg/3u446UUHPlDJS3ZeS11rUnnndogVbW1UKQo59rOG
	xgAOINSfMV0WVs/9DvBZtUrYJ5BKIRvJYAKxdiRMgAznMWvH1W4pkBNmv+KH+nZhClaUyfUhi9R
	shb4m7r83A9aXKJYJE9qeL2GGYF8bq9UKIZTmMvUTfPQ2ccn79M/RyaBsC03n94mnxJ0F8EJBrX
	SSJVYJWzX4kSEOMWsJt/THteklJMUf+sCMxH407RXC9LXn5dZzn2Dywg8av0TVC2MknL0KlWILe
	6JTcJRuodiVBmPmyCXkeVx54gbtObxvUfBKoQcCFFdhcYAthQ4PddS1wt31zCjhZuvGsM=
X-Received: by 2002:a05:6830:348e:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-803fd871808mr7192047a34.11.1789195254741;
        Fri, 11 Sep 2026 23:40:54 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] clk: mediatek: Fix FHCTL DDS mask widths for mt8173,
 mt6795
Date: Sat, 12 Sep 2026 01:40:36 -0500
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CQAyF4VchXduEjmZAX8WwgGmBakAzHS8J4
 d0dYfkl5/wLmEQVg0uxQJS3mj7mDDoUEMZ2HgSVs8GVzpdncjilmqoj9vpFZsOptTt+lNOIPnQ
 VBd/LiQny/xklr7b2tdltr+4mIf2DsK4/qaqIzX0AAAA=
X-Change-ID: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1557;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Zt1FOqW2KqdoRYXtktantBzoTQDsX3R4Zq/f08ZKesg=;
 b=f+gU2KPV4GL3RlxKjra3EBgbSRpjeS0ghAYC7hkFJHSavKdwLttmPfViyyZOeMjxCFe3rP57A
 +UtDJosJl5FDBkDh1Pme7YytT+JN9WWHnOdfvJLKSqQ3pYoiBiSGLRM
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_234056_814175_30EA1B5F 
X-CRM114-Status: GOOD (  14.45  )
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

Discovered this while working on bringup for the Amazon Fire HD 10 (2017).

In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
for frequency hopping through FHCTL"), the DDS masks were set to the same
GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
pcwbits (21 as opposed to 22). These two patches correct that.

Tested on an Amazon Fire HD 10 (2017), an mt8173 tablet, across 6 MMPLL
rate changes. All of them timed out prior to this patchset, and all of
them succeed with the patchset. mt8173 currently doesn't use FHCTL, but
this will correct it for the future in case it does get used.

I do not have an mt6795 to test with, but mt6795-sony-xperia-m5.dts is an
actual consumer of the FHCTL node, and switches it on for mainpll, mpll
and msdcpll. If someone has that device to test the second patch, that
would be appreciated. I do believe this is the correct fix though
regardless.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      clk: mediatek: mt8173: fix the FHCTL DDS mask width
      clk: mediatek: mt6795: fix the FHCTL DDS mask width

 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-mt8173-fix-dds-mask-width-6cb71c6fe4d1

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


