Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A44C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5YIpf9m5hfwTorgx3C2qm6+4AOfhEwaO7Idy9G6o4As=; b=Mb7tkZahUTf6BAdWv4hzxzMQD9
	yovc1kKIUZt9CBRAwmT3ecTHGfTTU2FHyFbMlSV08/PmUmV7KGTUe9D3jsbFvIlqYA2IMu/h5UcVl
	Qoab3QwheZKAqpv5fM2JA8ixZU1NOaF3fQyxNBNz53GaHekVYLhMZZqX5U1a3QVyWrfAsaXGkJu/i
	4hQFobXMSFvgn/QzhyPq1HFO6PmQLq9MPfmzU5ZLc16Oq6ATv1PuDuYQU6wFfTLhw69xpvxlv1yr1
	ZhqMh1sgHYeUsA8zcL/hdONYIS1l06eBHyji51VcIzaQYKpF3GUqw7i/oTtr8kxpcT6KPa8MbM9hg
	EY7JaNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4TQ3-0000000DAtV-0c6b;
	Thu, 10 Sep 2026 01:17:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4TQ1-0000000DAtO-1TVF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 01:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=5YIpf9m5hfwTorgx3C2qm6+4AOfhEwaO7Idy9G6o4As=; b=dIA5oGPCR/eKTMqJXg+SaxTboA
	xrkngYJM0Pj16cDOM2vdPi0xGUsBSaP1z82kki4Bk/5rfprMcRoAHaveNYSl15UBu0RfkLoZV5DDa
	goLdtn6WJAn74HUBW8DXjflYMxnRLYJ53aQFtbC5G7p64EniCeB9j6yHqcoi/yrHNlVxU4EVSuaG0
	Spde95k1eTTc8Y0Stf6tyheLjTxnJO68hZoCu9OaWs/Tz1R1E5M5rsK22H1dYrCpXfpca7vb1FTmj
	H+KdTtnTgAS6Zw2n65G1vLcNjDFryHrJmNc7YjptqZ+GJkZh5d2clGAZYhgsKzSQiZI7NrQbNpYRB
	v4i6iT5A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4TPx-00000001rmc-2bRy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:17:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9XhL2050718
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5YIpf9m5hfwTorgx3C2qm6
	+4AOfhEwaO7Idy9G6o4As=; b=A8S/FRMRheN1QYxHxR6rMUh+6QVrQ+IyfVNia7
	q7ebTRgtaafVQiMioMr9I+YWnHCv/gliA9iamShEsvjlUpgMRVJUjAqo8wtwHy3Q
	QzDEmyVlPlNC8g95vR54cXlJlF7sBm52mJft66vRmskw80q0azucwJH/kNTu99P5
	aYdtYLwsGoUWgBwsBZTGQR+Li2bUTdP7ezyUQx9I8XJkNqKPouUJfGpnVXqFXKs8
	+xzTl9nK7A0WPg9hwJHxET1o3BltIWWHzls6JjwC3q4Ar8t+YSSy+47Yi5Gsqdjs
	g2Bgl3ZVB6e9o3gqAg/hzOiP0igzDhy+E97qQ3AEYhI+XlPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg1dr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 01:17:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so12300567a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789003043; x=1789607843; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YIpf9m5hfwTorgx3C2qm6+4AOfhEwaO7Idy9G6o4As=;
        b=I3mMvEoyGWc4E4Hfr5dwp8PwggTFYsucn69erPrIX3wXLuONbgIACjbI4n5kC3jVg+
         1yuu1siQUHR42xyqVP4GrxVki+0V9PuaWRUBsydwuySTkoFlQUMNKKaUqeU5cgoRNOeN
         zkBu00fNqVHYjR+8P4Z/I1hynybdzVR592vQYfpaVws7Kl17oJYv3ko/boENgF+ipOFh
         HXlfdoxK7SKb4U1BdZi1JaLI+ZsjuK/oI8NWduaJnbCzLzdYAxZT96tyAm80CybtRnv6
         9xFiw4E+jWpSC83t6K6x1hLuLIvKTCH43NNqV7xo0OZrbfig5GrSaiRanFD9zKpU076Z
         u0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003043; x=1789607843;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5YIpf9m5hfwTorgx3C2qm6+4AOfhEwaO7Idy9G6o4As=;
        b=faYXn6c65oN695HLiFBOvVXTCvUGxUC5CMU9LnWXJZfZpvm6F1gIUcm5HhEhbil0uz
         Vko1TSvswAsWfdQvkZq3U8PB6F6CCaPctIlhr6UEZeWZoaAuPw/ON7lk17eYqmq5cdho
         CNuvO9+xdjRc1QBhUnAPaqNEPlA4T4kOI7TKmcQF4YAmQrlMx53RbiE2SOyiP5FvwoXS
         Vfe8ZOwhmyW9KfLpJ2qWzwItz8tZs+yqNJkar/XpOsFxLCxtO88bRTP5kR85iatSUYXN
         JfzyMnkJL7eSH1q/U/TTfF9KXos9nAKP/TI5tslAQhXLI+sk+6N9kzdO10QO3zdkBT7m
         kX2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVFY56EkdqCDWsEISckJcqo5FeWFo7wDLtC/PKHfyqAG3zpZNp2bN2mXjEhAVfZYfnGFEquZSO5XNzNHmWSsyN@lists.infradead.org
