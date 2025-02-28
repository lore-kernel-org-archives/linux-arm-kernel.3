Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17417C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NbsovWlJl3HjP6zWFnVAwJ1WjNbEUYuyjrWcVHIxRyU=; b=HKNOVBW+cs+34y
	U2y0G9DfbVCrn6XazAjs024VWFMiaRENjR7Ch/A+4MHBxF4fpUbgvtw/e/4GSbHI0FLLtcg1roemj
	Tk1xbH7H40i2gVubglDtV/YQme0dKz3PuvYQ8PieBQJBoMYC4Li9hqwMaZ4eLyzNsCLgGjK0D7mKq
	l0DXzUYxAtAXDqDQjS7QNoSdiGdyLfCHwngrc9mzb4wqUDYIKKIAqS93c0stjs7WdTLGyZ2VqBzC2
	zwarV8I2lGeA9CsC0oku/XAv96wVDALKvmgDTlN/EMpRxdn0sexpsGpc7zVlsbWGVlMUcxBPZyXQJ
	5JMS1oGdruqAmrQloTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tns9B-00000009kTl-3XtR;
	Fri, 28 Feb 2025 04:38:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tns3A-00000009jhm-42FP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:32:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-221206dbd7eso34952595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717156; x=1741321956; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbsovWlJl3HjP6zWFnVAwJ1WjNbEUYuyjrWcVHIxRyU=;
        b=GWqlXezbj3TVdDG3ndU66gdAp6+KgMeYHvvjDi9T0SJVG33C+jb0OwZjzYyRYiniy+
         gIeLVWo97xEfldvDByrlxshabpna48oD5mqx/yrBV5J6hi24vPBi3RHeq+ruzXmUHd4m
         LiI+17YC45sW8OFxDQZVAJUnh3Ii7RH8q+OFnUu1dQ4mSDSa24YpKgTwlxN1h3rg+lbs
         XfhGYA1t+SMAsfYnLY8USdziXR8bFVWNXPNrGzy5+QcYLMmPjNBqQEwkcPFMiNsxp2Dq
         wuCgCaowrdXa6wuHd/NrHDSJO4S5B2+0mbz5zx6gdoG5lhJz5UFWdZ+stOI5LCDge/wx
         9DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717156; x=1741321956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbsovWlJl3HjP6zWFnVAwJ1WjNbEUYuyjrWcVHIxRyU=;
        b=GZ2tEwYmRLCtdizRl1mj1i2qVM9XCnJkhk5BGTb1uUrGPdkWGVro1067ska5i2dr6F
         dPQVOE6q3AI9aTRJjXhZ5ZXD/htZD9Mo2PCVSpBjNxCbEDQtAi0vGlNHDavPT86hppjq
         7RJTtNsOuQEZhot/mH21aQ6AMx9uOHl2UV/l/+zQ+/FshRPFRBguSkEPhRSNo1fwjdcs
         Vhi3wEmUtRUh3K7lvj7kZUdQcd+o5C4Nb7gslMEUrr/UVhxMyrF5EiI8E6WdS6F7SgrG
         wx6QNApX3iSR3To5XovHTYt4+m40zzDmNSLWzKhkjLLnIznacLQWJfi/O/MRT1LtIzSF
         OyBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKURez0Vi+IVIS1G84elOxF9xKXwlE2fKBlv65h5INXJTVIV2+Bo2sOVQWOSr3w/iz9saLM5ekXkwin8BEclqr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3/VfNfTjUvcnQqZh5xIjdZd6jfLVY0Oe9OSjpUcmR6J9sHLuB
	v9rAj7q+kE0yZ3R2Q+9L4KBAlTeBdPn6LXD9HNQJ0goFb8VAkjH4
X-Gm-Gg: ASbGnct2BVAF9Ees3BAdKEvvO096hgxnk75s9UgOsGnCdM39vcmdFm1gDsuqFU3VNxf
	B1FzYr8AXCP4630d4XhvVDB4WBBWAYkcgydEDp0oGIrF6JplYy5mg0kZakdzlI/JPtFdYnbzRr7
	AhwXM/UFxJYEEh+s1PenjojzjGWypmbDwgzWrJZv5wJkNkX+50GiL3BpkguNGZUWOoXAilRuhma
	O6vP9eMJaukJOewfjc/qbjgcjh4S+vHp3syHy6WMzkXyPkfu1ZcQiJbNHOi7vmcm8s9ivBfipq/
	FYhsIIsAZlITFk6ARsV8BNs3aBjU
