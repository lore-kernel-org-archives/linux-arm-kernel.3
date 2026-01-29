Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5181BD73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZm7KO5pw9/R6i1YoD9nUCzfryvpA/gVSTAcmV7o7jY=; b=vlOUWQK6tygrRgNBuWXAn3dvA2
	qcXqvnA2Ayp9OwgW2Sn8zfwfI9ToQi5lsqCuG/flY4XW15sGezC4+JJVknQbGvJhqF0xxCjO8cHGA
	9ttQHU3DbY8ln+9duMJOBVVkiNi/u9OBLLw65qP4mtJKMFMid0b+qb969Icdte/HFaawAU44BswM5
	2tpEl2PegjeZsNn6VigouiWC3mTQ3Xl7TYFuXtPLPq7yOAb0QJqDAm+XviT5nFD67TTf76UVj7IVh
	l70CsWFY24gst3MogmzjRb6l+ZvSIOv4UeeWidFosRDxLCinXW1KnSmv8cdHa92YsXPPuo3t0IVeP
	IEr8OvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWur-00000000WZJ-2Phb;
	Thu, 29 Jan 2026 18:38:53 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWup-00000000WYl-1efr;
	Thu, 29 Jan 2026 18:38:51 +0000
Message-ID: <9ed4124e-a6f4-4994-a80e-860a1123c8ba@infradead.org>
Date: Thu, 29 Jan 2026 10:38:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] stm: class: Add MIPI OST protocol support
From: Randy Dunlap <rdunlap@infradead.org>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, quic_yingdeng@quicinc.com,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
 <0ed08d07-5736-4874-9a0f-0f848e8419b6@infradead.org>
Content-Language: en-US
In-Reply-To: <0ed08d07-5736-4874-9a0f-0f848e8419b6@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/29/26 10:31 AM, Randy Dunlap wrote:
> diff --git a/Documentation/trace/p_ost.rst b/Documentation/trace/p_ost.rst
> new file mode 100644
> index 000000000000..df93b889eb4c
> --- /dev/null
> +++ b/Documentation/trace/p_ost.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================
> +MIPI OST over STP
> +===================
> +
> +The OST(Open System Trace) driver is used with STM class devices to

   The OST (Open System Trace) driver

> +generate standardized trace stream. Trace sources can be identified
> +by different entity ids.
> +
> +CONFIG_STM_PROTO_OST is for p_ost driver enablement. Once this config
> +is enabled, you can select the p_ost protocol by command below:
> +
> +# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy
> +
> +The policy name format is extended like this:
> +    <device_name>:<protocol_name>.<policy_name>
> +
> +With coresight-stm device, it will be look like "stm0:p_ost.policy".

   With {a | the} coresight-stm device,

> +
> +With MIPI OST protocol driver, the attributes for each protocol node is:

   With the MIPI OST protocol driver,                                   are:

> +# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
> +# ls /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
> +channels  entity    masters
> +
> +The entity here is the set the entity that p_ost supports. Currently

                   is the set of {entities | features} that p_ost supports. Currently

> +p_ost supports ftrace, console and diag entity.

                                           entities.

> +
> +Set entity:
> +# echo 'ftrace' > /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
> +
> +Get available and currently selected (shown in square brackets) entity that p_ost supports:
> +# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
> +[ftrace] console diag
> +
> +See Documentation/ABI/testing/configfs-stp-policy-p_ost for more details.


-- 
~Randy


