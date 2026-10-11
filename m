Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1163FCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 22:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=; b=pWsHLLBoJl+X5NOh66UDNH+7EL
	FdQ9XYQr2gApLiu/AlLADcX6hpQ0NP3xxom/DJQcrmrkcz3CJOwubLRDw7LT5TFUC/yBgqT4RF4/o
	54YyZbiMQ8eaoo6JHziWSX2r43zES3f/RKNX7BanpmRM6xFGHci44DIyyEdcgEsPKCbGM/t+HF4/n
	eWOmKG6My1NaMsFZZKpGil8T/FaOegPE65cnGeYuXvRbrCijmorRjT1+FivxgqoXpBVNLFdokpKYq
	2ZWVQfuLhj2sV/xw6KlNjlago+4YX7elvpFBaHnXvSC1oGTxlskVzY1AZEmzMh6AWbXK4WlSxk2tp
	c2VjO4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wL-00000009SB2-3H5x;
	Sun, 11 Oct 2026 22:22:45 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wH-00000009S9h-29Cs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:42 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-53506b44151so17712041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757360; x=1792362160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=bYHTa2dkSJ1xC+tPhZHspR1nY0w45az8ZLBf1O549krL0ga+dq9mFRmWpJhtN2vRsS
         rJnBG3BJFl9V55p8r9aV9Z//fjG+BIpUD8fFKnNgNI7Ci0b8tuhbOhmIw89hk+tKSodS
         rzIOHBaqB0eNG8azPplrojILY4QXQ2idTFO1TEe8aapr0C+hmbPgMN5n5HTjSxD008yj
         f/r8hs+ED4iTxfQi0LFyOuCCoM4+YB7NwNXgI5rjr3Vc7PHfPI08HPkL0QR+9BCaNvIV
         NG92xLNWwS0WOXVDAIRv2aCXzpD2rvNBRBjVw1XKWWyXFNSpuu0cV9ShqQ+pL+ZnQ6jE
         LjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757360; x=1792362160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wx78Wxn0Vwqymp+y9E4li+EEYQPoZ2jSYNoF4UjZvAY=;
        b=ug5TGfaGnUFfb8F9az1D9Dv0Uk5Zj6pmVUKXrcsdXSgX310O/RcBkuIHKJVOrQcPca
         Biyeav79JESuF8/zbNF2s5hFBz4ZOqhd21uFRXPA/rFSABG3MYG1zkJgKVjLtx0bAk4Z
         qmIVlOGDsdV2FUuSllAKQ9wwRxnKJ3/q6kx6yrvKWoxGQLU8ltdszOnRsGMwLy3xrgLQ
         y2e8e4Di/l6BdSixktcywaaX+W4tqOnzfXktpBqNUkAfntbBmnUgNJexx1EVGKBYDiiJ
         Rvj9+6JFB3k7iP5XxJSBCyor5VMkAEgOwThoqpYrjeBr+vlcqYTJ3G/Nov8k0UITV/At
         GxfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkP08itI9RvN3ZO3R/g6AereIcUDIW5x3bMjNk7TEW41fgrGA4i71USbZcReMYAnKBJoA2IdSJeCn9B7GTIVgE@lists.infradead.org
X-Gm-Message-State: AFq9FYIAxBkEoZl4bx9cfuuy2zGk6aqhK992sNn4IHTCFCHN3nUiMGV6
	K36TKLHCWzac5VASgrnVoKx7zfD/2CTjD2cTHIO+jftvR1UGYXV3LBk=
X-Gm-Gg: AYBFou0gFj2fnv/ELA8X3eQATrhK8ASkIK4Dgu0wLbnR8WQoCjZrdD2UYOViOhDcCX/
	KlSir1Fr7hva5RUIlfF3WDb5i11R2vxQpjbNyQ9dbcD1sRRp09Deb2zmVPuhOkpInxufWRXS8wf
	MkTHT7gdTv0TAT+4TDknjsyHCrs34kUo9g98XOJbeVWZUpKknl9LPpiRAuPKqaNJY5b1qXRVgeL
	lTTo3s8kzwxSqEkLWes4cxr03P4aerQgQpjkeM6j8YIW2LKWN5dqWHt390pXCXcPaE+BUdjEiss
	UGxsyw1uavLPY2hmDydsn0BT83GgzpAs0/sR5lkVhswhMefbttQlzr3NWd2+eB3W04vlJ5E4psw
	wgMUT16qmgXBlYNln5uLCPN9TQkq9Y1sCu7z5PuEF4Dvfoj+NRgIM0pfV0+KSca1YyLhAQcTECq
	CQZNVO09jp08amrW2RuWInMXB3FZvCg9biJPl01ZBF33OUDCUZTSUP9v2w+2mHEM6R5vgT3CsuF
	Ciwf6VnQQI0ODvhMQbJ/Tr0z2StW6kUZz9oZLfXXuG41DFowikFrgXS69W9gKsMv5s5mVHooE+J
	s8DHHcHG9g4mLVLmyETZJP0lHmX/vTlMv7Dd2kM=
X-Received: by 2002:a05:622a:610f:b0:535:52c:a2e7 with SMTP id d75a77b69052e-5359fb8f85fmr135936341cf.44.1791757360176;
        Sun, 11 Oct 2026 15:22:40 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Sun, 11 Oct 2026 18:22:31 -0400
Message-ID: <20261011222234.2098904-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152241_555530_EB9DD3DE 
X-CRM114-Status: UNSURE (   6.44  )
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

The AFE IRQ handlers access regmap and PCM state. Register each handler
after its inputs exist and release it before the final remove callback
or managed component teardown releases those inputs. The mt8186 patch
also balances IRQ wake settings on probe failure and removal.

Compile-tested with Clang 22.1.2, W=1 (arm64).
Base: 238650ef6c7c7cca08e032527329424c9fbd70e5

1. ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
2. ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
3. ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime

Assisted-by: LLM

