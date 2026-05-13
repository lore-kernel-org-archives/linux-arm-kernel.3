Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054A7CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uEBddq2I9/xi/Y/+09mKq1a+W0z/iD8O7FvkVZ5efms=; b=eEQtpmSlhzPAs5
	2EF8kcNXU7YjsWg2ZEkz9LKUUV2b2tmjXXMu47qDm+NLc2aUZ00KfYFBZVMYQJhC/jOeXrC/PxFnO
	u5QobiyKVjfk41x1rPOYprrWVd4ZtsZRT9RtCX3ux2aivGUbbOsVqWu4DSRc1J17CyzPoyRmza5jk
	18C5FJgYzNgdUGs80agehHgCzd/Iw3X0EY2YgRQbR3utZlW554kHYF/r3TpKWa8WpodYcUJGOoAMQ
	PL7afAucWWtUBnl9qItc+WsLQLEy3RircJ6AMw1WFtUeGiS1ULThGKifX+AfP8xLgKx5MreErRcaz
	IOn+IrMynHNjf1LjkTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHEP-00000003q0U-491q;
	Wed, 13 May 2026 21:35:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHEN-00000003pzR-477c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:35:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso83077195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708102; x=1779312902; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uEBddq2I9/xi/Y/+09mKq1a+W0z/iD8O7FvkVZ5efms=;
        b=mQN1LFvRpU5/E+s82YBZ93OCAi/UH4/3z/qZH9JyLPGTaGGkOjfXFGX9ngqwqFQ6mv
         mssqMixkJr0JtrEoACTxV4QG8GmmfRre7uWQ4N/p0NI+vl8VNcdonTTvT4iJ0oyWtEef
         58pEq51lnnMjSrcN8/ZNRLx8+sSUhHpzN5bn11iL4GQvEyLpkbsJ7dDqcMBCBTgEl9q3
         YJlHEzt6H5vFVF9IZmQ/iWIXr8CqGJwLEPEERW/iitMG8BAVgjUlkkcduG7y37HtWchb
         Do2n4/Ku8qIHy88wqygBnE8lIipq6odA+Javu4xbulTBLejbO8PzDHc7WCI7tkJG8A9p
         kFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708102; x=1779312902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEBddq2I9/xi/Y/+09mKq1a+W0z/iD8O7FvkVZ5efms=;
        b=pY3eXW6WdsvIE0IfNqULrNIwDEyd3jhFhVDhIdn+ghdYiEGh4uD+jCfL1QkPZS9X7l
         yHJaU2cPOXeLJ06pPtmfIoELR6O7mNJ2hD9c9yXVYPs/9diDk21vbPp8DJy56RVg52t+
         anGUgjqJ1W56UF4KoSJYwoMaIu+1KVJZwV5ySkh9CccInjti2KxEFlAfjnPq8ZWhkKLV
         eq6oGkZGcawWa8TdXUCndq81M2X4ZR8G4nmKAnU2NWAc0zjytqdPcIncjvDpcRRrK5Mg
         YbIgKDVqsVu7R7Hlz3wDvy2z/QEkpPKJRUnsKq5hVC9SBPQf1NKVsAwUQIKL3WbOzBGa
         YfZQ==
X-Gm-Message-State: AOJu0YxBcVv2qjEmy0tDK4de90EOtOoE3q01ts9oR2S5kCEyIY+/smRq
	/M3v3oLrtR2RA1c4S5Lq0IZOWOS6Ox/4xxW4zUIQFGwDl+WkadLe0sHanMTQd6hDgZg=
X-Gm-Gg: Acq92OHRBUSUSlY4ZgsTOqGlYTtE88GNfuAeZTFsieCUV0O/IItPvpBsRPoIpGaBEZU
	xyP7OI3Ax8PMDJWQ182Evye5jNIkMvPCnJQxEQInIe2k6B36DorTSC41owAwYk3mdlKbITw+eXi
	EUG9BW1DTNZCrP7+If/NXfyHeVmw0Ga3CDwhLHngayP/RT9yaPE4XXCIv2mxzhg5hguRPEr40sx
	CwrBN4Eo/r7zJ8npZTCKlXxB5UYtIK4TO7xXDph/D+zfiiHu257YwD9Nhd7y0j7doT1lYqL+Zh6
	/mcrCOZ373QwCpDrEoXPGZcTuG3R7nnLdKxqJ90NBA1jkg2B8PTtEpfHpVdBLlZNRYlu9aBxWXR
	U4D2loz1MaIMLjA2YATnmghIHK2rRR0bLfzLo7VED9hwExI7JvmJe5wDVpm/IdcDVcQWbPWDCum
	bfQNXX2yIFwvXZH78CPBgiW9PcSmONJiw8L3usPsCNuGM=
