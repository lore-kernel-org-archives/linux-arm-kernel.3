Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26088C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPcFzV28gTckKKGcU4nKVbu0/g6bq5ILbiLI4W2MNCQ=; b=tr5UqFosOjelS9yubE0HNyA9Xd
	ROT8j78EfwqSuZsqUyFAFDhLdzpXD+OnEjThFfvLnhPPUL+0qsace9A8pBECGy3979AhN9tc2QL1C
	H4kzxxmByMQkjhCR6fAclr/02GWPlUjguMH39V7TfvWcw8Iz60R/bzazoBWmn7anbye2hdfwPE9QU
	Sdbuw+w7n5IWLuhSSMYbhLqPNJ8oMx+uqkGG7iCde0mTuNXtuYtqWP3dDprb6J5zRsefuWj2AgNqI
	Ci1KKrTi1hOfUUGwdRxxmEKdXDTk6xVia8qmNiNG5XFqr4y3UQu5CAHpGyoEK2Ga1r3RQV2EnLdy7
	eW6pwxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3jO-00000004ktV-3elE;
	Tue, 08 Jul 2025 08:31:14 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3el-00000004k6Y-2rLS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:26:29 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbvLQ4KxZz6DB82;
	Tue,  8 Jul 2025 16:25:18 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DA4B1404A9;
	Tue,  8 Jul 2025 16:26:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Jul
 2025 10:26:19 +0200
Date: Tue, 8 Jul 2025 09:26:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <mark.rutland@arm.com>, <robh@kernel.org>, <coresight@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: Re: [PATCH 1/5] of: add infra for finding CPU id from phandle
Message-ID: <20250708092618.000067d2@huawei.com>
In-Reply-To: <20250707150414.620-2-alireza.sanaee@huawei.com>
References: <20250707150414.620-1-alireza.sanaee@huawei.com>
	<20250707150414.620-2-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012628_008783_3A289014 
X-CRM114-Status: GOOD (  28.01  )
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

On Mon, 7 Jul 2025 16:04:10 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Get CPU id from phandle. Many drivers get do this by getting hold of CPU
> node first through a phandle and then find the CPU ID using the relevant
> function. This commit encapsulates cpu node finding and improves
> readability.
> 
> The API interface requires two parameters, 1) node, 2) pointer to CPU
> node. API sets the pointer to the CPU node and allows the driver to play
> with the CPU itself, for logging purposes for instance.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/of/cpu.c   | 29 +++++++++++++++++++++++++++++
>  include/linux/of.h |  9 +++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> index 5214dc3d05ae..fba17994fc20 100644
> --- a/drivers/of/cpu.c
> +++ b/drivers/of/cpu.c
> @@ -173,6 +173,35 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
>  }
>  EXPORT_SYMBOL(of_cpu_node_to_id);
>  
> +/**
> + * of_cpu_phandle_to_id: Get the logical CPU number for a given device_node
> + *
> + * @node: Pointer to the device_node containing CPU phandle.
> + * @cpu_np: Pointer to the device_node for CPU.
> + * @cpu_idx: The index of the CPU in the list of CPUs.
> + *
> + * Return: The logical CPU number of the given CPU device_node or -ENODEV if
> + * the CPU is not found, or if the node is NULL, it returns -1. On success,
> + * cpu_np will always point to the retrieved CPU device_node with refcount
> + * incremented, use of_node_put() on it when done.
> + */
> +int of_cpu_phandle_to_id(const struct device_node *node,
> +			 struct device_node **cpu_np,
> +			 uint8_t cpu_idx)
> +{
> +	if (!node)
> +		return -1;
> +
> +	*cpu_np = of_parse_phandle(node, "cpu", 0);

Gut feeling is that it would be useful to allow a NULL cpu_np
for case where they don't want the cpu device_node, just the ID.

For that you'll need a local variable to hold the device_node
then assign it or put it depending on whether cpu_np != NULL.


Maybe there are no users for that pattern though.  If that's the case
then check !node || !cpu_np for that first check. 


> +	if (!*cpu_np)
> +		*cpu_np = of_parse_phandle(node, "cpus", cpu_idx);
> +			if (!*cpu_np)
> +				return -ENODEV;
> +
> +	return of_cpu_node_to_id(*cpu_np);
> +}
> +EXPORT_SYMBOL(of_cpu_phandle_to_id);
> +
>  /**
>   * of_get_cpu_state_node - Get CPU's idle state node at the given index
>   *
> diff --git a/include/linux/of.h b/include/linux/of.h
> index eaf0e2a2b75c..194f1cb0f6c6 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -360,6 +360,8 @@ extern const void *of_get_property(const struct device_node *node,
>  extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
>  extern struct device_node *of_cpu_device_node_get(int cpu);
>  extern int of_cpu_node_to_id(struct device_node *np);
> +extern int of_cpu_phandle_to_id(const struct device_node *np,
> +				struct device_node **cpu_np, uint8_t cpu_idx);
>  extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
>  extern struct device_node *of_get_cpu_state_node(const struct device_node *cpu_node,
>  						 int index);
> @@ -662,6 +664,13 @@ static inline int of_cpu_node_to_id(struct device_node *np)
>  	return -ENODEV;
>  }
>  
> +static inline int of_cpu_phandle_to_id(const struct device_node *np,
> +				       struct device_node **cpu_np,
> +				       uint8_t cpu_idx)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct device_node *of_get_next_cpu_node(struct device_node *prev)
>  {
>  	return NULL;


