Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8D2CED26E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GNWvzmtFgayxDKFBCqPDOF8dv3RuxqQ/CWFcJK3lnBY=; b=ZxMGMOy5HZdQC9
	TlQaqz4n3hQ574voozpXuHbhTPPy6WYtALPuY8H+zmHCsOANoXDbFUV4KFQ9eNbaRsA7X2DPdcS1N
	mliGgIkSuj2DIk22495hqiT0ozd/M+mgpySChJ9pIMMTncYj6tc43InTFLOBqTwYGg+1on+gsM47G
	9qArpTyTAbglodU00+i93egVcmRONQ7W7T74cpg2igiWLZ4oqHb9zJXa3hbYNESfjmEmlwFt/yrjk
	+DnxDqh0BvoBa/C+Z+5B/KxQdkLmYXGncALXJZnpYCnOMBsKR/8SnjaKVZqMvGBGYB8mkkr8TjfBx
	EUCCHgUfTbEKt6ahcKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJL5-00000000HVb-0F1p;
	Tue, 18 Nov 2025 10:53:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJL1-00000000HUx-3eF4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:53:32 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso3048087b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463211; x=1764068011; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNWvzmtFgayxDKFBCqPDOF8dv3RuxqQ/CWFcJK3lnBY=;
        b=GS6wh3PyOfhX7YahxJg29zQonXUtJ4ykdwvRUdLQjtTX4uGZlhTgLYkFUI7wia94hV
         PKN+i9u0q5pDlU/d0QJdo1/6lkgQQ8Xh0nEbKkY/f1IqKoVJXVPy8qQywVk3tcl/npf/
         vbBD3/NPnsAn5lnIpyTVyHPxXL/mf6b4bxaeQS07KAIhVgoiQLbocn/gB1Kc7y2a6Tv9
         Ilblvw8NKOWgEa5t7eTFKYTAGCv+uQX+shVzleVcIeuhtkmLuzXgVzs8pBIFk4XOMycV
         NJkn9hj5C5mXpYYIGs5BFbf/tLmiXtdZRXtYs+vc8Qotrf6+nw4bh5jWQbyCzErO28J0
         efpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463211; x=1764068011;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNWvzmtFgayxDKFBCqPDOF8dv3RuxqQ/CWFcJK3lnBY=;
        b=jqlsUnEN00o2t4IE+5RJdBy/iOogblftnXjFyjNWofMSDNX3lP4nJmL6HWkvfAUVEZ
         +57Q6gbr8mVb730CJDUEVJkAP89k2OUiNqPerBWIt4NqtL/xZIGZqHpqjir4L38dI12d
         zDS/F/k/EszLrDQw3zf9AFmceYyOCSGxulRSxq3ZUcQLvP/jVJaPB5PY7XjJXAahTVyF
         416Oo16yt8BbceQCk0JpJ9ZLDqd7d/WQJ4dO/dYoHKgOYpioA90e1XvBjrSFn66pVaUh
         Ndc4BgsSL58WDhwhFcjt1b9q50lXxgIAO1X1RV2g4zY0RvX2YhWQI3jYrY+CMHH49GJy
         3mrA==
X-Forwarded-Encrypted: i=1; AJvYcCX2fqRSbL6B9yM0CZMHFnmn2HWuVnWdnExMjM4tXjxoHR7vuMraDJwUFAlQoAniFPoY76BnWYlojtDB1D+pPqav@lists.infradead.org
X-Gm-Message-State: AOJu0YxjylFNrFfn0VoqbyeJ4Rqt4AeqI/b61CoGxAXWw3hjIb8fJ2sc
	XxDGMaw3Ozg0k1LFHqWEuozA3lOn8sc4SAqU0FPbZj9I4Peo0WLy38hm
