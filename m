Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF4E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiq2+idlG0hH4ZrZSix3sKLK8vSbIBlzF1NOft2de3U=; b=EoyeY/QxkaFERv
	lTlABMQuIgNZh9gHbMu1MZxb1LIi1T7U9YBdP6Ood4o5ourjq4hqlrMUyjD8J+K/64qGRN4t7nmIt
	q9E8sDXtCnwrqAZ76hRXIIKLGuGOmlgPvTpmXdjBgBb7JGQjrjaq+ya519BUo8DqBNzbD8ePIv1j+
	7WiPZ68EghW9X8MzrEFfDNa8E1hPCLev7HQxroH7r9dULjTDPkX5BZwasLjOfuo+fAKPcduvK31bh
	J0zpAqTEpwMvhyEcZEaHIgHk6aj1qoC4wi+Fobq5lxvb0hYm711LjkNAzMZLCsNifBce1ZiHRktwc
	e10aaidfxbBu0vp3F3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39W-0000000FahA-3oc4;
	Tue, 23 Dec 2025 14:14:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39T-0000000FagJ-3UwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:14:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a09757004cso63671875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499254; x=1767104054; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiq2+idlG0hH4ZrZSix3sKLK8vSbIBlzF1NOft2de3U=;
        b=cWsq7ZMu2QWDlfN3huaBrs+znQ8DILSb1KsYF143kG5CiFn9Zr3P0EOjJ8h8YPp4Ki
         FXfjLsBNW+nrRk3t10V9fQEdxfApgvwKOp70lZphZglGIY1w2y54guCdgrON0ygEhjNX
         pRIojC7CsSyclPalRlHwz3XYmtgpZWlZ2T4jZNWTMnGawYwJMVI2SelEjsKwVB04Bbf8
         h5R3w7BWswKAFrofKMBlfIcdV64yWeYQ9L6LyEiFWEoRgQYFZ7YKe8b3f5Ml6OIBLPmX
         fGtaPtsd8L98or7sV2AJPnxoVKy6KWFCwfkpEpliL0BJP8N5U3szqoToE9YZIyCSRwhT
         M4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499254; x=1767104054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiq2+idlG0hH4ZrZSix3sKLK8vSbIBlzF1NOft2de3U=;
        b=SeRdN3Umn94qydmF7U+ctkP0rR5vjRWMnKijuaEU8tpwICZ3E2Qd+Q5TsoZiRTVD2+
         62b9Jh6IfxyV39KBcxMmjquRYpXC9xvBuIDbc7KsmX4mz7pKvSy+rXT8XKPLoIiGMnjU
         /tgtpIrH+feS2XUaMRzMqKAHxr9LCpq/wy0AXIUfxSc3F0O6PNKQHQ7WGblqTPJB3kCt
         Tw+tFtIGfuhZd06F1OWNaL9BZjsT8M1WaAOQCbvJm7I7OZBcIACz3qBGaD/EpAEqsGvx
         jGA5qdK8ewizIpwpWG82B0DDLHZUXzrF41zhahy6cigK/1OUkZPfnVGkKQjAV5IFjSQj
         WuQw==
X-Forwarded-Encrypted: i=1; AJvYcCXzHFfEbTyGaUkn1mhiORudOED84kuS6yQUKWVNpcT2yA8olVc3yoYflwZY40KQ6X2XbBsl+/703Zwa0886T3py@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Ucv5yWFyRPgdOh7O8EbJW2R8A33AYKMiKg+9SOcIKszLhzjy
	vggDp2m0kfdUFJgJkGsY5hFJ/sDhv5gYE2TaYmcIG7wT0kOsBZg4sXoHa53Rsw==
X-Gm-Gg: AY/fxX7bNEC840wMRCUeLoV4hykCR7elmI+p+Tjjdx7v57mCutnsJVeHFfrM/gKJEbh
	DKasjlOZfmQM8QrJa8Ad43uun2ApwDINq90WbFwwRQqsntFxxCrAyrMrPAnWXCCr6eauDL3uWxd
	s8D5oxPW15iWK/nwK4g88xXtvF5Boperi25TxyG0zUxsH9Bxtb3T3Hc4Ee7wT91K4xf7kkyT5Gg
	49Sx/iKaRCVKkAutKOHaT+c7LGFpTQHNO9DVtcpnTCIaNphxTgwvP66tF+NAMd51KO0n34LX80d
	NVa2gBnC8bOfoKFXOdeT7DyfSfPKGNp7oJp+9YTfkM2uT7JDnkNFU+O9g+tcgWCaUCmSi2TQRCB
	M9tOn/U6XjAByr8pot2pkRAHqjxJe7KVpxjWyjoIdrLIZUYJNULgxLZw3iQvIdJ9z+BwGFxFcYV
	7Az2I55hicCtp0
