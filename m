Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC1DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=; b=N6BGdcupjd4VQDWzO+q9hvCjl6
	bttyDE20Uppy8bOsytnQsKgpBNS2e12NlJvGqsIqrHfNjDH0Clzrr6a2QnhZnJcjEaObGTnrqIsPV
	KggF3CkzHqWbHrLjH/pMyeNNnmXSXbzxI1Eo309R+CXNoJvk6zwmaeuRXjfU91tatNyOVC1MdwlW9
	YaFBQFsHRBO6YBdUAUUMOp4AziPuQo7EGNl89zseE3omwp+MNvOenASIe67RQ2sie3J2dDKnqbwzy
	5ddtUYgN2OKmjjCp3i0jlT/OLFUMK1vWyBkqZqbg4FUodY951FsPldOCKAAHTCrIfzrBpFMGpgbFj
	2C5sW8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnd-0000000Fr6m-3iFA;
	Tue, 05 May 2026 10:14:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnc-0000000Fr3s-3nQw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=; b=E0cwR8x5HaSYROa32woC8s/gy7
	buTOPmnEVPlz7SX8/uOIMV1Vmm9Wll/oTxjW64TS7i9GI7QG4GIzXneAyGMDuhSOYd4x3N3qBpJOH
	gk44Y1W2lU69HUZEnyHJmticcv6wl4dDZua6Z31CTBNqFSOc1rGYpd54ccMZumBfYbIKvVv9iGv34
	mlWUEkv0DRsyc/u/H6u+gNbSOKvEaWiRgcPTRtYAw47MU1Wj2HIFV9eIy79cFLAYNvjXeuIuc9YcI
	hAT3roESlsAhtCGO1UV+U2Bz2AkU/5hqHZ99DB9/7x8hs202pPUx/6Vy8ZlLo7Poi/cK0cPcCVaUh
	Y/aagIVw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCna-0000000D9ZN-0LDA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8383fb7143aso807555b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976080; x=1778580880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=;
        b=NQvlBLelopAZSds1M9a3RE8qSzBCGqf6HNDP3cgECJlk8ZdURnw/1IUSFqPU1NNRem
         ujGRdxb7Kr2gDu1lTekKhAYAIY6gaLSiWzKrXwwLzpugp9gnnuYTVrjqP4Xr7LJMjlic
         RgnxujeTEhhWMsk2bJd+3eAgWdy1MYm1oOmsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976080; x=1778580880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1yF58yQBbcHl4r1i7GF6fw/efnf7TJKaSEphSpwRag=;
        b=MZS7mkfgkfhLu4j5br2qabn/5v1coQDU4YE75ZXkxVOTBJHeenPmZlf7s90tXmI+0p
         v0fWWGvzdx2iwHkR7hBfL7zJF5o2qhahgQgLdJJR3tNIUN0glCH4uvoUQWtf0ljwCmq5
         c6ay8yacUDb7UCSYEU9MRXK78T0kitRMM5NyX+m+m8Gb1sswFEBvvHMr/rmrl4Ikkz98
         G2rg06JOb2jSe1aRrhVew8Q2lsnPS237QMKtlej0PGa9txfEJpLPMVwo5SXbzBcvNtF2
         u5P/E1jKEHVYSMGnFa+AnDT1KnzCjodUjQUGTL8SqjQpCtF/EvkrbFmHEm43ZkwKfH4P
         lN1w==
X-Forwarded-Encrypted: i=1; AFNElJ/ZEU47chJrhKk7feSa35TMtvuJetqzfD/VBVADt1UKYSKxjB0sazEOibjbf6ifFYlqCov8cgPBz00KveeTeYGP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6z0T69km++LNePhyEsQk2ibaZdNa7PLO6Su/HXYN1LAWkaC4r
	kIa3bTS6I1JzilO1bk/8Aa3HPVcrU9fgxsyDMTPXMnqanRvMMScAOaqo3TUlJHXvrA==
X-Gm-Gg: AeBDiesb2Pq+/0qBTp1AnMjK2gx1R+i9X+hIMPpJOuxklE+ZKHK1pqeFsxZHCggv+lh
	CmlMYBOXOeV5tbd23NNt3yz0cvfrFQcJwDMxQs7BOwHon4ZiKuz9GIUekIAVlmeOBCjgq6yXcyL
	5sN2Lx5AQKfRB8KpWdEd10IojrBkMtc+WgKw5WYgqoZhomM72Iw2yHR3U4p23b/dNbp57YlCl18
	KE9lbBIjPPM7bq9yI84lFoNcFVBH6LUst94BQypWRjIAQH7E/uIwudL+WOALKpA4bsNQvTlahTp
	DBIKVLWNcS/LmTCdpjQ7iXhneyavyFHo5DOJTfCdfsGsCLjheqdd8MN73x/b7kdMgutkggv/XQU
	nPZdTb3BUTZFaF+J0r7ZOtm9kHGAtrIFNbuUN/UEGUQASqp4gXK//wPLlgHXGmREtPYXRMNLjnZ
	48ucOalgetgvvKQUzDKtdZhXTW9Q9Xc9qm1S47ThBfm26jsAorXNJeldfJw/wGzoT7eZXLJ78MB
	YFyabM5C2minXFN5iI=
X-Received: by 2002:a05:6a00:a14:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-8352d2b5436mr13440114b3a.36.1777976080065;
        Tue, 05 May 2026 03:14:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
Date: Tue,  5 May 2026 18:13:58 +0800
Message-ID: <20260505101408.1796563-9-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111442_219479_FD20007F 
X-CRM114-Status: GOOD (  12.87  )
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

The WiFi supply regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index aae9d5ccca13..da819f36718b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -167,12 +167,11 @@ pp3300_wlan: regulator-3v3-wlan {
 		regulator-name = "pp3300_wlan";
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pp3300_wlan_pins>;
 		enable-active-high;
 		gpio = <&pio 143 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_g>;
 	};
 
 	/* system wide switching 4.2V power rail */
-- 
2.54.0.545.g6539524ca2-goog


