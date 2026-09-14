Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01018C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=; b=WMxEqmpXJLRwUrpyTRdbDkXSiV
	TFv89iD/FkiYi6LVuEcJrQE4uyUo5NBxJlzB4dVlor6gcjdmmu4JzGfAq01wQORYVo7hGOBEG1Rnj
	3SCQvfY9Cf5JuUQgq7TYMONzTad/ctlvoZrYraLVO/iTvJrzrdOqZSDpc1WRl6aFaCn8FLLUjX6dn
	DVXUcUJkKqV5mE8WbFHVRb49b1N0EwCH7mpwScLR1WTsQYOwFOC6xrxKotGsw8qb80GEamwFk/sGY
	8Pi8sa1NUZi8AiTp1XGUs3/cikrN0H2LVl/scN7ExPxcV7XTQWZgFR99TcI/gqihVtXswGNvzAM/6
	2YFnab1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63Am-00000002zQT-2vTN;
	Mon, 14 Sep 2026 09:40:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63Ai-00000002zNS-3DmO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:40:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jEt53842265
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=; b=cmH3qdeL6w9I3sMo
	RCAdIaxkDYxiLcjHsi1Y4f56PpegsPvEhDicbwJ0ASSp9GIdYYflnzWCpxAGx/YL
	KY5AI6cymNIalqfamOYsVv/sdYbaFBYjDLj5v7B+WYo6yRFMbstrG6DKBO1cnHdh
	NoA+WUvvpxxxWWe9Z6Wg0ytK5OvjlH0b6kp2Vq+YCK9y8hqjCIOQq23x0O19/bft
	1W/rswoXtbjHKkuC4yVL8xDvE13IXeL30b9fWlkW1jM/6+T80F0qMQf0MyfBlg0Y
	TGw0adx3XccJoqD8yUcE09X7Fx78BgWwO2KQwLx8BmSTwU/eRRe1XqZ5axD/Zq6x
	470hfQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5yyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso3795584a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378818; x=1789983618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=;
        b=HmKnfOEUYKgYSvIHiqE2HOx6MqGahGqJ4K2fiH/04ePndJ1VeAKNE55Xd0x8Xjs9FS
         BjsMc2znU3YDrfJlP4OINLOcmcfOE/LkF2aLDonXhD41kpVQEZUVnZMIbCd33bO0y+LO
         iJOeXSrjCwKqZ2XFN6g2yEvFKi4ducAR+J4JdJ66v+6LhxpiUAQrpm19rj2dXKS/OsgV
         Zs4jnTK+YYv2YKVMr3cz5aBg4S5NDms941fCRmR1eBtsfwlXnRiEyx+lbZsAItj6FrB9
         1BfIAE8Pcvy3iJ+Vjesor0JGOaVMSwWgosTZDUyjLbqevZdyMejE/0mh5/kxQZNjUTuf
         exnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378818; x=1789983618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=;
        b=eOqVVTPPqckoYS+CsGZYZQ1yqFyW7PBUGm27kBue9ZzZYM4OSFgOK8Rdl8BUwUGPpp
         53iv9Qz/R8g903kCWYHpADS5aVGzGc+NZlebBAb6ffY/e7xV+17dZmi0qmFoSOB92Nu4
         r1JNsnVaBbHy05tBPo0QnkK73rtWCKmVI1kqRB2VnJsyYJMGx1N3HaYoHd4WHr+aWFOx
         s7el7PyZ0E/KvJyEPgEP2u2xQSKDN6dUj3rZwT54w3hU4U13qij4rnTpREvHWjXU83qS
         6swikVM9X4YiX10jP92r6RL0y3Qm8Wt9ro+5R/QeaAV12+SvXUfxz55srfED1uPZCXnW
         0Btw==
