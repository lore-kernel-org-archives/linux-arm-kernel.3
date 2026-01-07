Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A4BD0D163
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuSJqpZaH2QhA3iIANu4E7xN2malXmvke17n9OdaCSs=; b=1/wUD2/w6U3U4SakU1H77OsaH4
	1fjVuiWhx+HzfrYc5IumB2yBXAOpxZrw59dcPgJTMz4dNqTcMzRv+gacJV9UnPADR7OR9VaekHCjr
	t6pIfsxzZssZnJgNf2jpGfL+4ATZAnqy72zj5rrvXz+Dx8QEGwxjOFOfrqb4Gmasv22u8vC1c9u/z
	teRJygzYTzC0i/5GnJCUEAvMhPDjiLCohqJPTCcj9LN1cDfiN6fxz75urRmQhGbdIbH06EJrtZgBf
	f+wtVc+BOvmw88nQ/FiMcIdOkS/OAnYDsRQONclulLDZZRNspLIMEu/ExydnaoLO3qFIul2JZsvEN
	u6hBZ/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYfj-0000000FV2X-0G8Z;
	Wed, 07 Jan 2026 18:54:19 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYff-0000000FV2K-03q8;
	Wed, 07 Jan 2026 18:54:15 +0000
Message-ID: <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Date: Wed, 7 Jan 2026 10:54:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260107162829.416885-3-joaopeixoto@osyx.tech>
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



On 1/7/26 8:28 AM, joaopeixoto@osyx.tech wrote:
> diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
> new file mode 100644
> index 000000000000..966bb75aa495
> --- /dev/null
> +++ b/drivers/virt/bao/ipcshmem/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config BAO_SHMEM
> +	tristate "Bao hypervisor shared memory support"
> +	help
> +	This enables support for Bao shared memory communication.
> +	It allows the kernel to interface with guests running under
> +	the Bao hypervisor, providing a character device interface
> +	for exchanging data through dedicated shared-memory regions.

Please follow Documentation/process/coding-style.rst:

10) Kconfig configuration files
-------------------------------

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.  Example::

  config AUDIT
	bool "Auditing support"
	depends on NET
	help
	  Enable auditing infrastructure that can be used with another
	  kernel subsystem, such as SELinux (which requires this for
	  logging of avc messages output).  Does not do system-call
	  auditing without CONFIG_AUDITSYSCALL.


-- 
~Randy


