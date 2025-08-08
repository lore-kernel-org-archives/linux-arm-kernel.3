Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7956CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zLal7wiw2OJhWbaAgh4E8K5No6pZGJ87RB4Sd7Jh6w=; b=DJ7WE4hRq8LurpSuDSJE8Bkips
	BwvvDLHJ3Gz4glw8wIfmGPOUZ3itVvSYLYwq1zOkYbx2tHfvQqGqAnctnF7xK6a3+99yexFwCW7EH
	VT3cekHE7yr6kXy0ClWD88G9l3YZVRzZtJl8xWPBgHiXeAlPKPwgwpqQx26cew2UBAyxRf2JSlvGX
	NO7PLqgkQdDSw7hW/DZ0caiWqoNW4l+nnhOUzaSfuaApSXei6WPmzZajIAopYIJB/+/L5xXw4VbtP
	gfSCrDRgAh1tgyWj2Fplg2ZthCIHH8NSqWBbFqaeSRX0vHCnez8Z7KmY25UmcmBs/lEKb/T86fqqR
	QDqNGdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIj7-00000002Lsc-2PZt;
	Fri, 08 Aug 2025 08:45:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIB8-00000002J3j-0bm4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 08:10:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso1815109b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 01:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754640617; x=1755245417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zLal7wiw2OJhWbaAgh4E8K5No6pZGJ87RB4Sd7Jh6w=;
        b=mG+CL3CAcOojWtkFo8B7sNPn1mF/RuN5t+55H94sLVgq6PAe6AsCNfE5e/qTOa/vGG
         rUJlEpkGrgXEzlQvyD4UKNeHWIvowzAYo1W2ZpVDkjOlVQRws6fa5jyBKkaGZeAKf4k7
         mV4eQ750oBZSLGOr4b2w+E4FP9HfMGSlQKE3WcMwB/R73nnQblOuBWYlV0byCobJklxy
         8uW2KUYhYOvv578AKXF0ofRJ2NyQmgwBiT6/MTv7O3GsWvAJOV5rm9zL8LgFs2+dKoWW
         3fmy+rjt2ZpesTp8TvPwfIZ6mC100SDx2NhsXh199OcWC2iM4eaEnkxuLwfGpNew5e/U
         oqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754640617; x=1755245417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zLal7wiw2OJhWbaAgh4E8K5No6pZGJ87RB4Sd7Jh6w=;
        b=qkavzkWJtZqhJDgr6GH+X6H+x6qIhz0j0XFw+FQRRhyeGwJNNYCetRTI21UYg7BJLs
         wDmBiKKasK7Xi+T73jjVs5aKACPE6CzMm5E1rdhf/jJms9pJnQXLhTxmFCHy6/8R+F72
         ShmpynlZGfubU+f+M99+sqdhwOUveVdJ4NkYGsb4GRFmR5y7nMLDg/WELlt0Dt+MSdnr
         zhTG77W7vqr4pJaE8Tzv8USl/Hk0MQkeEVAhAOkQXXLGreiXj52ohad3HpTCN0MDiCno
         oEbRN3aowFkL8klmvjUDeNldSYGDhqj9m1a05jHqVFadqBe/l5nKNssoEdPrHcU6NCVx
         HwRA==
X-Gm-Message-State: AOJu0Yy9ODSzQ4eD75Ow/yrScQxWLuQjc3eMQln4rzRqtTpv4v4FXliH
	6zHv09xAMDLzlVWJec3aHF5CkWGn/Iw27kBP7g0NJIFOMRbHBkkU04eJ
X-Gm-Gg: ASbGncu0nTbzPgG76VooJNFDrk5/1f5vD5rjB01pEuCeYHZK3k6wZaIx/JPYamg90Tk
	vE8tUqSXsR9gll90tBEQVW4a5/3oGbQNHgMy1pzUqmb2x1Of8/1JtXZ/AH7S9Nx+F5OgsMMBQQ4
	ZohXsQTDOg/BDrmMln7AIbdzC8IrFUghVx/DiQjddCPyrhNsXYlSo/a6n95IGaKDZuau1ed8Gwz
	a5Nnum5H3cztbCzQhSxHlNZNOSLpMNUnEzWWCPuwRLx4XjnYjKl+P6cEB9xfH4HlV5tbVefzxtH
	+JRFWMT9c1WMeLW6AsFzIglRA4uAb/7m1SNEumJfyCd4SVlFkVSj3MuEfw1FGJEYSFFbNmkt61B
	jX4WUliZJWtEkBT/ztO/aN1K//snTIvrU
X-Google-Smtp-Source: AGHT+IEOBRK8OBS17/ZG9lflsFPSXZq5vwtk1VfOQq6lWhyfYgDsLGdHv2GGhogZHbcQ7nTJUkbVhQ==
X-Received: by 2002:a05:6a20:12c8:b0:23f:f712:411c with SMTP id adf61e73a8af0-240551f864bmr3260992637.36.1754640616761;
        Fri, 08 Aug 2025 01:10:16 -0700 (PDT)
Received: from server.. ([103.251.57.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0b57sm17098358a12.31.2025.08.08.01.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:10:15 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: broonie@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Subject: [PATCH v2] selftests: arm64: Check fread return value in exec_target
Date: Fri,  8 Aug 2025 13:38:30 +0530
Message-ID: <20250808080955.41735-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a72e8741-a63a-487e-838e-daeed3458c0f@sirena.org.uk>
References: <a72e8741-a63a-487e-838e-daeed3458c0f@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_011018_184260_974DA0F8 
X-CRM114-Status: GOOD (  11.73  )
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

Fix -Wunused-result warning generated when compiled with gcc 13.3.0,
by checking fread's return value and handling errors, preventing
potential failures when reading from stdin.

Fixes compiler warning:
warning: ignoring return value of 'fread' declared with attribute
'warn_unused_result' [-Wunused-result]

Fixes: 806a15b2545e ("kselftests/arm64: add PAuth test for whether exec() changes keys")

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
Changes in v2:
	Use EXIT_FAILURE instead of -1.
---
 tools/testing/selftests/arm64/pauth/exec_target.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/pauth/exec_target.c b/tools/testing/selftests/arm64/pauth/exec_target.c
index 4435600ca400..e597861b26d6 100644
--- a/tools/testing/selftests/arm64/pauth/exec_target.c
+++ b/tools/testing/selftests/arm64/pauth/exec_target.c
@@ -13,7 +13,12 @@ int main(void)
 	unsigned long hwcaps;
 	size_t val;
 
-	fread(&val, sizeof(size_t), 1, stdin);
+	size_t size = fread(&val, sizeof(size_t), 1, stdin);
+
+	if (size != 1) {
+		fprintf(stderr, "Could not read input from stdin\n");
+		return EXIT_FAILURE;
+	}
 
 	/* don't try to execute illegal (unimplemented) instructions) caller
 	 * should have checked this and keep worker simple
-- 
2.43.0