X-Gm-Message-State: AFuF++m5uHC8XOLmegROxCbLuaA87IFYhZsbYqS91PL61zj8F8xqxnIP
	lpkW1WQK930liMe0wDLLnsqArMUC3+rCZggON1GFfij+kTmbTt6jFR5jUNrCuKm94/NevX6bgsQ
	Fff/RB8MdPLLXnm8/c7EZZy05TB+zGS8tjFKZ+bBxbzL6bgLade3uf3zVEgb4x85/zBpft5nplk
	GWpw==
X-Gm-Gg: AYBFou3nTaJRfoX6jq8SVO1xcQGpPcINfn8fSpQ23MF97DYPZYThYiSak3xKEjFN6wk
	fAWRnEBggrXypnQPz4A5tLxKutGLiivMHwNjesVEoLoBa3+S8FZgVV4lz4nHzfcDXqahKqLLy0U
	w3aNtF9ZjvKlOM0NseV2d3PAuHiIewH5xHJ9D5ch+bYy675WKpPgGcLdfJxhCE8D2iw2TKENsyZ
	3GJAfpYi3ydTrpWy4WX39dvyEFJ3kRBKbC7JZC9IKivRJ/zMh4OE+KfL/cob/BNPpJVsMAoszRl
	khbtkWdw1l1mKzN5SNx+KxN4Ym/1K86df9C4u+LZHnk+6WhT1GqlhHOJXK7w/vXqhbzFpQkcfPD
	lA5tQ340kduxIJVf5EZzYFRMGK1StxGU1hjm61lvmC9P6DYraxaOsUmWt1jmmmBL4iw==
X-Received: by 2002:a17:90a:750:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39b92bbac84mr13637094a91.22.1789003042998;
        Wed, 09 Sep 2026 18:17:22 -0700 (PDT)
X-Received: by 2002:a17:90a:750:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39b92bbac84mr13637047a91.22.1789003042364;
        Wed, 09 Sep 2026 18:17:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e8ad192sm874878a91.14.2026.09.09.18.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:17:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:17:05 +0800
Subject: [PATCH v2] coresight: Fix clock refcount imbalance on platform
 probe failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fix-clk-issue-v2-1-fda3dd324c0b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABEFomoC/3WMwQ6CMBBEf4Xs2SVtsSCe/A/DAetWNgLVrhAN4
 d+t3L1M8iYzbwGhyCRwzBaINLNwGBOYXQaua8cbIV8Tg1GmVLWq0PMbXX9HFpkIraZ94WxRGKs
 gfR6R0mDznZvEHcsrxM+mn/Wv/WeaNWokTwftW3Mp6+oURPLn1PYuDEOeApp1Xb+2gHensQAAA
 A==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789003037; l=9906;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Jv1R1iFahp7XDd9HEcepxNUUEt6E+sEodfeyW29HPO4=;
 b=aVSaf/GOMmddOEIltGhyIIibwVJF80OZSO6eIMaS+rxK74aRRP6VFoNRSHYeuXRHKg4KZ0Dxx
 K0M4j943jSQBdHGax209rTSO+UsNDDzXHg+oOtDVT4JhQi+rVLredTb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa20526 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=_kMt-Xqyp7RSBKumsnwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Wsa6h2Is4KjsDLR81De3dJf8BFCfdebe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxMiBTYWx0ZWRfXyQZ51wKRlp1q
 peM3sf9/2Tcz9u2euY8DaNm3cKHbMcmfZpK8MQ27Cxgn3Lzt+b13pYUzSEGL0TmDqmMjGUIev4n
 eSk+/w7zqLpa8IYmHdiCtJ+m3DDern9X4FTIcR08dL7jTM664kC9WDzHh0XOJYh5yC1X9FtVo1y
 kKqUsvIDMPtho64qvCE6HO/nRuxR8DSukfx/qxX2Q2hNQUOYgThx7Tlwh1hMiWn7XjPaxEfbSTr
 C4ij8EvsHZjyZhW3rlml8+1b0eWtv1aVB+h8Pjue2+eeFcN9hl2gUQtF9B7WYFv5u36Nid80Irf
 SNRrsJcXwBBfwMstWnT09IC+zJPkr8F+wQ0RG0ripsGoWRWNPp9kXZ5awzcJujYBWfV6w4SvHEn
 r3BEygO5TNbkSRSMUyFhXyZijB3vKUwpxexLj2ZWS+D6MRTFqg25YVeFYR2ZXnR3S2PwkjeQs7y
 bDR+THjGC+kaX8J9P+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxMiBTYWx0ZWRfX+dNlz9uxxWOu
 HzjK/OTSXOohbpwWmfVFDQ2u9f0pGDYPQ9+htQUrn2UaheyXIRVv7aereGBCXrkbv03IbgBnfA4
 YwRoDxLiMSVA2vvgqknHKvyBUYuUZgw=
