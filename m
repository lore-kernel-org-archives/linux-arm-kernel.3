Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3238C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vmZPZjXbsjdRbGB07wKnlv0n+AtIoVZmnXS0nIYHMM=; b=NOpQcto8fgoWRz4immnjGHJUOT
	l1dxV6nfCPSoC+ilgU9fPzaBrIOPbS/w0ziYMblHCcQUKl/NCU2dhIdGNmVPF8ZCDxuFmxQe7/3vT
	eAneKPkatHKFrAg1hdFS+NLyLvzbLYMrDHTyWwg6lQh2WnwkMzkDCr9ht4W6LJkhWhINuRiOoeVG6
	3wkwU5Kie4Xxsw4GU3UrEqrOje+uK7izYQzniuAoYD7Y0/IKk4hD01sCQ7WPIkWjk7Qy65VfjPhEI
	7qWlSDnoGxz61RxhHAtNbukONno8qMrPZwNUXedBOpJA9wYafUJQ9wq5nK6t15Q5JgoNSop85otRB
	8A9wg/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAyC-00000008NLa-0iuR;
	Mon, 13 Jul 2026 07:20:52 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAy5-00000008NFq-2go7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:20:46 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b01cb18515so2585574e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927243; x=1784532043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vmZPZjXbsjdRbGB07wKnlv0n+AtIoVZmnXS0nIYHMM=;
        b=pmfSDHoPwK6ArGv+QkkqvCcaFilfLPDNhKTmsYQmgtsj9a3tOU3uRBe3o7qJCOhX9o
         IZ9ZYm0f6LFrm1ShFo4qwgOfDa7QRCrQG59l7H/O0S7CUv85tCfB0DDqZ5AMhjMvT/H8
         zvd2mNJLLmKehOjLg01k79n7xwDXg4jQmAdgOEwRSNoqWLhUduNofrXs377Gl2xcumgK
         BT6sfR1THe/CCbio3JIMHFLciAS+wQMcoI3ss2vEle+lhzvTfUrULzaBgqN4U/PqCqu9
         eNj1NVwS+/SW0BUd/xDjSNNnfYJFOUAVmYUdSEtjsNajHyDW1k6RS37aF95znPt4Ee8t
         DuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927243; x=1784532043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vmZPZjXbsjdRbGB07wKnlv0n+AtIoVZmnXS0nIYHMM=;
        b=VPsSRtk4POZ9nsvkBd9gDtb5jtySY6OiwsPjddZL/wfqqmo00PLEk+gNJCBZglSNHj
         WrXD1meC349iacxP1OIf77A0pIoZTPNdVObacx3vL1kqYJ5umBhUAYg30g6XTXbqA9NK
         LfYg5hRWZ3cJcN3wY59uxBTEiNYWj8rwNX4Dzv6NvSTdzfamydvT7cmV+1hH4OH0LyqT
         O1EgpPjdp/0kpSap1dw7S4UXPp1xHkP9CInL5f/8HkKGkWBrmML72DHj9cbGmp7d5KwH
         wS/C4Zl+Kw37R5qIxoMRcKkmqKpDobAyQycYQ/V4GBzjyyHHacFrVTFI2hZ4QKYm2o55
         76jw==
X-Forwarded-Encrypted: i=1; AHgh+Rr650aZlh9KLwcUBltk8H/YwIZEP5sf4UDTwNK3py8nF4ZnvZ3gZrv5eCj3AztVjGbH/rK4xmBpfXcNa+c5kemj@lists.infradead.org
X-Gm-Message-State: AOJu0YwJTv6gzYuaK/9oYNIfhbs7s1GXToTR+/PN0o2ksBIX1tJxPLqy
	s9B1B7BrVsbBVIKhB3/LE15cVy2tRH1kNAM3ang2ozLwHYyBYh48od2Qu4z4hq1DZUE=
