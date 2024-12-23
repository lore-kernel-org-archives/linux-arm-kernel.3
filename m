Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82455E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 07:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUKcIbnN99lIHtLUDXFvETfziUN0/WQJ3KFdqL0Jj4s=; b=Ii/dCR1l+fgPXQIYWraZ75xlzR
	3SQrd+D420sDqmKLMKCC97oc6loSkSBrpapbvKDCUWjANQRrtVhtwNMr3j592uwQNU1Zoq8i3RhZS
	b2nidmV6CpaVauqRriccuv1vNnsZyI7dLeRrbXL0PmeemwaLgAHgro2biHpnBmAIkHgfY3thYC9Gp
	gowj/vTR/RrjKslEmkUU8d5FAOiDIIF8TqYLRD0SHeWfpJTObnH4cloVKIM6Bv8oYv7Mg5SFvDn2H
	Hz6V8bVGd1OwVrxdbgyugK1SS5V4ny3VDPP47VN15pQj62iROzPCA5x+xm5ZWwImRNO2H22IQcTE/
	tVWBUFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPcZ6-00000009UeY-24ib;
	Mon, 23 Dec 2024 07:09:20 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPcO0-00000009TJI-2hQ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 06:57:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4YGpk246Vlz4f3jsy
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 14:57:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 285551A0196
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 14:57:45 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.193])
	by APP4 (Coremail) with SMTP id gCh0CgC33oLoCWlnoBWSFQ--.8658S6;
	Mon, 23 Dec 2024 14:57:44 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: peterz@infradead.org
Cc: mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	tglx@linutronix.de,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	will@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	stephen.smalley.work@gmail.com,
	omosnace@redhat.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	selinux@vger.kernel.org,
	luogengkun@huaweicloud.com
Subject: [PATCH linux-next 2/2] perf: Return EACCESS when need perfmon capability
Date: Mon, 23 Dec 2024 07:06:50 +0000
Message-Id: <20241223070650.2810747-3-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223070650.2810747-1-luogengkun@huaweicloud.com>
References: <20241223070650.2810747-1-luogengkun@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgC33oLoCWlnoBWSFQ--.8658S6
X-Coremail-Antispam: 1UD129KBjvdXoWrZF13ZFy5ur43urW3Jr4UXFb_yoW3trg_u3
	WxJrn2vr1kWF12q3y7Jw1xtr15Ww1rG3WFvrn5G347Cr90gws5A34rJryDtrW7CFs7ursr
	Kw18Wr97Zr1Y9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
	Ja73UjIFyTuYvjTRNrcTDUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_225752_844847_D8013426 
X-CRM114-Status: UNSURE (   9.98  )
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

For perf_allow_kernel and perf_allow_cpu, both return EACCES when require
CAP_PERFMON or CAP_SYS_ADMIN permissions, so update perf_allow_tracepoint
to keep them the same.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 include/linux/perf_event.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 5d2ec4283ebf..c1bc0d7a275b 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1685,7 +1685,7 @@ static inline int perf_allow_cpu(void)
 static inline int perf_allow_tracepoint(void)
 {
 	if (sysctl_perf_event_paranoid > -1 && !perfmon_capable())
-		return -EPERM;
+		return -EACCES;
 
 	return security_perf_event_open(PERF_SECURITY_TRACEPOINT);
 }
-- 
2.34.1


