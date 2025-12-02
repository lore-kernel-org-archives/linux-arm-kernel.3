Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E83ED116F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 03:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rHXvW4bH2/TkN92iJH0Vzt3Jt0dYt/xjH5QzdLvm88=; b=kUIFa49b0KPWWs26Go6RPf5mDi
	Ozb8dXpfw27XQi4qrYHXUWhkw1pOzPzNIgejfV4AMI2uRhrvKE2KdZC0ro4NQn6lw8oHqeOQzF1hN
	SZodQHminEnG5sVgZ4SVtBRmBOusr5JG98yRDNfzB4y3IRIZWskdKjDSkUWometMNapeJ6VsK8i2T
	iTTBV4qFgw4bYlD7mlCdx4AW9n5o++eKFpUNCdKh6I7r/RkO4FgZ6R5Ump8dF99U8cs8qOQkc4gU7
	gWe2lC9phUqq+kr2kRx7ZYOpkqucYUhwEqlaM6/it5sT2/hz9qcMr+9NdnFxq7wYKv0weJWCI22ND
	27yI9VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQGhz-00000004kAF-38gs;
	Tue, 02 Dec 2025 03:05:43 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQGhw-00000004k9q-2n8w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 03:05:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2rHXvW4bH2/TkN92iJH0Vzt3Jt0dYt/xjH5QzdLvm88=;
	b=xjeHDNN9+fo8cNPhS2c+DJMc95d+4P81B/vT/nPXVcOtiZnW2yOdfcIskGbWGg+lI/cO1ZB+B
	BEKZ+K/uWz5AcFmOXYuStF9AjrZjtYCM9ZOA7TcbZ/632Pl1Cg5/WOMNyKvYPukVfiWFKSAj1RV
	oJKQRAKiafxaXq3SglknfpU=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dL5FN26LKz1T4Hj;
	Tue,  2 Dec 2025 11:03:36 +0800 (CST)
Received: from kwepemf200001.china.huawei.com (unknown [7.202.181.227])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A2C5180485;
	Tue,  2 Dec 2025 11:05:27 +0800 (CST)
Received: from [10.67.121.90] (10.67.121.90) by kwepemf200001.china.huawei.com
 (7.202.181.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 2 Dec
 2025 11:05:26 +0800
Message-ID: <9b6882dc-a91a-42d6-bf76-347338930d71@huawei.com>
Date: Tue, 2 Dec 2025 11:05:25 +0800
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
 <aS2z0EURwHbbGZab@arm.com>
From: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
In-Reply-To: <aS2z0EURwHbbGZab@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.90]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200001.china.huawei.com (7.202.181.227)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_190541_346692_E3DB448A 
X-CRM114-Status: GOOD (  16.59  )
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

On 2025/12/1 23:27, Beata Michalska wrote:
> Hi,
> 
> Apologies for the delay in reviewing this - currently in progress....
> Out of curiosity: what's the cpufreq driver used for testing this series ?

I used cppc_cpufreq for testing this. But with some modifications in
processor_driver.c, or you'll find that the driver will fail to load with
maxcpus set. The modification below is only a temporary solution. I'm still
working on that.

---
diff --git a/drivers/acpi/processor_driver.c b/drivers/acpi/processor_driver.c
index 5d824435b26b..2f286a1b0b02 100644
--- a/drivers/acpi/processor_driver.c
+++ b/drivers/acpi/processor_driver.c
@@ -33,6 +33,7 @@ MODULE_AUTHOR("Paul Diefenbaugh");
 MODULE_DESCRIPTION("ACPI Processor Driver");
 MODULE_LICENSE("GPL");
 
+static int acpi_processor_start(struct device *dev);
 static int acpi_processor_stop(struct device *dev);
 
 static const struct acpi_device_id processor_device_ids[] = {
@@ -46,6 +47,7 @@ static struct device_driver acpi_processor_driver = {
 	.name = "processor",
 	.bus = &cpu_subsys,
 	.acpi_match_table = processor_device_ids,
+	.probe = acpi_processor_start,
 	.remove = acpi_processor_stop,
 };
 
@@ -191,6 +193,21 @@ static int __acpi_processor_start(struct acpi_device *device)
 	return result;
 }
 
+static int acpi_processor_start(struct device *dev)
+{
+	struct acpi_device *device = ACPI_COMPANION(dev);
+	int ret;
+
+	if (!device)
+		return -ENODEV;
+
+	/* Protect against concurrent CPU hotplug operations */
+	cpu_hotplug_disable();
+	ret = __acpi_processor_start(device);
+	cpu_hotplug_enable();
+	return ret;
+}
+
 static int acpi_processor_stop(struct device *dev)
 {
 	struct acpi_device *device = ACPI_COMPANION(dev);
@@ -264,9 +281,9 @@ static int __init acpi_processor_driver_init(void)
 
 	acpi_processor_register_idle_driver();
 
-	result = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-				   "acpi/cpu-drv:online",
-				   acpi_soft_cpu_online, NULL);
+	result = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					   "acpi/cpu-drv:online",
+					   acpi_soft_cpu_online, NULL);
 	if (result < 0)
 		goto err;
 	hp_online = result;

> 
> ---
> BR
> Beata
> On Wed, Nov 19, 2025 at 04:13:53PM +0800, Lifeng Zheng wrote:
>> Solve a problem that causes CPUs Setup AMU FIE failed in a corner case,
>> even though they're eligible.
>>
>>
> 