X-Google-Smtp-Source: AGHT+IFyvVOEweNxrh16YD20mE77IBN0Po8lftDP9+7uthANKKUtoM/hDSrwfGPJXxWtS2gW83cJIA==
X-Received: by 2002:a17:902:f60b:b0:2a0:b44e:9ab6 with SMTP id d9443c01a7336-2a2f222aedcmr158395745ad.7.1766499254507;
        Tue, 23 Dec 2025 06:14:14 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:13 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] RTKit protocol version 10 support
Date: Tue, 23 Dec 2025 22:13:41 +0800
Message-Id: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWjSmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3aKS7MwS3TJDA93klOQ0E8OklMTE1DQloPqCotS0zAqwWdGxtbU
 AMb6qb1sAAAA=
X-Change-ID: 20251222-rtkit-v10-cdcf41bdaaef
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=2GuJTyWIrsDeGaNyuHSnV8PC6KHT0nLXNngeZNALiqY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqOwxGpt66m0Ftv7sWbJM0JlxwkPw0O04MAXv
 mmMcoQCcu6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjsAAKCRABygi3psUI
 JMVQD/41UkTQa0076LW9gr+nbJAiCTI0Es0JhXXGB9F25C6yySKvUBTX0fMP2YAfWSuZh5ezjLS
 Rs92NfEZcUDUltXsObHEcMbNJOyyOoW/RfvW9Dr3gYtwS2ajezbcbMWEfjv65GeN2Q9FcMh/TlV
 /AVhPfp9YT8mHCdGRMeek3P1BcqrDStLc5sbvgdolmFaMtI+bLRM70t1LD6VZBe4eAATVTaJdiM
 I8hULkYZt62gj5Kk4wUYmavF7p3hDeGN52lvjUe9N//O4G+adeVSBNMfZ3zA/La3mic13RX9gb/
 ho4PuLkiDVS1vWKXjnzNvmoWaqbOM2/UlBOFssflYJl5/cWOb0jR0O/y16GqU52/XROSJdyEdwE
 fC6kp40kNOvqlAwk3Q8kNHXSVtbq46LkmineLmXfyzoDsN/xwLWB3wCnhtIOhmtRyqZHVXCtiXt
 Oc0/7/3BeBxK0SxzRxlyj+i2VfefBMCxpn2/oAdNDe9yZuJsSDiiySihjzofqFykhDChjaLjuii
 V70Gg6BreUjgECgt/Z+TnkWUAEkW1nowyP7X6j90VW+Y/Y3TgKKoKJSIcWFRZ2rtx1s+nSz9vSJ
 G5DTimceg38O9ypV3Rx4bxC5ffkdYAmNwBM8NAxuhcdfDwzN2/nAVP1A/Pq7zndJaOHXWhjetie
 KYa8w3mxCvBEWzw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_061415_878710_2F61F610 
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

Add support for version 10 of the RTKit protocol which is used from iOS 11
to iOS 13. In version 10 epmap is always completed within 1 message, and
app endpoints start at 0x6 instead of 0x20.

A new interface apple_rtkit_app_ep_to_ep() is added to accommodate the
difference in app endpoints. Consumer drivers that uses RTKit app endpoints
need to be modified to use the new interface to work with protocol
version 10.

Add support in macsmc to get the SMC endpoint with the new interface.
nvme-apple does not use any RTKit app endpoints.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (3):
      soc: apple: rtkit: Support verison-specific app endpoint start
      soc: apple: rtkit: Add protocol version 10 support
      mfd: macsmc: Support variable app endpoint start

 drivers/mfd/macsmc.c               | 18 +++++++-----
 drivers/soc/apple/rtkit-internal.h |  4 ++-
 drivers/soc/apple/rtkit.c          | 59 ++++++++++++++++++++++++++------------
 include/linux/mfd/macsmc.h         |  2 ++
 include/linux/soc/apple/rtkit.h    | 10 +++++++
 5 files changed, 67 insertions(+), 26 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-rtkit-v10-cdcf41bdaaef

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


