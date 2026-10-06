Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1D9CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=; b=01kb01QcqFxVx9
	kva7p5FyOE7VJ951hxe7hBQ6Uhy2QzvFp3i8tc7VzRGtG5kA3aNW+OqxEXJxhAs9EUTAkj0qZrRto
	cAKm/5eJ4aUuTQ4ZQgzCDOe+47me48URm/sBvUUvgtETySnlaDomUaB7BddxVUpkwZ20OEVPKT34z
	fOorOZNqd1trjAxHMets+SrM+WvUQGbr5JC0D32Mf638LDW/ay+hX+p3oxzBynZL8BDI/fFm7hn5C
	5+xrWa2OqhfNFx4LyzOAcIjCw/mpbL4YNVUf2P6rg6dC0gwNpzZwIwd48MmAVyICJSXS6ZZtlXj1g
	ZWXaqoMS/8keZTArKYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyt1-000000008wK-3Nzv;
	Tue, 06 Oct 2026 06:42:51 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDysz-000000008vU-2LuX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:42:50 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-34ef8f66a6bso327709eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268968; x=1791873768; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=Xa5rp7Hbc3maecxvlh3UwBIOikX/Z6yUNQu9ulRmCaa1rRP8ByYu4QoVc7YCT0yC7F
         Q1191hLQ9FQISt7Q4F3JpSvsaHYP+92YnWY6Rult66OmdPC2Bm7vy1db6tBhJp7suh5U
         SaoE8UBavJlYCUBVs3lCrE/Rs1Z/RJGJLJsgKFzj3VwG4vfv8RA54Q8fz11JIabaoKWa
         DQs2QEQ+divs4UKy5rIcQ9Bu626il/pdV6Du44mesY9+veBGyPmj1XYwAr0I0yuudwGl
         Hep6KYo4KbJbLSProin2JcPcsZ0R30ktBmIWe0V32uFyJvejo54FYDEaashb28HdA7aC
         +PKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268968; x=1791873768;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jj0M0FNSVgErT6nNNDG/5xniUjNErRGkcSo2LLHcxBY=;
        b=iBkuYoow77cy5BWm/aCX6+x79ydiiJ9+3GvcPwFjnizsC3PwJQEbZExrEFpbr15g+B
         j7GGwz0/pGb0F4mgSBacI3B3YKo60w438oiGtOdejAC+gF2yz7R9ISEra7kkepezU389
         fF0vu1z9L4ugiUvKJuQzIJp2beXQZdeqGh8o/VQmQSEZlxWZxa45lHXc4CjYQcc6goa6
         GbT2kfMtmVEnrM+kQ8/OottiCEQf5QQHgJk8X/knPY1tvxlkPYdscKsv9XeA07UE8VW0
         MSCq1PMfC/CmBb27lOwadOXXgPGYA4aVD9FC39FYKOieTezrOFYvrC3s5Td/H9fEZkrx
         kA9g==
X-Forwarded-Encrypted: i=1; AKwUvBz+Uc+heVCqQGhKUQpLnwqmoRlYbl502pIMV3/KbSUaJnEVkjrezNPgipxUikh9WEDTAdngk3DtIA6EFwWtZ/07@lists.infradead.org
X-Gm-Message-State: AFq9FYIAxUd95omWwJO8a+/YjjtPMC18IyyM4+944mrP1rAPj+Cc4f6m
	y1CqLsRX374uNUbFyDmcbkg+n7+W24FVzb/Mw0XfqGlkD13g79b6V2dz
X-Gm-Gg: AYBFou1otwf18BEtnUPFrtoCPiHvtDJSMbkoMcAyXYLfqARD5nsDbdKBUHB2btQXkWA
	OdhLlL0dRLQXAK4GI8D/fqZSqEly6wW3mp4xhMq0WWs649IGo2ljw43blL8CDinge2vqKgtxoUJ
	BexvqAKjqw/D+O9M+bAHbikX+7JRY01UgyMDYJozB6VKwn/FwAhxyemenkGcllTcecMnBoGsB+s
	NJY8YfodzRNRUzV20mPqpHDw1Wxdxfekrb38J2NikZ0+13aivcM6ZZ/AhJ2UKmtXC/H/mJiwKaw
	I3yBkzU1kwr0Miqmc0/lKbMtIpuJLvLa0sjyUmBRoQU538pOfYD7XPQMT4WFpHMX7M2wXLsVekZ
	MCNlbT5663xRL3Z1FzfSzg4KzPbFsHxjd4KyiYJuT3WiP4WeYmkX2/PperuPZsnJVuqbJ1x4hsd
	5MpTToQ8TbUrJr29rZnS0ZlpFztx1Fk7k9k6Yv+hurhH72UKpeqVmSq3tR0/Epmh456IA4jamaH
	bPiI8yI
X-Received: by 2002:a05:7300:3e8a:b0:34b:fd9e:ad4f with SMTP id 5a478bee46e88-3514e314fbbmr452029eec.22.1791268968324;
        Mon, 05 Oct 2026 23:42:48 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:47 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/2] Add MT7629 RTC clock selection
Date: Tue, 06 Oct 2026 14:42:22 +0800
Message-Id: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTvYhpA2XkW6mMSpHbBRJlECp
 Xc3unyL/3fIrMIZLt0Oyh/J8kwNw6mDuFK6M8qtGUxvXO+Nw2BxK6MzHrVEHO00LeRtGChAa17
 Ki9T/7zo3B8qMQSnF9Xd5SHpXTFzLeaNcWOE4vjjXKlmDAAAA
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_234249_605485_68C02254 
X-CRM114-Status: GOOD (  10.41  )
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

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

Add clock IDs, the /1221 fixed-factor clock and the RTC mux to allow
selection of the approximately 32.76 kHz source from device tree.

---
Chuanhong Guo (2):
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 7 +++++++
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


