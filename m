Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61286D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 03:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsqQ6IwM/SUcKOB6IOo5ZP0W1mzKw9Uqzqixynmdc9s=; b=D6XgKoqw4X8e20HvrG8fGXB+0L
	O/hNAaN7qqrePoLP6SzahWHaBGS1hmT9wmbojD4d87jQNigZls3dIiKU7UCx9jts+Fgmpjn0uTCOL
	oJJf43kb+7uE87aKdNs1IfgmZYHRWMcLgQtDpktLggJZW6NEgiE/NYiYCvpeE2XuxHMAr+lKlL5J9
	khlOF9P0Ef0abii9HJ+MwnBPPH+sg4j4rpm7SvH0GuwbZ5sSTzKmRkAKrCd5xxaZukCl6FFbtlOKX
	mPl4NfY/ME7V4daqohBS8YJi37wniz4WTtredYAR+b7SHFrnjTIGmBWVk7a9pl7+kZ+x2NGaCupgP
	c2AJz10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQGkV-00000004kL0-3HBp;
	Tue, 02 Dec 2025 03:08:19 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQGkT-00000004kKW-2MxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 03:08:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WsqQ6IwM/SUcKOB6IOo5ZP0W1mzKw9Uqzqixynmdc9s=;
	b=kyrTHpqmSUGXYG66aPwDt1d1QxdWz+4xLKOuSqrSI+us04cNxWk/b6+xqL6PXVrWZxyNZ2f0a
	FwjgDYxVYrjNZWsRiRTPThg9+4XBmRpMCbgtM7cpa4NdBkrBd4Og8xriX9hVWj4URg1hKG3Upyx
	O29T8MgLlTNLFIa+Dz5VhI8=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dL5JT0nbZz1K9Br;
	Tue,  2 Dec 2025 11:06:17 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id D4433180043;
	Tue,  2 Dec 2025 11:08:06 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 2 Dec
 2025 11:08:05 +0800
Message-ID: <246a9483-850c-4c06-ac48-d03e0ae0bcec@huawei.com>
Date: Tue, 2 Dec 2025 11:08:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] arm64: topology: Handle AMU FIE setup on CPU
 hotplug
To: Beata Michalska <beata.michalska@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>, <sudeep.holla@arm.com>,
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>, <ionela.voinescu@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<vincent.guittot@linaro.org>, <zhanjie9@hisilicon.com>,
	<lihuisong@huawei.com>, <yubowen8@huawei.com>, <zhangpengjie2@huawei.com>,
	<wangzhi12@huawei.com>, <linhongye@h-partners.com>
References: <20251119081356.2495290-1-zhenglifeng1@huawei.com>
 <aS2z0EURwHbbGZab@arm.com> <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_190817_928996_84B9C6E6 
X-CRM114-Status: GOOD (  14.66  )
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

On 2025/12/2 11:05, zhenglifeng (A) wrote:
> On 2025/12/1 23:27, Beata Michalska wrote:
>> Hi,
>>
>> Apologies for the delay in reviewing this - currently in progress....
>> Out of curiosity: what's the cpufreq driver used for testing this series ?
> 
> I used cppc_cpufreq for testing this. But with some modifications in
> processor_driver.c, or you'll find that the driver will fail to load with
> maxcpus set. The modification below is only a temporary solution. I'm still
> working on that.

In addition, I exposed some sysfs interfaces for easily checking freq scale
and source as below when testing. Hope this helps.

---
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 331a0654f3dc..ba15c90cf908 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -98,6 +98,23 @@ void topology_set_scale_freq_source(struct scale_freq_data *data,
 }
 EXPORT_SYMBOL_GPL(topology_set_scale_freq_source);
 
+int topology_get_scale_freq_source(int cpu)
+{
+	struct scale_freq_data *sfd;
+	int scale_freq_source;
+
+	rcu_read_lock();
+
+	sfd = rcu_dereference(*per_cpu_ptr(&sft_data, cpu));
+	if (sfd)
+		scale_freq_source = sfd->source;
+
+	rcu_read_unlock();
+
+	return scale_freq_source;
+}
+EXPORT_SYMBOL_GPL(topology_get_scale_freq_source);
+
 void topology_clear_scale_freq_source(enum scale_freq_source source,
 				      const struct cpumask *cpus)
 {
diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index c890e2a5b428..79c0dc8d5361 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/hardirq.h>
 #include <linux/topology.h>
+#include <linux/arch_topology.h>
 
 #define define_id_show_func(name, fmt)					\
 static ssize_t name##_show(struct device *dev,				\
@@ -226,7 +227,27 @@ static ssize_t cpu_capacity_show(struct device *dev,
 	return sysfs_emit(buf, "%lu\n", topology_get_cpu_scale(cpu->dev.id));
 }
 
+static ssize_t arch_freq_scale_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+
+	return sysfs_emit(buf, "%lu\n", topology_get_freq_scale(cpu->dev.id));
+}
+
+static ssize_t scale_freq_source_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+
+	return sysfs_emit(buf, "%d\n", topology_get_scale_freq_source(cpu->dev.id));
+}
+
 static DEVICE_ATTR_RO(cpu_capacity);
+static DEVICE_ATTR_RO(arch_freq_scale);
+static DEVICE_ATTR_RO(scale_freq_source);
 
 static int cpu_capacity_sysctl_add(unsigned int cpu)
 {
@@ -236,6 +257,8 @@ static int cpu_capacity_sysctl_add(unsigned int cpu)
 		return -ENOENT;
 
 	device_create_file(cpu_dev, &dev_attr_cpu_capacity);
+	device_create_file(cpu_dev, &dev_attr_arch_freq_scale);
+	device_create_file(cpu_dev, &dev_attr_scale_freq_source);
 
 	return 0;
 }
@@ -248,6 +271,8 @@ static int cpu_capacity_sysctl_remove(unsigned int cpu)
 		return -ENOENT;
 
 	device_remove_file(cpu_dev, &dev_attr_cpu_capacity);
+	device_remove_file(cpu_dev, &dev_attr_arch_freq_scale);
+	device_remove_file(cpu_dev, &dev_attr_scale_freq_source);
 
 	return 0;
 }
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index d72d6e5aa200..0149aef7b684 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -47,6 +47,7 @@ struct scale_freq_data {
 
 void topology_scale_freq_tick(void);
 void topology_set_scale_freq_source(struct scale_freq_data *data, const struct cpumask *cpus);
+int topology_get_scale_freq_source(int cpu);
 void topology_clear_scale_freq_source(enum scale_freq_source source, const struct cpumask *cpus);
 
 DECLARE_PER_CPU(unsigned long, hw_pressure);


