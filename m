Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z6BZU01J;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x8ZxjrUn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=; b=Z6BZU01JxbyUbW
	rkss+xPVWzKDZuM5hOK/835BsXGm8joo0zSsTz1/g43zFtegdtrV/LOOBRu2ZOtxcFhD+lmu/DZ/i
	bskNm+4KSEX5Q3y7d9+DRZNW34jr39rwKAWWHV1HACVk0Z+pOI+Fwh7+LOo1Tl8KFLJ+Sq0ln222l
	PALicLIUzMgiWzMZXTy+pDpozsDO+I6pcGdywm40Lf0Ytsio/6MjeJ0giTjQ+ur4M4Lh1wYQsDjGu
	SPxiOF1hSgkA6ZW49cNO8eK6Jrl6ldv3oAkvd6LBPAMM2nNAyusIHq36x4xam1mxeoQyu54BFHjrS
	QgxLR37slygCwWUl42fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8p-00000002oW8-2FcJ;
	Mon, 26 Oct 2026 16:01:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8g-00000002oMH-3QIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c445c95d553so412333566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030493; x=1793635293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
        b=x8ZxjrUnbelr7WUzdR5p4w0ztvEIpyhlWbvB2LGOlISVAZe6gmAt6T10UfgT+Y8lxf
         GnZ6a+SEQ2AHsHW+2UOxuE666jTmRx1RKAzdfuWuva1vEB6wugnyFHjw5DKhmr75E9gG
         zn20M8jE2qppF58XCWcEyv26o2JfQtYp/OpOy7KXBbqKX8ibE3sw1dg7zwClAH6XP5Zr
         bdIdF69W7eMVMb9l2/XwbZFfgQ+Wc6s/+PLb8qFJ1+X492K62gHtWmYPNg+GCxVUo8XS
         R57OE+gOv22gRVomKWH2oq2g1QQ59/TAmZRc6zSXr9gQVPMaBv99PmgclRLCm54q0Qpb
         ITPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030493; x=1793635293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBw7AsSPjsfDBCQewWzDRPOIx+yoCp8Gcws1tr4ymx4=;
        b=2NBNOYuS1FJ39J7E+kKQlB6RntupucRcaFXFFZHIEhY0ZxazVIyMm7cXHOvqFJaio6
         fcpDVzUOn3ouATbON+kSVx8yXUozYu+/rpUK63QbIxMjDYLo0TD0PtyDcLu5lTuncVq9
         CcFpNJbcJeP/TOSec9kppLOWd6NoqLnHN9IwOBBTCGt6dLl4Y60A7bVLG6ecqzNvwONo
         eVf788aEbFp68gOVtRZUTxjdG9zSt0dGVpLdvEDJqLG7HYx/G/MlSlmMfHhRcLX/FLUi
         S3g3WNvzYecTN4LwA4oEfFzQSdeUSHgnlqoLNhybcLYdDgfEgDUyTipUxqh5gD5imMKV
         LFsw==
X-Forwarded-Encrypted: i=1; AKwUvBxWkGaCa8Pc5ENaRRKGVmbnsrn0/vrXAZlA1d+tiHvIlbGUptqC4NcKyKq9daj/sMOKcDRi1I3LYWb831dSApPM@lists.infradead.org
X-Gm-Message-State: AFq9FYLdPd/GSSos303RqjN7mrs4HFo+LPYqrAKXJKLqS+Ot+5c4WOnE
	gDtvbegoVBrktJToFerI+y9Jl7mYmy1hYxtanUgx/J6rplUHXHshM2R0ltDUws56Czo=
X-Gm-Gg: AYBFou2u+Gvw17Qpfg8FW+ur3+lYw1HCViAtQCSaDLaBuxsWcSsPD4f5J7Vp/bEJexT
	/oDPXN5ZGNgkk27OWOcPk/jI3GH4bXdKoMgpIJnCcVc0g8pUW3ird4fLtLiRbCD+3RQB9IwkgoO
	N1DHL7q0Kh1Ih3PvIOnGUDL+tfbXvE3viRIstEuoDHLya4E6GwQZt3GLZu/CuQK40yPyuVhvICG
	5voqA2TfflLkWRYW9zhjo5LgwTBrRBQJOMOy9dsZPjE8z8k243tfCWiboa/AQjbWnemgNT5FWF/
	GVXB49NnYC2O0Ro9jmoXU8pYtP2QQcRuEwfX1B9RmIX9qNkf9WPOFL2nd67S0O5jyHDB9KDPJKj
	1qQMme3ueAEEWASPJ7OzVpSu4sIQqzniv1ysGcWOtNxSxsGUEy3CNUkJq00bd/8YhO2z1KA/01U
	JxYmYr3yplpoop0Xe/eJ2GrzHz2GYrhO1RtqBiawbG2wyn6Y+zDj5nZ7oNdJ9nrsIUbY8D99SDF
	uKI5kYKMxB8N8fIbE9TeLb7iioSTzya6bMS8Gd4PTm+0NHcVbtQSHH1QXAlaaU0sbZFau20D5YO
	Z9kC22O+n2HOmCTdpVleq6XxWTfdSdWrFKusUcqTlZiNyrf+qepulghw1iG9n7kngoetoXZZV/L
	E4TNC+Ak5Pg==
X-Received: by 2002:a17:906:7952:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c46bdaa744dmr805676266b.1.1793030492733;
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:29 +0000
Subject: [PATCH 12/15] thermal/drivers/samsung: Drop redundant composite
 object in Makefile
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-12-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=884;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=SDTotlLZ4kEAoPrEqW6PvwCyKZkwJhZmCCGyB1TBPzI=;
 b=JadGXkbxn+EafNhgFKNtszZPIyTWdwhW8qTIY37B/py/BVkrrWmdJpOWgaeZTF461yBeuiH6t
 pQrC4KFxCwoBCxlHTzjvL6fSlwGnY2iXIZSE9WCw0AgKuhCRPGCehLb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090134_879169_37B74F0C 
X-CRM114-Status: GOOD (  10.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Exynos ACPM thermal driver consists of a single source file
(acpm-tmu.c). Build acpm-tmu.o directly under CONFIG_EXYNOS_ACPM_THERMAL
instead of wrapping it in a single-file exynos_acpm_thermal.o composite
object.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/Makefile b/drivers/thermal/samsung/Makefile
index daed80647c34..d5b6e9e05377 100644
--- a/drivers/thermal/samsung/Makefile
+++ b/drivers/thermal/samsung/Makefile
@@ -4,5 +4,4 @@
 #
 obj-$(CONFIG_EXYNOS_THERMAL)			+= exynos_thermal.o
 exynos_thermal-y				:= exynos_tmu.o
-obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= exynos_acpm_thermal.o
-exynos_acpm_thermal-y				:= acpm-tmu.o
+obj-$(CONFIG_EXYNOS_ACPM_THERMAL)		+= acpm-tmu.o

-- 
2.56.0.257.gf7497c7d27-goog


