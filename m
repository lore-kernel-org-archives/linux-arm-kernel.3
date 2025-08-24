Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE986CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2N4Xz/BxoJnUC9kUOnfvhJZVau4iCsVpuk+xhLKOTWE=; b=dv1AVXHzQCuL4xZGxQ3QAiwaxX
	rIc1h7KbjGGLEHw6ssVE1p45k35pG/lGjG9gGZjPgs6Ev7juguOqgFxoAJwRhb7d+MO2X4KqxWfpy
	zDfCTiyqlq//9G42GxqxAZaYuS5P7YyPeGus7M9NKjus069utD3kfPxElNBDQFF39qRnMjRiUjvsa
	Zs1ZoraQF30K7oZGJ9dUgQ2XyRoteGuaV0+po8h/emcrcXJalZpG3hBhfz0zVHTr/KoQurK7cQA9P
	1+S2wnXljLrjFErXLje5SiHfMpw2Jjum+c4WBFsjwRpYkRzjkVmHkpzL3vIHkYNSGjASS15eXGtAE
	mzJdWAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqAdX-00000006AtH-1gEV;
	Sun, 24 Aug 2025 13:19:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqAav-00000006AhA-1wjX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 13:17:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b04f8b5so21814925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 06:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756041431; x=1756646231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2N4Xz/BxoJnUC9kUOnfvhJZVau4iCsVpuk+xhLKOTWE=;
        b=Dda/2B25HnANM7DOTquTqyRpvWA4w69gjB+FTOkSC8HyGR2Ij6IOrN1PfzncZU6bH/
         x3RPx+VVS59fQLGSpcpeUeNi9NczEobyHAouU27ueXXW+cHqBaufvHb97dHkVCXF8HSR
         397u/1dadpMCN6+Uxi+PRfI9LXXytq9GR0YEeEPRSmSKMjoAUi5RBSQYXMSCorvumLFe
         drVhsIZ+Oi6PUzzwg8qrma3LJO+OhsjudZq6lmdXhYkh+1SSBhW1IlCHlWugkNoc9rzn
         pxC/bq09KJh+5CPfYNNHOIkrCiXNj+G+x8z6qOOEjIq7LQM4aQ4inCwdi9D2G3pij1xa
         lB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756041431; x=1756646231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N4Xz/BxoJnUC9kUOnfvhJZVau4iCsVpuk+xhLKOTWE=;
        b=fKk7g9/piLmrXizweISRXYaUzgk8jXTqxu653+7kR7HRREwDgA3WSYryqm8sT5xjl6
         vGK3ebikdno/LKxmqx3g8yEmP2ixPL8qpa3k81A+wbF/jBt7bOmyaCx+xCAOIIHwNtv5
         wXYsVsDa5LRzHPZnB5aHbm9ZXpdmn6y6TMXnz2kJWGpKr+MH3LyP7iLBeUnO90cRVuxJ
         AYROcwiMASy5opxxbi3FkRlYMSjFrJhRn/ECr1q0oIA9BpzI0AUfaGveUvtZ7RnPvA0m
         PmjBlidm6X377LFDj8ZWEtELZEFMlu1MnFc1RqJH3RlQU8E3oXXfGH3iBIyNNSGwh/gq
         Gqsg==
X-Gm-Message-State: AOJu0YxoGDoXJNhYTsPiGNM2zXozEYATaLnEhqeLPP3+7b3NHTQkq8Pv
	pbT6K7PTmYCrnL9qbXv/cCQ5qRQG3we1QRiHwjnwho7UjUHo9SBjWGKr
