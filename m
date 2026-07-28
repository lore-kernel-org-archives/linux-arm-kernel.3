Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5949DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RP1icAzXLBZOEuHs6IcxkLzVEHKGI5tOjFuXZMBauq4=; b=3zf+irUAkqsAgHYVBI7wIY4Eta
	OKotJNRo0E1ulMvabpIzdgCdTTKyE8UWswGWfAcuU/9N1zbvPBFUhR7vMBMayn311NIL0B3LqmPrE
	xIiIq5EmiOiM4DQFL8YsksU8fbTLSZxyeImhEMZfgRYCuRM2AKR5OfGUYQ2HeV4NqFcvrU/IAqUll
	mnhl/HBU+YmJehOx0z29fk+3krgyNSxFMU6vJrHlYoNyHzjhQdkcfAiPqMN9XZUcKSnwks5YTqJiN
	ECt15r3iEk+Wo0ZN2d5xPrkQDEkHCITR+qIybCWjJQN/rlrgu32r4ojJ6f2CEuldkJYg6aBBuuQnM
	/7bRuQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI5-00000006JQQ-01Kb;
	Tue, 28 Jul 2026 21:24:45 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopI2-00000006JPa-1vik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:24:43 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-848761b5897so176883b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785273881; x=1785878681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RP1icAzXLBZOEuHs6IcxkLzVEHKGI5tOjFuXZMBauq4=;
        b=W5fgz/6o57fxGi63g9kRLbtXF7kqCUSC0vQm40Dt0U4tqTIEXTH03TONWNOYqv5f7H
         DYpglZE9yLAT4qxZqQ98Lt7fG19HVhMALfcgkqYpOUxxlEGLAokaWk23+f2lDpEbEeiY
         legps/BiAnMKj+hP3jbLjKkM2FIcsjnXnDSUA3BX6Ig0vr5ak905EQN2wlsf7eh+NnaT
         8W8czH8Z8sU1LvRNh+JeDXqmOHvYViKHrrXWeFy6ezlexJcJuhzgf9QYY/3zAsXlJs2w
         TOgwTsTfcRiHNcvSJCozwQwbOKUGtd1eRA4parG178RGuHz+sPbOtRzCBZBftetHo7F7
         qSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273882; x=1785878682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RP1icAzXLBZOEuHs6IcxkLzVEHKGI5tOjFuXZMBauq4=;
        b=rCIDvHy0I0yA5NlyVdxz1DdFxB11lLa5G1+MM/Lkjw7ZyrCBG7zwiER0R2zWBhFJFQ
         Q0HX2e+/5/aMUiSSi8ZfVxjtTCE4NZH6NEpACMtvVkqI6X5vxy5aWSpWXe1wrtARZvbi
         cTnmjW+KY1zC8gyheaU0It+eTQoySNvtDYiexNrkDvb9J6jIa9CJixt3jwGd/1sPk2IZ
         fzdAHjLFkAUTqZuCSX+fefoeILxzN6qqzDwkSrWF/JrWVI2yZDGxeXeh4Lb/UtwEfCnG
         usQNQ2p/zHOx0Ulvh/0PvVNErGjNEEy9xqcA/C+5DOmi4tWUkFJhRHH/+KqEI5mF8z5t
         93Bg==
X-Forwarded-Encrypted: i=1; AHgh+RqU5vjlXPMkmyVe0twz+27cgvE6QcnOfbiVspen9FGVWKDwxoL0CJ5UiN13VpWaDt3BiFln4jlgd/y4xfoO78u2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5gIyZVn7g2ngrET97JbtEoZs9h+tcRnPR4MC8YrXzYoX+VUpA
	e0ULVnZWcgggdn4mZ1PBTqNmwYHKaoUHClCGFCtGs1XM87pgwUUIjliPuZr3KA==
X-Gm-Gg: AR+sD11l1RHZpKhAjFvaw4+II4P2zX88eLltJiuL2noYo3ZBDIURC1i8KOEWHVN2Thx
	FVdITbvWJKGlXl4vSw6LhCfmkdzW68X3cC+s4u213D6yHvBsVk2gXNarOntRypZytBqWjU1sl8W
	vq/8hnSbwZ/t+W4evo1+2Y8PKKomtxS2vMzh9cfsDBzqBNEcGiaTq3x11JYID0Xhurx/TooXX1h
	2PJItqtpR7AsbUeAhnglLw3EEW4oFonWkzlTN4k5UJpUZ6ZyOlb6CG6tjn/i96sUP17YRc+pnxD
	RKkNZUMeWHYjRoUmJNPKrCHaqyWgQinTH7dskTbiERm3QQmDj9oHn2Evk5tLfC7u+/xLbbFi1QT
	Zu3ddCsjFn2D2UP98o1YPr4Akse/Mm0mPuQbO+Ue4c6N3pCtnhXoVz7n2dv6Hm/ok7ObpGsW5z8
	o7GJOfiDE0VTtnAzzLErJSwpmVIRlB6PjRYESmLpWpjSw+TSihrwM0jj6FmpX699N0kn+WAcNqL
	TEaMIOefwUr4noVG8nJn1bbE9EQcZIx+Oh6Zzt+gLwscHvYTE1MNcbnWox/rbhO4+8gtyQfJJD0
	9bsXSsEzD4l52EZ99VUmfpTosD5zYd82PDHo8Oo=
X-Received: by 2002:a05:6a00:b50:b0:848:19f6:4dfb with SMTP id d2e1a72fcca58-84e9335a753mr4385834b3a.56.1785273881527;
        Tue, 28 Jul 2026 14:24:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb83459f6sm80892a12.14.2026.07.28.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:24:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 0/2] Input: mtk-pmic-keys: probe cleanups
Date: Tue, 28 Jul 2026 14:24:36 -0700
Message-ID: <20260728212438.54078-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_142442_495234_00F94E46 
X-CRM114-Status: UNSURE (   7.48  )
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

Replace an open-coded of_match_device() lookup with
of_device_get_match_data(), then rework the key-counting logic
to iterate child nodes in a single pass instead of pre-counting.

v2: split patches up and add irq checks.

Rosen Penev (2):
  Input: mtk-pmic-keys: use of_device_get_match_data()
  Input: mtk-pmic-keys: Count available keys during probe instead of
    pre-counting

 drivers/input/keyboard/mtk-pmic-keys.c | 76 ++++++++++++--------------
 1 file changed, 35 insertions(+), 41 deletions(-)

-- 
2.55.0