X-Forwarded-Encrypted: i=1; AKwUvBwBaJDba+BDGzPAbAQhWtYkxcDBT/LqxEdrpdBf9aiaFcnf4pdUgNiuBl5lpxViCtCkJMA0bna8LDPhD++VdpCn@lists.infradead.org
X-Gm-Message-State: AFuF++ncmX1As7uwR1paRgTD4OasjVk2iMHB2alfnuLAA4S92Ou1iOmP
	76hix62m06O5cm6BGz3GUXOG9j4/UyZvyGPLa8/uuIzM7Ck4eWtFWRtfuom9NkYQFQ4+4gOLxF+
	jn0VnMrRxZTGCioKgzJ4LQ4TeZuNwiIlpdtVTOg9UwxH5SWq7lEsiJ1OHhedzKxvYBequURZJht
	oeMg==
X-Gm-Gg: AYBFou3wIJGxvS9uO6mtmH4jnCi5WfkhqurJ48DFlL5O577EkLWnHQgcutCZ8gp8LI+
	/pApNmV14EraDzlagFC+FHdk1TmoiaNTcCFlMo/AB5fVD2JVCfiKircLPlFUntvMIU7z3lchuUn
	AxAw33pRgkK6hySd2E9JqCFxvAT9a5dAugVLBKfxmXZpm7ZrApHOp261XQkuwW9ko0M0+wtk9Zs
	ktWdISND0slB3dJHzAvvsyv3ns9GtkLsxTdwjftFep+dUqm3LndmgfCbrUy+qwsOXG10oYMSSxd
	syARkqOknajFdIQRfR7eqsrUT436R7/LuwehCeyza11UmBFwpxeiqG2cFRFs5FMJmblKWEM0/PR
	1ve3x+CAf9aGzDxkzD3cX/u3ZKZRa5tD9M7nKNiYTI37l2C9iayYxLGqY
X-Received: by 2002:a17:90b:3ec8:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39df351afb2mr1213618a91.13.1789378818341;
        Mon, 14 Sep 2026 02:40:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec8:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39df351afb2mr1213553a91.13.1789378817677;
        Mon, 14 Sep 2026 02:40:17 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:17 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:53 +0800
Subject: [PATCH RFC v2 05/10] arm_mpam: Add device tree support for MSC
 probing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-5-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378763; l=10822;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=BcWl24kUBo4jlXFvaZjSoBg9s5oXMsoQB5GA5ArXSw0=;
 b=GfZGzJQQgYFsRrmmOz4w7923BaTZu6EWN2viQbE8Y3Xh0muuEF6CpzkAtZhGx2BqBUeVOX4OG
 ap35yV4OwNpA7JF01hap0OV7PxEW1WbzmEpoeEaS5MXY5p3rs+zAht6
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 0EZWvaQGDjexdzmI1Rz7CbjXtMVJWbsN
X-Proofpoint-GUID: 0EZWvaQGDjexdzmI1Rz7CbjXtMVJWbsN
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c103 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-Bf8dWPtDk6FBw2lJ3EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX5R5Pi9yB/xjG
 4BFwpE6MhglPlHRgmMqtOSj0QiSQLs1HiL7sQkTSjxeKZlvbmIeQm7qVm6bUrx98/kiTtWDN37L
 Rb/2Nvdquj4cMdvl8tK8iKIn78AY7Mbf4lEDeut37tVhgmrAEFkHd/R8601TUb4MEFwzha1kLKZ
 MUp1DNFSt8OvmdbIvoow1fTrHi2alFxLI7LBCtutrONJZfN8IyDzQvmRhLQsV/ZbhHxZiFVjf3H
 w2U+p8KyCbXKP4/YMq6MEfo+qnmRD9b0ItQZdRFed7vPHcDM6yhXUqcB9pFu9Ef66z6xqY7pahO
 85KiluHK+CzgczRPGsbAWSd+2EL9KbgsjblKTVXO6RlEThIIv4qYRoc2M675UqyTUiBkzBZuPMW
 xADR8HN1Ve/EurSi2BTj/Z0akr2zSAlPywlRhu3hmfb2T+5TbUYCI9fl6WzKLR0sbLvJmwdENkn
 eFHhATDQVuzp3CPHzfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX1KMXONq5SL/9
 VOJ+lN2MEV+e3CR6qA3OwGdVv15vetUpQeLU9PgR6o2uSeOc1JX5XiwZe9PFBKZ/7dWUqf9HG+F
 T/OVT9+N2T7kjE2S89k9+TtSaKXLgLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_024021_326513_FD427C4B 
