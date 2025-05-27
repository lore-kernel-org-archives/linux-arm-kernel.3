Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E68EC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNBSgGt6ntBeP6bJfTxMkVoL1Im4HvH+NsU4r6JbrSA=; b=bHSOvWcB4Z9Bx5ft1s8xO+kmNS
	qS5ngNpvtfU9XuM+iGrotBBVko43Jq7f3aFKp02mJKSEZtqmPocara0TWAKOcUzYF+rjVduf3rejk
	Wg6pR27Pxvw7dYalZhMz8+KrzqvACAnuftQ3MNdv9ljZXS61JYrD+bbP2++97yGEyMg9uwHzZAhB2
	lDZFve5m2NOZaUjzpkijzBN5YIOaJCc3/0n2cAbUMaQ1Zu4VHfTXfCXRoqDJSIrCIWeBIP6s0QHA9
	iX9QKodjbZaSazOwqttvJ/QzMz8M/Pv2buyjxQDaQMvv8rDX7X8v+OOCRt08MvnCftzHP3eASnT40
	5+yG9kPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo7q-0000000A4gd-0txn;
	Tue, 27 May 2025 06:49:26 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJo0n-0000000A3S6-1XjN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:42:10 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b26e120e300so3163846a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 23:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748328128; x=1748932928; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNBSgGt6ntBeP6bJfTxMkVoL1Im4HvH+NsU4r6JbrSA=;
        b=br2oY0wdVCb4uGFzrb8RtByeNwXA5q0v93JCDkpj/NrWkBnrVt/78V2AlnXS03pQJs
         zkzmpqwyyDmPBz4XKGA8Hm12d2/u8pGZ3ZD0J0F2YpfpG28D/GoyE/GOsffbF6XWOs81
         1LfDoc1VYAkNoIbPsG5NNocZOUQVx0B8hSWHcGZ1zI9AJFOYswLfDVCt4xMskT9eJXtd
         lFCxBCeYb5cg7+A99x0tkwD7GT+vc0GtO/u6dxMy9P6O6X9e9z2mcyH/5I+/cuPfMxNR
         a9oRIsX/YcEx/3gsALU0J+/zqNtkghtPJVahncGraM29oldCKnpEm1wUDp3D0pSiApvd
         AmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748328128; x=1748932928;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNBSgGt6ntBeP6bJfTxMkVoL1Im4HvH+NsU4r6JbrSA=;
        b=l13Jnztxv0NyXp7eOSmM2iMaicbzOhI3gWhdW6SR0auQUOXItmfbgqSM9loHAl1vpa
         hAuHeggnhgBbpw1vmH4/oSK5qjgHFy25C4gPbswLi94FQc76KKfZRTbfVYZxcXAI85zZ
         M8RZgvdapILYPJtiBApKEPuI4IesMCN5xDAhUp24Ci852efiET5Nva+LrWBZnQuQmVR4
         IkcCne4eIpo/ZJshZ5GHDoEQxUIAwUqISESuC3XMF7kT1w43l8pKSQcfockFqkfoPYkv
         YQWIIZpCVWbdhBlbWmiF5bUeyXXlB3GRun7ybArOOk56CohyUh5DbYNDbohZRJnmkXXB
         rIAw==
X-Forwarded-Encrypted: i=1; AJvYcCVZUK6I3fxCBdcD+YceQb9YscPx8Oh/NMVf0SZiid6Wz8xyCtD4WrrvvL6wfchgPiuIYQVIgw2qmHP36j6sYYU4@lists.infradead.org
X-Gm-Message-State: AOJu0YzBm73JpnaHQ97knQdJXQ5AtH9R0Vfd+e+33k8sbjypQj/pj5hk
	4YWxQ8ARjWJEFvCN3o6nQWZgk3YmfTtqttItv5w7hV6X6zyGbSfadAeOVVhZNLbFDa+75XIV3ph
	U0ImdiG+YYg==
X-Google-Smtp-Source: AGHT+IFenJln4YVrxzSoeKFPhnKekKykeEQwGp49nReAoUtxshS+gVghFYMEClRpQQkgs64NC+iCtwEFYlZz
X-Received: from pfkq8.prod.google.com ([2002:a05:6a00:848:b0:742:ac1f:7e2f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c707:b0:1f5:8622:5ed5
 with SMTP id adf61e73a8af0-2188c1e875dmr19059538637.3.1748328128059; Mon, 26
 May 2025 23:42:08 -0700 (PDT)
Date: Mon, 26 May 2025 23:41:44 -0700
In-Reply-To: <20250527064153.149939-1-irogers@google.com>
Mime-Version: 1.0
References: <20250527064153.149939-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250527064153.149939-3-irogers@google.com>
Subject: [PATCH v1 02/11] perf session: Add an env pointer for the current perf_env
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_234209_405292_9751966F 
X-CRM114-Status: GOOD (  16.11  )
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

Initialize to `&header.env`. This will later allow the env value to be
changed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/session.c | 3 ++-
 tools/perf/util/session.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index d3888b78ed50..3af518243daf 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -155,6 +155,7 @@ struct perf_session *__perf_session__new(struct perf_data *data,
 			     ordered_events__deliver_event, NULL);
 
 	perf_env__init(&session->header.env);
+	session->env = &session->header.env;
 	if (data) {
 		ret = perf_data__open(data);
 		if (ret < 0)
@@ -2746,5 +2747,5 @@ int perf_session__dsos_hit_all(struct perf_session *session)
 
 struct perf_env *perf_session__env(struct perf_session *session)
 {
-	return &session->header.env;
+	return session->env;
 }
diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
index e7f7464b838f..088868f1004a 100644
--- a/tools/perf/util/session.h
+++ b/tools/perf/util/session.h
@@ -45,6 +45,8 @@ struct perf_session {
 	struct perf_header	header;
 	/** @machines: Machines within the session a host and 0 or more guests. */
 	struct machines		machines;
+	/** @env: The perf_env being worked with, either from a data file or the host's. */
+	struct perf_env		*env;
 	/** @evlist: List of evsels/events of the session. */
 	struct evlist	*evlist;
 	/** @auxtrace: callbacks to allow AUX area data decoding. */
-- 
2.49.0.1151.ga128411c76-goog