X-Gm-Gg: ASbGncuC+QAlUgqgXtUTjwpZoAoQwtEzBmgGvZUxbauSrtQtML+j+1YYVBj6+5sv10K
	PJWu7SOeWEB1yoRr1UcwNMoWjFaPCRUCbE7YegHgsbMnzdlN60MBsh9a4KhA9nPXCiVDEPLOfZC
	KLVbzJsbfP6ktzcF9KOxjc2kIpO1dGNZZwyDTwgUQlEMwaYKNxzNqEOcRupNnau10KTURKkGAkh
	vBeEVD8JHB3qadUGGM7njBkPiixtZB9fWh4z1LuD+aHNh9XkxGWMYuWlyG84EOuu/chPTV5+Lwa
	96CTohHyMfxqG5bKbjEUvcVAYiJz0ZVmmMcjXYPR3OSw7fGxpBmGGPnyeI4igA0Id8sX+ucff8M
	xqFkyuirhtotWUChyVI5rsU2Uvd4qZAyPOz9szV5CfUgEkK5ubJEDKGsldr2afdw+m37Kym0zD5
	Y97GPHXZuNwQ==
X-Google-Smtp-Source: AGHT+IF0p6X6DqMaft8bVb+xHZzWcrilM0oEkMehJr2d4YlsCBG5vyIsnO0FKQC5OMwp0lsuPqbhag==
X-Received: by 2002:a05:600c:198f:b0:459:d709:e5cf with SMTP id 5b1f17b1804b1-45b5179b710mr77565375e9.3.1756041431473;
        Sun, 24 Aug 2025 06:17:11 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e8f4552sm75658355e9.8.2025.08.24.06.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 06:17:11 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	ebiggers@google.com,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	linux-kselftest@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH] selftests/arm64: Fix typos in malloc return value check
Date: Sun, 24 Aug 2025 16:16:47 +0300
Message-ID: <20250824131647.490439-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_061713_501479_DE8532EB 
X-CRM114-Status: GOOD (  11.86  )
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

Fix double "-ed" in malloc return value check

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 tools/testing/selftests/arm64/fp/fp-stress.c   | 2 +-
 tools/testing/selftests/arm64/fp/kernel-test.c | 4 ++--
 tools/testing/selftests/arm64/gcs/gcs-stress.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 74e23208b94c..ddc01efea3f9 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -549,7 +549,7 @@ int main(int argc, char **argv)
 
 	evs = calloc(tests, sizeof(*evs));
 	if (!evs)
-		ksft_exit_fail_msg("Failed to allocated %d epoll events\n",
+		ksft_exit_fail_msg("Failed to allocate %d epoll events\n",
 				   tests);
 
 	for (i = 0; i < cpus; i++) {
diff --git a/tools/testing/selftests/arm64/fp/kernel-test.c b/tools/testing/selftests/arm64/fp/kernel-test.c
index e3cec3723ffa..0c40007d1282 100644
--- a/tools/testing/selftests/arm64/fp/kernel-test.c
+++ b/tools/testing/selftests/arm64/fp/kernel-test.c
@@ -188,13 +188,13 @@ static bool create_socket(void)
 
 	ref = malloc(digest_len);
 	if (!ref) {
-		printf("Failed to allocated %d byte reference\n", digest_len);
+		printf("Failed to allocate %d byte reference\n", digest_len);
 		return false;
 	}
 
 	digest = malloc(digest_len);
 	if (!digest) {
-		printf("Failed to allocated %d byte digest\n", digest_len);
+		printf("Failed to allocate %d byte digest\n", digest_len);
 		return false;
 	}
 
diff --git a/tools/testing/selftests/arm64/gcs/gcs-stress.c b/tools/testing/selftests/arm64/gcs/gcs-stress.c
index bbc7f4950c13..cf316d78ea97 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-stress.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-stress.c
@@ -433,7 +433,7 @@ int main(int argc, char **argv)
 
 	evs = calloc(tests, sizeof(*evs));
 	if (!evs)
-		ksft_exit_fail_msg("Failed to allocated %d epoll events\n",
+		ksft_exit_fail_msg("Failed to allocate %d epoll events\n",
 				   tests);
 
 	for (i = 0; i < gcs_threads; i++)
-- 
2.50.1


