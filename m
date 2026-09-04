Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2B5C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 04:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4fxf8J4OmCFyk0Iv5TozrZp37SHzY+6D8S5rOoPdJqQ=; b=pwXB16SQYrR5Tx1PTjT6Yausxd
	bhZ7Fv4zXoCPHBhSTSZOr6cRM43vUojSLYJJo/Ufy25qw6tUjvk0gULdkUL9oCDzLIJFGopDvuJYP
	SVNa53TFCVXVyicKgZYgpQAB+Ba9mUKVDPXs6GclerK1oJ9JnM6pZgaAJAxxnAC6ibYdduP1g7Eh7
	SbvJy1KxEfnLwBkK+dfTa8RWRCCmf1NZlkjSttyun2YCGTtK1vDLJZornbfQcr5oKguwh8uCoM8l9
	E0bKCIo6U2k5j2KHDGxI4rGkVKn6GgBjLxNuqJuCLp/D0Zg5pWzha7G/WNA8qKGm3DnUFZ8pxw1w7
	P/RsmnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LPB-00000000xc8-3POD;
	Fri, 04 Sep 2026 04:19:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2LP9-00000000xbk-006I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 04:19:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so1634803a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788495594; x=1789100394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fxf8J4OmCFyk0Iv5TozrZp37SHzY+6D8S5rOoPdJqQ=;
        b=TbIYuMZCxrmt87N3n6PBPmUViJYd0xG2PhqaCA4moPbu6kxANorileudZX88sL6sa/
         pr/nWFV7FqI2/OefKdso1OKg7bQVbu3/GwBMUv0NAZd+ZzOeowDe9zSyJv8dK0OZnG54
         8CJN/iAKwAb3+/WR6ty7UEwjLlxQPHAyBMQmxAcHLq+USODxSXKawKtb2qK3n8Rl4D19
         8xncGVY4pvscwmAcGLcvVd4cRp6lw57dBu6iMfNXki7YPXzXoDw41j70tRmfMZpD753k
         6HbWDD0E2TVk8p9hBr3J63j3psB8DE6STL309zI3VoIGtsBymCoImeSSQmzHcIeYdFq2
         40GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788495594; x=1789100394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fxf8J4OmCFyk0Iv5TozrZp37SHzY+6D8S5rOoPdJqQ=;
        b=OZbFzU6CiMDqOkwioyfC23YqHsZHBxlgUamNnh45Gfws4L1s7iEUXfFYT2HnBcGLe6
         OWQ0cDha5bX2JiPyDMH26bLToHlfMtbiQfmN5gPFwYbLxmbBrEtoJw4QVXmLu5+aNHj8
         LrWSklEWOhtNOLSTlGTY9o17wKRGDyvOH6JwI1c9FjOX1HITwPEjhszxP26VwUkUDYmL
         fG5zy07G8owvNfFyQWdPVZo9VuX18uqjaBgbiCLKXm9upNq17pLflH4Yz4efL2Ok1xiu
         17TRu0FT36RsrX38eIfHDU0LYFgY9YUHD9xYTeOrQ2aRt1BPEGJEoOJI+dUrPwl+gMwa
         ZX6A==
X-Forwarded-Encrypted: i=1; AKwUvBxaCIuhH423ziJ9h68jkXof2QSO5WkLMoKjUpOSVvohj4O+z6wY53kkZyeUUXdFYDYnTp3juwvr9ksg5EpZYXjs@lists.infradead.org
X-Gm-Message-State: AFuF++l8QOtuA/URjIVuGmi40hrxqDMtJxlxF23Ny4kGN24IIyK/QXaF
	QvL9DonYAjAcTtmCjkxgVM3805tKT4pR69pImwrbZRRVO01k6BhURyN7
X-Gm-Gg: AYBFou3RDYdaq2COALt5C3/UPpF9dey2lGwy5BdOr3g6EK9+7xMJIV+8q2On60Snt+S
	+iWJoOZCEH7eafyQsT9h1B/g1mg7r4rTIc2FA4ZuAF66p0Niy7DSfGa3Ma6jS144dkxpzsSk0nM
	xw0QSsE2wLi5A1YwpbOgmwR/gOUIiRYIb0QC6kmbmau++HipRcsNuK4KXULGT2pGAPbp8ZwY+AU
	Ebko6S2Y0JhJWAkS0UFQblLfM9GiZXRfk6wFg4SvMTxH05F71NpEb/GTTRpdWxANoMFUC+XnsV7
	Dr+TzRhywb8s8X2AQrN2kD+I49tIufLvJA1w1I2AhDMdyeeS+XUcnEvcHG/3Vv5rdRHQyF9OkEA
	79CRf8Sb3XgHz6ElnlCsLCgbgP2owdXZzTpmLIqlEE+mrzxiwBA0ly2y3gnlJHreicRtoQvayhZ
	ZQjcigO+++Xao9zC5ZB6FsBjzFuDNUx3/4OTjuabXZ9Sc6q0mxRXAne5IiSrw82kbZubN6zDJR5
	CvqverW8HX6qZYCZGbqVsELpLL1jSBVCtBspMjCA73pBH6g81KYVpI1B0+Feb+pnZw8nuqCAPws
	qXVPoggg4DA=
X-Received: by 2002:a17:90b:5745:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39b0803accdmr11317552a91.12.1788495593587;
        Thu, 03 Sep 2026 21:19:53 -0700 (PDT)
Received: from workstation ([2401:4900:8902:9774:f2e9:38cc:6b1d:1764])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm5424299c88.4.2026.09.03.21.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 21:19:53 -0700 (PDT)
From: tspamiitesh@gmail.com
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amiitesh TSP <tspamiitesh@gmail.com>
Subject: [PATCH] docs: fix typos in Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Date: Fri,  4 Sep 2026 09:49:42 +0530
Message-ID: <20260904041942.150054-1-tspamiitesh@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_211955_066500_BFBA5D5B 
X-CRM114-Status: GOOD (  11.87  )
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

From: Amiitesh TSP <tspamiitesh@gmail.com>

Fix typos in the CoreSight ETM3x sysfs ABI description file.
The errors were detected using the hunspell spellchecker and with manual
verification.

Signed-off-by: Amiitesh TSP <tspamiitesh@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
index 245c322c91f1..a2e6079ff01e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
@@ -2,9 +2,9 @@ What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/enable_source
 Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description:	(RW) Enable/disable tracing on this specific trace entiry.
+Description:	(RW) Enable/disable tracing on this specific trace entry.
 		Enabling a source implies the source has been configured
-		properly and a sink has been identidifed for it.  The path
+		properly and a sink has been indentified for it.  The path
 		of coresight components linking the source to the sink is
 		configured and managed automatically by the coresight framework.
 
-- 
2.55.0