X-Gm-Gg: AfdE7cnN9lzrVHptUP8wkSvTrayYhWgKoCCvqWvTCm06QUp5n62Fc4h3483mW1WiyTK
	MRup0ARqXZvmjDq80u4KCKQrGoXvST5TPt+jzxtDU1fsjKguXmg7Jwbb0eGb4Fmne9DsyL8iYte
	EX6JjhyKLvAiLd5BDndyGfqra+/WI+wvIY2aRqU/uue7PDNBRbxfKmNJ2QIaVWrRO5bxf/sklAK
	e37siijouapisF47P02iIuKU+cQGbWOhTSYyBaxSnxeJfN654J7I87Slzk3VfdQE8w11bTMHoDL
	Xp/pUzzwua7EYjVtK2ty8DcwrV6va2PH9lgoxChjYGTxVBMBoID3l7rUdmwDgRI2uUppYzUc0/z
	IESZ22GX6Lon+CmPcTTjYfBPMZr7HAZNz67HrERtaxSarX+GdD0Vd5sVas5cVDPDUf1JGxLCnYP
	xGU1YHSZf2u8KM/q2MurFgLfM5S4wSUC8ceVjaH+bHSq3AW5709UcYKyhsOA==
X-Received: by 2002:ac2:4544:0:b0:5ae:c210:1a19 with SMTP id 2adb3069b0e04-5b0235657eamr1234362e87.12.1783927243380;
        Mon, 13 Jul 2026 00:20:43 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55723sm2625636e87.35.2026.07.13.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:42 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 13 Jul 2026 09:20:02 +0200
Subject: [PATCH v11 6/7] i2c: mux: ltc4306: set correct idle_state in
 i2c_mux_core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-i2c-mux-v11-6-72bb8af8ee8c@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
In-Reply-To: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=tWBE+9nC9oYSk5UAsuWGi9/zHXxUjrXV0Pqxs0s1rgA=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBqVJHIkaxmStpAntzH4EF4X+3uFF8fU4VR6pxy2
 qW6K8bor62JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCalSRyAAKCRCIgE5vWV1S
 MtMGD/9FeY+aRJXCArOuIHRATMXvNmzmm2bgWtK5fqndDZF+nnjxa4OdbmUDw0DXnTAcH41Q8zA
 SJNhPg7tHbTLyAk6hNZOffWpTPyBJSg2gREx/igaTf6UKjUR87MfTMbmw+U+tBRXgZqYnCCE5Hb
 hpcp3/m/jU5zsgbJ3qDYtWakO1FZQrVDyWi3dTC1hhH0i7p2sQ5ENgFeurVDF1pVlSaaGsf+EC/
 kgyWwU30RXT4n+KL17ExMRlgXhhe4oxV3QwtVXSmq0BlOSpT2/IM9sa0zIFJo+1fHNnIwPnkLWR
 67Qt/eextkWalgfMCPEn6gaLrK1o+Vi7UrLIgahGyBAjm9eEy1Jw64SEK++DLUwcWXIsi8KGJfb
 q9RCttMn626mXzsxoHwvdtYv2zqruEQ7hnVO4/UGisWqGSMZaYGMtOZ1UHGo5/GklY+15rM247s
 b0RbhhCyU4HjObSSnguyOiLPrF7KIxEztXnEbWH7/q4NvJaQVJe7DSl7wXv5uDJUL3OTKYImcdQ
 yOTjfkAYfvYjJsQ7hKfVyhOERuqKfFDP84o02XOKpDGyHWj7dOUJaC6QQsP5QbO2YMea/7kouG3
 +eU8T0kJ9YRxapahtHIj2Z3V93wWYZDl8aIk4CTfx399Ki30Uqw6Q80zcO5dFc/aLszH4qSiXi3
 Fg41PQK1pGG8siA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002045_761383_A925EDDA 
X-CRM114-Status: UNSURE (   9.96  )
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

Inform the core if we intend to disconnect channels during idle.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 18228f5b80e8..d1bd59d73799 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -232,6 +232,9 @@ static int ltc4306_probe(struct i2c_client *client)
 	data = i2c_mux_priv(muxc);
 	data->chip = chip;
 
+	if (idle_disc)
+		i2c_mux_set_idle_state(muxc, MUX_IDLE_DISCONNECT);
+
 	i2c_set_clientdata(client, muxc);
 
 	data->regmap = devm_regmap_init_i2c(client, &ltc4306_regmap_config);

-- 
2.54.0


