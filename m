Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61061CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M63oadhbiLEZWn2nFClNFifg5s97W6zysQfmoUQmtJI=; b=uccNr/+SAxgAHBdc4t62S5M5ER
	svza9YwrbToj8HNg/Yz4dJk6KH96xUp5Pjjdcjw+mgcLPzu+Qx1DCdV3eBiQuTmGOD/RXrdlHFByN
	wOzteFM7xCiXeu3gdCFnyz9GSRJ7TWh2Ykfxycd0NHGCHA2uyMzEbBvp0IDHYJ7WAtbRzwriyK2Mq
	aMusl8Qt+fOwQoBwbu/clHifM908oA0ms1uNNINSCoCarnb4CQftjJkBu3P4h39ylegw0XUqcYfOJ
	VamHOpH8sdgbIkiY2ljk6J7aYs650Wnh73SS5uWml2+TSPY4YHxN+yr6/tM4/h8oEaBQYYr/QVrNY
	9U4w9Wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqnz-00000007PbX-3b7r;
	Fri, 01 May 2026 16:33:31 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqnx-00000007Pau-0pbM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=M63oadhbiLEZWn2nFClNFifg5s97W6zysQfmoUQmtJI=; b=RhiPHM1/+eT/nVp9SLJbXEq6IA
	FW9QLY9ll+bzM+bbPexeLmO98fYQIxtsISuBTtmEJN7Mewt9ZpIFMEcvqPE+yplC/+LS3XJpTi7Ce
	Ljs1g9iYvE768FY+Tmhutz+H6HDpKxXZkOjnjOZh4AIsOAuHu08ye4zf1mqnx41CRgYcRVHWNE8et
	gyT7iO7ntoTECkAKE0Yvh/Fnju6bj4sKqjqxh7+RSa46O0Ucr5nx0WHM4iz+07pwOE09Q3WVIHkn5
	+EdT+7+23J/2tdtc2fCptctuMTAGTolvfxJt6e/hFycCaVFl/7dW6eJAK+cJuziKbZJJf2m79Tsh8
	9NZbSYmA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wIqnO-008hv8-0Y;
	Fri, 01 May 2026 16:32:54 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 01 May 2026 09:32:42 -0700
Subject: [PATCH] cpufreq: cppc: discard out-of-range delivered_perf samples
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-cur_freq-fix-v1-1-f84c9a423366@debian.org>
X-B4-Tracking: v=1; b=H4sIAKnV9GkC/yXMQQqDMBAF0KsMf20gCURoriKltMmkjgttJ00Rx
 LuX6vJt3obKKlwRaYPyV6osMyK5jpDG+/xkIxmR4K3vbbDOpKa3ovw2RVaTQ39JxWVng0dHeCk
 XWY9uuJ6u7TFx+vwP7PsPaC+CunAAAAA=
X-Change-ID: 20260501-cur_freq-fix-d569cf1d1052
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Jie Zhan <zhanjie9@hisilicon.com>, 
 Lifeng Zheng <zhenglifeng1@huawei.com>, 
 Pierre Gondois <pierre.gondois@arm.com>, Sumit Gupta <sumitg@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dcostantino@meta.com, pjaroszynski@nvidia.com, Al.Grant@arm.com, 
 linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951; i=leitao@debian.org;
 h=from:subject:message-id; bh=FmjJIxcZFvR9c0k9reaUBJOzOZJq8TZJ0hL8k5OorwM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp9NWx4EhnDPE40uinVf8leUXOkdnI7x97OYB1P
 nsE2jEhh32JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCafTVsQAKCRA1o5Of/Hh3
 bQROD/9wl3/kVjyOb4HzxpnFsylR7KOnoL/UxsOE9Si0157sOGEEVeokfYutxdm54KVwwZEptkM
 6o1rsAice1O42JBahRGuF1MRooc7ZXX4uQ7ao32HfZwScw/V+L8J3CTKm0hWyk3LjPoXUhoXjV4
 UKvjUIgE36yTJLa0QvthcjAFTs55jJ5WZA5EdJXUwIXjibHXxSC1hZLIfz/LQiMzXevbNlVvKcF
 mbt1z2XxR0xApZ3s7mD218nF5Hu73AmpzNAWmkygr+jSIx5pUydv/dSZqcRRiJ/Mah8HU6VmEDi
 aXaewv79g1p++hK7u4XKGqXh+XOASnUpwl8P64czuR8RKTqpDrmgk2Ut8HJ+4Wq0C2d1qJnWFnN
 LVTMW5dJcDk+MbuMqO82PHxnVnRvismFvOVtYhR9HKqewTZjQ5yuPL2UkRyVHPDcuKKWkRPA3N/
 ubic+ncT62GZo+8NYL8Yvp55bqOK+2+jzpM8636RpoXTdEGzf7PWSbLb5eQubjAtsmAw3yeeprq
 2veHDzs5J6nEKS+HgPCNyZN1W6L9Z855+Kc+IkxaejRBYVW/J88NtxjZvEXMAAB2H+54ZBHVybj
 fwDr6VfbuDtABmAHY2PKU29L2E/RMtaCsvkuioU0t+M9i5mzhhx5TCPK8s7PvBIEwN5mXMo6Gjw
 v6iY3n+h0YquYHQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_093329_250579_661AC71A 
X-CRM114-Status: UNSURE (   9.80  )
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

cppc_cpufreq_get_rate() derives delivered_perf as:

    delivered_perf = reference_perf * delta_delivered / delta_reference

over a short udelay()-bounded window between two cppc_get_perf_ctrs()
calls. Per-read latency jitter on the underlying CPC register access
can skew the ratio, occasionally producing delivered_perf >
highest_perf. cppc_perf_to_khz() then linearly extrapolates above
(nominal_perf, nominal_freq), so the value reported via
/sys/.../cpufreq/cpuinfo_cur_freq exceeds cpuinfo_max_freq.

Observed on an arm64 host (governor=performance,
cpuinfo_max_freq=3339 MHz): 15 back-to-back reads returned values
between 2997 and 4230 MHz.

Treat an out-of-range sample as invalid and reuse the existing
out_invalid_counters fallback, which returns the platform's
desired_perf. This keeps cpuinfo_cur_freq within
[0, cpuinfo_max_freq] without reporting a value the hardware did
not deliver.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/cpufreq/cppc_cpufreq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 7e7f9dfb7a24c..dd92aa2bca464 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -814,6 +814,14 @@ static unsigned int cppc_cpufreq_get_rate(unsigned int cpu)
 	if (!delivered_perf)
 		goto out_invalid_counters;
 
+	/*
+	 * Sampling jitter on the CPC counter pair can produce
+	 * delivered_perf > highest_perf, which cppc_perf_to_khz() would
+	 * extrapolate to a frequency above cpuinfo_max_freq. Discard.
+	 */
+	if (delivered_perf > cpu_data->perf_caps.highest_perf)
+		goto out_invalid_counters;
+
 	return cppc_perf_to_khz(&cpu_data->perf_caps, delivered_perf);
 
 out_invalid_counters:

---
base-commit: 26fd6bff2c050196005312d1d306889220952a99
change-id: 20260501-cur_freq-fix-d569cf1d1052

Best regards,
--  
Breno Leitao <leitao@debian.org>


