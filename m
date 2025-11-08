Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B706CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=; b=Fq9H36MemcUi7nkd1ekIpXxHEO
	5GvFenQqbbTY6Sqhi1bmMcc6mZaqrbLFwdwXyO05gklcwAKtqXJ2E/uAJGTDct3avc4QM16lpps9r
	pl9QnoA+mVHfnRUs8AN5FtWNu7UsToNJJwSN0RkI1D56Mp2XzQ4f9LT3YmjEF/+W4m+2ip9jtHN4s
	FZEhdW3NnnTJKmzarrTv/4Z/5f5CYsE5Z5+SRcS54KVdEnJXw1+yazk3qy2KttAaQ8HHgCTQ1nKlE
	cOMWfrmGNz9gcaaxoWTbBtryIyy5XIjWwf6+no1XtjIrflV4H0oll5/L/nVqMAw1cDI8HUMgwdIUa
	aI6+NfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi5q-000000036xs-1zgQ;
	Sat, 08 Nov 2025 12:30:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi5m-000000036wj-03yH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 12:30:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-297d4ac44fbso8245815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605053; x=1763209853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=XWpJm9NHkzPPhPks5NIb2+zugM7JG+CAr72LfgViwiQoC/t3NTm87tLive9IgrYLEt
         EImk3/AC805VDPQV+ynKB/Qm+lTdamiRVwZvprwGXgPzPoe0R5MeNXy9gDS7OwPXXiJE
         esMghM30c9fXlFijjuskGcfgO3lryDFWE3TGlxpgxY/uzlrbzt/Dg1zMrOk8ZnXbwkd/
         SR+YZus4gGy9OM3QI3IFKAOxhGqHGWWJo6nFCUc4KEnYwQyzOB5IgeqyBM4YF3V+Fcmx
         qksMQWQEA4XWBP0jgjL9O37TjwLo6rjtO5z3v/Qu9Y6/fMh+F6fQ4RBN7pKKNxQAqyvV
         EvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605053; x=1763209853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=QE0pwdsDW5RdEHbcvVYg6y4GCNOkkE46xM+z3NQJy1hVKjdFuFNO/TMr8nGdrAqmap
         ahaZJF/XI3UDpNloEnNf0T4347bULTCpBNYnyhW746Y8wuQiNcUGY+qRKL2RsaRqA47x
         mB1Kl/CYmJHv/748aiH01mMaMY3TugmB0YzymC/rh/ggUI3xpvTamjrvKHrtEqeuN74h
         xOGnU9zOOZan2nbsRWEnP5ptJNu+Ve9WXaui0JgV84kGsJ8MpXrm0N9auBDVsMeGSpw/
         72Oav/hsIr8xZ/TC1kom9QkZERBUPPGBWp5H351JtvKUDK99XSLotc9hyOLO1a+EVSIg
         8xMA==
X-Forwarded-Encrypted: i=1; AJvYcCUgXtYrENEjMJjJJX4lyiYVrjE2RVYmBd1s0HVX+vM5ZNW5NKnTs7f+Qfq0LwW3Mtw61+VOvkpVvUUwgTgnreTq@lists.infradead.org
X-Gm-Message-State: AOJu0YxQmTETKxVhYASXs/7xVbKQwefZNvYbx9ER43DPrreCiDh9wS/1
	lGpy6/5ZsIHzhMwQI2X8q51/s0zzHnhtBT1PrqPG5TXnFxzEtYsXhXliQUxVjNlQqiDENu//2Lk
	IvLVZtcDQr0+wY5Tp2d/+66jRlXSJRTc=
X-Gm-Gg: ASbGncvLa5UThx2sCG/fVvWf1g4OsKlvhnrIlufmYKDNRK+RkvXkdaBeowlKyII1wdV
	gEtj1rOUW7Bcf3BhNmxQDFHCOeAducqiHUS1Ei34r3J1mrYTa7CixIMuJNsxsZeRc4JdKg8MBO4
	ubKlGWvnokGKKU90DqXQgrGSBnl4dEKM6RCsCrm7W27YWBXJ3m5gMOGbqUmlQYpZY09WxKO7Dwj
	aJoG5OOjxhYJwsXxGKAJBybhsmQIfji2eQ4S31p58eJQMNNmHj2ZQzev7opI0PhzR6gyJa0WDl5
	5ZyMGupIuNPkq5D60paJbhDVacM=
X-Google-Smtp-Source: AGHT+IFggAiteVIarAA4yH7nX7bpSEtb/3RAGcM3xV3yeTnEsgYxWgJ+blB80el3RONC2EPUTf3q2DoKMIlCAJuDAHE=
X-Received: by 2002:a17:903:1a2e:b0:295:5da6:5ff7 with SMTP id
 d9443c01a7336-297e1e3409cmr35315945ad.15.1762605052702; Sat, 08 Nov 2025
 04:30:52 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:41 +0100
X-Gm-Features: AWmQ_bmyclexD2i-9GELP91SUMtxA9fKus1hhuyJQbz-Kh7t3dy3c6LqsK6hIg8
Message-ID: <CAFBinCDf5jMMFbkRCj7jWOSB__jBpQN5FWZhKAgdoELeKwW+Ow@mail.gmail.com>
Subject: Re: [PATCH net-next 07/16] net: stmmac: meson8b: use PHY_INTF_SEL_xxx
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_043054_341798_D9860A9A 
X-CRM114-Status: UNSURE (   6.67  )
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

On Fri, Nov 7, 2025 at 3:28=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

