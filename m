Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED819CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMyv7xHpzBEGqAA6Ujonxbq3JvKho8WXoic6wC5QnCg=; b=tlZS6f+/NUFgpgFFtNk6c0Cv0L
	Z550VQG/PTfUuVZmOaNyyZbM+p8n6rgGX6kHWpTC4iUv0UNaLcXWEnAznlqk2JDrdUd4U6NIloSkA
	l1LK6PtPxnJXM96N/dMDnvLNQ3vDCdTzEgLjJuz0Zo4ahoE/MTCgKHoAbKewQ3ENKs5w6413i/KPq
	DnKbUIipltV9FbUw3DGwXBtCueAtGyrwbWcnFfK7bT0BRiaZ5INgTM7o0UqO4XGYQx10anVP+FJwZ
	dGmA1NSjDKJKVoLIhVtYm/56W1vyoKxcOQmS5qKRI9ZqP6uKQ6pWy1aPuZJv/BrJ8vtHmuDoyhrAY
	iq75CQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPchO-0000000299g-0UGz;
	Sun, 30 Nov 2025 08:22:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPchL-0000000298t-37z2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 08:22:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779c9109ceso2497435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764490942; x=1765095742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMyv7xHpzBEGqAA6Ujonxbq3JvKho8WXoic6wC5QnCg=;
        b=bwc7tNazOPcIQAKji4HhK6NafwAyEnNAZp0AeB8/JH2S6VAn7Cd7gp+9rgbs92ejKX
         SkcVUkAP9iyBoB//ZKIG+fcTmPj8cPn4RDHJY+gx4vU+rVUHDOq+BitsDvZYi4Ytdkv/
         LrFBwbbDFx6c4gzzRhZDPkOE2HhsnPwXkELvTCVyHNT1Xy/5EnbtDgPS7erqyK1mKEKy
         SpTaJ+OnV4TAg6oIvoQaef5AJPYwisVmd3Yno8TUpDpvEenyvn9ygHqHKTouIKflKMN0
         DSlFkQSjPzyWaZPOX0bsfw98tARZkzXh6yYllURkFkNT9oBnLSLs/voFxixpBGqIaahV
         hLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764490942; x=1765095742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMyv7xHpzBEGqAA6Ujonxbq3JvKho8WXoic6wC5QnCg=;
        b=E2IS5IwYvB/Am14ntrwn7BzdsTRjWeqAfGMpEeJTUlWkoFgwwghyZ4YDbSkvPdbHKl
         ZJrZ6GYVNL9UZVxFvnMbHthpG2lDmNfSIj3uciEMIoH60qMjmMZog0wGN05/EbPW4sWp
         4YKGUcUcuKtM7V2j4NuJAbejMSc6k72UVRj4af0joLC34jjoDDI0LfxXz5S2RoY4cxdc
         c32mq/St45oe+r5a/IzdlFZkEPzRAyul7QNQ9kMfHzWXsyyZldT5fgZ9Y2GmhgCFTFuk
         nZswHLfHJhRrpMcnIeoojxajL+jceLs/V5lCfDxF5PtLSdOqovtTpLRa3E1EBnu+djVA
         nFeA==
X-Forwarded-Encrypted: i=1; AJvYcCXsdWVqY9brNOlUTX8A/rnRuIDJ8hbu68q8PjFBl8hZfRsJVnwh8RkvtuxHrWLULbMtFSj7kKlJvGDVaAXsRKki@lists.infradead.org
X-Gm-Message-State: AOJu0YySjBdjh2I9rFav4GxdjZ/+GTnMyHLKuvd3YBtPLits2ZhV/u38
	0NyqJ5MaFySXZ2hNxDi/qwTOU3RJwBarrF76mHw23SBBTB4Mwv1U3y9n
X-Gm-Gg: ASbGncuFaBzBfdLjOA+b9aKf6j/xQWrsPLtoCwOmd0j9+N667whtfd8/kL4Qvojkf1Z
	rpgwVWbkhsAoYMAOlX2hu37h1q360z/E3+3NGrhMCv5oby2S42Vls1x3tPhIZRm/FTX+wqsFyvL
	dtPAbA5n8xQRABHzBF0J/+XvZnpVBxP5TTktOBvAW8X3neOEIZpPTUINpg5/wkHPf/HULUw42PS
	lQHZVxl52UFy8FqF1/ohkv/w571sXMu4f6nO9gPxNujYEbE7uyOcfyDP5mvjpDh2cR5sb5enPTq
	uMJ+R8LoxBuFR3IwvRes8/tR8guKe6Y0Ffo1DS0JMapqccDXLpWT//YgDxNKdcrZw5T7kKExntX
	Vlkeby0udj47L0xX1gbUgcGp642baX7BYhPoelk9K5oFs15Dodp++NKmfXw3ruf77IwO9myXu8o
	0uvQ==
X-Google-Smtp-Source: AGHT+IFxf5DCmAQb4WegUpiiTFHp05rmbMw9OobLeUqiCuq6pkZ68STqGne2876uNBNRHt3VzIgFBA==
X-Received: by 2002:a05:600c:4443:b0:471:1387:377e with SMTP id 5b1f17b1804b1-477c01ddc08mr202058375e9.6.1764490941614;
        Sun, 30 Nov 2025 00:22:21 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:36d7:677f:b37:8ba9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791115caa7sm172799055e9.6.2025.11.30.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 00:22:20 -0800 (PST)
Date: Sun, 30 Nov 2025 10:22:18 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Chen Minqiang <ptpt52@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251130082218.mvxlk3p2pxdny2ij@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129234603.2544-2-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_002223_804385_CDAD7DE4 
X-CRM114-Status: GOOD (  14.27  )
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

On Sun, Nov 30, 2025 at 07:46:03AM +0800, Chen Minqiang wrote:
> This change makes the driver fully backward-compatible with older,
> incorrect DTS files that marked the reset line as GPIO_ACTIVE_HIGH

The driver _is_ already backward-compatible with incorrect device trees.
This patch makes it compatible with "correct" device trees.

We need care taken in one more area: when you make updates to the device
tree, *old* versions of the kernel are not compatible with the latest
device tree, which is not OK.

So ideally:
- patch 2/2 should be considered a bug fix and backported to stable kernels
- you wait for some time to pass between when patch 2/2 is merged, and
  when patch 1/2 is merged, so that users who get an updated device tree
  have gotten the kernel compatibility patch through stable channels

Then you need to consider that you break "git bisect" if you keep the
device tree the same (i.e. the latest) and just change kernels. That is
a trade-off that needs to be well justified (cost/benefit).