X-CRM114-Status: GOOD (  29.26  )
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

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context conflicts; drop the ACPI-only stub of
  mpam_get_cpumask_from_cache_id(); use of_node_get() for the cache
  parent to avoid a refcount underflow; reject out-of-range ris_idx
  after of_property_read_reg() before narrowing to u8; use u32 instead
  of unsigned long for cache-id values and compare against ~0U ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 256 +++++++++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |   2 +-
 2 files changed, 240 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c68135ee0ffc..7a5b27e87759 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -20,6 +20,9 @@
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/srcu.h>
@@ -161,6 +164,171 @@ static void mpam_free_garbage(void)
 	}
 }
 
+/* Called recursively to walk the list of caches from a particular CPU */
+static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
+					     u32 cache_id,
+					     u32 cache_level,
+					     cpumask_t *affinity)
+{
+	int err;
+	u32 iter_level;
+	u32 iter_cache_id;
+	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
+
+	if (!iter_node)
+		return;
+
+	err = of_property_read_u32(iter_node, "cache-level", &iter_level);
+	if (err)
+		return;
+
+	/*
+	 * get_cpu_cacheinfo_id() isn't ready until sometime
+	 * during device_initcall(). Use cache_of_calculate_id().
+	 */
+	iter_cache_id = cache_of_calculate_id(iter_node);
+	if (iter_cache_id == ~0U)
+		return;
+
+	if (iter_level == cache_level && iter_cache_id == cache_id)
+		cpumask_set_cpu(cpu, affinity);
+
+	if (iter_level < cache_level)
+		__mpam_get_cpumask_from_cache_id(cpu, iter_node, cache_id,
+						 cache_level, affinity);
+}
+
+/*
+ * The cacheinfo structures are only populated when CPUs are online.
+ * This helper walks the device tree to include offline CPUs too.
+ */
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
+				   cpumask_t *affinity)
+{
+	int cpu;
+
+	if (!acpi_disabled)
+		return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
+		if (!cpu_node) {
+			pr_err("Failed to find cpu%d device node\n", cpu);
+			return -ENOENT;
+		}
+
+		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
+						 cache_level, affinity);
+	}
+
+	return 0;
+}
+
+static int get_cpumask_from_cache(struct device_node *cache,
+				  cpumask_t *affinity)
+{
+	int err;
+	u32 cache_level;
+	u32 cache_id;
+
+	err = of_property_read_u32(cache, "cache-level", &cache_level);
+	if (err) {
+		pr_err("Failed to read cache-level from cache node\n");
+		return -ENOENT;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
+		pr_err("Failed to calculate cache-id from cache node\n");
+		return -ENOENT;
+	}
+
+	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+}
+
+static int mpam_dt_count_msc(void)
+{
+	int count = 0;
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "arm,mpam-msc") {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
+static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
+				  u8 ris_idx)
+{
+	int err = 0;
+	u32 level = 0;
+	u32 cache_id;
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+
+	if (of_device_is_compatible(np, "arm,mpam-cache")) {
+		cache = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!cache) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+	} else if (of_device_is_compatible(parent, "cache")) {
+		cache = of_node_get(parent);
+	} else {
+		/* For now, only caches are supported */
+		cache = NULL;
+		return err;
+	}
+
+	err = of_property_read_u32(cache, "cache-level", &level);
+	if (err) {
+		dev_err_once(dev, "Failed to read cache-level\n");
+		return err;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
+		dev_err_once(dev, "Failed to calculate cache-id\n");
+		return -ENOENT;
+	}
+
+	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+}
+
+static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
+{
+	u64 ris_idx = 0;
+	int err, num_ris = 0;
+	struct device_node *np;
+
+	np = msc->pdev->dev.of_node;
+	for_each_available_child_of_node_scoped(np, iter) {
+		err = of_property_read_reg(iter, 0, &ris_idx, NULL);
+		if (!err) {
+			/*
+			 * ris_idx is read as u64 but indexes a 4-bit RIS selector
+			 * (0..MPAM_MSC_MAX_NUM_RIS). Reject out-of-range values here,
+			 * before it is narrowed to u8, so a large value cannot be
+			 * truncated into a valid-looking index.
+			 */
+			if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
+				return -EINVAL;
+			num_ris++;
+			err = mpam_dt_parse_resource(msc, iter, ris_idx);
+			if (err)
+				return err;
+		}
+	}
+
+	if (!num_ris)
+		err = mpam_dt_parse_resource(msc, np, 0);
+
+	return err;
+}
+
 /*
  * Once mpam is enabled, new requestors cannot further reduce the available
  * partid. Assert that the size is fixed, and new requestors will be turned
@@ -481,16 +649,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
 	return mpam_vmsc_alloc(comp, msc);
 }
 
-/*
- * The cacheinfo structures are only populated when CPUs are online.
- * This helper walks the acpi tables to include offline CPUs too.
- */
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
-				   cpumask_t *affinity)
-{
-	return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
-}
-
 /*
  * cpumask_of_node() only knows about online CPUs. This can't tell us whether
  * a class is represented on all possible CPUs.
@@ -1987,15 +2145,34 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
-	err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
-				       &affinity_id);
-	if (err)
+	if (!acpi_disabled) {
+		err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
+					       &affinity_id);
+		if (err)
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+		else
+			acpi_pptt_get_cpus_from_container(affinity_id,
+							  &msc->accessibility);
+
+		return;
+	}
+
+	/* Where an MSC can be accessed from depends on the path to of_node. */
+	parent = of_get_parent(msc->pdev->dev.of_node);
+	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	else
-		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
+	} else {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else
+			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
+	}
+	of_node_put(parent);
 }
 
 /*
@@ -2123,7 +2300,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 		return PTR_ERR(msc);
 
 	/* Create RIS entries described by firmware */