X-Received: by 2002:a05:600c:6217:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-48fce9d92bbmr70751895e9.14.1778708102024;
        Wed, 13 May 2026 14:35:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb1fee9csm2553055e9.0.2026.05.13.14.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:35:01 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH 0/2] amba/serial: amba-pl011: Bring back zx29 UART support
Date: Thu, 14 May 2026 00:34:55 +0300
Message-Id: <20260514-zx29uart-v1-0-68470ecc3977@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH/uBGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Nj3aoKI8vSxKIS3dQ0E5PENHNjQ2NLAyWg8oKi1LTMCrBR0bG1tQD
 /2TtwWgAAAA==
X-Change-ID: 20260513-zx29uart-ef44af731390
To: Russell King <linux@armlinux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=L/sIeqo5TAzLfSgfOfVLZxiWCo79S6F2nfHSiF7e1AM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqBO6Dl3/1/DRcjANJ0f1RNC59xVDm3d1kR5c9s
 i/RNdUzi7iJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagTugxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiITwQ/8CHj2/Yi3yO54KxxakskmiteBJ8oXFPG
 ZqES5WVnpQrdzLVVy+LfILJin+nX9wMOj19hqwt234T6LsWXs0+Ry49fL9U6IOrEEqFUHisCLNu
 PKVJrWlwdmBZxpqhwE+FIo6NZp/M8KF9L7KUbHNCiG3pHaFOWwlICzkoROoFFhNlFkCxQ0Y4FXi
 qK7GN4yqcCb+VavGI1COzepQQvshWATUgkZbQDT18DU8cb4dYzXVJ+wcYmnyObBPlWtxLNvn4UQ
 x8c3IOpCXCPLbdjbpHNqbk6QsvQDldyYK0nQP0B0UDhZQETjtu/FsG+gLOhTT0b8s/dpAF+inRA
 rcdhCuuvOVzVF12r5g/SMWai9mhVXhWtvod4jfasfZKdcHi5TGHSPwHVxiImXz2YIPh+2CsIC1+
 LnSQn3vBTF+Sv4zCg4e7PcNicp3lNYtL1BkRZUTuAOod1y2agvhhlvK0Ywy72DqWbtxbgJniSFd
 j2XNnTyGdQvHGinTNt9pdOyXlmSLK8wZjAzdWnR1Mqij8wxZzNv9Oq1B8m53fSSgmh86zf/6alR
 ktyncFPy1U52AjUdVWScq8G9QShYGHTj/5WhbIdxFw3DzYsML3dvbyFTBy2bN0JglkCNtnHpGbS
 cISdk1NoUdw4ODYUIijTMcFYLT53Bh00d2FqxjlAH2Oj5eSL0BYg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_143504_039921_C52E9E0A 
X-CRM114-Status: GOOD (  11.55  )
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

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). It was previously discussed and reviewed on the 
linux-arm-kernel mailing list as part of my patchset to add initial 
support for ZTE's zx297520v3 router board. I am sending the two UART 
driver patches to linux-serial. The rest goes through the soc list.

Note that the first patch (LLDEBUG) uses a Kconfig symbol introduced by 
my platform patch, which was sent to the soc mailing list. I don't know 
what the correct way to handle this is. I can delay/resend this patchset 
after the soc changes are merged.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Stefan Dösinger (2):
      ARM: zte: Add support for zx29 low level debug
      amba/serial: amba-pl011: Bring back zx29 UART support

 arch/arm/Kconfig.debug          | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S  |  9 +++++++++
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-zx29uart-ef44af731390

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