X-Gm-Gg: ASbGncvVRB0oKyqoxE6NvkauPN+3krU6+8rNhh7/l91qZif0d9wF6wdtDoofEgVRvRU
	qNknvg1H/u+FYzNLT+6NvuG6U2HDDA3gjFH/aP6jt00+YbXBh6l6Mh0W7C4LY08cLkP7W2ML1OI
	UXX9c3AGGjMyurnVnXnf5guTYbo3nEnO27O5jjIPk7EL4YGCm8dB7OtcHdoSG4bkuXZBGDQuF8b
	+jWiL0Td2mRhGDaE4D4ioAyPd7W2VNg5CUAM5DBlb0OkH10EGdvGbkcrJTHKKAy5DB7ns+vFYnh
	kOgTr8Fz0CN4KmrB+EVdVNFWR41LLtLH8cF4ZxdZcN2rzd9gKzUlRDNVNi+ioRSATiR6DlybzS1
	YOKD2jTh1i8JRVEQqgiyUt7SUVgm6E2thOHVbQVVWm60Ntvrllk52gW4K2eZ0xeBOPsXHCvTVoZ
	83YJ1A//Dqv26Tn3ohsQt1FCH0zslDj+yo0mRIdsSIWStwlHStXwXgiDXYM+E/AOG5l83QY6bF8
	tSl0/2g5qgCKmD2HZFYL7iGX4WgMM56LebYM2A42CqgGvb4RENOuIcOuISZeuKrSFXcnvNczhQd
	YmpfuhEESBfUZF37em7R
X-Google-Smtp-Source: AGHT+IEdCXwcY6BKlnXmAUl8RmB+RxuF8va+wI/WcFKa5as/7KVxKeQKOmmuuoUTbstwS+jBd1TywQ==
X-Received: by 2002:a05:6a20:7f8c:b0:342:1265:158f with SMTP id adf61e73a8af0-35ba2598df9mr19914810637.51.1763463210498;
        Tue, 18 Nov 2025 02:53:30 -0800 (PST)
Received: from 2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net (2001-b400-e30c-5507-a914-c4dd-0879-41e4.emome-ip6.hinet.net. [2001:b400:e30c:5507:a914:c4dd:879:41e4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be368bsm16274111b3a.9.2025.11.18.02.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:53:30 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH 0/3] Revise Meta Yosemite5 devicetree
Date: Tue, 18 Nov 2025 18:53:17 +0800
Message-Id: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1QHGkC/x2MQQqAIBAAvyJ7TnAFo/pKRES71V4sNKSQ/p54H
 JiZDJGDcIRBZQicJMrpC2CjYD0Wv7MWKgzWWIeInX6Tm6vIM91Ro2U0TNQ7aqFEV+BNnjocp+/
 7ARGWMDtgAAAA
X-Change-ID: 20251118-yv5_revise_dts-12e10edd95d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763463207; l=809;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=B61xDsu9dYZf19PlWoIS09j6kYYtBqsX7QXm1aJx68U=;
 b=yCgOZ8n1862RHQxibfMqzDonVmCN/NYAhOA+hvlCEIiGwrky0Mnhf//CgYJS8ZcvvF3N35qNf
 CwWdaa6W6g6CUHT5Te0Ec7UWyo83rnHS5dTgkOXDtkrxcm5J6jNcukF
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_025331_918258_3E4A698A 
X-CRM114-Status: UNSURE (   7.42  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Yosemite5.

Changes in v1:
- Increase i2c4/i2c12 bus speed to 400 kHz
- Update sensor configuration
- Rename sgpio P0_I3C_APML_ALERT_L

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Kevin Tung (3):
      ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12 bus speed to 400 kHz
      ARM: dts: aspeed: yosemite5: Update sensor configuration
      ARM: dts: aspeed: yosemite5: Rename sgpio P0_I3C_APML_ALERT_L

 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts  | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)
---
base-commit: 111e542d267576de402d0836603e1def2b60316b
change-id: 20251118-yv5_revise_dts-12e10edd95d6

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


