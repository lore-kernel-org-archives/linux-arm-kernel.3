Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BCECA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 22:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UGxiUv+9T9MyXGrGc5hXaCPQg3e9+++0LsEZqWpGIE8=; b=mh8jgERzpRGC5A+vqs2N2iXWve
	kpoqebElGcVtT8QUIQIzwhLCidiZwVxqHuedpFuqECQlDKcp5EqdLZL36Qc+WF7jzl85fZBywMgpp
	LxXGCvod36lsF8UQ5yatYSpjI0r1/fE3I/hV8S2hug2LV6qY1j5vW2w63PpxTMV11i17WXdItHmn/
	FEW800mrsCfAC0BU9pawHMKPa/sjQ7HXHOLUG2i74Hb4rBtYJ8TXZ0hVqCEtIuCs//5AuvE7xKOPC
	xnEmBSF6L0R+KsC1x5wB914oEKxE/qL8lhmUoUP0peQ7yhy7OA9H+iZDFZKBr6ookVgDFpPgSeOyl
	rXE5aj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1iH-0000000DETM-142Z;
	Tue, 26 Aug 2025 22:00:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur1Y5-0000000DD9m-0Lfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 21:49:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so38161655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756244987; x=1756849787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGxiUv+9T9MyXGrGc5hXaCPQg3e9+++0LsEZqWpGIE8=;
        b=mOdIokJmlDd1G9z+D7d9Vf9Ul1LKoD/3in2ed1Ai/8qofDZZvjk9h8DIY9HIhpw3hr
         fDVwrNSHAEJkCWQZDULEyXJ6f/ePAtjYZIWpiaPvtFhH/NSSeCjX5+GHgVXffn+NN36i
         N8zimh17eFWv+clvBpmMxpJixc+3vNTjV8sC6/FKADarxSowb6ERCvPAWgES3k9CSwmC
         SlQqCqAXQNJWrEmYJEVs2tmihj3R/NDtFaeU7Ui3kcMDLPzWg/tfJKMddDmX0soRhuoT
         MCQfutnGM7/GX55NnXS4FSGQartNMnMOSf1hvr4upbpJlbehmtozUXaM3gUfELhzJtBw
         AqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244987; x=1756849787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGxiUv+9T9MyXGrGc5hXaCPQg3e9+++0LsEZqWpGIE8=;
        b=Van2k4u9C5fyn7b+z+AOyGIP5dgV4rpyvm+59nFlhOhbNp3bo9R4YhXY5Wu2x9egqF
         Zx+6yplKXFT0+xHjZJTskYqaAoWLbkcYwXMWLkdGx2AR2bQXrb97iKuYrmtAe6hq912W
         GnPcbMjcHjZQhs9PvIuPlWkW99zK3eFzWdVBbjWhxSr/Lnb30H0RMR4pzy+R9IWRts1k
         Sd51+69AYRIcBdhUKvMGQ6rgSqyBKoQbYI/vTey48E2HnFYmAb7Ay9GqpJjBwHrQZ4iI
         pZfsYsNvFI/wl1Kj7X20hXNv/KwglEGPcsatT3Okx5PVYQSTwCPVacSGsQF2CWCAyU1D
         47MA==
X-Forwarded-Encrypted: i=1; AJvYcCV7gNXAhwEp3jIuCN5JzJIsqqtuQFIjdEbHvZ0vAQIphlsdXiQDJwloUksRZ4TMJ90D8yfNX/icK06NKm51SY4d@lists.infradead.org
X-Gm-Message-State: AOJu0YyWmcCYMz0eHdTSkBos+yxtsDykUPOdt8qS/UM5opptR7ybBkzt
	HW38CAV+W8ge1KDTeL5xVC6UGbfRa4IaZw2Q7e/IaSRgKc4jt4G2+Hpo
X-Gm-Gg: ASbGncuWdbI/FeXIM7ojqd9+bk9u4w0AkIEwhvYFsL65DUtzw+LDtP50JnLE6jy6jbS
	suvw9EQ93Ki7aiv3sPlT+rKk1+/jq1p40stJGbQNuIa74CD2aCSQhkGG4x0t4p14+AnYwa3PkdJ
	sz11tm476PEn7XDUynqHCAf1YaorFWlu5hFTw8IMo5z7Nr4TqDxbnYsbNyjoPLDAzBZZu9Mkc6A
	KotSs3+fy+9CorQxTXFD8y1TCx5/l9O4mkqzFiwj8UkhanFgzDljYwS5Bl9P53mtp2+uSI2eZZ1
	RGoTGF3JNGz4LTZNerMDOUXV0w/aGSCZx0UdKmDAKNWkGfoAUfzMeTX6Sp0f7Jc31cmPGcxhVsY
	qpQnoIZjGwRSQqa41aP9RbL86035uDkHhlgEL/+nD/+yHIbd/tSdYugzcI/4iBAIz
X-Google-Smtp-Source: AGHT+IHv+Wry+OjQYum2M7c57rs+J3M7hZ2o5axY1fUO2E8dRSkddQaT/i6JHD3BgXqPOrIfoE/gqg==
X-Received: by 2002:a05:600c:3b95:b0:459:df07:6db7 with SMTP id 5b1f17b1804b1-45b5179b2a1mr156669565e9.6.1756244987084;
        Tue, 26 Aug 2025 14:49:47 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211b19sm18309207f8f.39.2025.08.26.14.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 14:49:46 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: bagasdotme@gmail.com,
	Markus.Elfring@web.de,
	broonie@kernel.org
Cc: shuah@kernel.org,
	will@kernel.org,
	mark.rutland@arm.com,
	ebiggers@google.com,
	catalin.marinas@arm.com,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v2] selftests/arm64: Fix grammatical error in string literals
Date: Wed, 27 Aug 2025 00:49:13 +0300
Message-ID: <20250826214913.866695-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_144949_120465_8CB79975 
X-CRM114-Status: GOOD (  12.92  )
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

Fix grammatical error in <past tense verb> + <infinitive>
construct related to memory allocation checks.
In essence change "Failed to allocated" to "Failed to allocate".

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
Changes in v2:
- More descriptive commit message

Original title is "Fix typos in malloc return value check"

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


