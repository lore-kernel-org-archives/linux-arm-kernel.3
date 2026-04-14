Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD4FF9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmMwrtSIePz754V0sje5TuC0YnmOAM3jxAH9WYpMnUs=; b=1AfbS9Qz7Mu6k9w3fns/9TdjQ5
	MoeZPML+bsd964EnPR5zKpEr+nhMvhK352nmpZztt4HGS2Ifn9KbUocQ4BFy1ul4s1uzjI2A74II2
	ep1g7JYOf+pBJKXFBI8m5FAhwC+MeTM2ItvVjTrAt0G7pVj1YoycT7ibyaLWEVbeWELOLxBxT6UlB
	A4s5XVRfC2cblBB+47Z1Ib5i7UnhPaKouPYPwhAZk9JbxiTlaE6y/Ah9P/yBUpRYLwk97RaY+SCuc
	oPh1lfkoRt/l7QTOOVHt3U9oGJok4ZtOTzeR3zTC2AD+UfavGe5Ny5ys3iG/1VK50/GOysP3CFIL1
	Ex0n8VxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBt-0000000HK23-0dRd;
	Tue, 14 Apr 2026 12:48:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdBp-0000000HJwy-1AsO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:48:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488b8efed61so54557205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170903; x=1776775703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmMwrtSIePz754V0sje5TuC0YnmOAM3jxAH9WYpMnUs=;
        b=TPF3IdeodyP/DLMd3BuiVS6AYcpfOJpv4puTVkSQGLNefAnwGug7x/QMOvsc/hq0wr
         EgmuBhL/+Q000ZA5vRPGmVbTDdGJ9tJKTY/CFkf+H0goDXp+UaKsMtB4qNFvWbzlEZaF
         oyw77+7qRzsx/ur5A7M9FIidRLyxut5e4iDxkxUeajFj2MbXrKw90j97v/XPJjeKdt9n
         938diDr6CUSpoOGLKLtX5E3TwpKE40f3my4sjEEqWrRtHhqt5yXmek7i/EXXk6kfqVDa
         EQH3xfoGcS/9myDd23wlkcJJfadZ/cTG8U+pKFXI+jS68w6KEd3NUW888YBht50JN6ps
         escA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170903; x=1776775703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SmMwrtSIePz754V0sje5TuC0YnmOAM3jxAH9WYpMnUs=;
        b=WxFATQojAiT8kTSYRej3wVqJBlJGwrZQIc0BzfY6W0R0JSlL5Db4NY06R///dcNXDB
         Mu5gy3cryDSPfDLmM2vWMM2qkjxOEtZrIBs1nVg7yUXfamAvt8I5IFWXgR4iYVepHNJq
         DwRseBrfwP2NwjLeJA8Jb7xwidDeK8tdWWifLQ/5ALjj9sAmzyFYfInFHsHSiAKIvLGF
         msFp7wAjVE9ho1UzpgxVVCxwlMth5U6sec1dm9zFZz3xe21CMKhCPt1ky8oEy11u+xAI
         U9EVVuj0C9kTWmxBFDduFQ2IDINMHb14az8p3SmOj/OxsZPaeS37tRlVCZzui6t2NAaC
         Vkdg==
X-Gm-Message-State: AOJu0YzKSS5eo1nhiFjPKyKGkxtU38EW3bW5iyHCAjOZA7BC80MW2cpI
	1DaycK/wt6rid/c6SUGvXbov8z503j+EduTsJFLeVYpv6v5LGaE+pF+HUiUicn69ft4=
X-Gm-Gg: AeBDiet9oHEMXD+4cO8Hb1HTaFpphOLWr88mI7zarKykBFLQIfqICJwwkAbRywfTVwy
	wE+3dyxaknFsOvFac//fTABrnlXg+4Xbqtk9XymlNxSQ6OLrW0ahJ2oXip2puHQSIMvRWg4xTnJ
	4GE9T6utXPad5SfuFdX9WJcJsJFUZvLFHcRQMDP804jT1Q/QkODe30cep3lptLERkB3Ue9xXQzP
	mz/cFy1LGMDmdSJkBuZ3X4MTetx1JajWstfFtGBtjCtSVOL4qBKKQg4mTxerrvu7IbaOZS35Rlu
	m5Rjc+F1T+ATOx7FqM1CAv7Diewak63FEvUlF4iEa+yq5vYiRkMGQWH5zJZZjQiHAWmYF3RPSe3
	XkLVN50G4v+eKcEjW5mRGhHze373qHPvRlhRL41IENXpeOa76RaRlwLNdbNYJ07XK1iE7Dq7L6v
	kkRWL3d7LAh6rRtFObMsEHmyAV5uV9eix5gShA5RUfLw==
X-Received: by 2002:a05:600c:a406:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488d6781cf5mr185361955e9.0.1776170903346;
        Tue, 14 Apr 2026 05:48:23 -0700 (PDT)
Received: from e133063.arm.com ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e05bsm81185285e9.6.2026.04.14.05.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:48:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 14 Apr 2026 13:48:04 +0100
Subject: [PATCH v4 6/6] perf arm_spe: Print remaining IMPDEF event numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-james-spe-impdef-decode-v4-6-1dd30783a33b@linaro.org>
References: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
In-Reply-To: <20260414-james-spe-impdef-decode-v4-0-1dd30783a33b@linaro.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Al Grant <al.grant@arm.com>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_054825_341552_A76CB9EA 
X-CRM114-Status: GOOD (  13.77  )
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

Any IMPDEF events not printed out from a known core's IMPDEF list or for
a completely unknown core will still not be shown to the user. Fix this
by printing the remaining bits as comma separated raw numbers, e.g.
"IMPDEF:1,2,3,4".

Suggested-by: Al Grant <al.grant@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
index b74f887a48f2a13b1be165947b4e3293f9987bd4..600677318f84c06970e4e618280c39cc83ac5b1e 100644
--- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
+++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
@@ -8,6 +8,7 @@
 #include <string.h>
 #include <endian.h>
 #include <byteswap.h>
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <stdarg.h>
 #include <linux/kernel.h>
@@ -365,6 +366,23 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
 						   payload);
 	}
 
+	/*
+	 * Print remaining IMPDEF bits that weren't printed above as raw
+	 * "IMPDEF:1,2,3,4" etc.
+	 */
+	if (payload) {
+		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:");
+		for (int i = 0; i < 64; i++) {
+			const char *sep = payload & (payload - 1) ? "," : "";
+
+			if (payload & BIT_ULL(i)) {
+				arm_spe_pkt_out_string(&err, &buf, &buf_len, "%d%s", i,
+						sep);
+				payload &= ~BIT_ULL(i);
+			}
+		}
+	}
+
 	return err;
 }
 

-- 
2.34.1


