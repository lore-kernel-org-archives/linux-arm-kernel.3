Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A325CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=; b=Gu1mUW29vgrTLpG3fmwscEfayx
	IecQ1/eXzY79wijTlxxeI6e7xNVYKCFpNY64JB/evTGADDfYqzK4FlykPN+1RIriyUfWsVQ2vCDDa
	K54gIvI1kc75ceXMv9DScO/TlFyMiJhjXTNXEujl/85PuLYdWpuxgPzJ1YMwOzVyXDuFMEsHhgkCU
	ermt6C5XDYuKQzpgEcWIdnfwjjDaWB1w/yBYRKFeZ3TOZEfHowx3TYfpwsTzHbH4OesLaHzyOG6TH
	DWpS4Ur+/gT1UHtoIX4u4k4438OEtiBoyXRpy7HK7AklgLStcQIFBn+X9/GsZfL4onPMSPFWXLt9G
	1uwzy/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgFR-0000000DgJx-0zCZ;
	Tue, 13 Oct 2026 17:25:09 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgFO-0000000DgJL-22jR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:25:07 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3535a54bed9so122627eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912305; x=1792517105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
        b=IlOsDLGOFqHgtrs4LXk0Bu/YwKqC5/owfrRNOuLgdRDlGi+nWdhDExIHmbt2ju6+yv
         jyRQSJqGeKUYYnh09bA7P2Mir0IsnttSX/GJXWijKZj0boPr55RcHaSjAYgwmbY5u+iB
         f0cSLxUZUvdme6vA8sT3fBtS8dOV4JP67C/W9RSYV8zqi98dTrliNprC5diSIdZ9ZipG
         4TB5wNYsgpRmZCXzDULcLhoB23ka/sE1yal95OUv730jNs5yAkfyCLmHBJJRuiNE6e6l
         g9T0cXIzyh606qxUBz7JXipNvUSey6bUX5gTVY7S241K3Ur+xrDEc/T998aHvrYsa+ED
         2qpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912305; x=1792517105;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
        b=U4vDeSDky0pXx34AduQjl/HZDwFDnjbtkhEIWGemlnHfb0uJYI+5UMzFjcri8D901q
         I8jqUUr2/jenHIMcpXfPoPYpqkQr84d73L58afICbyP4xRVMuHcNvjjLuNeCSD2JCYXQ
         VuOY8TIgIz3y7ZyN5VU0YIBh0NwMT7YVp/e6FNyaOoQAvy8iDJoy1upHlAMXmlZcSy5R
         2QUy/Mqp9L/C8p9EwSVIejINCi0nWIJI2T9V8TK7qVlxawiy/dWd1LJGWhcvsgzqa7US
         AyjKoCKfxQfmEQyQvzZZo8cWa+gIvUS31YGf3B5WK3Ort56L+2JRTUvRgM1+V0TPCkNl
         iOug==
X-Forwarded-Encrypted: i=1; AKwUvBykIACmcDHLugqr3JgGgSBYDXRFaFgbrMjJZ7PP5IJvB6APxnKvWTk6SrcbGgIHB3kCVPJjxyafT1o6zktQFBur@lists.infradead.org
X-Gm-Message-State: AFq9FYKsxWImQM3rGD4FQ50CskI0WtyLMfkM9W6QsGbb2X2xvRxYrmQi
	MTsD08+pXysRY2k/3pYjBUsCFyr6ZysAuoBgGyxC1JBq7qk/mrX2CPgk
X-Gm-Gg: AYBFou2k6ZxQ8DjaWyUvHfyqZ7m2jvfly8sBLiAl6O397KbiodJn3j7wL4o+0k+iP33
	AWgmtZl1qQheYGfKcJRcJoW5h57/LOXYj5xfvO0qZYmAQBnaoZSkKkJ0BdS2Dk72P8Q82634arE
	qdBYsPo0CfjhMhaxwkYTsu8RzFqmHpILbZf448eLCGHTUgTO8L3xnLgoKMAGUXIaOMUom/IsyDy
	bYRn3xiAmmk1r8OTPwpGtFaUlHGtlbyrbXkx/sL60BnU6wcJZwyOIhsZIpCbumFRf3Qmlrh3sHn
	JkkiCn3FqoY5HJNhvotv9gomsUbE9JVkDD4wP3MAlhnC1GaNrwcXeEWq5m4hesiZ1kbwTJ3y9ep
	r1eTi0PI7N0g5nxbVlexCS5pPFiI6shgMPJsHpBICuVOhiklFmTqFirAlI7PP+lV9eu1PrtkBK+
	pLRGZ4Jo96IyLezxOvLbXIsJJFNRnXHM5lyefeKMT2T61LTNMuXgs8DY6Yk8BsQnoXEK56OsJnN
	42eh7DUjA7/781jpU6/0fl6W/gkSpRhNqzLW+Xew7NChkuPXxcTfWoYOxu0yuJnomgyJkPWb3f9
	RsbyhWk=
X-Received: by 2002:a05:7300:ae30:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-35c8b969a6dmr3374472eec.19.1791912304982;
        Tue, 13 Oct 2026 10:25:04 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm50303555eec.18.2026.10.13.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:25:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Tue, 13 Oct 2026 14:23:38 -0300
Message-ID: <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013142351.771229-1-andre.przywara@arm.com>
References: <20261013142351.771229-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_102506_533669_DF5464F0 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi Andre,

Thanks for the RFT. I found two things when checking it against the A733
manual and my Cubie A7Z.

PB is an exception to bank * 2: its VCC-IO field is at bits 25:24, while
bits 3:2 are reserved. With the board's SEL value (0x01155550), a 3.3 V
request produces 0x01155558, leaving VCC-IO untouched.

I also think we should preserve AUTO (01). On my A7Z with vendor 5.15,
PF=10 resulted in 22 SDR104 read timeouts and no rootfs, while PF=01 and
PF=11 reached login. This was one run per setting with one card, not a
mainline before/after test. In my mainline setup, MMC0 already requests PF
with a fixed 3.3 V supply, so the RFT would replace AUTO with 10 even
without voltage switching. Preserving AUTO requires no special case for PF.

I boot-tested your RFT with two small fixups for PB and AUTO on my Cubie
A7Z (rev B). UART0 and MMC0 work, and GPIO_POW_MOD_SEL remains at
0x01155550. No voltage-field writes were expected with this DT. I haven't
tested the RFT as posted.

I agree the full table and PI exclusion aren't needed, and found no
evidence for restricting the encoding to revision B.

A733-R still needs its own descriptor for the two-bit PL/PM fields. I'm
happy for your RFT to supersede my patch 1 once PB and AUTO are addressed,
and I'll rebase the A733-R fix on it.

I have the PB/AUTO fixups and the A733-R patch ready, and can send them if
useful.

Thanks,
Vinicius

