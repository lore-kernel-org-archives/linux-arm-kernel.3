Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B507C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7IyQ7+lfeLZPfYuSv6PDTk5mfq4Ex6emC2k3dW0k7M=; b=qC0CUgn8vbQ3z3ukr13C6oL9uV
	t0yrq+kPZ7I1bT2xeV6FovmQQ2ICK6K5KHavPMJbCyf2Oe7a/NNQexxV4/DKEtCmyqaKiaag3yqYK
	iZC5D8udRwtJ7XIZIfeZkTvLBiC568aHIaONpsqkhuQorhagZvcEd11Q4ptnSi72H83zUTc2UBs/o
	7gnD9h2VbNSL5G7dBKG3f0RNh+fJGiI28+Ow5d6IPwHB0GVaohsHTxz9zZTaFbDyPo5D2/fZw4hU/
	2RNq6oVhDAVLHjiPmjO4ShOIUdgHx7AqSNB1ofbZ3MWuh52ywLW1l7v74Udccn1Bdocb081YymU76
	Xa2TzArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUa-0000000DTTe-30R1;
	Sun, 28 Jun 2026 23:00:48 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyUY-0000000DTSu-1jh8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 23:00:47 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-139f1dfc9faso1631856c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 16:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687644; x=1783292444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7IyQ7+lfeLZPfYuSv6PDTk5mfq4Ex6emC2k3dW0k7M=;
        b=YA5ana05DVZlRdl+iPBwOu5Nt5VNDaFyZW1izWGvoLCq5fKvgCc0Cb6trJ9NlgQoyL
         5wMgBkaDvC0X1onHRDbBoxLhEfWTITxA2Ix5IYxO2EXqBEwMGjRB5+lcET1n1zktxgG6
         K7NpO12QbuspavQxlMYsv2is4FlUrtLzRIbgDFTOIink22NdB/SqSjklZlIbvrrEnLuO
         sZ5INKxvnjjNEY4rYYRUDtiUuovb+PAoPSd+bb2LUl+EWh9AZhyTWIh0/XfNORpRSNhT
         FvriErZZoj3c5aip+hTNugWcTnFHMecL2R4LyOAjKfWyjtvVxveYF9Ia7S37orCIUIwG
         hAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687644; x=1783292444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7IyQ7+lfeLZPfYuSv6PDTk5mfq4Ex6emC2k3dW0k7M=;
        b=JQyn03ITLLU4+ZRxZUIPhNyOUKlDd6mik2cb+L6O8L/Kvdcgbg+GTsq0DpGmdn+mzd
         fbcEdAEFl1yecLkorE/8KKlyPd//OJfjaIyFD7OPpKheI6wd9YlxTxPKqgA4JAsoByYv
         wNSsPZsphAvm/BHrc5+Hgbc2uhWfdSXXx64/5zg4StwyvTmXWCx1OB7xsVY2XbvWmhUr
         2qJ1E8E6MhSBUq7b6BduqpJZWrmeOc6yJ7CzCHX+Hbi2BXOug1u8iHRqV/sIWAQEyI/I
         KxZCOjTX5hhw8wSuTTMOzg/BaEBncb9OXH1RCY/mhoojhY3yIDNIU08r4OfP6N4SKuOE
         1znA==
X-Forwarded-Encrypted: i=1; AFNElJ/br6I6l9Bb8p6tx53rtJBdjILI/opcfrl+072pNZqfm5PkFHsGt9+uJmIp0ZJiw7roHEGIXL2r8jpIGCzm2L7R@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr1pZ74nys+4yvhFYH+8Eje/lle7kAMtDV63/tGDUYI7jDyB1A
	SmpVA3dk8D/qPDOLgjiSm5dOW5hpiqTjtc1TmTZtxHao5jwz4GQI8uxl
X-Gm-Gg: AfdE7clIagBULjSBV7K/cPMQikAOQq0iNYMsMCxEbhoUPk0rFRtC4wLdMkOixj++uK9
	Xyw4bqKO4r1pmGo1Y9Ipm7x4o4A7pu4eVk7Sby/8LxJ7kCHgPhg1lrEhAgQbv6KzdMWQaEoDkQq
	4zoHxKpI6bqC7xWiQeDnsbGZaZLX5gdvCMty3G4WHF5OcOz7EahBjUs2SWpi8B+Qhx5RS4mg6RA
	b5Llu/aJE91D9prYhR3N2DtPGyxvuHllIiE8eEYs51aMCpBH0g7hw7J57XGrigcawcnE0u96NSG
	9JfYeytqrssoThdnvKomYSL0PkJ6dZJFXS2ep7JfgrjTZdqbYgY9zw7ty/yr8Z73ewmaBUPlQMy
	awHYMaadJuZpVvOi//mgmr7epid0eYtEBUuHF/uj8ox3PqVg53bZyCrts1IsxwCOkpZrqrLD6x7
	41AyuKJOb4KaG4oqg9FJ/Yu8S0AmufH6NhGYLc2TvEEB6NG5KKENawQeEq0y7ODOGT2R1Q2hwVg
	6o6dDX5VQ==
X-Received: by 2002:a05:7022:381:b0:139:ed5d:5c9e with SMTP id a92af1059eb24-139ed5d5d76mr5557357c88.39.1782687644290;
        Sun, 28 Jun 2026 16:00:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/4] ARM: dts: helios4: add regulator supplies and thermal cooling
Date: Sun, 28 Jun 2026 16:00:38 -0700
Message-ID: <20260628230042.1204293-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_160046_457878_9D4A797F 
X-CRM114-Status: UNSURE (   7.63  )
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

This series adds missing vcc-supply properties to the EEPROM and GPIO
expander on the Helios4, adds SATA regulator supplies, and wires the
on-board LM75 temperature sensor into a thermal zone with active fan
cooling.

Rosen Penev (4):
  ARM: dts: helios4: add vcc-supply to EEPROM
  ARM: dts: helios4: add vcc-supply to GPIO expander
  ARM: dts: helios4: add SATA regulator supplies
  ARM: dts: helios4: wire LM75 into a thermal zone with fan cooling

 .../boot/dts/marvell/armada-388-helios4.dts   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.54.0