-	err = acpi_mpam_parse_resources(msc, plat_data);
+	if (!acpi_disabled)
+		err = acpi_mpam_parse_resources(msc, plat_data);
+	else
+		err = mpam_dt_parse_resources(msc, plat_data);
 	if (err) {
 		mpam_msc_drv_remove(pdev);
 		return err;
@@ -2136,15 +2316,51 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mpam_of_match[] = {
+	{ .compatible = "arm,mpam-msc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpam_of_match);
+
 static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.of_match_table = of_match_ptr(mpam_of_match),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
 };
 
+/*
+ * MSCs that are declared by the firmware as being part of a cache may not
+ * be created automatically as platform devices, since there is no
+ * dedicated cache driver.
+ *
+ * Deal with theo MSCs here.
+ */
+static void mpam_dt_create_foundling_msc(void)
+{
+	struct platform_device *pdev;
+	struct device_node *cache;
+
+	for_each_compatible_node(cache, NULL, "cache") {
+		struct device_node *cache_device;
+
+		if (of_node_check_flag(cache, OF_POPULATED))
+			continue;
+
+		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
+		if (!cache_device)
+			continue;
+		of_node_put(cache_device);
+
+		pdev = of_platform_device_create(cache, "cache", NULL);
+		if (!pdev)
+			pr_err_once("Failed to create MSC devices under caches\n");
+	}
+}
+
 /* Any of these features mean the BWA_WD field is valid. */
 static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
 {
@@ -2963,12 +3179,18 @@ static int __init mpam_msc_driver_init(void)
 
 	init_srcu_struct(&mpam_srcu);
 
-	fw_num_msc = acpi_mpam_count_msc();
+	if (!acpi_disabled)
+		fw_num_msc = acpi_mpam_count_msc();
+	else
+		fw_num_msc = mpam_dt_count_msc();
 	if (fw_num_msc <= 0) {
 		pr_err("No MSC devices found in firmware\n");
 		return -EINVAL;
 	}
 
+	if (acpi_disabled)
+		mpam_dt_create_foundling_msc();
+
 	return platform_driver_register(&mpam_msc_driver);
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..aa45d00bcd07 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -470,7 +470,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
 void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
 #ifdef CONFIG_RESCTRL_FS

-- 
2.34.1