X-Google-Smtp-Source: AGHT+IFIFTXj137/X/rmkDNf2WcTJ5lhprjIpnLzgn+Cb3Ywj0z6i3TumH6T6qK6jrOETPuJoy2hTA==
X-Received: by 2002:a17:902:d48c:b0:223:5a6e:b20 with SMTP id d9443c01a7336-22368f6a0femr25154815ad.7.1740717156275;
        Thu, 27 Feb 2025 20:32:36 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:35 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v2 0/5] arm64: dts: apple: Add DWI backlight dt
 nodes
Date: Fri, 28 Feb 2025 12:32:11 +0800
Message-Id: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEs8wWcC/12MsQ7CIBRFf6V5s5jyqBKdHOzqoKPpgEDbl9hio
 EFNw79LGN3uuffmrBCsJxvgWK3gbaRAbs6Amwr0qObBMjKZAWvc1Yg1M29iZmH6oKXqhXgYvod
 8fnnb06eI7nBtb+3lDF3uRwqL89/ij7ys/6rIWc6ywUZwLYUUp2FS9NxqN0GXUvoB9S7ck6QAA
 AA=
X-Change-ID: 20250220-dwi-dt-c9c7af33bd16
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4rp4ZuH22jaaPDSR9maRyjVWUX85BHaTNLUELPlHAuo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxg8y3rR5I3zbiOGRc9dw3HOraEEJaxBIm1t
 EUiMRlANGyJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YAAKCRABygi3psUI
 JAAND/4qzqZlQz3BLTSbeu8maFlAIG7yGIZnEvuAovtFJ9y/J0skR1s2VSx+IQHf7kyfIe7omYf
 /MPTjOiFG4NfeXGUJLUSu4awYgUrn9ZT7OWLfwu1aQtdgrogq2gqbL6C/T9dVTINYdPhc1eMpHE
 QxuZWX61bnCtui/lfuA/hxrPYaM73bacMqCbTkMAcUqAY2gEik+d9/DVvORncGjlIXwJBtsEwhW
 5grg3wukTWwzq9pSbgD5mehNcU6miA8aaT/35nSbzlsrwh7DjI8YA0MFvEsu9w7j3ir8ibRyId5
 VC6wLAgppug8MVcEdj/iIxyMZwGJmDbH+DK6I7vyVHtFKMyVf+tTgpbydoDbvexp7eqJXAc9r4i
 MCeaf0DwyBp8l+La2/6BgNqh1t1a/sh2bBMbzU0XgxYTanzt0IIlZCe2Jcp5t6eYOkS16eiRYF+
 VXzWdWd/EHl6XFqotn+TcjdgjMYiFIbWCS/3s5Ji71ToeViZzsvDOyGlnsSf6gkNOsmx+mymPgt
 THbznCQB0qAfCUPEk2DxZkFLYHE4y9qszprG/RxvQURMRXdtv2FuiP4kI2F/DBQA+xlqyVTIe0g
 eBf1s/gwMbi3AzFH7K55wVzM/3em73ix4atBLLVxgnaJsTt+tSsKz9psJlVs+ZV35saoncCvFkN
 fZUc+zJCt35abDA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_203237_008494_F5C5201E 
X-CRM114-Status: UNSURE (   8.36  )
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

Add device tree nodes for DWI backlight found on some Apple iPhones, iPads
and iPod touches. Not all devices have this feature, as some devices
instead have their backlights directly connected to the WLED output of a
PMU or use self-emissive panels.

Resned because a network error occured and some patches failed to send.

Devicetree bindings are in the driver series. Last version at:
https://lore.kernel.org/asahi/20250214040306.16312-1-towinchenmi@gmail.com/

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Fix typo s/iPad touch 7/iPod touch 7/ in commit message.
- Pad "reg" property with a leading zero when needed
- Link to v1: https://lore.kernel.org/r/20250220-dwi-dt-v1-0-d742431c7373@gmail.com

---
Nick Chan (5):
      arm64: dts: apple: s5l8960x: Add backlight nodes
      arm64: dts: apple: t7000: Add backlight nodes
      arm64: dts: apple: s800-0-3: Add backlight nodes
      arm64: dts: apple: t8010: Add backlight nodes
      arm64: dts: apple: t8015: Add backlight nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi     | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi  | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi         | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi           | 7 +++++++
 10 files changed, 55 insertions(+)
---
base-commit: 5744902a35798e516def50348356f867a6c1f1c7
change-id: 20250220-dwi-dt-c9c7af33bd16

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