X-Proofpoint-ORIG-GUID: Wsa6h2Is4KjsDLR81De3dJf8BFCfdebe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021734_177815_B81EDD05 
X-CRM114-Status: GOOD (  18.99  )
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

Each CoreSight platform_driver's probe() enables its clocks via
coresight_get_enable_clocks() -> devm_clk_get_optional_enabled(), which
registers a devm cleanup to run clk_disable_unprepare() on driver
detach. The probe wrapper then unconditionally calls pm_runtime_put()
regardless of whether the inner probe succeeded, so on failure this
also fires runtime_suspend() and disables the same clocks a first
time. The driver core then unwinds the failed probe and runs the devm
cleanup, disabling them a second time and underflowing the refcount:

  coresight-etm4x etm0: probe with driver coresight-etm4x failed with error -22
  ------------[ cut here ]------------
  qdss_clk already disabled
  WARNING: CPU: 1 PID: 432 at drivers/clk/clk.c:1188 clk_core_disable+0x1d0/0x218
  ...
  ------------[ cut here ]------------
  Unpreparing enabled qdss_clk
  WARNING: CPU: 0 PID: 432 at drivers/clk/clk.c:1061 clk_core_unprepare+0x248/0x268
  ...

qdss_clk is shared by every CoreSight node, so the extra disable drives
its refcount to 0 while sibling devices still expect it enabled. The
next funnel to probe then touches unclocked hardware and panics:

  SError Interrupt on CPU1, code 0x00000000be000000 -- SError
  Kernel panic - not syncing: Asynchronous SError Interrupt
  ...
   coresight_clear_self_claim_tag+0x7c/0x1e0 [coresight] (P)
   funnel_probe+0x114/0x2e0 [coresight_funnel]
   dynamic_funnel_probe+0x24/0x70 [coresight_funnel]

On the failure path, disable runtime PM before releasing the usage
reference: call pm_runtime_disable() first so no further
runtime_suspend() can be scheduled, then pm_runtime_set_suspended() to
explicitly record the suspended state, and finally
pm_runtime_put_noidle() to drop the reference without invoking
runtime_suspend(), leaving the devm cleanup as the sole disabler of
the clocks.

Affects catu, ctcu, etm4x, funnel, replicator, stm, tmc, tpiu and tnoc,
all of which share this probe skeleton.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- update the workflow regarding to Leo's suggestion.
- Link to v1: https://lore.kernel.org/r/20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-catu.c       | 10 +++++++---
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 10 +++++++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 +++++++----
 drivers/hwtracing/coresight/coresight-funnel.c     | 10 +++++++---
 drivers/hwtracing/coresight/coresight-replicator.c | 10 +++++++---
 drivers/hwtracing/coresight/coresight-stm.c        | 10 +++++++---
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 10 +++++++---
 drivers/hwtracing/coresight/coresight-tnoc.c       | 10 +++++++---
 drivers/hwtracing/coresight/coresight-tpiu.c       | 10 +++++++---
 9 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..4e2687e61c9a 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -632,11 +632,15 @@ static int catu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __catu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void catu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..5827b6d5844f 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -251,11 +251,15 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = ctcu_probe(pdev);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void ctcu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..48050f86ead5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2330,12 +2330,15 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = etm4_probe(&pdev->dev);
+	if (ret) {
+		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
 	pm_runtime_put(&pdev->dev);
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
-
-	return ret;
+	return 0;
 }
 
 static int etm4_probe_cpu(unsigned int cpu)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..264964a340ec 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -319,11 +319,15 @@ static int funnel_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = funnel_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void funnel_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..93274ab0cfaa 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -298,11 +298,15 @@ static int replicator_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = replicator_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void replicator_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..88726274ebeb 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1011,11 +1011,15 @@ static int stm_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __stm_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void stm_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..c4fe2dde5bf8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -974,11 +974,15 @@ static int tmc_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tmc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tmc_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..4479d93f352b 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -288,11 +288,15 @@ static int itnoc_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = _tnoc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void itnoc_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..3166ed6bc224 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -271,11 +271,15 @@ static int tpiu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tpiu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
 		pm_runtime_disable(&pdev->dev);
+		pm_runtime_set_suspended(&pdev->dev);
+		pm_runtime_put_noidle(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tpiu_platform_remove(struct platform_device *pdev)

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-fix-clk-issue-51e43c533250

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


